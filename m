Return-Path: <linuxppc-dev+bounces-4307-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE259F6422
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:57:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrFF5nX9z30fM;
	Wed, 18 Dec 2024 21:55:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519345;
	cv=none; b=FcII8DchT202HRLWzlqeHia24zAV8xq4r2qXoHgiL1dCDDnX3BaMYfDERyqLk6qK39aFgC2fOy1V818Qrfq2S4jcmi0o/MkaWVp+Yh4hL3Ao/oarltnzOg/+GDQZBurcAqwCIYLNzP/JfcBMf9grW+Qwv02Qe2gjXTtUNAo98J6nFn2uspJBhFeZoTug+iLs6DEv3t3p3aW23Q7k+bzkmcYzwAEhkr/WvhlUOXvddFaguAkcfi0zWXE3peRctDmkkPGHZn5yncj/Ri9Kj9dicuyDN7lmj2OLXPfx4a+qY29VEikfStlMVDlmw/LmhSqdayqUKFikcA43yDXpN8kRvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519345; c=relaxed/relaxed;
	bh=2x34smYLxa+bKH4oOuRR1qY1TkhviGrx3XdBtyNH/E8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkbyIqe03WT+sagPQw7zPMHImF0K4BltsuQfpNoPqEu9hbHoDF0mXJinNBqwDR5Yr72zHmg9JtmXYeDYRgHYmaPTL6Wb+7dR5m2zh+bgmJVYJaB1KgteIqy2tbGWUqlkV9K6Bj+caLAvkUK6sMPUS4sQHkjDPT18mqlqbaImZ9uq6m5FZQFbdQBOZrNa2oJfvO5fVL9K0ALs4e37HYtCKlDuMERN6zRzUaRbOXEWgw2lPgBgCXO4BsskdINljikxSGANRr0gtzGOsQkMGsmJoaPDLc5DdzuRLnhVoTxni/JYKo/K9v5/klMDFJLV/qkvpQ+nGE408/QwfDqUUTOTrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BWNIQdDV; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BWNIQdDV;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF93dt5z30W1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519334;
	bh=2x34smYLxa+bKH4oOuRR1qY1TkhviGrx3XdBtyNH/E8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BWNIQdDVyVsEO61DJXW+3/zc7qTt5MXmc80n2UNnG/K36COeKBpzgz3ABlncgF03Q
	 hwzOiJ2XUcLg/0q2gQcbWgo0V+xnEeGJByvejmDKNSv/G5KNUH+RcdgQcdXkVEuTGJ
	 jcdnmWTkjHU+kYGl2pwhdxdqunwwdU9IUkGkIyRbxIN3SnK53abW6m78JVfzDc9nTh
	 H1WLPx+Q6Nfg8OnW8f2DDmyoHzl/04HO+3WbYBQDQEoad1lLgh0NX3ycjtQa5ZnwU7
	 MTDhzeSxAGYUNTC91wGHyvzBPFjfK///k/9e3uotImzGaGZxZS6NR82nZJuGPu4sg2
	 jwqi0SBd/UHNQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrF2335jz4xfP;
	Wed, 18 Dec 2024 21:55:34 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 17/25] powerpc/io: Rename _insw_ns() etc.
Date: Wed, 18 Dec 2024 21:55:05 +1100
Message-ID: <20241218105523.416573-17-mpe@ellerman.id.au>
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

The "_ns" suffix was "historical" in 2006, finally remove it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: New.

 arch/powerpc/include/asm/io.h | 23 +++++------------------
 arch/powerpc/kernel/io.c      | 16 ++++++++--------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 89754bfb6fad..922ee33a87cb 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -80,16 +80,12 @@ extern bool isa_io_special;
  *
  *	in_8, in_le16, in_be16, in_le32, in_be32, in_le64, in_be64
  *	out_8, out_le16, out_be16, out_le32, out_be32, out_le64, out_be64
- *	_insb, _insw_ns, _insl_ns, _outsb, _outsw_ns, _outsl_ns
+ *	_insb, _insw, _insl, _outsb, _outsw, _outsl
  *
  * Those operate directly on a kernel virtual address. Note that the prototype
  * for the out_* accessors has the arguments in opposite order from the usual
  * linux PCI accessors. Unlike those, they take the address first and the value
  * next.
