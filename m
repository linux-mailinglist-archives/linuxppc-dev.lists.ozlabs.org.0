Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EF823272B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 23:52:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH6hL0jFrzDqkZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 07:52:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=u04DHoZ3; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH6fY549hzDqby
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 07:50:28 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id q4so26715038lji.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 14:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ABsiYs0xtuCZ6hmXzQfLGo3rLtmdSeGHh35xe8wn6Rs=;
 b=u04DHoZ38wDI2FD7GTuIgjow7521smerbPKc25OViIMHrGmECaq1sGrhYP1aE0jE02
 dmfkSB97CtI/1yB6iaWc645e87z3Z0aNzadxKbBVlG6H1Gf0PXcWxFXDFwYVGdszNIF4
 Qhrt2ufxhSBCcYnuCJG60VR1qqm3BAtpEc+RdVgIeLjgH/rbLnJglksioSrg4Vkx3vCK
 ic3W44gDXZuZ/Kgfiv6r031u3AOZvCqdnDY1F6G5KO9Vuvd52W+9gjpJsX3Op8zS4RY1
 4BUOZJNXYpmzz0rDg1g9mhfrZrfYGJf8RNHZ5URyPFOdpA+v4HW1mcWZqGP146jMIRp2
 K/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ABsiYs0xtuCZ6hmXzQfLGo3rLtmdSeGHh35xe8wn6Rs=;
 b=rO4HHYtnLc2Yv6bN0QvejEjjU+pVMtawB0r0sPaRH1G2ldasimbaQ0+9mvWIBy/A5W
 bjIoNlFXYXugh7VfEALf4LfPWlDSGGVTTfi/0wD8xO1IdKGuY9IB1hprFbw2iee/2JQm
 k3hBroNAceT0YeiwrU4XGAUvryzzl9LUSyXJebA18dAmBGEI4XYxZN7nkJvlDefWF46Q
 ztaNJv5b71xxYJGElxhmV3thJQaCD358cTz+FN/yrCOkMcSbqvcD57m88Sx+kQyi1z2P
 x9Fl5aNtotrA494mx+L3Jek99uKYqfP/le9I11vo93PFghm4YaKtU6Eo30EWQCnBuMoB
 MGyg==
X-Gm-Message-State: AOAM530ePDqA9+9gbLuKulnt4PUZ0ZAaVOS7hE8RNdsa/2HhsxFU6sDG
 efL/jw0gTv2cNNkDtuhsH4M3og==
X-Google-Smtp-Source: ABdhPJwblNZ+VNYuRVGoVSX9EVmZP+AcbK8QtgjkOkqwCT9vhrRrytv9fRkA5t3rsUQ+ScLCciysLA==
X-Received: by 2002:a2e:b306:: with SMTP id o6mr145133lja.361.1596059423830;
 Wed, 29 Jul 2020 14:50:23 -0700 (PDT)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id l26sm721262lfj.22.2020.07.29.14.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 14:50:22 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Subject: [PATCH 1/2] spi: mpc512x-psc: Use the framework .set_cs()
Date: Wed, 29 Jul 2020 23:48:16 +0200
Message-Id: <20200729214817.478834-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The mpc512x-psc is rolling its own chip select control code,
but the SPI master framework can handle this. It was also
evaluating the CS status for each transfer but the CS change
should be per-message not per-transfer.

Switch to use the core .set_cs() to control the chip select.

Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/spi/spi-mpc512x-psc.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi-mpc512x-psc.c b/drivers/spi/spi-mpc512x-psc.c
index ea1b07953d38..35313a77f977 100644
--- a/drivers/spi/spi-mpc512x-psc.c
+++ b/drivers/spi/spi-mpc512x-psc.c
@@ -89,7 +89,7 @@ static int mpc512x_psc_spi_transfer_setup(struct spi_device *spi,
 	return 0;
 }
 
-static void mpc512x_psc_spi_activate_cs(struct spi_device *spi)
+static void mpc512x_psc_spi_set_cs(struct spi_device *spi, bool enable)
 {
 	struct mpc512x_psc_spi_cs *cs = spi->controller_state;
 	struct mpc512x_psc_spi *mps = spi_master_get_devdata(spi->master);
@@ -98,6 +98,12 @@ static void mpc512x_psc_spi_activate_cs(struct spi_device *spi)
 	int speed;
 	u16 bclkdiv;
 
+	if (!enable) {
+		if (mps->cs_control && gpio_is_valid(spi->cs_gpio))
+			mps->cs_control(spi, (spi->mode & SPI_CS_HIGH) ? 0 : 1);
+		return;
+	}
+
 	sicr = in_be32(psc_addr(mps, sicr));
 
 	/* Set clock phase and polarity */
@@ -132,15 +138,6 @@ static void mpc512x_psc_spi_activate_cs(struct spi_device *spi)
 		mps->cs_control(spi, (spi->mode & SPI_CS_HIGH) ? 1 : 0);
 }
 
-static void mpc512x_psc_spi_deactivate_cs(struct spi_device *spi)
-{
-	struct mpc512x_psc_spi *mps = spi_master_get_devdata(spi->master);
-
-	if (mps->cs_control && gpio_is_valid(spi->cs_gpio))
-		mps->cs_control(spi, (spi->mode & SPI_CS_HIGH) ? 0 : 1);
-
-}
-
 /* extract and scale size field in txsz or rxsz */
 #define MPC512x_PSC_FIFO_SZ(sz) ((sz & 0x7ff) << 2);
 
@@ -290,40 +287,28 @@ static int mpc512x_psc_spi_msg_xfer(struct spi_master *master,
 				    struct spi_message *m)
 {
 	struct spi_device *spi;
-	unsigned cs_change;
 	int status;
 	struct spi_transfer *t;
 
 	spi = m->spi;
-	cs_change = 1;
 	status = 0;
 	list_for_each_entry(t, &m->transfers, transfer_list) {
 		status = mpc512x_psc_spi_transfer_setup(spi, t);
 		if (status < 0)
 			break;
 
-		if (cs_change)
-			mpc512x_psc_spi_activate_cs(spi);
-		cs_change = t->cs_change;
-
 		status = mpc512x_psc_spi_transfer_rxtx(spi, t);
 		if (status)
 			break;
 		m->actual_length += t->len;
 
 		spi_transfer_delay_exec(t);
-
-		if (cs_change)
-			mpc512x_psc_spi_deactivate_cs(spi);
 	}
 
 	m->status = status;
 	if (m->complete)
 		m->complete(m->context);
 
-	if (status || !cs_change)
-		mpc512x_psc_spi_deactivate_cs(spi);
-
 	mpc512x_psc_spi_transfer_setup(spi, NULL);
 
 	spi_finalize_current_message(master);
@@ -513,6 +498,7 @@ static int mpc512x_psc_spi_do_probe(struct device *dev, u32 regaddr,
 	master->prepare_transfer_hardware = mpc512x_psc_spi_prep_xfer_hw;
 	master->transfer_one_message = mpc512x_psc_spi_msg_xfer;
 	master->unprepare_transfer_hardware = mpc512x_psc_spi_unprep_xfer_hw;
+	master->set_cs = mpc512x_psc_spi_set_cs;
 	master->cleanup = mpc512x_psc_spi_cleanup;
 	master->dev.of_node = dev->of_node;
 
-- 
2.26.2

