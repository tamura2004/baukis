class StaffEventPresenter < ModelPresenter
  delegate :member, :description, :occurred_at, to: :object

  def table_row
    markup(:tr) do |m|
      unless view_context.instance_valiable_get(:@staff_member)
        m.td do
          m << link_to(memer.family_name + member.given_name,[:admin, member, :staff_events])
        end
      end
      m.td description
      m.td(:class => "date") do
        m.text occurred_at.strftime("%Y/%m/%d %H:%M:%S")
      end
    end
  end
end
