Return-Path: <linuxppc-dev+bounces-2736-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C09059B7044
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 00:05:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xf2lc1dmcz2xYs;
	Thu, 31 Oct 2024 10:05:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730329516;
	cv=none; b=gfxkKD9gn/kj1hWqc7vQr9sDXyQsQGYkCMOlkjZVj/qLhqqocdpIXEaSXpIGwl+ipQCl9TFalA7lEFCPuwyhPkildXBqp6uiJJyw+A95yzxfOqG812kecgQv5TOddayIfNml1Pzb0x9gCyTAd6TQivEfyfluHFNPh+Cii6GKJtMmRWQVJOxHMeF4/96afVD1t4GxJRhjab8Bjk5fKtwIaCgq4c9uup3EwfwlQ8B9/0EYcyW0gkwJh7xgWNkV/BUXj1avurdFaxPAN8VEsOCf9J2wjvTkTnFiTuYaPMHjEKx7t/NS7zCdEOQzXc7WqsxmZGHdlb5yrZe2+mlolU+H/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730329516; c=relaxed/relaxed;
	bh=M9nQk6Vo8fRWDZnjgBzQeNQ0t1uhkA+WPna5Ivbnx+E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ljY/fyJ4WUDQi0RYoF26GgzT2VQFSu6dGNN8AtCBO3Ropq0giLg6GFW4PKtDcD60xChF7xzPsYGwPt+aeXqc8JjG5RAsiUpP8+6YFNSSZhZC3cTzasuFG9vgwVdCu2bfZHJETD7Wlk5AiR4r7AcXCJ8Nh69WZQNbEWK/JeJFeJ0zTD32jkM6Ak/LTifhRjUGFzxauMkFdtqgfqdkaPMs59zazwKzKE1lHMFy4pArNsMmZrcpauCnLyOc2NVazX/QmAOfcmdQmPB/xXRA4g6KZtq3YZ4gU0cwWGbO1/8bdHqBnMoGrgxRjf5Mp6Fzqb+aS7Mns8CF6O7zin9LJhS0+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PsU0W0e1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3o7sizwckdoqssgaxkxmuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PsU0W0e1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3o7sizwckdoqssgaxkxmuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xf2lY0jdxz2xk7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 10:05:11 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e3d660a1afso7348867b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 16:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730329508; x=1730934308; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M9nQk6Vo8fRWDZnjgBzQeNQ0t1uhkA+WPna5Ivbnx+E=;
        b=PsU0W0e1ByokEwuTaeQGxu0yyNY6dNCZYAgvnjwauONYggsSPPck6PsdOOaRJRrP9g
         dP14kzS48NnnKaQsRGtq7X4uISCmJmYX3AqzPXlBwDs900QQq9aJ28SZacZCSlim7ps7
         o1z3lyG6Gko/mEwkfczfkRh4VoWV/J+qLV/1YminYQNZcYWaeiW1G2NBhpN3khaxTYoO
         kp/iHoYe6X9lVLNivExXIwlVSieNkGZ5hCYLl0wVM1tM0Wz6apb8PY6kgyBxtyXh167k
         AXp6tTVLjofxDYEWneC56Sp362a58f3mmLXShvlX5IGHWxeOcF9wATvPshaWTQXL52AJ
         nP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730329508; x=1730934308;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9nQk6Vo8fRWDZnjgBzQeNQ0t1uhkA+WPna5Ivbnx+E=;
        b=pdd7c9QzdLZkAeVEefvva2G2FY7jlqfnP9HHQ90UDNtXUUc9k8J299FhqqKkWqzsep
         zjP7fURb7XYm6M9DnELWpPIk7I7ecVPdX4rz1HdJJfxgtqjRprXyWne+POh+KYj9k5UH
         2F4zc3R1CYHe6iPBj0R/XN+dTOrpNn3ZWcT5ELkHtm6gfTVCXY2q4wElBCds/wyULb0m
         ZcYm81LX0SALeHes8QwSuzCmPjWK51MNU0uKN4qii+avWRpCUiRaTtzQHqB13rf9xfrN
         10RRzfi+itiWgAurymE7gOY2wjtKLQ5o4zn1zSpFMzNV47ENQQ7R90LEKwqNp2ot45PN
         2jnQ==
