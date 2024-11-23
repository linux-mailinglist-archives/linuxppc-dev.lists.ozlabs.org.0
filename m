Return-Path: <linuxppc-dev+bounces-3520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 027359D674B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2024 03:43:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XwGTd0t3gz301w;
	Sat, 23 Nov 2024 13:42:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732329749;
	cv=none; b=EMT/kDeBuxYf/LAwVYgZqLTsrMT0msKvLOPDx6SD9DTM8guCXYVA4Um164RqkoAfbhjz06W7jcduZCn2v/i2rvQ+bLTnArVGi6RGyr7NSeB+md35Y48eS0NMmP5AWYjN/CZRH0Jp413LyZIu/4CoOBS26D1vf/WJUC1Ve0obU+FjEQs0qQzbQpzl07REcKWYVvGJImoIrRc9wMtWOzR/3KTfGDzcCCTEGiQjVthrsAhk/fhxa4e32fEFeCbZozRieOO/H9a2cQLZpuIUxBaXUKKLaNm4TJj490ChTuv9Us9WJoXdVJ8luvsAUxT4S4w8sd0JwCkwfft+SXSZ4OSuOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732329749; c=relaxed/relaxed;
	bh=D3SgXuWoWK4BO6s3M/0azb/Xt7N95+oJhCSHs7onn8k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cJIZ8PyR3gJGwBwBEql64KZgfB/Lz2LZ7ZkJRQ1SyAMB9cU7wj+0f0Dlkur+rKXFn7qIQB8CSEkuHzNfGRljlAmJdgm0ARzWFkSMldBWlRBBIPHpI5rdsgGSIBHBN1Xyih9cF9uNAei1STtmvrkNULiXgDICxtr8A+9xqb6Lz+ToPY6GvVJdmSZRbrEyrm05zoIjhnvu6J8Q6DMu89scRYkXmh5Gdi1LyXlU5tFZGNxxtiQKlt6bMs5JIkUBcywFt283ANFH1/aIhUR6RzvKSndPdvxTHDTo6QspMwyIPltaKoFUAXDa2+dpeLHrhubOy0543bp6lckZwoxDdJt6OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=glPKFMvc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3eufbzwckdnggg4ol8laiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=glPKFMvc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3eufbzwckdnggg4ol8laiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XwGTb4WRgz2yKD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 13:42:27 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ee86f21b2cso50128047b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 18:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732329746; x=1732934546; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D3SgXuWoWK4BO6s3M/0azb/Xt7N95+oJhCSHs7onn8k=;
        b=glPKFMvcZlISce4Y9m0gU54bVYp5+BbrY8lVH6BvYIAwkxeESquRuLXm0AiTxuEHn8
         0SF956mhZrXL1zjPGdPv/YcCmkXcS32vUT3E9skP3Hic2WECWPJZJhOSiF2EbRgTeY0p
         +pfYZF7mEbwHFJZyAPbfoaBA+TwDJkBHNeRNcXj/CUfG9nKHOcKUMEsDuZmkFSpKa3TO
         6qXO0LGWqSzpJ2p3hV3h3vv9i5jBP4rj1034ru1HwR7vdTdYMS/KwdypiTo0mTZrcGTA
         KKSVoMVaEE+d902nkyRReQo9JdJW/79Q+zX/v423bZk0CMnalxDLT1eaKCzy6PXglUnx
         oEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732329746; x=1732934546;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3SgXuWoWK4BO6s3M/0azb/Xt7N95+oJhCSHs7onn8k=;
        b=kSA5n/U7zrc3fzfKpIisu6bWJF8kh4v3WUQ4nRHBiZPRmEyYd6skSb3aSLfaI5CiRi
         37308PLWMH9/KbM0JC7WfGovmWWAVWuXBTk/MJ7dkjxtFLN6FePwFs4yo9aqQ4ZTs7I+
         G2Q9Pcy+tfGb/RSZFTEwVSffwlSHPGKBxvHisehQlty4JrLc/xaLyvgvDOax7bnoWBLD
         k/RTxThxJ1hc6C0H68YbB8oLDjqDXCeLbNmmgYnuxxPIKJG9MM53zWDJMnWBiioK8nVE
         BxKvVQsLEhTlorM1nijaWq1HaBbHv4EC9vu6T/708p50K3rHDonLRKr/gxnnQylhB9jA
         b/uA==
X-Gm-Message-State: AOJu0YwPfw9OQ2YIL3egUdgjSzgPY8hHArlhXr9jOOSo3Xt6vRDvLmKC
	l8N3GRmZ5lACSSk0uWI7JcBwabD4EFMFud3ptotzSiaRSSfhJN49s6xCGqO5FYlAyPqnf9xt2BL
	THvOMgg==
X-Google-Smtp-Source: AGHT+IGbc8va397zMV5BunJ5/19nPJJvTrbntO0eQqbuLVdW0pWQs/hUKxRbVCHKkMaHpdQMVcwTtHP1uw8N
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:23c2:b0:6e2:70e:e82e with SMTP id
 00721157ae682-6eee0a61762mr42537b3.6.1732329745715; Fri, 22 Nov 2024 18:42:25
 -0800 (PST)
Date: Sat, 23 Nov 2024 02:42:19 +0000
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
Message-ID: <20241123-extended-modversions-v10-5-0fa754ffdee3@google.com>
Subject: [PATCH v10 5/5] rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS
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
 rust/Makefile | 34 ++++++++++++++++++++++++++++++++--
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index a20e6efd3f0fbdd7f0df2448854cc30734a0ee4f..2cfbefe0933ed129fdc1cca4121183e6285840d3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1956,7 +1956,8 @@ config RUST
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
index 9da9042fd62796ddb852f4bf7cf46d70f0b8ca97..397ce424a0509c2a1b4ebccd5d430b86b4ecbac6 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -316,10 +316,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
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
@@ -388,11 +389,36 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
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
@@ -404,13 +430,16 @@ ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 $(obj)/core.o: scripts/target.json
 endif
 
+$(obj)/compiler_builtins.o: private skip_gendwarfksyms = 1
 $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
 $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/build_error.o: private skip_gendwarfksyms = 1
 $(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/ffi.o: private skip_gendwarfksyms = 1
 $(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
@@ -422,6 +451,7 @@ $(obj)/bindings.o: $(src)/bindings/lib.rs \
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/uapi.o: private rustc_target_flags = --extern ffi
+$(obj)/uapi.o: private skip_gendwarfksyms = 1
 $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/ffi.o \
     $(obj)/uapi/uapi_generated.rs FORCE

-- 
2.47.0.371.ga323438b13-goog


