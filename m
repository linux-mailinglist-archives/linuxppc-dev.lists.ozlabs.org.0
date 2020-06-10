Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC431F532D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 13:29:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hlBD0T6rzDq9H
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 21:29:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hjZn4QkvzDqbg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 20:16:49 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 91C491A0447;
 Wed, 10 Jun 2020 12:16:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AE2F31A046E;
 Wed, 10 Jun 2020 12:16:38 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 4C632402F3;
 Wed, 10 Jun 2020 18:16:32 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lars@metafoo.de, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 2/3] ASoC: dmaengine_pcm: export soc_component_to_pcm
Date: Wed, 10 Jun 2020 18:05:48 +0800
Message-Id: <429c6ae1f3c5b47eb893f475d531d71cdcfe34c0.1591783089.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1591783089.git.shengjiu.wang@nxp.com>
References: <cover.1591783089.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1591783089.git.shengjiu.wang@nxp.com>
References: <cover.1591783089.git.shengjiu.wang@nxp.com>
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

In DPCM case, Front-End needs to get the dma chan which has
been requested by Back-End and reuse it.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/sound/dmaengine_pcm.h         | 11 +++++++++++
 sound/soc/soc-generic-dmaengine-pcm.c | 12 ------------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index b65220685920..8c5e38180fb0 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -161,4 +161,15 @@ int snd_dmaengine_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 
 #define SND_DMAENGINE_PCM_DRV_NAME "snd_dmaengine_pcm"
 
+struct dmaengine_pcm {
+	struct dma_chan *chan[SNDRV_PCM_STREAM_LAST + 1];
+	const struct snd_dmaengine_pcm_config *config;
+	struct snd_soc_component component;
+	unsigned int flags;
+};
+
+static inline struct dmaengine_pcm *soc_component_to_pcm(struct snd_soc_component *p)
+{
+	return container_of(p, struct dmaengine_pcm, component);
+}
 #endif
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index f728309a0833..80a4e71f2d95 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -21,18 +21,6 @@
  */
 #define SND_DMAENGINE_PCM_FLAG_NO_RESIDUE BIT(31)
 
-struct dmaengine_pcm {
-	struct dma_chan *chan[SNDRV_PCM_STREAM_LAST + 1];
-	const struct snd_dmaengine_pcm_config *config;
-	struct snd_soc_component component;
-	unsigned int flags;
-};
-
-static struct dmaengine_pcm *soc_component_to_pcm(struct snd_soc_component *p)
-{
-	return container_of(p, struct dmaengine_pcm, component);
-}
-
 static struct device *dmaengine_dma_dev(struct dmaengine_pcm *pcm,
 	struct snd_pcm_substream *substream)
 {
-- 
2.21.0

