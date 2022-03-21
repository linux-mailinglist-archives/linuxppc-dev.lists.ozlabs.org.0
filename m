Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3474E20D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 08:00:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMQVh2tBQz30PK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 18:00:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=uniontech.com (client-ip=113.96.223.73; helo=qq.com;
 envelope-from=tangmeng@uniontech.com; receiver=<UNKNOWN>)
X-Greylist: delayed 75 seconds by postgrey-1.36 at boromir;
 Mon, 21 Mar 2022 18:00:02 AEDT
Received: from qq.com (smtpbg411.qq.com [113.96.223.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMQVB4jX7z2xm1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 18:00:01 +1100 (AEDT)
X-QQ-mid: bizesmtp82t1647845884t804rf5r
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 21 Mar 2022 14:57:57 +0800 (CST)
X-QQ-SSF: 01400000002000D0I000000A0000000
X-QQ-FEAT: geCjBjpTnm5MCuhbl7WYFcVXtSlLYe9nC1Ht/79OMySzfSxUeFWMlEVlP+knM
 OezqIH5y7A/rfELeaajZVCAAx4GrtoyySSDJmz7ddbkXeiUfWifuSxk/Bi9creqz6xIm/Jm
 Uu2MMJxb28nTNTn8X70dH7T5IYaZk9lBtgzED1Ka/XyEVb6eqQN4t7L914gqT01Yzk7hw6r
 S42MAr0xF076OqnTq2umNB9bzMI1NIMvSfWdJKMDjmiBsRMEX2aW1VC38gydlWoIJsYmYQF
 6CJjxuUTdWSnPaojt+XOZgN7dpg0tmUTH+g0KM/fHg9zn9nAyVwFJkrsz/DshH06pVsMVOZ
 8lJ+UsPbx8dPh1DVoEcN2sD3aXON/Z9fhYrV5we
X-QQ-GoodBg: 1
From: Meng Tang <tangmeng@uniontech.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2] ASoC: fsl-asoc-card: Fix jack_event() always return 0
Date: Mon, 21 Mar 2022 14:57:54 +0800
Message-Id: <20220321065754.18307-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign8
X-QQ-Bgrelay: 1
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

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 370bc790c6ba..d9a0d4768c4d 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -462,11 +462,9 @@ static int hp_jack_event(struct notifier_block *nb, unsigned long event,
 
 	if (event & SND_JACK_HEADPHONE)
 		/* Disable speaker if headphone is plugged in */
-		snd_soc_dapm_disable_pin(dapm, "Ext Spk");
+		return snd_soc_dapm_disable_pin(dapm, "Ext Spk");
 	else
-		snd_soc_dapm_enable_pin(dapm, "Ext Spk");
-
-	return 0;
+		return snd_soc_dapm_enable_pin(dapm, "Ext Spk");
 }
 
 static struct notifier_block hp_jack_nb = {
@@ -481,11 +479,9 @@ static int mic_jack_event(struct notifier_block *nb, unsigned long event,
 
 	if (event & SND_JACK_MICROPHONE)
 		/* Disable dmic if microphone is plugged in */
-		snd_soc_dapm_disable_pin(dapm, "DMIC");
+		return snd_soc_dapm_disable_pin(dapm, "DMIC");
 	else
-		snd_soc_dapm_enable_pin(dapm, "DMIC");
-
-	return 0;
+		return snd_soc_dapm_enable_pin(dapm, "DMIC");
 }
 
 static struct notifier_block mic_jack_nb = {
-- 
2.20.1



