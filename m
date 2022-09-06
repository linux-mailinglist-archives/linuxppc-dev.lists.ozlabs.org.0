Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9DA5AE08B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 09:07:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMGgD34VZz3c6P
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 17:07:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMGfm0b4mz2yJ5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 17:07:26 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3613420331C;
	Tue,  6 Sep 2022 09:07:23 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 00046203310;
	Tue,  6 Sep 2022 09:07:22 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2B1B2180031F;
	Tue,  6 Sep 2022 15:07:21 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	shengjiu.wang@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ASoC: fsl_audmix: make clock and output src write only"
Date: Tue,  6 Sep 2022 14:49:21 +0800
Message-Id: <1662446961-20799-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 944c517b8c838832a166f1c89afbf8724f4a6b49.

There is error after making clock and output src write only

$amixer -c imxaudmix cset numid=1 1
amixer: Cannot read the given element from control sysdefault:3

Which is worse than before, so let's revert the change.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_audmix.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 43857b7a81c9..672148dd4b23 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -199,18 +199,10 @@ static int fsl_audmix_put_out_src(struct snd_kcontrol *kcontrol,
 
 static const struct snd_kcontrol_new fsl_audmix_snd_controls[] = {
 	/* FSL_AUDMIX_CTR controls */
-	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-		.name = "Mixing Clock Source",
-		.info = snd_soc_info_enum_double,
-		.access = SNDRV_CTL_ELEM_ACCESS_WRITE,
-		.put = fsl_audmix_put_mix_clk_src,
-		.private_value = (unsigned long)&fsl_audmix_enum[0] },
-	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-		.name = "Output Source",
-		.info = snd_soc_info_enum_double,
-		.access = SNDRV_CTL_ELEM_ACCESS_WRITE,
-		.put = fsl_audmix_put_out_src,
-		.private_value = (unsigned long)&fsl_audmix_enum[1] },
+	SOC_ENUM_EXT("Mixing Clock Source", fsl_audmix_enum[0],
+		     snd_soc_get_enum_double, fsl_audmix_put_mix_clk_src),
+	SOC_ENUM_EXT("Output Source", fsl_audmix_enum[1],
+		     snd_soc_get_enum_double, fsl_audmix_put_out_src),
 	SOC_ENUM("Output Width", fsl_audmix_enum[2]),
 	SOC_ENUM("Frame Rate Diff Error", fsl_audmix_enum[3]),
 	SOC_ENUM("Clock Freq Diff Error", fsl_audmix_enum[4]),
-- 
2.34.1

