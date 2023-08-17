Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E1C77FBBA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 18:15:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRVTn689Xz3cZP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 02:15:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=195.130.132.48; helo=cantor.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRVRh68whz2yhP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 02:13:35 +1000 (AEST)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4RRVK84Hlfz4x3WW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 18:07:56 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d85a:258d:2c59:b44])
	by laurent.telenet-ops.be with bizsmtp
	id ag7i2A0054QHFyo01g7i1F; Thu, 17 Aug 2023 18:07:55 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qWfX4-000uIv-EU;
	Thu, 17 Aug 2023 18:07:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qWfXB-007YEt-Th;
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
Subject: [PATCH 5/9] asm-generic: Remove ide_iops.h
Date: Thu, 17 Aug 2023 18:07:36 +0200
Message-Id: <54ed1ce4b29346803bd732aac560a74896d1ecfe.1692288018.git.geert@linux-m68k.org>
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

The last user of ide_iops.h was removed in commit b7fb14d3ac63117e
("ide: remove the legacy ide driver") in v5.14.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 include/asm-generic/ide_iops.h | 39 ----------------------------------
 1 file changed, 39 deletions(-)
 delete mode 100644 include/asm-generic/ide_iops.h

diff --git a/include/asm-generic/ide_iops.h b/include/asm-generic/ide_iops.h
deleted file mode 100644
index 81dfa3ee5e0697b7..0000000000000000
--- a/include/asm-generic/ide_iops.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
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
-		*(u16 *)addr = readw(port);
-		addr += 2;
-	}
-}
-
-static __inline__ void __ide_mm_insl(void __iomem *port, void *addr, u32 count)
-{
-	while (count--) {
-		*(u32 *)addr = readl(port);
-		addr += 4;
-	}
-}
-
-static __inline__ void __ide_mm_outsw(void __iomem *port, void *addr, u32 count)
-{
-	while (count--) {
-		writew(*(u16 *)addr, port);
-		addr += 2;
-	}
-}
-
-static __inline__ void __ide_mm_outsl(void __iomem * port, void *addr, u32 count)
-{
-	while (count--) {
-		writel(*(u32 *)addr, port);
-		addr += 4;
-	}
-}
-- 
2.34.1

