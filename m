Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 508999F9C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 07:23:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JDfF1zykzDr5Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 15:23:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JDcT5HwBzDqtp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 15:21:26 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D581C200274;
 Wed, 28 Aug 2019 07:21:21 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 595BD2001A9;
 Wed, 28 Aug 2019 07:21:16 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 65E74402C0;
 Wed, 28 Aug 2019 13:21:09 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_ssi: Fix clock control issue in master mode
Date: Wed, 28 Aug 2019 13:20:17 -0400
Message-Id: <1567012817-12625-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The test case is
arecord -Dhw:0 -d 10 -f S16_LE -r 48000 -c 2 temp.wav &
aplay -Dhw:0 -d 30 -f S16_LE -r 48000 -c 2 test.wav

There will be error after end of arecord:
aplay: pcm_write:2051: write error: Input/output error

Capture and Playback work in parallel in master mode, one
substream stops, the other substream is impacted, the
reason is that clock is disabled wrongly.

The clock's reference count is not increased when second
substream starts, the hw_param() function returns in the
beginning because first substream is enabled, then in end
of first substream, the hw_free() disables the clock.

This patch is to move the clock enablement to the place
before checking of the device enablement in hw_param().

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_ssi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index b0a6fead1a6a..537dc69256f0 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -799,15 +799,6 @@ static int fsl_ssi_hw_params(struct snd_pcm_substream *substream,
 	u32 wl = SSI_SxCCR_WL(sample_size);
 	int ret;
 
-	/*
-	 * SSI is properly configured if it is enabled and running in
-	 * the synchronous mode; Note that AC97 mode is an exception
-	 * that should set separate configurations for STCCR and SRCCR
-	 * despite running in the synchronous mode.
-	 */
-	if (ssi->streams && ssi->synchronous)
-		return 0;
-
 	if (fsl_ssi_is_i2s_master(ssi)) {
 		ret = fsl_ssi_set_bclk(substream, dai, hw_params);
 		if (ret)
@@ -823,6 +814,15 @@ static int fsl_ssi_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
+	/*
+	 * SSI is properly configured if it is enabled and running in
+	 * the synchronous mode; Note that AC97 mode is an exception
+	 * that should set separate configurations for STCCR and SRCCR
+	 * despite running in the synchronous mode.
+	 */
+	if (ssi->streams && ssi->synchronous)
+		return 0;
+
 	if (!fsl_ssi_is_ac97(ssi)) {
 		/*
 		 * Keep the ssi->i2s_net intact while having a local variable
-- 
2.21.0

