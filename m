Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 435044B3850
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 23:07:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jx4NM5XSdz3cRh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 09:07:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ngJ09p61;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=ojeda@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ngJ09p61; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwrN430R6z3bTn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 00:06:28 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9847B60EBA;
 Sat, 12 Feb 2022 13:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C87C340E7;
 Sat, 12 Feb 2022 13:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644671186;
 bh=19uZm1v/nr9ZG3zPa1osX9/AbAWObXiwFuRii7/CBDE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ngJ09p6176mFsmoRfHrocaHrEoxmt0wLTkdqUxow/xXkDFRCpiu0Wa0LVs3HBue+b
 wJ7uzoK4x4Ry+ZVHioBKxNk6IW/FB9hhQOYQIMh3SfWVxoTJVnezfoPrs8V8hU/HP1
 63ZaWFji48E8tWBoHAmKZNMkEyZ9p/VXQ97rHMeH2qKXfRb5xLUDmD+3ZrhiuWJBD7
 WMbNtXN4DXVDCMFR014MbzxNOyPJkZFjOYAUsNX1gATpOhx+VJK4M+xD7HheHbdwen
 cqtpOuD/3gATf1g5KkQXtmCqS66YIusDxOadIkNRlioxPR1eoPfBRYGTpHTnFMIa12
 FMUz24pYbFbHg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 16/20] Kbuild: add Rust support
Date: Sat, 12 Feb 2022 14:03:42 +0100
Message-Id: <20220212130410.6901-17-ojeda@kernel.org>
In-Reply-To: <20220212130410.6901-1-ojeda@kernel.org>
References: <20220212130410.6901-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 13 Feb 2022 09:06:17 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Sven Van Asbroeck <thesven73@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Miguel Cano <macanroj@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>,
 Douglas Su <d0u9.su@outlook.com>, Borislav Petkov <bp@alien8.de>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Antonio Terceiro <antonio.terceiro@linaro.org>,
 Miguel Ojeda <ojeda@kernel.org>, Adam Bratschi-Kaye <ark.email@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Daniel Xu <dxu@dxuuu.xyz>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
 linux-arm-kernel@lists.infradead.org, Michal Marek <michal.lkml@markovi.net>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Boris-Chengbiao Zhou <bobo1239@web.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Finn Behrens <me@kloenk.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Having all the new files in place, we now enable Rust support
in the build system, including `Kconfig` entries related to Rust,
the Rust configuration printer, the target definition files,
the version detection script and a few other bits.

In the future, we will likely want to generate the target files
on the fly via a script.

Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
Co-developed-by: Finn Behrens <me@kloenk.de>
Signed-off-by: Finn Behrens <me@kloenk.de>
Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Sven Van Asbroeck <thesven73@gmail.com>
Signed-off-by: Sven Van Asbroeck <thesven73@gmail.com>
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Boris-Chengbiao Zhou <bobo1239@web.de>
Signed-off-by: Boris-Chengbiao Zhou <bobo1239@web.de>
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Co-developed-by: Douglas Su <d0u9.su@outlook.com>
Signed-off-by: Douglas Su <d0u9.su@outlook.com>
Co-developed-by: Dariusz Sosnowski <dsosnowski@dsosnowski.pl>
Signed-off-by: Dariusz Sosnowski <dsosnowski@dsosnowski.pl>
Co-developed-by: Antonio Terceiro <antonio.terceiro@linaro.org>
Signed-off-by: Antonio Terceiro <antonio.terceiro@linaro.org>
Co-developed-by: Daniel Xu <dxu@dxuuu.xyz>
Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
Co-developed-by: Miguel Cano <macanroj@gmail.com>
Signed-off-by: Miguel Cano <macanroj@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 .gitignore                                   |   5 +
 .rustfmt.toml                                |  12 +
 Makefile                                     | 154 +++++++-
 arch/arm/rust/target.json                    |  27 ++
 arch/arm64/rust/target.json                  |  34 ++
 arch/powerpc/rust/target.json                |  29 ++
 arch/riscv/Makefile                          |   1 +
 arch/riscv/rust/rv32ima.json                 |  36 ++
 arch/riscv/rust/rv32imac.json                |  36 ++
 arch/riscv/rust/rv64ima.json                 |  36 ++
 arch/riscv/rust/rv64imac.json                |  36 ++
 arch/x86/rust/target.json                    |  36 ++
 init/Kconfig                                 |  45 ++-
 lib/Kconfig.debug                            | 144 +++++++
 rust/.gitignore                              |   7 +
 rust/Makefile                                | 374 +++++++++++++++++++
 rust/bindgen_parameters                      |  13 +
 scripts/Kconfig.include                      |   6 +-
 scripts/Makefile.build                       |  65 ++++
 scripts/Makefile.debug                       |  10 +
 scripts/Makefile.lib                         |  12 +
 scripts/Makefile.modfinal                    |   8 +-
 scripts/cc-version.sh                        |  12 +-
 scripts/is_rust_module.sh                    |  13 +
 scripts/kconfig/confdata.c                   |  75 ++++
 scripts/min-tool-version.sh                  |   6 +
 scripts/rust-is-available-bindgen-libclang.h |   2 +
 scripts/rust-is-available.sh                 | 158 ++++++++
 28 files changed, 1372 insertions(+), 20 deletions(-)
 create mode 100644 .rustfmt.toml
 create mode 100644 arch/arm/rust/target.json
 create mode 100644 arch/arm64/rust/target.json
 create mode 100644 arch/powerpc/rust/target.json
 create mode 100644 arch/riscv/rust/rv32ima.json
 create mode 100644 arch/riscv/rust/rv32imac.json
 create mode 100644 arch/riscv/rust/rv64ima.json
 create mode 100644 arch/riscv/rust/rv64imac.json
 create mode 100644 arch/x86/rust/target.json
 create mode 100644 rust/.gitignore
 create mode 100644 rust/Makefile
 create mode 100644 rust/bindgen_parameters
 create mode 100755 scripts/is_rust_module.sh
 create mode 100644 scripts/rust-is-available-bindgen-libclang.h
 create mode 100755 scripts/rust-is-available.sh

diff --git a/.gitignore b/.gitignore
index 7afd412dadd2..48c68948f476 100644
--- a/.gitignore
+++ b/.gitignore
@@ -37,6 +37,7 @@
 *.o
 *.o.*
 *.patch
+*.rmeta
 *.s
 *.so
 *.so.dbg
@@ -96,6 +97,7 @@ modules.order
 !.gitattributes
 !.gitignore
 !.mailmap
+!.rustfmt.toml
 
 #
 # Generated include files
@@ -161,3 +163,6 @@ x509.genkey
 
 # Documentation toolchain
 sphinx_*/
+
+# Rust analyzer configuration
+/rust-project.json
diff --git a/.rustfmt.toml b/.rustfmt.toml
new file mode 100644
index 000000000000..3de5cc497465
--- /dev/null
+++ b/.rustfmt.toml
@@ -0,0 +1,12 @@
+edition = "2021"
+newline_style = "Unix"
+
+# Unstable options that help catching some mistakes in formatting and that we may want to enable
+# when they become stable.
+#
+# They are kept here since they are useful to run from time to time.
+#format_code_in_doc_comments = true
+#reorder_impl_items = true
+#comment_width = 100
+#wrap_comments = true
+#normalize_comments = true
diff --git a/Makefile b/Makefile
index ceb987e5c87b..1975d47e74e6 100644
--- a/Makefile
+++ b/Makefile
@@ -120,6 +120,13 @@ endif
 
 export KBUILD_CHECKSRC
 
+# Enable "clippy" (a linter) as part of the Rust compilation.
+#
+# Use 'make CLIPPY=1' to enable it.
+ifeq ("$(origin CLIPPY)", "command line")
+  KBUILD_CLIPPY := $(CLIPPY)
+endif
+
 # Use make M=dir or set the environment variable KBUILD_EXTMOD to specify the
 # directory of external module to build. Setting M= takes precedence.
 ifeq ("$(origin M)", "command line")
@@ -267,7 +274,7 @@ no-dot-config-targets := $(clean-targets) \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
-			 outputmakefile
+			 outputmakefile rustavailable rustfmt rustfmtcheck
 # Installation targets should not require compiler. Unfortunately, vdso_install
 # is an exception where build artifacts may be updated. This must be fixed.
 no-compiler-targets := $(no-dot-config-targets) install dtbs_install \
@@ -461,6 +468,12 @@ OBJDUMP		= $(CROSS_COMPILE)objdump
 READELF		= $(CROSS_COMPILE)readelf
 STRIP		= $(CROSS_COMPILE)strip
 endif
+RUSTC		= rustc
+RUSTDOC		= rustdoc
+RUSTFMT		= rustfmt
+CLIPPY_DRIVER	= clippy-driver
+BINDGEN		= bindgen
+CARGO		= cargo
 PAHOLE		= pahole
 RESOLVE_BTFIDS	= $(objtree)/tools/bpf/resolve_btfids/resolve_btfids
 LEX		= flex
@@ -486,9 +499,11 @@ CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
 NOSTDINC_FLAGS :=
 CFLAGS_MODULE   =
+RUSTFLAGS_MODULE =
 AFLAGS_MODULE   =
 LDFLAGS_MODULE  =
 CFLAGS_KERNEL	=
+RUSTFLAGS_KERNEL =
 AFLAGS_KERNEL	=
 LDFLAGS_vmlinux =
 
@@ -517,15 +532,46 @@ KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
 		   -Werror=return-type -Wno-format-security \
 		   -std=gnu89
 KBUILD_CPPFLAGS := -D__KERNEL__
+KBUILD_RUST_TARGET := $(srctree)/arch/$(SRCARCH)/rust/target.json
+KBUILD_RUSTFLAGS := --edition=2021 \
+		     -Cpanic=abort -Cembed-bitcode=n -Clto=n -Crpath=n \
+		     -Cforce-unwind-tables=n -Ccodegen-units=1 \
+		     -Zbinary_dep_depinfo=y -Zsymbol-mangling-version=v0 \
+		     -Dunsafe_op_in_unsafe_fn -Drust_2018_idioms \
+		     -Dunreachable_pub -Dnon_ascii_idents \
+		     -Wmissing_docs \
+		     -Drustdoc::missing_crate_level_docs \
+		     -Dclippy::correctness -Dclippy::style -Dclippy::suspicious \
+		     -Dclippy::complexity -Dclippy::perf -Dclippy::float_arithmetic \
+		     -Dclippy::let_unit_value -Dclippy::mut_mut \
+		     -Dclippy::needless_bitwise_bool -Dclippy::needless_continue \
+		     -Wclippy::dbg_macro
 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
