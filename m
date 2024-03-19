Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3353F87F9B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:27:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPx16pBvz77bV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:27:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPV632d1z3vcr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:07:58 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 355C720136F;
	Tue, 19 Mar 2024 09:07:55 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F0A7D201364;
	Tue, 19 Mar 2024 09:07:54 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E5F011820F76;
	Tue, 19 Mar 2024 16:07:52 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: hverkuil@xs4all.nl,
	sakari.ailus@iki.fi,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v15 04/16] ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
Date: Tue, 19 Mar 2024 15:51:02 +0800
Message-Id: <1710834674-3285-5-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
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

Move fsl_asrc_common.h to include/sound that it can be
included from other drivers.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 {sound/soc/fsl => include/sound}/fsl_asrc_common.h | 0
 sound/soc/fsl/fsl_asrc.h                           | 2 +-
 sound/soc/fsl/fsl_asrc_dma.c                       | 2 +-
 sound/soc/fsl/fsl_easrc.h                          | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename {sound/soc/fsl => include/sound}/fsl_asrc_common.h (100%)

diff --git a/sound/soc/fsl/fsl_asrc_common.h b/include/sound/fsl_asrc_common.h
similarity index 100%
rename from sound/soc/fsl/fsl_asrc_common.h
rename to include/sound/fsl_asrc_common.h
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 1c492eb237f5..66544624de7b 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -10,7 +10,7 @@
 #ifndef _FSL_ASRC_H
 #define _FSL_ASRC_H
 
-#include  "fsl_asrc_common.h"
+#include  <sound/fsl_asrc_common.h>
 
 #define ASRC_M2M_INPUTFIFO_WML		0x4
 #define ASRC_M2M_OUTPUTFIFO_WML		0x2
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index f501f47242fb..f067bf1ecea7 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -12,7 +12,7 @@
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
 
-#include "fsl_asrc_common.h"
+#include <sound/fsl_asrc_common.h>
 
 #define FSL_ASRC_DMABUF_SIZE	(256 * 1024)
 
diff --git a/sound/soc/fsl/fsl_easrc.h b/sound/soc/fsl/fsl_easrc.h
index c9f770862662..a24e540876a4 100644
--- a/sound/soc/fsl/fsl_easrc.h
+++ b/sound/soc/fsl/fsl_easrc.h
@@ -9,7 +9,7 @@
 #include <sound/asound.h>
 #include <linux/dma/imx-dma.h>
 
-#include "fsl_asrc_common.h"
+#include <sound/fsl_asrc_common.h>
 
 /* EASRC Register Map */
 
-- 
2.34.1

