Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E90D7FBC82
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 15:16:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=iof4yAQv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfkyR5nvyz3vwD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 01:15:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=iof4yAQv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sfknx2dF5z3cVZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 01:08:36 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 487EF6000E;
	Tue, 28 Nov 2023 14:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701180505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0wvI1tFhKePXdW/LM4A6s3+Ocv0iUTHrjsQSlsDC2Ew=;
	b=iof4yAQvnhIgigz0o8FNaedVX+mM3Gl853qCtaOEZfqnl3C8ygCo8yOWR2ac60CBFvS3uS
	9SqXZM2k/ww6UkQWUzKjF5LVcdG0F410ZYR/eDfA6CSbELAKW+XAT6DMt2t+wX7LAAbpoa
	3LVQ1t0pP5h1qeEGNT7xsP1YMKk92xDDWjVD83/0ly1n2rFZN2jXIqiL8p6oEQn7lNxVkk
	PurC7BoW699mvYmwE3OcYdQHDp2tLv9IsHDTfbXUD4xpNWtXReqnENJPMxLJACruYM6HHM
	Wo+uB6fAmtsfS+0bc5hpbvEfeSyv4nO/wKJ1lsGY9rALSmfXGsiN2/O6s8Q9+A==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 02/17] soc: fsl: cpm1: qmc: Fix __iomem addresses declaration
Date: Tue, 28 Nov 2023 15:08:01 +0100
Message-ID: <20231128140818.261541-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128140818.261541-1-herve.codina@bootlin.com>
References: <20231128140818.261541-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running sparse (make C=1) on qmc.c raises a lot of warning such as:
  ...
  warning: incorrect type in assignment (different address spaces)
     expected struct cpm_buf_desc [usertype] *[noderef] __iomem bd
     got struct cpm_buf_desc [noderef] [usertype] __iomem *txbd_free
  ...

Indeed, some variable were declared 'type *__iomem var' instead of
'type __iomem *var'.

Use the correct declaration to remove these warnings.

Fixes: 3178d58e0b97 ("soc: fsl: cpm1: Add support for QMC")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 92ec76c03965..3f3de1351c96 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -175,7 +175,7 @@ struct qmc_chan {
 	struct list_head list;
 	unsigned int id;
 	struct qmc *qmc;
-	void *__iomem s_param;
+	void __iomem *s_param;
 	enum qmc_mode mode;
 	u64	tx_ts_mask;
 	u64	rx_ts_mask;
@@ -203,9 +203,9 @@ struct qmc_chan {
 struct qmc {
 	struct device *dev;
 	struct tsa_serial *tsa_serial;
-	void *__iomem scc_regs;
-	void *__iomem scc_pram;
-	void *__iomem dpram;
+	void __iomem *scc_regs;
+	void __iomem *scc_pram;
+	void __iomem *dpram;
 	u16 scc_pram_offset;
 	cbd_t __iomem *bd_table;
 	dma_addr_t bd_dma_addr;
@@ -218,37 +218,37 @@ struct qmc {
 	struct qmc_chan *chans[64];
 };
 
-static inline void qmc_write16(void *__iomem addr, u16 val)
+static inline void qmc_write16(void __iomem *addr, u16 val)
 {
 	iowrite16be(val, addr);
 }
 
-static inline u16 qmc_read16(void *__iomem addr)
+static inline u16 qmc_read16(void __iomem *addr)
 {
 	return ioread16be(addr);
 }
 
-static inline void qmc_setbits16(void *__iomem addr, u16 set)
+static inline void qmc_setbits16(void __iomem *addr, u16 set)
 {
 	qmc_write16(addr, qmc_read16(addr) | set);
 }
 
-static inline void qmc_clrbits16(void *__iomem addr, u16 clr)
+static inline void qmc_clrbits16(void __iomem *addr, u16 clr)
 {
 	qmc_write16(addr, qmc_read16(addr) & ~clr);
 }
 
-static inline void qmc_write32(void *__iomem addr, u32 val)
+static inline void qmc_write32(void __iomem *addr, u32 val)
 {
 	iowrite32be(val, addr);
 }
 
-static inline u32 qmc_read32(void *__iomem addr)
+static inline u32 qmc_read32(void __iomem *addr)
 {
 	return ioread32be(addr);
 }
 
-static inline void qmc_setbits32(void *__iomem addr, u32 set)
+static inline void qmc_setbits32(void __iomem *addr, u32 set)
 {
 	qmc_write32(addr, qmc_read32(addr) | set);
 }
@@ -318,7 +318,7 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 {
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
-	cbd_t *__iomem bd;
+	cbd_t __iomem *bd;
 	u16 ctrl;
 	int ret;
 
@@ -374,7 +374,7 @@ static void qmc_chan_write_done(struct qmc_chan *chan)
 	void (*complete)(void *context);
 	unsigned long flags;
 	void *context;
-	cbd_t *__iomem bd;
+	cbd_t __iomem *bd;
 	u16 ctrl;
 
 	/*
@@ -425,7 +425,7 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 {
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
-	cbd_t *__iomem bd;
+	cbd_t __iomem *bd;
 	u16 ctrl;
 	int ret;
 
@@ -488,7 +488,7 @@ static void qmc_chan_read_done(struct qmc_chan *chan)
 	void (*complete)(void *context, size_t size);
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
-	cbd_t *__iomem bd;
+	cbd_t __iomem *bd;
 	void *context;
 	u16 datalen;
 	u16 ctrl;
@@ -663,7 +663,7 @@ static void qmc_chan_reset_rx(struct qmc_chan *chan)
 {
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
-	cbd_t *__iomem bd;
+	cbd_t __iomem *bd;
 	u16 ctrl;
 
 	spin_lock_irqsave(&chan->rx_lock, flags);
@@ -694,7 +694,7 @@ static void qmc_chan_reset_tx(struct qmc_chan *chan)
 {
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
-	cbd_t *__iomem bd;
+	cbd_t __iomem *bd;
 	u16 ctrl;
 
 	spin_lock_irqsave(&chan->tx_lock, flags);
-- 
2.42.0

