Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55142251915
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 14:54:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbTTf3xlTzDqRC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 22:54:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=yukuai3@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbSmT2bQzzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 22:22:14 +1000 (AEST)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 45575E51671AF449BBA3;
 Tue, 25 Aug 2020 20:06:00 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Tue, 25 Aug 2020
 20:05:52 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <timur@kernel.org>, <nicoleotsuka@gmail.com>, <Xiubo.Lee@gmail.com>,
 <festevam@gmail.com>, <shengjiu.wang@gmail.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <linux-imx@nxp.com>, <xobs@kosagi.com>
Subject: [PATCH 1/2] ASoC: fsl: imx-es8328: add missing kfree() call in
 imx_es8328_probe()
Date: Tue, 25 Aug 2020 20:05:30 +0800
Message-ID: <20200825120531.1479304-2-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200825120531.1479304-1-yukuai3@huawei.com>
References: <20200825120531.1479304-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 25 Aug 2020 22:52:36 +1000
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
Cc: alsa-devel@alsa-project.org, yi.zhang@huawei.com,
 linux-kernel@vger.kernel.org, yukuai@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If memory allocation for 'data' or 'comp' succeed, imx_es8328_probe()
doesn't have corresponding kfree() in exception handling. Thus add
kfree() for this function implementation.

Fixes: 7e7292dba215 ("ASoC: fsl: add imx-es8328 machine driver")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 sound/soc/fsl/imx-es8328.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-es8328.c b/sound/soc/fsl/imx-es8328.c
index 15a27a2cd0ca..8f71ed3a6f75 100644
--- a/sound/soc/fsl/imx-es8328.c
+++ b/sound/soc/fsl/imx-es8328.c
@@ -151,7 +151,7 @@ static int imx_es8328_probe(struct platform_device *pdev)
 	comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
 	if (!comp) {
 		ret = -ENOMEM;
-		goto fail;
+		goto free_data;
 	}
 
 	data->dev = dev;
@@ -182,12 +182,12 @@ static int imx_es8328_probe(struct platform_device *pdev)
 	ret = snd_soc_of_parse_card_name(&data->card, "model");
 	if (ret) {
 		dev_err(dev, "Unable to parse card name\n");
-		goto fail;
+		goto free_comp;
 	}
 	ret = snd_soc_of_parse_audio_routing(&data->card, "audio-routing");
 	if (ret) {
 		dev_err(dev, "Unable to parse routing: %d\n", ret);
-		goto fail;
+		goto free_comp;
 	}
 	data->card.num_links = 1;
 	data->card.owner = THIS_MODULE;
@@ -196,10 +196,14 @@ static int imx_es8328_probe(struct platform_device *pdev)
 	ret = snd_soc_register_card(&data->card);
 	if (ret) {
 		dev_err(dev, "Unable to register: %d\n", ret);
-		goto fail;
+		goto free_comp;
 	}
 
 	platform_set_drvdata(pdev, data);
+free_comp:
+	kfree(comp);
+free_data:
+	kfree(data);
 fail:
 	of_node_put(ssi_np);
 	of_node_put(codec_np);
-- 
2.25.4

