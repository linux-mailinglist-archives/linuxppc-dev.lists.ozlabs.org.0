Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F497ED629
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 22:40:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FRdilk6A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVxR06MwZz3dFm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 08:40:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FRdilk6A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3krvvzqckdnggg4ol8laiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVstC4S4rz3c4M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 06:00:01 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-daf702bde7eso4964724276.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 11:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700074794; x=1700679594; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qmcer6lC4M3sVp5hzPP8TVTi+lzihM8StX6tq1rvRlw=;
        b=FRdilk6AAwmryFm5X1oVlD+DhCCPS0rlQ8wnGin7Twkfz6AuP5yuicXxy072SN2Dg3
         i5SvJaZDE0vSqW6SO+uxEshjocbcsS9D/UL92BVQWaca3y44u4+J31pWfp9dPX4LEGzB
         z5Y20k7uJVE2/7cyDgFUQFLkaeSk+JbbirVeUU+IVSX+j2KvlZx8UAfAP6vOMqvvp25d
         hoqOr8iE+vlILuG+xMtzxiCj3xeV6t7o4gSGcgZYXceSltEyEtLz7HcnTbkMTA6qW0oS
         9ryp8FsOp52CpRCw1t7FhxF/UIs8eAP7SDm6soMopMrxB1JPWsENuavlTbziBFvMC5OI
         pF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700074794; x=1700679594;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qmcer6lC4M3sVp5hzPP8TVTi+lzihM8StX6tq1rvRlw=;
        b=kRhj9RbQ2s9NV7YOIN5ZcJncPFXDRZ9JF/mh9M11oOVdeVLrd+Fqasv8NsFKJbheO3
         UIHw13UNl0UiUb9hwQbB4pwNbVHvMQMNkJHaySgl2HXAvJMZHevux3Lbn0RemaSDc9RG
         SiQEwHq48NykvZt8E6PDuFdm6HDy3zl8AGyCfcJZ/9vlbMFX9rbJIID1ysa64vikDCIP
         be/jQ6rkwHSQoIqVfSbAyS38D66x1NohRfVy39FJ1i/PmToxrYH+MZj9GFDJ7kfgMwT6
         WnpylRHO/xDPDe4ZuPVQGFzmJ3vczrVuAcssq+lgxqLqiQIQxnTHbna1W+bXtGgPG6dW
         hMew==
X-Gm-Message-State: AOJu0YyQXm6XOQhRb1hNdqERE+aC3Kb9pmd1zkZUwb4Zq7dmE/nVUqcg
	p5Gb+LRprNRWrPpRv9S51h+nF1hrDEFb
X-Google-Smtp-Source: AGHT+IHERGA7zRpPfbLXEqdgyK4LyKKZECDv5ROgnQkI8SyPb13F+RZ2TBOoN1DR45atLajBKyBsyY0c+xc6
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:ab65:0:b0:da3:723b:b2a4 with SMTP id
 u92-20020a25ab65000000b00da3723bb2a4mr304318ybi.7.1700074793576; Wed, 15 Nov
 2023 10:59:53 -0800 (PST)
Date: Wed, 15 Nov 2023 18:50:10 +0000
In-Reply-To: <20231115185858.2110875-1-mmaurer@google.com>
Mime-Version: 1.0
References: <20231115185858.2110875-1-mmaurer@google.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231115185858.2110875-3-mmaurer@google.com>
Subject: [PATCH 2/3] modpost: Extended modversion support
From: Matthew Maurer <mmaurer@google.com>
To: gary@garyguo.net, masahiroy@kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Song Liu <song@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, Matthew Maurer <mmaurer@google.com>, Naveen N Rao <naveen@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Nhat Pham <nphamcs@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Marc=20Aur=C3=A8le=20La=20France?=" <tsi@tuyoix.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 16 Nov 2023 08:39:29 +1100
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
Cc: =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Alice Ryhl <aliceryhl@google.com>, linux-modules@vger.kernel.org, Benno Lossin <benno.lossin@proton.me>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Andreas Hindborg <a.hindborg@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adds a new format for modversions which stores each field in a separate
elf section. This initially adds support for variable length names, but
could later be used to add additional fields to modversions in a
backwards compatible way if needed.

