# HR Document Agent - Setup Guide

## Quick Start

This skill allows Claude to answer HR questions using your company's local HR documents. **NEW:** Now supports GitHub integration for easy document management and updates!

## Setup Options

### Option 1: GitHub Integration (Recommended)

Store your HR documents in a GitHub repository for easy updates and version control.

**Quick Setup:**
1. Create a GitHub repository with your HR documents
2. Run the setup: `python scripts/github_sync.py --setup`
3. Sync documents: `python scripts/github_sync.py --sync`
4. Start asking questions!

See [GitHub Setup Guide](references/github-setup.md) for detailed instructions.

### Option 2: Local Files

Store documents directly in the skill folder.

## Setup Steps

### 1. Organize Your HR Documents

**Option A: GitHub (Recommended)**

See the [GitHub Setup Guide](references/github-setup.md) for complete instructions.

Quick version:
1. Create a GitHub repository
2. Add your documents in folders (policies, benefits, forms, etc.)
3. Configure the skill: `python scripts/github_sync.py --setup`

**Option B: Local Files**

Create a folder structure for your HR documents:

```
your-hr-documents/
├── policies/
│   ├── employee-handbook.pdf
│   ├── code-of-conduct.docx
│   └── remote-work-policy.pdf
├── benefits/
│   ├── health-insurance-guide.pdf
│   ├── 401k-overview.docx
│   └── pto-policy.pdf
├── forms/
│   ├── pto-request-form.pdf
│   ├── expense-report-template.xlsx
│   └── onboarding-checklist.docx
├── onboarding/
│   ├── new-hire-guide.pdf
│   └── first-week-checklist.md
└── procedures/
    ├── expense-reimbursement.pdf
    └── performance-review-process.docx
```

### 2. Configure the Document Location

You have two options:

**Option A: Bundle documents with the skill (recommended for portability)**
- Copy your HR documents into the `documents/` folder within this skill
- The skill will automatically find them

**Option B: Point to an external folder**
- Edit `scripts/search_docs.py` and change the `DOC_ROOT` variable to your folder path
- Or set the environment variable: `export HR_DOC_ROOT=/path/to/your/hr/documents`

### 3. Install the Skill

If you're using Claude Code or Cowork:
- Package the skill: `python -m scripts.package_skill /path/to/hr-document-agent`
- Install the resulting `.skill` file

If you're using Claude.ai:
- Upload the entire `hr-document-agent` folder to your workspace

### 4. Test It Out

Try asking Claude questions like:
- "What's our PTO policy?"
- "How do I submit an expense report?"
- "Where can I find the employee handbook?"
- "What benefits do new employees get?"

## Updating Documents

To keep your HR information current:

1. **Add new documents**: Simply place them in the appropriate folder
2. **Update existing documents**: Replace the old file with the new version
3. **Remove outdated documents**: Delete or move them to an archive folder
4. **No restart needed**: Changes are picked up immediately on the next search

## Supported File Types

- PDF (.pdf) - Most common for policies and handbooks
- Word (.docx, .doc) - Editable policies and forms
- Excel (.xlsx, .xls) - Forms, templates, spreadsheets
- CSV (.csv) - Data tables
- Text (.txt, .md) - Simple documentation

## Tips for Best Results

### Document Naming
Use descriptive filenames:
- ✅ `pto-policy-2024.pdf`
- ✅ `employee-handbook-v3.pdf`
- ❌ `document1.pdf`
- ❌ `final-final-v2.pdf`

### Folder Organization
Group related documents:
- All PTO-related docs in `policies/` or `benefits/`
- All forms in `forms/`
- All onboarding materials in `onboarding/`

### Keep Documents Updated
- Add "Last Updated: [date]" to document headers
- Archive old versions instead of deleting them
- Review quarterly to ensure information is current

## Troubleshooting

**"No documents found"**
- Check that your document folder exists
- Verify the path in `scripts/search_docs.py`
- Make sure files have supported extensions

**"Can't read this document"**
- Ensure the file isn't corrupted
- Check file permissions
- For scanned PDFs, ensure text is searchable (may need OCR)

**"Information seems outdated"**
- Check document dates
- Replace with current version
- Consider adding version numbers to filenames

## Security & Privacy

**What this skill does:**
- ✅ Searches and reads HR policy documents
- ✅ Answers general HR questions
- ✅ Helps fill out forms

**What this skill does NOT do:**
- ❌ Access individual employee data
- ❌ Modify or delete documents
- ❌ Share information outside the conversation
- ❌ Make policy decisions

## Support

For questions or issues:
1. Check the SKILL.md file for detailed instructions
2. Review this README for setup guidance
3. Test with simple queries first before complex ones

---

**Pro Tip**: Start by adding just a few key documents (employee handbook, PTO policy, benefits guide) and test those before adding your entire document library. This helps you validate the setup works correctly.
