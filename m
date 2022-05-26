Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5123553487B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 03:57:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7rg51dfMz3bsK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 11:57:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=zhangqilong3@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1025 seconds by postgrey-1.36 at boromir; Thu, 26 May 2022 11:35:10 AEST
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L7r8t3zs3z309j
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 11:35:10 +1000 (AEST)
Received: from kwepemi500007.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4L7qn06fjHzDqPh;
	Thu, 26 May 2022 09:17:56 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemi500007.china.huawei.com (7.221.188.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 26 May 2022 09:18:01 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 26 May
 2022 09:18:00 +0800
From: zhangqilong <zhangqilong3@huawei.com>
To: <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>
Subject: [PATCH] ASoC: fsl_xcvr:Fix unbalanced pm_runtime_enable in fsl_xcvr_probe
Date: Thu, 26 May 2022 09:19:58 +0800
Message-ID: <20220526011958.139391-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 26 May 2022 11:56:59 +1000
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
Cc: alsa-devel@alsa-project.org, festevam@gmail.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com, broonie@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add missing pm_runtime_disable() when probe error out. It could
avoid pm_runtime implementation complains when removing and probing
again the driver.

Fix:c590fa80b3928 ("ASoC: fsl_xcvr: register platform component before registering cpu dai")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 sound/soc/fsl/fsl_xcvr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index d0556c79fdb1..907435efe121 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1228,6 +1228,7 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 	 */
 	ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
 	if (ret) {
+		pm_runtime_disable(dev);
 		dev_err(dev, "failed to pcm register\n");
 		return ret;
 	}
@@ -1235,6 +1236,7 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(dev, &fsl_xcvr_comp,
 					      &fsl_xcvr_dai, 1);
 	if (ret) {
+		pm_runtime_disable(dev);
 		dev_err(dev, "failed to register component %s\n",
 			fsl_xcvr_comp.name);
 	}
-- 
2.31.1