- *
- * Note: I might drop the _ns suffix on the stream operations soon as it is
- * simply normal for stream operations to not swap in the first place.
- *
  */
 
 /* -mprefixed can generate offsets beyond range, fall back hack */
@@ -228,19 +224,10 @@ static inline void out_be64(volatile u64 __iomem *addr, u64 val)
  */
 extern void _insb(const volatile u8 __iomem *addr, void *buf, long count);
 extern void _outsb(volatile u8 __iomem *addr,const void *buf,long count);
-extern void _insw_ns(const volatile u16 __iomem *addr, void *buf, long count);
-extern void _outsw_ns(volatile u16 __iomem *addr, const void *buf, long count);
-extern void _insl_ns(const volatile u32 __iomem *addr, void *buf, long count);
-extern void _outsl_ns(volatile u32 __iomem *addr, const void *buf, long count);
-
-/* The _ns naming is historical and will be removed. For now, just #define
- * the non _ns equivalent names
- */
-#define _insw	_insw_ns
-#define _insl	_insl_ns
-#define _outsw	_outsw_ns
-#define _outsl	_outsl_ns
-
+extern void _insw(const volatile u16 __iomem *addr, void *buf, long count);
+extern void _outsw(volatile u16 __iomem *addr, const void *buf, long count);
+extern void _insl(const volatile u32 __iomem *addr, void *buf, long count);
+extern void _outsl(volatile u32 __iomem *addr, const void *buf, long count);
 
 /*
  * memset_io, memcpy_toio, memcpy_fromio base implementations are out of line
diff --git a/arch/powerpc/kernel/io.c b/arch/powerpc/kernel/io.c
index 6af535905984..6e7b49a676d9 100644
--- a/arch/powerpc/kernel/io.c
+++ b/arch/powerpc/kernel/io.c
@@ -55,7 +55,7 @@ void _outsb(volatile u8 __iomem *port, const void *buf, long count)
 }
 EXPORT_SYMBOL(_outsb);
 
-void _insw_ns(const volatile u16 __iomem *port, void *buf, long count)
+void _insw(const volatile u16 __iomem *port, void *buf, long count)
 {
 	u16 *tbuf = buf;
 	u16 tmp;
@@ -70,9 +70,9 @@ void _insw_ns(const volatile u16 __iomem *port, void *buf, long count)
 	} while (--count != 0);
 	asm volatile("twi 0,%0,0; isync" : : "r" (tmp));
 }
-EXPORT_SYMBOL(_insw_ns);
+EXPORT_SYMBOL(_insw);
 
-void _outsw_ns(volatile u16 __iomem *port, const void *buf, long count)
+void _outsw(volatile u16 __iomem *port, const void *buf, long count)
 {
 	const u16 *tbuf = buf;
 
@@ -84,9 +84,9 @@ void _outsw_ns(volatile u16 __iomem *port, const void *buf, long count)
 	} while (--count != 0);
 	asm volatile("sync");
 }
-EXPORT_SYMBOL(_outsw_ns);
+EXPORT_SYMBOL(_outsw);
 
-void _insl_ns(const volatile u32 __iomem *port, void *buf, long count)
+void _insl(const volatile u32 __iomem *port, void *buf, long count)
 {
 	u32 *tbuf = buf;
 	u32 tmp;
@@ -101,9 +101,9 @@ void _insl_ns(const volatile u32 __iomem *port, void *buf, long count)
 	} while (--count != 0);
 	asm volatile("twi 0,%0,0; isync" : : "r" (tmp));
 }
-EXPORT_SYMBOL(_insl_ns);
+EXPORT_SYMBOL(_insl);
 
-void _outsl_ns(volatile u32 __iomem *port, const void *buf, long count)
+void _outsl(volatile u32 __iomem *port, const void *buf, long count)
 {
 	const u32 *tbuf = buf;
 
@@ -115,7 +115,7 @@ void _outsl_ns(volatile u32 __iomem *port, const void *buf, long count)
 	} while (--count != 0);
 	asm volatile("sync");
 }
-EXPORT_SYMBOL(_outsl_ns);
+EXPORT_SYMBOL(_outsl);
 
 #define IO_CHECK_ALIGN(v,a) ((((unsigned long)(v)) & ((a) - 1)) == 0)
 
-- 
2.47.1


