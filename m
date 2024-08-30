Return-Path: <linuxppc-dev+bounces-827-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 754AA966644
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 17:57:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwN8T3rPYz30HH;
	Sat, 31 Aug 2024 01:57:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725033465;
	cv=none; b=Q2qtzvY/BqOgN2IeiKvDsM35FAhR00jz+xaj+aDqGzyBGAot7Dd5ymMz7ZISOiOZnIMX7TGECjqI0aIO1VfDyfXHH1nEFSwlPng2nR4TDynUmyh2heuUCaiWpOyxzSozMKy3nqMvRYR8z/79a3vLSjAyK2WWeVgc6wHZnJ/zHVbVMXCm/VWgeNjzYGMrDsaXYITWc/teLjd034UndhPM5t+ZJ5WCFkuIuJNJykoAWOUwPjwxAHtfIwbtAD6n1iAQzoYVbS4HK8fHt/LC4BfoknGthDNGXYXTV3NFKnT5ZhHMjqaIg+hT6mbXl6DhqX59PagRCZHx6e8dV0Ds9Uy1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725033465; c=relaxed/relaxed;
	bh=exIUXvCbe1yE/siYQUvjG/FTEHXUWA679+0k3qDVN6U=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	b=ZGM+kqFOMq8MBkKQLqCnmpAAXzaZFfWIEhFoQbh6UyXKKpPOzdbxz9YU1z/TOGPJdgur+PFTdWzrjfU002SXjSoOwnx29+Aal77ubMPA0bby1dVH9EaEDaukog2/CVFogqJmriayUFCI2WnD9uSYEZ1qJjbHaB2FC0IK6EHknA2MGFs6hxjofggVpfIM1wjs2W32/l81VWl42LXAt6O2rzDJR1KOG0quWQ/WCqpe6MP0PM9Ne7eoCV9ls1sa1qpb61eYVe3KCVfrvkQAeRdMm6dZ24RzS7CU0RTZoRmyL+YSgXn9goG852dcBbifFDGCkOqRrVggWNr8XtDpF/vkwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwN8T1ZH8z2yw9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 01:57:45 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WwN820xV8z9sSS;
	Fri, 30 Aug 2024 17:57:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9BHKF7MYlO9x; Fri, 30 Aug 2024 17:57:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WwN816PBbz9sS7;
	Fri, 30 Aug 2024 17:57:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C6DEA8B764;
	Fri, 30 Aug 2024 17:57:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uAS6-PSNHXJa; Fri, 30 Aug 2024 17:57:21 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.234.133])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C196F8B794;
	Fri, 30 Aug 2024 17:57:20 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Shuah Khan <shuah@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v3 5/5] powerpc/vdso: Wire up getrandom() vDSO implementation on PPC64
Date: Fri, 30 Aug 2024 17:57:09 +0200
Message-ID: <8dacc4e43ca17ff5394474a38faf3d1ed04f1fe3.1725031952.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1725031952.git.christophe.leroy@csgroup.eu>
References: <cover.1725031952.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725033425; l=8227; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=RZqSySqYFylmyuA5iRHusRb2CMpC6wGsXem6AUNbLuM=; b=Q9SndYRLYnz+rNPgHPdAY1Q+AbqC22AyVLkdSzp8bpb0Yac03csS5glWQQ8l4Gs2G4Bzqnsah ijB2x73ukGrB9RVsjFHt49/QhhNSST/8oUlPNWjD5tn1AQUF4B7gX6v
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Extend getrandom() vDSO implementation to powerpc64.

Tested on QEMU on both ppc64_defconfig and ppc64le_defconfig.

The results are not precise as it is QEMU on an x86 laptop, but
no need to be precise to see the benefit.

~ # ./vdso_test_getrandom bench-single
   vdso: 25000000 times in 4.977777162 seconds
   libc: 25000000 times in 75.516749981 seconds
syscall: 25000000 times in 86.842242014 seconds

~ # ./vdso_test_getrandom bench-single
   vdso: 25000000 times in 6.473814156 seconds
   libc: 25000000 times in 73.875109463 seconds
syscall: 25000000 times in 71.805066229 seconds

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: New (split out of previous patch)
---
 arch/powerpc/Kconfig                         |  2 +-
 arch/powerpc/include/asm/mman.h              |  2 +-
 arch/powerpc/kernel/vdso/Makefile            | 10 +-
 arch/powerpc/kernel/vdso/getrandom.S         |  8 ++
 arch/powerpc/kernel/vdso/vdso64.lds.S        |  1 +
 arch/powerpc/kernel/vdso/vgetrandom-chacha.S | 98 ++++++++++++++++++++
 6 files changed, 116 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 54b270ef18b1..b45452ac4a73 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -311,7 +311,7 @@ config PPC
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
-	select VDSO_GETRANDOM			if PPC32
+	select VDSO_GETRANDOM
 	#
 	# Please keep this list sorted alphabetically.
 	#
diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
index 17a77d47ed6d..42a51a993d94 100644
--- a/arch/powerpc/include/asm/mman.h
+++ b/arch/powerpc/include/asm/mman.h
@@ -6,7 +6,7 @@
 
 #include <uapi/asm/mman.h>
 
-#ifdef CONFIG_PPC64
+#if defined(CONFIG_PPC64) && !defined(BUILD_VDSO)
 
 #include <asm/cputable.h>
 #include <linux/mm.h>
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index fa0b9b3b51af..56fb1633529a 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -9,6 +9,7 @@ obj-vdso32 = sigtramp32-32.o gettimeofday-32.o datapage-32.o cacheflush-32.o not
 obj-vdso64 = sigtramp64-64.o gettimeofday-64.o datapage-64.o cacheflush-64.o note-64.o getcpu-64.o
 
 obj-vdso32 += getrandom-32.o vgetrandom-chacha-32.o
+obj-vdso64 += getrandom-64.o vgetrandom-chacha-64.o
 
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday-32.o += -include $(c-gettimeofday-y)
@@ -21,6 +22,7 @@ endif
 
 ifneq ($(c-getrandom-y),)
   CFLAGS_vgetrandom-32.o += -include $(c-getrandom-y)
+  CFLAGS_vgetrandom-64.o += -include $(c-getrandom-y) $(call cc-option, -ffixed-r30)
 endif
 
 # Build rules
@@ -34,10 +36,10 @@ endif
 targets := $(obj-vdso32) vdso32.so.dbg vgettimeofday-32.o vgetrandom-32.o
 targets += crtsavres-32.o
 obj-vdso32 := $(addprefix $(obj)/, $(obj-vdso32))
-targets += $(obj-vdso64) vdso64.so.dbg vgettimeofday-64.o
+targets += $(obj-vdso64) vdso64.so.dbg vgettimeofday-64.o vgetrandom-64.o
 obj-vdso64 := $(addprefix $(obj)/, $(obj-vdso64))
 
-ccflags-y := -fno-common -fno-builtin
+ccflags-y := -fno-common -fno-builtin -DBUILD_VDSO
 ccflags-y += $(DISABLE_LATENT_ENTROPY_PLUGIN)
 ccflags-y += $(call cc-option, -fno-stack-protector)
 ccflags-y += -DDISABLE_BRANCH_PROFILING
@@ -71,7 +73,7 @@ CPPFLAGS_vdso64.lds += -P -C
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso32.so.dbg: $(obj)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday-32.o $(obj)/vgetrandom-32.o $(obj)/crtsavres-32.o FORCE
 	$(call if_changed,vdso32ld_and_check)
-$(obj)/vdso64.so.dbg: $(obj)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday-64.o FORCE
+$(obj)/vdso64.so.dbg: $(obj)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday-64.o $(obj)/vgetrandom-64.o FORCE
 	$(call if_changed,vdso64ld_and_check)
 
 # assembly rules for the .S files
@@ -87,6 +89,8 @@ $(obj-vdso64): %-64.o: %.S FORCE
 	$(call if_changed_dep,vdso64as)
 $(obj)/vgettimeofday-64.o: %-64.o: %.c FORCE
 	$(call if_changed_dep,cc_o_c)
+$(obj)/vgetrandom-64.o: %-64.o: %.c FORCE
+	$(call if_changed_dep,cc_o_c)
 
 # Generate VDSO offsets using helper script
 gen-vdso32sym := $(src)/gen_vdso32_offsets.sh
diff --git a/arch/powerpc/kernel/vdso/getrandom.S b/arch/powerpc/kernel/vdso/getrandom.S
index 21773ef3fc1d..a957cd2b2b03 100644
--- a/arch/powerpc/kernel/vdso/getrandom.S
+++ b/arch/powerpc/kernel/vdso/getrandom.S
@@ -27,10 +27,18 @@
   .cfi_adjust_cfa_offset PPC_MIN_STKFRM
 	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
   .cfi_rel_offset lr, PPC_MIN_STKFRM + PPC_LR_STKOFF
+#ifdef __powerpc64__
+	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+  .cfi_rel_offset r2, PPC_MIN_STKFRM + STK_GOT
+#endif
 	get_datapage	r8
 	addi		r8, r8, VDSO_RNG_DATA_OFFSET
 	bl		CFUNC(DOTSYM(\funct))
 	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
+#ifdef __powerpc64__
+	PPC_LL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
+  .cfi_restore r2
+#endif
 	cmpwi		r3, 0
 	mtlr		r0
 	addi		r1, r1, 2 * PPC_MIN_STKFRM
diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
index 400819258c06..9481e4b892ed 100644
--- a/arch/powerpc/kernel/vdso/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
@@ -123,6 +123,7 @@ VERSION
 		__kernel_sigtramp_rt64;
 		__kernel_getcpu;
 		__kernel_time;
+		__kernel_getrandom;
 
 	local: *;
 	};
