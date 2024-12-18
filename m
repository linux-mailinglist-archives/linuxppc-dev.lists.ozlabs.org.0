Return-Path: <linuxppc-dev+bounces-4303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BE79F641B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:56:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrFC1Mn1z30WY;
	Wed, 18 Dec 2024 21:55:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519343;
	cv=none; b=Ute/5DdXPSpiAvHainKkLqcdyVA53Imjmj5SdxmVHfgshlyUopgAD4hRet0ZZn2m2U187Jf8oSQ9XjvOMfGIp/xi+3anzIUmwEoPgWUP7HIw/DQiDw6xwDiM4NyW6Rl6AglHqW30xTDWohVykQ2cZNCA6bIhMUQZDSPbBfvqtTIG7vst/x7ENpAVWvdn6NmGNYWguHasSh47RJSETCCZXzMPrENPa/mGw38srjkwr4K1EpxM83LkY4qpznBQZ21hs22/qtcd7W2+jCXq8BYeAjgTlbwfR13vD0HGr652PxDBxMYp/Iws5Z45RA6hq+ps4um0x5b1v/BALbCuT25rcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519343; c=relaxed/relaxed;
	bh=lBejjm8f7Og98+RFkyUcVW+G1puEr3FuQutb/UeyfmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJpK8dJOIxDxJkKCMMuiGQyCzlDWjcK0/vGac8I+OqcKE/IDn9fIdiq2QmA+Tk0lQf0fQ+Fnh78/MrwajPadIA4xB0QHhmadTs7ElDhgbGBizO6P2CXU+AqMbwwF+0Cbu9eVBNgKctBdv1TbTXcK9kPNcUfm9yMb7mQNrhPLysJbrPX97Ze2gmyVoS7xGZ+VLzp80+J0V58n2yiL8W0qqTfCzGlqlNM09XS6QBDxHkMw2ehW3eUwMMb3yr+ofnferMRa4nsJiukfpowTF1EPQYdpNhfk3wmujDFjbvwYbJecjQxbTsguv+ou0cAASASUWhA+vUvewAdR/HunjtCokA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nDjk2H+R; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nDjk2H+R;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF664LGz30Tw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519332;
	bh=lBejjm8f7Og98+RFkyUcVW+G1puEr3FuQutb/UeyfmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nDjk2H+RJU9wyPkWpibjNFH4HWMnGK4k5J/sqyMNyG+7mHuI1sAJpxD4d0sHY7Tkb
	 UC163np/D6DLmOnIrjCK5Fx5qKtiEykrPU+82sz0S4rcRwIi2vsX93FW9H4I3YJ8Rr
	 Cc/kopPmn5VxaV+h74eTxpNBsAsMxIC5yXVr1ZX39QULX8lW8X05/Snbar2c5ML9cg
	 g+42m5bzKD5/tun/UVLs8qByDGpxW76qCxvc924H/qfjCsKKlc+oWw3RtKOm8dr1LQ
	 DPo8503sgHME8VlV+qHVt+LSgueSK8JeOzMa6ToxVUDktHevUGeslTVuYmTwzqyrrX
	 8vt9d+zaJKEAA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrF04JZVz4xdV;
	Wed, 18 Dec 2024 21:55:32 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 13/25] powerpc/io: Remove unnecessary indirection
Date: Wed, 18 Dec 2024 21:55:01 +1100
Message-ID: <20241218105523.416573-13-mpe@ellerman.id.au>
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

Some of the __do_xxx() defines do nothing useful, they just existed to
make the previous hooking macros work. So remove them.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Rebase. Also do _memset_io() and _memcpy_toio()

 arch/powerpc/include/asm/io.h | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 24a0ae26510f..7731f2364275 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -505,13 +505,6 @@ __do_out_asm(_rec_outl, "stwbrx")
  * possible to hook directly at the toplevel PIO operation if they have to
  * be handled differently
  */
-#define __do_writeb(val, addr)	out_8(addr, val)
-#define __do_writew(val, addr)	out_le16(addr, val)
-#define __do_writel(val, addr)	out_le32(addr, val)
-#define __do_writeq(val, addr)	out_le64(addr, val)
-#define __do_writew_be(val, addr) out_be16(addr, val)
-#define __do_writel_be(val, addr) out_be32(addr, val)
-#define __do_writeq_be(val, addr) out_be64(addr, val)
 
 #ifdef CONFIG_EEH
 #define __do_readb(addr)	eeh_readb(addr)
@@ -567,11 +560,6 @@ __do_out_asm(_rec_outl, "stwbrx")
 #define __do_outsw(p, b, n)	writesw((PCI_IO_ADDR)(_IO_BASE+(p)),(b),(n))
 #define __do_outsl(p, b, n)	writesl((PCI_IO_ADDR)(_IO_BASE+(p)),(b),(n))
 
-#define __do_memset_io(addr, c, n)	\
-				_memset_io(addr, c, n)
-#define __do_memcpy_toio(dst, src, n)	\
-				_memcpy_toio(dst, src, n)
-
 #ifdef CONFIG_EEH
 #define __do_memcpy_fromio(dst, src, n)	\
 				eeh_memcpy_fromio(dst, src, n)
@@ -610,30 +598,30 @@ static inline u32 readl_be(const PCI_IO_ADDR addr)
 
 static inline void writeb(u8 val, PCI_IO_ADDR addr)
 {
-	__do_writeb(val, addr);
+	out_8(addr, val);
 }
 #define writeb writeb
 
 static inline void writew(u16 val, PCI_IO_ADDR addr)
 {
-	__do_writew(val, addr);
+	out_le16(addr, val);
 }
 #define writew writew
 
 static inline void writel(u32 val, PCI_IO_ADDR addr)
 {
-	__do_writel(val, addr);
+	out_le32(addr, val);
 }
 #define writel writel
 
 static inline void writew_be(u16 val, PCI_IO_ADDR addr)
 {
-	__do_writew_be(val, addr);
+	out_be16(addr, val);
 }
 
 static inline void writel_be(u32 val, PCI_IO_ADDR addr)
 {
-	__do_writel_be(val, addr);
+	out_be32(addr, val);
 }
 
 static inline void readsb(const PCI_IO_ADDR a, void *b, unsigned long c)
@@ -674,7 +662,7 @@ static inline void writesl(PCI_IO_ADDR a, const void *b, unsigned long c)
 
 static inline void memset_io(PCI_IO_ADDR a, int c, unsigned long n)
 {
-	__do_memset_io(a, c, n);
+	_memset_io(a, c, n);
 }
 #define memset_io memset_io
 
@@ -686,7 +674,7 @@ static inline void memcpy_fromio(void *d, const PCI_IO_ADDR s, unsigned long n)
 
 static inline void memcpy_toio(PCI_IO_ADDR d, const void *s, unsigned long n)
 {
-	__do_memcpy_toio(d, s, n);
+	_memcpy_toio(d, s, n);
 }
 #define memcpy_toio memcpy_toio
 
@@ -703,12 +691,12 @@ static inline u64 readq_be(const PCI_IO_ADDR addr)
 
 static inline void writeq(u64 val, PCI_IO_ADDR addr)
 {
-	__do_writeq(val, addr);
+	out_le64(addr, val);
 }
 
 static inline void writeq_be(u64 val, PCI_IO_ADDR addr)
 {
-	__do_writeq_be(val, addr);
+	out_be64(addr, val);
 }
 #endif /* __powerpc64__ */
 
-- 
2.47.1


