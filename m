Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACDB7810D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 18:47:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RS7821bJMz3g8b
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 02:47:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RS70m6HqTz3dDw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 02:40:56 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RS6zy13R7z9vjC;
	Fri, 18 Aug 2023 18:40:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4U7RhbHWPQT8; Fri, 18 Aug 2023 18:40:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RS6zl44p9z9vhW;
	Fri, 18 Aug 2023 18:40:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 815098B76D;
	Fri, 18 Aug 2023 18:40:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id cQvcVEpSSBcJ; Fri, 18 Aug 2023 18:40:03 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (PO17626.IDSI0.si.c-s.fr [172.19.54.29])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8DC028B77C;
	Fri, 18 Aug 2023 18:40:01 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37IGduno141957
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 18:39:56 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37IGdu5A141956;
	Fri, 18 Aug 2023 18:39:56 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 04/28] soc: fsl: cpm1: qmc: Extend the API to provide Rx status
Date: Fri, 18 Aug 2023 18:38:58 +0200
Message-ID: <c9f7966da27455390848846a30e34f3c059427f9.1692376361.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692376360.git.christophe.leroy@csgroup.eu>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692376734; l=5458; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=NLobTtZwmX6+TiWRgTbk0b6G1wgEpGh/t2FaZYMhZLs=; b=31GwyewAkhJBnFz8bfeoy3PPfhugRG03/u3bJHd03c2Rb9ym1AZo3atjcAHYUlxNHwyRwxd4B 796HpaTjo9tCsgzHvVtoi/lQDyl1uU7j9XrNj69Wjvm1qMPCT6eSuat
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Herve Codina <herve.codina@bootlin.com>

In HDLC mode, some status flags related to the data read transfer can be
set by the hardware and need to be known by a QMC consumer for further
analysis.

Extend the API in order to provide these transfer status flags at the
read complete() call.

In TRANSPARENT mode, these flags have no meaning. Keep only one read
complete() API and update the consumers working in transparent mode.
In this case, the newly introduced flags parameter is simply unused.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c      | 29 +++++++++++++++++++++++++----
 include/soc/fsl/qe/qmc.h      | 15 ++++++++++++++-
 sound/soc/fsl/fsl_qmc_audio.c |  2 +-
 3 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 8dc73cc1a83b..2d2a9d88ba6c 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -166,7 +166,7 @@
 struct qmc_xfer_desc {
 	union {
 		void (*tx_complete)(void *context);
-		void (*rx_complete)(void *context, size_t length);
+		void (*rx_complete)(void *context, size_t length, unsigned int flags);
 	};
 	void *context;
 };
@@ -421,7 +421,8 @@ static void qmc_chan_write_done(struct qmc_chan *chan)
 }
 
 int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
-			 void (*complete)(void *context, size_t length), void *context)
+			 void (*complete)(void *context, size_t length, unsigned int flags),
+			 void *context)
 {
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
@@ -454,6 +455,10 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 	xfer_desc->rx_complete = complete;
 	xfer_desc->context = context;
 
+	/* Clear previous status flags */
+	ctrl &= ~(QMC_BD_RX_L | QMC_BD_RX_F | QMC_BD_RX_LG | QMC_BD_RX_NO |
+		  QMC_BD_RX_AB | QMC_BD_RX_CR);
+
 	/* Activate the descriptor */
 	ctrl |= (QMC_BD_RX_E | QMC_BD_RX_UB);
 	wmb(); /* Be sure to flush data before descriptor activation */
@@ -485,7 +490,7 @@ EXPORT_SYMBOL(qmc_chan_read_submit);
 
 static void qmc_chan_read_done(struct qmc_chan *chan)
 {
-	void (*complete)(void *context, size_t size);
+	void (*complete)(void *context, size_t size, unsigned int flags);
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
 	cbd_t __iomem *bd;
@@ -527,7 +532,23 @@ static void qmc_chan_read_done(struct qmc_chan *chan)
 
 		if (complete) {
 			spin_unlock_irqrestore(&chan->rx_lock, flags);
-			complete(context, datalen);
+
+			/*
+			 * Avoid conversion between internal hardware flags and
+			 * the software API flags.
+			 * -> Be sure that the software API flags are consistent
+			 *    with the hardware flags
+			 */
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_LAST  != QMC_BD_RX_L);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_FIRST != QMC_BD_RX_F);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_OVF   != QMC_BD_RX_LG);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_UNA   != QMC_BD_RX_NO);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_ABORT != QMC_BD_RX_AB);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_CRC   != QMC_BD_RX_CR);
+
+			complete(context, datalen,
+				 ctrl & (QMC_BD_RX_L | QMC_BD_RX_F | QMC_BD_RX_LG |
+					 QMC_BD_RX_NO | QMC_BD_RX_AB | QMC_BD_RX_CR));
 			spin_lock_irqsave(&chan->rx_lock, flags);
 		}
 
diff --git a/include/soc/fsl/qe/qmc.h b/include/soc/fsl/qe/qmc.h
index 3c61a50d2ae2..6f1d6cebc9fe 100644
--- a/include/soc/fsl/qe/qmc.h
+++ b/include/soc/fsl/qe/qmc.h
@@ -9,6 +9,7 @@
 #ifndef __SOC_FSL_QMC_H__
 #define __SOC_FSL_QMC_H__
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 struct device_node;
@@ -56,8 +57,20 @@ int qmc_chan_set_param(struct qmc_chan *chan, const struct qmc_chan_param *param
 int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 			  void (*complete)(void *context), void *context);
 
+/* Flags available (ORed) for read complete() flags parameter in HDLC mode.
+ * No flags are available in transparent mode and the read complete() flags
+ * parameter has no meaning in transparent mode.
+ */
+#define QMC_RX_FLAG_HDLC_LAST	BIT(11) /* Last in frame */
+#define QMC_RX_FLAG_HDLC_FIRST	BIT(10) /* First in frame */
+#define QMC_RX_FLAG_HDLC_OVF	BIT(5)  /* Data overflow */
+#define QMC_RX_FLAG_HDLC_UNA	BIT(4)  /* Unaligned (ie. bits received not multiple of 8) */
+#define QMC_RX_FLAG_HDLC_ABORT	BIT(3)  /* Received an abort sequence (seven consecutive ones) */
+#define QMC_RX_FLAG_HDLC_CRC	BIT(2)  /* CRC error */
+
 int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
-			 void (*complete)(void *context, size_t length),
+			 void (*complete)(void *context, size_t length,
+					  unsigned int flags),
 			 void *context);
 
 #define QMC_CHAN_READ  (1<<0)
diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 7cbb8e4758cc..5d745aae17a8 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -99,7 +99,7 @@ static void qmc_audio_pcm_write_complete(void *context)
 	snd_pcm_period_elapsed(prtd->substream);
 }
 
-static void qmc_audio_pcm_read_complete(void *context, size_t length)
+static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned int flags)
 {
 	struct qmc_dai_prtd *prtd = context;
 	int ret;
-- 
2.41.0

