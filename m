Return-Path: <linuxppc-dev+bounces-4647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDA7A00CD3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 18:37:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPrP52hH1z30VY;
	Sat,  4 Jan 2025 04:37:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735925833;
	cv=none; b=X27Ls4SpWnJ0/v5vIlgToCWM7HCBcssusUsoweTvw7+hBxsOwErW5oDTgcFOgAwyHuNcTDhdIKrScBnW4tKLnog9T/RFBtWnHJfvD3R5ZBbu3A19MoyyGP6Pwz6Qj/G1SuwfrHXBxfCpH4J6FgtnxwCfoJ+O1n4F7JVxIhjhC/DrRzaMthI8tUEtQTPeiv2I5wCUnp8argpKcz7N57aHh2DsZxcwODcHEzIbqJjzUOuHISaUGPSIAFe3VQhxDquxFbyrMdEOmC5eMj/0+A+LlNqaE5RWRzeEHVCgfSXCt39G+LLINTzgKXbGPrAUE96lJJeFbgUWqKVnBHKNpIz8Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735925833; c=relaxed/relaxed;
	bh=KIRcbYHGQmiiiWpSG/HYzoKu7yqD3/iQMyIqYWEujyM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f3kBJ5273tSChDBkEjWk3+f3QAQK5FEPZmvI9q2yvL7pSsGPUU6RAwrSx2vDYEwtLjU4yKeaoTuWqJ32PTqW6u0a7VqRmHAtHoRO9iW8CvLP2cb72KhlfMc5dK8oMyWXYRQkPoTVI/necsuT/M2SlQ7SqBPG5lyedTzSBxu9aUGmY36ncHQ/sP/81UxHn75Ige/nCPE1AaNKqNzL6ACXX/CLpxBKT2y4zS2IP/YLPKXa9UMsjSxf6zsBeIgHzCAV04rc7Jwxs2t6XnBa/giM55KF9smgaJybdzOC5eF1/pKxuE6bz8Vl0j36L0VsJH98L6abzY+9U68k0bYDFE+ZTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Mz9Hmkgo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3rcb4zwckdkctthbylynvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Mz9Hmkgo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3rcb4zwckdkctthbylynvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPrP32nDMz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 04:37:11 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2164fad3792so163038645ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 09:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735925828; x=1736530628; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KIRcbYHGQmiiiWpSG/HYzoKu7yqD3/iQMyIqYWEujyM=;
        b=Mz9HmkgorqaExfMfI2dlWDsGQicMIUJqOs8c0lq1QXbqrP0GYEUvFRRYK5/QxQQQfC
         bDAyJ96O3gITfZJJVLZRtzrRQ0wqbyQRm0uXUfRj7kH3/a26ixWZcMuP5b/Jya/ljQ5i
         VWrtRYYelYmgXWsJLC/25LoR7IkdMTIkm29tj65Nh9HD4kTrPvkKwNBpcPF3ufAl/JBA
         YcdY1+gKD1Gfs7oj7ixxH6etaXRmKHA2Du2LyVrrmJd1ZCvXQBVEMmAMSgu05l4EUVni
         erlMAs8qMg4qMqv0ZJ5ZFpWx4ubVfJ1x2R5WG8Op0PhZXJY7wMTa9ux8e3TWmLVOvk51
         Cycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735925828; x=1736530628;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KIRcbYHGQmiiiWpSG/HYzoKu7yqD3/iQMyIqYWEujyM=;
        b=tiKMp/PXsFuCcOAoj61GMq6FIizteGzPJSTK2Cm9PHzl/JAQIDBOu6Kgw5H1fQCp93
         dN5OMD1apwoV2Rve5TRAj4Dt4iOyChvLqXzhnKGijQSXGYGFk0TNNcJzXy86+LmUHfXp
         K1jEBNfow0D9e4DXnmbvmxSQhHD0fqF9aEbesDgF8ChS5RfZQI34VOBRB2FEUDQSwKzn
         ctYD883s11/QviWLz6zbz7T649gvsYhR0UxJGE4Rw7vr6sdqaVX7yo7y19tBamW4BLw+
         TN99T73JNYEzPjLJbVLBjbnd3E9RUveE/56wWodzYxsZPueu6cRkgQs2DzcVMBSGD9Cq
         DtPg==
X-Gm-Message-State: AOJu0YxPEFYGd9C8gABZUUaJdxEVj48+vQNlo01VoqxeXXP3wqpKr/Xc
	Il9cpO5hXr4HS/aZ0/h7w6lljQewme/8pT8XJJO05dAgLhQHzIBAYc/cBqp04g+G6qT2A88O9pj
	up1amhg==
X-Google-Smtp-Source: AGHT+IGN8rfvyM0kzqkaoKk2IRtLNpQCxGFK/t3b2wn9lw4sVagsSV0vesavi1D1bZqcCHgcyY5k+8G0ghYs
X-Received: from pfba3.prod.google.com ([2002:a05:6a00:ac03:b0:725:ceac:b481])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:841e:b0:1e1:9f57:eacb
 with SMTP id adf61e73a8af0-1e5e0470415mr82396811637.14.1735925828172; Fri, 03
 Jan 2025 09:37:08 -0800 (PST)
Date: Fri, 03 Jan 2025 17:37:02 +0000
In-Reply-To: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
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
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250103-extended-modversions-v13-2-35d87c65ee04@google.com>
Subject: [PATCH v13 2/5] modpost: Produce extended MODVERSIONS information
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


