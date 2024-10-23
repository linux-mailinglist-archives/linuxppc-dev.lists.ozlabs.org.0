Return-Path: <linuxppc-dev+bounces-2493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F009ABB87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 04:31:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYCjX6Swxz2xrv;
	Wed, 23 Oct 2024 13:31:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729650704;
	cv=none; b=EWNeB9fUDAB8MyGLsv/2+uLuxGgnOydPFf27P8iLDW4E2Vjdtkd0uIjl0kbJzTMeIGctLNnSfhbhAY1vBthpSZzhPNGf5BlFsuYRaBRiWvpaJPw6LF7dl8zLZs19NVzRRGTpdZ1+XEOOfeumkhQKmssnroDwYqKshQm55c08/0p/EnDLMBJ3MmyxTbMPPtkUs/lQXPKyaps8kqe1aG/mnzKmgvUnqSe0zqJM9YOfhEwMHIHlho/bHo9BHP0IyJ8kFmRi510Inzp7+r/+TvsyghCA2377m0XVSyAYrIT1UAWtb2PAmKLuzluhKcmbJ7UGTx+plC62priCc9E9hmt4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729650704; c=relaxed/relaxed;
	bh=YVm76pegvjtsU2eVkCp0KUVvIC3D2L+QTQ/qD8J0RGc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ct5yKA7sPMqm+A4Db7HftuLKJmBYYcI3S9c8YUJdkBTOxB6u+kaFAXxHYJVtISctcU7PIBGw8dWglIfBUy0W5AfV1VW8TD9ZDLIr9cncsaCRuQExX7PTjoyBq4rJs5sKWofJYLfqz4FOnhTZQw721uOZGEft2KYaSZUvYR3cyBQXnMSoRhd3tLknxrrMGd7u8fSGZZNbh4lVuR3dXN7SmQk/0dIma2a6d7QdUuZhowNGqtqlEq1gNTo63ks8k6his+/zTRjPemcORjDn8rLdEdi9ThzmLxJ1vdjWj49XuQvBdLB3Y1/i+AGbKlJoYJavwv5BfX7vZlYGoR+QKNwsLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=oFo+qbpR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3dgayzwckdg0xxlfcpcrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=oFo+qbpR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3dgayzwckdg0xxlfcpcrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYCjV707sz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 13:31:42 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e5bdb9244eso85720697b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 19:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729650701; x=1730255501; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YVm76pegvjtsU2eVkCp0KUVvIC3D2L+QTQ/qD8J0RGc=;
        b=oFo+qbpRDX21jRpYDx9hf+/qYYHA0pW+v42ctXaTWLPhXOu8RD9Ataj+u3z/R0sAD+
         QJbHCrOT9/ScA/V2Ijk0CLlxMdry9VMaqR3F+F6RokOBw8ok1841FlyivLBy/1kMcxEp
         az8olLpnfLNaAyKNfKxjV4c5WM+koo7igl/1s/4KVI78eE5fwO9tTK3WoqyAjur/MsBi
         RjDcG8ojNy2WHaMnnZ2MmmVWJBc3tf5kL77Gd+0ADQ7rToewN3nMRo9wibb4WIuCQr2v
         sLIWzkfuA7xAONMW56K9A8Fl0g0SXBlOO9jh0SoNhUDOSDolNWpmcsZLKZeufwnLLtTa
         LUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729650701; x=1730255501;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVm76pegvjtsU2eVkCp0KUVvIC3D2L+QTQ/qD8J0RGc=;
        b=DcwIVWgs/x6yVmOU9whbAp4MGiKrRe++eDBSI7m50YBV2/TbGY74DUh2BK/T94YjxN
         Bg5czkiHuhqeRa+B2dAuDDP1Nfw7ml9EK1RX8i1Ek2EKJNqG/96u0zOZkxghJ/GigGYx
         Yd33bq+77uiBuPTMaMNkxTTruCiyf1GrpcJ4WVYAua1oCdM0Vqh2LyIU9hcQWloK9gEb
         BJ3l9Ab8jcStRHZuxMiiX7URXFJuvTb+vLBwS5sibPrHNH1z27YIghZUwFxbX9AwT27Q
         iQ9OZqrJJQuTTx1lFaBQSp7YwbsCl96FLG7GhPEu7Z9LfAIbRLIIJhEoaOrd9UV01HFX
         crVg==
X-Gm-Message-State: AOJu0YxMAWqABvqmSZ0pmuc48eVuWI/Ac3etTpJ5/qmoN2H/zGrsSLDE
	PBAjqa+VwbnEUpA7K6Q4Nf5lIuEGpRxIbTjP+ub4LIfroObkoY8O7+IDwTj7nSY5ZHKZMgFYSo0
	x67LRfg==