Adding support for variable length names makes it possible to enable
MODVERSIONS and RUST at the same time.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 arch/powerpc/kernel/module_64.c | 24 +++++++++-
 init/Kconfig                    |  1 -
 kernel/module/internal.h        | 16 ++++++-
 kernel/module/main.c            |  9 +++-
 kernel/module/version.c         | 77 +++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c           | 33 ++++++++++++--
 6 files changed, 151 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 7112adc597a8..2582353a2048 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -355,6 +355,24 @@ static void dedotify_versions(struct modversion_info *vers,
 		}
 }
 
+static void dedotify_ext_version_names(char *str_seq, unsigned long size)
+{
+	unsigned long out = 0;
+	unsigned long in;
+	char last = '\0';
+
+	for (in = 0; in < size; in++) {
+		if (last == '\0')
+			/* Skip all leading dots */
+			if (str_seq[in] == '.')
+				continue;
+		last = str_seq[in];
+		str_seq[out++] = last;
+	}
+	/* Zero the trailing portion of the names table for robustness */
+	bzero(&str_seq[out], size - out);
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
diff --git a/init/Kconfig b/init/Kconfig
index 9ffb103fc927..6cac5b4db8f6 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1885,7 +1885,6 @@ config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
-	depends on !MODVERSIONS
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index c8b7b4dcf782..0c188c96a045 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -80,7 +80,7 @@ struct load_info {
 	unsigned int used_pages;
 #endif
 	struct {
-		unsigned int sym, str, mod, vers, info, pcpu;
+		unsigned int sym, str, mod, vers, info, pcpu, vers_ext_crc, vers_ext_name;
 	} index;
 };
 
@@ -384,6 +384,20 @@ void module_layout(struct module *mod, struct modversion_info *ver, struct kerne
 		   struct kernel_symbol *ks, struct tracepoint * const *tp);
 int check_modstruct_version(const struct load_info *info, struct module *mod);
 int same_magic(const char *amagic, const char *bmagic, bool has_crcs);
+struct modversion_info_ext_s32 {
+	const s32 *value;
+	const s32 *end;
+};
+struct modversion_info_ext_string {
+	const char *value;
+	const char *end;
+};
+struct modversion_info_ext {
+	struct modversion_info_ext_s32 crc;
+	struct modversion_info_ext_string name;
+};
+ssize_t modversion_ext_start(const struct load_info *info, struct modversion_info_ext *ver);
+int modversion_ext_advance(struct modversion_info_ext *ver);
 #else /* !CONFIG_MODVERSIONS */
 static inline int check_version(const struct load_info *info,
 				const char *symname,
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 98fedfdb8db5..e69b2ae46161 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1886,10 +1886,15 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	if (!info->name)
 		info->name = info->mod->name;
 
-	if (flags & MODULE_INIT_IGNORE_MODVERSIONS)
+	if (flags & MODULE_INIT_IGNORE_MODVERSIONS) {
 		info->index.vers = 0; /* Pretend no __versions section! */
-	else
+		info->index.vers_ext_crc = 0;
+		info->index.vers_ext_name = 0;
+	} else {
 		info->index.vers = find_sec(info, "__versions");
+		info->index.vers_ext_crc = find_sec(info, "__version_ext_crcs");
+		info->index.vers_ext_name = find_sec(info, "__version_ext_names");
+	}
 
 	info->index.pcpu = find_pcpusec(info);
 
diff --git a/kernel/module/version.c b/kernel/module/version.c
index 53f43ac5a73e..93d97dad8c77 100644
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
+	if (modversion_ext_start(info, &version_ext) >= 0) {
+		do {
+			if (strncmp(version_ext.name.value, symname,
+				    version_ext.name.end - version_ext.name.value) != 0)
+				continue;
+
+			if (*version_ext.crc.value == *crc)
+				return 1;
+			pr_debug("Found checksum %X vs module %X\n",
+				 *crc, *version_ext.crc.value);
+			goto bad_version;
+		} while (modversion_ext_advance(&version_ext) == 0);
+		goto broken_toolchain;
+	}
+
 	/* No versions at all?  modprobe --force does this. */
 	if (versindex == 0)
 		return try_to_force_load(mod, symname) == 0;
@@ -46,6 +63,7 @@ int check_version(const struct load_info *info,
 		goto bad_version;
 	}
 
+broken_toolchain:
 	/* Broken toolchain. Warn once, then let it go.. */
 	pr_warn_once("%s: no symbol version for %s\n", info->name, symname);
 	return 1;
@@ -87,6 +105,65 @@ int same_magic(const char *amagic, const char *bmagic,
 	return strcmp(amagic, bmagic) == 0;
 }
 
+#define MODVERSION_FIELD_START(sec, field) \
+	field.value = (typeof(field.value))sec.sh_addr; \
+	field.end = field.value + sec.sh_size
+
+ssize_t modversion_ext_start(const struct load_info *info,
+			     struct modversion_info_ext *start)
+{
+	unsigned int crc_idx = info->index.vers_ext_crc;
+	unsigned int name_idx = info->index.vers_ext_name;
+	Elf_Shdr *sechdrs = info->sechdrs;
+
+	// Both of these fields are needed for this to be useful
+	// Any future fields should be initialized to NULL if absent.
+	if ((crc_idx == 0) || (name_idx == 0))
+		return -EINVAL;
+
+	MODVERSION_FIELD_START(sechdrs[crc_idx], start->crc);
+	MODVERSION_FIELD_START(sechdrs[name_idx], start->name);
+
+	return (start->crc.end - start->crc.value) / sizeof(*start->crc.value);
+}
+
+static int modversion_ext_s32_advance(struct modversion_info_ext_s32 *field)
+{
+	if (!field->value)
+		return 0;
+	if (field->value >= field->end)
+		return -EINVAL;
+	field->value++;
+	return 0;
+}
+
+static int modversion_ext_string_advance(struct modversion_info_ext_string *s)
+{
+	if (!s->value)
+		return 0;
+	if (s->value >= s->end)
+		return -EINVAL;
+	s->value += strnlen(s->value, s->end - s->value - 1) + 1;
+	if (s->value >= s->end)
+		return -EINVAL;
+	return 0;
+}
+
+int modversion_ext_advance(struct modversion_info_ext *start)
+{
+	int ret;
+
+	ret = modversion_ext_s32_advance(&start->crc);
+	if (ret < 0)
+		return ret;
+
+	ret = modversion_ext_string_advance(&start->name);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 /*
  * Generate the signature for all relevant module structures here.
  * If these change, we don't want to try to parse the module.
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 973b5e5ae2dd..884860c2e833 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1910,15 +1910,42 @@ static void add_versions(struct buffer *b, struct module *mod)
 			continue;
 		}
 		if (strlen(s->name) >= MODULE_NAME_LEN) {
-			error("too long symbol \"%s\" [%s.ko]\n",
-			      s->name, mod->name);
-			break;
+			/* this symbol will only be in the extended info */
+			continue;
 		}
 		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
 			   s->crc, s->name);
 	}
 
 	buf_printf(b, "};\n");
+
+	buf_printf(b, "static const s32 ____version_ext_crcs[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_crcs\") = {\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			// We already warned on this when producing the legacy
+			// modversions table.
+			continue;
+		}
+		buf_printf(b, "\t%#8x,\n", s->crc);
+	}
+	buf_printf(b, "};\n");
+
+	buf_printf(b, "static const char ____version_ext_names[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_names\") =\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			// We already warned on this when producing the legacy
+			// modversions table.
+			continue;
+		}
+		buf_printf(b, "\t\"%s\\0\"\n", s->name);
+	}
+	buf_printf(b, ";\n");
 }
 
 static void add_depends(struct buffer *b, struct module *mod)
-- 
2.43.0.rc0.421.g78406f8d94-goog

