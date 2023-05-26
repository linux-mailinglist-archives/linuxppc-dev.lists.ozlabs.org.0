Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 816EF712CA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 20:40:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSYdg2NTqz3fNj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 04:40:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NQe15RBa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NQe15RBa;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSYbt28Hpz3f5h
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 04:39:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 40E6B6528A;
	Fri, 26 May 2023 18:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61352C433EF;
	Fri, 26 May 2023 18:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685126342;
	bh=+T1jHrDl29Pt5DpgxSOf/LXKLaBOIi5xf1g/WqJwMrI=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=NQe15RBa2YYeL0V73PYceUub+I09pnc/KELY4V0EnArs/pxp63xBj6PrbWJXNB3Fc
	 jsvLvuEM6RPrm1houkRF8U2ZRJ0db0hEf6ttSkhNepwP2mvyPYkU5L0YXHtyFXKby1
	 WoFCQvq5Ej92vSM/OK5DARBIMrUu0OkYby67Fx10=
Subject: Patch "Subject:[For 4.19/4.14] spi: fsl-spi: Re-organise transfer bits_per_word adaptation" has been added to the 4.14-stable tree
To: broonie@kernel.org,christophe.leroy@csgroup.eu,gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org
From: <gregkh@linuxfoundation.org>
Date: Fri, 26 May 2023 19:38:49 +0100
In-Reply-To: <e105f49ce5da21b48dc0450f5fb3644571ee9c1a.1684158520.git.christophe.leroy@csgroup.eu>
Message-ID: <2023052649-onto-unsure-2f5a@gregkh>
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

    Subject:[For 4.19/4.14] spi: fsl-spi: Re-organise transfer bits_per_word adaptation

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     spi-fsl-spi-re-organise-transfer-bits_per_word-adaptation.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From christophe.leroy@csgroup.eu Mon May 15 15:08:01 2023
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Mon, 15 May 2023 16:07:14 +0200
Subject:[For 4.19/4.14] spi: fsl-spi: Re-organise transfer bits_per_word adaptation
To: gregkh@linuxfoundation.org, stable@vger.kernel.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>
Message-ID: <e105f49ce5da21b48dc0450f5fb3644571ee9c1a.1684158520.git.christophe.leroy@csgroup.eu>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

(backported from upstream 8a5299a1278eadf1e08a598a5345c376206f171e)

For different reasons, fsl-spi driver performs bits_per_word
modifications for different reasons:
- On CPU mode, to minimise amount of interrupts
- On CPM/QE mode to work around controller byte order

For CPU mode that's done in fsl_spi_prepare_message() while
for CPM mode that's done in fsl_spi_setup_transfer().

Reunify all of it in fsl_spi_prepare_message(), and catch
impossible cases early through master's bits_per_word_mask
instead of returning EINVAL later.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Link: https://lore.kernel.org/r/0ce96fe96e8b07cba0613e4097cfd94d09b8919a.1680371809.git.christophe.leroy@csgroup.eu
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/spi/spi-fsl-spi.c |   50 +++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -201,26 +201,6 @@ static int mspi_apply_cpu_mode_quirks(st
 	return bits_per_word;
 }
 
-static int mspi_apply_qe_mode_quirks(struct spi_mpc8xxx_cs *cs,
-				struct spi_device *spi,
-				int bits_per_word)
-{
-	/* CPM/QE uses Little Endian for words > 8
-	 * so transform 16 and 32 bits words into 8 bits
-	 * Unfortnatly that doesn't work for LSB so
-	 * reject these for now */
-	/* Note: 32 bits word, LSB works iff
-	 * tfcr/rfcr is set to CPMFCR_GBL */
-	if (spi->mode & SPI_LSB_FIRST &&
-	    bits_per_word > 8)
-		return -EINVAL;
-	if (bits_per_word <= 8)
-		return bits_per_word;
-	if (bits_per_word == 16 || bits_per_word == 32)
-		return 8; /* pretend its 8 bits */
-	return -EINVAL;
-}
-
 static int fsl_spi_setup_transfer(struct spi_device *spi,
 					struct spi_transfer *t)
 {
@@ -248,9 +228,6 @@ static int fsl_spi_setup_transfer(struct
 		bits_per_word = mspi_apply_cpu_mode_quirks(cs, spi,
 							   mpc8xxx_spi,
 							   bits_per_word);
-	else
-		bits_per_word = mspi_apply_qe_mode_quirks(cs, spi,
-							  bits_per_word);
 
 	if (bits_per_word < 0)
 		return bits_per_word;
@@ -368,14 +345,27 @@ static int fsl_spi_do_one_msg(struct spi
 	 * In CPU mode, optimize large byte transfers to use larger
 	 * bits_per_word values to reduce number of interrupts taken.
 	 */
-	if (!(mpc8xxx_spi->flags & SPI_CPM_MODE)) {
-		list_for_each_entry(t, &m->transfers, transfer_list) {
+	list_for_each_entry(t, &m->transfers, transfer_list) {
+		if (!(mpc8xxx_spi->flags & SPI_CPM_MODE)) {
 			if (t->len < 256 || t->bits_per_word != 8)
 				continue;
 			if ((t->len & 3) == 0)
 				t->bits_per_word = 32;
 			else if ((t->len & 1) == 0)
 				t->bits_per_word = 16;
+		} else {
+			/*
+			 * CPM/QE uses Little Endian for words > 8
+			 * so transform 16 and 32 bits words into 8 bits
+			 * Unfortnatly that doesn't work for LSB so
+			 * reject these for now
+			 * Note: 32 bits word, LSB works iff
+			 * tfcr/rfcr is set to CPMFCR_GBL
+			 */
+			if (m->spi->mode & SPI_LSB_FIRST && t->bits_per_word > 8)
+				return -EINVAL;
+			if (t->bits_per_word == 16 || t->bits_per_word == 32)
+				t->bits_per_word = 8; /* pretend its 8 bits */
 		}
 	}
 
@@ -658,8 +648,14 @@ static struct spi_master * fsl_spi_probe
 	if (mpc8xxx_spi->type == TYPE_GRLIB)
 		fsl_spi_grlib_probe(dev);
 
-	master->bits_per_word_mask =
-		(SPI_BPW_RANGE_MASK(4, 16) | SPI_BPW_MASK(32)) &
+	if (mpc8xxx_spi->flags & SPI_CPM_MODE)
+		master->bits_per_word_mask =
+			(SPI_BPW_RANGE_MASK(4, 8) | SPI_BPW_MASK(16) | SPI_BPW_MASK(32));
+	else
+		master->bits_per_word_mask =
+			(SPI_BPW_RANGE_MASK(4, 16) | SPI_BPW_MASK(32));
+
+	master->bits_per_word_mask &=
 		SPI_BPW_RANGE_MASK(1, mpc8xxx_spi->max_bits_per_word);
 
 	if (mpc8xxx_spi->flags & SPI_QE_CPU_MODE)


Patches currently in stable-queue which might be from christophe.leroy@csgroup.eu are

queue-4.14/spi-fsl-cpm-use-16-bit-mode-for-large-transfers-with-even-size.patch
queue-4.14/spi-fsl-spi-re-organise-transfer-bits_per_word-adaptation.patch
queue-4.14/spi-spi-fsl-spi-automatically-adapt-bits-per-word-in-cpu-mode.patch
