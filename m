Return-Path: <linuxppc-dev+bounces-4306-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F579F6420
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:57:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrFD4DF2z30Tx;
	Wed, 18 Dec 2024 21:55:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519344;
	cv=none; b=hGMLs4gFQhZEE+KKCgj6qv+mSaTz+NrXBQrqFnRy7eGIdL61dJ+I7Z1qvZ4fj5ew57sYZz19K+f2jqG4iaEYY/RTvrp5Ek6tyrn6Z0ufl/vlwPRvwH7mEbeFvHWr2WxDZv4z9Y0C0bAY4J8qcweUnSlVQjRb1ml7piUFB2Xz1gpteR1+g5aYLJEDaJpSkZ5BB+WxXbulQzxOaATcu/cIVTr9aZGFqQl3pS+GbWdsXN6sjwU+2HfJG0zuD4oh2wXu6tzUtO3lD4+yP/u55ZGRsDsYE7dR8y4KgBR46vr+iMZ97y3216CUx8obhCxEfl36rhG/ZFUnU5ArXT631R8uhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519344; c=relaxed/relaxed;
	bh=Zjw0RCOf7CLEyB81GHP3QxWgbM7SiJNTsuFrXdLrjZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eeHe1GslSCwxitdYEI3m5DpV8/h2ruLfwh89VNYKsdI36jt6ICqElM/6q8+LEutDhlHTGrVPuT51mUR1lhg6Sc80HcJEiajdQlQivNEKoSLVAmaTMed60s5gmrE+6tL9U70iFeWH0zn7AS0AY+M1NpbTQIQ/7e5AV/vzmnLWzBa5zCdaBMwZfCrOjOVuVsFzM5Yvw7s4UUdvM+MyJmPhj9J9mlKM0FdQHFcu+2qA3pHTP1WtxE2dLF/BPYliyAc42D2BnApSRI1GqhAL18X7ih5dT3lQWAHKapFngKY6jQOGd8pwaWBTijygXZRhEysTLVT9vZAIY/iskBveAuWf8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZkgARuEl; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZkgARuEl;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF83lrXz30ML
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519333;
	bh=Zjw0RCOf7CLEyB81GHP3QxWgbM7SiJNTsuFrXdLrjZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZkgARuElmKW8jFxQlTu3ehfSlWKqNwakohNqTeB00KHi6m8SaszCsldK1LzPEkhcJ
	 Gxr8k+QZDsm6K5SAL5ELMc8GMS9ya2FqNAO479tJJcK95Lq8ErNQO/tX4LPzbQ2/1y
	 LfXG3UM2ULt3lHvbOZ/VWaA+jtUKRQdeaenE+muKoeJ/0CTia196s90N0iFeQRBcBo
	 tsOWADnKaASOLkclclBl4gAvIw0nVi4p2ENkp4ku2q4s4MrZLXuM+Yc22RrX6+Gx+j
	 ANYr0GzguGSSuCpABdFGsbJ/TUs+z1mIL2LUUufw8UF3vtHD+FEIBcL/B/KRSLUK83
	 Ezki1CFxKQdLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrF13bgnz4xfL;
	Wed, 18 Dec 2024 21:55:33 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 15/25] powerpc/io: Spell-out PCI_IO_ADDR
Date: Wed, 18 Dec 2024 21:55:03 +1100
Message-ID: <20241218105523.416573-15-mpe@ellerman.id.au>
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

