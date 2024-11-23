Return-Path: <linuxppc-dev+bounces-3512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB53E9D66C9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Nov 2024 01:20:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XwCJf1YFnz2yvn;
	Sat, 23 Nov 2024 11:19:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732321170;
	cv=none; b=gUlen6pupV6qv1JWeBBDb1tq4eZ0rx2PIZ/hXU9nqilsSmwu3uY/GU+R/3Cb43m/0V/3JLSeMqu6lWsgb0afuZr2+IOUYDWFlnhUmuz2F1LpOaksnHQvQmUExtiPRgMiAlz+awt9mbBZklSGxJ2pXOiXkk4fuVmozS6hQU48woSNSHBaNEqjaAXxGH8BJ5T0c6K8of3k6iZnd3KjvmSdx5FeGz0Ks1Aus0JhefR1w1DAG6ghqTX/48epUninl40VAvKUVBS35Jzr9YukDt9nfZFgfF2OjaKCZQHLlwuwCmZ7DrkjOR5+6rnKEEOgAdIkHqRSA/5ZdazYzYqJEOWw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732321170; c=relaxed/relaxed;
	bh=D3SgXuWoWK4BO6s3M/0azb/Xt7N95+oJhCSHs7onn8k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kZ0A9U/hZU3fRmHCE0NvXq92wNYvXX64fWgcRGYcPI+ML31AbKF/YmEBFm7Ew6abwAnQvzjf+6aWPiXqDEz25Fp8+TaSH21fPTlBeYV4IfFQwcSLr342o/GCnWNMYS7uLYIIl9z7zRTAx2q6cBSg3t0RLBuLs9lsfo/B+3JC4F3dRgy9sJyUy1jxrnzA6mmBZOG0UijGoeRGGLi19A2Uf5JTmUxveThNVyIFB52Yc5G6QapjFgYC2QIPNvtLkb63ZM9ToA5oBWnUx7E/YV2fFc9WoKNHjyFteXmYKl3SSBgLXr4aoUOGvBJFotr/ueEcMt1S24FsXHS4bblPmLas6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=luPUhRHJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3jr9bzwckdbi44sc9w9y66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=luPUhRHJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--mmaurer.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3jr9bzwckdbi44sc9w9y66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--mmaurer.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XwCJc6d4mz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 11:19:28 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e3891f31330so4965541276.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 16:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732321166; x=1732925966; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D3SgXuWoWK4BO6s3M/0azb/Xt7N95+oJhCSHs7onn8k=;
        b=luPUhRHJ0E44LLBNVbjB8kwwvpQHgbI53AM+sAYhYjGsFGyOnb2uDAmjObjei8m6F4
         HFceNNbr/UjDcohgsRNdWn9FyXzs9xYlU//7sKX/6Prcef7N1DDF9Tp5iAJGO382n7Ln
         900EkrSkiSyxEdZHA1d067ICADZKgXUfj6MkJ4Tss5KBq4reS6Wn6FUnLuxiEjo2YU/p
         e80rgp+MxTkgmh0U0wRdED7vKX+ZyYD7M9Eqo4FUaUk2Kw2FNayNwfiytVPRbYEUsfh6
         wamAdP9iwB8yWkrwcKdd4kVJgSRPCL2LryNM7v3nvEmxu+6uf3MYxLg0qmlbZ4WuOa74
         GM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732321166; x=1732925966;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3SgXuWoWK4BO6s3M/0azb/Xt7N95+oJhCSHs7onn8k=;
        b=DU+Ev07twPd8hV//kpigFFs14LzeDMuF1OCEkeSat5DYUkmW+6QJxBGBTHkqanTPe2
         +2wJugXC2SADo+NzJpxIZWk31ExFyA01JGqCUg014kzZUMeNKao1L4v6iIW0FpWe3hVU
         ro/3n+K+ZDV0K0VhgqXr3MqaMELcDM6pArrAQmLdqLcjsMrNjWTilSmGvSaDzAZ5482l
         AalxAby1HFfKJuUYLe4Rrf9Lw++d9lFDQKRdg45mUV+clybCKatGPkr1S+G7QWpXHMih
         UId5Bm55UBxS8LDpDIF5NJk1Ek5F/U0FT9wOpTcfiWqSeCxWgfqH5WQ84RvOTdRPqBRH
         MUpg==
X-Gm-Message-State: AOJu0YyJShiHHT24VoucWjplmgExKcsRZ05znCQjFWASubYh6rU23m1v
	sfgWfEi6NP0TGqeDVMM7yQDXtqi9YjV0bSntXScK39KvuFjR8xZdOXWTdVDMqZVTBwkOH6EqK6s
	PZWCPlw==
X-Google-Smtp-Source: AGHT+IFASTUqLlC21MX7tf98zKEIqUbvVG9QZO9snVRK1MZEWyuq2nupvFJacSFrArEoQiOGv1QJT6Re3Cl/
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:8c85:0:b0:e2e:3401:ea0f with SMTP id
 3f1490d57ef6-e38f8be09dbmr2980276.7.1732321165984; Fri, 22 Nov 2024 16:19:25
 -0800 (PST)
Date: Sat, 23 Nov 2024 00:19:02 +0000
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
Message-ID: <20241123-extended-modversions-v9-5-bc0403f054bf@google.com>
Subject: [PATCH v9 5/5] rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS
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


