Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9003F5B2E02
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 07:24:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP4Cz32yMz3c5D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 15:23:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hPwgMYgP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hPwgMYgP;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP4CJ75HDz302x
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 15:23:24 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id 65so674707pfx.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 22:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=2ylGxyYf++Fa4Bhw3uiX8YAM9/WQ7qUcSJq/lAMSMXs=;
        b=hPwgMYgPD58xEKI0u54YMFpCEURryMl2N/SBSmCWEvdaURmj6SIbP9tbrJdAPFKIz9
         WlBrvXTy5RK3jHrMAQJHZ9FM810bd4h8I0XJP0dqqctsbYxhKt3wm3iEqiBX9VMSiMK3
         9uj6IyWtS5nB484q2wsI0M8MP9efwObr3oAkJ/nOTjjANnicFZqOlUDF8mUmWhJJ0QFk
         MDOOwS7dPZughoI2LXM7fpl4wVEAGZxa9ouhhOmHWMUCNMuhcUaN0NkH8yefmIHMi+tq
         g375hzlVZHtxrnv6sI/XaaL/XRQbMzbVn7JbqMFOeEf18AHZo/FIc9KyVVaOPKI2nXDI
         ESMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=2ylGxyYf++Fa4Bhw3uiX8YAM9/WQ7qUcSJq/lAMSMXs=;
        b=XrqUNtU5Y7nZSOOzdxz6FE0V3DWM6qwOcyWw5Egn+zH1EisMcXVjVl253ZIVNyN8yp
         n7KsaWtb+BTHSGm+dQym9iL3Iuo5kHEouKsz7KsnIKsNoiyq2l3nIWV2GxEuU2uJVG1E
         YkBtbdHWhl7zukiJbkPHfyUSI8JlGWfnv4KmZ1vUZLD57PRM5T8d84DKJGsI83Xt41KG
         zfgVZGbML+I3YzIagKeJsz5UPNRjKE92JwwKuGSs02X8XLPJDeenKNncmUbxPMAwiNJm
         nhThlKLKtebnNSGKdxEqSaUOPN04X6BiEQGD//wlS5EEwTyUIzRIM/4oj8ewOMQluG1H
         /CFw==
X-Gm-Message-State: ACgBeo1o6e3tvgdKv7DCHXQK+tRNBYUKvKuwU9R8mWkd+tGaTnB+0QTn
	4j70So8GwNkPnRwuJof8jcUGgsIXb1Y=
X-Google-Smtp-Source: AA6agR5l/oCm7K8VaLYisEkCRbABhTo+qszKScX9thd69FV4deHeMqlTW83hPIEVwg8CHGR9OEUk3A==
X-Received: by 2002:a05:6a00:a04:b0:534:d8a6:40ce with SMTP id p4-20020a056a000a0400b00534d8a640cemr12609354pfh.15.1662701000481;
        Thu, 08 Sep 2022 22:23:20 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([193.114.109.49])
        by smtp.gmail.com with ESMTPSA id z30-20020aa79e5e000000b0053b9e5d365bsm587989pfq.216.2022.09.08.22.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 22:23:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc: add compile-time support for lbarx, lharx
Date: Fri,  9 Sep 2022 15:23:12 +1000
Message-Id: <20220909052312.63916-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ISA v2.06 (POWER7 and up) as well as e6500 support lbarx and lharx.
Add a compile option that allows code to use it, and add support in
cmpxchg and xchg 8 and 16 bit values without shifting and masking.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v2: Fixed lwarx->lharx typo, switched to PPC_HAS_
v3: Rebase, tidy asm slightly.

My powernv_defconfig build has a grand total of one call site, xchg on
16-bit value in kernel/locking/qspinlock.o

 arch/powerpc/Kconfig                   |   3 +
 arch/powerpc/include/asm/cmpxchg.h     | 231 ++++++++++++++++++++++++-
 arch/powerpc/lib/sstep.c               |  21 +--
 arch/powerpc/platforms/Kconfig.cputype |   5 +
 4 files changed, 249 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4c466acdc70d..a2540b201ff3 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -292,6 +292,9 @@ config PPC_BARRIER_NOSPEC
 	default y
 	depends on PPC_BOOK3S_64 || PPC_FSL_BOOK3E
 