PCI_IO_ADDR is a ppc-ism, which obscures the fact that some of the
powerpc accessors are identical to the generic ones. So remove it and
spell out the type fully.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: New.

 arch/powerpc/include/asm/io.h | 51 +++++++++++++++++------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index c21796354f87..8e57d3402c2c 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -274,10 +274,7 @@ extern void _memcpy_toio(volatile void __iomem *dest, const void *src,
 #include <asm/eeh.h>
 #endif
 
-/* Shortcut to the MMIO argument pointer */
-#define PCI_IO_ADDR	volatile void __iomem *
-
-#define _IO_PORT(port)	((PCI_IO_ADDR)(_IO_BASE + (port)))
+#define _IO_PORT(port)	((volatile void __iomem *)(_IO_BASE + (port)))
 
 /*
  * Non ordered and non-swapping "raw" accessors
@@ -570,133 +567,133 @@ __do_out_asm(_rec_outl, "stwbrx")
 				_memcpy_fromio(dst, src, n)
 #endif /* !CONFIG_EEH */
 
-static inline u8 readb(const PCI_IO_ADDR addr)
+static inline u8 readb(const volatile void __iomem *addr)
 {
 	return __do_readb(addr);
 }
 #define readb readb
 
-static inline u16 readw(const PCI_IO_ADDR addr)
+static inline u16 readw(const volatile void __iomem *addr)
 {
 	return __do_readw(addr);
 }
 #define readw readw
 
-static inline u32 readl(const PCI_IO_ADDR addr)
+static inline u32 readl(const volatile void __iomem *addr)
 {
 	return __do_readl(addr);
 }
 #define readl readl
 
-static inline u16 readw_be(const PCI_IO_ADDR addr)
+static inline u16 readw_be(const volatile void __iomem *addr)
 {
 	return __do_readw_be(addr);
 }
 
-static inline u32 readl_be(const PCI_IO_ADDR addr)
+static inline u32 readl_be(const volatile void __iomem *addr)
 {
 	return __do_readl_be(addr);
 }
 
-static inline void writeb(u8 val, PCI_IO_ADDR addr)
+static inline void writeb(u8 val, volatile void __iomem *addr)
 {
 	out_8(addr, val);
 }
 #define writeb writeb
 
-static inline void writew(u16 val, PCI_IO_ADDR addr)
+static inline void writew(u16 val, volatile void __iomem *addr)
 {
 	out_le16(addr, val);
 }
 #define writew writew
 
-static inline void writel(u32 val, PCI_IO_ADDR addr)
+static inline void writel(u32 val, volatile void __iomem *addr)
 {
 	out_le32(addr, val);
 }
 #define writel writel
 
-static inline void writew_be(u16 val, PCI_IO_ADDR addr)
+static inline void writew_be(u16 val, volatile void __iomem *addr)
 {
 	out_be16(addr, val);
 }
 
-static inline void writel_be(u32 val, PCI_IO_ADDR addr)
+static inline void writel_be(u32 val, volatile void __iomem *addr)
 {
 	out_be32(addr, val);
 }
 
-static inline void readsb(const PCI_IO_ADDR a, void *b, unsigned long c)
+static inline void readsb(const volatile void __iomem *a, void *b, unsigned long c)
 {
 	__do_readsb(a, b, c);
 }
 #define readsb readsb
 
-static inline void readsw(const PCI_IO_ADDR a, void *b, unsigned long c)
+static inline void readsw(const volatile void __iomem *a, void *b, unsigned long c)
 {
 	__do_readsw(a, b, c);
 }
 #define readsw readsw
 
-static inline void readsl(const PCI_IO_ADDR a, void *b, unsigned long c)
+static inline void readsl(const volatile void __iomem *a, void *b, unsigned long c)
 {
 	__do_readsl(a, b, c);
 }
 #define readsl readsl
 
-static inline void writesb(PCI_IO_ADDR a, const void *b, unsigned long c)
+static inline void writesb(volatile void __iomem *a, const void *b, unsigned long c)
 {
 	__do_writesb(a, b, c);
 }
 #define writesb writesb
 
-static inline void writesw(PCI_IO_ADDR a, const void *b, unsigned long c)
+static inline void writesw(volatile void __iomem *a, const void *b, unsigned long c)
 {
 	__do_writesw(a, b, c);
 }
 #define writesw writesw
 
-static inline void writesl(PCI_IO_ADDR a, const void *b, unsigned long c)
+static inline void writesl(volatile void __iomem *a, const void *b, unsigned long c)
 {
 	__do_writesl(a, b, c);
 }
 #define writesl writesl
 
-static inline void memset_io(PCI_IO_ADDR a, int c, unsigned long n)
+static inline void memset_io(volatile void __iomem *a, int c, unsigned long n)
 {
 	_memset_io(a, c, n);
 }
 #define memset_io memset_io
 
-static inline void memcpy_fromio(void *d, const PCI_IO_ADDR s, unsigned long n)
+static inline void memcpy_fromio(void *d, const volatile void __iomem *s, unsigned long n)
 {
 	__do_memcpy_fromio(d, s, n);
 }
 #define memcpy_fromio memcpy_fromio
 
-static inline void memcpy_toio(PCI_IO_ADDR d, const void *s, unsigned long n)
+static inline void memcpy_toio(volatile void __iomem *d, const void *s, unsigned long n)
 {
 	_memcpy_toio(d, s, n);
 }
 #define memcpy_toio memcpy_toio
 
 #ifdef __powerpc64__
-static inline u64 readq(const PCI_IO_ADDR addr)
+static inline u64 readq(const volatile void __iomem *addr)
 {
 	return __do_readq(addr);
 }
 
-static inline u64 readq_be(const PCI_IO_ADDR addr)
+static inline u64 readq_be(const volatile void __iomem *addr)
 {
 	return __do_readq_be(addr);
 }
 
-static inline void writeq(u64 val, PCI_IO_ADDR addr)
+static inline void writeq(u64 val, volatile void __iomem *addr)
 {
 	out_le64(addr, val);
 }
 
-static inline void writeq_be(u64 val, PCI_IO_ADDR addr)
+static inline void writeq_be(u64 val, volatile void __iomem *addr)
 {
 	out_be64(addr, val);
 }
-- 
2.47.1


