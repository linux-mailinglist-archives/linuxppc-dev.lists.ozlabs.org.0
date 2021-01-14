Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CEA2F619E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 14:15:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGlDM2P56zDsFV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 00:15:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGl5n5K9XzDrnm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 00:09:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DGl5X74c3z9v0YY;
 Thu, 14 Jan 2021 14:09:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gDsXNkuQusb8; Thu, 14 Jan 2021 14:09:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DGl5X5zTpz9v0Y9;
 Thu, 14 Jan 2021 14:09:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 46E4A8B803;
 Thu, 14 Jan 2021 14:09:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2Ak7H_t9Jp6A; Thu, 14 Jan 2021 14:09:38 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A2C6B8B802;
 Thu, 14 Jan 2021 14:09:37 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 5AD1C6637F; Thu, 14 Jan 2021 13:09:37 +0000 (UTC)
Message-Id: <6b51cc2bfbca70d3e9b9da7b7aa4c7a9d793ca0e.1610629002.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] spi: fsl: Fix driver breakage when SPI_CS_HIGH is not set in
 spi->mode
To: Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Sven Van Asbroeck <thesven73@gmail.com>
Date: Thu, 14 Jan 2021 13:09:37 +0000 (UTC)
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

Commit 766c6b63aa04 ("spi: fix client driver breakages when using GPIO
descriptors") broke fsl spi driver.

As now we fully rely on gpiolib for handling the polarity of
chip selects, the driver shall not alter the GPIO value anymore
when SPI_CS_HIGH is not set in spi->mode.

Fixes: 766c6b63aa04 ("spi: fix client driver breakages when using GPIO descriptors")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/spi/spi-fsl-spi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index 649766808caf..9e297b2715f6 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -115,14 +115,13 @@ static void fsl_spi_chipselect(struct spi_device *spi, int value)
 {
 	struct mpc8xxx_spi *mpc8xxx_spi = spi_master_get_devdata(spi->master);
 	struct fsl_spi_platform_data *pdata;
-	bool pol = spi->mode & SPI_CS_HIGH;
 	struct spi_mpc8xxx_cs	*cs = spi->controller_state;
 
 	pdata = spi->dev.parent->parent->platform_data;
 
 	if (value == BITBANG_CS_INACTIVE) {
 		if (pdata->cs_control)
-			pdata->cs_control(spi, !pol);
+			pdata->cs_control(spi, false);
 	}
 
 	if (value == BITBANG_CS_ACTIVE) {
@@ -134,7 +133,7 @@ static void fsl_spi_chipselect(struct spi_device *spi, int value)
 		fsl_spi_change_mode(spi);
 
 		if (pdata->cs_control)
-			pdata->cs_control(spi, pol);
+			pdata->cs_control(spi, true);
 	}
 }
 
-- 
2.25.0

