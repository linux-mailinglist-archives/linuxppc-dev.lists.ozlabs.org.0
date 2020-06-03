Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B67641EC80B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 05:52:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cFNc2h7qzDqWs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 13:52:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cFL32cq9zDqWR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 13:50:18 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0561A200CE0;
 Wed,  3 Jun 2020 05:50:15 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4DA95200CDB;
 Wed,  3 Jun 2020 05:50:10 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 6D883402B1;
 Wed,  3 Jun 2020 11:50:04 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 1/3] ASoC: fsl_easrc: Fix -Wmissing-prototypes warning
Date: Wed,  3 Jun 2020 11:39:39 +0800
Message-Id: <ab1b83a56c71f4159a98e6da5602c2c36fe59f4d.1591155860.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1591155860.git.shengjiu.wang@nxp.com>
References: <cover.1591155860.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1591155860.git.shengjiu.wang@nxp.com>
References: <cover.1591155860.git.shengjiu.wang@nxp.com>
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

Obtained with:
$ make W=1

sound/soc/fsl/fsl_easrc.c:967:5: warning: no previous prototype for function 'fsl_easrc_config_context' [-Wmissing-prototypes]
int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
    ^
sound/soc/fsl/fsl_easrc.c:967:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
^
static
sound/soc/fsl/fsl_easrc.c:1128:5: warning: no previous prototype for function 'fsl_easrc_set_ctx_format' [-Wmissing-prototypes]
int fsl_easrc_set_ctx_format(struct fsl_asrc_pair *ctx,
    ^
sound/soc/fsl/fsl_easrc.c:1128:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
int fsl_easrc_set_ctx_format(struct fsl_asrc_pair *ctx,
^
static
sound/soc/fsl/fsl_easrc.c:1201:5: warning: no previous prototype for function 'fsl_easrc_set_ctx_organziation' [-Wmissing-prototypes]
int fsl_easrc_set_ctx_organziation(struct fsl_asrc_pair *ctx)
    ^
sound/soc/fsl/fsl_easrc.c:1201:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
int fsl_easrc_set_ctx_organziation(struct fsl_asrc_pair *ctx)
^
static
sound/soc/fsl/fsl_easrc.c:1245:5: warning: no previous prototype for function 'fsl_easrc_request_context' [-Wmissing-prototypes]
int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
    ^
sound/soc/fsl/fsl_easrc.c:1245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
^
static
sound/soc/fsl/fsl_easrc.c:1290:6: warning: no previous prototype for function 'fsl_easrc_release_context' [-Wmissing-prototypes]
void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
     ^
sound/soc/fsl/fsl_easrc.c:1290:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
^
static
sound/soc/fsl/fsl_easrc.c:1317:5: warning: no previous prototype for function 'fsl_easrc_start_context' [-Wmissing-prototypes]
int fsl_easrc_start_context(struct fsl_asrc_pair *ctx)
    ^
sound/soc/fsl/fsl_easrc.c:1317:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
int fsl_easrc_start_context(struct fsl_asrc_pair *ctx)
^
static
sound/soc/fsl/fsl_easrc.c:1335:5: warning: no previous prototype for function 'fsl_easrc_stop_context' [-Wmissing-prototypes]
int fsl_easrc_stop_context(struct fsl_asrc_pair *ctx)
    ^
sound/soc/fsl/fsl_easrc.c:1335:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
int fsl_easrc_stop_context(struct fsl_asrc_pair *ctx)
^
static
sound/soc/fsl/fsl_easrc.c:1382:18: warning: no previous prototype for function 'fsl_easrc_get_dma_channel' [-Wmissing-prototypes]
struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_asrc_pair *ctx,
                 ^
sound/soc/fsl/fsl_easrc.c:1382:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_asrc_pair *ctx,
^
static

Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reported-by: kbuild test robot <lkp@intel.com>
---
 sound/soc/fsl/fsl_easrc.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index c6b5eb2d2af7..f227308a50e2 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -964,7 +964,7 @@ static int fsl_easrc_release_slot(struct fsl_asrc *easrc, unsigned int ctx_id)
  *
  * Configure the register relate with context.
  */
-int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
+static int fsl_easrc_config_context(struct fsl_asrc *easrc, unsigned int ctx_id)
 {
 	struct fsl_easrc_ctx_priv *ctx_priv;
 	struct fsl_asrc_pair *ctx;
@@ -1125,9 +1125,9 @@ static int fsl_easrc_process_format(struct fsl_asrc_pair *ctx,
 	return 0;
 }
 
-int fsl_easrc_set_ctx_format(struct fsl_asrc_pair *ctx,
-			     snd_pcm_format_t *in_raw_format,
-			     snd_pcm_format_t *out_raw_format)
+static int fsl_easrc_set_ctx_format(struct fsl_asrc_pair *ctx,
+				    snd_pcm_format_t *in_raw_format,
+				    snd_pcm_format_t *out_raw_format)
 {
 	struct fsl_asrc *easrc = ctx->asrc;
 	struct fsl_easrc_ctx_priv *ctx_priv = ctx->private;
@@ -1198,7 +1198,7 @@ int fsl_easrc_set_ctx_format(struct fsl_asrc_pair *ctx,
  * to conform with this format. Interleaving parameters are accessed
  * through the ASRC_CTRL_IN_ACCESSa and ASRC_CTRL_OUT_ACCESSa registers
  */
-int fsl_easrc_set_ctx_organziation(struct fsl_asrc_pair *ctx)
+static int fsl_easrc_set_ctx_organziation(struct fsl_asrc_pair *ctx)
 {
 	struct fsl_easrc_ctx_priv *ctx_priv;
 	struct device *dev;
@@ -1242,7 +1242,7 @@ int fsl_easrc_set_ctx_organziation(struct fsl_asrc_pair *ctx)
  * Returns a negative number on error and >=0 as context id
  * on success
  */
-int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
+static int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
 {
 	enum asrc_pair_index index = ASRC_INVALID_PAIR;
 	struct fsl_asrc *easrc = ctx->asrc;
@@ -1287,7 +1287,7 @@ int fsl_easrc_request_context(int channels, struct fsl_asrc_pair *ctx)
  *
  * This funciton is mainly doing the revert thing in request context
  */
-void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
+static void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
 {
 	unsigned long lock_flags;
 	struct fsl_asrc *easrc;
@@ -1314,7 +1314,7 @@ void fsl_easrc_release_context(struct fsl_asrc_pair *ctx)
  *
  * Enable the DMA request and context
  */
-int fsl_easrc_start_context(struct fsl_asrc_pair *ctx)
+static int fsl_easrc_start_context(struct fsl_asrc_pair *ctx)
 {
 	struct fsl_asrc *easrc = ctx->asrc;
 
@@ -1332,7 +1332,7 @@ int fsl_easrc_start_context(struct fsl_asrc_pair *ctx)
  *
  * Disable the DMA request and context
  */
-int fsl_easrc_stop_context(struct fsl_asrc_pair *ctx)
+static int fsl_easrc_stop_context(struct fsl_asrc_pair *ctx)
 {
 	struct fsl_asrc *easrc = ctx->asrc;
 	int val, i;
@@ -1379,8 +1379,8 @@ int fsl_easrc_stop_context(struct fsl_asrc_pair *ctx)
 	return 0;
 }
 
-struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_asrc_pair *ctx,
-					   bool dir)
+static struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_asrc_pair *ctx,
+						  bool dir)
 {
 	struct fsl_asrc *easrc = ctx->asrc;
 	enum asrc_pair_index index = ctx->index;
@@ -1391,7 +1391,6 @@ struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_asrc_pair *ctx,
 
 	return dma_request_slave_channel(&easrc->pdev->dev, name);
 };
-EXPORT_SYMBOL_GPL(fsl_easrc_get_dma_channel);
 
 static const unsigned int easrc_rates[] = {
 	8000, 11025, 12000, 16000,
-- 
2.21.0

