Return-Path: <linuxppc-dev+bounces-4301-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8839F6416
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:56:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrF96bw4z30W9;
	Wed, 18 Dec 2024 21:55:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519341;
	cv=none; b=bHQKlBb3lR5YOAGrMHzvpF0sXBSYUDj9MdwPH1WCS3aPe068Mb1OE9CxPvcfXovC5sF8PJRZtJdVmzzsgbSPPT4upG8mh9tyqvT5iqVIGRPJGqtiK6pwuREpp7Qn2aXX9rX0GCFnMTPzGyTlZkTh5TGELWfNrsX8+VRtZL15eDrQ8l7Q8GGPWcUskxp61nmcLpZ6zPLXSmcDBpAOxzsGEkKuSLTJ3ANG9+/c1IFrIOuKpM+AruKVelLP9pMrNwtrxbWRfYTAUhHCWOGK5L3qXCYq74a7RJ6Kc014ihFIOyQiTab8n4Cwoegy6K6zRyywcPP9HNMmDKT/7pIM7SRZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519341; c=relaxed/relaxed;
	bh=k51Vb6vcR5V4PGPJLYu+0yu2/xi3gjFlPKtoMgwac0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvDYpIQNRgOrSJqygX4NNaYLLL6maLPxjzGSzKat7CTvFsBzJM+8F7Ppah0N4IP7NkY4VrSNMspcEFvFImyjhQrVWTyAnE3Z0o0xkSCABVDjr7TfzctFL4VcakCyJi0eTeMkPrcw3qHzSzA+jfQlYc+LuyadUy4kmVus+rN0Bb4Gt/q5sOsLqIEvXpBkCftQzSwaJ0BJWba2wzTYTH+Ja2siwr8mcguHO2CnzwKVLx28vMNZOUqza30WcpOs9Cdpwo/VFmo2/K9bFpeYTP8awxhd0r1cxpCa/DwvpW7z9yy6k+X7Us7sdlzsOjFZylnBe4yxGDMmnTYpv4CGNQBtSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Apm6ARvG; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Apm6ARvG;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF55B3hz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519331;
	bh=k51Vb6vcR5V4PGPJLYu+0yu2/xi3gjFlPKtoMgwac0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Apm6ARvGlJVixmQDMsOGGTKbT0BehAaRhzPcRrJIkwDVeRxlzQub3SEhsKjU/SKjS
	 Gj+EyBbMdpHqrMPFrrN8w27ecIuVhgvEv5e1DApzj/yr58WTC36lRcQLuv/JgUj1rs
	 FRRhvocCM1h4F/d0I5H9NFCYb6cTW//aAAg/Q8zYecW00j4YAJsZarqpyZ9i8OUvoy
	 3T8vwBuvAcb8n6xPTQOM7RtpVFqZ/8Vb1n6YDgOZiSE1ANetBUZlPdT4+NfXAySxny
	 75wYSwnmwi0bIO2x6YwwqOm2emym2slEjUuVStHKj/jh/v4Wv0Ml0244ZkCrQ/zZdM
	 opmUPY1llwVrg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrDz4skZz4xfH;
	Wed, 18 Dec 2024 21:55:31 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 11/25] powerpc/io: Remove PCI_FIX_ADDR
Date: Wed, 18 Dec 2024 21:54:59 +1100
Message-ID: <20241218105523.416573-11-mpe@ellerman.id.au>
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

