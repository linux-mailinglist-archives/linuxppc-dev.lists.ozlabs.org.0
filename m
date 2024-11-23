Return-Path: <linuxppc-dev+bounces-3510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEF99D66C2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2024 01:19:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XwCJZ5fXBz2yVX;
	Sat, 23 Nov 2024 11:19:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732321166;
	cv=none; b=KGH7T6cvLTh3TUwb7H4vi2eIcO6gIGuUS5YTIeRuvmxQYoSKKNfOtMeO3v8UEpAQwf5F4est5nAefw0F4GNVkwK/f41zAFfApmMr26WvN4j0U/zjrfv9jA8LcUEZVnr6vQUEa94ZKA5roOuHgEKkBpbJB7X6CfuauIxYNShURe4CGzMdJJ8eyMb8xLvFkfHbHRHn0+H6hLkrPYWUeB7QAlJkiF5RigkEidRBxTcRmo5N7lq3i940kjbT5rGxRFWZjqdO8sEJClLVWMc2YAdoqfPe5oWLRzJvLksCJVXW94I4+1IuWF47d91f4eap5+8TUI/v70HVawK6MUphfvB8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732321166; c=relaxed/relaxed;
	bh=AGHbLLYrxflWFAyRL+X6Y3k1G4gJ9BGqllsnUNJ/Q14=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ld5W48M1TJS7gBC9RltFrRjJtXPsRSsAYCWUtRvTZ+49IfGLh0e+DGgRMpWlkD5FU+SUQZTTFaczOdYj8yqCcfpbrGgzZ01jn7zfw5iYfTW5MpVXE6DcBwMu1wJuXp5mRUFH1pMe6OIfIqDeyccmgtKT17+HLsTzR6W6IaHpG85NcO9F6nxa/28YzmoKv7bcG0SZ9mZTnBM5WjuBimvIU9TuJNovOrwaoNYo/MyRrIsN96nzkv4rZf++7ba6TljZEeDE7wFYgxJi/71TfVomQAD4ohjWf0phVoWLzdV9OeCCKHo0017B1WVKdXlQkfMKttezJPj7ZaMQ2k+KdSIJgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tDn+H5wj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3ih9bzwckda811p96t6v33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tDn+H5wj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3ih9bzwckda811p96t6v33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XwCJY33pKz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 11:19:24 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea258fe4b6so64132887b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 16:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732321163; x=1732925963; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AGHbLLYrxflWFAyRL+X6Y3k1G4gJ9BGqllsnUNJ/Q14=;
        b=tDn+H5wjeOuAb/jbBfx6IUPHcVrL/dsgwhTT9KsVJ7QPxNyl142vFACZi5Y+EGJ8Z8
         ILihzpmgmDwVT1Csrd1df0uNvlkIz0ATv4CNBRmCWtBKkOY+oWrlXm0+ffSm5ijxLnxb
         2GMBCgBEUwpq1p4yfgDKjXxVwqJTn91dZiR5ItYrhcMHFGdbyBxMFF0jnXey24r4WgrY
         lUahEIBSx6eEHUaBb7X3ZukN5mdBTb1HICG12jhNmGFWdbBJf/HeQV8gb7LWubYC2Awq
         jzls1pExAA9+NzqzZP3c/p20OG+lrNhuYTt2U8eFmAY0S7honxp9LrSHC87Ob85T4RaW
         JfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732321163; x=1732925963;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGHbLLYrxflWFAyRL+X6Y3k1G4gJ9BGqllsnUNJ/Q14=;
        b=Rn7zYFq7BDmNEehP2RzOGiFANl+lUAdx/COXyE4/cmsApPlJdSQWvlLYegWMxJuMfA
         ds6ybVD5xB1EuBLFhbm2hfUVsBkpXKShP+9vf2ib/zdtEG5hR8eBq14wgFvFr1DGA7OI
         KZ2K2NFNfO3/hXJsl/XK3872YEQnDo2SaPlOekt7qOpuCNq2HOQmynbds8Un5CZh2dNu
         g8Ck8MSKU8maIgKvB5tPnTW03YyijDUmUW8cqr0ctfWNiKekSnWh9tftTTBSnTxyZbhZ
         fYiBUNC0wY8lvFN9OQp4q8xI2duYnvGBF+HvZnBPrn8WEqCvDCdJwnYrcyKfjlBpbmnx
         Omgg==
X-Gm-Message-State: AOJu0Ywaio0Te7ru1kttkUbyojgbHIRBh/EyObt335dGmPv4NCwqRqpl
	+P9jjcKsshe9GLUjJ5GpTdocUf+Uvv1GeQiKeNZmrVZJWPQ5AzzFJcrWDVQFAR6thVEujmF39wi
	N3iP6Qw==
