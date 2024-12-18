Return-Path: <linuxppc-dev+bounces-4309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB429F6426
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:57:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrFG0rl4z30g3;
	Wed, 18 Dec 2024 21:55:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519346;
	cv=none; b=jHfwFX3kd1tXNbGiRmcwSgSipbOzZP6/Z4rGlFMpItkFGkp09T3q+Hbbw7T7DfBrM/JZvDtNJm33TWGth20P8+vlcpDgV+J5zi5pzwg5Zw3w+T31YIVvslk4IcYe7lSUf+AgrYufDjbhW7fCDBpSrt3aCXp2KZdWQK4Tw5nTBkZpyHfwhrWvZQkGwrLh1wxmtOPso/G2WcyjLAFLggvn6Vol/A10McAfiATKdelIebFrbuVenel575d8h/uN4m0EXGVaGs5B2Rdb3JiqOVq1ZE7yKlOZ8uptyc1TamNo5xL8YIgOfNIcmh4tlb6iyyaywYOPr04tEIK9fvJ9SVuZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519346; c=relaxed/relaxed;
	bh=rFfZoz9h6cbrWbMgyIUFAQTBqohX1hRDxDCCJsZfL3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9XxSpWMtZwB1kLlXSnMbP97IAqwul/dmaBdfiHrIq09zWhjQOFBexnDqJeokuf2oOgIbOdt8zP/GXaS7BmDbvl44dj2LEP2ITK/v9Xnnk3oFhRGH195HmLyhrfQUdSQPbARqcJutl1iBmpbKqgQ0g8/N7FLL+3v9RXueoeuX3wmluUWosGnTlQgfeTraYc/omLGuc20OjNnmtd4171iLDDuGPWs6oi+FqKpzWaFKNnOIcpHbmqvm7efFoscORxHlarITnPnFvBA8dxUNQa5sdhUl5S582r8hz31aU5jINm7nSV23bcoudkVh9VPaPVUyIedS0MeC/qh6x9c1+/pOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=agwhJ/zm; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=agwhJ/zm;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF95qf2z30W7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519334;
	bh=rFfZoz9h6cbrWbMgyIUFAQTBqohX1hRDxDCCJsZfL3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=agwhJ/zmtntEKZlYWyq3OuV+KeDqWEOeJU92/MOIVJl8a9p7AlU2JDNA+sGbibSQ+
	 TP0PLVJdxNw5xb0Cdy4tfbI+hjC1L/nTstYmQw47JYQeRSk65N9r2AhZQMOwonKCGg
	 WKqqUYq7oJYGzPmgbCh1u4e2nmRJs8nFnkyMODjueov1FlqgP0Ik+t6G8AnRFVDqUq
	 nUhIi0MBRJh1ezkLfRshxAU0SkBcCprQwsJaFqwj1UnU09rr7mUwNZm9aPfPbDlq4r
	 iN/KlSQc0v1FulQGDL0i3bZ6pbMjMyOdY8Q5ploEyjRiniGSlHrWeVVwZ6i0J3xdWh
	 7s+FydIXSoJKg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrF26R2Kz4xfQ;
	Wed, 18 Dec 2024 21:55:34 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 18/25] powerpc/io: Use standard barrier macros in io.c
Date: Wed, 18 Dec 2024 21:55:06 +1100
Message-ID: <20241218105523.416573-18-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

io.c uses open-coded barriers. Update it to use the equivalent but in
macro form.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: New.

 arch/powerpc/kernel/io.c | 42 +++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/io.c b/arch/powerpc/kernel/io.c
index 6e7b49a676d9..bcc201c01514 100644
--- a/arch/powerpc/kernel/io.c
+++ b/arch/powerpc/kernel/io.c
@@ -31,13 +31,14 @@ void _insb(const volatile u8 __iomem *port, void *buf, long count)
 
 	if (unlikely(count <= 0))
 		return;
-	asm volatile("sync");
+
+	mb();
 	do {
 		tmp = *(const volatile u8 __force *)port;
 		eieio();
 		*tbuf++ = tmp;
 	} while (--count != 0);
-	asm volatile("twi 0,%0,0; isync" : : "r" (tmp));
+	data_barrier(tmp);
 }
 EXPORT_SYMBOL(_insb);
 
@@ -47,11 +48,12 @@ void _outsb(volatile u8 __iomem *port, const void *buf, long count)
 
 	if (unlikely(count <= 0))
 		return;
