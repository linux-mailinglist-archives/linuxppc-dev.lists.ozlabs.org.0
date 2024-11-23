Return-Path: <linuxppc-dev+bounces-3518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A75379D6744
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2024 03:42:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XwGTY3mZRz2yZ7;
	Sat, 23 Nov 2024 13:42:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732329745;
	cv=none; b=ZiNuALJNa0RdwU5Ot5uR+I+2c6YCJyVKKAMrFnzmOLygJXRpdtJsnxDPKRb1VYvdDa4o3az5Fc8c/eKdGty1R4AEubwWAuYWcEZwVqodR1ydxl1LPftaX/mzAoigPmtJ2KKMYODZuILQmSmA7/dvw6GHqaKEqsG653bTz1LZkOyPqk9CY8EXh8mzK5rQaKPu3HCH84wuziC6MtLJdaP1CPq1b7vQIhdPlw6dCvb0Po0lda6k3RmAidUfA+DtdeMWVk7DQtuxvF59JVBH+bRnLp9sCVbECyqocsaQWnk481HuMnHz4+kTDiCASl6x1KMX0apZmJwRGFZnoeh0FrhxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732329745; c=relaxed/relaxed;
	bh=qjZqp4IoL0KyqiTVwJH117KupI+sKpsSnEXGEf7A6k8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e8UTBsFWidF1j1YO3R5oMgBTt/Z7+38lTtQYPJEVQZ94n7+r8bLFvWp4x/ZGe248jq6l6zIrTsh94jHsushetsgnPTgcGiua84cXobOlZ4Y1U0HFyqPa9pnzAbCNip/0ZcixHrJZZJ6j9GNu3vrdMrT8WhbgLrPiIjFRt+slkHTvocyVD/5dQ0m2Naisnvq+dMQNPWUkMxDQ5VDnGloaTz+0sxmoasp+9/LEtui6RsTF2XRBGvXEIuwyaD1ZDGNE2aqICCD4c6UpnW1cg+fMPui6UBapXVapbDhkIyQ/eSSoaeExLTVdHfZI3DIUtDTzsCRUv7pASuopVOXXX2NWsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qDDmV2G/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3dkfbzwckdnudd1li5i7ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qDDmV2G/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3dkfbzwckdnudd1li5i7ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XwGTX4nbkz2yKD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 13:42:24 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ee7ccc0286so48749367b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 18:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732329742; x=1732934542; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjZqp4IoL0KyqiTVwJH117KupI+sKpsSnEXGEf7A6k8=;
        b=qDDmV2G/hYkA0jmu8gvmop+ogGZDAvbaIQV6Q7ep93V3o4ZS+zYGi1O1s96Vit3Erf
         oKs2ZsTC3qrW09bG0m+T3TikbJr+1cqpXUWmF7+0aITNMKNcjC7zsGDU2shzKegJIoEz
         RIjO7bvenC/6No/pN5XlYhzEkmNPupWz/piH+6nZ1XvJOxxfqMWiQXo41pj1f6j1YC7z
         eqnVUrI5nO7Yi7Fyu4uTBbhBh4NYwwaEu2gf5VBlo8OTNiP962H7F+uzMkDVg7EfFZdn
         2lD0+3L/6V5fdocFb9zMVHqDHsxJezCJg7Kx5zHL6EF6c3Nb0tuhklNIXKZt3P1Fupwe
         VaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732329742; x=1732934542;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjZqp4IoL0KyqiTVwJH117KupI+sKpsSnEXGEf7A6k8=;
        b=o6uDozPnGCBf5Zx3XUmGYK5zBtlofSIU18A6ae3QxyjZfRFVM9Qt6I57iCJYm/KgAC
         ox8mMoltlexDdyQzC74vZgTWnnCCDeEI/CTt51iFpyh9B4p65LMhDUtNYrBDrsMBvCyw
         ake6KWAuFrhYwAiNFIH79unSHRc7Ww+ZPPWBZ/Otu6Nb4n0FffZ8tjCoRydCmHPEFSch
         EX+bwRe9qoZXd1SQxrY5N8HPQxr8ABQh4WYS8t4Xzrf8v9riUj+fa5BO18mPdHrXiNmh
         xBS4ZLrsAIsbPufMpEn0zdlmxkdaYuqZKSUO0jMUETubh7QFOd1JPoyNg1spwldpon9p
         C9vw==
X-Gm-Message-State: AOJu0YxKYBUvBOZnDT3u3VJH1vE8l7SXhvWMmWXqWhsY9Ds5XlImpraV
	6wF7BOEjLUH0+vh/cE7XseBRQ2kcr6L0cQPn6MvjidSNIgUHt6ZSDwjPmj4n1IXoFSGj3X7U4fg
	2JGBYmQ==
X-Google-Smtp-Source: AGHT+IEYfeF7tWWhEOHN9DEuYSPktxzlkbMWxVRw/ZgbuKKnn0fgAzmvVNJdek/aWY1ojtQn6DCYmI3h6IPQ
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:2e90:b0:6e3:f32:5fc8 with SMTP id
 00721157ae682-6eee089340fmr281427b3.1.1732329742509; Fri, 22 Nov 2024
 18:42:22 -0800 (PST)
Date: Sat, 23 Nov 2024 02:42:17 +0000
In-Reply-To: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
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
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241123-extended-modversions-v10-3-0fa754ffdee3@google.com>
Subject: [PATCH v10 3/5] modules: Allow extended modversions without basic MODVERSIONS
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
index a31c617cd67d3d66b24d2fba34cbd5cc9c53ab78..35545bc1d96016f95fe4e95e8876159a4a4d616d 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -218,6 +218,21 @@ config EXTENDED_MODVERSIONS
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