X-Google-Smtp-Source: AGHT+IEtK1/wRGyl0Pc7FSLfwBs7O3ptOYSzb8Nq4J6ksG2wF/qf3EUyEy1i+1nN2DSPI99CUH2s5glJvJGe
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:6dd6:0:b0:e30:d61e:b110 with SMTP id
 3f1490d57ef6-e38f8ba279amr6573276.5.1732321162811; Fri, 22 Nov 2024 16:19:22
 -0800 (PST)
Date: Sat, 23 Nov 2024 00:19:00 +0000
In-Reply-To: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
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
References: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241123-extended-modversions-v9-3-bc0403f054bf@google.com>
Subject: [PATCH v9 3/5] modules: Allow extended modversions without basic MODVERSIONS
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

If you know that your kernel modules will only ever be loaded by a newer
kernel, you can disable BASIC_MODVERSIONS to save space. This also
allows easy creation of test modules to seee how tooling will respond to
modules that only have the new format.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/Kconfig    | 15 +++++++++++++++
 scripts/Makefile.modpost |  1 +
 scripts/mod/modpost.c    | 19 +++++++++++--------
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index a31c617cd67d3d66b24d2fba34cbd5cc9c53ab78..f28b361494c4b4cc2446d683589f9452a0043b2b 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -161,6 +161,7 @@ config MODULE_UNLOAD_TAINT_TRACKING
 config MODVERSIONS
 	bool "Module versioning support"
 	depends on !COMPILE_TEST
+	selects BASIC_MODVERSIONS
 	help
 	  Usually, you have to use modules compiled with your kernel.
 	  Saying Y here makes it sometimes possible to use modules
@@ -218,6 +219,20 @@ config EXTENDED_MODVERSIONS
 	  The most likely reason you would enable this is to enable Rust
 	  support. If unsure, say N.
 
+config BASIC_MODVERSIONS
+	bool "Basic Module Versioning Support"
+	depends on MODVERSIONS
+	help
+	  This enables basic MODVERSIONS support, allowing older tools or
+	  kernels to potentially load modules.
+
+	  Disabling this may cause older `modprobe` or `kmod` to be unable
+	  to read MODVERSIONS information from built modules. With this
+	  disabled, older kernels may treat this module as unversioned.
+
+	  This is enabled by default when MODVERSIONS are enabled.
+	  If unsure, say Y.
+
 config MODULE_SRCVERSION_ALL
 	bool "Source checksum for all modules"
 	help
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 40426fc6350985780c0092beb49c6cc29b9eff62..d7d45067d08b94a82451d66a64eae29b6826e139 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -43,6 +43,7 @@ MODPOST = $(objtree)/scripts/mod/modpost
 modpost-args =										\
 	$(if $(CONFIG_MODULES),-M)							\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
+	$(if $(CONFIG_BASIC_MODVERSIONS),-b)						\
 	$(if $(CONFIG_EXTENDED_MODVERSIONS),-x)						\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index bd38f33fd41fbd98bce34f8924b2fb0ac04297ee..ed52f9aa45a490bba706ffb2caa3e238e4697814 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -32,6 +32,8 @@ static bool module_enabled;
 static bool modversions;
 /* Is CONFIG_MODULE_SRCVERSION_ALL set? */
 static bool all_versions;
+/* Is CONFIG_BASIC_MODVERSIONS set? */
+static bool basic_modversions;
 /* Is CONFIG_EXTENDED_MODVERSIONS set? */
 static bool extended_modversions;
 /* If we are modposting external module set to 1 */
@@ -1836,10 +1838,8 @@ static void add_extended_versions(struct buffer *b, struct module *mod)
 		if (!s->module)
 			continue;
 		if (!s->crc_valid) {
-			/*
-			 * We already warned on this when producing the legacy
-			 * modversions table.
-			 */
+			warn("\"%s\" [%s.ko] has no CRC!\n",
+				s->name, mod->name);
 			continue;
 		}
 		buf_printf(b, "\t%#8x,\n", s->crc);
@@ -1853,8 +1853,8 @@ static void add_extended_versions(struct buffer *b, struct module *mod)
 			continue;
 		if (!s->crc_valid) {
 			/*
-			 * We already warned on this when producing the legacy
-			 * modversions table.
+			 * We already warned on this when producing the crc
+			 * table.
 			 * We need to skip its name too, as the indexes in
 			 * both tables need to align.
 			 */
@@ -1872,7 +1872,7 @@ static void add_versions(struct buffer *b, struct module *mod)
 {
 	struct symbol *s;
 
-	if (!modversions)
+	if (!basic_modversions)
 		return;
 
 	buf_printf(b, "\n");
@@ -2184,7 +2184,7 @@ int main(int argc, char **argv)
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:x")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:xb")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2233,6 +2233,9 @@ int main(int argc, char **argv)
 		case 'd':
 			missing_namespace_deps = optarg;
 			break;
+		case 'b':
+			basic_modversions = true;
+			break;
 		case 'x':
 			extended_modversions = true;
 			break;

-- 
2.47.0.371.ga323438b13-goog


