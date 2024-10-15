Return-Path: <linuxppc-dev+bounces-2299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A1D99FC4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 01:19:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSqnR329Fz2y8V;
	Wed, 16 Oct 2024 10:19:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729034395;
	cv=none; b=biFoYxVyl95fV5SKKGCybjF/BFAnEANjG++LcGlY7yyvREZrL5VfMVt5iU6bxYsRe6XRe9ILdkZxNUPWd8AdXzrbNIFtm4Hwc0JZ88eQ8tuGAL+Gml0ftijnwa7y+RiDR6X72OIXZ8fKmHPDcuhVX4NH7WtssknCbExsw8kwVTc+LpO4reb64eLGvxjaela6YCEBXVgfdh+iJrHTkf8O8l109ktttN8MntZgXQfeQEOYv2ITzUEnPzVv02QcjMrlb6ZC8qBX0t8m146uuFo3jFqulXKnHQmSZkANt1yc4CjApbqnrNuofVqGYFotm5HQ+CV+eiHg+SjylB/MlfAHag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729034395; c=relaxed/relaxed;
	bh=FMSQ/Tp5KquWB/NFr+gBjq3itwue5CA00E66TGsfFAE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KSn6WAhB6+RcsnIPuVuNGfVMABIoSB1EaD+7ENXDEnSZWfunErsvwjCK77tw+yNJhj+ngvrbW8OFDEloRhkzJNhFotLTVZX6nFcYSJKwp0KJEXhRgXW49q7uB3fRuhOZqG4fmAhKS3tvbKCHsIep3r1Hz9YGK/msgCVONRWXhxn331nMDxJUamXkcB2zZDNu7bhY6ytAF85JHNJl8DohckHABgHnYW+LcaNG4bxYC3ETUBthVcdeqety9DJW+nK1tXNCS83AY6R3PmgUHE+YMAuuzTZFvrxe+6VGY3Z09hLQRXFmksLRTGczsxA0whyAyoHWwJh2Azm+P4WZNx8Y9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=abt/Xvgt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3lpgozwckdaennbvsfshpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=abt/Xvgt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3lpgozwckdaennbvsfshpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSqnP1d4nz2xsd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 10:19:51 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e321d26b38so104505557b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 16:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729034389; x=1729639189; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FMSQ/Tp5KquWB/NFr+gBjq3itwue5CA00E66TGsfFAE=;
        b=abt/XvgtG5aulzT/U73Nrqezv+6s+mx959Ys2yzXIjHlaVJzkE9OOADd6UDGKFuZ7A
         Bg8Cw+Gihzi9lxsSEV9s5ekbH0Al1v2Zu4qSB0OOkD/VjJeSLbzkVCwk9lxJZSs1MfhO
         6j710+zFF7Qt4lYS+OE+Oi2LxcPeKx85GiOpWwvjmAiNfuDk6rDJCe/je9sRfjqY7k2V
         QDMfTIGkeomgCu2AYhlUgxh2TmzDI1Jp3EXJtM65xaGod0szTFqSPP+xcJ3DhLUCwN7p
         AqUqqV4apAC00WlJ3LwE2naM1rztYFmFfFoSuWyTF+xZDTEHv5yZ5gEtLercLapF/Fyr
         QZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729034389; x=1729639189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMSQ/Tp5KquWB/NFr+gBjq3itwue5CA00E66TGsfFAE=;
        b=L3hmuC2YBgaGyL5YXo3wlGFTCML05ZtTWVKMN7Npv3e+h0U6XTRvMVz4WSc0vCWlGQ
         qC/kBryNJC5RdXLzRD2XsrJv4GBFlYF9ofB+QFce5HFZ8b6+cFYEjmDr8UT0Jcaxhel3
         qukZuO9UP5QFm/aeFdZgQTbSJX5LMN8OKloX1NnpIJvm7BqhgNW3k0Y5fdn3eNGfATuC
         g3p3oP/cL89VA1FWnr5Ft8Q/ZvmAjnHk7Hxtn6AwwX/6R8HBWaH6UmzAFfWSgriOnxBU
         tiZZ1HEj9gHYEHILQX8uwT4c030zMEMJN1A048YehNndG6+Kn1pNz8fDH8Qjttx7kloy
         3txg==
X-Forwarded-Encrypted: i=1; AJvYcCXIOdOBd2jrXOxp7obaxTITJdx9U8Xi+uoyTAfSleixdvfEhmtKF5azTDwGmNdugHRtogY3+Tx7ZLKLRiU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz3DsftqA0fsyECMs5x4x9xoba5zOYpKrHt5hsKfp6BvEeH9YaJ
	F+SDjwlhzn6L+LOgmYOKBR4BSzbwWVeamO0l/+T4GzBaiEc9Trm50yXNXpet8r9tQ/UvF5EqhEU
	vzirfvg==
X-Google-Smtp-Source: AGHT+IGX0icJ1CWivcvNRrA/zojDVZFklRmkCxNQxnPYkIU1lCS12nRY8wVMRxtxvqJKRQSf0gcnC2/QNxRA
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a0d:c405:0:b0:6b2:3ecc:817 with SMTP id
 00721157ae682-6e3d41eb817mr246597b3.8.1729034388608; Tue, 15 Oct 2024
 16:19:48 -0700 (PDT)
Date: Tue, 15 Oct 2024 23:18:57 +0000
In-Reply-To: <20241015231925.3854230-1-mmaurer@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241015231925.3854230-1-mmaurer@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241015231925.3854230-3-mmaurer@google.com>
Subject: [PATCH v6 2/5] modules: Support extended MODVERSIONS info
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Naveen N Rao <naveen@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Benjamin Gray <bgray@linux.ibm.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, samitolvanen@google.com, 
	Matthew Maurer <mmaurer@google.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLACK,USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
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

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 arch/powerpc/kernel/module_64.c | 23 ++++++++-
 kernel/module/internal.h        | 11 ++++
 kernel/module/main.c            | 92 ++++++++++++++++++++++++++++++---
 kernel/module/version.c         | 45 ++++++++++++++++
 4 files changed, 161 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 135960918d14..0f7ef7e7e9d6 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -355,6 +355,23 @@ static void dedotify_versions(struct modversion_info *vers,
 		}
 }
 
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
@@ -424,10 +441,12 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
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
index daef2be83902..59959c21b205 100644
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
index 3db9ff544c09..f5f4ceaef31a 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2072,6 +2072,82 @@ static int elf_validity_cache_index_str(struct load_info *info)
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
@@ -2086,9 +2162,7 @@ static int elf_validity_cache_index_str(struct load_info *info)
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
@@ -2111,11 +2185,9 @@ static int elf_validity_cache_index(struct load_info *info, int flags)
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
 
@@ -2326,6 +2398,10 @@ static int rewrite_section_headers(struct load_info *info, int flags)
 
 	/* Track but don't keep modinfo and version sections. */
 	info->sechdrs[info->index.vers].sh_flags &= ~(unsigned long)SHF_ALLOC;
+	info->sechdrs[info->index.vers_ext_crc].sh_flags &=
+		~(unsigned long)SHF_ALLOC;
+	info->sechdrs[info->index.vers_ext_name].sh_flags &=
+		~(unsigned long)SHF_ALLOC;
 	info->sechdrs[info->index.info].sh_flags &= ~(unsigned long)SHF_ALLOC;
 
 	return 0;
diff --git a/kernel/module/version.c b/kernel/module/version.c
index 53f43ac5a73e..c246d4087970 100644
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
2.47.0.rc1.288.g06298d1525-goog


