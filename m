Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC0879CAA1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 10:52:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=mx341Kce;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlHR15Zzvz3cJm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 18:52:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=mx341Kce;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlHQ643q2z2yGv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 18:51:56 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 7054024005D;
	Tue, 12 Sep 2023 08:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694508704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fnhlmyV9uqfQHa6AlRpMQCfiW/NfQzJB6OlaQ/hT7HQ=;
	b=mx341KceJaUgBDsgVG30vUrWpWZD65gedAPbcxO0PrGlNZ5/L1PKGa/q/iThrJ6Srt6x5B
	dM3M4ydgc4GlL0/87qKFiUdu9wpcx3iIivvTxv2K6R910LfJHFUOxkd3iI8vLNwDiYzMOK
	4rWMmEmKsVhx7/+pIpePRcuB+4ZQgCiG2AGrK69CGT2cnfmkutn5MUKcHP8vrnlLe2FZNb
	JzmmbzK8q9Q6rGATjYPV1mWMfY55wLVv7PNrvOOYvdPS3oM2gGtER6y5da9b9UciFezkT9
	4RsanBUFuLvLk+o1JqunSBk6KlZmlRrsqWVSwEFGc46nWLZZSZL/MfeXq+vlyQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v5 02/31] soc: fsl: cpm1: qmc: Fix __iomem addresses declaration
Date: Tue, 12 Sep 2023 10:14:53 +0200
Message-ID: <20230912081527.208499-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912081527.208499-1-herve.codina@bootlin.com>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index b3c292c9a14e..7ad0d77f1740 100644
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
2.41.0

