Return-Path: <linuxppc-dev+bounces-4461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 018599FB4EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 21:13:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YH8Nk6mgHz301x;
	Tue, 24 Dec 2024 07:13:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734984822;
	cv=none; b=jXxc7rfiQar2SlhmBVGa85tbJ93EiFKunSnI6iRDGomsYv9w6w7QuwM47ToMiYf8im3w57XHzzMtynmvx10Yg0nnNJ9S8mkb2/EU2lo/kS3QxQL7Z/tLcDzZwy1HOUWRAqx3XQoJFxyfpWpwZ3qGLxSoM738UToa/+4emLGdVynrnXPPzZfEGRCGSCzdbO6/VKKWYshej6Ep6ylki8YTpzNMqzT/QngTRn7No5JH6/jIEGsXRTyjdgvfZmdyzwne2sf60E4n1pSs7nbITsdK0r3GoHm65AzeviYcPmT3guQMAhgqC2rJm7C87PD+R34Fvs+UDvLnjvfnqQ88HLVkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734984822; c=relaxed/relaxed;
	bh=On1WZKdx98ADO/7Heas/21kozOIUfUi4pVgpzWkLyb8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VjdlBvIuValkpE5cPSkIik7MdLwk7zCebFAWSt0nuXh9FcqU32H+T7FcrK29+Rskc2J8fP51E3tfgRshwWWuYvPwvzOhfemBSbZVbk6DvP6/DKWsUVNokd+Kx5u1vzpday634qlCzaGN9WAKsdcJs9+/SEPAiL0rK8as7QBU3AqXcuoBdpRq2MuMY9TQCOZftQeTnNk6MWbTpNUtcDWxlrUXaDglLBLkqnfhzI32YaZvDdKan5ZnF/OGI+WcNHJJVjHkN4RexiZ1emsTVP1PxPOo1HPwYglj6Jh9wQ6NcA1Gpux+GpssTndkoH4V8oVK6dmwxJkFmoAOGm4HVDDeXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ovyimqx+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3c8rpzwckdoqssgaxkxmuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ovyimqx+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3c8rpzwckdoqssgaxkxmuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YH8Nh7193z2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 07:13:40 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ee3206466aso4716771a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 12:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734984819; x=1735589619; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=On1WZKdx98ADO/7Heas/21kozOIUfUi4pVgpzWkLyb8=;
        b=ovyimqx+hTcEGC7YQAdIrlUfNCF3rtRtAb0ORSj9OJGeuFvSjZsUVAMtWYcAPGeTkR
         0wEAJeC6lHbkHr8AuwOrv/BYpNVl0IkbgIbKwW1Gx5f+86QGn09YuADP6I2rNeCQfryA
         xymrvNIIWGbC3Ewagh+tsQRafkQb47auB7ERQgbU0gANqe/93xfCcg4SCd881QeeDZOW
         AMOJzktl8Wmj5cTfzR6KnZyKiq8eP4AfGiDh7FqRoAHM4JMi5aWZ8f88lOozsHsJ7OsD
         6o8rnxI/MvGJLPwE3rnaOP13ocWiyDxLt5o/vhEbz2ZnB9SeQrcNJXBTqk0N3HDs76SQ
         lzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734984819; x=1735589619;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=On1WZKdx98ADO/7Heas/21kozOIUfUi4pVgpzWkLyb8=;
        b=cEgiVBJ+1ntpBckSm4OhTHtORAY1qjbMHQyTX5qivYYDUmz++WfgPM0eGjhUscDwRN
         e9V99kPl1J0PIUO5gFtlycILbUy2qyQN5+JnhWY6wVaA6VUWGkF3tlUOaMRzQy5llW0v
         LXpojgAKpvHlr/gxiNuSI3K4mx9W8qzrGyqAI0gnbCG8MPO/E8Uf+zrmzgsVA1iQf08T
         3lsngaJbpndov1dWf7FfMMBKwL23deBJa7oicncczsDrfRLoWrVjYBge3jZ2q0Rw3f4H
         JwD+S13Vi1CmDbCsmXuKLoWUqe7/ZRUPTbhbRvVk7Th3a0cdhkM46sZp+BLyZlwM5bRE
         Yp+w==
X-Gm-Message-State: AOJu0YzDsNshtXkOKj9k+P7rOr6aPmed4m3Li7iKjAYzOW3jsULXRmrD
	z/mZK/I5Tt+x/nDFruD2Ntjma2T82OyKVsbvHEp8UJMaGwie/sudIkYu8Ty5Ms8qQk8PAli1BDj
	uMKDGfw==
X-Google-Smtp-Source: AGHT+IGE9QNRZS/47usgacyywk7VqHL13GPydkc9VQX1I2h7hJC6BSGbzv80ZSOChZmA73HolHBhU5N9WmQP
X-Received: from pfbay17.prod.google.com ([2002:a05:6a00:3011:b0:725:1ef3:c075])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3382:b0:1e1:9e9f:ae4
 with SMTP id adf61e73a8af0-1e5e1e87c5bmr17167226637.13.1734984819276; Mon, 23
 Dec 2024 12:13:39 -0800 (PST)
Date: Mon, 23 Dec 2024 20:13:32 +0000
In-Reply-To: <20241223-extended-modversions-v11-0-221d184ee9a7@google.com>
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
References: <20241223-extended-modversions-v11-0-221d184ee9a7@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241223-extended-modversions-v11-3-221d184ee9a7@google.com>
Subject: [PATCH v11 3/5] modules: Allow extended modversions without basic MODVERSIONS
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
index 9568b629a03ce8289d3f3597eefc66fc96445720..5f701391ab12c7d1b3ca496c9b3443c5a76a8745 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -217,6 +217,21 @@ config EXTENDED_MODVERSIONS
 	  The most likely reason you would enable this is to enable Rust
 	  support. If unsure, say N.
 
+config BASIC_MODVERSIONS
+	bool "Basic Module Versioning Support"
+	depends on MODVERSIONS
+	default MODVERSIONS
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
index c58f08681fc1e37929333ba3a3e0989c4db5a79d..d13d10bf534a4c15fa76fffb2a1dc9832bd0e95a 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -33,6 +33,8 @@ static bool module_enabled;
 static bool modversions;
 /* Is CONFIG_MODULE_SRCVERSION_ALL set? */
 static bool all_versions;
+/* Is CONFIG_BASIC_MODVERSIONS set? */
+static bool basic_modversions;
 /* Is CONFIG_EXTENDED_MODVERSIONS set? */
 static bool extended_modversions;
 /* If we are modposting external module set to 1 */
@@ -1823,10 +1825,8 @@ static void add_extended_versions(struct buffer *b, struct module *mod)
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
@@ -1840,8 +1840,8 @@ static void add_extended_versions(struct buffer *b, struct module *mod)
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
@@ -1859,7 +1859,7 @@ static void add_versions(struct buffer *b, struct module *mod)
 {
 	struct symbol *s;
 
-	if (!modversions)
+	if (!basic_modversions)
 		return;
 
 	buf_printf(b, "\n");
@@ -2179,7 +2179,7 @@ int main(int argc, char **argv)
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:x")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:xb")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2228,6 +2228,9 @@ int main(int argc, char **argv)
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
2.47.1.613.gc27f4b7a9f-goog


