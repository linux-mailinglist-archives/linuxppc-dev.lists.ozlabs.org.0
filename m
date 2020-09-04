Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 546EE25CED1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 02:36:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjJd75xvwzDrFC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 10:36:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz; envelope-from=chrisp@alliedtelesis.co.nz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=a6JRNAd7; 
 dkim-atps=neutral
X-Greylist: delayed 353 seconds by postgrey-1.36 at bilbo;
 Fri, 04 Sep 2020 10:34:15 AEST
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjJZv0XFvzDrCt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 10:34:14 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 677E8806B5;
 Fri,  4 Sep 2020 12:28:16 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1599179296;
 bh=PeKvL5ah8tfQA9K2g0Ur26fGWX24dwpS7/gFm9K63hM=;
 h=From:To:Cc:Subject:Date;
 b=a6JRNAd7aob5eI2XZzkOFb5ZZ02HGxer81YI0ujs2yAULCbfguWR7cQ+CrLJSrC+J
 VaVPBSsq46CnCoonOoIOCxz0vxfLGsIV49E5dVeBrVX9szyJ+6/dwUhc6FaBaCDlkE
 BeEANfSYURAT+Q+XP1BcK8aFzg0WbS50GX26IpVG8U0/u90OPDKBQ8p5rR0PtaFS3z
 z+yYp7LizkapHRnsXR3zqNx5YcRYE0qkqhlpD83pi9bs0w3rsu93n9aQ9d9nxPs7Lb
 SRjslvAP5I0BA/5Vrj0P0YBgOMPbTO9YvOxnoSxeiTC43ROu9pKIqsw16zMU9KWRXe
 a7h3Pf3onz31w==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5f518a1e0000>; Fri, 04 Sep 2020 12:28:14 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
 by smtp (Postfix) with ESMTP id EB27A13EEBA;
 Fri,  4 Sep 2020 12:28:15 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 2ABBB280060; Fri,  4 Sep 2020 12:28:16 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: broonie@kernel.org,
	npiggin@gmail.com,
	hkallweit1@gmail.com
Subject: [PATCH] spi: fsl-espi: Only process interrupts for expected events
Date: Fri,  4 Sep 2020 12:28:12 +1200
Message-Id: <20200904002812.7300-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
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
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-spi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The SPIE register contains counts for the TX FIFO so any time the irq
handler was invoked we would attempt to process the RX/TX fifos. Use the
SPIM value to mask the events so that we only process interrupts that
were expected.

This was a latent issue exposed by commit 3282a3da25bd ("powerpc/64:
Implement soft interrupt replay in C").

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: stable@vger.kernel.org
---

Notes:
    I've tested this on a T2080RDB and a custom board using the T2081 SoC=
. With
    this change I don't see any spurious instances of the "Transfer done =
but
    SPIE_DON isn't set!" or "Transfer done but rx/tx fifo's aren't empty!=
" messages
    and the updates to spi flash are successful.
   =20
    I think this should go into the stable trees that contain 3282a3da25b=
d but I
    haven't added a Fixes: tag because I think 3282a3da25bd exposed the i=
ssue as
    opposed to causing it.

 drivers/spi/spi-fsl-espi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-fsl-espi.c b/drivers/spi/spi-fsl-espi.c
index 7e7c92cafdbb..cb120b68c0e2 100644
--- a/drivers/spi/spi-fsl-espi.c
+++ b/drivers/spi/spi-fsl-espi.c
@@ -574,13 +574,14 @@ static void fsl_espi_cpu_irq(struct fsl_espi *espi,=
 u32 events)
 static irqreturn_t fsl_espi_irq(s32 irq, void *context_data)
 {
 	struct fsl_espi *espi =3D context_data;
-	u32 events;
+	u32 events, mask;
=20
 	spin_lock(&espi->lock);
=20
 	/* Get interrupt events(tx/rx) */
 	events =3D fsl_espi_read_reg(espi, ESPI_SPIE);
-	if (!events) {
+	mask =3D fsl_espi_read_reg(espi, ESPI_SPIM);
+	if (!(events & mask)) {
 		spin_unlock(&espi->lock);
 		return IRQ_NONE;
 	}
--=20
2.28.0