Now that PPC_INDIRECT_MMIO is removed, PCI_FIX_ADDR does nothing, so
remove it.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Unchanged.

 arch/powerpc/include/asm/io.h | 86 +++++++++++++++++------------------
 arch/powerpc/mm/ioremap_64.c  |  2 +-
 2 files changed, 43 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index fcb4ecca30a4..ecc0dff82dc6 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -277,58 +277,56 @@ extern void _memcpy_toio(volatile void __iomem *dest, const void *src,
 /* Shortcut to the MMIO argument pointer */
 #define PCI_IO_ADDR	volatile void __iomem *
 
-#define PCI_FIX_ADDR(addr) (addr)
-
 /*
  * Non ordered and non-swapping "raw" accessors
  */
 
 static inline unsigned char __raw_readb(const volatile void __iomem *addr)
 {
-	return *(volatile unsigned char __force *)PCI_FIX_ADDR(addr);
+	return *(volatile unsigned char __force *)addr;
 }
 #define __raw_readb __raw_readb
 
 static inline unsigned short __raw_readw(const volatile void __iomem *addr)
 {
-	return *(volatile unsigned short __force *)PCI_FIX_ADDR(addr);
+	return *(volatile unsigned short __force *)addr;
 }
 #define __raw_readw __raw_readw
 
 static inline unsigned int __raw_readl(const volatile void __iomem *addr)
 {
-	return *(volatile unsigned int __force *)PCI_FIX_ADDR(addr);
+	return *(volatile unsigned int __force *)addr;
 }
 #define __raw_readl __raw_readl
 
 static inline void __raw_writeb(unsigned char v, volatile void __iomem *addr)
 {
-	*(volatile unsigned char __force *)PCI_FIX_ADDR(addr) = v;
+	*(volatile unsigned char __force *)addr = v;
 }
 #define __raw_writeb __raw_writeb
 
 static inline void __raw_writew(unsigned short v, volatile void __iomem *addr)
 {
-	*(volatile unsigned short __force *)PCI_FIX_ADDR(addr) = v;
+	*(volatile unsigned short __force *)addr = v;
 }
 #define __raw_writew __raw_writew
 
 static inline void __raw_writel(unsigned int v, volatile void __iomem *addr)
 {
-	*(volatile unsigned int __force *)PCI_FIX_ADDR(addr) = v;
+	*(volatile unsigned int __force *)addr = v;
 }
 #define __raw_writel __raw_writel
 
 #ifdef __powerpc64__
 static inline unsigned long __raw_readq(const volatile void __iomem *addr)
 {
-	return *(volatile unsigned long __force *)PCI_FIX_ADDR(addr);
+	return *(volatile unsigned long __force *)addr;
 }
 #define __raw_readq __raw_readq
 
 static inline void __raw_writeq(unsigned long v, volatile void __iomem *addr)
 {
-	*(volatile unsigned long __force *)PCI_FIX_ADDR(addr) = v;
+	*(volatile unsigned long __force *)addr = v;
 }
 #define __raw_writeq __raw_writeq
 
@@ -507,30 +505,30 @@ __do_out_asm(_rec_outl, "stwbrx")
  * possible to hook directly at the toplevel PIO operation if they have to
  * be handled differently
  */
-#define __do_writeb(val, addr)	out_8(PCI_FIX_ADDR(addr), val)
-#define __do_writew(val, addr)	out_le16(PCI_FIX_ADDR(addr), val)
-#define __do_writel(val, addr)	out_le32(PCI_FIX_ADDR(addr), val)
-#define __do_writeq(val, addr)	out_le64(PCI_FIX_ADDR(addr), val)
-#define __do_writew_be(val, addr) out_be16(PCI_FIX_ADDR(addr), val)
-#define __do_writel_be(val, addr) out_be32(PCI_FIX_ADDR(addr), val)
-#define __do_writeq_be(val, addr) out_be64(PCI_FIX_ADDR(addr), val)
+#define __do_writeb(val, addr)	out_8(addr, val)
+#define __do_writew(val, addr)	out_le16(addr, val)
+#define __do_writel(val, addr)	out_le32(addr, val)
+#define __do_writeq(val, addr)	out_le64(addr, val)
+#define __do_writew_be(val, addr) out_be16(addr, val)
+#define __do_writel_be(val, addr) out_be32(addr, val)
+#define __do_writeq_be(val, addr) out_be64(addr, val)
 
 #ifdef CONFIG_EEH
-#define __do_readb(addr)	eeh_readb(PCI_FIX_ADDR(addr))
-#define __do_readw(addr)	eeh_readw(PCI_FIX_ADDR(addr))
-#define __do_readl(addr)	eeh_readl(PCI_FIX_ADDR(addr))
-#define __do_readq(addr)	eeh_readq(PCI_FIX_ADDR(addr))
-#define __do_readw_be(addr)	eeh_readw_be(PCI_FIX_ADDR(addr))
-#define __do_readl_be(addr)	eeh_readl_be(PCI_FIX_ADDR(addr))
-#define __do_readq_be(addr)	eeh_readq_be(PCI_FIX_ADDR(addr))
+#define __do_readb(addr)	eeh_readb(addr)
+#define __do_readw(addr)	eeh_readw(addr)
+#define __do_readl(addr)	eeh_readl(addr)
+#define __do_readq(addr)	eeh_readq(addr)
+#define __do_readw_be(addr)	eeh_readw_be(addr)
+#define __do_readl_be(addr)	eeh_readl_be(addr)
+#define __do_readq_be(addr)	eeh_readq_be(addr)
 #else /* CONFIG_EEH */
-#define __do_readb(addr)	in_8(PCI_FIX_ADDR(addr))
-#define __do_readw(addr)	in_le16(PCI_FIX_ADDR(addr))
-#define __do_readl(addr)	in_le32(PCI_FIX_ADDR(addr))
-#define __do_readq(addr)	in_le64(PCI_FIX_ADDR(addr))
-#define __do_readw_be(addr)	in_be16(PCI_FIX_ADDR(addr))
-#define __do_readl_be(addr)	in_be32(PCI_FIX_ADDR(addr))
-#define __do_readq_be(addr)	in_be64(PCI_FIX_ADDR(addr))
+#define __do_readb(addr)	in_8(addr)
+#define __do_readw(addr)	in_le16(addr)
+#define __do_readl(addr)	in_le32(addr)
+#define __do_readq(addr)	in_le64(addr)
+#define __do_readw_be(addr)	in_be16(addr)
+#define __do_readl_be(addr)	in_be32(addr)
+#define __do_readq_be(addr)	in_be64(addr)
 #endif /* !defined(CONFIG_EEH) */
 
 #ifdef CONFIG_PPC32
@@ -550,17 +548,17 @@ __do_out_asm(_rec_outl, "stwbrx")
 #endif /* !CONFIG_PPC32 */
 
 #ifdef CONFIG_EEH
-#define __do_readsb(a, b, n)	eeh_readsb(PCI_FIX_ADDR(a), (b), (n))
-#define __do_readsw(a, b, n)	eeh_readsw(PCI_FIX_ADDR(a), (b), (n))
-#define __do_readsl(a, b, n)	eeh_readsl(PCI_FIX_ADDR(a), (b), (n))
+#define __do_readsb(a, b, n)	eeh_readsb(a, (b), (n))
+#define __do_readsw(a, b, n)	eeh_readsw(a, (b), (n))
+#define __do_readsl(a, b, n)	eeh_readsl(a, (b), (n))
 #else /* CONFIG_EEH */
-#define __do_readsb(a, b, n)	_insb(PCI_FIX_ADDR(a), (b), (n))
-#define __do_readsw(a, b, n)	_insw(PCI_FIX_ADDR(a), (b), (n))
-#define __do_readsl(a, b, n)	_insl(PCI_FIX_ADDR(a), (b), (n))
+#define __do_readsb(a, b, n)	_insb(a, (b), (n))
+#define __do_readsw(a, b, n)	_insw(a, (b), (n))
+#define __do_readsl(a, b, n)	_insl(a, (b), (n))
 #endif /* !CONFIG_EEH */
-#define __do_writesb(a, b, n)	_outsb(PCI_FIX_ADDR(a),(b),(n))
-#define __do_writesw(a, b, n)	_outsw(PCI_FIX_ADDR(a),(b),(n))
-#define __do_writesl(a, b, n)	_outsl(PCI_FIX_ADDR(a),(b),(n))
+#define __do_writesb(a, b, n)	_outsb(a, (b), (n))
+#define __do_writesw(a, b, n)	_outsw(a, (b), (n))
+#define __do_writesl(a, b, n)	_outsl(a, (b), (n))
 
 #define __do_insb(p, b, n)	readsb((PCI_IO_ADDR)(_IO_BASE+(p)), (b), (n))
 #define __do_insw(p, b, n)	readsw((PCI_IO_ADDR)(_IO_BASE+(p)), (b), (n))
@@ -570,16 +568,16 @@ __do_out_asm(_rec_outl, "stwbrx")
 #define __do_outsl(p, b, n)	writesl((PCI_IO_ADDR)(_IO_BASE+(p)),(b),(n))
 
 #define __do_memset_io(addr, c, n)	\
-				_memset_io(PCI_FIX_ADDR(addr), c, n)
+				_memset_io(addr, c, n)
 #define __do_memcpy_toio(dst, src, n)	\
-				_memcpy_toio(PCI_FIX_ADDR(dst), src, n)
+				_memcpy_toio(dst, src, n)
 
 #ifdef CONFIG_EEH
 #define __do_memcpy_fromio(dst, src, n)	\
-				eeh_memcpy_fromio(dst, PCI_FIX_ADDR(src), n)
+				eeh_memcpy_fromio(dst, src, n)
 #else /* CONFIG_EEH */
 #define __do_memcpy_fromio(dst, src, n)	\
-				_memcpy_fromio(dst,PCI_FIX_ADDR(src),n)
+				_memcpy_fromio(dst, src, n)
 #endif /* !CONFIG_EEH */
 
 #ifdef CONFIG_PPC_INDIRECT_PIO
diff --git a/arch/powerpc/mm/ioremap_64.c b/arch/powerpc/mm/ioremap_64.c
index d24e5f166723..fb8b55bd2cd5 100644
--- a/arch/powerpc/mm/ioremap_64.c
+++ b/arch/powerpc/mm/ioremap_64.c
@@ -52,6 +52,6 @@ void iounmap(volatile void __iomem *token)
 	if (!slab_is_available())
 		return;
 
-	generic_iounmap(PCI_FIX_ADDR(token));
+	generic_iounmap(token);
 }
 EXPORT_SYMBOL(iounmap);
-- 
2.47.1