-	asm volatile("sync");
+
+	mb();
 	do {
 		*(volatile u8 __force *)port = *tbuf++;
 	} while (--count != 0);
-	asm volatile("sync");
+	mb();
 }
 EXPORT_SYMBOL(_outsb);
 
@@ -62,13 +64,14 @@ void _insw(const volatile u16 __iomem *port, void *buf, long count)
 
 	if (unlikely(count <= 0))
 		return;
-	asm volatile("sync");
+
+	mb();
 	do {
 		tmp = *(const volatile u16 __force *)port;
 		eieio();
 		*tbuf++ = tmp;
 	} while (--count != 0);
-	asm volatile("twi 0,%0,0; isync" : : "r" (tmp));
+	data_barrier(tmp);
 }
 EXPORT_SYMBOL(_insw);
 
@@ -78,11 +81,12 @@ void _outsw(volatile u16 __iomem *port, const void *buf, long count)
 
 	if (unlikely(count <= 0))
 		return;
-	asm volatile("sync");
+
+	mb();
 	do {
 		*(volatile u16 __force *)port = *tbuf++;
 	} while (--count != 0);
-	asm volatile("sync");
+	mb();
 }
 EXPORT_SYMBOL(_outsw);
 
@@ -93,13 +97,14 @@ void _insl(const volatile u32 __iomem *port, void *buf, long count)
 
 	if (unlikely(count <= 0))
 		return;
-	asm volatile("sync");
+
+	mb();
 	do {
 		tmp = *(const volatile u32 __force *)port;
 		eieio();
 		*tbuf++ = tmp;
 	} while (--count != 0);
-	asm volatile("twi 0,%0,0; isync" : : "r" (tmp));
+	data_barrier(tmp);
 }
 EXPORT_SYMBOL(_insl);
 
@@ -109,11 +114,12 @@ void _outsl(volatile u32 __iomem *port, const void *buf, long count)
 
 	if (unlikely(count <= 0))
 		return;
-	asm volatile("sync");
+
+	mb();
 	do {
 		*(volatile u32 __force *)port = *tbuf++;
 	} while (--count != 0);
-	asm volatile("sync");
+	mb();
 }
 EXPORT_SYMBOL(_outsl);
 
@@ -127,7 +133,7 @@ _memset_io(volatile void __iomem *addr, int c, unsigned long n)
 	lc |= lc << 8;
 	lc |= lc << 16;
 
-	__asm__ __volatile__ ("sync" : : : "memory");
+	mb();
 	while(n && !IO_CHECK_ALIGN(p, 4)) {
 		*((volatile u8 *)p) = c;
 		p++;
@@ -143,7 +149,7 @@ _memset_io(volatile void __iomem *addr, int c, unsigned long n)
 		p++;
 		n--;
 	}
-	__asm__ __volatile__ ("sync" : : : "memory");
+	mb();
 }
 EXPORT_SYMBOL(_memset_io);
 
@@ -152,7 +158,7 @@ void _memcpy_fromio(void *dest, const volatile void __iomem *src,
 {
 	void *vsrc = (void __force *) src;
 
-	__asm__ __volatile__ ("sync" : : : "memory");
+	mb();
 	while(n && (!IO_CHECK_ALIGN(vsrc, 4) || !IO_CHECK_ALIGN(dest, 4))) {
 		*((u8 *)dest) = *((volatile u8 *)vsrc);
 		eieio();
@@ -174,7 +180,7 @@ void _memcpy_fromio(void *dest, const volatile void __iomem *src,
 		dest++;
 		n--;
 	}
-	__asm__ __volatile__ ("sync" : : : "memory");
+	mb();
 }
 EXPORT_SYMBOL(_memcpy_fromio);
 
@@ -182,7 +188,7 @@ void _memcpy_toio(volatile void __iomem *dest, const void *src, unsigned long n)
 {
 	void *vdest = (void __force *) dest;
 
-	__asm__ __volatile__ ("sync" : : : "memory");
+	mb();
 	while(n && (!IO_CHECK_ALIGN(vdest, 4) || !IO_CHECK_ALIGN(src, 4))) {
 		*((volatile u8 *)vdest) = *((u8 *)src);
 		src++;
@@ -201,6 +207,6 @@ void _memcpy_toio(volatile void __iomem *dest, const void *src, unsigned long n)
 		vdest++;
 		n--;
 	}
-	__asm__ __volatile__ ("sync" : : : "memory");
+	mb();
 }
 EXPORT_SYMBOL(_memcpy_toio);
-- 
2.47.1


