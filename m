Return-Path: <linuxppc-dev+bounces-2494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB449ABB89
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 04:32:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYCjY0gxrz2yZ7;
	Wed, 23 Oct 2024 13:31:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729650705;
	cv=none; b=g76n/Q9NPwpkaR4YJA3z0FymSamyoYX+CPg7rMm9buQwXp/hExK/9avXb0LuyaCxMLoNA8osHa/P8QN7mg2pSVntoY5lFeVHlyF9ZIcgGDGqE1IN0nNwdusM83cPVxZ/cbNRyTOLTtCrnuRdpXet0cnnZxok7Dwal7XCzfbUq6v1oe6/H9Ehxet7kiXoxsIx/5oSgQpQw0CK5MqRd/Id2vyYx8oK0jV59yyPURp9cxijJ/86G118IvoCbs3w5WzP7AsQcq3T8vJFaJynzIK1wVnQGSVtSk8hNlZ+/PNiI5maFYeUEV/Vc2qGBoGMq6Y1BYkPbIS99OVQNt6qDrFvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729650705; c=relaxed/relaxed;
	bh=Hbq9lhwWvJbskN7S3Dyi23fd/+x2PT2yp9zr8kQtgoI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TJyl4FPDP2ZLAmpvHqHxhM2XM7B2fSygGgcZ+Jf0ouYtWy+C5QKma6ed2rY3YmCQtAo0cirX0FsFg9NyBQIZqLajF7UtzXzk0M1eIMzFaSi+PrvH893tnVlMJe6VVz99vu3bD4m79U/XZG26lVEaQCJQo+Mo9COeFHweTIS4LBK0KT1xkeD9JoYTNcKx7b51LuFxEOwBRtJ/loRxOWf2YhY0/7n51EnRNyWEENYEVh7SLZ4PwPswNGj1N9FppHVxQBTcFxsYEkRoFjK8kxN4TelLFDOXDxU1I8FZ9kpSd//AzQdiSYjoXcpfAFWoolVYHbM/csAT1OLmhXz7+T7TWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=T2wf8sg9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3cwayzwckdgouuiczmzowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=T2wf8sg9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3cwayzwckdgouuiczmzowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYCjT5rtJz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 13:31:40 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e292dbfd834so9637735276.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 19:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729650698; x=1730255498; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hbq9lhwWvJbskN7S3Dyi23fd/+x2PT2yp9zr8kQtgoI=;
        b=T2wf8sg9FWRXxb9qNI6SizvB9hpq9ggkqckdJbmGOxeozq/kPwuilz5O3cTC5XZfAT
         r2puYq1VUyxVP8lQI/u8W/83z+fie8cSwZGmlzz9Ssm3nnO/iBykOYkNIlsbxKCbl/pm
         WIKLG+56DQyuqRsdAU1JRT1JbPzqPfqAsXUnsUdhkEyrQwaXl8WblfChwAqFRr802f3O
         m89hvMZwYLi9lxT0ZOHJwWqpbN8oLKNm506T6zpmTa9h46WYzn1G8FItFU0qbEDo+4ev
         5+8t3/gmqKjH3F3DZdXAIyAaOEfE6mYonlVWpEz4JQ+pIRFFc3lxZ9DS3+aXpASBw8yh
         /soQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729650698; x=1730255498;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hbq9lhwWvJbskN7S3Dyi23fd/+x2PT2yp9zr8kQtgoI=;
        b=NaasJUbAZQV+ICEaX8ozCAvjaRHkgLhxWGyRaQJpoKwwfSVXAHBRyyc35l1rqfuF2y
         hMSNdLHizmMvRh8MhXztI9dVGvZJoob3U10UFtgMa8WKBusGzoAFQRUf0aY9WE4RzT45
         X6deV3GxSRd33PIhyp1LerwOrcqb0nnEvsepI/ZCqhDhaPSO5Lun/8Yd1OPpJYmGNisW
         8wUyd1NsbN6uWRwXnrfGIQ1X++X5xtoY5bGkMSJ++F7Oy02eebdE4UP8StuWg2v1Hbou
         wtn0V2P6g32DLvDGc91xp8cXnulPg4KoeW5+kevJTqZHJkJnjVMxJXRYE9g7/odkcFpp
         CE6w==
X-Gm-Message-State: AOJu0YyImuuI+PSw2BmQssPcZLMlY9z6oIdQYIwgxoNIEOkgBh3UscjS
	OtLzxl2bPuMYqIhGfijVQ+gbZUDT+unExrZNTlh/81lIiwM/NJ+aqD5LFqbPSlgOy9ayrGVjI5f
	fZweYQg==
X-Google-Smtp-Source: AGHT+IFhhX8TBRGQww8JO0xKyIYxDASHJ99toJhoKZmvsmoqT3Bi2wH2OeZuxTdUsS8uuXVhOAbf7a1f9CWN
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:1818:b0:e2e:3131:337f with SMTP
 id 3f1490d57ef6-e2e3a624ed7mr1020276.4.1729650697346; Tue, 22 Oct 2024
 19:31:37 -0700 (PDT)
Date: Wed, 23 Oct 2024 02:31:28 +0000
In-Reply-To: <20241023-extended-modversions-v7-0-339787b43373@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241023-extended-modversions-v7-1-339787b43373@google.com>
Subject: [PATCH v7 1/3] modules: Support extended MODVERSIONS info
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
2.47.0.105.g07ac214952-goog


