Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A97495B86CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 12:55:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSHLT4rFxz3dpp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 20:55:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=NO0InIpy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.6.85; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=NO0InIpy;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSHHK47Z9z2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 20:53:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hblI6jE3DiXTV9XpPTjFmeUD1wcwpqmyd0iOsVQuRNjijsXioBSpUQBx+bEXychiGbiUqhE2XJiTMUIMgpDiFqJYO+4i/LAOndERSy1mio7nSlEU5voIG4yAoFrroLgzh98Fjjy+vG+surBBQCdhWHcWk2oTFRjMt+RU91bzK3LYUlqaGHAQaGe9QXCsn1PegMEuTo04CBuDYU7DxlCJUFmgfFMXU7XZLMmcm+1y/wK9u9PKGqfDQL2P1f2n+uqFi0IT/aJWX2l5JrYohmz5QHes1ZzRYRCBercYQfiOQLUoWQH33qeEFP7Gj2eIQfxSdc/0DOMn7ePyhBgz2aJ3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYTwAAt7/koMSdph33oVPkc9b5DPWLIipSpB1mPQMd8=;
 b=Q8P9bRVe3sqY/x2y4sXBAel6X2gwgcYutN0nQR/FzZTM/LmvJhrtfdmGSU4ZRq/P8jrXuBVhWg8dh2Jz6w188AfgP77FjnmZtoBvFLSEfzRI905aG7qHCJYvT2495wWsP8tX0UJv5PNfHu2mE77ZnagppUClQCPgpuYGHs3ePluf7TjuQAW7Jshpqp7LHQxCpNFkRcUeHQTleX2yYc1DxK2InGKnOcJpk8kstB+enSZWlGwfirTFajxz6kna62LFWiZoMH/uOD7tYi6upZuAcR3kYpFrqzrjo6MIJN2qVwfP8QezEjn2M08mCWqK9ZQOvdZ6X6h9+YARvD+LZrFMCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYTwAAt7/koMSdph33oVPkc9b5DPWLIipSpB1mPQMd8=;
 b=NO0InIpyfKZLZbloZ8hfZFTPIkn+aOBkyTuF8AxkOSKz7pSIteV1nDMp5ilYs4vD4omFQ5WKuJLfphiIEsTP3BGkU9DVFqn6bZM7WvbLSZvaA+C3x/mClgo8qoqvbTVLHehLQpPXDtJDnPgsYq6uf/MvYhZ5aG2i50TFKVjvNgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 10:52:51 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 10:52:51 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	shengjiu.wang@gmail.com,
	shengjiu.wang@nxp.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/7] ASoC: imx-pcm-rpmsg: Register different platform drivers
