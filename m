Return-Path: <linuxppc-dev+bounces-2737-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3359B7047
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2024 00:05:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xf2lc53N2z2xk7;
	Thu, 31 Oct 2024 10:05:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730329516;
	cv=none; b=mUdaX/+fUVI+dvoJxQkneJI3GxHnalsPKt06aRiOZ41GhFx0TTrOgEIIqTFm7NU2SjXuCnPL5T7bSSCVVV1xvsAVjQx0XGKacJB346w+lNhzp7VXSqGGUypzdlsEFYC5rJVj4Sc9HzoeVSWNzvEV+DkdUfLkdyYmpnRfZVfoge1jcqEjldtcG2+fw4NdwCHiebydYTqkIQzYXYQdVScD3NddWwaG6rUtgOoTeZiizh53mBaWAaQVr4OThAiFz9j0ggzcjZQ5gThlFqWzc6jOIQFcJY3kiTV9qZ9O15lUxwoIkp/pE37XJ1A1P7jwVQ/XiIQrhO+0iAvU/Mu6I/vOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730329516; c=relaxed/relaxed;
	bh=t+3KnK+Z0gtSs2Co5ku0tpPq/BkCZXZuUXUNlsOrMro=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LTnur5lkKdHysYIsukmmgjdFNIpLQTRSEhXWGR71SwK7mg5ORc1kWwoBiRhaGRrfuFT+EFVM0shJQQz3zw/rJ0j3n0Dmb8VAtFzWnlovpapesz4h8utXI/FuBemtBqP0g47ZIvO3Tzn68Lj3LUdek5WfRehpY2rNpGFgvKnXU/D26IcCvqULdwN3wKgQatv5HVcTKTN8uAmmmHGlSttlKsgHQqLY7WBbg7BzB/XplraBROcppt42J2otumhbFBQaJaBaZmRQRJAYo+4k/TshlApWahqg1J6v7i3yRX3NFhLoAilYhcJvFSFP0mPikkQo1HwVklvDMMLhQ79eqb0efg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qrL5gW7U; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3p7sizwckdogwwkebobqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qrL5gW7U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3p7sizwckdogwwkebobqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xf2lb0kdsz2yF7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 10:05:14 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e36cfed818so4899957b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 16:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730329511; x=1730934311; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t+3KnK+Z0gtSs2Co5ku0tpPq/BkCZXZuUXUNlsOrMro=;
        b=qrL5gW7UCkNdK8h08pea6TrOstp28ZU11hMnqxKFoUuErZSXUVNFwpU+fTIRcZPBCG
         i3WuFTz4G7DmPtmRcpuUohjLE8aHeQC2xkON6O1zNthrAi30IoNl6pQEpJfxIGnaAGGj
         UEQxHK8hxOXSdO7kpj8M8s9pODWNz+V1vob2U5JBIl5yRTzi6xFszmHIqFD5suTqnJxG
         3xTuPimVQ4qkrtktzRlEdqdweC1Es5A96BOrj5ubxsGvFiujlG1yh+j7SZ9Y+CxokTiX
         Cd5QhbgLuqsS654i3qTpj2Ll46cw6tyIac0UYLjTzXqLi9MCGuA4kY3iru9jIIW9kr4e
         rQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730329511; x=1730934311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+3KnK+Z0gtSs2Co5ku0tpPq/BkCZXZuUXUNlsOrMro=;
        b=QlZ2/seKPzfsFaFgBscgpvraAeHBmbWaE9K0w2ZFe+8+u8B81396DaTfSWpAlO5Q2y
         jVccXP4wLr1O9HZK/SpehAU9zgYhPQ0aFzSc9STH1CKb49dK+t/Nz1iAYN1XpbTsMEKS
         UFOFiN3PyrDmyQrvqOGzwjnnlnx+vk1/8TackT0kE54Iok8MczVN74+sTdmwFT2LKID0
         i/TCQHw2hJnGw13vbyvtwNMvST3nDGPF+rb2GULfrWzQzXW0d8IaW7v9uNKHujtGQwn7
         8Bg3ppY/UMHg+eszXR8q7oKskV9CP5U2pBy7PpKXcPsBX+lBiE+AFRMTos3vZDBNi4Lj
         S1TA==
X-Gm-Message-State: AOJu0YxmavIayaoTjWk1YNlCWNQTw3icYIeFuGyvd0p3kPRmZTwTx+2L
	WsgVb2aWoEXXw9viaczLLTfm9W0e9BfNuV4y71D4Ryogyo2s/Pl5gLwk5iwR+tN2GczVZWpjGaL
	iQd26Bw==
X-Google-Smtp-Source: AGHT+IFXDvQAF6rmmyjqCuHXp7247+2WzHwGzszYhdJsIGiPI6HKKDpKzPTAlySRxwxd3AE241ZoGZd587t3
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:d806:0:b0:663:ddc1:eab8 with SMTP id
 00721157ae682-6e9d8b0412emr4041757b3.4.1730329511025; Wed, 30 Oct 2024
 16:05:11 -0700 (PDT)
Date: Wed, 30 Oct 2024 23:05:04 +0000
In-Reply-To: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
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
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241030-extended-modversions-v8-3-93acdef62ce8@google.com>
Subject: [PATCH v8 3/3] rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS
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
 rust/Makefile | 33 +++++++++++++++++++++++++++++++--
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index c521e1421ad4abd80080bce8cf1c68389cb65c69..5e6d9868705ece2b2f6b90d7ce197a4d66240b6b 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1946,7 +1946,8 @@ config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
-	depends on !MODVERSIONS
+	select EXTENDED_MODVERSIONS if MODVERSIONS
+	depends on !MODVERSIONS || GENDWARFKSYMS
 	depends on !GCC_PLUGIN_RANDSTRUCT
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
diff --git a/rust/Makefile b/rust/Makefile
index b5e0a73b78f3e58fc8fb8c9fab8fb5792406c6d8..0e98590082a1ac88e6ee29c28ce1b1d19982ac10 100644
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
@@ -378,11 +379,36 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 		__ashlti3 __lshrti3
 endif
 
+ifdef CONFIG_MODVERSIONS
+cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
+	$(call rust_exports,$@,"%s\n",$$3) | \
+	scripts/gendwarfksyms/gendwarfksyms \
+		$(if $(KBUILD_GENDWARFKSYMS_STABLE), --stable) \
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
@@ -394,6 +420,7 @@ ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 $(obj)/core.o: scripts/target.json
 endif
 
+$(obj)/compiler_builtins.o: private skip_gendwarfksyms = 1
 $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
 $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 	+$(call if_changed_rule,rustc_library)
@@ -404,6 +431,7 @@ $(obj)/alloc.o: private rustc_target_flags = $(alloc-cfgs)
 $(obj)/alloc.o: $(RUST_LIB_SRC)/alloc/src/lib.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/build_error.o: private skip_gendwarfksyms = 1
 $(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
@@ -413,6 +441,7 @@ $(obj)/bindings.o: $(src)/bindings/lib.rs \
     $(obj)/bindings/bindings_helpers_generated.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/uapi.o: private skip_gendwarfksyms = 1
 $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/compiler_builtins.o \
     $(obj)/uapi/uapi_generated.rs FORCE

-- 
2.47.0.163.g1226f6d8fa-goog


