Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1223177FBD8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 18:17:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRVWk6YzQz3dS0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 02:17:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=2a02:1800:120:4::f00:11; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [IPv6:2a02:1800:120:4::f00:11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRVWF63Psz2xqq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 02:16:41 +1000 (AEST)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4RRVK72mRCz4wxRJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 18:07:55 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d85a:258d:2c59:b44])
	by andre.telenet-ops.be with bizsmtp
	id ag7i2A0054QHFyo01g7iFH; Thu, 17 Aug 2023 18:07:54 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qWfX4-000uIp-DZ;
	Thu, 17 Aug 2023 18:07:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qWfXB-007YEp-Se;
	Thu, 17 Aug 2023 18:07:41 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Russell King <linux@armlinux.org.uk>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S . Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Damien Le Moal <dlemoal@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 4/9] sparc: Remove <asm/ide.h>
Date: Thu, 17 Aug 2023 18:07:35 +0200
Message-Id: <d26247f29e65b017c06e993f8aedece13a100369.1692288018.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692288018.git.geert@linux-m68k.org>
References: <cover.1692288018.git.geert@linux-m68k.org>
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
Cc: linux-arch@vger.kernel.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As of commit b7fb14d3ac63117e ("ide: remove the legacy ide driver") in
v5.14, there are no more generic users of <asm/ide.h>.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/sparc/include/asm/ide.h | 97 ------------------------------------
 1 file changed, 97 deletions(-)
 delete mode 100644 arch/sparc/include/asm/ide.h

diff --git a/arch/sparc/include/asm/ide.h b/arch/sparc/include/asm/ide.h
deleted file mode 100644
index 904cc6cbc1550cd8..0000000000000000
--- a/arch/sparc/include/asm/ide.h
+++ /dev/null
@@ -1,97 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* ide.h: SPARC PCI specific IDE glue.
- *
- * Copyright (C) 1997  David S. Miller (davem@davemloft.net)
- * Copyright (C) 1998  Eddie C. Dost   (ecd@skynet.be)
- * Adaptation from sparc64 version to sparc by Pete Zaitcev.
- */
-
-#ifndef _SPARC_IDE_H
-#define _SPARC_IDE_H
-
-#ifdef __KERNEL__
-
-#include <asm/io.h>
-#ifdef CONFIG_SPARC64
-#include <asm/spitfire.h>
-#include <asm/cacheflush.h>
-#include <asm/page.h>
-#else
-#include <linux/pgtable.h>
-#include <asm/psr.h>
-#endif
-
-#define __ide_insl(data_reg, buffer, wcount) \
-	__ide_insw(data_reg, buffer, (wcount)<<1)
-#define __ide_outsl(data_reg, buffer, wcount) \
-	__ide_outsw(data_reg, buffer, (wcount)<<1)
-
-/* On sparc, I/O ports and MMIO registers are accessed identically.  */
-#define __ide_mm_insw	__ide_insw
-#define __ide_mm_insl	__ide_insl
-#define __ide_mm_outsw	__ide_outsw
-#define __ide_mm_outsl	__ide_outsl
-
-static inline void __ide_insw(void __iomem *port, void *dst, u32 count)
-{
-#if defined(CONFIG_SPARC64) && defined(DCACHE_ALIASING_POSSIBLE)
-	unsigned long end = (unsigned long)dst + (count << 1);
-#endif
-	u16 *ps = dst;
-	u32 *pi;
-
-	if(((unsigned long)ps) & 0x2) {
-		*ps++ = __raw_readw(port);
-		count--;
-	}
-	pi = (u32 *)ps;
-	while(count >= 2) {
-		u32 w;
-
-		w  = __raw_readw(port) << 16;
-		w |= __raw_readw(port);
-		*pi++ = w;
-		count -= 2;
-	}
-	ps = (u16 *)pi;
-	if(count)
-		*ps++ = __raw_readw(port);
-
-#if defined(CONFIG_SPARC64) && defined(DCACHE_ALIASING_POSSIBLE)
-	__flush_dcache_range((unsigned long)dst, end);
-#endif
-}
-
-static inline void __ide_outsw(void __iomem *port, const void *src, u32 count)
-{
-#if defined(CONFIG_SPARC64) && defined(DCACHE_ALIASING_POSSIBLE)
-	unsigned long end = (unsigned long)src + (count << 1);
-#endif
-	const u16 *ps = src;
-	const u32 *pi;
-
-	if(((unsigned long)src) & 0x2) {
-		__raw_writew(*ps++, port);
-		count--;
-	}
-	pi = (const u32 *)ps;
-	while(count >= 2) {
-		u32 w;
-
-		w = *pi++;
-		__raw_writew((w >> 16), port);
-		__raw_writew(w, port);
-		count -= 2;
-	}
-	ps = (const u16 *)pi;
-	if(count)
-		__raw_writew(*ps, port);
-
-#if defined(CONFIG_SPARC64) && defined(DCACHE_ALIASING_POSSIBLE)
-	__flush_dcache_range((unsigned long)src, end);
-#endif
-}
-
-#endif /* __KERNEL__ */
-
-#endif /* _SPARC_IDE_H */
-- 
2.34.1

