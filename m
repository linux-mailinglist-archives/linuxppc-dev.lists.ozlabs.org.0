Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B368754851E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 14:25:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LM9kl4RvMz3cdv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 22:25:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bXHavri1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bXHavri1;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM9k62hPGz3bhs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 22:24:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB686608D6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 12:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6794AC34114;
	Mon, 13 Jun 2022 12:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655123082;
	bh=l61b/ctY3C25UFlMHAV5SCwDA+egp78kfiVbGOiN2xw=;
	h=From:To:Cc:Subject:Date:From;
	b=bXHavri1+UnOw/hcwrMuTV6D89PRUw8F0urpblaUsY35Sdr5np9EfHKv/UqB1htPL
	 RuQq5vbLgv33Pmq+0FUBmUl6VX786klR/+iLOuAiwuKanHGCVZ+nXzhbvn0dfb5+7x
	 +6aFLo+oP+TeX5Crlm2Gz8zgH+YHb1ufH+fuAdGwZYY8IaDMJYWcXs7DBZwiMuPpQv
	 EzD/h0wJAuqyUS6ZmeXehcM9LufJQzXz5E6a/80zaAEw5raNrBwsItorxQuh1XKM5M
	 mXivWGOKVbMdDYRDmh7VW8rfXbhv8t4EnADZ39euqziAWjOYQX3KqMJTIj/e/geis8
	 Ikjpg/AWrJJVw==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] spi: mpc52xx-psc: Switch to using core message queue
Date: Mon, 13 Jun 2022 13:19:46 +0100
Message-Id: <20220613121946.136193-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5784; h=from:subject; bh=l61b/ctY3C25UFlMHAV5SCwDA+egp78kfiVbGOiN2xw=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBipyn0tUyoNYp4Ynz+/UNX9ca+Sff0LDK8gEXB10rJ SQS9kXKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYqcp9AAKCRAk1otyXVSH0IgYB/ 4jn6w6Y5DHkoTAGLChFzKXp7pB+7quksB9Vnja6+Vo0ZPrAI5v3G2M1AiSOs0My1f454Q3ifmzB9// st6w1hmm0/CgGT9TH6Cao1aXWkfAw2bkSLENhQYiBvmKT6aT24yg0wWB5SoEMeeKXEoC+09ByPp35B u9XSCZ/WZPJ02iNZBwb4vC0ZUhaZDLtrP941RIlz3p7x04r6vI7tCZsjt6I9lyjm2FNDKThl/6sU29 n3Gq1OihmPop7oSZTn+m+llP0E8Uskeof+F7SpSxFKz60n6dLrEQIYXygDO8h/QmqRHmZKY5hVEfW1 yfjQjdykJJg8ZLmyVkVYXj2BtH8VVX
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: Mark Brown <broonie@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We deprecated open coding of the transfer queue back in 2017 so it's high
time we finished up converting drivers to use the standard message queue
code. The mpc52xx-psc driver is fairly straightforward so convert to use
transfer_one_message(), it looks like the driver would be a good fit for
transfer_one() with a little bit of updating but this smaller change seems
safer.

The driver seems like a good candidate for transfer_one() but the chip
select function is actually doing rather more than just updating the chip
select and both transfer_one() and transfer_one_message() are current APIs
so leave that refactoring for another day, ideally by someone with the
hardware.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-mpc52xx-psc.c | 116 ++++++++++------------------------
 1 file changed, 34 insertions(+), 82 deletions(-)

diff --git a/drivers/spi/spi-mpc52xx-psc.c b/drivers/spi/spi-mpc52xx-psc.c
index 7654736c2c0e..609311231e64 100644
--- a/drivers/spi/spi-mpc52xx-psc.c
+++ b/drivers/spi/spi-mpc52xx-psc.c
@@ -37,12 +37,6 @@ struct mpc52xx_psc_spi {
 	struct mpc52xx_psc_fifo __iomem *fifo;
 	unsigned int irq;
 	u8 bits_per_word;
-	u8 busy;
-
-	struct work_struct work;
-
-	struct list_head queue;
-	spinlock_t lock;
 
 	struct completion done;
 };
@@ -198,69 +192,53 @@ static int mpc52xx_psc_spi_transfer_rxtx(struct spi_device *spi,
 	return 0;
 }
 
