Return-Path: <linuxppc-dev+bounces-4540-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BB39FEB5D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 23:31:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YMW5Y2gvyz2ywy;
	Tue, 31 Dec 2024 09:30:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735597841;
	cv=none; b=BaISAmxZIEy1JMOa5/G7Hk4+tLcUScUKuEXYiqe2fGigmKCsg4iIpbZ2hb5kIDzbagBvaxTMCTrsCjYrdAEInWnVrSczzOSgO159thKR5DhFc4HAZz8Ke16O/u9iVWBUZ37KhLgIWMpTQGJBaZeNUVq/uhbSSns0QDHodwvRoNEGRSvoHhoIAz5cj3q5b0RdHWlR3sGAx1YZO6RkEGjwP8xTOMczZM8CkzFvRSmywH6eUjAyt7qBkgcUryGowrCv1kxLgAEYNS6VxBvvpt+QT9r0GYXicZQ+W1M2EqYloJq7UlAD34C4qdhff38OdCrGYVddArgu+N9Fq3OVUwoxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735597841; c=relaxed/relaxed;
	bh=7SdIG/Q/6InqG6fGpzelEgOUniqS646q8n2Ou3Fvqw0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cjLlYejxgpvZzW0HktDpjqb8mdcKD9ar3KSUllOp/aOfy9NibrlYMLM+5kmgdXEj1f5xVZh3QENg/uRa2ue4GYGDUTPcLs6iHOpiUjfiAYM1Iji+QN6Rbt57PO+4xzRcCGIspoq9rYIZMz56CwiqNM9MQV1cHHWT94zL0pmhmHbDuOe3kaxhtOCpovAk+DTbs1BW0jvxhgkHjwSfB/OKDMmbDKS38+sdePVINgf/hNjFblqE2+DejG/hGbIS6xfMcVq1Le8A9cSR/4H/GOLJyqnGnnKRea9XuI6sQpHEwIx7KX9eIzULWxAPrOvP83JzXwuWH8Bfnjf5AZWQDkokkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Y1QRcX4H; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3cx9zzwckdfgcc0kh4h6ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Y1QRcX4H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3cx9zzwckdfgcc0kh4h6ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YMW5T4tkXz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Dec 2024 09:30:36 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef6ef9ba3fso13217301a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 14:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735597835; x=1736202635; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SdIG/Q/6InqG6fGpzelEgOUniqS646q8n2Ou3Fvqw0=;
        b=Y1QRcX4H8nCgBus349sKDEK52b2hfdMujsnFpnLK7D19K/g+9tfZNZqpo7Oc5PEaz/
         FNh3mU/69bIIpd0St6hP/uzl1JMHr7Bby8BPNEk85zek2/ESNG+bd3FwlcsiqadHSp5K
         qQFKs8C+ySwP+Z/fa+Gk2Wlie841utVn3XwHhImF5NS10mjfB0jPa/JNsBcCNL+1E6Nh
         T9HHCMRvYkgePvb4cWGZtlYQnT7lTHa8/jV3v1FZyoPnZg8vCePcOITbga59r4s5uaq4
         qe85d1TaLVCO06pC/EEBmyOxTOcTlx8PibtVH4kS/jKRVf5MNRw3ZYeUD79kootH8BTb
         KdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735597835; x=1736202635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SdIG/Q/6InqG6fGpzelEgOUniqS646q8n2Ou3Fvqw0=;
        b=HXI/nI3s4sUEHk8+Co2LDU2Da5CwifSGpQEvlx+cBiFyOg/EBqeh3MeRmrHZYVqLJ4
         d8k2yG8ELgWyNxayseBvJvT5VOpZP75NjItKI9xl7O5/ucYL3QxsUkBxFa6dl0XWeSzb
         aN3cFovs1HlNKl/H+zGFLPo9UYSt4pAKtrSURJjPUD8PnR/jE1oN5ue/la0MtfxbgpCT
         jZtuGm88eh+OJzz50vuyo+LPV7kAn9XbMo7bvBtxkFTpy9h6NwFdMr/ubJ2Cm2Y8qtmY
         CPrvck+Lmg9LOwQVDEXG2hPCbY2dIECay6dma0gMwMXtzLt8oE8xGIVY7J1gIlI8eAUD
         wRGA==
X-Gm-Message-State: AOJu0YzL8BbnM0L1W0rtvYtZ1zAbEil9i70kFG5DDSNs9IGlVFDMTgOL
	SFpZikaZ9VwO/Ew8j9kmxKT7MWZVbttZFqEAh0h1wDA2SwxYjqY7XvGj8eKYUOGQpjigAz0shnD
	q+huecw==
X-Google-Smtp-Source: AGHT+IGi4L0DnioU3ViuOPQ9hdTSLKvrZaDYmzr68pUHr1qyZseGS+I94UFypBkIbr0Xh4WiRy55BOIz2PpM
X-Received: from pjbsq3.prod.google.com ([2002:a17:90b:5303:b0:2ea:6aa8:c4ad])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfc7:b0:2ee:b6c5:1def
 with SMTP id 98e67ed59e1d1-2f452def71bmr63227916a91.8.1735597835253; Mon, 30
 Dec 2024 14:30:35 -0800 (PST)
Date: Mon, 30 Dec 2024 22:30:30 +0000
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
Message-ID: <20241230-extended-modversions-v12-3-296a6a0f5151@google.com>
Subject: [PATCH v12 3/5] modules: Allow extended modversions without basic MODVERSIONS
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
allows easy creation of test modules to see how tooling will respond to
modules that only have the new format.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/Kconfig    | 15 +++++++++++++++
 scripts/Makefile.modpost |  1 +
 scripts/mod/modpost.c    |  9 +++++++--
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 9568b629a03ce8289d3f3597eefc66fc96445720..4538f3af63e1ca531d0f74ef45a6f5268e505aec 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -217,6 +217,21 @@ config EXTENDED_MODVERSIONS
 	  The most likely reason you would enable this is to enable Rust
 	  support. If unsure, say N.
 
+config BASIC_MODVERSIONS
+	bool "Basic Module Versioning Support"
+	depends on MODVERSIONS
+	default y
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
index 6324b30f6b97ac24dc517b9229f227c6c369f7d5..3784f1e08104dc2ca1da10d45ed92bb8adf4826a 100644
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
@@ -1856,7 +1858,7 @@ static void add_versions(struct buffer *b, struct module *mod)
 {
 	struct symbol *s;
 
-	if (!modversions)
+	if (!basic_modversions)
 		return;
 
 	buf_printf(b, "\n");
@@ -2176,7 +2178,7 @@ int main(int argc, char **argv)
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:x")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:xb")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2225,6 +2227,9 @@ int main(int argc, char **argv)
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


