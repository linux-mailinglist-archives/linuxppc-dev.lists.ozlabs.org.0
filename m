Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8D6314E92
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 13:02:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZhMR5HLlzDrc1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 23:01:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZfFG1S3MzDshY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 21:26:24 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZfF85lnFz9tx3V;
 Tue,  9 Feb 2021 11:26:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id srx25kv8u0IC; Tue,  9 Feb 2021 11:26:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZfF850Jrz9tx2x;
 Tue,  9 Feb 2021 11:26:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A50188B7D6;
 Tue,  9 Feb 2021 11:26:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8p7HUzzF1Kv1; Tue,  9 Feb 2021 11:26:21 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 57B668B7D8;
 Tue,  9 Feb 2021 11:26:21 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1AD0E6733E; Tue,  9 Feb 2021 10:26:21 +0000 (UTC)
Message-Id: <99bf008e2970de7f8ed3225cda69a6d06ae1a644.1612866360.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/3] spi: mpc52xx: Avoid using get_tbl()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 broonie@kernel.org
Date: Tue,  9 Feb 2021 10:26:21 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

get_tbl() is confusing as it returns the content TBL register
on PPC32 but the concatenation of TBL and TBU on PPC64.

Use mftb() instead.

This will allow the removal of get_tbl() in a following patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/spi/spi-mpc52xx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-mpc52xx.c b/drivers/spi/spi-mpc52xx.c
index ef2f24420460..e6a30f232370 100644
--- a/drivers/spi/spi-mpc52xx.c
+++ b/drivers/spi/spi-mpc52xx.c
@@ -120,7 +120,7 @@ static void mpc52xx_spi_start_transfer(struct mpc52xx_spi *ms)
 	ms->cs_change = ms->transfer->cs_change;
 
 	/* Write out the first byte */
-	ms->wcol_tx_timestamp = get_tbl();
+	ms->wcol_tx_timestamp = mftb();
 	if (ms->tx_buf)
 		out_8(ms->regs + SPI_DATA, *ms->tx_buf++);
 	else
@@ -221,8 +221,8 @@ static int mpc52xx_spi_fsmstate_transfer(int irq, struct mpc52xx_spi *ms,
 		 * but it can also be worked around simply by retrying the
 		 * transfer which is what we do here. */
 		ms->wcol_count++;
-		ms->wcol_ticks += get_tbl() - ms->wcol_tx_timestamp;
-		ms->wcol_tx_timestamp = get_tbl();
+		ms->wcol_ticks += mftb() - ms->wcol_tx_timestamp;
+		ms->wcol_tx_timestamp = mftb();
 		data = 0;
 		if (ms->tx_buf)
 			data = *(ms->tx_buf - 1);
@@ -247,14 +247,14 @@ static int mpc52xx_spi_fsmstate_transfer(int irq, struct mpc52xx_spi *ms,
 	/* Is the transfer complete? */
 	ms->len--;
 	if (ms->len == 0) {
-		ms->timestamp = get_tbl();
+		ms->timestamp = mftb();
 		ms->timestamp += ms->transfer->delay_usecs * tb_ticks_per_usec;
 		ms->state = mpc52xx_spi_fsmstate_wait;
 		return FSM_CONTINUE;
 	}
 
 	/* Write out the next byte */
-	ms->wcol_tx_timestamp = get_tbl();
+	ms->wcol_tx_timestamp = mftb();
 	if (ms->tx_buf)
 		out_8(ms->regs + SPI_DATA, *ms->tx_buf++);
 	else
@@ -276,7 +276,7 @@ mpc52xx_spi_fsmstate_wait(int irq, struct mpc52xx_spi *ms, u8 status, u8 data)
 		dev_err(&ms->master->dev, "spurious irq, status=0x%.2x\n",
 			status);
 
-	if (((int)get_tbl()) - ms->timestamp < 0)
+	if (((int)mftb()) - ms->timestamp < 0)
 		return FSM_POLL;
 
 	ms->message->actual_length += ms->transfer->len;
-- 
2.25.0