X-Gm-Message-State: AOJu0Yz/z8wVMVIwQZgNuZeKyyHmfth+cfb3nx7wWtm4B7eZHLUsGSbh
	0CNkyQsAYeEvEzBwfHNJcYFlFIyxXvt4jUMgStU25ibgwntlZ2M7FK827clEgAEf+Od1jIdfvf4
	9fQDhdA==
X-Google-Smtp-Source: AGHT+IFvZLz7CVdvhJjJoh+yqpQ35aVD3PCtqu26YbxX8dAJAbgIAzOeOK4f9sJtySMAH38zABThUZljaU2M
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:838d:0:b0:e27:3e6a:345 with SMTP id
 3f1490d57ef6-e3087c22e77mr11084276.10.1730329507922; Wed, 30 Oct 2024
 16:05:07 -0700 (PDT)
Date: Wed, 30 Oct 2024 23:05:02 +0000
In-Reply-To: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241030-extended-modversions-v8-1-93acdef62ce8@google.com>
Subject: [PATCH v8 1/3] modules: Support extended MODVERSIONS info
From: Matthew Maurer <mmaurer@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Adds a new format for MODVERSIONS which stores each field in a separate
ELF section. This initially adds support for variable length names, but
could later be used to add additional fields to MODVERSIONS in a
backwards compatible way if needed. Any new fields will be ignored by
old user tooling, unlike the current format where user tooling cannot
tolerate adjustments to the format (for example making the name field
longer).

Since PPC munges its version records to strip leading dots, we reproduce
the munging for the new format. Other architectures do not appear to
have architecture-specific usage of this information.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 arch/powerpc/kernel/module_64.c | 24 ++++++++++-
 kernel/module/internal.h        | 11 +++++
 kernel/module/main.c            | 92 +++++++++++++++++++++++++++++++++++++----
 kernel/module/version.c         | 45 ++++++++++++++++++++
 4 files changed, 162 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index e9bab599d0c2745e4d2b5cae04f2c56395c24654..02ada0b057cef6b2f29fa7519a5d52acac740ee5 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -355,6 +355,24 @@ static void dedotify_versions(struct modversion_info *vers,
 		}
 }
 
