Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC56781DF03
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Dec 2023 09:07:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=BuyfL0lv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sz9WG2fwdz3cHP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Dec 2023 19:07:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=BuyfL0lv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::629; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sz9VM3ZbHz3bWn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Dec 2023 19:07:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHIFr0QMd8WJLs5iLLdZKoaLLm2i57oF4DoTJt9LpSPW6vuQwFJYXpAmDI3M56AquKqvgl5d2UXkeOLPBMsaDFItgNnYzpF0rcdMfZ9BFIZjnTzRlknp29CLVVHg8OfOS6TRRGTRqOMVRDty7wxPTe9/+E2ym8sf3yJ9qnG5nfbEZh+MVAux1vt/RTOxK0/WxE3yrH2FRA6rxTlw4RJkDsPCnHqWERQzRfXu5L14eKYOn4zMmijNg68C4IT0FQ8ZP4QEanUZ83DHDmSA+DhTWHWnruxg3ndltHARsVLF9PP8h0awruxyA0I6NtMd5gPKK7x4I+7Y4S0LbnpyB5gsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+eM8lvNvRlnae/G7ZMO0TDgODGjMvjnUOoYW8Odyog=;
 b=cdJl7UBkIA9h8/JeFg4SGLEX2R/FSxOe+9Lh1zhmaV/Msvh9/TSQSDN97HIuny1a7BlcxV6Ydkrl6qIPI4TAzOCLN6MiiTFcMTMoPhC0nYiX+80x2sSLlJ6Yz2V1jSJDyi1J53V3sQbnPyRJ/g5zMBioVdtoUdR7t6ZlwR294Xrmf6DLN6gUdi74BWz30bIdNVZ15q89tPso1blAw2UL5LIrSjilhcVS5drP0XX2+RS/m0Fclpy5qD6tTWO42olrWBjBSy1wBCHuL9oUq0UZy+CDGYTcYhlv8PC+SchYv3CDdRm6I9OSyT3RCu62swg5+8PDuIomSNgf28S03uwDUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+eM8lvNvRlnae/G7ZMO0TDgODGjMvjnUOoYW8Odyog=;
 b=BuyfL0lvXtfxn3Lbr2/VEIBaEDefurii3WSH5cUJEuhMXUYtJ5jjGfo5Luu5CWc1c4xlO0g14I3na9F8u5poLudw+PcYsJzjKp+X15xHIT9CRUMpDmb0r74SAbWnTw4vYvwGM3hOdBpZwG/XWp+3fDqH2MvOSYbsiRkETW3t5Ls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DUZPR04MB9727.eurprd04.prod.outlook.com (2603:10a6:10:4b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Mon, 25 Dec
 2023 08:06:42 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c%3]) with mapi id 15.20.7113.026; Mon, 25 Dec 2023
 08:06:42 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: fsl_rpmsg: Fix error handler with pm_runtime_enable
