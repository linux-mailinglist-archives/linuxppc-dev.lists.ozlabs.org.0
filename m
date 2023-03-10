Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9514D6B50AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 20:08:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYFvl31gyz3f8t
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 06:08:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LxEH6iUV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--maskray.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3dyalzackdgimaskraygoogle.comlinuxppc-devlists.ozlabs.org@flex--maskray.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LxEH6iUV;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYFtq4Qp8z3f3n
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 06:08:01 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id e195-20020a25e7cc000000b00a1e59ba7ed9so6663763ybh.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 11:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678475277;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fK32HCA5CEK3I1OSPAFiJP4orExE4ivImV9o1+O5Pgs=;
        b=LxEH6iUVJ8Ud+MSbSJ1bywctAFUXlXrIod3JRCgJ46Edv9Oe8Ve20gFj4XvBZFYnaB
         astsvOG4c/RdJci0z23qVYsPo5sK5r1Xbc5EpRQrU1h2CBYEzaZqbIM4nhiJ+FCJxCx0
         JXXXxUF+h6Ee4DH4hL4EsBDfF5Cq45cpT8+RNjYPO0b5/xehUckR0i1XTqMrXdre+eVz
         hNmc3VuXk6I7mlBynowuwBRs4qmhqBylCP7/WQ+cwA8FgTlEbAm611HSd++833GdExnZ
         SoEAimePtX0mL9JUWGWtYz0tGNbLBJYVr2N17rNhBrZZbcAY0u0HShnIOkAy/aJS+wvK
         FmMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678475277;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fK32HCA5CEK3I1OSPAFiJP4orExE4ivImV9o1+O5Pgs=;
        b=1IZmnB/2Uyjz5gO8R2KilsgHCrNvx5S8yvpTlT5L/bwtu8Ylx/rFDOgRiKtxSn7S+y
         Bkhy6gJydPeBHZfNayR8mjgnxBnxK8D1ZoAnQu+gEipDMJsxWLCMkegBO+5tFJvjvhEl
         JDyx58b3/SSMi2LUtBR37XwEAYYc6Wggai6yhj8wkhMAcBYSX3qpoQzbe5y6OWIWXyxt
         HR0qhtzXsT/wnnYeVSsdBS2vVQq+5rHNjKddR6S1J1OUQkvBE88MMHTy3PLOuLRMYeHE
         v3FSujZvV72EhQM9fxhtOcZcjtLuCrYr06/jn8iWdyKqAmDznUendgjBy6B1EfVedeJU
         J4Eg==
X-Gm-Message-State: AO0yUKXQfBeSoQgAhFo0X2jhg/4NLx6HjZFr0Ji+bC1YI342B4inIwfg
	onEMavTh/s9MT8lUPbjnz71+kmx4V6q4
X-Google-Smtp-Source: AK7set+EM8BzLBCwhTK0DWxwYdJHC/bm5m06bpWqpMb4VNF5gVdI36SpJH1I+JB+DIYaAC09X62RCqRdJSoJ
X-Received: from meowing-l.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3eba])
 (user=maskray job=sendgmr) by 2002:a05:6902:145:b0:ac2:a7a7:23c3 with SMTP id
 p5-20020a056902014500b00ac2a7a723c3mr11393476ybh.12.1678475277206; Fri, 10
 Mar 2023 11:07:57 -0800 (PST)
