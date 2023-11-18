Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 905197EFE46
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 08:33:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nnw3Fpp8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXQVy3HR1z3dTv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 18:33:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nnw3Fpp8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3qshyzqckdcqmmaurergoogle.comlinuxppc-devlists.ozlabs.org@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXJP32lB0z3c82
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 13:58:14 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5c92de8e207so805867b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 18:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700276290; x=1700881090; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0CSTyxlHVYn/ezKsio8aqvsiIxg7WzrWt9V3HTJto8U=;
        b=nnw3Fpp8Dha7z2RMGy+NlMp3V3S4JQDjjNiGwBXdyRufWFiuFFTv/hDut2Ce/TBPyX
         fkMIHzmlqYsRUtcUmEj6vy6wivf5ZISzIRGJbCyMKGky5ZQT7bbjrQ24xcKBgeW76obC
         Uy2HDvmELryuhRMOqxHlwzNotUfAwDx54FWpWf3HEGRGmBD2ZCjwgbBIXuaHr7QHMs4v
         BLp7rskEDH4hnAjfDxr2bm4BvHxaXiwyxaqQrrmGZcD9rYDFP9R3RDR1QODWFWuY8y+1
         8Es/TFJlG5SBrrzr4oAEYH6ZhVJGh9E7KZB/17HhMi4/WSLA4MUxa8GLspY0FUdx3oxp
         /xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700276290; x=1700881090;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0CSTyxlHVYn/ezKsio8aqvsiIxg7WzrWt9V3HTJto8U=;
        b=O5rll6+vHIw7xjiQtLt8IUG2YWno4Xndud+r+kRsjq2o16jOKb6XDXAfscqdeADaDD
         +Ett7n3IPrKxdm5R0DAKQdsFFtYU7u5soE3ZQSZedg804jKVtKlNWPnW1x4MdQOaKaQ7
         6mbu83E8zPQNjW3TBZFwc7XcK1O4iGERdPYf2kBQCBgqwR7FvaXRpu6utEX17KQUxQpY
         RmrZsI6ywWcRkyU3SrP9ynmsnYz90zG9WRLOamjwYVeJlLP9I+WEje58u967swtN2ZWF
         X453IlkI4i/1nJXCqJDnMDlxevwfb8OEKEmuvFpfbrXlSACYcwamvtFvaV94Y+aozit+
         3Inw==
X-Gm-Message-State: AOJu0YxMKuZrGBy6aS1YtBAQOe1uG91epR//Amg6p9wnQbs+AfzjOlB9
	MVg7dFpKw056/ZzOZeAA6WnaJXJPy2Jd
X-Google-Smtp-Source: AGHT+IFpKeTENBwI0ASlwBKxE16vOwrL2b0cwNdYaTwSpUxnAe/isEmFPMOfFv0fKsPZ7HsumU6uXU5f3ukQ
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:38f:0:b0:d9a:6007:223a with SMTP id
 137-20020a25038f000000b00d9a6007223amr24384ybd.8.1700276289931; Fri, 17 Nov
 2023 18:58:09 -0800 (PST)
Date: Sat, 18 Nov 2023 02:54:43 +0000
In-Reply-To: <20231118025748.2778044-1-mmaurer@google.com>
Mime-Version: 1.0
References: <20231118025748.2778044-1-mmaurer@google.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231118025748.2778044-3-mmaurer@google.com>
Subject: [PATCH v2 2/5] modules: Refactor + kdoc elf_validity_cached_copy
From: Matthew Maurer <mmaurer@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 18 Nov 2023 18:31:25 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, Nathan Chancellor <nathan@kernel.org>, Laura Abbott <laura@labbott.name>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Functionality is almost identical, just structured for better
documentation and readability. Changes:

* Section names are checked for *all* non-SHT_NULL sections, not just
  SHF_ALLOC sections. We have code that accesses section names of
  non-SHF_ALLOC sections (see find_any_sec for example)
* The section name check occurs *before* strcmping on section names.
  Previously, it was possible to use an out-of-bounds offset to strcmp
  against ".modinfo" or ".gnu.linkonce.this_module"
* strtab is checked for NUL lead+termination and nonzero size
* The symbol table is swept to ensure offsets are inbounds of strtab

