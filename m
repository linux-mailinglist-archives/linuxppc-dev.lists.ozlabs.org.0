Return-Path: <linuxppc-dev+bounces-4538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBE79FEB57
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 23:30:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YMW5X5wcYz2xHQ;
	Tue, 31 Dec 2024 09:30:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735597840;
	cv=none; b=LXM2IWkKo541zddZqfk2ofpSfS7FZwnJoSQOcEjD/3AZNIPDfPc+PMZOEMa12HbZ34VcA67iF3ufHt/dtNcAeWd6mrgWCYCgJWt0IPwM32n8YRuir6jFblSEnBEMsJmHPVBfdp44sm+U7TTu2NDWorg7IQxQMRAupLPV/RSg8e2vMbX7jUESc94GAzURaDiDnKmk3/uNtwQLVzACXMrIDcRlPqHdzC38op27n/kos2eYJ51iGaz32ph3a1BD9DKXA6TC5m3kn/OBY0Hz+c3FlO900T2Z+X3VPwnOjEz2dTNN8jZWwP3YSGg/2r76yeb3uh6Qz8e28RRQUjxdH+LU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735597840; c=relaxed/relaxed;
	bh=KIRcbYHGQmiiiWpSG/HYzoKu7yqD3/iQMyIqYWEujyM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QSMGAuEah4oN4Be3uRWvw+j/KqtGrLmGIeTIWaxV/JGRAdhbOza1Mu+mCAXnjY8qxBNng1A1jP01p6kq0ukyM8mQ7dr/EV8lPEnFaKq6ZD/vPHki8GjCylFbPuurUPPogE4YsLsH1myouty/KAOxVgF38v62ptVNaH5nuZUiZdscynt4qjwi90/FKtse3KdsH8J3mXL3Cw2O2D4P51RkDkhpc8A1jkV+Hbtj2n4ETxNKHWHAlpKlS3FZUeT53hYheOqORjU+VR5krF/IocDKpWsWvVEnLcMRlAeLmkgaZff3+DQO1in7ia9+XL3hZFttSnHAUkpQo0/sLV/PifCB2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rxunt8yN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3cr9zzwckdfyaayif2f4cc492.0ca96bildd0-12j96ghg.cn9yzg.cf4@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rxunt8yN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3cr9zzwckdfyaayif2f4cc492.0ca96bildd0-12j96ghg.cn9yzg.cf4@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YMW5T5rWcz2xr4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Dec 2024 09:30:36 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef909597d9so19470293a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 14:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735597834; x=1736202634; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KIRcbYHGQmiiiWpSG/HYzoKu7yqD3/iQMyIqYWEujyM=;
        b=rxunt8yNEDXFA2U7JtMUiw0848GoGKp+K9I2938FCGn6VY4Q1vRsifA3gIj2tRw63V
         66JcnpYB6Tllvrub1OrxVNHbMp21likw8wpl6PKEPwD4Wz6bT3kk8q4P8iG4Pgo/YWk0
         vkQ1wYE8fG0lEhc3qy5F8+gBwNDKJvCrh0zyK//zYyM51uEXWDgODyAjpbfmhIsJTrXf
         4uhDbRzmb7lkKeZZ3b6KIuZyCneH9OwflvvpM16IXS9XdCLIAJ3NtOMuGlSt3/to2NZK
         8woqQKt9kpGQyjhShi3HKg9NG4MAPFmsJ7PDf9IXR2OegGlgxOAdaTkvQk9bWBRC6aZI
         EG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735597834; x=1736202634;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KIRcbYHGQmiiiWpSG/HYzoKu7yqD3/iQMyIqYWEujyM=;
        b=bn63XgnADKPfP0GGKUuIgM+yHBhIKPwnjbg3pok+2bx3N07oJUTIenCFMPeVi4pUja
         //pzQFSa7kIGnGpGMTPupjOpBOGv8tBTEqHuUK2EtnYCFempnrTuU2uon+AYnU/QxVE3
         KQCKpdykWhVk08TonnfYSIP45y85JcUYOuYJGG7djQnfoUCOBXmJ9aCXTju1H40UmYWi
         lvIwSbUPIrDfRXGi++emI38/d9x9JAPuhKte/5UZNwtuo8/+bPh/ef7roHr6Kq7vPAf3
         EKPEAmkrLJzJ7Q0SkJkmRkqQPvSuI3P9Z61idzd023km+sRjz7NxtBEuf7aP+Gbb2YrD
         HCLQ==
X-Gm-Message-State: AOJu0YzFASHOi9+nkS5xY//3o1yXKbJsrkq3adWoy/sSgSjjkH+rCEoQ
	eWHC9bJ6pCfJL4XqvhXwKJO2b5yPczm9v0xLHo/LrwxAi8z4TXGpSbVZQoCUDa2F7wY+uHua3pT
	VyiUSyQ==
X-Google-Smtp-Source: AGHT+IE9p8I6DZqBUWsXi6TTTO1Du1TPnaF76RNXWmaCOjw5OZ2yqbaR7GBLXXiOJWn9aGXAtnMGxhoY2n1/
X-Received: from pjm7.prod.google.com ([2002:a17:90b:2fc7:b0:2ef:abba:8bfd])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e50:b0:2ea:7cd5:4ad6
 with SMTP id 98e67ed59e1d1-2f452eeda66mr50815387a91.32.1735597833878; Mon, 30
 Dec 2024 14:30:33 -0800 (PST)
