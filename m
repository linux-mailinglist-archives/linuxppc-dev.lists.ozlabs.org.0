Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F5085EB9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 23:08:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=mzF8kEVj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg9Q70Z21z3dW4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 09:08:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=mzF8kEVj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.149.25; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=97814b2c7f=rf@opensource.cirrus.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1630 seconds by postgrey-1.37 at boromir; Thu, 22 Feb 2024 00:04:36 AEDT
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfxLr1kpqz2xFq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 00:04:34 +1100 (AEDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41LCULT3002539;
	Wed, 21 Feb 2024 06:37:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=p
	8gAJKbo8NE3otTnGNSU2ViudpzVeoRdpYMa/IBxcXg=; b=mzF8kEVjFlYchlsvH
	CWdHSP3rY9tb2NBYpXekcYSQzzzT1wjqvT92iQnjDby8TCsZ/T2Jd5294DZdcr6S
	NM32Xi9OLYRHeGQY+L2Xx8JCS/g5+JhqUxuFtfrE0UqTXYriDMhDS7+kMVvmHq44
	FDantb/WLmTqrjRgofwM6oK+Jokztr7008E7OxKxHm3lLhp4txhBa+rlYuDGES4l
	1ozSA/FFUlrFKOMS9wqMoiw4XtFnwC4REBNbK3uoDQd/wPZX3PaB5oHb7dN+dJxi
	UhlOuOk1nDEbYbbMsmC41iNoUQr1QZvHGcrWGHQ8yJdkZV8S8Eqsem5HDlUc3AiK
	Ke+Bg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wd207gxtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 06:37:12 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 12:37:10 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 21 Feb 2024 12:37:10 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 24720820241;
	Wed, 21 Feb 2024 12:37:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>
Subject: [PATCH] ASoC: soc-card: Fix missing locking in snd_soc_card_get_kcontrol()
Date: Wed, 21 Feb 2024 12:37:10 +0000
Message-ID: <20240221123710.690224-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: i7brLjb8Ucmc36s854s1B2eW7kb5tHjW
X-Proofpoint-ORIG-GUID: i7brLjb8Ucmc36s854s1B2eW7kb5tHjW
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Thu, 22 Feb 2024 09:07:37 +1100
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
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

snd_soc_card_get_kcontrol() must be holding a read lock on
card->controls_rwsem while walking the controls list.

Compare with snd_ctl_find_numid().

The existing function is renamed snd_soc_card_get_kcontrol_locked()
so that it can be called from contexts that are already holding
card->controls_rwsem (for example, control get/put functions).

There are few direct or indirect callers of
snd_soc_card_get_kcontrol(), and most are safe. Three require
changes, which have been included in this patch:

codecs/cs35l45.c:
  cs35l45_activate_ctl() is called from a control put() function so
  is changed to call snd_soc_card_get_kcontrol_locked().

codecs/cs35l56.c:
  cs35l56_sync_asp1_mixer_widgets_with_firmware() is called from
  control get()/put() functions so is changed to call
  snd_soc_card_get_kcontrol_locked().

fsl/fsl_xcvr.c:
  fsl_xcvr_activate_ctl() is called from three places, one of which
  already holds card->controls_rwsem:
  1. fsl_xcvr_mode_put(), a control put function, which will
     already be holding card->controls_rwsem.
  2. fsl_xcvr_startup(), a DAI startup function.
  3. fsl_xcvr_shutdown(), a DAI shutdown function.

  To fix this, fsl_xcvr_activate_ctl() has been changed to call
  snd_soc_card_get_kcontrol_locked() so that it is safe to call
  directly from fsl_xcvr_mode_put().
  The fsl_xcvr_startup() and fsl_xcvr_shutdown() functions have been
  changed to take a read lock on card->controls_rsem() around calls
  to fsl_xcvr_activate_ctl(). While this is not very elegant, it
  keeps the change small, to avoid this patch creating a large
  collateral churn in fsl/fsl_xcvr.c.

Analysis of other callers of snd_soc_card_get_kcontrol() is that
they do not need any changes, they are not holding card->controls_rwsem
when they call snd_soc_card_get_kcontrol().

Direct callers of snd_soc_card_get_kcontrol():
  fsl/fsl_spdif.c: fsl_spdif_dai_probe() - DAI probe function
  fsl/fsl_micfil.c: voice_detected_fn() - IRQ handler

Indirect callers via soc_component_notify_control():
  codecs/cs42l43: cs42l43_mic_shutter() - IRQ handler
  codecs/cs42l43: cs42l43_spk_shutter() - IRQ handler
  codecs/ak4118.c: ak4118_irq_handler() - IRQ handler
  codecs/wm_adsp.c: wm_adsp_write_ctl() - not currently used

Indirect callers via snd_soc_limit_volume():
  qcom/sc8280xp.c: sc8280xp_snd_init() - DAIlink init function
  ti/rx51.c: rx51_aic34_init() - DAI init function

I don't have hardware to test the fsl/*, qcom/sc828xp.c, ti/rx51.c
and ak4118.c changes.

Backport note:
The fsl/, qcom/, cs35l45, cs35l56 and cs42l43 callers were added
since the Fixes commit so won't all be present on older kernels.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 209c6cdfd283 ("ASoC: soc-card: move snd_soc_card_get_kcontrol() to soc-card")
---
It would be great if people could test the fsl/, qcom/, ti/rx51 and ak4418
drivers.
---
 include/sound/soc-card.h   |  2 ++
 sound/soc/codecs/cs35l45.c |  2 +-
 sound/soc/codecs/cs35l56.c |  2 +-
 sound/soc/fsl/fsl_xcvr.c   | 12 +++++++++++-
 sound/soc/soc-card.c       | 24 ++++++++++++++++++++++--
 5 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index ecc02e955279..1f4c39922d82 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -30,6 +30,8 @@ static inline void snd_soc_card_mutex_unlock(struct snd_soc_card *card)
 
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name);
+struct snd_kcontrol *snd_soc_card_get_kcontrol_locked(struct snd_soc_card *soc_card,
+						      const char *name);
 int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id, int type,
 			  struct snd_soc_jack *jack);
 int snd_soc_card_jack_new_pins(struct snd_soc_card *card, const char *id,
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 44c221745c3b..2392c6effed8 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -184,7 +184,7 @@ static int cs35l45_activate_ctl(struct snd_soc_component *component,
 	else
 		snprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s", ctl_name);
 
-	kcontrol = snd_soc_card_get_kcontrol(component->card, name);
+	kcontrol = snd_soc_card_get_kcontrol_locked(component->card, name);
 	if (!kcontrol) {
 		dev_err(component->dev, "Can't find kcontrol %s\n", name);
 		return -EINVAL;
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 2c1313e34cce..6dd0319bc843 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -114,7 +114,7 @@ static int cs35l56_sync_asp1_mixer_widgets_with_firmware(struct cs35l56_private
 			name = full_name;
 		}
 
-		kcontrol = snd_soc_card_get_kcontrol(dapm->card, name);
+		kcontrol = snd_soc_card_get_kcontrol_locked(dapm->card, name);
 		if (!kcontrol) {
 			dev_warn(cs35l56->base.dev, "Could not find control %s\n", name);
 			continue;
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index f0fb33d719c2..c46f64557a7f 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -174,7 +174,9 @@ static int fsl_xcvr_activate_ctl(struct snd_soc_dai *dai, const char *name,
 	struct snd_kcontrol *kctl;
 	bool enabled;
 
-	kctl = snd_soc_card_get_kcontrol(card, name);
+	lockdep_assert_held(&card->snd_card->controls_rwsem);
+
+	kctl = snd_soc_card_get_kcontrol_locked(card, name);
 	if (kctl == NULL)
 		return -ENOENT;
 
@@ -576,10 +578,14 @@ static int fsl_xcvr_startup(struct snd_pcm_substream *substream,
 	xcvr->streams |= BIT(substream->stream);
 
 	if (!xcvr->soc_data->spdif_only) {
+		struct snd_soc_card *card = dai->component->card;
+
 		/* Disable XCVR controls if there is stream started */
+		down_read(&card->snd_card->controls_rwsem);
 		fsl_xcvr_activate_ctl(dai, fsl_xcvr_mode_kctl.name, false);
 		fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name, false);
 		fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name, false);
+		up_read(&card->snd_card->controls_rwsem);
 	}
 
 	return 0;
@@ -598,11 +604,15 @@ static void fsl_xcvr_shutdown(struct snd_pcm_substream *substream,
 	/* Enable XCVR controls if there is no stream started */
 	if (!xcvr->streams) {
 		if (!xcvr->soc_data->spdif_only) {
+			struct snd_soc_card *card = dai->component->card;
+
+			down_read(&card->snd_card->controls_rwsem);
 			fsl_xcvr_activate_ctl(dai, fsl_xcvr_mode_kctl.name, true);
 			fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
 						(xcvr->mode == FSL_XCVR_MODE_ARC));
 			fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
 						(xcvr->mode == FSL_XCVR_MODE_EARC));
+			up_read(&card->snd_card->controls_rwsem);
 		}
 		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
 					 FSL_XCVR_IRQ_EARC_ALL, 0);
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 285ab4c9c716..8a2f163da6bc 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -5,6 +5,9 @@
 // Copyright (C) 2019 Renesas Electronics Corp.
 // Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 //
+
+#include <linux/lockdep.h>
+#include <linux/rwsem.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
 
@@ -26,12 +29,15 @@ static inline int _soc_card_ret(struct snd_soc_card *card,
 	return ret;
 }
 
-struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
-					       const char *name)
+struct snd_kcontrol *snd_soc_card_get_kcontrol_locked(struct snd_soc_card *soc_card,
+						      const char *name)
 {
 	struct snd_card *card = soc_card->snd_card;
 	struct snd_kcontrol *kctl;
 
+	/* must be held read or write */
+	lockdep_assert_held(&card->controls_rwsem);
+
 	if (unlikely(!name))
 		return NULL;
 
@@ -40,6 +46,20 @@ struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 			return kctl;
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(snd_soc_card_get_kcontrol_locked);
+
+struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
+					       const char *name)
+{
+	struct snd_card *card = soc_card->snd_card;
+	struct snd_kcontrol *kctl;
+
+	down_read(&card->controls_rwsem);
+	kctl = snd_soc_card_get_kcontrol_locked(soc_card, name);
+	up_read(&card->controls_rwsem);
+
+	return kctl;
+}
 EXPORT_SYMBOL_GPL(snd_soc_card_get_kcontrol);
 
 static int jack_new(struct snd_soc_card *card, const char *id, int type,
-- 
2.30.2