While some of these oversights would normally be worrying, all of the
potentially unverified accesses occur after signature check, and only in
response to a user who can load a kernel module.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/internal.h |   7 +-
 kernel/module/main.c     | 585 +++++++++++++++++++++++++++++----------
 2 files changed, 444 insertions(+), 148 deletions(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index c8b7b4dcf782..d8dc52eb9c82 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -80,7 +80,12 @@ struct load_info {
 	unsigned int used_pages;
 #endif
 	struct {
-		unsigned int sym, str, mod, vers, info, pcpu;
+		unsigned int sym;
+		unsigned int str;
+		unsigned int mod;
+		unsigned int vers;
+		unsigned int info;
+		unsigned int pcpu;
 	} index;
 };
 
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 98fedfdb8db5..8b2848b3183a 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -193,6 +193,38 @@ static unsigned int find_sec(const struct load_info *info, const char *name)
 	return 0;
 }
 
+/**
+ * find_any_unique_sec() - Find a unique section index by name
+ * @info: Load info for the module to scan
+ * @name: Name of the section we're looking for
+ *
+ * Locates a unique section by name. Ignores SHF_ALLOC.
+ *
+ * Return: Section index if found uniquely, zero if absent, negative count
+ *         of total instances if multiple were found.
+ */
+static int find_any_unique_sec(const struct load_info *info, const char *name)
+{
+	unsigned int idx;
+	unsigned int count = 0;
+	int i;
+
+	for (i = 1; i < info->hdr->e_shnum; i++) {
+		if (strcmp(info->secstrings + info->sechdrs[i].sh_name,
+			   name) == 0) {
+			count++;
+			idx = i;
+		}
+	}
+	if (count == 1) {
+		return idx;
+	} else if (count == 0) {
+		return 0;
+	} else {
+		return -count;
+	}
+}
+
 /* Find a module section, or NULL. */
 static void *section_addr(const struct load_info *info, const char *name)
 {
@@ -1627,7 +1659,7 @@ bool __weak module_exit_section(const char *name)
 	return strstarts(name, ".exit");
 }
 
-static int validate_section_offset(struct load_info *info, Elf_Shdr *shdr)
+static int validate_section_offset(const struct load_info *info, Elf_Shdr *shdr)
 {
 #if defined(CONFIG_64BIT)
 	unsigned long long secend;
@@ -1646,62 +1678,80 @@ static int validate_section_offset(struct load_info *info, Elf_Shdr *shdr)
 	return 0;
 }
 
-/*
- * Check userspace passed ELF module against our expectations, and cache
- * useful variables for further processing as we go.
- *
- * This does basic validity checks against section offsets and sizes, the
- * section name string table, and the indices used for it (sh_name).
+/**
+ * elf_validity_ehdr() - Checks an ELF header for module validity
+ * @info: Load info containing the ELF header to check
  *
- * As a last step, since we're already checking the ELF sections we cache
- * useful variables which will be used later for our convenience:
+ * Checks whether an ELF header could belong to a valid module. Checks:
  *
- * 	o pointers to section headers
- * 	o cache the modinfo symbol section
- * 	o cache the string symbol section
- * 	o cache the module section
+ * * ELF header is within the data the user provided
+ * * ELF magic is present
+ * * It is relocatable (not final linked, not core file, etc.)
+ * * The header's machine type matches what the architecture expects.
+ * * Optional arch-specific hook for other properties
+ *   - module_elf_check_arch() is currently only used by PPC to check
+ *   ELF ABI version, but may be used by others in the future.
  *
- * As a last step we set info->mod to the temporary copy of the module in
- * info->hdr. The final one will be allocated in move_module(). Any
- * modifications we make to our copy of the module will be carried over
- * to the final minted module.
+ * Return: %0 if valid, %-ENOEXEC on failure.
  */