Date: Mon, 25 Dec 2023 17:06:08 +0900
Message-ID: <20231225080608.967953-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::18)
 To DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DUZPR04MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b992ed-ec12-463b-da4f-08dc05206e0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	48a3mshOtRHLH2BvaCpxRmPwDs2UDTCpnalg2QG3sNNmhp17v6x8sNCWmv2xJ8XQWgWJHDnx986s0eVLTF3cy/9leE7XyebkiCzJhzPBOqILD9Epn7+SdXAHDq5wMaV1NRP33TgKiwgC8Bt2SihpyzbeCoNlp7fgT7xr3Mzeg/oMrPxbaPS9ikffQRP8/OCXWeY8s/2NnKu0H7CEBdMRQ7ekkHJpyO15IXPT56Ry0GtLH5pNjTvuGeCFbT38QKV8N7DAI26sB1AAIdWXFgvploHafPzQOgdY6/dbJE7og5qu8QVDfHYTkT8lh0lvcrWwjHw27sowyrOnn0PQVlDwGT4V+F74dKGOcBY2do3iTFz+by4tVgV/VdFxCl0//qeG0HCg2+HzFPfaAUP5jcTl/OYR4Jir4zQGGsGZtZ76vcPVdoLpqBDywp7bk4o8KR+Gkd2lYzl1FKL4epHPRN904Az7ztsQCH8/bw0PkmO72iuFg9K931jtBvVRwpaKsx1W1e3MG1XthefJBsggzK83ZZCJL/1iRqqGFYMiChXHYmt/F0pgUXxX+0xnMOGqotaC2Mj8jEJ2kwZX7FZcrHo7mNhf9xU9xqA5qt3ZaaKVXeIDKPr8B/7D/FJljsMOoNZE
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(376002)(136003)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(86362001)(1076003)(2616005)(26005)(52116002)(6666004)(6512007)(6506007)(41300700001)(38100700002)(83380400001)(36756003)(44832011)(7416002)(6486002)(5660300002)(66946007)(38350700005)(8936002)(8676002)(4326008)(316002)(66556008)(921011)(66476007)(478600001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Tx742bQIOc3LOxc2k1K/VhsMLFbfAfJTlpqlNEr+ePLQ+jEgN+VNEk4y036B?=
 =?us-ascii?Q?dIFZrf5YBZc+gZIwiMzxllYUfWFM3kxTyY2WR2SvPQZG0H83ec2bp4fbNS2M?=
 =?us-ascii?Q?9Zzk8/Q9SG/ID6raOeJ0mFzGq4B3DE8znYtPM+EkI0+r70fdmXAkJ+VViO++?=
 =?us-ascii?Q?qvmaPpUWbhZ5X+POnE8pVNorinnt33ArfvzYdCgnWY2tFGA19pq1mUe8UUa0?=
 =?us-ascii?Q?s0wn0hNblAZwIJv/XTWr2hqgNR0+ANtjn+4qq9cfQVjNzpXpyAUTj0pGZU9K?=
 =?us-ascii?Q?a7mIFc7i8Iu5JN5LEtiNs28QdbhVwPPz9DGPSgNQ85pJn9OUpGsTcmpMQFJm?=
 =?us-ascii?Q?zjio1bW4D/rz5pKYJlDz0Q2Nqw8NyRzOwNRudfFShUiD6hNRfdCoZRVeF6P1?=
 =?us-ascii?Q?Q1t1hh+CEYefuZvNym34hkHZ367jh6Z8ppDyU7OkWYp5kenvnVIZYz9SJMdy?=
 =?us-ascii?Q?ayTdqPC/2E6V+xS2FwjGCIWi7oSlFJsQPhehR/B3kWShZ2nsYw9Yo1h/40mw?=
 =?us-ascii?Q?gCQhBjxtdVcQHD6oWqKJSN5hOlWVAH6Gl9dC7E7PIODO5EDTiVOntypcfF9l?=
 =?us-ascii?Q?s28nER4Dhw7wTD6zW6y9dP+ryAD6xreLZ56R5X2i99Xz8WfhUXQsRP9D7k7G?=
 =?us-ascii?Q?MIfrDYQVqEYjegxYTGAJjK3g9C+bkRkP8k6mOXPPFSFXPRTvDNwNxTAGKoo/?=
 =?us-ascii?Q?rEyXdDsfbMY4Sf2VErbVwe+1kSz4irIn+JHBcbtb2Z8LrX+HSlRUMnlHdExi?=
 =?us-ascii?Q?/7uTyGPZoti18UW0+pTyZedwKDNOtOnK2guTE5oNsLpO5EL8v1M9rxoRmMxa?=
 =?us-ascii?Q?Zzsbj/guKvChoAsSVdiXAbv29TkHPmLW4zMziv7JyAhVBJauBjBj4bp1bP9J?=
 =?us-ascii?Q?3a+Fj/jEhI+Z24pRHUACvQ0xdQqnd/OBfCZ3mPTnOQ8Yg5M2zTuRYJSOeAkj?=
 =?us-ascii?Q?Tk3twEyYbjVvv3vxq/Fs1tNid92Io7lVivDLHNa2qgJgtI3qNZfYvnCj992e?=
 =?us-ascii?Q?Y05n1A2tIU4hczEwAi/orDqVHbTgwaf1rTl2+eU4GuS0SwFNT3yhKK0/rBh7?=
 =?us-ascii?Q?tltNFXHR3QkzQbzO0KLPvc0b8reHSaBNd/1TfQEYBfGHXEoBtECjihXG9PMn?=
 =?us-ascii?Q?PAACTcrjWU++f5TQAaYFObyLLYsOeuFPQ0QYvScIyozU1YIoorpZibffAVX3?=
 =?us-ascii?Q?NC7hMon97Qp1TGq4CsgGcYPRsHc+3lxBIXSLbjjlQgGCfHfv5i88Uu3Yo1Zr?=
 =?us-ascii?Q?KkPW49mdJdtiZfa2IfmBl19p/QkNBXMXDm/Appgi1FX9m99gzomCyOoKGL7X?=
 =?us-ascii?Q?/WacUnfwyFXPznC861xGtK3S2u+/Y6aX5HS2gQ38DGtFN+DqNkmq94TCpXD4?=
 =?us-ascii?Q?36v5vF+fkn2NZmQ/tVEbFt+2Z2Qtlvp0+NhylQsgGMWZKmGSZ6k3hUkO5xE2?=
 =?us-ascii?Q?Bbyl5EI3gN8lWnkk3zpLYGXZ+f+Xo7Ax9NWfE8N/hAglRltc8BUhAAzYRYKu?=
 =?us-ascii?Q?RHrUrv83rOm0WzaGh92DHc/6m6qzXwNR+CjNuGGiVShH24LQnIQj4ec5aDio?=
 =?us-ascii?Q?8Q+OigL8E7H/WP77WIXYKJusaTPcY5T9zzcUHdJA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b992ed-ec12-463b-da4f-08dc05206e0e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2023 08:06:42.4991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mb6plim/JhOOPycSyqHKc3KqSzNaH5A6Xl/yNZ9Jb6dobQma4jr6GwFbjHiNq7bMx407NVE10OCjWTQfpRUFxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9727
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

There is error message when defer probe happens:

fsl_rpmsg rpmsg_audio: Unbalanced pm_runtime_enable!

Fix the error handler with pm_runtime_enable.

Fixes: b73d9e6225e8 ("ASoC: fsl_rpmsg: Add CPU DAI driver for audio base on rpmsg")
Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_rpmsg.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index 5c5c04ce9db7..00852f174a69 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -238,7 +238,7 @@ static int fsl_rpmsg_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_component,
 					      &fsl_rpmsg_dai, 1);
 	if (ret)
-		return ret;
+		goto err_pm_disable;
 
 	rpmsg->card_pdev = platform_device_register_data(&pdev->dev,
 							 "imx-audio-rpmsg",
@@ -248,16 +248,22 @@ static int fsl_rpmsg_probe(struct platform_device *pdev)
 	if (IS_ERR(rpmsg->card_pdev)) {
 		dev_err(&pdev->dev, "failed to register rpmsg card\n");
 		ret = PTR_ERR(rpmsg->card_pdev);
-		return ret;
+		goto err_pm_disable;
 	}
 
 	return 0;
+
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
 }
 
 static void fsl_rpmsg_remove(struct platform_device *pdev)
 {
 	struct fsl_rpmsg *rpmsg = platform_get_drvdata(pdev);
 
+	pm_runtime_disable(&pdev->dev);
+
 	if (rpmsg->card_pdev)
 		platform_device_unregister(rpmsg->card_pdev);
 }
-- 
2.42.0

