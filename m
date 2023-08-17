Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D67C777FBDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 18:17:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRVXF5kjcz3dWY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 02:17:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=2a02:1800:110:4::f00:10; helo=riemann.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 519 seconds by postgrey-1.37 at boromir; Fri, 18 Aug 2023 02:16:42 AEST
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [IPv6:2a02:1800:110:4::f00:10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRVWG0b0Lz2yTx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 02:16:41 +1000 (AEST)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4RRVK64t24z4x0np
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 18:07:54 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d85a:258d:2c59:b44])
	by albert.telenet-ops.be with bizsmtp
	id ag7i2A0024QHFyo06g7iZt; Thu, 17 Aug 2023 18:07:54 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qWfX4-000uIi-Bd;
	Thu, 17 Aug 2023 18:07:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qWfXB-007YEh-Qn;
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
Subject: [PATCH 2/9] parisc: Remove <asm/ide.h>
Date: Thu, 17 Aug 2023 18:07:33 +0200
Message-Id: <5ea78d9c54cf94c6074fde6f277bb7a08bfe8d08.1692288018.git.geert@linux-m68k.org>
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
 arch/parisc/include/asm/ide.h | 54 -----------------------------------
 1 file changed, 54 deletions(-)
 delete mode 100644 arch/parisc/include/asm/ide.h

diff --git a/arch/parisc/include/asm/ide.h b/arch/parisc/include/asm/ide.h
deleted file mode 100644
index 7aa75b93a1b6c76d..0000000000000000
--- a/arch/parisc/include/asm/ide.h
+++ /dev/null
@@ -1,54 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  linux/include/asm-parisc/ide.h
- *
- *  Copyright (C) 1994-1996  Linus Torvalds & authors
- */
-
-/*
- *  This file contains the PARISC architecture specific IDE code.
- */
-
-#ifndef __ASM_PARISC_IDE_H
-#define __ASM_PARISC_IDE_H
-
-/* Generic I/O and MEMIO string operations.  */
-
-#define __ide_insw	insw
-#define __ide_insl	insl
-#define __ide_outsw	outsw
-#define __ide_outsl	outsl
-
-static __inline__ void __ide_mm_insw(void __iomem *port, void *addr, u32 count)
-{
-	while (count--) {
-		*(u16 *)addr = __raw_readw(port);
-		addr += 2;
-	}
-}
-
-static __inline__ void __ide_mm_insl(void __iomem *port, void *addr, u32 count)
-{
-	while (count--) {
-		*(u32 *)addr = __raw_readl(port);
-		addr += 4;
-	}
-}
-
-static __inline__ void __ide_mm_outsw(void __iomem *port, void *addr, u32 count)
-{
-	while (count--) {
-		__raw_writew(*(u16 *)addr, port);
-		addr += 2;
-	}
-}
-
-static __inline__ void __ide_mm_outsl(void __iomem *port, void *addr, u32 count)
-{
-	while (count--) {
-		__raw_writel(*(u32 *)addr, port);
-		addr += 4;
-	}
-}
-
-#endif /* __ASM_PARISC_IDE_H */
-- 
2.34.1