-static int elf_validity_cache_copy(struct load_info *info, int flags)
+static int elf_validity_ehdr(const struct load_info *info)
 {
-	unsigned int i;
-	Elf_Shdr *shdr, *strhdr;
-	int err;
-	unsigned int num_mod_secs = 0, mod_idx;
-	unsigned int num_info_secs = 0, info_idx;
-	unsigned int num_sym_secs = 0, sym_idx;
-
 	if (info->len < sizeof(*(info->hdr))) {
 		pr_err("Invalid ELF header len %lu\n", info->len);
-		goto no_exec;
+		return -ENOEXEC;
 	}
-
 	if (memcmp(info->hdr->e_ident, ELFMAG, SELFMAG) != 0) {
 		pr_err("Invalid ELF header magic: != %s\n", ELFMAG);
-		goto no_exec;
+		return -ENOEXEC;
 	}
 	if (info->hdr->e_type != ET_REL) {
 		pr_err("Invalid ELF header type: %u != %u\n",
 		       info->hdr->e_type, ET_REL);
-		goto no_exec;
+		return -ENOEXEC;
 	}
 	if (!elf_check_arch(info->hdr)) {
 		pr_err("Invalid architecture in ELF header: %u\n",
 		       info->hdr->e_machine);
-		goto no_exec;
+		return -ENOEXEC;
 	}
 	if (!module_elf_check_arch(info->hdr)) {
 		pr_err("Invalid module architecture in ELF header: %u\n",
 		       info->hdr->e_machine);
-		goto no_exec;
+		return -ENOEXEC;
 	}
+	return 0;
+}
+
+/**
+ * elf_validity_cache_sechdrs() - Cache section headers if valid
+ * @info: Load info to compute section headers from
+ *
+ * Checks:
+ *
+ * * ELF header is valid (see elf_validity_ehdr())
+ * * Section headers are the size we expect
+ * * Section array fits in the user provided data
+ * * Section index 0 is NULL
+ * * Section contents are inbounds
+ *
+ * Then updates @info with a &load_info->sechdrs pointer if valid.
+ *
+ * Return: %0 if valid, negative error code if validation failed.
+ */
+static int elf_validity_cache_sechdrs(struct load_info *info)
+{
+	Elf_Shdr *sechdrs;
+	Elf_Shdr *shdr;
+	int i;
+	int err;
+
+	err = elf_validity_ehdr(info);
+	if (err < 0)
+		return err;
+
 	if (info->hdr->e_shentsize != sizeof(Elf_Shdr)) {
 		pr_err("Invalid ELF section header size\n");
-		goto no_exec;
+		return -ENOEXEC;
 	}
 
 	/*
@@ -1713,10 +1763,66 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	    || (info->hdr->e_shnum * sizeof(Elf_Shdr) >
 		info->len - info->hdr->e_shoff)) {
 		pr_err("Invalid ELF section header overflow\n");
-		goto no_exec;
+		return -ENOEXEC;
 	}
 
-	info->sechdrs = (void *)info->hdr + info->hdr->e_shoff;
+	sechdrs = (void *)info->hdr + info->hdr->e_shoff;
+
+	/*
+	 * The code assumes that section 0 has a length of zero and
+	 * an addr of zero, so check for it.
+	 */
+	if (sechdrs[0].sh_type != SHT_NULL
+	    || sechdrs[0].sh_size != 0
+	    || sechdrs[0].sh_addr != 0) {
+		pr_err("ELF Spec violation: section 0 type(%d)!=SH_NULL or non-zero len or addr\n",
+		       sechdrs[0].sh_type);
+		return -ENOEXEC;
+	}
+
+	/* Validate contents are inbounds */
+	for (i = 1; i < info->hdr->e_shnum; i++) {
+		shdr = &sechdrs[i];
+		switch (shdr->sh_type) {
+		case SHT_NULL:
+		case SHT_NOBITS:
+			/* No contents, offset/size don't mean anything */
+			continue;
+		default:
+			err = validate_section_offset(info, shdr);
+			if (err < 0) {
+				pr_err("Invalid ELF section in module (section %u type %u)\n",
+				       i, shdr->sh_type);
+				return err;
+			}
+		}
+	}
+
+	info->sechdrs = sechdrs;
+
+	return 0;
+}
+
+/**
+ * elf_validity_cache_secstrings() - Caches section names if valid
+ * @info: Load info to cache section names from. Must have valid sechdrs.
+ *
+ * Specifically checks:
+ *
+ * * Section name table index is inbounds of section headers
+ * * Section name table is not empty
+ * * Section name table is NUL terminated
+ * * All section name offsets are inbounds of the section
+ *
+ * Then updates @info with a &load_info->secstrings pointer if valid.
+ *
+ * Return: %0 if valid, negative error code if validation failed.
+ */
+static int elf_validity_cache_secstrings(struct load_info *info)
+{
+	Elf_Shdr *strhdr, *shdr;
+	char *secstrings;
+	int i;
 
 	/*
 	 * Verify if the section name table index is valid.
@@ -1726,165 +1832,234 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 		pr_err("Invalid ELF section name index: %d || e_shstrndx (%d) >= e_shnum (%d)\n",
 		       info->hdr->e_shstrndx, info->hdr->e_shstrndx,
 		       info->hdr->e_shnum);
-		goto no_exec;
+		return -ENOEXEC;
 	}
 
 	strhdr = &info->sechdrs[info->hdr->e_shstrndx];
-	err = validate_section_offset(info, strhdr);
-	if (err < 0) {
-		pr_err("Invalid ELF section hdr(type %u)\n", strhdr->sh_type);
-		return err;
-	}
 
 	/*
 	 * The section name table must be NUL-terminated, as required
 	 * by the spec. This makes strcmp and pr_* calls that access
 	 * strings in the section safe.
 	 */
-	info->secstrings = (void *)info->hdr + strhdr->sh_offset;
+	secstrings = (void *)info->hdr + strhdr->sh_offset;
 	if (strhdr->sh_size == 0) {
 		pr_err("empty section name table\n");
-		goto no_exec;
+		return -ENOEXEC;
 	}
-	if (info->secstrings[strhdr->sh_size - 1] != '\0') {
+	if (secstrings[strhdr->sh_size - 1] != '\0') {
 		pr_err("ELF Spec violation: section name table isn't null terminated\n");
-		goto no_exec;
-	}
-
-	/*
-	 * The code assumes that section 0 has a length of zero and
-	 * an addr of zero, so check for it.
-	 */
-	if (info->sechdrs[0].sh_type != SHT_NULL
-	    || info->sechdrs[0].sh_size != 0
-	    || info->sechdrs[0].sh_addr != 0) {
-		pr_err("ELF Spec violation: section 0 type(%d)!=SH_NULL or non-zero len or addr\n",
-		       info->sechdrs[0].sh_type);
-		goto no_exec;
+		return -ENOEXEC;
 	}
 
-	for (i = 1; i < info->hdr->e_shnum; i++) {
+	for (i = 0; i < info->hdr->e_shnum; i++) {
 		shdr = &info->sechdrs[i];
-		switch (shdr->sh_type) {
-		case SHT_NULL:
-		case SHT_NOBITS:
+		/* SHT_NULL means sh_name has an undefined value */
+		if (shdr->sh_type == SHT_NULL)
 			continue;
-		case SHT_SYMTAB:
-			if (shdr->sh_link == SHN_UNDEF
-			    || shdr->sh_link >= info->hdr->e_shnum) {
-				pr_err("Invalid ELF sh_link!=SHN_UNDEF(%d) or (sh_link(%d) >= hdr->e_shnum(%d)\n",
-				       shdr->sh_link, shdr->sh_link,
-				       info->hdr->e_shnum);
-				goto no_exec;
-			}
-			num_sym_secs++;
-			sym_idx = i;
-			fallthrough;
-		default:
-			err = validate_section_offset(info, shdr);
-			if (err < 0) {
-				pr_err("Invalid ELF section in module (section %u type %u)\n",
-					i, shdr->sh_type);
-				return err;
-			}
-			if (strcmp(info->secstrings + shdr->sh_name,
-				   ".gnu.linkonce.this_module") == 0) {
-				num_mod_secs++;
-				mod_idx = i;
-			} else if (strcmp(info->secstrings + shdr->sh_name,
-				   ".modinfo") == 0) {
-				num_info_secs++;
-				info_idx = i;
-			}
-
-			if (shdr->sh_flags & SHF_ALLOC) {
-				if (shdr->sh_name >= strhdr->sh_size) {
-					pr_err("Invalid ELF section name in module (section %u type %u)\n",
-					       i, shdr->sh_type);
-					return -ENOEXEC;
-				}
-			}
-			break;
+		if (shdr->sh_name >= strhdr->sh_size) {
+			pr_err("Invalid ELF section name in module (section %u type %u)\n",
+			       i, shdr->sh_type);
+			return -ENOEXEC;
 		}
 	}
 
-	if (num_info_secs > 1) {
+	info->secstrings = secstrings;
+	return 0;
+}
+
+/**
+ * elf_validity_cache_index_info() - Validate and cache modinfo section
+ * @info: Load info to populate the modinfo index on.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated
+ *
+ * Checks that if there is a .modinfo section, it is unique.
+ * Then, it caches its index in &load_info->index.info.
+ * Finally, it tries to populate the name to improve error messages.
+ *
+ * Return: %0 if valid, %-ENOEXEC if multiple modinfo sections were found.
+ */
+static int elf_validity_cache_index_info(struct load_info *info)
+{
+	int info_idx;
+
+	info_idx = find_any_unique_sec(info, ".modinfo");
+
+	if (info_idx == 0)
+		/* Early return, no .modinfo */
+		return 0;
+
+	if (info_idx < 0) {
 		pr_err("Only one .modinfo section must exist.\n");
-		goto no_exec;
-	} else if (num_info_secs == 1) {
-		/* Try to find a name early so we can log errors with a module name */
-		info->index.info = info_idx;
-		info->name = get_modinfo(info, "name");
+		return -ENOEXEC;
 	}
 
-	if (num_sym_secs != 1) {
-		pr_warn("%s: module has no symbols (stripped?)\n",
-			info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
-	}
+	info->index.info = info_idx;
+	/* Try to find a name early so we can log errors with a module name */
+	info->name = get_modinfo(info, "name");
 
-	/* Sets internal symbols and strings. */
-	info->index.sym = sym_idx;
-	shdr = &info->sechdrs[sym_idx];
-	info->index.str = shdr->sh_link;
-	info->strtab = (char *)info->hdr + info->sechdrs[info->index.str].sh_offset;
+	return 0;
+}
 
-	/*
-	 * The ".gnu.linkonce.this_module" ELF section is special. It is
-	 * what modpost uses to refer to __this_module and let's use rely
-	 * on THIS_MODULE to point to &__this_module properly. The kernel's
-	 * modpost declares it on each modules's *.mod.c file. If the struct
-	 * module of the kernel changes a full kernel rebuild is required.
-	 *
-	 * We have a few expectaions for this special section, the following
-	 * code validates all this for us:
-	 *
-	 *   o Only one section must exist
-	 *   o We expect the kernel to always have to allocate it: SHF_ALLOC
-	 *   o The section size must match the kernel's run time's struct module
-	 *     size
-	 */
-	if (num_mod_secs != 1) {
-		pr_err("module %s: Only one .gnu.linkonce.this_module section must exist.\n",
+/**
+ * elf_validity_cache_index_mod() - Validates and caches this_module section
+ * @info: Load info to cache this_module on.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated
+ *
+ * The ".gnu.linkonce.this_module" ELF section is special. It is what modpost
+ * uses to refer to __this_module and let's use rely on THIS_MODULE to point
+ * to &__this_module properly. The kernel's modpost declares it on each
+ * modules's *.mod.c file. If the struct module of the kernel changes a full
+ * kernel rebuild is required.
+ *
+ * We have a few expectations for this special section, this function
+ * validates all this for us:
+ *
+ * * The section has contents
+ * * The section is unique
+ * * We expect the kernel to always have to allocate it: SHF_ALLOC
+ * * The section size must match the kernel's run time's struct module
+ *   size
+ *
+ * If all checks pass, the index will be cached in &load_info->index.mod
+ *
+ * Return: %0 on validation success, %-ENOEXEC on failure
+ */
+static int elf_validity_cache_index_mod(struct load_info *info)
+{
+	Elf_Shdr *shdr;
+	int mod_idx;
+
+	mod_idx = find_any_unique_sec(info, ".gnu.linkonce.this_module");
+	if (mod_idx <= 0) {
+		pr_err("module %s: Exactly one .gnu.linkonce.this_module section must exist.\n",
 		       info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
+		return -ENOEXEC;
 	}
 
 	shdr = &info->sechdrs[mod_idx];
 
-	/*
-	 * This is already implied on the switch above, however let's be
-	 * pedantic about it.
-	 */
 	if (shdr->sh_type == SHT_NOBITS) {
 		pr_err("module %s: .gnu.linkonce.this_module section must have a size set\n",
 		       info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
+		return -ENOEXEC;
 	}
 
 	if (!(shdr->sh_flags & SHF_ALLOC)) {
 		pr_err("module %s: .gnu.linkonce.this_module must occupy memory during process execution\n",
 		       info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
+		return -ENOEXEC;
 	}
 
 	if (shdr->sh_size != sizeof(struct module)) {
 		pr_err("module %s: .gnu.linkonce.this_module section size must match the kernel's built struct module size at run time\n",
 		       info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
+		return -ENOEXEC;
 	}
 
 	info->index.mod = mod_idx;
 
-	/* This is temporary: point mod into copy of data. */
-	info->mod = (void *)info->hdr + shdr->sh_offset;
+	return 0;
+}
 
-	/*
-	 * If we didn't load the .modinfo 'name' field earlier, fall back to
-	 * on-disk struct mod 'name' field.
-	 */
-	if (!info->name)
-		info->name = info->mod->name;
+/**
+ * elf_validity_cache_index_sym() - Validate and cache symtab index
+ * @info: Load info to cache symtab index in.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated.
+ *
+ * Checks that there is exactly one symbol table, then caches its index in
+ * &load_info->index.sym.
+ *
+ * Return: %0 if valid, %-ENOEXEC on failure.
+ */
+static int elf_validity_cache_index_sym(struct load_info *info)
+{
+	unsigned int sym_idx;
+	unsigned int num_sym_secs = 0;
+	int i;
+
+	for (i = 1; i < info->hdr->e_shnum; i++) {
+		if (info->sechdrs[i].sh_type == SHT_SYMTAB) {
+			num_sym_secs++;
+			sym_idx = i;
+		}
+	}
+
+	if (num_sym_secs != 1) {
+		pr_warn("%s: module has no symbols (stripped?)\n",
+			info->name ?: "(missing .modinfo section or name field)");
+		return -ENOEXEC;
+	}
+
+	info->index.sym = sym_idx;
+
+	return 0;
+}
+
+/**
+ * elf_validity_cache_index_str() - Validate and cache strtab index
+ * @info: Load info to cache strtab index in.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated.
+ *        Must have &load_info->index.sym populated.
+ *
+ * Looks at the symbol table's associated string table, makes sure it is
+ * in-bounds, and caches it.
+ *
+ * Return: %0 if valid, %-ENOEXEC on failure.
+ */
+static int elf_validity_cache_index_str(struct load_info *info)
+{
+	unsigned int str_idx = info->sechdrs[info->index.sym].sh_link;
+
+	if (str_idx == SHN_UNDEF || str_idx > info->hdr->e_shnum) {
+		pr_err("Invalid ELF sh_link!=SHN_UNDEF(%d) or (sh_link(%d) >= hdr->e_shnum(%d)\n",
+		       str_idx, str_idx, info->hdr->e_shnum);
+		return -ENOEXEC;
+	}
+
+	info->index.str = str_idx;
+	return 0;
+}
+
+/**
+ * elf_validity_cache_index() - Resolve, validate, cache section indices
+ * @info:  Load info to read from and update.
+ *         &load_info->sechdrs and &load_info->secstrings must be populated.
+ * @flags: Load flags, relevant to suppress version loading, see
+ *         uapi/linux/module.h
+ *
+ * Populates &load_info->index, validating as it goes.
+ * See child functions for per-field validation:
+ *
+ * * elf_validity_cache_index_info()
+ * * elf_validity_cache_index_mod()
+ * * elf_validity_cache_index_sym()
+ * * elf_validity_cache_index_str()
+ *
+ * If versioning is not suppressed via flags, load the version index from
+ * a section called "__versions" with no validation.
+ *
+ * If CONFIG_SMP is enabled, load the percpu section by name with no
+ * validation.
+ *
+ * Return: 0 on success, negative error code if an index failed validation.
+ */
+static int elf_validity_cache_index(struct load_info *info, int flags)
+{
+	int err;
+
+	err = elf_validity_cache_index_info(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_mod(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_sym(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_str(info);
+	if (err < 0)
+		return err;
 
 	if (flags & MODULE_INIT_IGNORE_MODVERSIONS)
 		info->index.vers = 0; /* Pretend no __versions section! */
@@ -1894,9 +2069,125 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	info->index.pcpu = find_pcpusec(info);
 
 	return 0;
+}
 
-no_exec:
-	return -ENOEXEC;
+/**
+ * elf_validity_cache_strtab() - Validate and cache symbol string table
+ * @info: Load info to read from and update.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated.
+ *        Must have &load_info->index populated.
+ *
+ * Checks:
+ *
+ * * The string table is not empty.
+ * * The string table starts and ends with NUL (required by ELF spec).
+ * * Every &Elf_Sym->st_name offset in the symbol table is inbounds of the
+ *   string table.
+ *
+ * And caches the pointer as &load_info->strtab in @info.
+ *
+ * Return: 0 on success, negative error code if a check failed.
+ */
+static int elf_validity_cache_strtab(struct load_info *info)
+{
+	Elf_Shdr *str_shdr = &info->sechdrs[info->index.str];
+	Elf_Shdr *sym_shdr = &info->sechdrs[info->index.sym];
+	char *strtab = (char *)info->hdr + str_shdr->sh_offset;
+	Elf_Sym *syms = (void *)info->hdr + sym_shdr->sh_offset;
+	int i;
+
+	if (str_shdr->sh_size == 0) {
+		pr_err("empty symbol string table\n");
+		return -ENOEXEC;
+	}
+	if (strtab[0] != '\0') {
+		pr_err("symbol string table missing leading NUL\n");
+		return -ENOEXEC;
+	}
+	if (strtab[str_shdr->sh_size - 1] != '\0') {
+		pr_err("symbol string table isn't NUL terminated\n");
+		return -ENOEXEC;
+	}
+
+	/*
+	 * Now that we know strtab is correctly structured, check symbol
+	 * starts are inbounds before they're used later.
+	 */
+	for (i = 0; i < sym_shdr->sh_size / sizeof(*syms); i++) {
+		if (syms[i].st_name >= str_shdr->sh_size) {
+			pr_err("symbol name out of bounds in string table");
+			return -ENOEXEC;
+		}
+	}
+
+	info->strtab = strtab;
+	return 0;
+}
+
+/**
+ * elf_validity_cache_copy() - Validate kernel module and cache section info
+ *
+ * @info:  Contains the ELF info, and is where we fill out the computed section
+ *         indexes and pointers.
+ * @flags: Module load flags, see uapi/linux/module.h
+ *
+ * This validates a userspace ELF module matches our expectations so that it
+ * will be safe to assume it is well formed later in the load.
+ *
+ * Notable checks include:
+ *
+ * * ELF header is within range and valid
+ * * Section headers are inbounds and the expected size
+ * * Section contents are inbounds
+ * * The section name string section is inbounds, NUL terminated, and
+ *   section name offsets are inbounds.
+ * * Symbol table, symbol string table, and this_module are present
+ * * Symbol table, this_module, and modinfo are unique
+ * * The symbol table string table is inbounds, NUL leading and terminated,
+ *   and the symbol name offsets into the table are inbounds.
+ *
+ * Computed and cached values include:
+ *
+ * * &load_info->sechdrs (section header table)
+ * * &load_info->secstrings (section name strings)
+ * * &load_info->index (distinguished section indices)
+ * * &load_info->strtab (string table for decoding section symbols)
+ *
+ * As a last step we set info->mod to the temporary copy of the module in
+ * info->hdr. The final one will be allocated in move_module(). Any
+ * modifications we make to our copy of the module will be carried over
+ * to the final minted module.
+ *
+ * Return: 0 on success, negative error code if the ELF failed validation.
+ */
+static int elf_validity_cache_copy(struct load_info *info, int flags)
+{
+	int err;
+
+	err = elf_validity_cache_sechdrs(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_secstrings(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index(info, flags);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_strtab(info);
+	if (err < 0)
+		return err;
+
+	/* This is temporary: point mod into copy of data. */
+	info->mod = (void *)info->hdr + info->sechdrs[info->index.mod].sh_offset;
+
+	/*
+	 * If we didn't load the .modinfo 'name' field earlier, fall back to
+	 * on-disk struct mod 'name' field.
+	 */
+	if (!info->name)
+		info->name = info->mod->name;
+
+	return 0;
 }
 
 #define COPY_CHUNK_SIZE (16*PAGE_SIZE)
-- 
2.43.0.rc0.421.g78406f8d94-goog

