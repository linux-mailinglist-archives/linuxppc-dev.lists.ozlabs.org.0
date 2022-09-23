Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1A65E7666
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 11:04:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYmRy13tWz3c8C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 19:04:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYmRT4stlz3c6C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 19:04:02 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MYmLW0jkCz1P6rt;
	Fri, 23 Sep 2022 16:59:47 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 17:03:55 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>, <festevam@gmail.com>,
	<nicoleotsuka@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shawnguo@kernel.org>,
	<s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <linux-imx@nxp.com>,
	<cuigaosheng1@huawei.com>
Subject: [PATCH] ASoC: fsl: Remove unused inline function imx_pcm_dma_params_init_data()
Date: Fri, 23 Sep 2022 17:03:55 +0800
Message-ID: <20220923090355.507648-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The imx_pcm_dma_params_init_data() are no longer used since
commit c31da0b196f9 ("ASoC: imx-ssi: Remove unused driver"),
and the function is used to initialize some members of
"struct imx_dma_data", it's more readable to assign the value
directly, imx_pcm_dma_params_init_data is useless, so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 sound/soc/fsl/imx-pcm.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm.h b/sound/soc/fsl/imx-pcm.h
index 06b25f4b26b6..ac5f57c3cc55 100644
--- a/sound/soc/fsl/imx-pcm.h
+++ b/sound/soc/fsl/imx-pcm.h
@@ -18,15 +18,6 @@
 
 #define IMX_DEFAULT_DMABUF_SIZE	(64 * 1024)
 
-static inline void
-imx_pcm_dma_params_init_data(struct imx_dma_data *dma_data,
-	int dma, enum sdma_peripheral_type peripheral_type)
-{
-	dma_data->dma_request = dma;
-	dma_data->priority = DMA_PRIO_HIGH;
-	dma_data->peripheral_type = peripheral_type;
-}
-
 struct imx_pcm_fiq_params {
 	int irq;
 	void __iomem *base;
-- 
2.25.1