+KBUILD_RUSTFLAGS_KERNEL :=
 KBUILD_AFLAGS_MODULE  := -DMODULE
 KBUILD_CFLAGS_MODULE  := -DMODULE
+KBUILD_RUSTFLAGS_MODULE := --cfg MODULE
 KBUILD_LDFLAGS_MODULE :=
 KBUILD_LDFLAGS :=
 CLANG_FLAGS :=
 
+ifeq ($(KBUILD_CLIPPY),1)
+	RUSTC_OR_CLIPPY_QUIET := CLIPPY
+	RUSTC_OR_CLIPPY = $(CLIPPY_DRIVER)
+else
+	RUSTC_OR_CLIPPY_QUIET := RUSTC
+	RUSTC_OR_CLIPPY = $(RUSTC)
+endif
+
+ifdef RUST_LIB_SRC
+	export RUST_LIB_SRC
+endif
+
+export RUSTC_BOOTSTRAP := 1
+
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
+export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN CARGO
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
@@ -533,9 +579,10 @@ export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
 export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
+export KBUILD_RUST_TARGET KBUILD_RUSTFLAGS RUSTFLAGS_KERNEL RUSTFLAGS_MODULE
 export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
-export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
-export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
+export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_RUSTFLAGS_MODULE KBUILD_LDFLAGS_MODULE
+export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL KBUILD_RUSTFLAGS_KERNEL
 export PAHOLE_FLAGS
 
 # Files to ignore in find ... statements
@@ -716,7 +763,7 @@ $(KCONFIG_CONFIG):
 #
 # Do not use $(call cmd,...) here. That would suppress prompts from syncconfig,
 # so you cannot notice that Kconfig is waiting for the user input.
-%/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h: $(KCONFIG_CONFIG)
+%/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h %/generated/rustc_cfg: $(KCONFIG_CONFIG)
 	$(Q)$(kecho) "  SYNC    $@"
 	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
 else # !may-sync-config
@@ -745,12 +792,28 @@ KBUILD_CFLAGS	+= $(call cc-disable-warning, address-of-packed-member)
 
 ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
 KBUILD_CFLAGS += -O2
+KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := 2
 else ifdef CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
 KBUILD_CFLAGS += -O3
+KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := 3
 else ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
 KBUILD_CFLAGS += -Os
+KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := s
 endif
 
+# Always set `debug-assertions` and `overflow-checks` because their default
+# depends on `opt-level` and `debug-assertions`, respectively.
+KBUILD_RUSTFLAGS += -Cdebug-assertions=$(if $(CONFIG_RUST_DEBUG_ASSERTIONS),y,n)
+KBUILD_RUSTFLAGS += -Coverflow-checks=$(if $(CONFIG_RUST_OVERFLOW_CHECKS),y,n)
+KBUILD_RUSTFLAGS += -Copt-level=$\
+	$(if $(CONFIG_RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C),$(KBUILD_RUSTFLAGS_OPT_LEVEL_MAP))$\
+	$(if $(CONFIG_RUST_OPT_LEVEL_0),0)$\
+	$(if $(CONFIG_RUST_OPT_LEVEL_1),1)$\
+	$(if $(CONFIG_RUST_OPT_LEVEL_2),2)$\
+	$(if $(CONFIG_RUST_OPT_LEVEL_3),3)$\
+	$(if $(CONFIG_RUST_OPT_LEVEL_S),s)$\
+	$(if $(CONFIG_RUST_OPT_LEVEL_Z),z)
+
 # Tell gcc to never replace conditional load with a non-conditional one
 ifdef CONFIG_CC_IS_GCC
 # gcc-10 renamed --param=allow-store-data-races=0 to
@@ -780,6 +843,9 @@ KBUILD_CFLAGS += $(stackp-flags-y)
 KBUILD_CFLAGS-$(CONFIG_WERROR) += -Werror
 KBUILD_CFLAGS += $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
 
+KBUILD_RUSTFLAGS-$(CONFIG_WERROR) += -Dwarnings
+KBUILD_RUSTFLAGS += $(KBUILD_RUSTFLAGS-y)
+
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CPPFLAGS += -Qunused-arguments
 # The kernel builds with '-std=gnu89' so use of GNU extensions is acceptable.
@@ -801,6 +867,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
 
 ifdef CONFIG_FRAME_POINTER
 KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
+KBUILD_RUSTFLAGS += -Cforce-frame-pointers=y
 else
 # Some targets (ARM with Thumb2, for example), can't be built with frame
 # pointers.  For those, we don't have FUNCTION_TRACER automatically
@@ -1016,10 +1083,11 @@ include $(addprefix $(srctree)/, $(include-y))
 # Do not add $(call cc-option,...) below this line. When you build the kernel
 # from the clean source tree, the GCC plugins do not exist at this point.
 
-# Add user supplied CPPFLAGS, AFLAGS and CFLAGS as the last assignments
+# Add user supplied CPPFLAGS, AFLAGS, CFLAGS and RUSTFLAGS as the last assignments
 KBUILD_CPPFLAGS += $(KCPPFLAGS)
 KBUILD_AFLAGS   += $(KAFLAGS)
 KBUILD_CFLAGS   += $(KCFLAGS)
+KBUILD_RUSTFLAGS += $(KRUSTFLAGS)
 
 KBUILD_LDFLAGS_MODULE += --build-id=sha1
 LDFLAGS_vmlinux += --build-id=sha1
@@ -1088,6 +1156,7 @@ export MODULES_NSDEPS := $(extmod_prefix)modules.nsdeps
 ifeq ($(KBUILD_EXTMOD),)
 core-y			+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/
 core-$(CONFIG_BLOCK)	+= block/
+core-$(CONFIG_RUST)	+= rust/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
@@ -1192,6 +1261,10 @@ prepare0: archprepare
 
 # All the preparing..
 prepare: prepare0
+ifdef CONFIG_RUST
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust-is-available.sh -v
+	$(Q)$(MAKE) $(build)=rust
+endif
 
 PHONY += remove-stale-files
 remove-stale-files:
@@ -1480,7 +1553,7 @@ endif # CONFIG_MODULES
 # Directories & files removed with 'make clean'
 CLEAN_FILES += include/ksym vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
-	       compile_commands.json .thinlto-cache
+	       compile_commands.json .thinlto-cache rust/test rust/doc
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
@@ -1491,7 +1564,8 @@ MRPROPER_FILES += include/config include/generated          \
 		  certs/signing_key.pem \
 		  certs/x509.genkey \
 		  vmlinux-gdb.py \
-		  *.spec
+		  *.spec \
+		  rust/libmacros.so
 
 # clean - Delete most, but leave enough to build external modules
 #
@@ -1516,6 +1590,9 @@ $(mrproper-dirs):
 
 mrproper: clean $(mrproper-dirs)
 	$(call cmd,rmfiles)
+	@find . $(RCS_FIND_IGNORE) \
+		\( -name '*.rmeta' \) \
+		-type f -print | xargs rm -f
 
 # distclean
 #
@@ -1603,6 +1680,23 @@ help:
 	@echo  '  kselftest-merge   - Merge all the config dependencies of'
 	@echo  '		      kselftest to existing .config.'
 	@echo  ''
+	@echo  'Rust targets:'
+	@echo  '  rustavailable   - Checks whether the Rust toolchain is'
+	@echo  '		    available and, if not, explains why.'
+	@echo  '  rustfmt	  - Reformat all the Rust code in the kernel'
+	@echo  '  rustfmtcheck	  - Checks if all the Rust code in the kernel'
+	@echo  '		    is formatted, printing a diff otherwise.'
+	@echo  '  rustdoc	  - Generate Rust documentation'
+	@echo  '		    (requires kernel .config)'
+	@echo  '  rusttest        - Runs the Rust tests'
+	@echo  '                    (requires kernel .config; downloads external repos)'
+	@echo  '  rust-analyzer	  - Generate rust-project.json rust-analyzer support file'
+	@echo  '		    (requires kernel .config)'
+	@echo  '  dir/file.[os]   - Build specified target only'
+	@echo  '  dir/file.i      - Build macro expanded source, similar to C preprocessing'
+	@echo  '                    (run with RUSTFMT=n to skip reformatting if needed)'
+	@echo  '  dir/file.ll     - Build the LLVM assembly file'
+	@echo  ''
 	@$(if $(dtstree), \
 		echo 'Devicetree:'; \
 		echo '* dtbs             - Build device tree blobs for enabled boards'; \
@@ -1674,6 +1768,52 @@ PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS):
 	$(Q)$(MAKE) $(build)=Documentation $@
 
+
+# Rust targets
+# ---------------------------------------------------------------------------
+
+# "Is Rust available?" target
+PHONY += rustavailable
+rustavailable:
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust-is-available.sh -v && echo >&2 "Rust is available!"
+
+# Documentation target
+#
+# Using the singular to avoid running afoul of `no-dot-config-targets`.
+PHONY += rustdoc
+rustdoc: prepare0
+	$(Q)$(MAKE) $(build)=rust $@
+
+# Testing target
+PHONY += rusttest
+rusttest: prepare0
+	$(Q)$(MAKE) $(build)=rust $@
+
+# Formatting targets
+PHONY += rustfmt rustfmtcheck
+
+# We skip `rust/alloc` since we want to minimize the diff w.r.t. upstream.
+#
+# We match using absolute paths since `find` does not resolve them
+# when matching, which is a problem when e.g. `srctree` is `..`.
+# We `grep` afterwards in order to remove the directory entry itself.
+rustfmt:
+	$(Q)find $(abs_srctree) -type f -name '*.rs' \
+		-o -path $(abs_srctree)/rust/alloc -prune \
+		-o -path $(abs_objtree)/rust/test -prune \
+		| grep -Fv $(abs_srctree)/rust/alloc \
+		| grep -Fv $(abs_objtree)/rust/test \
+		| grep -Fv generated \
+		| xargs $(RUSTFMT) $(rustfmt_flags)
+
+rustfmtcheck: rustfmt_flags = --check
+rustfmtcheck: rustfmt
+
+# IDE support targets
+PHONY += rust-analyzer
+rust-analyzer: prepare0
+	$(Q)$(MAKE) $(build)=rust $@
+
 # Misc
 # ---------------------------------------------------------------------------
 
