Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A5F702F46
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 16:09:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKh7H1QfGz3fdL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 00:08:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKh6P4cMDz3f6Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 00:08:13 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4QKh661Dlvz9sfQ;
	Mon, 15 May 2023 16:07:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w4uLJCqqlfgU; Mon, 15 May 2023 16:07:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4QKh653GcGz9sfH;
	Mon, 15 May 2023 16:07:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 612298B770;
	Mon, 15 May 2023 16:07:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XkCE40cnUtUC; Mon, 15 May 2023 16:07:57 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.36])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C1658B763;
	Mon, 15 May 2023 16:07:57 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 34FE7P2x583513
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 16:07:25 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 34FE7PPr583512;
	Mon, 15 May 2023 16:07:25 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: gregkh@linuxfoundation.org, stable@vger.kernel.org
Subject: [PATCH 2/2][For 5.15/5.10/5.4] spi: fsl-cpm: Use 16 bit mode for large transfers with even size
Date: Mon, 15 May 2023 16:07:17 +0200
Message-Id: <3a1b8774ad7004acb594fbf220f98488dbaa2896.1684156552.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1e4bfb4850ba849c316f48a0ab0d7123da0e2f54.1684156552.git.christophe.leroy@csgroup.eu>
References: <1e4bfb4850ba849c316f48a0ab0d7123da0e2f54.1684156552.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684159635; l=3126; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=rWNKzWkmM4gdwZv1WlKPnv51S6gxaEarWczSGvDbNzU=; b=oSiEq83dOBUPrvqbyLZ/irXtj4gfJMUpwNyaspQMKeCsGOEpp4RJ69yRyVpJasLnuv0zqY1L+ WRp2fzaSzmuCaxKZGPG11CgXaCdmBLzPVLcokvicW5OtVYvRVTtLEgr
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(cherry picked from upstream fc96ec826bced75cc6b9c07a4ac44bbf651337ab)

On CPM, the RISC core is a lot more efficiant when doing transfers
in 16-bits chunks than in 8-bits chunks, but unfortunately the
words need to be byte swapped as seen in a previous commit.

So, for large tranfers with an even size, allocate a temporary tx
buffer and byte-swap data before and after transfer.

This change allows setting higher speed for transfer. For instance
on an MPC 8xx (CPM1 comms RISC processor), the documentation tells
that transfer in byte mode at 1 kbit/s uses 0.200% of CPM load
at 25 MHz while a word transfer at the same speed uses 0.032%
of CPM load. This means the speed can be 6 times higher in
word mode for the same CPM load.

For the time being, only do it on CPM1 as there must be a
trade-off between the CPM load reduction and the CPU load required
to byte swap the data.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Link: https://lore.kernel.org/r/f2e981f20f92dd28983c3949702a09248c23845c.1680371809.git.christophe.leroy@csgroup.eu
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-fsl-cpm.c | 23 +++++++++++++++++++++++
 drivers/spi/spi-fsl-spi.c |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/drivers/spi/spi-fsl-cpm.c b/drivers/spi/spi-fsl-cpm.c
index ee905880769e..7832ce330b29 100644
--- a/drivers/spi/spi-fsl-cpm.c
+++ b/drivers/spi/spi-fsl-cpm.c
@@ -21,6 +21,7 @@
 #include <linux/spi/spi.h>
 #include <linux/types.h>
 #include <linux/platform_device.h>
+#include <linux/byteorder/generic.h>
 
 #include "spi-fsl-cpm.h"
 #include "spi-fsl-lib.h"
@@ -120,6 +121,21 @@ int fsl_spi_cpm_bufs(struct mpc8xxx_spi *mspi,
 		mspi->rx_dma = mspi->dma_dummy_rx;
 		mspi->map_rx_dma = 0;
 	}
+	if (t->bits_per_word == 16 && t->tx_buf) {
+		const u16 *src = t->tx_buf;
+		u16 *dst;
+		int i;
+
+		dst = kmalloc(t->len, GFP_KERNEL);
+		if (!dst)
+			return -ENOMEM;
+
+		for (i = 0; i < t->len >> 1; i++)
+			dst[i] = cpu_to_le16p(src + i);
+
+		mspi->tx = dst;
+		mspi->map_tx_dma = 1;
+	}
 
 	if (mspi->map_tx_dma) {
 		void *nonconst_tx = (void *)mspi->tx; /* shut up gcc */
@@ -173,6 +189,13 @@ void fsl_spi_cpm_bufs_complete(struct mpc8xxx_spi *mspi)
 	if (mspi->map_rx_dma)
 		dma_unmap_single(dev, mspi->rx_dma, t->len, DMA_FROM_DEVICE);
 	mspi->xfer_in_progress = NULL;
+
+	if (t->bits_per_word == 16 && t->rx_buf) {
+		int i;
+
+		for (i = 0; i < t->len; i += 2)
+			le16_to_cpus(t->rx_buf + i);
+	}
 }
 EXPORT_SYMBOL_GPL(fsl_spi_cpm_bufs_complete);
 
diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index f1d4aa310233..63302e21e574 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -368,6 +368,9 @@ static int fsl_spi_do_one_msg(struct spi_master *master,
 				return -EINVAL;
 			if (t->bits_per_word == 16 || t->bits_per_word == 32)
 				t->bits_per_word = 8; /* pretend its 8 bits */
+			if (t->bits_per_word == 8 && t->len >= 256 &&
+			    (mpc8xxx_spi->flags & SPI_CPM1))
+				t->bits_per_word = 16;
 		}
 	}
 
-- 
2.40.1