X-Google-Smtp-Source: AGHT+IEAkeaejmFNh7AdweUswVgSnsnPXI+PIy2hRogub8V/yCkXh4Je5UqAMfghNt8CcH8kkBRMSxNOEULS
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:25c9:b0:6e6:38:8567 with SMTP id
 00721157ae682-6e7f0fdb1ecmr462847b3.8.1729650700838; Tue, 22 Oct 2024
 19:31:40 -0700 (PDT)
Date: Wed, 23 Oct 2024 02:31:30 +0000
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
Message-ID: <20241023-extended-modversions-v7-3-339787b43373@google.com>
Subject: [PATCH v7 3/3] rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS
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

From: Sami Tolvanen <samitolvanen@google.com>

Previously, two things stopped Rust from using MODVERSIONS:
1. Rust symbols are occasionally too long to be represented in the
   original versions table
2. Rust types cannot be properly hashed by the existing genksyms
   approach because:
	* Looking up type definitions in Rust is more complex than C
	* Type layout is potentially dependent on the compiler in Rust,
	  not just the source type declaration.

CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS, allow
it to do so by selecting both features.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Co-developed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 init/Kconfig  |  3 ++-
 rust/Makefile | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 530a382ee0feb391b4717abdba3672e584a462d0..f5cce579f29b2ed89e97f8075a3bf70e32e71ad0 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1942,7 +1942,8 @@ config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
-	depends on !MODVERSIONS
+	select EXTENDED_MODVERSIONS if MODVERSIONS
+	depends on (GENDWARFKSYMS || !MODVERSIONS)
 	depends on !GCC_PLUGIN_RANDSTRUCT
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
diff --git a/rust/Makefile b/rust/Makefile
index b5e0a73b78f3e58fc8fb8c9fab8fb5792406c6d8..b80bc4eb98202f774c493da89c2caee322cffc91 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -303,10 +303,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
 	$(call if_changed_dep,bindgen)
 
+rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ { printf $(2),$(3) }'
+
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
-	$(NM) -p --defined-only $< \
-		| awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
+	$(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) > $@
 
 $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
 	$(call if_changed,exports)
@@ -378,11 +379,35 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 		__ashlti3 __lshrti3
 endif
 
+ifdef CONFIG_MODVERSIONS
+cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
+	$(call rust_exports,$@,"%s\n",$$3) | \
+	scripts/gendwarfksyms/gendwarfksyms \
+		$(if $(KBUILD_SYMTYPES), --symtypes $(@:.o=.symtypes),) \
+		$@ >> $(dot-target).cmd)
+endif
+
 define rule_rustc_library
 	$(call cmd_and_fixdep,rustc_library)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gendwarfksyms)
 endef
 
+define rule_rust_cc_library
+	$(call if_changed_rule,cc_o_c)
+	$(call cmd,force_checksrc)
+	$(call cmd,gendwarfksyms)
+endef
+
+# helpers.o uses the same export mechanism as Rust libraries, so ensure symbol
+# versions are calculated for the helpers too.
+$(obj)/helpers/helpers.o: $(src)/helpers/helpers.c $(recordmcount_source) FORCE
+	+$(call if_changed_rule,rust_cc_library)
+
+# Disable symbol versioning for exports.o to avoid conflicts with the actual
+# symbol versions generated from Rust objects.
+$(obj)/exports.o: private skip_gendwarfksyms = 1
+
 $(obj)/core.o: private skip_clippy = 1
 $(obj)/core.o: private skip_flags = -Wunreachable_pub
 $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
@@ -394,6 +419,7 @@ ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 $(obj)/core.o: scripts/target.json
 endif
 
+$(obj)/compiler_builtins.o: private skip_gendwarfksyms = 1
 $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
 $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 	+$(call if_changed_rule,rustc_library)
@@ -404,6 +430,7 @@ $(obj)/alloc.o: private rustc_target_flags = $(alloc-cfgs)
 $(obj)/alloc.o: $(RUST_LIB_SRC)/alloc/src/lib.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/build_error.o: private skip_gendwarfksyms = 1
 $(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
@@ -413,6 +440,7 @@ $(obj)/bindings.o: $(src)/bindings/lib.rs \
     $(obj)/bindings/bindings_helpers_generated.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/uapi.o: private skip_gendwarfksyms = 1
 $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/compiler_builtins.o \
     $(obj)/uapi/uapi_generated.rs FORCE

-- 
2.47.0.105.g07ac214952-goog