Date: Wed, 14 Sep 2022 18:51:41 +0800
Message-Id: <20220914105145.2543646-4-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914105145.2543646-1-chancel.liu@nxp.com>
References: <20220914105145.2543646-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|PA4PR04MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a90189-f432-4a61-0f14-08da963f44d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	srB9tg/ldbky4Keegy6GCv5D4YQLC5VNS7UgJLPkkvAHZLwUk+G5ycljau0AmI5HCAw124ZzJ3ZNAm+SIK62P6foObXYI6pG2z1CJMJIh3pmh3wPUdksFVSuu4JSlCqFF+HA3OWqZgMZov85/MZYtXiD1Nlc0t6ssOqXj3Jk06qOelULKrHGDz++Rr62wZZp9WpsWJpuid9EYOPJnZGijGkgMKsn9UAmSo0kdrFGuRNPFLVaWfz9i/RMSEBW3DB7snxxDZne54b8loeId9yVu9xAUjrA88csV3a/YjFa9N61j0iJAVqrYLOZWg8HQCFbj1GrPJia7uw1egZdlwZar+CNZKGhlcR0TdK7u5iG6FcStJv93ymEjSP3Y8SoIwBfKdn6GVqEE9ACLGE+BLUIGJmS8wKXhw7q1MGDPp/nNq75AB8mwuMDJ2z9OlLyYOCMpw/su4mcg3BohZG4OoSjCZ9FPGGfQ/tiUZ9zgQGX1mGFx4C+HZIfA+rZ4Dt3nuHHuFkLzvyiQ1TuNFQmG19YDf3Ju2NLwEXwwQW491MDFH+TGDNBjyTv2c2Xqr2mnaZVBSWkWlRBoH0kTT1BuGvjHyweZEs9iXiO3mvvAFtql80EmONlSsGCMq1pRTvUGZQWvhoRPyyvWJnzM3+BZ128QVnervL0r1nGGDLr7v0GQJ0OkW/EJq13GrKUWic95mTHO3vIrww24r3F/Jtxug9SqvfIYBegs0EZcgl1T+Etm0G7oXMSdjeuIpC38c/CJJg/X0a+aqLKLQ8OAdI2NyarNSe0AoGiN/okl9czmGpWiJE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(36756003)(66946007)(921005)(316002)(2616005)(6666004)(1076003)(8676002)(2906002)(186003)(52116002)(26005)(478600001)(83380400001)(86362001)(38350700002)(41300700001)(38100700002)(6512007)(7416002)(6506007)(44832011)(66556008)(66476007)(6486002)(5660300002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?zLoErgvafDexR+6C2V3J7L7jOJQzNC7bN5c4E1PHgD4bqI/weDLFMnTUbTTc?=
 =?us-ascii?Q?ao3s/suwwEx3a9pHFlpbvz27WVRcMdT7mX7ZJOkZj3cg+ggwS7YqCjJguldt?=
 =?us-ascii?Q?UNV8HcRlovvAhI9kSgiSEWTjuR1QrWt9oEnUhGzjl0tbTZf4LSd4P7k0S5TE?=
 =?us-ascii?Q?bcwuBgl017ARjui0dhxscMsuzpwJg34xkAX80JnFKYmR8+UiDNO2OwIAJXjs?=
 =?us-ascii?Q?0YVobcv3T4/+/bXwa4VUDo4AlKAhFrHZfaHapf5LW+447Jel1g8rcf3QFUi9?=
 =?us-ascii?Q?6N2Ep+NGRB0GL/5xgpIunIFipDUpQU50v3cd8YFbYRfe5+LsYS9hGLbNpqKU?=
 =?us-ascii?Q?o6vlnbFXo/FpCqxYVGYjo/K+MHE2A9kJSxZVaZrzUpcr2xd3UUbnyyaWqNeO?=
 =?us-ascii?Q?3l7qgnbVahUgsnJRfFGIRGdtlCp2uh7ZrFrt3Lmsa27QKCMKB+XvG8+AZQrX?=
 =?us-ascii?Q?ALsb7RFHBTxwc2AMyS5Ohhm0s/Xt4YtBT3RxnFiRt/zSXG3izox/zw4QEdNZ?=
 =?us-ascii?Q?pOi3F+p3YCkyes8sDZI4uqBoWs+Pm1WrPWC1e+JyTHE/Y0FU30bS1FNxqJDB?=
 =?us-ascii?Q?5CCD1l1MbpV4OdDGkt+9W3grOSTppJcL72vg87Fu8p6TEvOXQa8YJxmGny/3?=
 =?us-ascii?Q?xLzM0rdI3xQcBZjTX3N9yi+cqbWXVuAGOqtFyKbRmqB+qERhcxZ7gTAidHQ6?=
 =?us-ascii?Q?OKq8f6h7Eyqh8NQBH/wkA9QDZWNK/lHlk03m/jQK3osJTmJzGmmDlLC2Zr9z?=
 =?us-ascii?Q?WN2gdixJPISt2Q5+zfe6owGiCmsehuRYdxHFub2w4kGhN1lAjjcjNqHVZaVE?=
 =?us-ascii?Q?9xwnBU6t+SU9584ikbP5EAelYkswrbmXPPVnPyxriDNU9NS6kcJM+RP4CXPV?=
 =?us-ascii?Q?yILEvLuFFK3cymc7cTpXnBZHmkyqckyIHIekQo3Zd/9yrzA+tB8bVdeDDyZZ?=
 =?us-ascii?Q?23/JAmCsFUzBztQ6Jt4LI/7z2R2zMzbYgDp7pgOp4Z8dTZLyfW34tqARa3vX?=
 =?us-ascii?Q?MWFE7KkMrJ7fCpAP+7zio2xYWBPkQJhfN7Alf/cUyFbSJsPreLOGJtBcZLgs?=
 =?us-ascii?Q?9hos4Wc/NyXM4/vR1OT2geTVkuNDFmbSOb8cZAkerShnSkNlr6YVuX2+4Ulx?=
 =?us-ascii?Q?//W8SirQsbI+HZKiHPEvTtk6cfAhmjKWzCKpM0FjXEzYhUUA8toBv+vd2/ZV?=
 =?us-ascii?Q?oRuTdrrDUs7CKXr9sugx++Bs6GsjTDNNWItU/xAlyLLupEt2NtVwfVF6Y5TH?=
 =?us-ascii?Q?lZyIlIrYW/VvS8pqT8flkLJq6lvXzZq6sdJjXfiXHKbwd0KEETdKrvEq2Lnd?=
 =?us-ascii?Q?lAL+R/ovTzLKh9ByqtOCrn0mmEEQO5hhrM7REVzGLV/XfKa2tfay+2/qXK7u?=
 =?us-ascii?Q?fiShhxWNPngbU8jMBRlpj1kPEkV6RvObRMDBUeqI1ZSuYllRTJorRzTir/7F?=
 =?us-ascii?Q?7k/TErjlXGxa+oYoEvL3VysT4Uy9yJ9tPvyVUdLZ+g/ETRuVtIToIA241H5c?=
 =?us-ascii?Q?OYevLYaZ9Oqz+WL0SjLnXHYcf4OxUV9nmh5YrZLBufrtiOtPFbOdnSewkz40?=
 =?us-ascii?Q?HpRT/E5V852Mpytg/1V/ck3T9bM/2Mnv6J0vajff?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a90189-f432-4a61-0f14-08da963f44d2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 10:52:51.2913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4QBX/JMQ42UISF++QppqCRf7JwH/JCXQ+7rtsIBzbQvpcdVIYkod5qGsuw1mfCYz9H0KXmmJxwY9lhrjpZsuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7773
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
Cc: Chancel Liu <chancel.liu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch can register different ASoC platform drivers if there are
several rpmsg channels. Thus sound cards based on different rpmsg
channels can link to their respective platform drivers. Besides, the
name of driver is equal to the name of rpmsg channel.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 35049043e532..3157cd5a837e 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -684,7 +684,7 @@ static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
 	info->rpdev = container_of(pdev->dev.parent, struct rpmsg_device, dev);
 	info->dev = &pdev->dev;
 	/* Setup work queue */
-	info->rpmsg_wq = alloc_ordered_workqueue("rpmsg_audio",
+	info->rpmsg_wq = alloc_ordered_workqueue(info->rpdev->id.name,
 						 WQ_HIGHPRI |
 						 WQ_UNBOUND |
 						 WQ_FREEZABLE);
@@ -723,11 +723,15 @@ static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
 	if (ret)
 		goto fail;
 
-	component = snd_soc_lookup_component(&pdev->dev, IMX_PCM_DRV_NAME);
+	component = snd_soc_lookup_component(&pdev->dev, NULL);
 	if (!component) {
 		ret = -EINVAL;
 		goto fail;
 	}
+
+	/* platform component name is used by machine driver to link with */
+	component->name = info->rpdev->id.name;
+
 #ifdef CONFIG_DEBUG_FS
 	component->debugfs_prefix = "rpmsg";
 #endif
-- 
2.25.1

