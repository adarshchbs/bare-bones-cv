#let configuration = yaml("configuration.yaml")
#let settings = yaml("settings.yaml")

#show link: set text(blue)

#set page(paper: "a4", margin: (top: 1.5cm, bottom: 1cm, left: 1cm, right: 1cm))

#show heading: h => [
  #set text(size: eval(settings.font.size.heading_large), font: settings.font.general)
  #h
]

#let sidebarSection = {
  [
    #par(justify: true)[

      #par[
        #set text(size: eval(settings.font.size.heading_huge), font: settings.font.general)
        *#configuration.contacts.name*
      ]

      #par[
        #set text(size: eval(settings.font.size.heading), font: settings.font.minor_highlight, top-edge: 0pt)
        #configuration.contacts.title
      ]

      #par[
        #set text(size: eval(settings.font.size.contacts), font: settings.font.minor_highlight)

        Email: #link("mailto:" + configuration.contacts.email) \
        Phone: #link("tel:" + configuration.contacts.phone) \
        LinkedIn: #link(configuration.contacts.linkedin.url)[#configuration.contacts.linkedin.displayText] \
        GitHub: #link(configuration.contacts.github.url)[#configuration.contacts.github.displayText] \

        #configuration.contacts.address
      ]
      // #line(length: 100%)
    ]

    = Summary

    #par[
      #set text(eval(settings.font.size.education_description), font: settings.font.minor_highlight, hyphenate: false)
      #set par(justify: false)
      Experienced data scientist with 4 years of expertise in applying NLP and machine learning to healthcare and consulting
      challenges. Currently developing NLP models to curate cancer patients' medical histories for clinical trial design and
      subject recruitment. Skilled in text mining, information extraction, and knowledge representation for analyzing complex,
      unstructured medical data. Previous experience in financial modeling and risk analysis. Passionate about using
      cutting-edge technologies to create positive societal impact. Effective communicator of complex technical concepts to
      diverse stakeholders.
    ]

    = Technical Skills

    #{
      for skill in configuration.skills [
        #par[
          #set text(size: eval(settings.font.size.description))
          #set text(
            // size: eval(settings.font.size.tags),
            font: settings.font.minor_highlight,
          )
          *#skill.name*
          #linebreak()
          #skill.items.join(", ")
        ]
      ]
    }

    = Soft Skills
    #{
      for skill in configuration.soft_skills [
        #par[
          // #set par(leading: 2pt)
          #set text(size: eval(settings.font.size.description))
          #set text(
            // size: eval(settings.font.size.tags),
            font: settings.font.minor_highlight,
          )
          • #skill

        ]
      ]
    }
  ]
}

#let mainSection = {
  [

    = Education

    #{
      for place in configuration.education [
        #par[
          #set text(size: eval(settings.font.size.heading2), font: settings.font.general)
          #set par(leading: 4pt)
          #grid(
            columns: (1fr, auto),
            gutter: 1em,
            [#[#place.degree, #place.major Major] \ #link(place.place.link)[#place.place.name]],
            [ #place.from – #place.to \ Bangalore ],
          )

        ]
      ]
    }

    = Experience

    #{
      for job in configuration.jobs [
        #par(justify: false)[
          #set text(size: eval(settings.font.size.heading), font: settings.font.general)
          *#job.position*
          *\@ #job.company.name* \
          #job.from – #job.to

        ]
        #for task_desc in job.projects [
          #par(justify: false, leading: eval(settings.paragraph.leading))[
            #set text(size: eval(settings.font.size.description), font: settings.font.general)
            *Task: #task_desc.task* \
            #{
              for point in task_desc.description [
                • #point \
              ]
            }
            *Tool Used*: #task_desc.tool_used \
          ]
        ]
      ]
    }

    = Open Source Projects

    #{
      for task_desc in configuration.open_source [
        #par(justify: false, leading: eval(settings.paragraph.leading))[
          #set text(size: eval(settings.font.size.description), font: settings.font.general)
          #link("https://github.com/adarshchbs/pdf2md")[*#task_desc.task*] \
          #{
            for point in task_desc.description [
              • #point \
            ]
          }
          *Tool Used*: #task_desc.tool_used \
        ]
      ]
    }
  ]
}

#{
  grid(
    columns: (2fr, 5fr),
    column-gutter: 1em,
    sidebarSection,
    // box(width: 0.05em, height: 100%, stroke: 1pt, fill: black),
    mainSection,
  )
}
