Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A615CB82C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 12:24:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l5b82fbDzDqfB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 20:24:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=oracle.com
 (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.b="A4a38goz"; 
 dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l5Y06rdRzDq61
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 20:22:38 +1000 (AEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x94AKnml190786;
 Fri, 4 Oct 2019 10:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=2UV26P4ketlNysONmYpv3j5Ps/gkGQhgfAYzlI/2ahg=;
 b=A4a38gozyBdoeQc9ASrTN/Fa+X/05grnIq2WWzMHtluSNH11XaCStdCVogznvJSqUeJH
 ZHHKOh5Wu4Hh1Bzzu3DtHeE+DdQG+kPgY66KKs3+KhKqywN9OILeSrERQOsFj1xir/pE
 9g1aniKkLti48S8THnT+71uAIhOzxP1x8FlhVgvkIpkoFiUbCmu5OBUud3DF+rEWHB5v
 FUBwv+PJNn6JtN8lcFkvIeUzbpfTqB4bLV2Xx3q1O2BTLPymxpGINqwLeyTJYxHPc24S
 IczrGB/ev2kr3JGvGCp9V4oNNX1tHV6LEYfJ/X+w+ioqU/D10lKwmSwhv5MF+n4broR+ 1g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2v9yfqtame-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Oct 2019 10:22:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x94AIrHZ153294;
 Fri, 4 Oct 2019 10:22:27 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2vdxu8g5uc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 04 Oct 2019 10:22:27 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x94AMM31028990;
 Fri, 4 Oct 2019 10:22:23 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 04 Oct 2019 03:22:21 -0700
Date: Fri, 4 Oct 2019 13:22:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Timur Tabi <timur@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: [PATCH] ASoC: fsl_mqs: Fix error handling in probe
Message-ID: <20191004102208.GB823@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9399
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910040096
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9399
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910040096
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are several problems in the error handling in fsl_mqs_probe().

1) "ret" isn't initialized on some paths.  GCC has a feature which
   warns about uninitialized variables but the code initializes "ret"
   to zero at the start of the function so the checking is turned off.
2) "gpr_np" is a pointer so initializing it to zero is confusing and
   generates a Sparse warning.
3) of_parse_phandle() doesn't return error pointers on error, it returns
   NULL.
4) If devm_snd_soc_register_component() fails then the function should
   free the "gpr_np".

Fixes: 9e28f6532c61 ("ASoC: fsl_mqs: Add MQS component driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/fsl/fsl_mqs.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index c1619a553514..f5f2f659bcbf 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -179,10 +179,10 @@ static const struct regmap_config fsl_mqs_regmap_config = {
 static int fsl_mqs_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *gpr_np = 0;
+	struct device_node *gpr_np = NULL;
 	struct fsl_mqs *mqs_priv;
 	void __iomem *regs;
-	int ret = 0;
+	int ret;
 
 	mqs_priv = devm_kzalloc(&pdev->dev, sizeof(*mqs_priv), GFP_KERNEL);
 	if (!mqs_priv)
@@ -199,17 +199,16 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 
 	if (mqs_priv->use_gpr) {
 		gpr_np = of_parse_phandle(np, "gpr", 0);
-		if (IS_ERR(gpr_np)) {
+		if (!gpr_np) {
 			dev_err(&pdev->dev, "failed to get gpr node by phandle\n");
-			ret = PTR_ERR(gpr_np);
-			goto out;
+			return -EINVAL;
 		}
 
 		mqs_priv->regmap = syscon_node_to_regmap(gpr_np);
 		if (IS_ERR(mqs_priv->regmap)) {
 			dev_err(&pdev->dev, "failed to get gpr regmap\n");
 			ret = PTR_ERR(mqs_priv->regmap);
-			goto out;
+			goto err_free_gpr_np;
 		}
 	} else {
 		regs = devm_platform_ioremap_resource(pdev, 0);
@@ -230,7 +229,7 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 		if (IS_ERR(mqs_priv->ipg)) {
 			dev_err(&pdev->dev, "failed to get the clock: %ld\n",
 				PTR_ERR(mqs_priv->ipg));
-			goto out;
+			return PTR_ERR(mqs_priv->ipg);
 		}
 	}
 
@@ -238,17 +237,21 @@ static int fsl_mqs_probe(struct platform_device *pdev)
 	if (IS_ERR(mqs_priv->mclk)) {
 		dev_err(&pdev->dev, "failed to get the clock: %ld\n",
 			PTR_ERR(mqs_priv->mclk));
-		goto out;
+		ret = PTR_ERR(mqs_priv->mclk);
+		goto err_free_gpr_np;
 	}
 
 	dev_set_drvdata(&pdev->dev, mqs_priv);
 	pm_runtime_enable(&pdev->dev);
 
-	return devm_snd_soc_register_component(&pdev->dev, &soc_codec_fsl_mqs,
+	ret = devm_snd_soc_register_component(&pdev->dev, &soc_codec_fsl_mqs,
 			&fsl_mqs_dai, 1);
-out:
-	if (!IS_ERR(gpr_np))
-		of_node_put(gpr_np);
+	if (ret)
+		goto err_free_gpr_np;
+	return 0;
+
+err_free_gpr_np:
+	of_node_put(gpr_np);
 
 	return ret;
 }
-- 
2.20.1

