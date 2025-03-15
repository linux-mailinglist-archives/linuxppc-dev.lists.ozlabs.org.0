Return-Path: <linuxppc-dev+bounces-7090-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF4EA62B61
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Mar 2025 11:59:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZFJCL0lyDz3cZy;
	Sat, 15 Mar 2025 21:59:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742036366;
	cv=none; b=YWKyU2ko049AS1Wyi/o8huHrGtbNt64OhZJxJslfWbgmJk82zytBvoIqOPq5B32leh4GyshssoTNVib7IW/lL6zpMiiP2bMtFrwxXKXD+taUuatNixzku/Fp4zIaRC5gSuMmLRr6eNIK859ugwAU/t76NV9y2j4Z6RRDzNgI+nOmKpgw5BL2HtFul1SUD3NMUBEA5PnrMYPMWpiGvVJKJljg5MPY4+GVRhcJ6ZruuxvWAW1gFYh0KnY87VInj5FMXutnb50uB7bePCvHxVECJMHwzxOxaCYXpJMMi8TOp/TU5f5Gtp7SllQrmxzUprmOIMzRKHv7UckePh2AHBAs4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742036366; c=relaxed/relaxed;
	bh=/6wl4DoJxFRJyFT0KhAa3qDK8erWCTSky68FKiAHYTI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W89nKzZNXt8Bzh3a2tQjXAy3Ji4pwHoPLr9B85wTwAgcWxskZ5NjTHpHJ40Xk8Fqmf1topgVlcEZ5MCiR2oN5Ywy9tlcbc0knntefj7KBUQfKkiHlPVhZgrXdvcGS8njvdgA5s0eY2QpGiFWsJ1HP+Yul4ktENyyRmiJr4QTA6/xH7JMoD+LGRzXKYZQ41nRTrUM1jmQmurQewQfLi0aiAYx9sHbHK+vZSGpUSVq0qJEILMbxewtyj+zOwoZdgO15AbJanTV7c0CzWfVUa8Fg2siLmt41fZ1dXuy9AjUE9WaEQlFL23cLBoHxcUvTcq6Ixjp0JtzWeaQnyKC+gpKiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q4hScGqi; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q4hScGqi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZFJCK1YH1z30Vw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 21:59:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7F3BA489F1;
	Sat, 15 Mar 2025 10:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EACC4CEED;
	Sat, 15 Mar 2025 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742036362;
	bh=XXA0f10ge76JURf0KA9hKmmXZONM5AkZ6ZqHtAnEIXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q4hScGqiOZR2G7+YZ+XeHtUATN3Mm6OjWKl7pPELBMWcUOaE7swU5/tXQXCtYrXgJ
	 SPn6NIohA89E6WxLd4/4EO0PHl9zWKf0cYcPnPtM9euQEITLvQJY/l3Z6HMkfQ21kY
	 peVZIewC2M2sq5nTydsNySsFoSWFAEU9A8haa53ye/om1SVbnSU9xmf1KmvRvkOXHc
	 /lctotQq0rUR//VHF5ceYPM7gWypeEy7pueirktZ8wIvWBfKkm+w6ebJIp6scRyM7+
	 AX/jfDmcpNQctPeQnPz5wN6oLaWuHKAAe4zqT7h6pZKObc96WoBAOr4+Q2Xof5tAPo
	 AJ4N2+LBEjFYQ==
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
Subject: [PATCH 1/6] alpha: stop using asm-generic/iomap.h
Date: Sat, 15 Mar 2025 11:59:02 +0100
Message-Id: <20250315105907.1275012-2-arnd@kernel.org>
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
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

Alpha has custom definitions for ioread64()/iowrite64(), which now
don't exist in the lib/iomap.c variant. This is an endless source
of build failures, since alpha tries to share a couple of function
declarations.

Change alpha to have its own prototypes that match the definitions
in arch/alpha/kerne/io.c instead.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/include/asm/io.h | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index 65fe1e54c6da..fa3e4c246cda 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -10,10 +10,6 @@
 #include <asm/machvec.h>
 #include <asm/hwrpb.h>
 
-/* The generic header contains only prototypes.  Including it ensures that
-   the implementation we have here matches that interface.  */
-#include <asm-generic/iomap.h>
-
 /*
  * Virtual -> physical identity mapping starts at this offset
  */
@@ -276,13 +272,24 @@ extern void		__raw_writeq(u64 b, volatile void __iomem *addr);
 #define __raw_writel __raw_writel
 #define __raw_writeq __raw_writeq
 
-/*
- * Mapping from port numbers to __iomem space is pretty easy.
- */
+extern unsigned int ioread8(const void __iomem *);
+extern unsigned int ioread16(const void __iomem *);
+extern unsigned int ioread32(const void __iomem *);
+extern u64 ioread64(const void __iomem *);
+
+extern void iowrite8(u8, void __iomem *);
+extern void iowrite16(u16, void __iomem *);
+extern void iowrite32(u32, void __iomem *);
+extern void iowrite64(u64, void __iomem *);
+
+extern void ioread8_rep(const void __iomem *port, void *buf, unsigned long count);
+extern void ioread16_rep(const void __iomem *port, void *buf, unsigned long count);
+extern void ioread32_rep(const void __iomem *port, void *buf, unsigned long count);
+
+extern void iowrite8_rep(void __iomem *port, const void *buf, unsigned long count);
+extern void iowrite16_rep(void __iomem *port, const void *buf, unsigned long count);
+extern void iowrite32_rep(void __iomem *port, const void *buf, unsigned long count);
 
-/* These two have to be extern inline because of the extern prototype from
-   <asm-generic/iomap.h>.  It is not legal to mix "extern" and "static" for
-   the same declaration.  */
 extern inline void __iomem *ioport_map(unsigned long port, unsigned int size)
 {
 	return IO_CONCAT(__IO_PREFIX,ioportmap) (port);
@@ -629,10 +636,6 @@ extern void outsl (unsigned long port, const void *src, unsigned long count);
 #define RTC_PORT(x)	(0x70 + (x))
 #define RTC_ALWAYS_BCD	0
 
-/*
- * These get provided from <asm-generic/iomap.h> since alpha does not
- * select GENERIC_IOMAP.
- */
 #define ioread64 ioread64
 #define iowrite64 iowrite64
 #define ioread8_rep ioread8_rep
-- 
2.39.5