+config PPC_HAS_LBARX_LHARX
+	bool
+
 config EARLY_PRINTK
 	bool
 	default y
diff --git a/arch/powerpc/include/asm/cmpxchg.h b/arch/powerpc/include/asm/cmpxchg.h
index 05f246c0e36e..d0ea0571e79a 100644
--- a/arch/powerpc/include/asm/cmpxchg.h
+++ b/arch/powerpc/include/asm/cmpxchg.h
@@ -77,10 +77,76 @@ u32 __cmpxchg_##type##sfx(volatile void *p, u32 old, u32 new)	\
  * the previous value stored there.
  */
 
+#ifndef CONFIG_PPC_HAS_LBARX_LHARX
 XCHG_GEN(u8, _local, "memory");
 XCHG_GEN(u8, _relaxed, "cc");
 XCHG_GEN(u16, _local, "memory");
 XCHG_GEN(u16, _relaxed, "cc");
+#else
+static __always_inline unsigned long
+__xchg_u8_local(volatile void *p, unsigned long val)
+{
+	unsigned long prev;
+
+	__asm__ __volatile__(
+"1:	lbarx	%0,0,%2		# __xchg_u8_local\n"
+"	stbcx.	%3,0,%2 \n"
+"	bne-	1b"
+	: "=&r" (prev), "+m" (*(volatile unsigned char *)p)
+	: "r" (p), "r" (val)
+	: "cc", "memory");
+
+	return prev;
+}
+
+static __always_inline unsigned long
+__xchg_u8_relaxed(u8 *p, unsigned long val)
+{
+	unsigned long prev;
+
+	__asm__ __volatile__(
+"1:	lbarx	%0,0,%2		# __xchg_u8_relaxed\n"
+"	stbcx.	%3,0,%2\n"
+"	bne-	1b"
+	: "=&r" (prev), "+m" (*p)
+	: "r" (p), "r" (val)
+	: "cc");
+
+	return prev;
+}
+
+static __always_inline unsigned long
+__xchg_u16_local(volatile void *p, unsigned long val)
+{
+	unsigned long prev;
+
+	__asm__ __volatile__(
+"1:	lharx	%0,0,%2		# __xchg_u16_local\n"
+"	sthcx.	%3,0,%2\n"
+"	bne-	1b"
+	: "=&r" (prev), "+m" (*(volatile unsigned short *)p)
+	: "r" (p), "r" (val)
+	: "cc", "memory");
+
+	return prev;
+}
+
+static __always_inline unsigned long
+__xchg_u16_relaxed(u16 *p, unsigned long val)
+{
+	unsigned long prev;
+
+	__asm__ __volatile__(
+"1:	lharx	%0,0,%2		# __xchg_u16_relaxed\n"
+"	sthcx.	%3,0,%2\n"
+"	bne-	1b"
+	: "=&r" (prev), "+m" (*p)
+	: "r" (p), "r" (val)
+	: "cc");
+
+	return prev;
+}
+#endif
 
 static __always_inline unsigned long
 __xchg_u32_local(volatile void *p, unsigned long val)
@@ -198,11 +264,12 @@ __xchg_relaxed(void *ptr, unsigned long x, unsigned int size)
 	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
 			(unsigned long)_x_, sizeof(*(ptr)));		\
 })
+
 /*
  * Compare and exchange - if *p == old, set it to new,
  * and return the old value of *p.
  */
-
+#ifndef CONFIG_PPC_HAS_LBARX_LHARX
 CMPXCHG_GEN(u8, , PPC_ATOMIC_ENTRY_BARRIER, PPC_ATOMIC_EXIT_BARRIER, "memory");
 CMPXCHG_GEN(u8, _local, , , "memory");
 CMPXCHG_GEN(u8, _acquire, , PPC_ACQUIRE_BARRIER, "memory");
@@ -211,6 +278,168 @@ CMPXCHG_GEN(u16, , PPC_ATOMIC_ENTRY_BARRIER, PPC_ATOMIC_EXIT_BARRIER, "memory");
 CMPXCHG_GEN(u16, _local, , , "memory");
 CMPXCHG_GEN(u16, _acquire, , PPC_ACQUIRE_BARRIER, "memory");
 CMPXCHG_GEN(u16, _relaxed, , , "cc");
