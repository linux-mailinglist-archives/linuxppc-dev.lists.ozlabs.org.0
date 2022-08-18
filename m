Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBD159844B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 15:39:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7mFx2jgXz3c17
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 23:39:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7mFW2XCvz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 23:39:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4M7mFN2Jnqz9sf9;
	Thu, 18 Aug 2022 15:39:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Erh0UQaaA8rp; Thu, 18 Aug 2022 15:39:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4M7mFN1HSBz9sdy;
	Thu, 18 Aug 2022 15:39:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C0458B767;
	Thu, 18 Aug 2022 15:39:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tN3eUpb6DCTz; Thu, 18 Aug 2022 15:39:04 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.236])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CFD0A8B763;
	Thu, 18 Aug 2022 15:39:03 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 27IDcuWs1990416
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 15:38:56 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 27IDcurF1990411;
	Thu, 18 Aug 2022 15:38:56 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mark Brown <broonie@kernel.org>
Subject: [RFC PATCH v1] spi: fsl_spi: Convert to transfer_one
Date: Thu, 18 Aug 2022 15:38:37 +0200
Message-Id: <753266abafe81722d86c3ddb8bac8ef1cb00fe8c.1660829841.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1660829916; l=8159; s=20211009; h=from:subject:message-id; bh=LNAq5UhTOCPEZGjCjrn7GGg4JHqTr8kNFadZBFaEwyE=; b=pKsC+3TfhJs6DpJ59Zh8GgeIa3HpCCBZlfrMX2OxmthAwhD49P3NF63PytKMmrQucexPbX7grARY I9mLyA/5B82wwh0SV4VFI8utQVfHbulzFPTdUbuGl/QPaKid1eh+
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let the core handle all the chipselect bakery and replace
transfer_one_message() by transfer_one() and prepare_message().

At the time being, there is fsl_spi_cs_control() to handle
chipselects. That function handles both GPIO and non-GPIO
chipselects. The GPIO chipselects will now be handled by
the core directly, so only handle non-GPIO chipselects and
hook it to ->set_cs

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Sending as an RFC as I'm not 100% sure of the correctness.
I successfully tested it on the hardware I have though.
Not sure about the change from m->is_dma_mapped to !!t->tx_dma || !!t->rx_dma
---
 drivers/spi/spi-fsl-spi.c | 157 +++++++++++---------------------------
 1 file changed, 43 insertions(+), 114 deletions(-)

diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index bdf94cc7be1a..731624f157fc 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -111,32 +111,6 @@ static void fsl_spi_change_mode(struct spi_device *spi)
 	local_irq_restore(flags);
 }
 
