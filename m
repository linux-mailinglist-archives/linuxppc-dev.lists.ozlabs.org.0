Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9116B3B1231
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 05:29:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8pf32M82z3bth
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 13:29:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LinfZv6A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LinfZv6A; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8pdZ5xn9z2xfT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 13:28:48 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id g24so689874pji.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ldyU90a48zGPGzVIxPYY58ObFt19Obi+/mFd2c36wfA=;
 b=LinfZv6AKp+G+pb08cKzJpdBr6ShH1xd+bDQY1QzW0ZRVmdDdCzYITtDIMJrp8rKvx
 YU9jJUtzi0m6cVrBm4Z6LK5QRGX9OVFxt/dapkrCaNeL35jgco7MneaKVszAkneksbbk
 /CyGg2uXxUIlLTbDKdfwN0AcF+YgPkJnnWuUjB2Gw2gU7px5Uubqs6VLX4kYFRN3hDmK
 pGhUxVJRiTLrILJe7acqgG0l7NfGzAmwiKO69jIymcUZvE26YzL8TK1uI27txKjGR38F
 OgNrFaoSlB79hOw33/PEQs1c4ZYH9JSn/1l5hOzWj5k9eARN1mCEVlqBRDwtk4HSJQh/
 RkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ldyU90a48zGPGzVIxPYY58ObFt19Obi+/mFd2c36wfA=;
 b=jz7TuuLSIaaRy6rsBf18h5P5LESNL/lc95p4s5H/h3VuKmukbeGlEEJu7rctyGvCwv
 vrm78wt1aP7f3kjlgctOMz/EMR28JcLzeRHfvP0AfKGjwzP81h4EGtG4Hoxc+yPwwRi2
 YQ3wKpJ57AVEBhK2D77DvPH3aKoAnZ6/OlUogFCvehZYngOHVA0YnC3opOdle7EK25Iw
 TRC2cDF0J9YT1WzpsAB34qA6ec6E4nESpFsSTdrXb/Bsnz61Jeu0c7dSzuthlUUaEoGz
 ROQ9A70YxReICTwz0ehnk9OJ8us2ZDoYuNMIuo3XaHlhzp59NTC/KzQAVRKm4oqtH/ZC
 JoAQ==
X-Gm-Message-State: AOAM5320TZPaUqBQrEVqCg7OomrcHIlaeYBisXgqMWqVTLjRQcJ4+bK2
 ioAYCtU5tGQ7WqLsLLsaOEuLQ5X5xrw=
X-Google-Smtp-Source: ABdhPJz8Q9udMwtzgdu9xC2lNecKup43vRhai8zSmisqSDW2Vjr8LXItQR8LLHPCVCCIijjZe9q9Vw==
X-Received: by 2002:a17:90a:1d0a:: with SMTP id
 c10mr7487029pjd.39.1624418924102; 
 Tue, 22 Jun 2021 20:28:44 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id s22sm637208pfe.208.2021.06.22.20.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 20:28:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc: add compile-time support for lbarx, lharx
Date: Wed, 23 Jun 2021 13:28:38 +1000
Message-Id: <20210623032838.825897-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ISA v2.06 (POWER7 and up) as well as e6500 support lbarx and lharx.
Add a compile option that allows code to use it, and add support in
cmpxchg and xchg 8 and 16 bit values without shifting and masking.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v2: Fixed lwarx->lharx typo, switched to PPC_HAS_

 arch/powerpc/Kconfig                   |   3 +
 arch/powerpc/include/asm/cmpxchg.h     | 236 ++++++++++++++++++++++++-
 arch/powerpc/lib/sstep.c               |  21 +--
 arch/powerpc/platforms/Kconfig.cputype |   5 +
 4 files changed, 254 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 088dd2afcfe4..dc17f4d51a79 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -278,6 +278,9 @@ config PPC_BARRIER_NOSPEC
 	default y
 	depends on PPC_BOOK3S_64 || PPC_FSL_BOOK3E
 
+config PPC_HAS_LBARX_LHARX
+	bool
+
 config EARLY_PRINTK
 	bool
 	default y
diff --git a/arch/powerpc/include/asm/cmpxchg.h b/arch/powerpc/include/asm/cmpxchg.h
index cf091c4c22e5..28fbd57db1ec 100644
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
+"1:	lbarx	%0,0,%2 \n"
+"	stbcx.	%3,0,%2 \n\
+	bne-	1b"
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
+"1:	lbarx	%0,0,%2\n"
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
+"1:	lharx	%0,0,%2 \n"
+"	sthcx.	%3,0,%2 \n\
+	bne-	1b"
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
+"1:	lharx	%0,0,%2\n"
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
@@ -211,6 +278,173 @@ CMPXCHG_GEN(u16, , PPC_ATOMIC_ENTRY_BARRIER, PPC_ATOMIC_EXIT_BARRIER, "memory");
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
+"1:	lbarx	%0,0,%2		# __cmpxchg_u8\n\
+	cmpw	0,%0,%3\n\
+	bne-	2f\n"
+"	stbcx.	%4,0,%2\n\
+	bne-	1b"
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
+"1:	lbarx	%0,0,%2		# __cmpxchg_u8\n\
+	cmpw	0,%0,%3\n\
+	bne-	2f\n"
+"	stbcx.	%4,0,%2\n\
+	bne-	1b"
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
+	"\n"
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
+"1:	lharx	%0,0,%2		# __cmpxchg_u16\n\
+	cmpw	0,%0,%3\n\
+	bne-	2f\n"
+"	sthcx.	%4,0,%2\n\
+	bne-	1b"
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
+__cmpxchg_u16_local(volatile unsigned short *p, unsigned long old,
+			unsigned long new)
+{
+	unsigned int prev;
+
+	__asm__ __volatile__ (
+"1:	lharx	%0,0,%2		# __cmpxchg_u16\n\
+	cmpw	0,%0,%3\n\
+	bne-	2f\n"
+"	sthcx.	%4,0,%2\n\
+	bne-	1b"
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
+	"\n"
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
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index f998e655b570..3a03c8ce1e95 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -131,6 +131,7 @@ config GENERIC_CPU
 	bool "Generic (POWER8 and above)"
 	depends on PPC64 && CPU_LITTLE_ENDIAN
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_HAS_LBARX_LHARX
 
 config GENERIC_CPU
 	bool "Generic 32 bits powerpc"
@@ -152,16 +153,19 @@ config POWER7_CPU
 	bool "POWER7"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_HAS_LBARX_LHARX
 
 config POWER8_CPU
 	bool "POWER8"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_HAS_LBARX_LHARX
 
 config POWER9_CPU
 	bool "POWER9"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_HAS_LBARX_LHARX
 
 config E5500_CPU
 	bool "Freescale e5500"
@@ -170,6 +174,7 @@ config E5500_CPU
 config E6500_CPU
 	bool "Freescale e6500"
 	depends on E500
+	select PPC_HAS_LBARX_LHARX
 
 config 860_CPU
 	bool "8xx family"
-- 
2.23.0

