Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E52BB482AC3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jan 2022 11:37:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JRb1d6Ksmz3c74
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jan 2022 21:37:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=wanadoo.fr
 (client-ip=80.12.242.129; helo=smtp.smtpout.orange.fr;
 envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JRb1C6YLBz2xMF
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jan 2022 21:37:33 +1100 (AEDT)
Received: from pop-os.home ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id 3y7fnH6e4FGqt3y7gntgp4; Sun, 02 Jan 2022 11:29:58 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 02 Jan 2022 11:29:58 +0100
X-ME-IP: 86.243.171.122
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] floppy: Remove usage of the deprecated "pci-dma-compat.h" API
Date: Sun,  2 Jan 2022 11:29:54 +0100
Message-Id: <9e24eedeab44cbb840598bb188561a48811de845.1641119338.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
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
Cc: kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In [1], Christoph Hellwig has proposed to remove the wrappers in
include/linux/pci-dma-compat.h.

Some reasons why this API should be removed have been given by Julia
Lawall in [2].

A coccinelle script has been used to perform the needed transformation
Only relevant parts are given below.

@@ @@
-    PCI_DMA_TODEVICE
+    DMA_TO_DEVICE

@@ @@
-    PCI_DMA_FROMDEVICE
+    DMA_FROM_DEVICE

@@
expression e1, e2, e3, e4;
@@
-    pci_map_single(e1, e2, e3, e4)
+    dma_map_single(&e1->dev, e2, e3, e4)

@@
expression e1, e2, e3, e4;
@@
-    pci_unmap_single(e1, e2, e3, e4)
+    dma_unmap_single(&e1->dev, e2, e3, e4)

[1]: https://lore.kernel.org/kernel-janitors/20200421081257.GA131897@infradead.org/
[2]: https://lore.kernel.org/kernel-janitors/alpine.DEB.2.22.394.2007120902170.2424@hadrien/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/powerpc/include/asm/floppy.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/floppy.h b/arch/powerpc/include/asm/floppy.h
index 7af9a68fd949..f8ce178b43b7 100644
--- a/arch/powerpc/include/asm/floppy.h
+++ b/arch/powerpc/include/asm/floppy.h
@@ -134,17 +134,19 @@ static int hard_dma_setup(char *addr, unsigned long size, int mode, int io)
 	int dir;
 
 	doing_vdma = 0;
-	dir = (mode == DMA_MODE_READ) ? PCI_DMA_FROMDEVICE : PCI_DMA_TODEVICE;
+	dir = (mode == DMA_MODE_READ) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
 
 	if (bus_addr 
 	    && (addr != prev_addr || size != prev_size || dir != prev_dir)) {
 		/* different from last time -- unmap prev */
-		pci_unmap_single(isa_bridge_pcidev, bus_addr, prev_size, prev_dir);
+		dma_unmap_single(&isa_bridge_pcidev->dev, bus_addr, prev_size,
+				 prev_dir);
 		bus_addr = 0;
 	}
 
 	if (!bus_addr)	/* need to map it */
-		bus_addr = pci_map_single(isa_bridge_pcidev, addr, size, dir);
+		bus_addr = dma_map_single(&isa_bridge_pcidev->dev, addr, size,
+					  dir);
 
 	/* remember this one as prev */
 	prev_addr = addr;
-- 
2.32.0

