Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 456E033D138
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 10:55:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F07vv1RRXz30hX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 20:55:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F07vZ5j8Nz2xYr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 20:55:37 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A33FD1A3FC1;
 Tue, 16 Mar 2021 10:55:35 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CDA631A3FAB;
 Tue, 16 Mar 2021 10:55:29 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A0B3340291;
 Tue, 16 Mar 2021 10:55:22 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_spdif: use snd_ctl_boolean_mono_info
Date: Tue, 16 Mar 2021 17:42:16 +0800
Message-Id: <1615887736-31217-1-git-send-email-shengjiu.wang@nxp.com>
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

From: Viorel Suman <viorel.suman@nxp.com>

Remove redundant code and use snd_ctl_boolean_mono_info
instead.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 30 +++---------------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 174e558224d8..1cd3441d1c03 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -801,18 +801,6 @@ static int fsl_spdif_qget(struct snd_kcontrol *kcontrol,
 	return ret;
 }
 
-/* Valid bit information */
-static int fsl_spdif_vbit_info(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_info *uinfo)
-{
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
-	uinfo->count = 1;
-	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = 1;
-
-	return 0;
-}
-
 /* Get valid good bit from interrupt status register */
 static int fsl_spdif_rx_vbit_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
@@ -925,18 +913,6 @@ static int fsl_spdif_rxrate_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-/* User bit sync mode info */
-static int fsl_spdif_usync_info(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_info *uinfo)
-{
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
-	uinfo->count = 1;
-	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = 1;
-
-	return 0;
-}
-
 /*
  * User bit sync mode:
  * 1 CD User channel subcode
@@ -1018,7 +994,7 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
 		.name = "IEC958 RX V-Bit Errors",
 		.access = SNDRV_CTL_ELEM_ACCESS_READ |
 			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
-		.info = fsl_spdif_vbit_info,
+		.info = snd_ctl_boolean_mono_info,
 		.get = fsl_spdif_rx_vbit_get,
 	},
 	{
@@ -1027,7 +1003,7 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
 		.access = SNDRV_CTL_ELEM_ACCESS_READ |
 			SNDRV_CTL_ELEM_ACCESS_WRITE |
 			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
-		.info = fsl_spdif_vbit_info,
+		.info = snd_ctl_boolean_mono_info,
 		.get = fsl_spdif_tx_vbit_get,
 		.put = fsl_spdif_tx_vbit_put,
 	},
@@ -1047,7 +1023,7 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
 		.access = SNDRV_CTL_ELEM_ACCESS_READ |
 			SNDRV_CTL_ELEM_ACCESS_WRITE |
 			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
-		.info = fsl_spdif_usync_info,
+		.info = snd_ctl_boolean_mono_info,
 		.get = fsl_spdif_usync_get,
 		.put = fsl_spdif_usync_put,
 	},
-- 
2.27.0

