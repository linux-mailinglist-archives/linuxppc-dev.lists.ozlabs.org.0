Return-Path: <linuxppc-dev+bounces-4305-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D0F9F641E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:57:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrFD1TPTz30Wp;
	Wed, 18 Dec 2024 21:55:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519344;
	cv=none; b=jVb4daPzZJzvUzxE6eQT1Vi2pleO8gkyvAKS8Ydy11xPQazPIS+FJKcNbbyXeVPvGQHdGoHcMkRSnxDutv31qFah8ctFnruw7jXLY+yUQVQ/Hiz3Pj+W7WWD7LfJBpi8aRzc67AywX3wsnQ16xPZoR679XKjlHDKK75hiIdfbTammAtvPR/GIvKn/SLA51L6y43pbqEs8v5Itg4fefYbvHFinLXZONodRhEq9J/X8bPMI1V+vNpLiTEC5LZ82CYWMY7Ii9pACjm/ytA8TCKkxbqvHtwr5Jz0Oy84G/oeBAf8ppLgrgo0DM7TRYBI/i7J+314BpKr+rpBzoIUwKpRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519344; c=relaxed/relaxed;
	bh=iz9zwkOM7N3WCEk1HOZSVgjobdTY9nV4NB9ifRavTFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fKMlIdrCo0UntX+Tg6sfGOGNmm2AbZzSkVpzi3sF9ndeOaIFWK4CLxhWJNgjtExeJ152zuNw+qKNuwczJGbqcstf7bXToph5qGpxV6LuRP2C1rPpV5r8QFYMduF+ZprkpWMZxd2LXCWmCI3S/mquA1ThKGAMdRt1BfQMZ4QSblVd7Cs64O0Xe5T+7V4hI2OKpLTV3l7dFEvAIVWeo6oWUGS8iSBgGtFZ3fncsMnvo5Pv9CPwor1EqVXoi49Za8v4zRX70D+NG2yRBBcjRDOQtskKYXBupueIrA77Ckpk5sBrtweDuuQqd/G/pG9QLF+keOByVngMP9AefgrPzYk3sw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qiPEdjgk; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qiPEdjgk;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF90VjNz30Vw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519334;
	bh=iz9zwkOM7N3WCEk1HOZSVgjobdTY9nV4NB9ifRavTFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qiPEdjgksp/SAjqBKZz1OzgRFApWGamRArGlbbMVbrs7EuOlqCRdKhJTMXo5DedDm
	 zuNP967gMr61+7fOnHaETfGmZgTKzY5nKU7pTgR65rM4ammJUnHhsO0OqDIFXp8EqI
	 yybmnC0p+uhAyXt9g5hdCq89Xs6t7twEQbyNDeH9ZpEkhtrkhEZ4Gyt7VezstZDT4y
	 IZ6DTTf8Hbz5/VAsAzeqif9nSc6IY27yU2y83KT+7p99MzkxTOtrf5uYq5W+KEfkxg
	 rZN8zz38nQKTcpVbJRu+0XgOld3/mHqTDkTu6jR/ntERx7wxL4JpmoYh3NYsQyfUOZ
	 1lDRWrEcXBuiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrF16r5Zz4xfN;
	Wed, 18 Dec 2024 21:55:33 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 16/25] powerpc/io: Use generic raw accessors
Date: Wed, 18 Dec 2024 21:55:04 +1100
Message-ID: <20241218105523.416573-16-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The raw accessors are identical to the generic versions, use the generic
versions.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: New.

 arch/powerpc/include/asm/io.h | 68 +++++------------------------------
 1 file changed, 9 insertions(+), 59 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 8e57d3402c2c..89754bfb6fad 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -276,67 +276,9 @@ extern void _memcpy_toio(volatile void __iomem *dest, const void *src,
 
 #define _IO_PORT(port)	((volatile void __iomem *)(_IO_BASE + (port)))
 
-/*
- * Non ordered and non-swapping "raw" accessors
- */
-
-static inline unsigned char __raw_readb(const volatile void __iomem *addr)
-{
-	return *(volatile unsigned char __force *)addr;
-}
-#define __raw_readb __raw_readb
-
-static inline unsigned short __raw_readw(const volatile void __iomem *addr)
-{
-	return *(volatile unsigned short __force *)addr;
-}
-#define __raw_readw __raw_readw
-
-static inline unsigned int __raw_readl(const volatile void __iomem *addr)
-{
-	return *(volatile unsigned int __force *)addr;
-}
-#define __raw_readl __raw_readl
-
-static inline void __raw_writeb(unsigned char v, volatile void __iomem *addr)
-{
-	*(volatile unsigned char __force *)addr = v;
-}
-#define __raw_writeb __raw_writeb
-
-static inline void __raw_writew(unsigned short v, volatile void __iomem *addr)
-{
-	*(volatile unsigned short __force *)addr = v;
-}
-#define __raw_writew __raw_writew
-
-static inline void __raw_writel(unsigned int v, volatile void __iomem *addr)
-{
-	*(volatile unsigned int __force *)addr = v;
-}
-#define __raw_writel __raw_writel
-
 #ifdef __powerpc64__
-static inline unsigned long __raw_readq(const volatile void __iomem *addr)
-{
-	return *(volatile unsigned long __force *)addr;
-}
-#define __raw_readq __raw_readq
-
-static inline void __raw_writeq(unsigned long v, volatile void __iomem *addr)
-{
-	*(volatile unsigned long __force *)addr = v;
-}
-#define __raw_writeq __raw_writeq
-
-static inline void __raw_writeq_be(unsigned long v, volatile void __iomem *addr)
-{
-	__raw_writeq((__force unsigned long)cpu_to_be64(v), addr);
-}
-#define __raw_writeq_be __raw_writeq_be
-
 /*
- * Real mode versions of the above. Those instructions are only supposed
+ * Real mode versions of raw accessors. Those instructions are only supposed
  * to be used in hypervisor real mode as per the architecture spec.
  */
 static inline void __raw_rm_writeb(u8 val, volatile void __iomem *paddr)
@@ -1080,6 +1022,14 @@ static inline void * bus_to_virt(unsigned long address)
 
 #include <asm-generic/io.h>
 
+#ifdef __powerpc64__
+static inline void __raw_writeq_be(unsigned long v, volatile void __iomem *addr)
+{
+	__raw_writeq((__force unsigned long)cpu_to_be64(v), addr);
+}
+#define __raw_writeq_be __raw_writeq_be
+#endif // __powerpc64__
+
 #endif /* __KERNEL__ */
 
 #endif /* _ASM_POWERPC_IO_H */
-- 
2.47.1


