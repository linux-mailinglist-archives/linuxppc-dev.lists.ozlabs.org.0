Return-Path: <linuxppc-dev+bounces-7093-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D04EA62B6F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 11:59:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFJCd2xb0z3cZM;
	Sat, 15 Mar 2025 21:59:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742036381;
	cv=none; b=i0MA0pHlq2+FdpBeM4h7XFOb+IVSHVJNhoI8g925X1ZBHEJPTq9geiNZoTXWMdrDD75ilpFURjRVcrTcrJ2cBnH3Oe0n0WpyhxMFt5QFwQq0MZ/bkD+4/e63R84ZmZ0sP7RfqIYfKOwvnIDzWAzXIv+EbOnIK4LZ90UwN7rqxEzCgt6dRr8EkmBsMLQL2ma9OBSk1V3sBJBIRbsiFTTWjvIXVtRtwhtdiGLKRyoqEe2VROs9T0o8F2yDy7Rdx2IPtjIzCTqDwu/Qyswq0oGorJ2IVbXzMcXve0hariihDozgEzqP/qkw8SK7uSgmt81NZ1XZz1+kjLWVTqgUqiIB+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742036381; c=relaxed/relaxed;
	bh=vKGKTxIS6jX30iJcNn5jqAGJ/NZg6FxhP37IyCLqd1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MpsksQJzBaIfpnB+wZOfyK7NCQE3M4nYRBTFoLsx25Kip7r4iGWxu2YyeuqJrE5qou7xW7PYvHf5hrRc6NMzKPFmhWNMS0/6X8nE6yjoh6APxQLUiLmpdghGHB2DeiQMZAF5XwObtTHyu/rBj3lLuNW2qoJdxY9DdktwMdaYT9LQzH6TFV0L8/P2eyEdodKFOX2mxQQ3cTbcVs7BgC1Y+99s2jMhYjq3xE+5+vcdnpGTGJIfof3hmC403LUcCd5vosb/3GJHOqBSAcL6fnmprCVKPdrEjII7dndCuogeMN+UMa11vapTIGgEiZ2530W5+ii2wjYcRb8haj4qJAy5Gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=diX0xfqF; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=diX0xfqF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFJCc4Dsjz30Vw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 21:59:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 420A85C41E7;
	Sat, 15 Mar 2025 10:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19449C4CEE9;
	Sat, 15 Mar 2025 10:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742036377;
	bh=A5i5/N269tmlctuJx50AMW6UOHChrJm88b2b4zSeyoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=diX0xfqF9v6ZGZRle7yS797sxjadb3E94MlDDS4u2Ag47HK7jKFgrf0+lFKqJyd4Z
	 9zI1O0TL4ydGgnrIeulnAzEMTAwCyHN4aaYIjOJk4KG9iQ9AUEgXcaqj1ZPma2QWCj
	 7R4G/nVWt1vuxaxJKUIQRdYxGdOY+kQSZryHNxz+vVP+V61ore9HhuE0ButGW2mWzR
	 bZv7UuwIJNTuGwzwOmv42rKJQ/X2fJFY4DLlYwRmOt8Uuk/ln2ZGVjY/dlC/AIRZQf
	 xIBQPHVRG8UBgapcN+S6EKST97e/EqLy5aOB9pu3G9miFJF68PdnfRDwdShSTHnAR1
	 0xk0SMnqOCSoA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Julian Vetter <julian@outer-limits.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 4/6] powerpc: asm/io.h: remove split ioread64/iowrite64 helpers
Date: Sat, 15 Mar 2025 11:59:05 +0100
Message-Id: <20250315105907.1275012-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250315105907.1275012-1-arnd@kernel.org>
References: <20250315105907.1275012-1-arnd@kernel.org>
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
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

In previous kernels, there were conflicting definitions for what
ioread64_lo_hi() and similar functions were supposed to do on
architectures with native 64-bit MMIO. Based on the actual usage in
drivers, they are in fact expected to be a pair of 32-bit accesses on
all architectures, which makes the powerpc64 definition wrong.

Remove it and use the generic implementation instead.

Drivers that want to have split lo/hi or hi/lo accesses on 32-bit
architectures but can use 64-bit accesses where supported should instead
use ioread64()/iowrite64() after including the corresponding header file.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/include/asm/io.h | 48 -----------------------------------
 1 file changed, 48 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index fd92ac450169..d36c4ccaca08 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -738,35 +738,11 @@ static inline unsigned int ioread32be(const void __iomem *addr)
 #define ioread32be ioread32be
 
 #ifdef __powerpc64__
-static inline u64 ioread64_lo_hi(const void __iomem *addr)
-{
-	return readq(addr);
-}
-#define ioread64_lo_hi ioread64_lo_hi
-
-static inline u64 ioread64_hi_lo(const void __iomem *addr)
-{
-	return readq(addr);
-}
-#define ioread64_hi_lo ioread64_hi_lo
-
 static inline u64 ioread64be(const void __iomem *addr)
 {
 	return readq_be(addr);
 }
 #define ioread64be ioread64be
-
-static inline u64 ioread64be_lo_hi(const void __iomem *addr)
-{
-	return readq_be(addr);
-}
-#define ioread64be_lo_hi ioread64be_lo_hi
-
-static inline u64 ioread64be_hi_lo(const void __iomem *addr)
-{
-	return readq_be(addr);
-}
-#define ioread64be_hi_lo ioread64be_hi_lo
 #endif /* __powerpc64__ */
 
 static inline void iowrite16be(u16 val, void __iomem *addr)
@@ -782,35 +758,11 @@ static inline void iowrite32be(u32 val, void __iomem *addr)
 #define iowrite32be iowrite32be
 
 #ifdef __powerpc64__
-static inline void iowrite64_lo_hi(u64 val, void __iomem *addr)
-{
-	writeq(val, addr);
-}
-#define iowrite64_lo_hi iowrite64_lo_hi
-
-static inline void iowrite64_hi_lo(u64 val, void __iomem *addr)
-{
-	writeq(val, addr);
-}
-#define iowrite64_hi_lo iowrite64_hi_lo
-
 static inline void iowrite64be(u64 val, void __iomem *addr)
 {
 	writeq_be(val, addr);
 }
 #define iowrite64be iowrite64be
-
-static inline void iowrite64be_lo_hi(u64 val, void __iomem *addr)
-{
-	writeq_be(val, addr);
-}
-#define iowrite64be_lo_hi iowrite64be_lo_hi
-
-static inline void iowrite64be_hi_lo(u64 val, void __iomem *addr)
-{
-	writeq_be(val, addr);
-}
-#define iowrite64be_hi_lo iowrite64be_hi_lo
 #endif /* __powerpc64__ */
 
 struct pci_dev;
-- 
2.39.5