+#else
+static __always_inline unsigned long
+__cmpxchg_u8(volatile unsigned char *p, unsigned long old, unsigned long new)
+{
+	unsigned int prev;
+
+	__asm__ __volatile__ (
+	PPC_ATOMIC_ENTRY_BARRIER
+"1:	lbarx	%0,0,%2		# __cmpxchg_u8\n"
+"	cmpw	0,%0,%3\n"
+"	bne-	2f\n"
+"	stbcx.	%4,0,%2\n"
+"	bne-	1b"
+	PPC_ATOMIC_EXIT_BARRIER
+	"\n\
+2:"
+	: "=&r" (prev), "+m" (*p)
+	: "r" (p), "r" (old), "r" (new)
+	: "cc", "memory");
+
+	return prev;
+}
+
+static __always_inline unsigned long
+__cmpxchg_u8_local(volatile unsigned char *p, unsigned long old,
+			unsigned long new)
+{
+	unsigned int prev;
+
+	__asm__ __volatile__ (
+"1:	lbarx	%0,0,%2		# __cmpxchg_u8_local\n"
+"	cmpw	0,%0,%3\n"
+"	bne-	2f\n"
+"	stbcx.	%4,0,%2\n"
+"	bne-	1b\n"
+"2:"
+	: "=&r" (prev), "+m" (*p)
+	: "r" (p), "r" (old), "r" (new)
+	: "cc", "memory");
+
+	return prev;
+}
+
+static __always_inline unsigned long
+__cmpxchg_u8_relaxed(u8 *p, unsigned long old, unsigned long new)
+{
+	unsigned long prev;
+
+	__asm__ __volatile__ (
+"1:	lbarx	%0,0,%2		# __cmpxchg_u8_relaxed\n"
+"	cmpw	0,%0,%3\n"
+"	bne-	2f\n"
+"	stbcx.	%4,0,%2\n"
+"	bne-	1b\n"
+"2:"
+	: "=&r" (prev), "+m" (*p)
+	: "r" (p), "r" (old), "r" (new)
+	: "cc");
+
+	return prev;
+}
+
+static __always_inline unsigned long
+__cmpxchg_u8_acquire(u8 *p, unsigned long old, unsigned long new)
+{
+	unsigned long prev;
+
+	__asm__ __volatile__ (
+"1:	lbarx	%0,0,%2		# __cmpxchg_u8_acquire\n"
+"	cmpw	0,%0,%3\n"
+"	bne-	2f\n"
+"	stbcx.	%4,0,%2\n"
+"	bne-	1b\n"
+	PPC_ACQUIRE_BARRIER
+"2:"
+	: "=&r" (prev), "+m" (*p)
+	: "r" (p), "r" (old), "r" (new)
+	: "cc", "memory");
+
+	return prev;
+}
+
+static __always_inline unsigned long
+__cmpxchg_u16(volatile unsigned short *p, unsigned long old, unsigned long new)
+{
+	unsigned int prev;
+
+	__asm__ __volatile__ (
+	PPC_ATOMIC_ENTRY_BARRIER
+"1:	lharx	%0,0,%2		# __cmpxchg_u16\n"
+"	cmpw	0,%0,%3\n"
+"	bne-	2f\n"
+"	sthcx.	%4,0,%2\n"
+"	bne-	1b\n"
+	PPC_ATOMIC_EXIT_BARRIER
+"2:"
+	: "=&r" (prev), "+m" (*p)
+	: "r" (p), "r" (old), "r" (new)
+	: "cc", "memory");
+
+	return prev;
+}
+
+static __always_inline unsigned long
+__cmpxchg_u16_local(volatile unsigned short *p, unsigned long old,
+			unsigned long new)
+{
+	unsigned int prev;
+
+	__asm__ __volatile__ (
+"1:	lharx	%0,0,%2		# __cmpxchg_u16_local\n"
+"	cmpw	0,%0,%3\n"
+"	bne-	2f\n"
+"	sthcx.	%4,0,%2\n"
+"	bne-	1b"
+"2:"
+	: "=&r" (prev), "+m" (*p)
+	: "r" (p), "r" (old), "r" (new)
+	: "cc", "memory");
+
+	return prev;
+}
+
+static __always_inline unsigned long
+__cmpxchg_u16_relaxed(u16 *p, unsigned long old, unsigned long new)
+{
+	unsigned long prev;
+
+	__asm__ __volatile__ (
+"1:	lharx	%0,0,%2		# __cmpxchg_u16_relaxed\n"
+"	cmpw	0,%0,%3\n"
+"	bne-	2f\n"
+"	sthcx.	%4,0,%2\n"
+"	bne-	1b\n"
+"2:"
+	: "=&r" (prev), "+m" (*p)
+	: "r" (p), "r" (old), "r" (new)
+	: "cc");
+
+	return prev;
+}
+
+static __always_inline unsigned long
+__cmpxchg_u16_acquire(u16 *p, unsigned long old, unsigned long new)
+{
+	unsigned long prev;
+
+	__asm__ __volatile__ (
+"1:	lharx	%0,0,%2		# __cmpxchg_u16_acquire\n"
+"	cmpw	0,%0,%3\n"
+"	bne-	2f\n"
+"	sthcx.	%4,0,%2\n"
+"	bne-	1b\n"
+	PPC_ACQUIRE_BARRIER
+"2:"
+	: "=&r" (prev), "+m" (*p)
+	: "r" (p), "r" (old), "r" (new)
+	: "cc", "memory");
+
+	return prev;
+}
+#endif
 
 static __always_inline unsigned long
 __cmpxchg_u32(volatile unsigned int *p, unsigned long old, unsigned long new)
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 398b5694aeb7..38158b77a801 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -2284,15 +2284,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->type = MKOP(STCX, 0, 4);
 			break;
 
