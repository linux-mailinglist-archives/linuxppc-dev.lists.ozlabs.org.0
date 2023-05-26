Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7671712C98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 20:39:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSYcl31Lkz3fHJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 04:39:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=L1uXYbFv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=L1uXYbFv;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSYbr28Lpz3f5h
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 04:39:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9169765257;
	Fri, 26 May 2023 18:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B177EC433D2;
	Fri, 26 May 2023 18:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685126340;
	bh=f7gk4OfTPBkJtxCI0RgeokjCdCA8fQ8wGWDH63xVJl8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=L1uXYbFvu2ecEPN7FaoGztlZn+RiRy6E/m42QjaKD/WHglze+4WNZOVOSD+GQ0TJJ
	 OxmYqNCDSjSA4+LNqe7LSYvuO9008nn+i2+cqnsr5hcJrC6OOWTJdmIb2LVpZTdBHF
	 ELeuc/2OBqH8xLqdA3NCaXh2dBEKmyeZrVWD3vhQ=
Subject: Patch "Subject:[For 4.19/4.14] spi: fsl-cpm: Use 16 bit mode for large transfers with even size" has been added to the 4.14-stable tree
To: broonie@kernel.org,christophe.leroy@csgroup.eu,gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org
From: <gregkh@linuxfoundation.org>
Date: Fri, 26 May 2023 19:38:49 +0100
In-Reply-To: <9363da33f54e9862b4b59c0ed97924ca7265f7a4.1684158520.git.christophe.leroy@csgroup.eu>
Message-ID: <2023052649-senator-nappy-6caa@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    Subject:[For 4.19/4.14] spi: fsl-cpm: Use 16 bit mode for large transfers with even size

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     spi-fsl-cpm-use-16-bit-mode-for-large-transfers-with-even-size.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From christophe.leroy@csgroup.eu Mon May 15 15:07:58 2023
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Mon, 15 May 2023 16:07:15 +0200
Subject:[For 4.19/4.14] spi: fsl-cpm: Use 16 bit mode for large transfers with even size
To: gregkh@linuxfoundation.org, stable@vger.kernel.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>
Message-ID: <9363da33f54e9862b4b59c0ed97924ca7265f7a4.1684158520.git.christophe.leroy@csgroup.eu>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/spi/spi-fsl-cpm.c |   23 +++++++++++++++++++++++
 drivers/spi/spi-fsl-spi.c |    3 +++
 2 files changed, 26 insertions(+)

--- a/drivers/spi/spi-fsl-cpm.c
+++ b/drivers/spi/spi-fsl-cpm.c
@@ -25,6 +25,7 @@
 #include <linux/spi/spi.h>
 #include <linux/types.h>
 #include <linux/platform_device.h>
+#include <linux/byteorder/generic.h>
 
 #include "spi-fsl-cpm.h"
 #include "spi-fsl-lib.h"
@@ -124,6 +125,21 @@ int fsl_spi_cpm_bufs(struct mpc8xxx_spi
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
@@ -177,6 +193,13 @@ void fsl_spi_cpm_bufs_complete(struct mp
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
 
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -366,6 +366,9 @@ static int fsl_spi_do_one_msg(struct spi
 				return -EINVAL;
 			if (t->bits_per_word == 16 || t->bits_per_word == 32)
 				t->bits_per_word = 8; /* pretend its 8 bits */
+			if (t->bits_per_word == 8 && t->len >= 256 &&
+			    (mpc8xxx_spi->flags & SPI_CPM1))
+				t->bits_per_word = 16;
 		}
 	}
 


Patches currently in stable-queue which might be from christophe.leroy@csgroup.eu are

queue-4.14/spi-fsl-cpm-use-16-bit-mode-for-large-transfers-with-even-size.patch
queue-4.14/spi-fsl-spi-re-organise-transfer-bits_per_word-adaptation.patch
queue-4.14/spi-spi-fsl-spi-automatically-adapt-bits-per-word-in-cpu-mode.patch