diff --git a/arch/arm/rust/target.json b/arch/arm/rust/target.json
new file mode 100644
index 000000000000..3f845b8221dc
--- /dev/null
+++ b/arch/arm/rust/target.json
@@ -0,0 +1,27 @@
+{
+  "arch": "arm",
+  "crt-static-respected": true,
+  "data-layout": "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64",
+  "dynamic-linking": true,
+  "env": "gnu",
+  "executables": true,
+  "features": "+strict-align,+v6",
+  "function-sections": false,
+  "has-elf-tls": true,
+  "has-rpath": true,
+  "linker-is-gnu": true,
+  "llvm-target": "arm-unknown-linux-gnueabi",
+  "max-atomic-width": 64,
+  "os": "linux",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack"
+    ]
+  },
+  "relocation-model": "static",
+  "target-family": "unix",
+  "target-mcount": "\u0001__gnu_mcount_nc",
+  "target-pointer-width": "32"
+}
diff --git a/arch/arm64/rust/target.json b/arch/arm64/rust/target.json
new file mode 100644
index 000000000000..09a264df26c7
--- /dev/null
+++ b/arch/arm64/rust/target.json
@@ -0,0 +1,34 @@
+{
+  "arch": "aarch64",
+  "data-layout": "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128",
+  "disable-redzone": true,
+  "emit-debug-gdb-scripts": false,
+  "env": "gnu",
+  "features": "+strict-align,+neon,+fp-armv8",
+  "frame-pointer": "always",
+  "function-sections": false,
+  "linker-flavor": "gcc",
+  "linker-is-gnu": true,
+  "llvm-target": "aarch64-unknown-none",
+  "max-atomic-width": 128,
+  "needs-plt": true,
+  "os": "none",
+  "panic-strategy": "abort",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack",
+      "-m64"
+    ]
+  },
+  "relocation-model": "static",
+  "relro-level": "full",
+  "stack-probes": {
+    "kind": "none"
+  },
+  "target-c-int-width": "32",
+  "target-endian": "little",
+  "target-pointer-width": "64",
+  "vendor": ""
+}
diff --git a/arch/powerpc/rust/target.json b/arch/powerpc/rust/target.json
new file mode 100644
index 000000000000..2420c8e6a520
--- /dev/null
+++ b/arch/powerpc/rust/target.json
@@ -0,0 +1,29 @@
+{
+  "arch": "powerpc64",
+  "code-model": "large",
+  "cpu": "ppc64le",
+  "data-layout": "e-m:e-i64:64-n32:64",
+  "env": "gnu",
+  "features": "-altivec,-vsx,-hard-float",
+  "function-sections": false,
+  "linker-flavor": "gcc",
+  "linker-is-gnu": true,
+  "llvm-target": "powerpc64le-elf",
+  "max-atomic-width": 64,
+  "os": "none",
+  "panic-strategy": "abort",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack",
+      "-m64"
+    ]
+  },
+  "relocation-model": "static",
+  "relro-level": "full",
+  "target-family": "unix",
+  "target-mcount": "_mcount",
+  "target-endian": "little",
+  "target-pointer-width": "64"
+}
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 8a107ed18b0d..0487db1e54c6 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -52,6 +52,7 @@ riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
 KBUILD_AFLAGS += -march=$(riscv-march-y)
+KBUILD_RUST_TARGET := $(srctree)/arch/riscv/rust/$(subst fd,,$(riscv-march-y)).json
 
 KBUILD_CFLAGS += -mno-save-restore
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
diff --git a/arch/riscv/rust/rv32ima.json b/arch/riscv/rust/rv32ima.json
new file mode 100644
index 000000000000..bcdda88c1604
--- /dev/null
+++ b/arch/riscv/rust/rv32ima.json
@@ -0,0 +1,36 @@
+{
+  "arch": "riscv32",
+  "code-model": "medium",
+  "cpu": "generic-rv32",
+  "data-layout": "e-m:e-p:32:32-i64:64-n32-S128",
+  "disable-redzone": true,
+  "emit-debug-gdb-scripts": false,
+  "env": "gnu",
+  "features": "+m,+a",
+  "frame-pointer": "always",
+  "function-sections": false,
+  "linker-flavor": "gcc",
+  "linker-is-gnu": true,
+  "llvm-target": "riscv32",
+  "max-atomic-width": 32,
+  "needs-plt": true,
+  "os": "none",
+  "panic-strategy": "abort",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack",
+      "-m32"
+    ]
+  },
+  "relocation-model": "static",
+  "relro-level": "full",
+  "stack-probes": {
+    "kind": "none"
+  },
+  "target-c-int-width": "32",
+  "target-endian": "little",
+  "target-pointer-width": "32",
+  "vendor": ""
+}
diff --git a/arch/riscv/rust/rv32imac.json b/arch/riscv/rust/rv32imac.json
new file mode 100644
index 000000000000..45873c10a5c3
--- /dev/null
+++ b/arch/riscv/rust/rv32imac.json
@@ -0,0 +1,36 @@
+{
+  "arch": "riscv32",
+  "code-model": "medium",
+  "cpu": "generic-rv32",
+  "data-layout": "e-m:e-p:32:32-i64:64-n32-S128",
+  "disable-redzone": true,
+  "emit-debug-gdb-scripts": false,
+  "env": "gnu",
+  "features": "+m,+a,+c",
+  "frame-pointer": "always",
+  "function-sections": false,
+  "linker-flavor": "gcc",
+  "linker-is-gnu": true,
+  "llvm-target": "riscv32",
+  "max-atomic-width": 32,
+  "needs-plt": true,
+  "os": "none",
+  "panic-strategy": "abort",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack",
+      "-m32"
+    ]
+  },
+  "relocation-model": "static",
+  "relro-level": "full",
+  "stack-probes": {
+    "kind": "none"
+  },
+  "target-c-int-width": "32",
+  "target-endian": "little",
+  "target-pointer-width": "32",
+  "vendor": ""
+}
diff --git a/arch/riscv/rust/rv64ima.json b/arch/riscv/rust/rv64ima.json
new file mode 100644
index 000000000000..853d758c5461
--- /dev/null
+++ b/arch/riscv/rust/rv64ima.json
@@ -0,0 +1,36 @@
+{
+  "arch": "riscv64",
+  "code-model": "medium",
+  "cpu": "generic-rv64",
+  "data-layout": "e-m:e-p:64:64-i64:64-i128:128-n64-S128",
+  "disable-redzone": true,
+  "emit-debug-gdb-scripts": false,
+  "env": "gnu",
+  "features": "+m,+a",
+  "frame-pointer": "always",
+  "function-sections": false,
+  "linker-flavor": "gcc",
+  "linker-is-gnu": true,
+  "llvm-target": "riscv64",
+  "max-atomic-width": 64,
+  "needs-plt": true,
+  "os": "none",
+  "panic-strategy": "abort",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack",
+      "-m64"
+    ]
+  },
+  "relocation-model": "static",
+  "relro-level": "full",
+  "stack-probes": {
+    "kind": "none"
+  },
+  "target-c-int-width": "32",
+  "target-endian": "little",
+  "target-pointer-width": "64",
+  "vendor": ""
+}
diff --git a/arch/riscv/rust/rv64imac.json b/arch/riscv/rust/rv64imac.json
new file mode 100644
index 000000000000..ce50ee8e8c93
--- /dev/null
+++ b/arch/riscv/rust/rv64imac.json
@@ -0,0 +1,36 @@
+{
+  "arch": "riscv64",
+  "code-model": "medium",
+  "cpu": "generic-rv64",
+  "data-layout": "e-m:e-p:64:64-i64:64-i128:128-n64-S128",
+  "disable-redzone": true,
+  "emit-debug-gdb-scripts": false,
+  "env": "gnu",
+  "features": "+m,+a,+c",
+  "frame-pointer": "always",
+  "function-sections": false,
+  "linker-flavor": "gcc",
+  "linker-is-gnu": true,
+  "llvm-target": "riscv64",
+  "max-atomic-width": 64,
+  "needs-plt": true,
+  "os": "none",
+  "panic-strategy": "abort",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack",
+      "-m64"
+    ]
+  },
+  "relocation-model": "static",
+  "relro-level": "full",
+  "stack-probes": {
+    "kind": "none"
+  },
+  "target-c-int-width": "32",
+  "target-endian": "little",
+  "target-pointer-width": "64",
+  "vendor": ""
+}
diff --git a/arch/x86/rust/target.json b/arch/x86/rust/target.json
new file mode 100644
index 000000000000..379cf39e8941
--- /dev/null
+++ b/arch/x86/rust/target.json
@@ -0,0 +1,36 @@
+{
+  "arch": "x86_64",
+  "code-model": "kernel",
+  "cpu": "x86-64",
+  "data-layout": "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128",
+  "disable-redzone": true,
+  "emit-debug-gdb-scripts": false,
+  "env": "gnu",
+  "features": "-mmx,-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-3dnow,-3dnowa,-avx,-avx2,+soft-float",
+  "frame-pointer": "always",
+  "function-sections": false,
+  "linker-flavor": "gcc",
+  "linker-is-gnu": true,
+  "llvm-target": "x86_64-elf",
+  "max-atomic-width": 64,
+  "needs-plt": true,
+  "os": "none",
+  "panic-strategy": "abort",
+  "position-independent-executables": true,
+  "pre-link-args": {
+    "gcc": [
+      "-Wl,--as-needed",
+      "-Wl,-z,noexecstack",
+      "-m64"
+    ]
+  },
+  "relocation-model": "static",
+  "relro-level": "full",
+  "stack-probes": {
+    "kind": "none"
+  },
+  "target-c-int-width": "32",
+  "target-endian": "little",
+  "target-pointer-width": "64",
+  "vendor": "unknown"
+}
diff --git a/init/Kconfig b/init/Kconfig
index e9119bf54b1f..6a9047318cb3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -60,6 +60,17 @@ config LLD_VERSION
 	default $(ld-version) if LD_IS_LLD
 	default 0
 
