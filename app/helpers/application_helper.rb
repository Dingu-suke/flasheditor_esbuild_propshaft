module ApplicationHelper
  def render_cards_helper(cards)
    return 'カードはまだありません' if cards.blank?

    cards.inject(''.html_safe) do |output, card|
      output + content_tag(:div, class: "card w-64 bg-base-100 shadow-xl") do
        content_tag(:div, class: "card-body") do
          concat(content_tag(:h2, card.title, class: "card-title"))
          concat(content_tag(:p, card.body))
          concat(content_tag(:div, class: "card-actions justify-end") do
            content_tag(:div, class: "form-control") do
              label_tag('', class: 'label cursor-pointer') do
                concat(content_tag(:span, '', class: 'label-text'))
                concat(check_box_tag('', '', false, class: 'checkbox checkbox-primary'))
              end
            end
          end)
        end
      end + tag.br
    end
  end

end
