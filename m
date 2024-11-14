Return-Path: <linuxppc-dev+bounces-3192-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CDD9C8B26
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 13:53:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0QX6xzjz2ywS;
	Thu, 14 Nov 2024 23:51:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731588692;
	cv=none; b=KbUg3gWULfEyaQen2Fj2x7DpgdKtDod0DMWZXPKWEwcQVho6h1f5v7AWGgy5LzKyV685m6bQ58z+3Vxap2Ii65y7jmtR/ZFcZ1hYUKfFDcVaFe3jfJUNfShIqBcc6EXzl9gvMNtWI1FqdrngOse7sf3hJTGcIcuiOSxIDeqy3F0P6i3LgqmWRTjUQtq1smCV9Ea53bkuzYXJSiOyMJQvfcmAiTc3P3DNFC2/NszXUJd/6giscm2OVgxzkApvhcSZ36it9+JPuM6vA9vQUOyumZN8GaZ2xESoK9o1aVHrdPpuAdzA898MAhuv5CEzftrF0CEw41+oQ/VFQ0d6wzjB/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731588692; c=relaxed/relaxed;
	bh=SSVATc/lVCFgYSGqflZjafF+Cg9yXGJ8ESgt8eJFrfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOO71J/If4K0rmzrRYy+CHgXF6BmJFjfn+rjwlCUBn3hwNJgf5242mxs3aPQ9/sYXDKBZ+ReWEsmJ5roVPlW/XwmoIycEPAVfxqo/IHw/BANBhSWg1lSTBgQ18fRazAwD8yXH1xTX7K8gb6VuPkbDG6c876TbNJstp09NZ2Mi6Fa19c5ufp9ZgN3YlP2uB7xf541BpL8j+g/in7hJLhGhsGAcL0g7Os+Pu4u+N872nKZmU+gHyvA86dAu8z9r41q6nI2cuW6T6U3FBS49IkCKz+nUze8/vPoN1eTTLeu3mzCA034fQY+d+Pbgp2biSNlwqW5BgECVK03viIalgFGXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=k/uSavi/; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=k/uSavi/;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0QS24n1z300g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 23:51:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731588682;
	bh=SSVATc/lVCFgYSGqflZjafF+Cg9yXGJ8ESgt8eJFrfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k/uSavi/kFbAgzopToFFCWUXGQhlXjZ+VHkR3HduFh0NmX7mMj489AFRAT/UFuZsX
	 Zvol8sbyiJDamVX6sUHWxHmq3pl1KJbq2XFeKSDgpSEi7S3si8sygOOLMWiBrBk41T
	 wolUsT0rJqArsfIQDM63fkpIEkc4UDLpZeR08+WDA8Hx1ocP+iyyXIKFAtMxQQD9vt
	 0AMDNnUOBYocPvoInkthqZu8zjm6y9IWgqMMI67MCEZ3OupSbmWjsPt1Cy3RshXyqR
	 89R+t6aFX/BugBYGq8IcYSqAsHp9ayNxgbuPYwIOQuClpJ5bkhrtsqQbX9jsmTLZCt
	 Di51y6SOMscHw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0QL0tTHz4xSc;
	Thu, 14 Nov 2024 23:51:22 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<jk@ozlabs.org>,
	<arnd@arndb.de>,
	<geoff@infradead.org>
Subject: [RFC PATCH 11/20] powerpc/io: Remove PCI_FIX_ADDR
Date: Thu, 14 Nov 2024 23:51:00 +1100
Message-ID: <20241114125111.599093-11-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114125111.599093-1-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Now that PPC_INDIRECT_MMIO is removed, PCI_FIX_ADDR does nothing, so
remove it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
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
2.47.0