-#ifdef __powerpc64__
-		case 84:	/* ldarx */
-			op->type = MKOP(LARX, 0, 8);
-			break;
-
-		case 214:	/* stdcx. */
-			op->type = MKOP(STCX, 0, 8);
-			break;
-
+#ifdef CONFIG_PPC_HAS_LBARX_LHARX
 		case 52:	/* lbarx */
 			op->type = MKOP(LARX, 0, 1);
 			break;
@@ -2308,6 +2300,15 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		case 726:	/* sthcx. */
 			op->type = MKOP(STCX, 0, 2);
 			break;
+#endif
+#ifdef __powerpc64__
+		case 84:	/* ldarx */
+			op->type = MKOP(LARX, 0, 8);
+			break;
+
+		case 214:	/* stdcx. */
+			op->type = MKOP(STCX, 0, 8);
+			break;
 
 		case 276:	/* lqarx */
 			if (!((rd & 1) || rd == ra || rd == rb))
@@ -3334,7 +3335,7 @@ int emulate_loadstore(struct pt_regs *regs, struct instruction_op *op)
 		err = 0;
 		val = 0;
 		switch (size) {
-#ifdef __powerpc64__
+#ifdef CONFIG_PPC_HAS_LBARX_LHARX
 		case 1:
 			__get_user_asmx(val, ea, err, "lbarx");
 			break;
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 5185d942b455..625a3a8dc698 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -134,6 +134,7 @@ config GENERIC_CPU
 	depends on PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
 	select ARCH_HAS_FAST_MULTIPLIER
 	select PPC_64S_HASH_MMU
+	select PPC_HAS_LBARX_LHARX
 
 config POWERPC_CPU
 	bool "Generic 32 bits powerpc"
@@ -159,17 +160,20 @@ config POWER7_CPU
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
 	select PPC_64S_HASH_MMU
+	select PPC_HAS_LBARX_LHARX
 
 config POWER8_CPU
 	bool "POWER8"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
 	select PPC_64S_HASH_MMU
+	select PPC_HAS_LBARX_LHARX
 
 config POWER9_CPU
 	bool "POWER9"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_HAS_LBARX_LHARX
 
 config E5500_CPU
 	bool "Freescale e5500"
@@ -178,6 +182,7 @@ config E5500_CPU
 config E6500_CPU
 	bool "Freescale e6500"
 	depends on PPC64 && E500
+	select PPC_HAS_LBARX_LHARX
 
 config 405_CPU
 	bool "40x family"
-- 
2.37.2