+config RUST_IS_AVAILABLE
+	def_bool $(success,$(srctree)/scripts/rust-is-available.sh)
+	help
+	  This shows whether a suitable Rust toolchain is available (found).
+
+	  Please see Documentation/rust/quick-start.rst for instructions on how
+	  to satify the build requirements of Rust support.
+
+	  In particular, the Makefile target 'rustavailable' is useful to check
+	  why the Rust toolchain is not being detected.
+
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
@@ -142,7 +153,8 @@ config WERROR
 	default COMPILE_TEST
 	help
 	  A kernel build should not cause any compiler warnings, and this
-	  enables the '-Werror' flag to enforce that rule by default.
+	  enables the '-Werror' (for C) and '-Dwarnings' (for Rust) flags
+	  to enforce that rule by default.
 
 	  However, if you have a new (or very old) compiler with odd and
 	  unusual warnings, or you have some architecture with problems,
@@ -2041,6 +2053,37 @@ config PROFILING
 	  Say Y here to enable the extended profiling support mechanisms used
 	  by profilers.
 
+config RUST
+	bool "Rust support"
+	depends on RUST_IS_AVAILABLE
+	depends on ARM64 || CPU_32v6 || CPU_32v6K || (PPC64 && CPU_LITTLE_ENDIAN) || X86_64 || RISCV
+	depends on !MODVERSIONS
+	depends on !GCC_PLUGIN_RANDSTRUCT
+	select CONSTRUCTORS
+	default n
+	help
+	  Enables Rust support in the kernel.
+
+	  This allows other Rust-related options, like drivers written in Rust,
+	  to be selected.
+
+	  It is also required to be able to load external kernel modules
+	  written in Rust.
+
+	  See Documentation/rust/ for more information.
+
+	  If unsure, say N.
+
+config RUSTC_VERSION_TEXT
+	string
+	depends on RUST
+	default $(shell,command -v $(RUSTC) >/dev/null 2>&1 && $(RUSTC) --version || echo n)
+
+config BINDGEN_VERSION_TEXT
+	string
+	depends on RUST
+	default $(shell,command -v $(BINDGEN) >/dev/null 2>&1 && $(BINDGEN) --version || echo n)
+
 #
 # Place an empty function call at each tracepoint site. Can be
 # dynamically changed for a probe function.
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 14b89aa37c5c..048883dee5c9 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2687,6 +2687,150 @@ config HYPERV_TESTING
 
 endmenu # "Kernel Testing and Coverage"
 
+menu "Rust hacking"
+
+config RUST_DEBUG_ASSERTIONS
+	bool "Debug assertions"
+	default n
+	depends on RUST
+	help
+	  Enables rustc's `-Cdebug-assertions` codegen option.
+
+	  This flag lets you turn `cfg(debug_assertions)` conditional
+	  compilation on or off. This can be used to enable extra debugging
+	  code in development but not in production. For example, it controls
+	  the behavior of the standard library's `debug_assert!` macro.
+
+	  Note that this will apply to all Rust code, including `core`.
+
+	  If unsure, say N.
+
+config RUST_OVERFLOW_CHECKS
+	bool "Overflow checks"
+	default y
+	depends on RUST
+	help
+	  Enables rustc's `-Coverflow-checks` codegen option.
+
+	  This flag allows you to control the behavior of runtime integer
+	  overflow. When overflow-checks are enabled, a Rust panic will occur
+	  on overflow.
+
+	  Note that this will apply to all Rust code, including `core`.
+
+	  If unsure, say Y.
+
+choice
+	prompt "Optimization level"
+	default RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C
+	depends on RUST
+	help
+	  Controls rustc's `-Copt-level` codegen option.
+
+	  This flag controls the optimization level.
+
+	  If unsure, say "Similar as chosen for C".
+
+config RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C
+	bool "Similar as chosen for C"
+	help
+	  This choice will pick a similar optimization level as chosen in
+	  the "Compiler optimization level" for C:
+
+	      -O2 is currently mapped to -Copt-level=2
+	      -O3 is currently mapped to -Copt-level=3
+	      -Os is currently mapped to -Copt-level=s
+
+	  The mapping may change over time to follow the intended semantics
+	  of the choice for C as sensibly as possible.
+
+	  This is the default.
+
+config RUST_OPT_LEVEL_0
+	bool "No optimizations (-Copt-level=0)"
+	help
+	  Not recommended for most purposes. It may come in handy for debugging
+	  suspected optimizer bugs, unexpected undefined behavior, etc.
+
+	  Note that this level will *not* enable debug assertions nor overflow
+	  checks on its own (like it happens when interacting with rustc
+	  directly). Use the corresponding configuration options to control
+	  that instead, orthogonally.
+
+	  Note this level may cause excessive stack usage, which can lead to stack
+	  overflow and subsequent crashes.
+
+config RUST_OPT_LEVEL_1
+	bool "Basic optimizations (-Copt-level=1)"
+	help
+	  Useful for debugging without getting too lost, but without
+	  the overhead and boilerplate of no optimizations at all.
+
+	  Note this level may cause excessive stack usage, which can lead to stack
+	  overflow and subsequent crashes.
+
+config RUST_OPT_LEVEL_2
+	bool "Some optimizations (-Copt-level=2)"
+	help
+	  The sensible choice in most cases.
+
+config RUST_OPT_LEVEL_3
+	bool "All optimizations (-Copt-level=3)"
+	help
+	  Yet more performance (hopefully).
+
+config RUST_OPT_LEVEL_S
+	bool "Optimize for size (-Copt-level=s)"
+	help
+	  Smaller kernel, ideally without too much performance loss.
+
+config RUST_OPT_LEVEL_Z
+	bool "Optimize for size, no loop vectorization (-Copt-level=z)"
+	help
+	  Like the previous level, but also turn off loop vectorization.
+
+endchoice
+
+choice
+	prompt "Build-time assertions"
+	default RUST_BUILD_ASSERT_ALLOW if RUST_OPT_LEVEL_0
+	default RUST_BUILD_ASSERT_DENY if !RUST_OPT_LEVEL_0
+	depends on RUST
+	help
+	  Controls how are `build_error!` and `build_assert!` handled during build.
+
+	  If calls to them exist in the binary, it may indicate a violated invariant
+	  or that the optimizer failed to verify the invariant during compilation.
+	  You can choose to abort compilation or ignore them during build and let the
+	  check be carried to runtime.
+
+	  If optimizations are turned off, you cannot select "Deny".
+
+	  If unsure, say "Deny".
+
+config RUST_BUILD_ASSERT_ALLOW
+	bool "Allow"
+	help
+	  Unoptimized calls to `build_error!` will be converted to `panic!`
+	  and checked at runtime.
+
+config RUST_BUILD_ASSERT_WARN
+	bool "Warn"
+	help
+	  Unoptimized calls to `build_error!` will be converted to `panic!`
+	  and checked at runtime, but warnings will be generated when building.
+
+config RUST_BUILD_ASSERT_DENY
+	bool "Deny"
+	depends on !RUST_OPT_LEVEL_0
+	help
+	  Unoptimized calls to `build_error!` will abort compilation.
+
+endchoice
+
+
+endmenu # "Rust"
+
 source "Documentation/Kconfig"
 
 endmenu # Kernel hacking
