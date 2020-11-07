Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 527D12AA24D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 04:25:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSjLP3FYVzDrS2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 14:25:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c2wpo2Ep; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSjJv4003zDrMJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 14:23:39 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id g12so2595719pgm.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 19:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KKoAHCKBducc9sWMCwxZPDrUdE5qFeU8cbx3z3OZVGA=;
 b=c2wpo2EpOSXz3Ri7zi2JcjSzWgcfP8yek2ha/Bx7TUGhsOiYTAZKFMjqiJhtbC37Dn
 x0zhjKj5HJU/04SyBKcZQhW7LSxhvGtTa6vgt9WeoKCZZjS7ztEKX+GGe+SvZ1peMN9z
 ZPD6ejNRo0xVWpmCfgoqmk3LtZ7LDxSMBRx4tB7VQkCv6zZYy15Em3TJdfFAp+t7ROMA
 uv5W7haQVuRaK4ZtIhp8R1grEvZpwgZk1+7SyauarygQ/7UUgLB6JcU2VJYD2g4W5RRp
 kuGIAnfckP/WvvL4JuWC+sHgTKG+V9ZtJJ5VLeXZUn3aijyxv2cvoqq3F1CeE5nalvkl
 LmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KKoAHCKBducc9sWMCwxZPDrUdE5qFeU8cbx3z3OZVGA=;
 b=noBzhbMQKatWZYQAAZ7hKsMEOJ6Mwfp8Ha+KfYTjN7oTMG22QCnck885ziQNqq5lQM
 2G8jD0c/qEQziOrbsFVv3Zx+az23xpk8DDWgkHFDtdXdC7TEIONZwAUZ1mhlARgl/poI
 D54zgrOaxx3hPUwjOroWAyPTKqGzhba4k4Hjx1r/8xy9df6gd1Yv+AE6f3R3wNJG+FuU
 RWbQnrSXUUkh32OYOYc0GAq5FbcDU10yMIm000zYLj2YDFR8jC5yinaKAKUT5uMCeNIA
 9FwAdGkZkRvGcIS/K/IrAOSSgmf77rNvp/wSPxdEw1wtO6cZlj+6Q7f75g/pLv6kXPwr
 bdvw==
X-Gm-Message-State: AOAM531i5Jnh9spa1P73P3CVg/CozxRhcRftf07YoP3SkvpOe5r0tYHq
 D0rnAodSctarC7Yh1RgLcp1otYF7rbA=
X-Google-Smtp-Source: ABdhPJyGMp82HHr1qe1IQEqJ7IM92F0JU7SQuNfxJsf6va2tYSIGhtqYL+Pvuc0aHPbY2LPdD5+LBg==
X-Received: by 2002:a63:2b4f:: with SMTP id r76mr4008037pgr.194.1604719415523; 
 Fri, 06 Nov 2020 19:23:35 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id w4sm4136436pjh.14.2020.11.06.19.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 19:23:34 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: add compile-time support for lbarx, lwarx
Date: Sat,  7 Nov 2020 13:23:28 +1000
Message-Id: <20201107032328.2454582-1-npiggin@gmail.com>
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

ISA v2.06 (POWER7 and up) as well as e6500 support lbarx and lwarx.
Add a compile option that allows code to use it, and add support in
cmpxchg and xchg 8 and 16 bit values.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                   |   3 +
 arch/powerpc/include/asm/cmpxchg.h     | 236 ++++++++++++++++++++++++-
 arch/powerpc/platforms/Kconfig.cputype |   5 +
 3 files changed, 243 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e9f13fe08492..d231af06f75a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -266,6 +266,9 @@ config PPC_BARRIER_NOSPEC
 	default y
 	depends on PPC_BOOK3S_64 || PPC_FSL_BOOK3E
 
+config PPC_LBARX_LWARX
+	bool
+
 config EARLY_PRINTK
 	bool
 	default y
diff --git a/arch/powerpc/include/asm/cmpxchg.h b/arch/powerpc/include/asm/cmpxchg.h
index cf091c4c22e5..17fd996dc0d4 100644
--- a/arch/powerpc/include/asm/cmpxchg.h
+++ b/arch/powerpc/include/asm/cmpxchg.h
@@ -77,10 +77,76 @@ u32 __cmpxchg_##type##sfx(volatile void *p, u32 old, u32 new)	\
  * the previous value stored there.
  */
 
+#ifndef CONFIG_PPC_LBARX_LWARX
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
+#ifndef CONFIG_PPC_LBARX_LWARX
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
index c194c4ae8bc7..2f8c8d61dba4 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -118,6 +118,7 @@ config GENERIC_CPU
 	bool "Generic (POWER8 and above)"
 	depends on PPC64 && CPU_LITTLE_ENDIAN
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_LBARX_LWARX
 
 config GENERIC_CPU
 	bool "Generic 32 bits powerpc"
@@ -139,16 +140,19 @@ config POWER7_CPU
 	bool "POWER7"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_LBARX_LWARX
 
 config POWER8_CPU
 	bool "POWER8"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_LBARX_LWARX
 
 config POWER9_CPU
 	bool "POWER9"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_LBARX_LWARX
 
 config E5500_CPU
 	bool "Freescale e5500"
@@ -157,6 +161,7 @@ config E5500_CPU
 config E6500_CPU
 	bool "Freescale e6500"
 	depends on E500
+	select PPC_LBARX_LWARX
 
 config 860_CPU
 	bool "8xx family"
-- 
2.23.0

