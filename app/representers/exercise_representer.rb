require 'representable/hash'
class ExerciseRepresenter < Representable::Decorator
  include Representable::Hash
  p "inside the representers exercise class"
  collection_representer class: Exercise, instance: lambda { |fragment, i, args|
    if fragment.has_key? 'external_id'
      p "inside fragment.haskey"
      #e = Exercise.where(external_id: fragment['external_id']).first
      #e || Exercise.new
      Exercise.new
    else
      p "inside the else statement"
      Exercise.new
    end
    }

  p "evaluates the variables"
  property :name
  property :external_id
  property :is_public, setter: lambda { |val, *| self.is_public = val.to_b }
  property :experience
  property :language_list, getter: lambda { |*| language_list.to_s }
  property :style_list, getter: lambda { |*| style_list.to_s }
  property :tag_list, getter: lambda { |*| tag_list.to_s }
  property :exercise_family,
      getter: lambda { |*| exercise_family.andand.name },
      setter: lambda { |val, *|
        if val.andand.length >= 1
          if ExerciseFamily.where(name: val).any?
            self.exercise_family = ExerciseFamily.where(name: val).first
          else
            new_exercise_family = ExerciseFamily.new(name: val)
            self.exercise_family = new_exercise_family
            new_exercise_family.save!
          end
        end
      }
  property :current_version, class: ExerciseVersion,
    setter: lambda { |val, *|
      self.current_version = val
      self.exercise_versions << self.current_version
      self.current_version.exercise = self
    }, instance: lambda { |*| ExerciseVersion.new } do
    property :version, setter: lambda { |*| }
    property :creator,
      getter: lambda { |*| creator.andand.email },
      setter: lambda { |val, *|
        p "print whatever val is"
        p val
        if val
          p "looking at the user email"
          self.creator = User.where(email: val).first
          p "finished looking at the user email"
        end
      }
    property :stem, class: Stem do
      property :preamble
    end
    collection :prompts,
      render_filter: lambda { |val, *| val.map(&:specific) },
      setter: lambda { |p_array, *|
        p_array.each do |p|
          p.exercise_version = self
          self.prompts << p
        end
      },
      class: lambda { |hsh, *|
        hsh.has_key?('coding_prompt') ?
          CodingPrompt : MultipleChoicePrompt
      },
      decorator: lambda { |o, *|
        o.is_a?(CodingPrompt) ?
          CodingPromptRepresenter : MultipleChoicePromptRepresenter
      }
  end

end