Date: Fri, 10 Mar 2023 19:07:50 +0000
Mime-Version: 1.0
Message-ID: <20230310190750.3323802-1-maskray@google.com>
Subject: [PATCH v3] vdso: Improve cmd_vdso_check to check all dynamic relocations
From: Fangrui Song <maskray@google.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-s390@vger.kernel.org, Fangrui Song <maskray@google.com>, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The actual intention is that no dynamic relocation exists. However, some
GNU ld ports produce unneeded R_*_NONE. (If a port fails to determine
the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
relocations. E.g. ld's powerpc port recently fixed
https://sourceware.org/bugzilla/show_bug.cgi?id=29540) R_*_NONE are
generally no-op in the dynamic loaders. So just ignore them.

With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
not called "absolute relocations". (The patch is motivated by the arm64
port missing R_AARCH64_RELATIVE.)

Signed-off-by: Fangrui Song <maskray@google.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com> # for vDSO, aarch64
Tested-by: Vincenzo Frascino <vincenzo.frascino@arm.com> # for aarch64
---
Changes from v2:
* rebase

Changes from v3:
* Add a comment before `include $(srctree)/lib/vdso/Makefile` in every touched arch Makefile
---
 arch/arm/vdso/Makefile            |  4 +---
 arch/arm64/kernel/vdso/Makefile   |  4 +---
 arch/arm64/kernel/vdso32/Makefile |  3 ---
 arch/csky/kernel/vdso/Makefile    |  4 +---
 arch/loongarch/vdso/Makefile      |  4 +---
 arch/mips/vdso/Makefile           |  4 +---
 arch/powerpc/kernel/vdso/Makefile |  2 +-
 arch/riscv/kernel/vdso/Makefile   |  4 +---
 arch/s390/kernel/vdso32/Makefile  |  3 +--
 arch/s390/kernel/vdso64/Makefile  |  3 +--
 arch/x86/entry/vdso/Makefile      |  5 +----
 lib/vdso/Makefile                 | 13 ++++---------
 12 files changed, 14 insertions(+), 39 deletions(-)

diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index a7ec06ce3785..515ca33b854c 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -1,8 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_ARM_JUMP_SLOT|R_ARM_GLOB_DAT|R_ARM_ABS32
+# Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile
 
 hostprogs := vdsomunge
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index beaf9586338f..fe7a53c6781f 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -6,9 +6,7 @@
 # Heavily based on the vDSO Makefiles for other archs.
 #
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_AARCH64_JUMP_SLOT|R_AARCH64_GLOB_DAT|R_AARCH64_ABS64
+# Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile
 
 obj-vdso := vgettimeofday.o note.o sigreturn.o
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index f59bd1a4ead6..d014162c5c71 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -3,9 +3,6 @@
 # Makefile for vdso32
 #
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_ARM_JUMP_SLOT|R_ARM_GLOB_DAT|R_ARM_ABS32
 include $(srctree)/lib/vdso/Makefile
 
 # Same as cc-*option, but using CC_COMPAT instead of CC
diff --git a/arch/csky/kernel/vdso/Makefile b/arch/csky/kernel/vdso/Makefile
index 0b6909f10667..299e4e41ebc5 100644
--- a/arch/csky/kernel/vdso/Makefile
+++ b/arch/csky/kernel/vdso/Makefile
@@ -1,8 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_CKCORE_ADDR32|R_CKCORE_JUMP_SLOT
+# Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile
 
 # Symbols present in the vdso
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index d89e2ac75f7b..461240ab4436 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -1,9 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Objects to go into the VDSO.
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_LARCH_32|R_LARCH_64|R_LARCH_MARK_LA|R_LARCH_JUMP_SLOT
+# Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile
 
 obj-vdso-y := elf.o vgetcpu.o vgettimeofday.o sigreturn.o
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 18af9474ed0e..eb56581f6d73 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -4,9 +4,7 @@
 # Sanitizer runtimes are unavailable and cannot be linked here.
  KCSAN_SANITIZE			:= n
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_MIPS_JUMP_SLOT|R_MIPS_GLOB_DAT
+# Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile
 
 obj-vdso-y := elf.o vgettimeofday.o sigreturn.o
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 66f723f53be2..4c3f34485f08 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -2,7 +2,7 @@
 
 # List of files in the vdso, has to be asm only for now
 
-ARCH_REL_TYPE_ABS := R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_ADDR24|R_PPC_ADDR16|R_PPC_ADDR16_LO|R_PPC_ADDR16_HI|R_PPC_ADDR16_HA|R_PPC_ADDR14|R_PPC_ADDR14_BRTAKEN|R_PPC_ADDR14_BRNTAKEN|R_PPC_REL24
+# Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile
 
 obj-vdso32 = sigtramp32-32.o gettimeofday-32.o datapage-32.o cacheflush-32.o note-32.o getcpu-32.o
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 06e6b27f3bcc..a04b3bc35ca2 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -1,9 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Copied from arch/tile/kernel/vdso/Makefile
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_RISCV_32|R_RISCV_64|R_RISCV_JUMP_SLOT
+# Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile
 # Symbols present in the vdso
 vdso-syms  = rt_sigreturn
diff --git a/arch/s390/kernel/vdso32/Makefile b/arch/s390/kernel/vdso32/Makefile
index 245bddfe9bc0..bafd3147eb4e 100644
--- a/arch/s390/kernel/vdso32/Makefile
+++ b/arch/s390/kernel/vdso32/Makefile
@@ -2,9 +2,8 @@
 # List of files in the vdso
 
 KCOV_INSTRUMENT := n
-ARCH_REL_TYPE_ABS := R_390_COPY|R_390_GLOB_DAT|R_390_JMP_SLOT|R_390_RELATIVE
-ARCH_REL_TYPE_ABS += R_390_GOT|R_390_PLT
 
+# Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile
 obj-vdso32 = vdso_user_wrapper-32.o note-32.o
 
diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/Makefile
index 34f9542636e9..a766d286e15f 100644
--- a/arch/s390/kernel/vdso64/Makefile
+++ b/arch/s390/kernel/vdso64/Makefile
@@ -2,9 +2,8 @@
 # List of files in the vdso
 
 KCOV_INSTRUMENT := n
-ARCH_REL_TYPE_ABS := R_390_COPY|R_390_GLOB_DAT|R_390_JMP_SLOT|R_390_RELATIVE
-ARCH_REL_TYPE_ABS += R_390_GOT|R_390_PLT
 
+# Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile
 obj-vdso64 = vdso_user_wrapper.o note.o
 obj-cvdso64 = vdso64_generic.o getcpu.o
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index 1506a22a4fb6..6a1821bd7d5e 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -3,10 +3,7 @@
 # Building vDSO images for x86.
 #
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_X86_64_JUMP_SLOT|R_X86_64_GLOB_DAT|R_X86_64_RELATIVE|
-ARCH_REL_TYPE_ABS += R_386_GLOB_DAT|R_386_JMP_SLOT|R_386_RELATIVE
+# Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile
 
 # Sanitizer runtimes are unavailable and cannot be linked here.
diff --git a/lib/vdso/Makefile b/lib/vdso/Makefile
index e814061d6aa0..9f031eafc465 100644
--- a/lib/vdso/Makefile
+++ b/lib/vdso/Makefile
@@ -5,18 +5,13 @@ GENERIC_VDSO_DIR := $(dir $(GENERIC_VDSO_MK_PATH))
 
 c-gettimeofday-$(CONFIG_GENERIC_GETTIMEOFDAY) := $(addprefix $(GENERIC_VDSO_DIR), gettimeofday.c)
 
-# This cmd checks that the vdso library does not contain absolute relocation
+# This cmd checks that the vdso library does not contain dynamic relocations.
 # It has to be called after the linking of the vdso library and requires it
 # as a parameter.
 #
-# $(ARCH_REL_TYPE_ABS) is defined in the arch specific makefile and corresponds
-# to the absolute relocation types printed by "objdump -R" and accepted by the
-# dynamic linker.
-ifndef ARCH_REL_TYPE_ABS
-$(error ARCH_REL_TYPE_ABS is not set)
-endif
-
+# As a workaround for some GNU ld ports which produce unneeded R_*_NONE
+# dynamic relocations, ignore R_*_NONE.
 quiet_cmd_vdso_check = VDSOCHK $@
-      cmd_vdso_check = if $(OBJDUMP) -R $@ | grep -E -h "$(ARCH_REL_TYPE_ABS)"; \
+      cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
 		       then (echo >&2 "$@: dynamic relocations are not supported"; \
 			     rm -f $@; /bin/false); fi
-- 
2.40.0.rc1.284.g88254d51c5-goog