-static void fsl_spi_chipselect(struct spi_device *spi, int value)
-{
-	struct mpc8xxx_spi *mpc8xxx_spi = spi_master_get_devdata(spi->master);
-	struct fsl_spi_platform_data *pdata;
-	struct spi_mpc8xxx_cs	*cs = spi->controller_state;
-
-	pdata = spi->dev.parent->parent->platform_data;
-
-	if (value == BITBANG_CS_INACTIVE) {
-		if (pdata->cs_control)
-			pdata->cs_control(spi, false);
-	}
-
-	if (value == BITBANG_CS_ACTIVE) {
-		mpc8xxx_spi->rx_shift = cs->rx_shift;
-		mpc8xxx_spi->tx_shift = cs->tx_shift;
-		mpc8xxx_spi->get_rx = cs->get_rx;
-		mpc8xxx_spi->get_tx = cs->get_tx;
-
-		fsl_spi_change_mode(spi);
-
-		if (pdata->cs_control)
-			pdata->cs_control(spi, true);
-	}
-}
-
 static void fsl_spi_qe_cpu_set_shifts(u32 *rx_shift, u32 *tx_shift,
 				      int bits_per_word, int msb_first)
 {
@@ -354,15 +328,11 @@ static int fsl_spi_bufs(struct spi_device *spi, struct spi_transfer *t,
 	return mpc8xxx_spi->count;
 }
 
-static int fsl_spi_do_one_msg(struct spi_master *master,
-			      struct spi_message *m)
+static int fsl_spi_prepare_message(struct spi_controller *ctlr,
+				   struct spi_message *m)
 {
-	struct mpc8xxx_spi *mpc8xxx_spi = spi_master_get_devdata(master);
-	struct spi_device *spi = m->spi;
-	struct spi_transfer *t, *first;
-	unsigned int cs_change;
-	const int nsecs = 50;
-	int status, last_bpw;
+	struct mpc8xxx_spi *mpc8xxx_spi = spi_controller_get_devdata(ctlr);
+	struct spi_transfer *t;
 
 	/*
 	 * In CPU mode, optimize large byte transfers to use larger
@@ -378,62 +348,30 @@ static int fsl_spi_do_one_msg(struct spi_master *master,
 				t->bits_per_word = 16;
 		}
 	}
+	return 0;
+}
 
-	/* Don't allow changes if CS is active */
-	cs_change = 1;
-	list_for_each_entry(t, &m->transfers, transfer_list) {
-		if (cs_change)
-			first = t;
-		cs_change = t->cs_change;
-		if (first->speed_hz != t->speed_hz) {
-			dev_err(&spi->dev,
-				"speed_hz cannot change while CS is active\n");
-			return -EINVAL;
-		}
-	}
-
-	last_bpw = -1;
-	cs_change = 1;
-	status = -EINVAL;
-	list_for_each_entry(t, &m->transfers, transfer_list) {
-		if (cs_change || last_bpw != t->bits_per_word)
-			status = fsl_spi_setup_transfer(spi, t);
-		if (status < 0)
-			break;
-		last_bpw = t->bits_per_word;
-
-		if (cs_change) {
-			fsl_spi_chipselect(spi, BITBANG_CS_ACTIVE);
-			ndelay(nsecs);
-		}
-		cs_change = t->cs_change;
-		if (t->len)
-			status = fsl_spi_bufs(spi, t, m->is_dma_mapped);
-		if (status) {
-			status = -EMSGSIZE;
-			break;
-		}
-		m->actual_length += t->len;
-
-		spi_transfer_delay_exec(t);
-
-		if (cs_change) {
-			ndelay(nsecs);
-			fsl_spi_chipselect(spi, BITBANG_CS_INACTIVE);
-			ndelay(nsecs);
-		}
-	}
+static int fsl_spi_transfer_one(struct spi_controller *controller,
+				struct spi_device *spi,
+				struct spi_transfer *t)
+{
+	int status;
 
-	m->status = status;
+	status = fsl_spi_setup_transfer(spi, t);
+	if (status < 0)
+		return status;
+	if (t->len)
+		status = fsl_spi_bufs(spi, t, !!t->tx_dma || !!t->rx_dma);
+	if (status > 0)
+		return -EMSGSIZE;
 
-	if (status || !cs_change) {
-		ndelay(nsecs);
-		fsl_spi_chipselect(spi, BITBANG_CS_INACTIVE);
-	}
+	return status;
+}
 
-	fsl_spi_setup_transfer(spi, NULL);
-	spi_finalize_current_message(master);
-	return 0;
+static int fsl_spi_unprepare_message(struct spi_controller *controller,
+				     struct spi_message *msg)
+{
+	return fsl_spi_setup_transfer(msg->spi, NULL);
 }
 
 static int fsl_spi_setup(struct spi_device *spi)
@@ -482,9 +420,6 @@ static int fsl_spi_setup(struct spi_device *spi)
 		return retval;
 	}
 
-	/* Initialize chipselect - might be active for SPI_CS_HIGH mode */
-	fsl_spi_chipselect(spi, BITBANG_CS_INACTIVE);
-
 	return 0;
 }
 
@@ -557,9 +492,7 @@ static void fsl_spi_grlib_cs_control(struct spi_device *spi, bool on)
 	u32 slvsel;
 	u16 cs = spi->chip_select;
 