Date: Mon, 30 Dec 2024 22:30:29 +0000
In-Reply-To: <20241230-extended-modversions-v12-0-296a6a0f5151@google.com>
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
References: <20241230-extended-modversions-v12-0-296a6a0f5151@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241230-extended-modversions-v12-2-296a6a0f5151@google.com>
Subject: [PATCH v12 2/5] modpost: Produce extended MODVERSIONS information
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
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Generate both the existing modversions format and the new extended one
when running modpost. Presence of this metadata in the final .ko is
guarded by CONFIG_EXTENDED_MODVERSIONS.

We no longer generate an error on long symbols in modpost if
CONFIG_EXTENDED_MODVERSIONS is set, as they can now be appropriately
encoded in the extended section. These symbols will be skipped in the
previous encoding. An error will still be generated if
CONFIG_EXTENDED_MODVERSIONS is not set.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/Kconfig    | 10 ++++++++
 scripts/Makefile.modpost |  1 +
 scripts/mod/modpost.c    | 62 ++++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index d443fc504ffca0d1001f880ec496ab1f21fe979e..9568b629a03ce8289d3f3597eefc66fc96445720 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -207,6 +207,16 @@ config ASM_MODVERSIONS
 	  assembly. This can be enabled only when the target architecture
 	  supports it.
 
+config EXTENDED_MODVERSIONS
+	bool "Extended Module Versioning Support"
+	depends on MODVERSIONS
+	help
+	  This enables extended MODVERSIONs support, allowing long symbol
+	  names to be versioned.
+
+	  The most likely reason you would enable this is to enable Rust
+	  support. If unsure, say N.
+
 config MODULE_SRCVERSION_ALL
 	bool "Source checksum for all modules"
 	help
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index ab0e94ea62496e11dbaa3ffc289ce546862795ca..40426fc6350985780c0092beb49c6cc29b9eff62 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -43,6 +43,7 @@ MODPOST = $(objtree)/scripts/mod/modpost
 modpost-args =										\
 	$(if $(CONFIG_MODULES),-M)							\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
+	$(if $(CONFIG_EXTENDED_MODVERSIONS),-x)						\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
 	$(if $(KBUILD_MODPOST_WARN),-w)							\
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index e489983bb8b2850c0f95bcbdfd82f684d4e7f0c3..6324b30f6b97ac24dc517b9229f227c6c369f7d5 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -33,6 +33,8 @@ static bool module_enabled;
 static bool modversions;
 /* Is CONFIG_MODULE_SRCVERSION_ALL set? */
 static bool all_versions;
+/* Is CONFIG_EXTENDED_MODVERSIONS set? */
+static bool extended_modversions;
 /* If we are modposting external module set to 1 */
 static bool external_module;
 /* Only warn about unresolved symbols */
@@ -1804,6 +1806,49 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 	}
 }
 
+/**
+ * Record CRCs for unresolved symbols, supporting long names
+ */
+static void add_extended_versions(struct buffer *b, struct module *mod)
+{
+	struct symbol *s;
+
+	if (!extended_modversions)
+		return;
+
+	buf_printf(b, "\n");
+	buf_printf(b, "static const u32 ____version_ext_crcs[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_crcs\") = {\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			warn("\"%s\" [%s.ko] has no CRC!\n",
+				s->name, mod->name);
+			continue;
+		}
+		buf_printf(b, "\t0x%08x,\n", s->crc);
+	}
+	buf_printf(b, "};\n");
+
+	buf_printf(b, "static const char ____version_ext_names[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_names\") =\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid)
+			/*
+			 * We already warned on this when producing the crc
+			 * table.
+			 * We need to skip its name too, as the indexes in
+			 * both tables need to align.
+			 */
+			continue;
+		buf_printf(b, "\t\"%s\\0\"\n", s->name);
+	}
+	buf_printf(b, ";\n");
+}
+
 /**
  * Record CRCs for unresolved symbols
  **/
@@ -1827,9 +1872,14 @@ static void add_versions(struct buffer *b, struct module *mod)
 			continue;
 		}
 		if (strlen(s->name) >= MODULE_NAME_LEN) {
-			error("too long symbol \"%s\" [%s.ko]\n",
-			      s->name, mod->name);
-			break;
+			if (extended_modversions) {
+				/* this symbol will only be in the extended info */
+				continue;
+			} else {
+				error("too long symbol \"%s\" [%s.ko]\n",
+				      s->name, mod->name);
+				break;
+			}
 		}
 		buf_printf(b, "\t{ 0x%08x, \"%s\" },\n",
 			   s->crc, s->name);
@@ -1960,6 +2010,7 @@ static void write_mod_c_file(struct module *mod)
 	add_header(&buf, mod);
 	add_exported_symbols(&buf, mod);
 	add_versions(&buf, mod);
+	add_extended_versions(&buf, mod);
 	add_depends(&buf, mod);
 
 	buf_printf(&buf, "\n");
@@ -2125,7 +2176,7 @@ int main(int argc, char **argv)
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:x")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2174,6 +2225,9 @@ int main(int argc, char **argv)
 		case 'd':
 			missing_namespace_deps = optarg;
 			break;
+		case 'x':
+			extended_modversions = true;
+			break;
 		default:
 			exit(1);
 		}

-- 
2.47.1.613.gc27f4b7a9f-goog


