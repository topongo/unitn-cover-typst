#let _background_logo(img, color) = layout(bounds => {
  let size = measure(img, ..bounds)
  img
  place(top, block(..size, fill: color))
})

#let unitn_cover = (department, degree, title, supervisors, students, academic_year: none, examination_day: none) => [
  #set text(font: "New Computer Modern")

  #let bkg_img = image("unitn_bw.png", height: 500pt)
  #set page(
    background: move(
      dy: 200pt, dx: 100pt,
      rotate(-20deg, layout(bounds => {
        let size = measure(bkg_img, ..bounds)
        bkg_img
        place(top, block(..size, fill: rgb(255,255,255,240)))
      })),
    )
  )
  
  #figure(
    image("unitn.svg", width: 30%)
  )
  
  #set align(center)
  
  #set text(size: 20pt)
  #v(1em)
  #smallcaps[University of Trento]
  #v(1.5em)
  
  #set text(size: 15pt)
  #smallcaps[#department]
  
  #smallcaps[#degree]
  
  #set text(size: 13pt)

  #if academic_year == none {
    let today = datetime.today()
    // here you go studenti fuori corso
    academic_year = if today.month() < 3 { today.year() - 2 } else { today.year() - 1 }
  }
  #let academic_year = str(academic_year) + "-" + str(academic_year + 1)
  #smallcaps[
    #pad(top: 15pt, bottom: 40pt)[Academic Year #academic_year]
  ]
  
  #set text(size: 20pt)
  #title
  
  #v(1fr)
  
  #columns(2)[
    #set text(size: 13pt)
    #set align(top+start)
    #set par(spacing: 10pt)
    
    #if type(supervisors) != array {
      supervisors = (supervisors, )
    }
    #text(size: 13pt)[*Supervisor#if supervisors.len() == 1 [] else [s]*]

    #for s in supervisors [
      #s
  
    ]
    
    #colbreak()
    
    #set text(size: 13pt)
    #set par(spacing: 6pt)
    #set align(top+end)
    
    #if type(students) != array {
      students = (students, )
    }
    #text(size: 13pt)[*Graduate Student#if students.len() == 1 [] else [s]*]
    
    #for s in students {
      if type(s) == array [
        #s.at(0)

        #s.at(1)

      ] else [
        #s
      ]
    }
  ]

  #v(.5fr)

  #if examination_day != none [
    #set text(size: 12pt)
    #set align(left)
    #smallcaps[Final Examination Day: #examination_day]
  ]
  #line(length: 100%)
  #pagebreak()
]
