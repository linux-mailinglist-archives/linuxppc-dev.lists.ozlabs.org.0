Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D91D913E1B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 17:51:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z9Ff5RsfzDqZw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 03:51:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=CCjhhJoc; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z9BB3wd5zDqWH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 03:48:34 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F579217F4;
 Thu, 16 Jan 2020 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193312;
 bh=Eb4Vx2wML0CMCDuQwZW50JnG/4Jh8yN2N0fN2PjlhQE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CCjhhJoco2webzQpPlRQGrX/KPBcVI5f9M1cXZSQLRKWX1rcQ2Mic/FceHLa0M533
 ZXVU2Hw9Cb06silmEQ96m/pP7DwLVIyjEd3oT/+bsi1x6rJR1HvM9fkplG7UBTGDyz
 BOF4sOkVUjKOdMdy35nuISTRoKZoovhzveCYViBY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 072/205] ASoC: fsl_esai: Add spin lock to protect
 reset, stop and start
Date: Thu, 16 Jan 2020 11:40:47 -0500
Message-Id: <20200116164300.6705-72-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit 35dac627471938eda89fa39ee4ead1f7667e0f57 ]

xrun may happen at the end of stream, the
trigger->fsl_esai_trigger_stop maybe called in the middle of
fsl_esai_hw_reset, this may cause esai in wrong state
after stop, and there may be endless xrun interrupt.

This issue may also happen with trigger->fsl_esai_trigger_start.

So Add spin lock to lock those functions.

Fixes: 7ccafa2b3879 ("ASoC: fsl_esai: recover the channel swap after xrun")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/52e92c4221a83e39a84a6cd92fc3d5479b44894c.1572252321.git.shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_esai.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index a78e4ab478df..c7a49d03463a 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -33,6 +33,7 @@
  * @fsysclk: system clock source to derive HCK, SCK and FS
  * @spbaclk: SPBA clock (optional, depending on SoC design)
  * @task: tasklet to handle the reset operation
+ * @lock: spin lock between hw_reset() and trigger()
  * @fifo_depth: depth of tx/rx FIFO
  * @slot_width: width of each DAI slot
  * @slots: number of slots
@@ -56,6 +57,7 @@ struct fsl_esai {
 	struct clk *fsysclk;
 	struct clk *spbaclk;
 	struct tasklet_struct task;
+	spinlock_t lock; /* Protect hw_reset and trigger */
 	u32 fifo_depth;
 	u32 slot_width;
 	u32 slots;
@@ -676,8 +678,10 @@ static void fsl_esai_hw_reset(unsigned long arg)
 {
 	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
 	bool tx = true, rx = false, enabled[2];
+	unsigned long lock_flags;
 	u32 tfcr, rfcr;
 
+	spin_lock_irqsave(&esai_priv->lock, lock_flags);
 	/* Save the registers */
 	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
 	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
@@ -715,6 +719,8 @@ static void fsl_esai_hw_reset(unsigned long arg)
 		fsl_esai_trigger_start(esai_priv, tx);
 	if (enabled[rx])
 		fsl_esai_trigger_start(esai_priv, rx);
+
+	spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
 }
 
 static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
@@ -722,6 +728,7 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	unsigned long lock_flags;
 
 	esai_priv->channels[tx] = substream->runtime->channels;
 
@@ -729,12 +736,16 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		spin_lock_irqsave(&esai_priv->lock, lock_flags);
 		fsl_esai_trigger_start(esai_priv, tx);
+		spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		spin_lock_irqsave(&esai_priv->lock, lock_flags);
 		fsl_esai_trigger_stop(esai_priv, tx);
+		spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
 		break;
 	default:
 		return -EINVAL;
@@ -1002,6 +1013,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, esai_priv);
 
+	spin_lock_init(&esai_priv->lock);
 	ret = fsl_esai_hw_init(esai_priv);
 	if (ret)
 		return ret;
-- 
2.20.1

