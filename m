Return-Path: <linuxppc-dev+bounces-4648-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DDCA00CD5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 18:37:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPrP53zl8z30W7;
	Sat,  4 Jan 2025 04:37:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735925833;
	cv=none; b=D2JFZ9UH6Er2Xqk5HbRXL+LgCdYkDiN6dXz2oV3L23R26U/Bfs3oO2n79V+cXdnzo4TfxNDGSkasa1yOJF6odDnN3NJj/037gHvf58FIxiKg9xNmxo/d39A1+6MiUzj0q13Qpnl+keoiYr4DXWgp21IrrdqCfckZzRNzRUn2Ex85kGwNvUAdk2hulQBrBNWAYKqSlmYhR75ulbWPZTPmCglZRF7/miFWSxOOsp4+GieVip12ksV/cHJFVNeOR2y/19eoSG4Y0w52wahb3rj9ffHZX9GzNxhs0ktTz+DD4CLf3cfIkcPfIBAXA61vny6MLSYaFMLOvThOVm1N0AeaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735925833; c=relaxed/relaxed;
	bh=7SdIG/Q/6InqG6fGpzelEgOUniqS646q8n2Ou3Fvqw0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xrg/7fwhSbzuRnK8vmtIES7qGboFGLMvvm//zcWVVQbqWEUFaxwJhTzmDqcC1/0Uo8KVw4JdfxEQLkfTjGbEHBdhYyWZ5KQSBxBeSNGL/ao1f/cf42d06lWmJPp+qTY1ScAKstCrsaAkwNVewDpfplwWKnD6WguXz+pwyjePXIBztGW8+t9GpAl4iHPWsetFHXUDvPpSf/lJLMU6NFoQzxVR2/85paBIR1TFMukqO+3O6v9TaJ8U9lFxVsnhnkpUtnmEc1OngOFwhuNIkk9MZoMKgHmZ/kvfiAlTsgyEtxVK2ofO/apdvO7W3ASEt3pECR1ZPGtZ6ajxSiNuiA12GQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BwlDGX/i; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3rsb4zwckdkguuiczmzowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BwlDGX/i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3rsb4zwckdkguuiczmzowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPrP33M8Vz30Vm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 04:37:11 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-216405eea1fso160267935ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 09:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735925830; x=1736530630; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SdIG/Q/6InqG6fGpzelEgOUniqS646q8n2Ou3Fvqw0=;
        b=BwlDGX/iCIM2XDESuZdXwKm4Pz4ENLd5aZGhAjuWlmcVofrNMWl8/+75pm3biEk9xL
         Rt+pi8bmHm5UA9yV+oeTr3k4AIeDT+fimsJPGU/rItzONdxeCHPC8xOlAqg9tJW7NtXS
         yLRFv96zllPrzmG/U1ewBX9WVP12SspYj7ICt9R6J1eQcRD6P05jzqq5f7mdPf2Mj47P
         cAF3Vysj6/a//CDIRdxudvnWBdhC44Ye5OyyQ6PYq2DQfVtrW3KXTbgrNSqWHUAutbM4
         hoKgcBQN7oMZMkEUaTuwFMM32rIeSiMOzLGdNAffHzw+0rz79nWN2vEzagKfcgGW4aFb
         KimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735925830; x=1736530630;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SdIG/Q/6InqG6fGpzelEgOUniqS646q8n2Ou3Fvqw0=;
        b=RXOb+dz/Nlqr4mYr+X9lMEH1h2H9y2/726k/eXYaRUuBHjvOEsqXOHUYQJeDrWv1Xr
         OQw8vJ2r/53E6VYKO54jfG3P3C1tuVFwziJ8/+ixWhBDQArrbvdBMt/2B/RDSqXi3lR7
         U4LqYOevYCOphMw5ipE7o63vV4OaAxj5m+wSI4kiZ9upBbPE1nVDrQu1EatLkoXtqf77
         t8bwuzBigZYadrioK/+U7uJJM4lcHjiH3XKMA5jAPKWnIUwWiwKxadaRSEkVQb1xgxbr
         mMrHKZYDsN3W2QY3szVtkhfbKfXlAuM450hV6xymLhItb43S2IxCriKSqkkeptkoHAcQ
         3O9g==
X-Gm-Message-State: AOJu0YwQxUyLBA0mgztTmjHG9E1vJdpt/2oBnHo/bUBCj+xmjiSvPK0i
	X2+5N1PBKXnCn6B9i0iTFdvAP6pdY+Xf5Hqhnsvo7y3gpvmkxgog8aTZRUmYbWVZArZ7AAuoGi3
	IcGOgjQ==
X-Google-Smtp-Source: AGHT+IFrtYrresc72g1EPbVSjnnAxbZgASkfGLXtNRuZVoaMhZSpsR5pVXgEh5K9AwTzrhB2vL2Vl0V3UGWc
X-Received: from pfbbw14.prod.google.com ([2002:a05:6a00:408e:b0:725:de13:91b6])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3189:b0:1e1:ab8b:dda1
 with SMTP id adf61e73a8af0-1e5e080c4a2mr86778339637.35.1735925829742; Fri, 03
 Jan 2025 09:37:09 -0800 (PST)
Date: Fri, 03 Jan 2025 17:37:03 +0000
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
Message-ID: <20250103-extended-modversions-v13-3-35d87c65ee04@google.com>
Subject: [PATCH v13 3/5] modules: Allow extended modversions without basic MODVERSIONS
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


