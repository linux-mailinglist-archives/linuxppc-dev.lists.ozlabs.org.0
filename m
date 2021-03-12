Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 514EC338413
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 03:54:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxVlJ2WxYz3dGS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 13:54:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxVl01qnMz3cJG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 13:54:03 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C64161A04A3;
 Fri, 12 Mar 2021 03:54:00 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 25C841A04A5;
 Fri, 12 Mar 2021 03:53:54 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 560E74029B;
 Fri, 12 Mar 2021 03:53:45 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 1/6] ASoC: soc-component: Add snd_soc_pcm_component_ack
Date: Fri, 12 Mar 2021 10:38:40 +0800
Message-Id: <1615516725-4975-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615516725-4975-1-git-send-email-shengjiu.wang@nxp.com>
References: <1615516725-4975-1-git-send-email-shengjiu.wang@nxp.com>
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

Add snd_soc_pcm_component_ack back, which can be used to get an
updated buffer pointer in the platform driver.
On Asymmetric multiprocessor, this pointer can be sent to Cortex-M
core for audio processing.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/sound/soc-component.h |  3 +++
 sound/soc/soc-component.c     | 14 ++++++++++++++
 sound/soc/soc-pcm.c           |  2 ++
 3 files changed, 19 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 7dc75b39287f..722cfab28d29 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -146,6 +146,8 @@ struct snd_soc_component_driver {
 	int (*mmap)(struct snd_soc_component *component,
 		    struct snd_pcm_substream *substream,
 		    struct vm_area_struct *vma);
+	int (*ack)(struct snd_soc_component *component,
+		   struct snd_pcm_substream *substream);
 
 	const struct snd_compress_ops *compress_ops;
 
@@ -498,5 +500,6 @@ int snd_soc_pcm_component_pm_runtime_get(struct snd_soc_pcm_runtime *rtd,
 					 void *stream);
 void snd_soc_pcm_component_pm_runtime_put(struct snd_soc_pcm_runtime *rtd,
 					  void *stream, int rollback);
+int snd_soc_pcm_component_ack(struct snd_pcm_substream *substream);
 
 #endif /* __SOC_COMPONENT_H */
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 8415e9bd2932..3a5e84e16a87 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1212,3 +1212,17 @@ void snd_soc_pcm_component_pm_runtime_put(struct snd_soc_pcm_runtime *rtd,
 		soc_component_mark_pop(component, stream, pm);
 	}
 }
+
+int snd_soc_pcm_component_ack(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_component *component;
+	int i;
+
+	/* FIXME: use 1st pointer */
+	for_each_rtd_components(rtd, i, component)
+		if (component->driver->ack)
+			return component->driver->ack(component, substream);
+
+	return 0;
+}
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ba8ffbf8a5d3..e75b404a9f36 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2826,6 +2826,8 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 			rtd->ops.page		= snd_soc_pcm_component_page;
 		if (drv->mmap)
 			rtd->ops.mmap		= snd_soc_pcm_component_mmap;
+		if (drv->ack)
+			rtd->ops.ack            = snd_soc_pcm_component_ack;
 	}
 
 	if (playback)
-- 
2.27.0

