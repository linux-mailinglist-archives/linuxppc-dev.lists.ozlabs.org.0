Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F04E1FA694
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 05:06:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mClb1PWtzDqnn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 13:06:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mCjj62wnzDqhl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 13:04:56 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E0AF81A0547;
 Tue, 16 Jun 2020 05:04:53 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B6E321A053B;
 Tue, 16 Jun 2020 05:04:49 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 4B8E8402D0;
 Tue, 16 Jun 2020 11:04:44 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH v3] ASoC: fsl_ssi: Fix bclk calculation for mono channel
Date: Tue, 16 Jun 2020 10:53:48 +0800
Message-Id: <034eff1435ff6ce300b6c781130cefd9db22ab9a.1592276147.git.shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For mono channel, SSI will switch to Normal mode.

In Normal mode and Network mode, the Word Length Control bits
control the word length divider in clock generator, which is
different with I2S Master mode (the word length is fixed to
32bit), it should be the value of params_width(hw_params).

The condition "slots == 2" is not good for I2S Master mode,
because for Network mode and Normal mode, the slots can also
be 2. Then we need to use (ssi->i2s_net & SSI_SCR_I2S_MODE_MASK)
to check if it is I2S Master mode.

So we refine the formula for mono channel, otherwise there
will be sound issue for S24_LE.

Fixes: b0a7043d5c2c ("ASoC: fsl_ssi: Caculate bit clock rate using slot number and width")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v3
- update according to Nicolin's comments

changes in v2
- refine patch for Network mode and Normal mode.

 sound/soc/fsl/fsl_ssi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index bad89b0d129e..1a2fa7f18142 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -678,8 +678,9 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
 	struct regmap *regs = ssi->regs;
 	u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
 	unsigned long clkrate, baudrate, tmprate;
-	unsigned int slots = params_channels(hw_params);
-	unsigned int slot_width = 32;
+	unsigned int channels = params_channels(hw_params);
+	unsigned int slot_width = params_width(hw_params);
+	unsigned int slots = 2;
 	u64 sub, savesub = 100000;
 	unsigned int freq;
 	bool baudclk_is_used;
@@ -688,10 +689,14 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
 	/* Override slots and slot_width if being specifically set... */
 	if (ssi->slots)
 		slots = ssi->slots;
-	/* ...but keep 32 bits if slots is 2 -- I2S Master mode */
-	if (ssi->slot_width && slots != 2)
+	if (ssi->slot_width)
 		slot_width = ssi->slot_width;
 
+	/* ...but force 32 bits for stereo audio using I2S Master Mode */
+	if (channels == 2 &&
+	    (ssi->i2s_net & SSI_SCR_I2S_MODE_MASK) == SSI_SCR_I2S_MODE_MASTER)
+		slot_width = 32;
+
 	/* Generate bit clock based on the slot number and slot width */
 	freq = slots * slot_width * params_rate(hw_params);
 
-- 
2.21.0

