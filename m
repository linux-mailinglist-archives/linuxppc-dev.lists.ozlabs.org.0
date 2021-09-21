Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2511A413CA2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:39:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZZ30F4Rz3cWV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:39:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tqjvZBuD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tqjvZBuD; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDZWW26VRz3c63
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:36:55 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA1E161165;
 Tue, 21 Sep 2021 21:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260213;
 bh=uMj9Yoh6CUT/R5lukGLiO6qATz85EOJ3O0N05idRBV8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tqjvZBuDNE3AQUqLGvlxRWjUbryGsc68CTuppAikNFp0+iY5CWEKcYfo10PHQch8y
 zF7bEYnN9Ku7gH2P5+m1WMzCxAY0tah8ARn03fK3/7zwdv7hZUIRAGvd56KGDwX+1A
 FLhYouUVIpGN0NLIjhy0ldFdW5qYJADTkrIPJQADiOuVKzKo6FvoMPSfsXJ6HYYQCa
 UU10lGMMsEV/bH/dsNHG8i/liZZCq5kodkHCeeqdqUCXPhEEKILsQ87mky5VNJjzDY
 JD1TRcHE/MNI9QxuYDQQUCpQBv6QnU62ZFql689YBZqL/w3cTYjM6Ze8u41uYmhBa7
 DjyXKCw2De8cQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 04/16] ASoC: fsl-esai: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:35:30 +0100
Message-Id: <20210921213542.31688-4-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2755; h=from:subject;
 bh=uMj9Yoh6CUT/R5lukGLiO6qATz85EOJ3O0N05idRBV8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8V5GCkDdvG7GRD8CbzywYtb1V7yAJYV3zbSkaL
 E0KV0yeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPFQAKCRAk1otyXVSH0D5CB/
 469q8NpbuqDI/s0fQ8LN6BINyy699D7QaYxRYmegp3vWOr0XSonhQm3/EJ17cUaQzVqbzwXiXw+scc
 wA2DZ1zk+UxBkHXtLWBvTDa8VCAyhdxBmKB8ST/wWPa+P4tOdaRBgdAKWLR/TykYl460CiEj5fhkRc
 PnqZOYP5JWknor3PYKwwt3DieS3Kn1Xuf7ryqXhw2jVEd3whnEs0qgE17k1LXBWY3MLo07L934zY90
 B7e4UBwkD/aPz19j9K2wsRnJmNguCaor7YQT+pORJBLc1A6jpBkPg3c0uPewWsv/5TIU/2phnaLEFe
 0vfX34hvVTLmL+IWVbhpi2QEguB29N
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As part of moving to remove the old style defines for the bus clocks update
the fsl-esai driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_esai.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index bda66b30e063..3a9e2df4e16f 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -52,7 +52,7 @@ struct fsl_esai_soc_data {
  * @sck_rate: clock rate of desired SCKx clock
  * @hck_dir: the direction of HCKx pads
  * @sck_div: if using PSR/PM dividers for SCKx clock
- * @slave_mode: if fully using DAI slave mode
+ * @consumer_mode: if fully using DAI clock consumer mode
  * @synchronous: if using tx/rx synchronous mode
  * @name: driver name
  */
@@ -78,7 +78,7 @@ struct fsl_esai {
 	u32 sck_rate[2];
 	bool hck_dir[2];
 	bool sck_div[2];
-	bool slave_mode;
+	bool consumer_mode;
 	bool synchronous;
 	char name[32];
 };
@@ -366,8 +366,8 @@ static int fsl_esai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	u32 sub, ratio = hck_rate / freq;
 	int ret;
 
-	/* Don't apply for fully slave mode or unchanged bclk */
-	if (esai_priv->slave_mode || esai_priv->sck_rate[tx] == freq)
+	/* Don't apply for fully consumer mode or unchanged bclk */
+	if (esai_priv->consumer_mode || esai_priv->sck_rate[tx] == freq)
 		return 0;
 
 	if (ratio * freq > hck_rate)
@@ -476,20 +476,20 @@ static int fsl_esai_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	esai_priv->slave_mode = false;
+	esai_priv->consumer_mode = false;
 
-	/* DAI clock master masks */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-		esai_priv->slave_mode = true;
+	/* DAI clock provider masks */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+		esai_priv->consumer_mode = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		xccr |= ESAI_xCCR_xCKD;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		xccr |= ESAI_xCCR_xFSD;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		xccr |= ESAI_xCCR_xFSD | ESAI_xCCR_xCKD;
 		break;
 	default:
@@ -1016,8 +1016,8 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	/* Set a default slot number */
 	esai_priv->slots = 2;
 
-	/* Set a default master/slave state */
-	esai_priv->slave_mode = true;
+	/* Set a default clock provider state */
+	esai_priv->consumer_mode = true;
 
 	/* Determine the FIFO depth */
 	iprop = of_get_property(np, "fsl,fifo-depth", NULL);
-- 
2.20.1

