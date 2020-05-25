Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4D01E09D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 11:15:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VrzQ0L3bzDqQR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 19:15:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VrxN4vBdzDqND
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 19:13:41 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0527B1A0222;
 Mon, 25 May 2020 11:13:38 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7655A1A0214;
 Mon, 25 May 2020 11:13:33 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3768F402BB;
 Mon, 25 May 2020 17:13:27 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: fsl_asrc: Fix -Wmissing-prototypes warning
Date: Mon, 25 May 2020 17:03:32 +0800
Message-Id: <1590397412-12966-1-git-send-email-shengjiu.wang@nxp.com>
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

From: shengjiu wang <shengjiu.wang@nxp.com>

COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64

sound/soc/fsl/fsl_asrc.c:557:18: warning: no previous prototype for function 'fsl_asrc_get_dma_channel' [-Wmissing-prototypes]
struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair, bool dir)
                 ^
sound/soc/fsl/fsl_asrc.c:557:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair, bool dir)
^
static

Fixes: be7bd03f0201 ("ASoC: fsl_asrc: Move common definition to fsl_asrc_common")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: shengjiu wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 7e2d598ffb81..d79d2c7f8d36 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -554,7 +554,8 @@ static void fsl_asrc_stop_pair(struct fsl_asrc_pair *pair)
 /**
  * Get DMA channel according to the pair and direction.
  */
-struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair, bool dir)
+static struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair,
+						 bool dir)
 {
 	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
@@ -564,7 +565,6 @@ struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair, bool dir)
 
 	return dma_request_slave_channel(&asrc->pdev->dev, name);
 }
-EXPORT_SYMBOL_GPL(fsl_asrc_get_dma_channel);
 
 static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
-- 
2.21.0