+/* Same as normal versions, remove a leading dot if present. */
+static void dedotify_ext_version_names(char *str_seq, unsigned long size)
+{
+	unsigned long out = 0;
+	unsigned long in;
+	char last = '\0';
+
+	for (in = 0; in < size; in++) {
+		/* Skip one leading dot */
+		if (last == '\0' && str_seq[in] == '.')
+			in++;
+		last = str_seq[in];
+		str_seq[out++] = last;
+	}
+	/* Zero the trailing portion of the names table for robustness */
+	memset(&str_seq[out], 0, size - out);
+}
+
 /*
  * Undefined symbols which refer to .funcname, hack to funcname. Make .TOC.
  * seem to be defined (value set later).
@@ -424,10 +442,12 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 			me->arch.toc_section = i;
 			if (sechdrs[i].sh_addralign < 8)
 				sechdrs[i].sh_addralign = 8;
-		}
-		else if (strcmp(secstrings+sechdrs[i].sh_name,"__versions")==0)
+		} else if (strcmp(secstrings + sechdrs[i].sh_name, "__versions") == 0)
 			dedotify_versions((void *)hdr + sechdrs[i].sh_offset,
 					  sechdrs[i].sh_size);
+		else if (strcmp(secstrings + sechdrs[i].sh_name, "__version_ext_names") == 0)
+			dedotify_ext_version_names((void *)hdr + sechdrs[i].sh_offset,
+						   sechdrs[i].sh_size);
 
 		if (sechdrs[i].sh_type == SHT_SYMTAB)
 			dedotify((void *)hdr + sechdrs[i].sh_offset,
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index daef2be8390222c22220e2f168baa8d35ad531b9..59959c21b205bf91c0073260885743098c4022cf 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -86,6 +86,8 @@ struct load_info {
 		unsigned int vers;
 		unsigned int info;
 		unsigned int pcpu;
+		unsigned int vers_ext_crc;
+		unsigned int vers_ext_name;
 	} index;
 };
 
@@ -389,6 +391,15 @@ void module_layout(struct module *mod, struct modversion_info *ver, struct kerne
 		   struct kernel_symbol *ks, struct tracepoint * const *tp);
 int check_modstruct_version(const struct load_info *info, struct module *mod);
 int same_magic(const char *amagic, const char *bmagic, bool has_crcs);
+struct modversion_info_ext {
+	size_t remaining;
+	const s32 *crc;
+	const char *name;
+};
+void modversion_ext_start(const struct load_info *info, struct modversion_info_ext *ver);
+void modversion_ext_advance(struct modversion_info_ext *ver);
+#define for_each_modversion_info_ext(ver, info) \
+	for (modversion_ext_start(info, &ver); ver.remaining > 0; modversion_ext_advance(&ver))
 #else /* !CONFIG_MODVERSIONS */
 static inline int check_version(const struct load_info *info,
 				const char *symname,
diff --git a/kernel/module/main.c b/kernel/module/main.c
index b40b632f00a65e66ed73c4b386ef1f323a5b790c..9a9feca344f8bb06408d350e13f759bb909962cd 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2039,6 +2039,82 @@ static int elf_validity_cache_index_str(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_index_versions() - Validate and cache version indices
+ * @info:  Load info to cache version indices in.
+ *         Must have &load_info->sechdrs and &load_info->secstrings populated.
+ * @flags: Load flags, relevant to suppress version loading, see
+ *         uapi/linux/module.h
+ *
+ * If we're ignoring modversions based on @flags, zero all version indices
+ * and return validity. Othewrise check:
+ *
+ * * If "__version_ext_crcs" is present, "__version_ext_names" is present
+ * * There is a name present for every crc
+ *
+ * Then populate:
+ *
+ * * &load_info->index.vers
+ * * &load_info->index.vers_ext_crc
+ * * &load_info->index.vers_ext_names
+ *
+ * if present.
+ *
+ * Return: %0 if valid, %-ENOEXEC on failure.
+ */
+static int elf_validity_cache_index_versions(struct load_info *info, int flags)
+{
+	unsigned int vers_ext_crc;
+	unsigned int vers_ext_name;
+	size_t crc_count;
+	size_t remaining_len;
+	size_t name_size;
+	char *name;
+
+	/* If modversions were suppressed, pretend we didn't find any */
+	if (flags & MODULE_INIT_IGNORE_MODVERSIONS) {
+		info->index.vers = 0;
+		info->index.vers_ext_crc = 0;
+		info->index.vers_ext_name = 0;
+		return 0;
+	}
+
+	vers_ext_crc = find_sec(info, "__version_ext_crcs");
+	vers_ext_name = find_sec(info, "__version_ext_names");
+
+	/* If we have one field, we must have the other */
+	if (!!vers_ext_crc != !!vers_ext_name) {
+		pr_err("extended version crc+name presence does not match");
+		return -ENOEXEC;
+	}
+
+	/*
+	 * If we have extended version information, we should have the same
+	 * number of entries in every section.
+	 */
+	if (vers_ext_crc) {
+		crc_count = info->sechdrs[vers_ext_crc].sh_size / sizeof(s32);
+		name = (void *)info->hdr +
+			info->sechdrs[vers_ext_name].sh_offset;
+		remaining_len = info->sechdrs[vers_ext_name].sh_size;
+
+		while (crc_count--) {
+			name_size = strnlen(name, remaining_len) + 1;
+			if (name_size > remaining_len) {
+				pr_err("more extended version crcs than names");
+				return -ENOEXEC;
+			}
+			remaining_len -= name_size;
+			name += name_size;
+		}
+	}
+
+	info->index.vers = find_sec(info, "__versions");
+	info->index.vers_ext_crc = vers_ext_crc;
+	info->index.vers_ext_name = vers_ext_name;
+	return 0;
+}
+
 /**
  * elf_validity_cache_index() - Resolve, validate, cache section indices
  * @info:  Load info to read from and update.
@@ -2053,9 +2129,7 @@ static int elf_validity_cache_index_str(struct load_info *info)
  * * elf_validity_cache_index_mod()
  * * elf_validity_cache_index_sym()
  * * elf_validity_cache_index_str()
- *
- * If versioning is not suppressed via flags, load the version index from
- * a section called "__versions" with no validation.
+ * * elf_validity_cache_index_versions()
  *
  * If CONFIG_SMP is enabled, load the percpu section by name with no
  * validation.
@@ -2078,11 +2152,9 @@ static int elf_validity_cache_index(struct load_info *info, int flags)
 	err = elf_validity_cache_index_str(info);
 	if (err < 0)
 		return err;
-
-	if (flags & MODULE_INIT_IGNORE_MODVERSIONS)
-		info->index.vers = 0; /* Pretend no __versions section! */
-	else
-		info->index.vers = find_sec(info, "__versions");
+	err = elf_validity_cache_index_versions(info, flags);
+	if (err < 0)
+		return err;
 
 	info->index.pcpu = find_pcpusec(info);
 
@@ -2293,6 +2365,10 @@ static int rewrite_section_headers(struct load_info *info, int flags)
 
 	/* Track but don't keep modinfo and version sections. */
 	info->sechdrs[info->index.vers].sh_flags &= ~(unsigned long)SHF_ALLOC;
+	info->sechdrs[info->index.vers_ext_crc].sh_flags &=
+		~(unsigned long)SHF_ALLOC;
+	info->sechdrs[info->index.vers_ext_name].sh_flags &=
+		~(unsigned long)SHF_ALLOC;
 	info->sechdrs[info->index.info].sh_flags &= ~(unsigned long)SHF_ALLOC;
 
 	return 0;
diff --git a/kernel/module/version.c b/kernel/module/version.c
index 53f43ac5a73e9d537a9e95ff97728a51fad0e797..c246d40879706d4f413fa7ea9bbe2264ea1b2aa8 100644
--- a/kernel/module/version.c
+++ b/kernel/module/version.c
@@ -19,11 +19,28 @@ int check_version(const struct load_info *info,
 	unsigned int versindex = info->index.vers;
 	unsigned int i, num_versions;
 	struct modversion_info *versions;
+	struct modversion_info_ext version_ext;
 
 	/* Exporting module didn't supply crcs?  OK, we're already tainted. */
 	if (!crc)
 		return 1;
 
+	/* If we have extended version info, rely on it */
+	if (info->index.vers_ext_crc) {
+		for_each_modversion_info_ext(version_ext, info) {
+			if (strcmp(version_ext.name, symname) != 0)
+				continue;
+			if (*version_ext.crc == *crc)
+				return 1;
+			pr_debug("Found checksum %X vs module %X\n",
+				 *crc, *version_ext.crc);
+			goto bad_version;
+		}
+		pr_warn_once("%s: no extended symbol version for %s\n",
+			     info->name, symname);
+		return 1;
+	}
+
 	/* No versions at all?  modprobe --force does this. */
 	if (versindex == 0)
 		return try_to_force_load(mod, symname) == 0;
@@ -87,6 +104,34 @@ int same_magic(const char *amagic, const char *bmagic,
 	return strcmp(amagic, bmagic) == 0;
 }
 
+void modversion_ext_start(const struct load_info *info,
+			  struct modversion_info_ext *start)
+{
+	unsigned int crc_idx = info->index.vers_ext_crc;
+	unsigned int name_idx = info->index.vers_ext_name;
+	Elf_Shdr *sechdrs = info->sechdrs;
+
+	/*
+	 * Both of these fields are needed for this to be useful
+	 * Any future fields should be initialized to NULL if absent.
+	 */
+	if (crc_idx == 0 || name_idx == 0) {
+		start->remaining = 0;
+		return;
+	}
+
+	start->crc = (const s32 *)sechdrs[crc_idx].sh_addr;
+	start->name = (const char *)sechdrs[name_idx].sh_addr;
+	start->remaining = sechdrs[crc_idx].sh_size / sizeof(*start->crc);
+}
+
+void modversion_ext_advance(struct modversion_info_ext *vers)
+{
+	vers->remaining--;
+	vers->crc++;
+	vers->name += strlen(vers->name) + 1;
+}
+
 /*
  * Generate the signature for all relevant module structures here.
  * If these change, we don't want to try to parse the module.

-- 
2.47.0.163.g1226f6d8fa-goog


