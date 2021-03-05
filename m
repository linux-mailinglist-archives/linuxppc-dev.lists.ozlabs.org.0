Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 403B932E4DB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 10:32:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsMw91Q0Rz3dJc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 20:32:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsMvr0wN9z2xb3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 20:32:23 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DBC7D2013FB;
 Fri,  5 Mar 2021 10:32:18 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9FCB62013FE;
 Fri,  5 Mar 2021 10:32:13 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 72E5A40249;
 Fri,  5 Mar 2021 10:32:07 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_asrc_dma: request dma channel from specific
 controller
Date: Fri,  5 Mar 2021 17:19:37 +0800
Message-Id: <1614935977-21638-1-git-send-email-shengjiu.wang@nxp.com>
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

From: Robin Gong <yibin.gong@nxp.com>

Request dma channel from specific dma controller instead of generic
dma controller list, otherwise, may get the wrong dma controller
if there are multi dma controllers such as i.MX8MP.

Signed-off-by: Robin Gong <yibin.gong@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 29f91cdecbc3..c313a26c8f95 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -141,6 +141,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	struct dma_slave_config config_fe, config_be;
 	enum asrc_pair_index index = pair->index;
 	struct device *dev = component->dev;
+	struct device_node *of_dma_node;
 	int stream = substream->stream;
 	struct imx_dma_data *tmp_data;
 	struct snd_soc_dpcm *dpcm;
@@ -231,8 +232,10 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		pair->dma_data.priority = tmp_data->priority;
 		dma_release_channel(tmp_chan);
 
+		of_dma_node = pair->dma_chan[!dir]->device->dev->of_node;
 		pair->dma_chan[dir] =
-			dma_request_channel(mask, filter, &pair->dma_data);
+			__dma_request_channel(&mask, filter, &pair->dma_data,
+					      of_dma_node);
 		pair->req_dma_chan = true;
 	} else {
 		pair->dma_chan[dir] = tmp_chan;
-- 
2.27.0