diff --git a/arch/powerpc/kernel/vdso/vgetrandom-chacha.S b/arch/powerpc/kernel/vdso/vgetrandom-chacha.S
index a3475b9e8c10..c9d4c5b38242 100644
--- a/arch/powerpc/kernel/vdso/vgetrandom-chacha.S
+++ b/arch/powerpc/kernel/vdso/vgetrandom-chacha.S
@@ -79,12 +79,59 @@
  *	r16-r31: state
  */
 SYM_FUNC_START(__arch_chacha20_blocks_nostack)
+#ifdef __powerpc64__
+	std	r5, -216(r1)
+
+	std	r14, -144(r1)
+	std	r15, -136(r1)
+	std	r16, -128(r1)
+	std	r17, -120(r1)
+	std	r18, -112(r1)
+	std	r19, -104(r1)
+	std	r20, -96(r1)
+	std	r21, -88(r1)
+	std	r22, -80(r1)
+	std	r23, -72(r1)
+	std	r24, -64(r1)
+	std	r25, -56(r1)
+	std	r26, -48(r1)
+	std	r27, -40(r1)
+	std	r28, -32(r1)
+	std	r29, -24(r1)
+	std	r30, -16(r1)
+	std	r31, -8(r1)
+#else
 	stwu	r1, -96(r1)
 	stw	r5, 20(r1)
+#if defined(CONFIG_CPU_BIG_ENDIAN)
 	stmw	r14, 24(r1)
+#else
+	stw	r14, 24(r1)
+	stw	r15, 28(r1)
+	stw	r16, 32(r1)
+	stw	r17, 36(r1)
+	stw	r18, 40(r1)
+	stw	r19, 44(r1)
+	stw	r20, 48(r1)
+	stw	r21, 52(r1)
+	stw	r22, 56(r1)
+	stw	r23, 60(r1)
+	stw	r24, 64(r1)
+	stw	r25, 68(r1)
+	stw	r26, 72(r1)
+	stw	r27, 76(r1)
+	stw	r28, 80(r1)
+	stw	r29, 84(r1)
+	stw	r30, 88(r1)
+	stw	r31, 92(r1)
+#endif
+#endif
 	li	r31, 4
 	LWZX_LE	r14, 0, r5
 	LWZX_LE	r15, r31, r5
+#ifdef __powerpc64__
+	rldimi	r14, r15, 32, 0
+#endif
 	mr	r0, r6
 
 	lwz	r5, 0(r4)
@@ -177,13 +224,22 @@ SYM_FUNC_START(__arch_chacha20_blocks_nostack)
 	STWX_LE	r31, r4, r3
 	addi	r3, r3, 8
 
+#ifdef __powerpc64__
+	addi	r14, r14, 1
+	srdi	r15, r14, 32
+#else
 	addic	r14, r14, 1
 	addze	r15, r15
+#endif
 
 	subic.	r0, r0, 1	/* subi. can't use r0 as source */
 	bne	.Lblock
 
+#ifdef __powerpc64__
+	ld	r5, -216(r1)
+#else
 	lwz	r5, 20(r1)
+#endif
 	STWX_LE	r14, 0, r5
 	STWX_LE	r15, r4, r5
 
@@ -195,7 +251,49 @@ SYM_FUNC_START(__arch_chacha20_blocks_nostack)
 	li	r11, 0
 	li	r12, 0
 
+#ifdef __powerpc64__
+	ld	r14, -144(r1)
+	ld	r15, -136(r1)
+	ld	r16, -128(r1)
+	ld	r17, -120(r1)
+	ld	r18, -112(r1)
+	ld	r19, -104(r1)
+	ld	r20, -96(r1)
+	ld	r21, -88(r1)
+	ld	r22, -80(r1)
+	ld	r23, -72(r1)
+	ld	r24, -64(r1)
+	ld	r25, -56(r1)
+	ld	r26, -48(r1)
+	ld	r27, -40(r1)
+	ld	r28, -32(r1)
+	ld	r29, -24(r1)
+	ld	r30, -16(r1)
+	ld	r31, -8(r1)
+#else
+#if defined(CONFIG_CPU_BIG_ENDIAN)
 	lmw	r14, 24(r1)
+#else
+	lwz	r14, 24(r1)
+	lwz	r15, 28(r1)
+	lwz	r16, 32(r1)
+	lwz	r17, 36(r1)
+	lwz	r18, 40(r1)
+	lwz	r19, 44(r1)
+	lwz	r20, 48(r1)
+	lwz	r21, 52(r1)
+	lwz	r22, 56(r1)
+	lwz	r23, 60(r1)
+	lwz	r24, 64(r1)
+	lwz	r25, 68(r1)
+	lwz	r26, 72(r1)
+	lwz	r27, 76(r1)
+	lwz	r28, 80(r1)
+	lwz	r29, 84(r1)
+	lwz	r30, 88(r1)
+	lwz	r31, 92(r1)
+#endif
 	addi	r1, r1, 96
+#endif
 	blr
 SYM_FUNC_END(__arch_chacha20_blocks_nostack)
-- 
2.44.0


