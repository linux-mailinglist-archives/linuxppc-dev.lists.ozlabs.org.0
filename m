Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A377B7E29
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 13:29:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=UvWBEAXH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0ssM2pQTz3vcZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 22:29:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=UvWBEAXH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=foxmail.com (client-ip=203.205.221.192; helo=out203-205-221-192.mail.qq.com; envelope-from=zhang_shurong@foxmail.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 245 seconds by postgrey-1.37 at boromir; Wed, 04 Oct 2023 18:25:05 AEDT
Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com [203.205.221.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0mRj30Srz3bTn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 18:25:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1696404301;
	bh=nnsazRl0VawtG0Ot+fpS8kiTavsPsKlA4kc+rHNHQmU=;
	h=From:To:Cc:Subject:Date;
	b=UvWBEAXHop5cqhRXiZHj16UV+k2HVjhBZ5g80mLzmCPzicsEO7sqt29mo/fakj6EP
	 ryYIk+rvMI+PmvTJMabXUI54VPiJoWSjiq5tMZzrYiMNcbiFrQsOsDXSSMweNUlmJW
	 rAetQ970EJLoViiW4neQ+cAK2ZO5rRu1ZYitoKjI=
Received: from KernelDevBox.byted.org ([180.184.49.4])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 3071DA8C; Wed, 04 Oct 2023 15:12:07 +0800
X-QQ-mid: xmsmtpt1696403527tq1y2h3b8
Message-ID: <tencent_681B0528D436898B1B945A8B2D46300C0F07@qq.com>
X-QQ-XMAILINFO: M5ZQ+xctoGy32JF2BS+69Ng/YkDt5B0Lg7DW4BkRYST/lLCvbYHJTGm0NllUmu
	 D69sI1B/XbiUDrolkyjamC4AYqdlhGJvMdGX+BaoYDGEhmdDg8hisMOlN9/D6M0Xg2loqGHDBGkx
	 Jbt5lrV0JxzxQU47wEKg5RkKBCVQLafviOR0h+ftgTNpHBS0kWLj8Ht5WC3Jp6YaNmgJsAEV0UrE
	 M7LLS+lZAX4bRzNFOXLxlnlYKjbVsPf29BfXF3YxcZkZM26aIfY5bNfcPAZBzzV7RNWsLsCJCDBZ
	 I08mmmNrBiCezn6iZXFMiAcHUNdRQZSryKV4geVq0Ur51WDhjq76d6FAe3K0EF6kSHgAV1cIF1eU
	 eR1GaEIU5z2FgC6Cx8mkJopFZbxbjR4m/r0uCA/jUaw5YNN0HaMcpl4EtDD5zCOmRPZAnJmibh6p
	 3VfZcXxbsB8fcfsKnXEmbiu06tVmSujcpCO4nGDuj5MOOUlA7OtuGE4eSyoqi7Drit+cLDhAFMmR
	 Rn/5Aan1+PxrMn1wu6lSFavUdcx3Jekp2bJBElfzShplchKK0MEmUrUn5AI6WfHZAWQwdWyb0Ys7
	 OD2jakV3BMJmmIn/Llguqn1PEM+s5BJ6svDtDYwAcoOnnAkTk9ZktdSKmwSlG0rkKgYORO/kNdRB
	 n3fNM8brtoaT49CskpiVAMO86Y8VfZ8noNTktPyqX/N4PdVAO88o+GPey2LLvzUFQ18bJRdJD5Tm
	 XEnpxuzUDja0UzyMD7hQWFTrQuq18gNyxjwRjLepDzEcBCOAXW7zRW/rWh1iI0ZhxOMDEmOctoqN
	 DJEGcovROsDoaaL3C/wLrOCdVDkPnH1jYTgZr0k9dRL2NyGwvyrHGAS5fbhmKcJxH47Cs1W/lu3L
	 B+LztfDUYpLw+8ViKP8CMN9RNG1iLgp7YXo/+dxeaxRs28m8FkMQ+1k+TBlHDjosqn2hHus+enMW
	 r60evUAPfdYRqsFWNtjjDFk7QS2gQEX4CgdPBtCEAdvFRXiLVOfGJu9bCbmTfX
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: shengjiu.wang@gmail.com
Subject: [PATCH] ASoC: fsl: Fix PM disable depth imbalance in fsl_easrc_probe
Date: Wed,  4 Oct 2023 15:12:05 +0800
X-OQ-MSGID: <20231004071205.3857082-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Oct 2023 22:28:01 +1100
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org, Zhang Shurong <zhang_shurong@foxmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pm_runtime_enable will increase power disable depth. Thus
a pairing decrement is needed on the error handling path to
keep it balanced according to context. We fix it by calling
pm_runtime_disable when error returns.

Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 sound/soc/fsl/fsl_easrc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index ba62995c909a..ec53bda46a46 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1966,17 +1966,21 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 					      &fsl_easrc_dai, 1);
 	if (ret) {
 		dev_err(dev, "failed to register ASoC DAI\n");
-		return ret;
+		goto err_pm_disable;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &fsl_asrc_component,
 					      NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register ASoC platform\n");
-		return ret;
+		goto err_pm_disable;
 	}
 
 	return 0;
+
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
 }
 
 static void fsl_easrc_remove(struct platform_device *pdev)
-- 
2.30.2