-	if (spi->cs_gpiod) {
-		gpiod_set_value(spi->cs_gpiod, on);
-	} else if (cs < mpc8xxx_spi->native_chipselects) {
+	if (cs < mpc8xxx_spi->native_chipselects) {
 		slvsel = mpc8xxx_spi_read_reg(&reg_base->slvsel);
 		slvsel = on ? (slvsel | (1 << cs)) : (slvsel & ~(1 << cs));
 		mpc8xxx_spi_write_reg(&reg_base->slvsel, slvsel);
@@ -568,7 +501,6 @@ static void fsl_spi_grlib_cs_control(struct spi_device *spi, bool on)
 
 static void fsl_spi_grlib_probe(struct device *dev)
 {
-	struct fsl_spi_platform_data *pdata = dev_get_platdata(dev);
 	struct spi_master *master = dev_get_drvdata(dev);
 	struct mpc8xxx_spi *mpc8xxx_spi = spi_master_get_devdata(master);
 	struct fsl_spi_reg __iomem *reg_base = mpc8xxx_spi->reg_base;
@@ -588,7 +520,18 @@ static void fsl_spi_grlib_probe(struct device *dev)
 		mpc8xxx_spi_write_reg(&reg_base->slvsel, 0xffffffff);
 	}
 	master->num_chipselect = mpc8xxx_spi->native_chipselects;
-	pdata->cs_control = fsl_spi_grlib_cs_control;
+	master->set_cs = fsl_spi_grlib_cs_control;
+}
+
+static void fsl_spi_cs_control(struct spi_device *spi, bool on)
+{
+	struct device *dev = spi->dev.parent->parent;
+	struct fsl_spi_platform_data *pdata = dev_get_platdata(dev);
+	struct mpc8xxx_spi_probe_info *pinfo = to_of_pinfo(pdata);
+
+	if (WARN_ON_ONCE(!pinfo->immr_spi_cs))
+		return;
+	iowrite32be(on ? 0 : SPI_BOOT_SEL_BIT, pinfo->immr_spi_cs);
 }
 
 static struct spi_master *fsl_spi_probe(struct device *dev,
@@ -613,8 +556,11 @@ static struct spi_master *fsl_spi_probe(struct device *dev,
 
 	master->setup = fsl_spi_setup;
 	master->cleanup = fsl_spi_cleanup;
-	master->transfer_one_message = fsl_spi_do_one_msg;
+	master->prepare_message = fsl_spi_prepare_message;
+	master->transfer_one = fsl_spi_transfer_one;
+	master->unprepare_message = fsl_spi_unprepare_message;
 	master->use_gpio_descriptors = true;
+	master->set_cs = fsl_spi_cs_control;
 
 	mpc8xxx_spi = spi_master_get_devdata(master);
 	mpc8xxx_spi->max_bits_per_word = 32;
@@ -688,21 +634,6 @@ static struct spi_master *fsl_spi_probe(struct device *dev,
 	return ERR_PTR(ret);
 }
 
-static void fsl_spi_cs_control(struct spi_device *spi, bool on)
-{
-	if (spi->cs_gpiod) {
-		gpiod_set_value(spi->cs_gpiod, on);
-	} else {
-		struct device *dev = spi->dev.parent->parent;
-		struct fsl_spi_platform_data *pdata = dev_get_platdata(dev);
-		struct mpc8xxx_spi_probe_info *pinfo = to_of_pinfo(pdata);
-
-		if (WARN_ON_ONCE(!pinfo->immr_spi_cs))
-			return;
-		iowrite32be(on ? 0 : SPI_BOOT_SEL_BIT, pinfo->immr_spi_cs);
-	}
-}
-
 static int of_fsl_spi_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
@@ -744,12 +675,10 @@ static int of_fsl_spi_probe(struct platform_device *ofdev)
 		ret = gpiod_count(dev, "cs");
 		if (ret < 0)
 			ret = 0;
-		if (ret == 0 && !spisel_boot) {
+		if (ret == 0 && !spisel_boot)
 			pdata->max_chipselect = 1;
-		} else {
+		else
 			pdata->max_chipselect = ret + spisel_boot;
-			pdata->cs_control = fsl_spi_cs_control;
-		}
 	}
 
 	ret = of_address_to_resource(np, 0, &mem);
-- 
2.37.1