diff --git a/rust/.gitignore b/rust/.gitignore
new file mode 100644
index 000000000000..168cb26a31b9
--- /dev/null
+++ b/rust/.gitignore
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+bindings_generated.rs
+bindings_helpers_generated.rs
+exports_*_generated.h
+doc/
+test/
diff --git a/rust/Makefile b/rust/Makefile
new file mode 100644
index 000000000000..f78dba9b3db6
--- /dev/null
+++ b/rust/Makefile
@@ -0,0 +1,374 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_RUST) += core.o compiler_builtins.o
+always-$(CONFIG_RUST) += exports_core_generated.h
+
+# Missing prototypes are expected in the helpers since these are exported
+# for Rust only, thus there is no header nor prototypes.
+obj-$(CONFIG_RUST) += helpers.o
+CFLAGS_REMOVE_helpers.o = -Wmissing-prototypes -Wmissing-declarations
+
+always-$(CONFIG_RUST) += libmacros.so
+no-clean-files += libmacros.so
+
+always-$(CONFIG_RUST) += bindings_generated.rs bindings_helpers_generated.rs
+obj-$(CONFIG_RUST) += alloc.o kernel.o
+always-$(CONFIG_RUST) += exports_alloc_generated.h exports_kernel_generated.h
+
+ifdef CONFIG_RUST_BUILD_ASSERT_DENY
+always-$(CONFIG_RUST) += build_error.o
+else
+obj-$(CONFIG_RUST) += build_error.o
+endif
+
+obj-$(CONFIG_RUST) += exports.o
+
+# Avoids running `$(RUSTC)` for the sysroot when it may not be available.
+ifdef CONFIG_RUST
+
+ifeq ($(quiet),silent_)
+cargo_quiet=-q
+rust_test_quiet=-q
+rustdoc_test_quiet=--test-args -q
+else ifeq ($(quiet),quiet_)
+rust_test_quiet=-q
+rustdoc_test_quiet=--test-args -q
+else
+cargo_quiet=--verbose
+endif
+
+core-cfgs = \
+    --cfg no_fp_fmt_parse
+
+alloc-cfgs = \
+    --cfg no_global_oom_handling \
+    --cfg no_rc \
+    --cfg no_sync
+
+quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
+      cmd_rustdoc = \
+	OBJTREE=$(abspath $(objtree)) \
+	$(RUSTDOC) $(if $(rustdoc_host),,$(rust_cross_flags)) \
+		$(filter-out -Cpanic=abort, $(rust_flags)) \
+		$(rustc_target_flags) -L $(objtree)/rust \
+		--output $(objtree)/rust/doc --crate-name $(subst rustdoc-,,$@) \
+		@$(objtree)/include/generated/rustc_cfg $<
+
+# The `html_logo_url` and `html_favicon_url` forms of the `doc` attribute
+# can be used to specify a custom logo. However:
+#   - The given value is used as-is, thus it cannot be relative or a local file
+#     (unlike the non-custom case) since the generated docs have subfolders.
+#   - It requires adding it to every crate.
+#   - It requires changing `core` which comes from the sysroot.
+#
+# Using `-Zcrate-attr` would solve the last two points, but not the first.
+# The https://github.com/rust-lang/rfcs/pull/3226 RFC suggests two new
+# command-like flags to solve the issue. Meanwhile, we use the non-custom case
+# and then retouch the generated files.
+rustdoc: rustdoc-core rustdoc-macros rustdoc-compiler_builtins rustdoc-alloc rustdoc-kernel
+	$(Q)cp $(srctree)/Documentation/rust/logo.svg $(objtree)/rust/doc
+	$(Q)find $(objtree)/rust/doc -name '*.html' -type f -print0 | xargs -0 sed -Ei \
+		-e 's:rust-logo\.png:logo.svg:g' \
+		-e 's:favicon\.svg:logo.svg:g' \
+		-e 's:<link rel="alternate icon" type="image/png" href="[./]*favicon-(16x16|32x32)\.png">::g'
+
+rustdoc-macros: private rustdoc_host = yes
+rustdoc-macros: private rustc_target_flags = --crate-type proc-macro \
+    --extern proc_macro
+rustdoc-macros: $(srctree)/rust/macros/lib.rs FORCE
+	$(call if_changed,rustdoc)
+
+rustdoc-compiler_builtins: $(srctree)/rust/compiler_builtins.rs rustdoc-core FORCE
+	$(call if_changed,rustdoc)
+
+# We need to allow `rustdoc::broken_intra_doc_links` because some
+# `no_global_oom_handling` functions refer to non-`no_global_oom_handling`
+# functions. Ideally `rustdoc` would have a way to distinguish broken links
+# due to things that are "configured out" vs. entirely non-existing ones.
+rustdoc-alloc: private rustc_target_flags = $(alloc-cfgs) \
+    -Arustdoc::broken_intra_doc_links
+rustdoc-alloc: $(srctree)/rust/alloc/lib.rs rustdoc-core \
+    rustdoc-compiler_builtins FORCE
+	$(call if_changed,rustdoc)
+
+rustdoc-kernel: private rustc_target_flags = --extern alloc \
+    --extern build_error \
+    --extern macros=$(objtree)/rust/libmacros.so
+rustdoc-kernel: $(srctree)/rust/kernel/lib.rs rustdoc-core \
+    rustdoc-macros rustdoc-compiler_builtins rustdoc-alloc \
+    $(objtree)/rust/libmacros.so $(objtree)/rust/bindings_generated.rs \
+    $(objtree)/rust/bindings_helpers_generated.rs FORCE
+	$(call if_changed,rustdoc)
+
+quiet_cmd_rustc_test_library = RUSTC TL $<
+      cmd_rustc_test_library = \
+	OBJTREE=$(abspath $(objtree)) \
+	$(RUSTC) $(filter-out --sysroot=%, $(filter-out -Cpanic=abort, $(rust_flags))) \
+		$(rustc_target_flags) --crate-type $(if $(rustc_test_library_proc),proc-macro,rlib) \
+		--out-dir $(objtree)/rust/test/ --cfg testlib \
+		--sysroot $(objtree)/rust/test/sysroot \
+		-L $(objtree)/rust/test/ --crate-name $(subst rusttest-,,$(subst rusttestlib-,,$@)) $<
+
+rusttestlib-build_error: $(srctree)/rust/build_error.rs rusttest-prepare FORCE
+	$(call if_changed,rustc_test_library)
+
+rusttestlib-macros: private rustc_target_flags = --extern proc_macro
+rusttestlib-macros: private rustc_test_library_proc = yes
+rusttestlib-macros: $(srctree)/rust/macros/lib.rs rusttest-prepare FORCE
+	$(call if_changed,rustc_test_library)
+
+quiet_cmd_rustdoc_test = RUSTDOC T $<
+      cmd_rustdoc_test = \
+	OBJTREE=$(abspath $(objtree)) \
+	$(RUSTDOC) --test $(filter-out --sysroot=%, $(filter-out -Cpanic=abort, $(rust_flags))) \
+		$(rustc_target_flags) $(rustdoc_test_target_flags) \
+		--sysroot $(objtree)/rust/test/sysroot $(rustdoc_test_quiet) \
+		-L $(objtree)/rust/test \
+		--output $(objtree)/rust/doc --crate-name $(subst rusttest-,,$@) \
+		@$(objtree)/include/generated/rustc_cfg $<
+
+# We cannot use `-Zpanic-abort-tests` because some tests are dynamic,
+# so for the moment we skip `-Cpanic=abort`.
+quiet_cmd_rustc_test = RUSTC T  $<
+      cmd_rustc_test = \
+	OBJTREE=$(abspath $(objtree)) \
+	$(RUSTC) --test $(filter-out --sysroot=%, $(filter-out -Cpanic=abort, $(rust_flags))) \
+		$(rustc_target_flags) --out-dir $(objtree)/rust/test \
+		--sysroot $(objtree)/rust/test/sysroot \
+		-L $(objtree)/rust/test/ --crate-name $(subst rusttest-,,$@) $<; \
+	$(objtree)/rust/test/$(subst rusttest-,,$@) $(rust_test_quiet) \
+		$(rustc_test_run_flags)
+
+rusttest: rusttest-macros rusttest-kernel
+
+# This prepares a custom sysroot with our custom `alloc` instead of
+# the standard one.
+#
+# This requires several hacks:
+#   - Unlike `core` and `alloc`, `std` depends on more than a dozen crates,
+#     including third-party crates that need to be downloaded, plus custom
+#     `build.rs` steps. Thus hardcoding things here is not maintainable.
+#   - `cargo` knows how to build the standard library, but it is an unstable
+#     feature so far (`-Zbuild-std`).
+#   - `cargo` only considers the use case of building the standard library
+#     to use it in a given package. Thus we need to create a dummy package
+#     and pick the generated libraries from there.
+#   - Since we only keep a subset of upstream `alloc` in-tree, we need
+#     to recreate it on the fly by putting our sources on top.
+#   - The usual ways of modifying the dependency graph in `cargo` do not seem
+#     to apply for the `-Zbuild-std` steps, thus we have to mislead it
+#     by modifying the sources in the sysroot.
+#   - To avoid messing with the user's Rust installation, we create a clone
+#     of the sysroot. However, `cargo` ignores `RUSTFLAGS` in the `-Zbuild-std`
+#     steps, thus we use a wrapper binary passed via `RUSTC` to pass the flag.
+#
+# In the future, we hope to avoid the whole ordeal by either:
+#   - Making the `test` crate not depend on `std` (either improving upstream
+#     or having our own custom crate).
+#   - Making the tests run in kernel space (requires the previous point).
+#   - Making `std` and friends be more like a "normal" crate, so that
+#     `-Zbuild-std` and related hacks are not needed.
+quiet_cmd_rustsysroot = RUSTSYSROOT
+      cmd_rustsysroot = \
+	rm -rf $(objtree)/rust/test; \
+	mkdir -p $(objtree)/rust/test; \
+	cp -a $(rustc_sysroot) $(objtree)/rust/test/sysroot; \
+	cp -r $(srctree)/rust/alloc/* \
+		$(objtree)/rust/test/sysroot/lib/rustlib/src/rust/library/alloc/src; \
+	echo '\#!/bin/sh' > $(objtree)/rust/test/rustc_sysroot; \
+	echo "$(RUSTC) --sysroot=$(abspath $(objtree)/rust/test/sysroot) \"\$$@\"" \
+		>> $(objtree)/rust/test/rustc_sysroot; \
+	chmod u+x $(objtree)/rust/test/rustc_sysroot; \
+	$(CARGO) -q new $(objtree)/rust/test/dummy; \
+	RUSTC=$(objtree)/rust/test/rustc_sysroot $(CARGO) $(cargo_quiet) \
+		test -Zbuild-std --target $(rustc_host_target) \
+		--manifest-path $(objtree)/rust/test/dummy/Cargo.toml; \
+	rm $(objtree)/rust/test/sysroot/lib/rustlib/$(rustc_host_target)/lib/*; \
+	cp $(objtree)/rust/test/dummy/target/$(rustc_host_target)/debug/deps/* \
+		$(objtree)/rust/test/sysroot/lib/rustlib/$(rustc_host_target)/lib
+
+rusttest-prepare: FORCE
+	$(call if_changed,rustsysroot)
+
+rusttest-macros: private rustc_target_flags = --extern proc_macro
+rusttest-macros: private rustdoc_test_target_flags = --crate-type proc-macro
+rusttest-macros: $(srctree)/rust/macros/lib.rs rusttest-prepare FORCE
+	$(call if_changed,rustc_test)
+	$(call if_changed,rustdoc_test)
+
+rusttest-kernel: private rustc_target_flags = --extern alloc \
+    --extern build_error --extern macros
+rusttest-kernel: private rustc_test_run_flags = \
+    --skip bindgen_test_layout_
+rusttest-kernel: $(srctree)/rust/kernel/lib.rs rusttest-prepare \
+    rusttestlib-build_error rusttestlib-macros FORCE
+	$(call if_changed,rustc_test)
+	$(call if_changed,rustc_test_library)
+	$(call if_changed,rustdoc_test)
+
+ifdef CONFIG_CC_IS_CLANG
+bindgen_c_flags = $(c_flags)
+else
+# bindgen relies on libclang to parse C. Ideally, bindgen would support a GCC
+# plugin backend and/or the Clang driver would be perfectly compatible with GCC.
+#
+# For the moment, here we are tweaking the flags on the fly. This is a hack,
+# and some kernel configurations may not work (e.g. `GCC_PLUGIN_RANDSTRUCT`
+# if we end up using one of those structs).
+bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
+	-mskip-rax-setup -mgeneral-regs-only -msign-return-address=% \
+	-mindirect-branch=thunk-extern -mindirect-branch-register -mrecord-mcount \
+	-mabi=lp64 -mstack-protector-guard% -mtraceback=no \
+	-mno-pointers-to-nested-functions -mno-string -mno-strict-align \
+	-mstrict-align \
+	-fconserve-stack -falign-jumps=% -falign-loops=% \
+	-femit-struct-debug-baseonly -fno-ipa-cp-clone -fno-ipa-sra \
+	-fno-partial-inlining -fplugin-arg-arm_ssp_per_task_plugin-% \
+	-fno-reorder-blocks -fno-allow-store-data-races -fasan-shadow-offset=% \
+	-fzero-call-used-regs=% -fno-stack-clash-protection \
+	-fno-inline-functions-called-once \
+	--param=% --param asan-%
+
+# Derived from `scripts/Makefile.clang`
+BINDGEN_TARGET_arm	:= arm-linux-gnueabi
+BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
+BINDGEN_TARGET_riscv	:= riscv64-linux-gnu
+BINDGEN_TARGET_x86	:= x86_64-linux-gnu
+BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
+
+# All warnings are inhibited since GCC builds are very experimental,
+# many GCC warnings are not supported by Clang, they may only appear in
+# some configurations, with new GCC versions, etc.
+bindgen_extra_c_flags = -w --target=$(BINDGEN_TARGET)
+
+bindgen_c_flags = $(filter-out $(bindgen_skip_c_flags), $(c_flags)) \
+	$(bindgen_extra_c_flags)
+endif
+
+ifdef CONFIG_LTO
+bindgen_c_flags_lto = $(filter-out $(CC_FLAGS_LTO), $(bindgen_c_flags))
+else
+bindgen_c_flags_lto = $(bindgen_c_flags)
+endif
+
+bindgen_c_flags_final = $(bindgen_c_flags_lto)
+
+quiet_cmd_bindgen = BINDGEN $@
+      cmd_bindgen = \
+	$(BINDGEN) $< $(bindgen_target_flags) \
+		--use-core --with-derive-default --ctypes-prefix c_types \
+		--no-debug '.*' \
+		--size_t-is-usize -o $@ -- $(bindgen_c_flags_final) -DMODULE \
+		$(bindgen_target_cflags) $(bindgen_target_extra)
+
+$(objtree)/rust/bindings_generated.rs: private bindgen_target_flags = \
+    $(shell grep -v '^\#\|^$$' $(srctree)/rust/bindgen_parameters)
+$(objtree)/rust/bindings_generated.rs: $(srctree)/rust/kernel/bindings_helper.h \
+    $(srctree)/rust/bindgen_parameters FORCE
+	$(call if_changed_dep,bindgen)
+
+# See `CFLAGS_REMOVE_helpers.o` above. In addition, Clang on C does not warn
+# with `-Wmissing-declarations` (unlike GCC), so it is not strictly needed here
+# given it is `libclang`; but for consistency, future Clang changes and/or
+# a potential future GCC backend for `bindgen`, we disable it too.
+$(objtree)/rust/bindings_helpers_generated.rs: private bindgen_target_flags = \
+    --blacklist-type '.*' --whitelist-var '' --whitelist-function 'rust_helper_.*'
+$(objtree)/rust/bindings_helpers_generated.rs: private bindgen_target_cflags = \
+    -I$(objtree)/rust/ -Wno-missing-prototypes -Wno-missing-declarations
+$(objtree)/rust/bindings_helpers_generated.rs: private bindgen_target_extra = ; \
+    sed -Ei 's/pub fn rust_helper_([a-zA-Z0-9_]*)/#[link_name="rust_helper_\1"]\n    pub fn \1/g' $@
+$(objtree)/rust/bindings_helpers_generated.rs: $(srctree)/rust/helpers.c FORCE
+	$(call if_changed_dep,bindgen)
+
+quiet_cmd_exports = EXPORTS $@
+      cmd_exports = \
+	$(NM) -p --defined-only $< \
+		| grep -E ' (T|R|D) ' | cut -d ' ' -f 3 \
+		| xargs -Isymbol \
+		echo 'EXPORT_SYMBOL_RUST_GPL(symbol);' > $@
+
+$(objtree)/rust/exports_core_generated.h: $(objtree)/rust/core.o FORCE
+	$(call if_changed,exports)
+
+$(objtree)/rust/exports_alloc_generated.h: $(objtree)/rust/alloc.o FORCE
+	$(call if_changed,exports)
+
+$(objtree)/rust/exports_kernel_generated.h: $(objtree)/rust/kernel.o FORCE
+	$(call if_changed,exports)
+
+# `-Cpanic=unwind -Cforce-unwind-tables=y` overrides `rust_flags` in order to
+# avoid the https://github.com/rust-lang/rust/issues/82320 rustc crash.
+quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
+      cmd_rustc_procmacro = \
+	$(RUSTC_OR_CLIPPY) $(rust_flags) \
+		--emit=dep-info,link --extern proc_macro \
+		-Cpanic=unwind -Cforce-unwind-tables=y \
+		--crate-type proc-macro --out-dir $(objtree)/rust/ \
+		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<; \
+	mv $(objtree)/rust/$(patsubst lib%.so,%,$(notdir $@)).d $(depfile); \
+	sed -i '/^\#/d' $(depfile)
+
+# Procedural macros can only be used with the `rustc` that compiled it.
+# Therefore, to get `libmacros.so` automatically recompiled when the compiler
+# version changes, we add `core.o` as a dependency (even if it is not needed).
+$(objtree)/rust/libmacros.so: $(srctree)/rust/macros/lib.rs \
+	$(objtree)/rust/core.o FORCE
+	$(call if_changed_dep,rustc_procmacro)
+
+quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
+      cmd_rustc_library = \
+	OBJTREE=$(abspath $(objtree)) \
+	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
+		$(filter-out $(skip_flags),$(rust_flags) $(rust_cross_flags) $(rustc_target_flags)) \
+		--emit=dep-info,obj,metadata \
+		--crate-type rlib --out-dir $(objtree)/rust/ -L $(objtree)/rust/ \
+		--crate-name $(patsubst %.o,%,$(notdir $@)) $<; \
+	mv $(objtree)/rust/$(patsubst %.o,%,$(notdir $@)).d $(depfile); \
+	sed -i '/^\#/d' $(depfile) \
+	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
+
+# `$(rust_flags)` is passed in case the user added `--sysroot`.
+rustc_sysroot := $(shell $(RUSTC) $(rust_flags) --print sysroot)
+rustc_host_target := $(shell $(RUSTC) --version --verbose | grep -F 'host: ' | cut -d' ' -f2)
+RUST_LIB_SRC ?= $(rustc_sysroot)/lib/rustlib/src/rust/library
+
+rust-analyzer:
+	$(Q)$(srctree)/scripts/generate_rust_analyzer.py $(srctree) $(objtree) $(RUST_LIB_SRC) > $(objtree)/rust-project.json
+
+$(objtree)/rust/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
+$(objtree)/rust/compiler_builtins.o: $(srctree)/rust/compiler_builtins.rs \
+    $(objtree)/rust/core.o FORCE
+	$(call if_changed_dep,rustc_library)
+
+$(objtree)/rust/alloc.o: private skip_clippy = 1
+$(objtree)/rust/alloc.o: private skip_flags = -Dunreachable_pub
+$(objtree)/rust/alloc.o: private rustc_target_flags = $(alloc-cfgs)
+$(objtree)/rust/alloc.o: $(srctree)/rust/alloc/lib.rs \
+    $(objtree)/rust/compiler_builtins.o FORCE
+	$(call if_changed_dep,rustc_library)
+
+$(objtree)/rust/build_error.o: $(srctree)/rust/build_error.rs \
+    $(objtree)/rust/compiler_builtins.o FORCE
+	$(call if_changed_dep,rustc_library)
+
+$(objtree)/rust/kernel.o: private rustc_target_flags = --extern alloc \
+    --extern build_error \
+    --extern macros
+$(objtree)/rust/kernel.o: $(srctree)/rust/kernel/lib.rs $(objtree)/rust/alloc.o \
+    $(objtree)/rust/build_error.o \
+    $(objtree)/rust/libmacros.so $(objtree)/rust/bindings_generated.rs \
+    $(objtree)/rust/bindings_helpers_generated.rs FORCE
+	$(call if_changed_dep,rustc_library)
+
+$(objtree)/rust/core.o: private skip_clippy = 1
+$(objtree)/rust/core.o: private skip_flags = -Dunreachable_pub --edition=2021
+$(objtree)/rust/core.o: private rustc_target_flags = $(core-cfgs) --edition=2018
+$(objtree)/rust/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
+	$(call if_changed_dep,rustc_library)
+
+rustdoc-core: private rustc_target_flags = $(core-cfgs)
+rustdoc-core: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
+	$(call if_changed,rustdoc)
+
+endif # CONFIG_RUST
diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
new file mode 100644
index 000000000000..c2cc4a88234e
--- /dev/null
+++ b/rust/bindgen_parameters
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+
+--opaque-type xregs_state
+--opaque-type desc_struct
+--opaque-type arch_lbr_state
+--opaque-type local_apic
+
+# If SMP is disabled, `arch_spinlock_t` is defined as a ZST which triggers a Rust
+# warning. We don't need to peek into it anyway.
+--opaque-type spinlock
+
+# `seccomp`'s comment gets understood as a doctest
+--no-doc-comments
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 0496efd6e117..83e850321eb6 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -36,12 +36,12 @@ ld-option = $(success,$(LD) -v $(1))
 as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
 
 # check if $(CC) and $(LD) exist
-$(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
+$(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)
 $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
 
-# Get the compiler name, version, and error out if it is not supported.
+# Get the C compiler name, version, and error out if it is not supported.
 cc-info := $(shell,$(srctree)/scripts/cc-version.sh $(CC))
-$(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this compiler is not supported.)
+$(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this C compiler is not supported.)
 cc-name := $(shell,set -- $(cc-info) && echo $1)
 cc-version := $(shell,set -- $(cc-info) && echo $2)
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a4b89b757287..a461b34cabe7 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -26,6 +26,7 @@ EXTRA_CPPFLAGS :=
 EXTRA_LDFLAGS  :=
 asflags-y  :=
 ccflags-y  :=
+rustflags-y :=
 cppflags-y :=
 ldflags-y  :=
 
@@ -324,6 +325,70 @@ quiet_cmd_cc_lst_c = MKLST   $@
 $(obj)/%.lst: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
+# Compile Rust sources (.rs)
+# ---------------------------------------------------------------------------
+
+# Need to use absolute path here and have symbolic links resolved;
+# otherwise rustdoc and rustc compute different hashes for the target.
+rust_cross_flags := --target=$(realpath $(KBUILD_RUST_TARGET))
+
+rust_allowed_features := allocator_api,bench_black_box,concat_idents,generic_associated_types,global_asm
+
+rust_common_cmd = \
+	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) \
+	$(rust_flags) $(rust_cross_flags) \
+	-Zallow-features=$(rust_allowed_features) \
+	-Zcrate-attr=no_std \
+	-Zcrate-attr='feature($(rust_allowed_features))' \
+	--extern alloc --extern kernel \
+	--crate-type rlib --out-dir $(obj) -L $(objtree)/rust/ \
+	--crate-name $(basename $(notdir $@))
+
+rust_handle_depfile = \
+	mv $(obj)/$(basename $(notdir $@)).d $(depfile); \
+	sed -i '/^\#/d' $(depfile)
+
+# `--emit=obj`, `--emit=asm` and `--emit=llvm-ir` imply a single codegen unit
+# will be used. We explicitly request `-Ccodegen-units=1` in any case, and
+# the compiler shows a warning if it is not 1. However, if we ever stop
+# requesting it explicitly and we start using some other `--emit` that does not
+# imply it (and for which codegen is performed), then we would be out of sync,
+# i.e. the outputs we would get for the different single targets (e.g. `.ll`)
+# would not match each other.
+
+quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
+      cmd_rustc_o_rs = \
+	$(rust_common_cmd) --emit=dep-info,obj $<; \
+	$(rust_handle_depfile)
+
+$(obj)/%.o: $(src)/%.rs FORCE
+	$(call if_changed_dep,rustc_o_rs)
+
+quiet_cmd_rustc_i_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
+      cmd_rustc_i_rs = \
+	$(rust_common_cmd) --emit=dep-info -Zunpretty=expanded $< >$@; \
+	command -v $(RUSTFMT) >/dev/null && $(RUSTFMT) $@; \
+	$(rust_handle_depfile)
+
+$(obj)/%.i: $(src)/%.rs FORCE
+	$(call if_changed_dep,rustc_i_rs)
+
+quiet_cmd_rustc_s_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
+      cmd_rustc_s_rs = \
+	$(rust_common_cmd) --emit=dep-info,asm $<; \
+	$(rust_handle_depfile)
+
+$(obj)/%.s: $(src)/%.rs FORCE
+	$(call if_changed_dep,rustc_s_rs)
+
+quiet_cmd_rustc_ll_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
+      cmd_rustc_ll_rs = \
+	$(rust_common_cmd) --emit=dep-info,llvm-ir $<; \
+	$(rust_handle_depfile)
+
+$(obj)/%.ll: $(src)/%.rs FORCE
+	$(call if_changed_dep,rustc_ll_rs)
+
 # Compile assembler sources (.S)
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
index 9f39b0130551..fe87389d52c0 100644
--- a/scripts/Makefile.debug
+++ b/scripts/Makefile.debug
@@ -1,4 +1,5 @@
 DEBUG_CFLAGS	:=
+DEBUG_RUSTFLAGS	:=
 
 ifdef CONFIG_DEBUG_INFO_SPLIT
 DEBUG_CFLAGS	+= -gsplit-dwarf
@@ -10,6 +11,12 @@ ifndef CONFIG_AS_IS_LLVM
 KBUILD_AFLAGS	+= -Wa,-gdwarf-2
 endif
 
+ifdef CONFIG_DEBUG_INFO_REDUCED
+DEBUG_RUSTFLAGS += -Cdebuginfo=1
+else
+DEBUG_RUSTFLAGS += -Cdebuginfo=2
+endif
+
 ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
 dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
 dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
@@ -31,3 +38,6 @@ endif
 
 KBUILD_CFLAGS += $(DEBUG_CFLAGS)
 export DEBUG_CFLAGS
+
+KBUILD_RUSTFLAGS += $(DEBUG_RUSTFLAGS)
+export DEBUG_RUSTFLAGS
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 79be57fdd32a..6ac8ae2fc3b6 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -8,6 +8,7 @@ ldflags-y  += $(EXTRA_LDFLAGS)
 # flags that take effect in current and sub directories
 KBUILD_AFLAGS += $(subdir-asflags-y)
 KBUILD_CFLAGS += $(subdir-ccflags-y)
+KBUILD_RUSTFLAGS += $(subdir-rustflags-y)
 
 # Figure out what we need to build from the various variables
 # ===========================================================================
@@ -133,6 +134,10 @@ _c_flags       = $(filter-out $(CFLAGS_REMOVE_$(target-stem).o), \
                      $(filter-out $(ccflags-remove-y), \
                          $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(ccflags-y)) \
                      $(CFLAGS_$(target-stem).o))
+_rust_flags    = $(filter-out $(RUSTFLAGS_REMOVE_$(target-stem).o), \
+                     $(filter-out $(rustflags-remove-y), \
+                         $(KBUILD_RUSTFLAGS) $(rustflags-y)) \
+                     $(RUSTFLAGS_$(target-stem).o))
 _a_flags       = $(filter-out $(AFLAGS_REMOVE_$(target-stem).o), \
                      $(filter-out $(asflags-remove-y), \
                          $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) $(asflags-y)) \
@@ -207,6 +212,11 @@ modkern_cflags =                                          \
 		$(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
 		$(KBUILD_CFLAGS_KERNEL) $(CFLAGS_KERNEL) $(modfile_flags))
 
+modkern_rustflags =                                              \
+	$(if $(part-of-module),                                   \
+		$(KBUILD_RUSTFLAGS_MODULE) $(RUSTFLAGS_MODULE), \
+		$(KBUILD_RUSTFLAGS_KERNEL) $(RUSTFLAGS_KERNEL))
+
 modkern_aflags = $(if $(part-of-module),				\
 			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
 			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
@@ -216,6 +226,8 @@ c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_c_flags) $(modkern_cflags)                           \
 		 $(basename_flags) $(modname_flags)
 
+rust_flags     = $(_rust_flags) $(modkern_rustflags) @$(objtree)/include/generated/rustc_cfg
+
 a_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_a_flags) $(modkern_aflags)
 
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 7f39599e9fae..670d7997a38b 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -39,11 +39,13 @@ quiet_cmd_ld_ko_o = LD [M]  $@
 
 quiet_cmd_btf_ko = BTF [M] $@
       cmd_btf_ko = 							\
-	if [ -f vmlinux ]; then						\
+	if [ ! -f vmlinux ]; then					\
+		printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
+	elif [ -n "$(CONFIG_RUST)" ] && $(srctree)/scripts/is_rust_module.sh $@; then 		\
+		printf "Skipping BTF generation for %s because it's a Rust module\n" $@ 1>&2; \
+	else								\
 		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) --btf_base vmlinux $@; \
 		$(RESOLVE_BTFIDS) -b vmlinux $@; 			\
-	else								\
-		printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
 	fi;
 
 # Same as newer-prereqs, but allows to exclude specified extra dependencies
diff --git a/scripts/cc-version.sh b/scripts/cc-version.sh
index f1952c522466..2401c86fcf53 100755
--- a/scripts/cc-version.sh
+++ b/scripts/cc-version.sh
@@ -1,13 +1,13 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 #
-# Print the compiler name and its version in a 5 or 6-digit form.
+# Print the C compiler name and its version in a 5 or 6-digit form.
 # Also, perform the minimum version check.
 
 set -e
 
-# Print the compiler name and some version components.
-get_compiler_info()
+# Print the C compiler name and some version components.
+get_c_compiler_info()
 {
 	cat <<- EOF | "$@" -E -P -x c - 2>/dev/null
 	#if defined(__clang__)
@@ -32,7 +32,7 @@ get_canonical_version()
 
 # $@ instead of $1 because multiple words might be given, e.g. CC="ccache gcc".
 orig_args="$@"
-set -- $(get_compiler_info "$@")
+set -- $(get_c_compiler_info "$@")
 
 name=$1
 
@@ -52,7 +52,7 @@ ICC)
 	min_version=$($min_tool_version icc)
 	;;
 *)
-	echo "$orig_args: unknown compiler" >&2
+	echo "$orig_args: unknown C compiler" >&2
 	exit 1
 	;;
 esac
@@ -62,7 +62,7 @@ min_cversion=$(get_canonical_version $min_version)
 
 if [ "$cversion" -lt "$min_cversion" ]; then
 	echo >&2 "***"
-	echo >&2 "*** Compiler is too old."
+	echo >&2 "*** C compiler is too old."
 	echo >&2 "***   Your $name version:    $version"
 	echo >&2 "***   Minimum $name version: $min_version"
 	echo >&2 "***"
diff --git a/scripts/is_rust_module.sh b/scripts/is_rust_module.sh
new file mode 100755
index 000000000000..277a64d07f22
--- /dev/null
+++ b/scripts/is_rust_module.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# is_rust_module.sh module.ko
+#
+# Returns `0` if `module.ko` is a Rust module, `1` otherwise.
+
+set -e
+
+# Using the `16_` prefix ensures other symbols with the same substring
+# are not picked up (even if it would be unlikely). The last part is
+# used just in case LLVM decides to use the `.` suffix.
+${NM} "$*" | grep -qE '^[0-9a-fA-F]+ r _R[^[:space:]]+16___IS_RUST_MODULE[^[:space:]]*$'
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 59717be31210..ae54319cdde4 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -216,6 +216,13 @@ static const char *conf_get_autoheader_name(void)
 	return name ? name : "include/generated/autoconf.h";
 }
 
+static const char *conf_get_rustccfg_name(void)
+{
+	char *name = getenv("KCONFIG_RUSTCCFG");
+
+	return name ? name : "include/generated/rustc_cfg";
+}
+
 static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 {
 	char *p2;
@@ -605,6 +612,9 @@ static const struct comment_style comment_style_c = {
 
 static void conf_write_heading(FILE *fp, const struct comment_style *cs)
 {
+	if (!cs)
+		return;
+
 	fprintf(fp, "%s\n", cs->prefix);
 
 	fprintf(fp, "%s Automatically generated file; DO NOT EDIT.\n",
@@ -752,6 +762,65 @@ static void print_symbol_for_c(FILE *fp, struct symbol *sym)
 	free(escaped);
 }
 
+static void print_symbol_for_rustccfg(FILE *fp, struct symbol *sym)
+{
+	const char *val;
+	const char *val_prefix = "";
+	char *val_prefixed = NULL;
+	size_t val_prefixed_len;
+	char *escaped = NULL;
+
+	if (sym->type == S_UNKNOWN)
+		return;
+
+	val = sym_get_string_value(sym);
+
+	switch (sym->type) {
+	case S_BOOLEAN:
+	case S_TRISTATE:
+		/*
+		 * We do not care about disabled ones, i.e. no need for
+		 * what otherwise are "comments" in other printers.
+		 */
+		if (*val == 'n')
+			return;
+
+		/*
+		 * To have similar functionality to the C macro `IS_ENABLED()`
+		 * we provide an empty `--cfg CONFIG_X` here in both `y`
+		 * and `m` cases.
+		 *
+		 * Then, the common `fprintf()` below will also give us
+		 * a `--cfg CONFIG_X="y"` or `--cfg CONFIG_X="m"`, which can
+		 * be used as the equivalent of `IS_BUILTIN()`/`IS_MODULE()`.
+		 */
+		fprintf(fp, "--cfg=%s%s\n", CONFIG_, sym->name);
+		break;
+	case S_HEX:
+		if (val[0] != '0' || (val[1] != 'x' && val[1] != 'X'))
+			val_prefix = "0x";
+		break;
+	default:
+		break;
+	}
+
+	if (strlen(val_prefix) > 0) {
+		val_prefixed_len = strlen(val) + strlen(val_prefix) + 1;
+		val_prefixed = xmalloc(val_prefixed_len);
+		snprintf(val_prefixed, val_prefixed_len, "%s%s", val_prefix, val);
+		val = val_prefixed;
+	}
+
+	/* All values get escaped: the `--cfg` option only takes strings */
+	escaped = escape_string_value(val);
+	val = escaped;
+
+	fprintf(fp, "--cfg=%s%s=%s\n", CONFIG_, sym->name, val);
+
+	free(escaped);
+	free(val_prefixed);
+}
+
 /*
  * Write out a minimal config.
  * All values that has default values are skipped as this is redundant.
@@ -1131,6 +1200,12 @@ int conf_write_autoconf(int overwrite)
 	if (ret)
 		return ret;
 
+	ret = __conf_write_autoconf(conf_get_rustccfg_name(),
+				    print_symbol_for_rustccfg,
+				    NULL);
+	if (ret)
+		return ret;
+
 	/*
 	 * Create include/config/auto.conf. This must be the last step because
 	 * Kbuild has a dependency on auto.conf and this marks the successful
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index 7c20252a90c6..117797d7e0c7 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -31,6 +31,12 @@ llvm)
 		echo 11.0.0
 	fi
 	;;
+rustc)
+	echo 1.58.0
+	;;
+bindgen)
+	echo 0.56.0
+	;;
 *)
 	echo "$1: unknown tool" >&2
 	exit 1
diff --git a/scripts/rust-is-available-bindgen-libclang.h b/scripts/rust-is-available-bindgen-libclang.h
new file mode 100644
index 000000000000..0ef6db10d674
--- /dev/null
+++ b/scripts/rust-is-available-bindgen-libclang.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#pragma message("clang version " __clang_version__)
diff --git a/scripts/rust-is-available.sh b/scripts/rust-is-available.sh
new file mode 100755
index 000000000000..6bd395167d0f
--- /dev/null
+++ b/scripts/rust-is-available.sh
@@ -0,0 +1,158 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Tests whether a suitable Rust toolchain is available.
+#
+# Pass `-v` for human output and more checks (as warnings).
+
+set -e
+
+min_tool_version=$(dirname $0)/min-tool-version.sh
+
+# Convert the version string x.y.z to a canonical up-to-7-digits form.
+#
+# Note that this function uses one more digit (compared to other
+# instances in other version scripts) to give a bit more space to
+# `rustc` since it will reach 1.100.0 in late 2026.
+get_canonical_version()
+{
+	IFS=.
+	set -- $1
+	echo $((100000 * $1 + 100 * $2 + $3))
+}
+
+# Check that the Rust compiler exists.
+if ! command -v "$RUSTC" >/dev/null; then
+	if [ "$1" = -v ]; then
+		echo >&2 "***"
+		echo >&2 "*** Rust compiler '$RUSTC' could not be found."
+		echo >&2 "***"
+	fi
+	exit 1
+fi
+
+# Check that the Rust bindings generator exists.
+if ! command -v "$BINDGEN" >/dev/null; then
+	if [ "$1" = -v ]; then
+		echo >&2 "***"
+		echo >&2 "*** Rust bindings generator '$BINDGEN' could not be found."
+		echo >&2 "***"
+	fi
+	exit 1
+fi
+
+# Check that the Rust compiler version is suitable.
+#
+# Non-stable and distributions' versions may have a version suffix, e.g. `-dev`.
+rust_compiler_version=$( \
+	LC_ALL=C "$RUSTC" --version 2>/dev/null \
+		| head -n 1 \
+		| grep -oE '[0-9]+\.[0-9]+\.[0-9]+' \
+)
+rust_compiler_min_version=$($min_tool_version rustc)
+rust_compiler_cversion=$(get_canonical_version $rust_compiler_version)
+rust_compiler_min_cversion=$(get_canonical_version $rust_compiler_min_version)
+if [ "$rust_compiler_cversion" -lt "$rust_compiler_min_cversion" ]; then
+	if [ "$1" = -v ]; then
+		echo >&2 "***"
+		echo >&2 "*** Rust compiler '$RUSTC' is too old."
+		echo >&2 "***   Your version:    $rust_compiler_version"
+		echo >&2 "***   Minimum version: $rust_compiler_min_version"
+		echo >&2 "***"
+	fi
+	exit 1
+fi
+if [ "$1" = -v ] && [ "$rust_compiler_cversion" -gt "$rust_compiler_min_cversion" ]; then
+	echo >&2 "***"
+	echo >&2 "*** Rust compiler '$RUSTC' is too new. This may or may not work."
+	echo >&2 "***   Your version:     $rust_compiler_version"
+	echo >&2 "***   Expected version: $rust_compiler_min_version"
+	echo >&2 "***"
+fi
+
+# Check that the Rust bindings generator is suitable.
+#
+# Non-stable and distributions' versions may have a version suffix, e.g. `-dev`.
+rust_bindings_generator_version=$( \
+	LC_ALL=C "$BINDGEN" --version 2>/dev/null \
+		| head -n 1 \
+		| grep -oE '[0-9]+\.[0-9]+\.[0-9]+' \
+)
+rust_bindings_generator_min_version=$($min_tool_version bindgen)
+rust_bindings_generator_cversion=$(get_canonical_version $rust_bindings_generator_version)
+rust_bindings_generator_min_cversion=$(get_canonical_version $rust_bindings_generator_min_version)
+if [ "$rust_bindings_generator_cversion" -lt "$rust_bindings_generator_min_cversion" ]; then
+	if [ "$1" = -v ]; then
+		echo >&2 "***"
+		echo >&2 "*** Rust bindings generator '$BINDGEN' is too old."
+		echo >&2 "***   Your version:    $rust_bindings_generator_version"
+		echo >&2 "***   Minimum version: $rust_bindings_generator_min_version"
+		echo >&2 "***"
+	fi
+	exit 1
+fi
+if [ "$1" = -v ] && [ "$rust_bindings_generator_cversion" -gt "$rust_bindings_generator_min_cversion" ]; then
+	echo >&2 "***"
+	echo >&2 "*** Rust bindings generator '$BINDGEN' is too new. This may or may not work."
+	echo >&2 "***   Your version:     $rust_bindings_generator_version"
+	echo >&2 "***   Expected version: $rust_bindings_generator_min_version"
+	echo >&2 "***"
+fi
+
+# Check that the `libclang` used by the Rust bindings generator is suitable.
+bindgen_libclang_version=$( \
+	LC_ALL=C "$BINDGEN" $(dirname $0)/rust-is-available-bindgen-libclang.h 2>&1 >/dev/null \
+		| grep -F 'clang version ' \
+		| grep -oE '[0-9]+\.[0-9]+\.[0-9]+' \
+)
+bindgen_libclang_min_version=$($min_tool_version llvm)
+bindgen_libclang_cversion=$(get_canonical_version $bindgen_libclang_version)
+bindgen_libclang_min_cversion=$(get_canonical_version $bindgen_libclang_min_version)
+if [ "$bindgen_libclang_cversion" -lt "$bindgen_libclang_min_cversion" ]; then
+	if [ "$1" = -v ]; then
+		echo >&2 "***"
+		echo >&2 "*** libclang (used by the Rust bindings generator '$BINDGEN') is too old."
+		echo >&2 "***   Your version:    $bindgen_libclang_version"
+		echo >&2 "***   Minimum version: $bindgen_libclang_min_version"
+		echo >&2 "***"
+	fi
+	exit 1
+fi
+
+# If the C compiler is Clang, then we can also check whether its version
+# matches the `libclang` version used by the Rust bindings generator.
+#
+# In the future, we might be able to perform a full version check, see
+# https://github.com/rust-lang/rust-bindgen/issues/2138.
+if [ "$1" = -v ]; then
+	cc_name=$($(dirname $0)/cc-version.sh "$CC" | cut -f1 -d' ')
+	if [ "$cc_name" = Clang ]; then
+		clang_version=$( \
+			LC_ALL=C "$CC" --version 2>/dev/null \
+				| sed -nE '1s:.*version ([0-9]+\.[0-9]+\.[0-9]+).*:\1:p'
+		)
+		if [ "$clang_version" != "$bindgen_libclang_version" ]; then
+			echo >&2 "***"
+			echo >&2 "*** libclang (used by the Rust bindings generator '$BINDGEN') version does not match Clang's. This may be a problem."
+			echo >&2 "***   libclang version: $bindgen_libclang_version"
+			echo >&2 "***   Clang version:    $clang_version"
+			echo >&2 "***"
+		fi
+	fi
+fi
+
+# Check that the source code for the `core` standard library exists.
+#
+# `$KRUSTFLAGS` is passed in case the user added `--sysroot`.
+rustc_sysroot=$("$RUSTC" $KRUSTFLAGS --print sysroot)
+rustc_src=${RUST_LIB_SRC:-"$rustc_sysroot/lib/rustlib/src/rust/library"}
+rustc_src_core="$rustc_src/core/src/lib.rs"
+if [ ! -e "$rustc_src_core" ]; then
+	if [ "$1" = -v ]; then
+		echo >&2 "***"
+		echo >&2 "*** Source code for the 'core' standard library could not be found"
+		echo >&2 "*** at '$rustc_src_core'."
+		echo >&2 "***"
+	fi
+	exit 1
+fi
-- 
2.35.1

