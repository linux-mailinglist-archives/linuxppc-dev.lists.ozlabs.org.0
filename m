Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D1E2B9C58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 21:58:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcX8j4X2szDqsR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 07:58:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TuQ+aCJq; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcX6m1Hc7zDqpK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 07:57:00 +1100 (AEDT)
Received: by mail-qv1-xf43.google.com with SMTP id e14so3625949qve.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 12:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vq4heGGOiTGN9G1IkRD8WBrcjSjOcI+6TZTWqb+P7Dk=;
 b=TuQ+aCJqLp/aYCIAvi4OiWm+b3PzclZk3A3w9PPhbIS/Gp6kUjgEgg/xNWO00Mzaok
 EWPH0Lj7OhJMyuPPnfmDHRIbw3W3RR/kgAwscHVkKgJbaIALMGvKVRbOBkyFXFiUWwoe
 J957tfSP19bjmU/BDVr7jhL+rWCh+SzfZ9Kug0ytl1vVN8twrynFqaozdt13kMIs9rjh
 smQbVrXqoG/7uvWlL0y2jERz2uw3rIb9Xog4zAylbIPfqXeKh9v8CAm3RiM+VAoHYkum
 thYoUw+e2O2Q2WZfqNeFfueIoU2BCL1XHXX0cJOg20wURF1Jt/xGFvGwyb6C6kDSDqsA
 mxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vq4heGGOiTGN9G1IkRD8WBrcjSjOcI+6TZTWqb+P7Dk=;
 b=tzk/wiFgWgDSQd+Je+rGizdz7cItisOQumbXPL8O6a6/RFbYxWUu8GKWALcXpcooh3
 +85+QDyTLtuHmykeMuP1jDskkRwzOdNa7AO5TpeO8ikWutB5+eL9vzzWsrd7Ifk8XQfq
 ljq0dTPJ+OZZEnboeWh5HEDbpxrW+LbQvYyc8QikJF0+l9Mi6ra4TecPEtK0aqkAJwD5
 8XmQtmaz9ZeJbqRKdZpw14tMfKDiS62WauoKo6/94hzGT1RY9k8hGeYEDZyld2LLP1LQ
 ogoVCNd3jD2RLubTh/XftLOjZKe2pvzgFpYiFMr7JmD9KIofEcOH3+8n94Uyj5wF0lTf
 9KFw==
X-Gm-Message-State: AOAM532f1riyP66Kzg5iEekqH1zW4cSRFG+ZizIKSUuzVJV2150Q9inS
 oSisKkHn1e6gH4JkULqYijg=
X-Google-Smtp-Source: ABdhPJypZt09uuNdlBqteAvTQS+8+/tHJeQ/+oDwNT1iNOxVBzNrmEik0WF6994ZaxuP6abwAph6dQ==
X-Received: by 2002:a05:6214:1541:: with SMTP id
 t1mr12336433qvw.61.1605819416229; 
 Thu, 19 Nov 2020 12:56:56 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id 82sm714348qke.76.2020.11.19.12.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 12:56:55 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
Date: Thu, 19 Nov 2020 13:46:56 -0700
Message-Id: <20201119204656.3261686-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113195553.1487659-1-natechancellor@gmail.com>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Arvind Sankar <nivedita@alum.mit.edu>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, '--orphan-handling=warn' is spread out across four different
architectures in their respective Makefiles, which makes it a little
unruly to deal with in case it needs to be disabled for a specific
linker version (in this case, ld.lld 10.0.1).

To make it easier to control this, hoist this warning into Kconfig and
the main Makefile so that disabling it is simpler, as the warning will
only be enabled in a couple places (main Makefile and a couple of
compressed boot folders that blow away LDFLAGS_vmlinx) and making it
conditional is easier due to Kconfig syntax. One small additional
benefit of this is saving a call to ld-option on incremental builds
because we will have already evaluated it for CONFIG_LD_ORPHAN_WARN.

To keep the list of supported architectures the same, introduce
CONFIG_ARCH_WANT_LD_ORPHAN_WARN, which an architecture can select to
gain this automatically after all of the sections are specified and size
asserted. A special thanks to Kees Cook for the help text on this
config.

Link: https://github.com/ClangBuiltLinux/linux/issues/1187
Acked-by: Kees Cook <keescook@chromium.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* Change

  ifeq ($(CONFIG_LD_ORPHAN_WARN),y)

  to

  ifdef CONFIG_LD_ORPHAN_WARN

  to improve readability (Michael Ellerman)

* Separate conditions for CONFIG_LD_ORPHAN warn to improve
  readability (Kees Cook)

* Pick up tags from Kees, Michael, and Nick

 Makefile                          | 6 ++++++
 arch/Kconfig                      | 9 +++++++++
 arch/arm/Kconfig                  | 1 +
 arch/arm/Makefile                 | 4 ----
 arch/arm/boot/compressed/Makefile | 4 +++-
 arch/arm64/Kconfig                | 1 +
 arch/arm64/Makefile               | 4 ----
 arch/powerpc/Kconfig              | 1 +
 arch/powerpc/Makefile             | 1 -
 arch/x86/Kconfig                  | 1 +
 arch/x86/Makefile                 | 3 ---
 arch/x86/boot/compressed/Makefile | 4 +++-
 init/Kconfig                      | 5 +++++
 13 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index e2c3f65c4721..2c7116299f1f 100644
--- a/Makefile
+++ b/Makefile
@@ -984,6 +984,12 @@ ifeq ($(CONFIG_RELR),y)
 LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr
 endif
 
+# We never want expected sections to be placed heuristically by the
+# linker. All sections should be explicitly named in the linker script.
+ifdef CONFIG_LD_ORPHAN_WARN
+LDFLAGS_vmlinux += --orphan-handling=warn
+endif
+
 # Align the bit size of userspace programs with the kernel
 KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
 KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
