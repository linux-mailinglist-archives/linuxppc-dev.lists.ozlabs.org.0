Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A744DE3A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 22:45:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKyH21F9gz3bW0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 08:45:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=uniontech.com (client-ip=59.36.132.32; helo=qq.com;
 envelope-from=tangmeng@uniontech.com; receiver=<UNKNOWN>)
X-Greylist: delayed 68 seconds by postgrey-1.36 at boromir;
 Fri, 18 Mar 2022 20:37:46 AEDT
Received: from qq.com (smtpbg464.qq.com [59.36.132.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKf7Z4GZzz30Dv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 20:37:43 +1100 (AEDT)
X-QQ-mid: bizesmtp86t1647596144tkbrhvl5
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 18 Mar 2022 17:35:38 +0800 (CST)
X-QQ-SSF: 01400000002000D0I000000A0000000
X-QQ-FEAT: 1vYwxPNStGlVdhmjjLS+53k4INM9GjyQdIqJJMrCR+pb1LYHnR4/aqzBpqnWV
 ueiDrL0E4KPMqka9Lw7vwy/XCn///iYN9ih43KoU1HwOdjHxGQIEN6LgBHLEH0JECrFK3RL
 dGoMa4fMbFbetSbqw9V3WYJ9vtrhXmaYvIT6xqaTpLjUrsNCQhdzovFEa9Am1JbwsavFN3I
 833ohGKSAeYcDIcL0P5znSvBEEv2dCuaM2FoXncuRXVRlhkz3VGYI4LgjDsC9HsX3BmImBq
 YmeEnOeyGTxMf8Tpa7w+ainnytBx8VUOd0FhSPjKdSY4LLosOXXR89lldHfzWvtuCgakdck
 KYQKGSYEzaMKyeG99h+MoSuQOYqVPN6f04H7YKy7alSwSm1HKk=
X-QQ-GoodBg: 1
From: Meng Tang <tangmeng@uniontech.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: fsl-asoc-card: Fix jack_event() always return 0
Date: Fri, 18 Mar 2022 17:35:36 +0800
Message-Id: <20220318093536.15385-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign4
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Sat, 19 Mar 2022 08:45:00 +1100
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
Cc: Meng Tang <tangmeng@uniontech.com>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Today, hp_jack_event and mic_jack_event always return 0. However,
snd_soc_dapm_disable_pin and snd_soc_dapm_enable_pin may return a
non-zero value, this will cause the user who calling hp_jack_event
and mic_jack_event don't know whether the operation was really
successfully.

This patch corrects the behavior by properly returning 1 when the
value gets updated.

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 370bc790c6ba..f2641c2cb047 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -457,16 +457,18 @@ static int fsl_asoc_card_audmux_init(struct device_node *np,
 static int hp_jack_event(struct notifier_block *nb, unsigned long event,
 			 void *data)
 {
+	int ret;
+
 	struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
 	struct snd_soc_dapm_context *dapm = &jack->card->dapm;
 
 	if (event & SND_JACK_HEADPHONE)
 		/* Disable speaker if headphone is plugged in */
-		snd_soc_dapm_disable_pin(dapm, "Ext Spk");
+		ret = snd_soc_dapm_disable_pin(dapm, "Ext Spk");
 	else
-		snd_soc_dapm_enable_pin(dapm, "Ext Spk");
+		ret = snd_soc_dapm_enable_pin(dapm, "Ext Spk");
 
-	return 0;
+	return ret;
 }
 
 static struct notifier_block hp_jack_nb = {
@@ -476,16 +478,18 @@ static struct notifier_block hp_jack_nb = {
 static int mic_jack_event(struct notifier_block *nb, unsigned long event,
 			  void *data)
 {
+	int ret;
+
 	struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
 	struct snd_soc_dapm_context *dapm = &jack->card->dapm;
 
 	if (event & SND_JACK_MICROPHONE)
 		/* Disable dmic if microphone is plugged in */
-		snd_soc_dapm_disable_pin(dapm, "DMIC");
+		ret = snd_soc_dapm_disable_pin(dapm, "DMIC");
 	else
-		snd_soc_dapm_enable_pin(dapm, "DMIC");
+		ret = snd_soc_dapm_enable_pin(dapm, "DMIC");
 
-	return 0;
+	return ret;
 }
 
 static struct notifier_block mic_jack_nb = {
-- 
2.20.1



