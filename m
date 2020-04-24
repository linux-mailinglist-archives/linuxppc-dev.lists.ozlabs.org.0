Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DA51B759A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 14:42:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497v2p4KZkzDr8H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 22:42:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 497tyJ6L2mzDr3t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 22:38:45 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 875331A03CA;
 Fri, 24 Apr 2020 14:38:41 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 067471A03BE;
 Fri, 24 Apr 2020 14:38:37 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 24BD8402C7;
 Fri, 24 Apr 2020 20:38:31 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: fsl_easrc: Check NULL pinter before dereference
Date: Fri, 24 Apr 2020 20:30:04 +0800
Message-Id: <1587731404-29750-1-git-send-email-shengjiu.wang@nxp.com>
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

The patch 955ac624058f: "ASoC: fsl_easrc: Add EASRC ASoC CPU DAI
drivers" from Apr 16, 2020, leads to the following Smatch complaint:

sound/soc/fsl/fsl_easrc.c:1529 fsl_easrc_hw_free()
warn: variable dereferenced before check 'ctx' (see line 1527)

sound/soc/fsl/fsl_easrc.c
  1526          struct fsl_asrc_pair *ctx = runtime->private_data;
  1527          struct fsl_easrc_ctx_priv *ctx_priv = ctx->private;
                                                      ^^^^^
Dereference

  1528
  1529          if (ctx && (ctx_priv->ctx_streams & BIT(substream->stream))) {
                    ^^^
This check is too late, to prevent a NULL dereference.

  1530                  ctx_priv->ctx_streams &= ~BIT(substream->stream);
  1531                  fsl_easrc_release_context(ctx);

Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_easrc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 97658e1f4989..20326bffab64 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1524,9 +1524,14 @@ static int fsl_easrc_hw_free(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *ctx = runtime->private_data;
-	struct fsl_easrc_ctx_priv *ctx_priv = ctx->private;
+	struct fsl_easrc_ctx_priv *ctx_priv;
+
+	if (!ctx)
+		return -EINVAL;
+
+	ctx_priv = ctx->private;
 
-	if (ctx && (ctx_priv->ctx_streams & BIT(substream->stream))) {
+	if (ctx_priv->ctx_streams & BIT(substream->stream)) {
 		ctx_priv->ctx_streams &= ~BIT(substream->stream);
 		fsl_easrc_release_context(ctx);
 	}
-- 
2.21.0

