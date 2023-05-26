Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD50D712CA5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 20:41:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSYfZ52dpz3fWN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 04:41:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YQf7A8Rg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YQf7A8Rg;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSYbv5VZHz3f5h
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 04:39:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 05E6365280;
	Fri, 26 May 2023 18:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25035C433EF;
	Fri, 26 May 2023 18:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685126345;
	bh=lBXxHMrz4P2xdMuly+qm20bqhIoeZDB8ZhYiN8IP1P4=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=YQf7A8RgfRo0Dc9+HzdwKAPcP0GbCUz2a8fccZnPx7U8QsA39thwYL+NV7pwZR7ZA
	 0lVwwhM+xYv8vQYQo+rFjy6+ZYLdnIhTz7WY8HPKatUJwb/HEXgMaJu23+UzqtmgCG
	 wjc2fnbmWJEbygzqlT+asdJ3z1u4BpWfQUgz2Sx4=
Subject: Patch "Subject:[For 4.19/4.14] spi: spi-fsl-spi: automatically adapt bits-per-word in cpu mode" has been added to the 4.14-stable tree
To: broonie@kernel.org,christophe.leroy@csgroup.eu,gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org,rasmus.villemoes@prevas.dk
From: <gregkh@linuxfoundation.org>
Date: Fri, 26 May 2023 19:38:50 +0100
In-Reply-To: <674d9af640acf4aa04abd642cc81de926d3271ed.1684158520.git.christophe.leroy@csgroup.eu>
Message-ID: <2023052650-rubber-sleeve-ea6b@gregkh>
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

    Subject:[For 4.19/4.14] spi: spi-fsl-spi: automatically adapt bits-per-word in cpu mode

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     spi-spi-fsl-spi-automatically-adapt-bits-per-word-in-cpu-mode.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From christophe.leroy@csgroup.eu Mon May 15 15:08:06 2023
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Mon, 15 May 2023 16:07:13 +0200
Subject:[For 4.19/4.14] spi: spi-fsl-spi: automatically adapt bits-per-word in cpu mode
To: gregkh@linuxfoundation.org, stable@vger.kernel.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Mark Brown <broonie@kernel.org>
Message-ID: <674d9af640acf4aa04abd642cc81de926d3271ed.1684158520.git.christophe.leroy@csgroup.eu>

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

(cherry picked from upstream af0e6242909c3c4297392ca3e94eff1b4db71a97)

Taking one interrupt for every byte is rather slow. Since the
controller is perfectly capable of transmitting 32 bits at a time,
change t->bits_per-word to 32 when the length is divisible by 4 and
large enough that the reduced number of interrupts easily compensates
for the one or two extra fsl_spi_setup_transfer() calls this causes.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/spi/spi-fsl-spi.c |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -357,12 +357,28 @@ static int fsl_spi_bufs(struct spi_devic
 static int fsl_spi_do_one_msg(struct spi_master *master,
 			      struct spi_message *m)
 {
+	struct mpc8xxx_spi *mpc8xxx_spi = spi_master_get_devdata(master);
 	struct spi_device *spi = m->spi;
 	struct spi_transfer *t, *first;
 	unsigned int cs_change;
 	const int nsecs = 50;
 	int status;
 
+	/*
+	 * In CPU mode, optimize large byte transfers to use larger
+	 * bits_per_word values to reduce number of interrupts taken.
+	 */
+	if (!(mpc8xxx_spi->flags & SPI_CPM_MODE)) {
+		list_for_each_entry(t, &m->transfers, transfer_list) {
+			if (t->len < 256 || t->bits_per_word != 8)
+				continue;
+			if ((t->len & 3) == 0)
+				t->bits_per_word = 32;
+			else if ((t->len & 1) == 0)
+				t->bits_per_word = 16;
+		}
+	}
+
 	/* Don't allow changes if CS is active */
 	first = list_first_entry(&m->transfers, struct spi_transfer,
 			transfer_list);


Patches currently in stable-queue which might be from christophe.leroy@csgroup.eu are

queue-4.14/spi-fsl-cpm-use-16-bit-mode-for-large-transfers-with-even-size.patch
queue-4.14/spi-fsl-spi-re-organise-transfer-bits_per_word-adaptation.patch
queue-4.14/spi-spi-fsl-spi-automatically-adapt-bits-per-word-in-cpu-mode.patch