diff --git a/arch/Kconfig b/arch/Kconfig
index 56b6ccc0e32d..ba4e966484ab 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1028,6 +1028,15 @@ config HAVE_STATIC_CALL_INLINE
 	bool
 	depends on HAVE_STATIC_CALL
 
+config ARCH_WANT_LD_ORPHAN_WARN
+	bool
+	help
+	  An arch should select this symbol once all linker sections are explicitly
+	  included, size-asserted, or discarded in the linker scripts. This is
+	  important because we never want expected sections to be placed heuristically
+	  by the linker, since the locations of such sections can change between linker
+	  versions.
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fe2f17eb2b50..002e0cf025f5 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -35,6 +35,7 @@ config ARM
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
+	select ARCH_WANT_LD_ORPHAN_WARN
 	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
 	select BUILDTIME_TABLE_SORT if MMU
 	select CLONE_BACKWARDS
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 4d76eab2b22d..e15f76ca2887 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -16,10 +16,6 @@ LDFLAGS_vmlinux	+= --be8
 KBUILD_LDFLAGS_MODULE	+= --be8
 endif
 
-# We never want expected sections to be placed heuristically by the
-# linker. All sections should be explicitly named in the linker script.
-LDFLAGS_vmlinux += $(call ld-option, --orphan-handling=warn)
-
 GZFLAGS		:=-9
 #KBUILD_CFLAGS	+=-pipe
 
diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 47f001ca5499..e1567418a2b1 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -129,7 +129,9 @@ LDFLAGS_vmlinux += --no-undefined
 # Delete all temporary local symbols
 LDFLAGS_vmlinux += -X
 # Report orphan sections
-LDFLAGS_vmlinux += $(call ld-option, --orphan-handling=warn)
+ifdef CONFIG_LD_ORPHAN_WARN
+LDFLAGS_vmlinux += --orphan-handling=warn
+endif
 # Next argument is a linker script
 LDFLAGS_vmlinux += -T
 
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1515f6f153a0..a6b5b7ef40ae 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -81,6 +81,7 @@ config ARM64
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
+	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARM_AMBA
 	select ARM_ARCH_TIMER
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 5789c2d18d43..6a87d592bd00 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -28,10 +28,6 @@ LDFLAGS_vmlinux	+= --fix-cortex-a53-843419
   endif
 endif
 
-# We never want expected sections to be placed heuristically by the
-# linker. All sections should be explicitly named in the linker script.
-LDFLAGS_vmlinux += $(call ld-option, --orphan-handling=warn)
-
 ifeq ($(CONFIG_ARM64_USE_LSE_ATOMICS), y)
   ifneq ($(CONFIG_ARM64_LSE_ATOMICS), y)
 $(warning LSE atomics not supported by binutils)
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e9f13fe08492..5181872f9452 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -152,6 +152,7 @@ config PPC
 	select ARCH_USE_QUEUED_SPINLOCKS	if PPC_QUEUED_SPINLOCKS
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
+	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WEAK_RELEASE_ACQUIRE
 	select BINFMT_ELF
 	select BUILDTIME_TABLE_SORT
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a4d56f0a41d9..d9eb0da845e1 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -123,7 +123,6 @@ endif
 LDFLAGS_vmlinux-y := -Bstatic
 LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
 LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
-LDFLAGS_vmlinux += $(call ld-option,--orphan-handling=warn)
 
 ifdef CONFIG_PPC64
 ifeq ($(call cc-option-yn,-mcmodel=medium),y)
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f6946b81f74a..fbf26e0f7a6a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -100,6 +100,7 @@ config X86
 	select ARCH_WANT_DEFAULT_BPF_JIT	if X86_64
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
 	select ARCH_WANT_HUGE_PMD_SHARE
+	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANTS_THP_SWAP		if X86_64
 	select BUILDTIME_TABLE_SORT
 	select CLKEVT_I8253
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 154259f18b8b..1bf21746f4ce 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -209,9 +209,6 @@ ifdef CONFIG_X86_64
 LDFLAGS_vmlinux += -z max-page-size=0x200000
 endif
 
-# We never want expected sections to be placed heuristically by the
-# linker. All sections should be explicitly named in the linker script.
-LDFLAGS_vmlinux += $(call ld-option, --orphan-handling=warn)
 
 archscripts: scripts_basic
 	$(Q)$(MAKE) $(build)=arch/x86/tools relocs
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index ee249088cbfe..40b8fd375d52 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -61,7 +61,9 @@ KBUILD_LDFLAGS += $(call ld-option,--no-ld-generated-unwind-info)
 # Compressed kernel should be built as PIE since it may be loaded at any
 # address by the bootloader.
 LDFLAGS_vmlinux := -pie $(call ld-option, --no-dynamic-linker)
-LDFLAGS_vmlinux += $(call ld-option, --orphan-handling=warn)
+ifdef CONFIG_LD_ORPHAN_WARN
+LDFLAGS_vmlinux += --orphan-handling=warn
+endif
 LDFLAGS_vmlinux += -T
 
 hostprogs	:= mkpiggy
diff --git a/init/Kconfig b/init/Kconfig
index c9446911cf41..92c58b45abb8 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1348,6 +1348,11 @@ config LD_DEAD_CODE_DATA_ELIMINATION
 	  present. This option is not well tested yet, so use at your
 	  own risk.
 
+config LD_ORPHAN_WARN
+	def_bool y
+	depends on ARCH_WANT_LD_ORPHAN_WARN
+	depends on $(ld-option,--orphan-handling=warn)
+
 config SYSCTL
 	bool
 

base-commit: 09162bc32c880a791c6c0668ce0745cf7958f576
-- 
2.29.2