-static void mpc52xx_psc_spi_work(struct work_struct *work)
+int mpc52xx_psc_spi_transfer_one_message(struct spi_controller *ctlr,
+					 struct spi_message *m)
 {
-	struct mpc52xx_psc_spi *mps =
-		container_of(work, struct mpc52xx_psc_spi, work);
-
-	spin_lock_irq(&mps->lock);
-	mps->busy = 1;
-	while (!list_empty(&mps->queue)) {
-		struct spi_message *m;
-		struct spi_device *spi;
-		struct spi_transfer *t = NULL;
-		unsigned cs_change;
-		int status;
-
-		m = container_of(mps->queue.next, struct spi_message, queue);
-		list_del_init(&m->queue);
-		spin_unlock_irq(&mps->lock);
-
-		spi = m->spi;
-		cs_change = 1;
-		status = 0;
-		list_for_each_entry (t, &m->transfers, transfer_list) {
-			if (t->bits_per_word || t->speed_hz) {
-				status = mpc52xx_psc_spi_transfer_setup(spi, t);
-				if (status < 0)
-					break;
-			}
-
-			if (cs_change)
-				mpc52xx_psc_spi_activate_cs(spi);
-			cs_change = t->cs_change;
-
-			status = mpc52xx_psc_spi_transfer_rxtx(spi, t);
-			if (status)
+	struct spi_device *spi;
+	struct spi_transfer *t = NULL;
+	unsigned cs_change;
+	int status;
+
+	spi = m->spi;
+	cs_change = 1;
+	status = 0;
+	list_for_each_entry (t, &m->transfers, transfer_list) {
+		if (t->bits_per_word || t->speed_hz) {
+			status = mpc52xx_psc_spi_transfer_setup(spi, t);
+			if (status < 0)
 				break;
-			m->actual_length += t->len;
+		}
 
-			spi_transfer_delay_exec(t);
+		if (cs_change)
+			mpc52xx_psc_spi_activate_cs(spi);
+		cs_change = t->cs_change;
 
-			if (cs_change)
-				mpc52xx_psc_spi_deactivate_cs(spi);
-		}
+		status = mpc52xx_psc_spi_transfer_rxtx(spi, t);
+		if (status)
+			break;
+		m->actual_length += t->len;
 
-		m->status = status;
-		if (m->complete)
-			m->complete(m->context);
+		spi_transfer_delay_exec(t);
 
-		if (status || !cs_change)
+		if (cs_change)
 			mpc52xx_psc_spi_deactivate_cs(spi);
+	}
 
-		mpc52xx_psc_spi_transfer_setup(spi, NULL);
+	m->status = status;
+	if (status || !cs_change)
+		mpc52xx_psc_spi_deactivate_cs(spi);
 
-		spin_lock_irq(&mps->lock);
-	}
-	mps->busy = 0;
-	spin_unlock_irq(&mps->lock);
+	mpc52xx_psc_spi_transfer_setup(spi, NULL);
+
+	spi_finalize_current_message(ctlr);
+
+	return 0;
 }
 
 static int mpc52xx_psc_spi_setup(struct spi_device *spi)
 {
-	struct mpc52xx_psc_spi *mps = spi_master_get_devdata(spi->master);
 	struct mpc52xx_psc_spi_cs *cs = spi->controller_state;
-	unsigned long flags;
 
 	if (spi->bits_per_word%8)
 		return -EINVAL;
@@ -275,28 +253,6 @@ static int mpc52xx_psc_spi_setup(struct spi_device *spi)
 	cs->bits_per_word = spi->bits_per_word;
 	cs->speed_hz = spi->max_speed_hz;
 
-	spin_lock_irqsave(&mps->lock, flags);
-	if (!mps->busy)
-		mpc52xx_psc_spi_deactivate_cs(spi);
-	spin_unlock_irqrestore(&mps->lock, flags);
-
-	return 0;
-}
-
-static int mpc52xx_psc_spi_transfer(struct spi_device *spi,
-		struct spi_message *m)
-{
-	struct mpc52xx_psc_spi *mps = spi_master_get_devdata(spi->master);
-	unsigned long flags;
-
-	m->actual_length = 0;
-	m->status = -EINPROGRESS;
-
-	spin_lock_irqsave(&mps->lock, flags);
-	list_add_tail(&m->queue, &mps->queue);
-	schedule_work(&mps->work);
-	spin_unlock_irqrestore(&mps->lock, flags);
-
 	return 0;
 }
 
@@ -391,7 +347,7 @@ static int mpc52xx_psc_spi_do_probe(struct device *dev, u32 regaddr,
 		master->num_chipselect = pdata->max_chipselect;
 	}
 	master->setup = mpc52xx_psc_spi_setup;
-	master->transfer = mpc52xx_psc_spi_transfer;
+	master->transfer_one_message = mpc52xx_psc_spi_transfer_one_message;
 	master->cleanup = mpc52xx_psc_spi_cleanup;
 	master->dev.of_node = dev->of_node;
 
@@ -415,10 +371,7 @@ static int mpc52xx_psc_spi_do_probe(struct device *dev, u32 regaddr,
 		goto free_irq;
 	}
 
-	spin_lock_init(&mps->lock);
 	init_completion(&mps->done);
-	INIT_WORK(&mps->work, mpc52xx_psc_spi_work);
-	INIT_LIST_HEAD(&mps->queue);
 
 	ret = spi_register_master(master);
 	if (ret < 0)
@@ -470,7 +423,6 @@ static int mpc52xx_psc_spi_of_remove(struct platform_device *op)
 	struct spi_master *master = spi_master_get(platform_get_drvdata(op));
 	struct mpc52xx_psc_spi *mps = spi_master_get_devdata(master);
 
-	flush_work(&mps->work);
 	spi_unregister_master(master);
 	free_irq(mps->irq, mps);
 	if (mps->psc)
-- 
2.30.2

