Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1257A5F50
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 12:19:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rqd1s2vvyz3cRg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 20:19:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rqd1J2Z4dz2yW4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 20:18:59 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A9A191A07B0;
	Tue, 19 Sep 2023 12:18:55 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 72F7A1A0313;
	Tue, 19 Sep 2023 12:18:55 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E62CA1820F58;
	Tue, 19 Sep 2023 18:18:53 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	matuszpd@gmail.com
Subject: [PATCH] ASoC: fsl_sai: Don't disable bitclock for i.MX8MP
Date: Tue, 19 Sep 2023 17:42:13 +0800
Message-Id: <1695116533-23287-1-git-send-email-shengjiu.wang@nxp.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On i.MX8MP, the BCE and TERE bit are binding with mclk
enablement, if BCE and TERE are cleared the MCLK also be
disabled on output pin, that cause the external codec (wm8960)
in wrong state.

Codec (wm8960) is using the mclk to generate PLL clock,
if mclk is disabled before disabling PLL, the codec (wm8960)
won't generate bclk and frameclk when sysclk switch to
MCLK source in next test case.

The test case:
$aplay -r44100 test1.wav (PLL source)
$aplay -r48000 test2.wav (MCLK source)
aplay: pcm_write:2127: write error: Input/output error

Fixes: 269f399dc19f ("ASoC: fsl_sai: Disable bit clock with transmitter")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 1e4020fae05a..8a9a30dd31e2 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -710,10 +710,15 @@ static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 {
 	unsigned int ofs = sai->soc_data->reg_offset;
 	bool tx = dir == TX;
-	u32 xcsr, count = 100;
+	u32 xcsr, count = 100, mask;
+
+	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output)
+		mask = FSL_SAI_CSR_TERE;
+	else
+		mask = FSL_SAI_CSR_TERE | FSL_SAI_CSR_BCE;
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
-			   FSL_SAI_CSR_TERE | FSL_SAI_CSR_BCE, 0);
+			   mask, 0);
 
 	/* TERE will remain set till the end of current frame */
 	do {
-- 
2.34.1

