Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C553F610C38
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 10:30:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzG2V50xGz3cKv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 19:30:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=bCS6UjgI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.6.42; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=bCS6UjgI;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60042.outbound.protection.outlook.com [40.107.6.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzG0T5Sqkz3bqt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 19:28:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmk9o7giV19/9jXXem/deulckmyXRlx1Ufx85W+Z0IqRXXLa6ClA/rfSDFlBrwDeMTFJx7uREBuvIL9zDxAM/GjFRw98pI1W9x1AUTISTUM7JRd9WT1o9UnsHVqU/ht7FnqH4SD0KBRsH93cUwyriYs1lC9apYy+k6MdQBvsxKdPwP2MYO7c5uCWbgfTKD4215S5CBYPa2VoFztO+nRFjwZgHkOKZv49JJBkSq2ZkyblVw1rV6XJEATfUn+iod8Vvev03z3ZLjgy0GWeJI7ud9gcnpYJ9F91Rdj5LKX/sB1C/0cL57uNpNt47yl6N/05EqEZL7J4a6GWsOSkjFJNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6t16KG75Im6U8aGvH8BiJL+FDxfbMVXPTJuAts18HY=;
 b=Z5kxstmquaHcXMb+TB+x6fUqI5IeUZ5Y8BbemDiV4/jwu4b4IC8hgrmsJkKF8pCUg8Jy95Hkgt6whMn8bGm4sxoNI8D5g3cijJBjQfyPoeKMW9xMGPeNU96bVdgQxcNoTmaoJXaMBnaQx6pBAvFsDWlmxL7UdFVnreisUh6Q6T073KlR1B/YNyhwB6eD8yI5U4EhNR+wcyoizM3w673Piw5Q0pDGr/imNAVd7FYAyn/5Ktq4poH7PPxOuSeqde2MnigrpqM7xfMtoKBV5pFT8VQucDxnKpfVk6k7RA4LSZNnQGE+h4BM28VSlTG2U/7Iajf4mPqdZPvvken9Eyh42g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6t16KG75Im6U8aGvH8BiJL+FDxfbMVXPTJuAts18HY=;
 b=bCS6UjgI+0OscEmJohOD3wVWjQHevj0rZbgcx0XHvSgzc79DFS+1wZyJPjM2yGY/qvFxFTVx6eIL1WdzPc7oZmSDlB8glk9fvshHbMmEIiYWGWLhWvWaiOHSLJl5dtxBUsqD6j4ziwlO0nbk5ro8CNOtGZkVlg257LYPZBWDqjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4213.eurprd04.prod.outlook.com (2603:10a6:209:4a::21)
 by DBBPR04MB7755.eurprd04.prod.outlook.com (2603:10a6:10:1e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 08:28:26 +0000
Received: from AM6PR04MB4213.eurprd04.prod.outlook.com
 ([fe80::1991:3060:d022:a541]) by AM6PR04MB4213.eurprd04.prod.outlook.com
 ([fe80::1991:3060:d022:a541%4]) with mapi id 15.20.5746.021; Fri, 28 Oct 2022
 08:28:26 +0000
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
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX93 platform
Date: Fri, 28 Oct 2022 16:27:48 +0800
Message-Id: <20221028082750.991822-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028082750.991822-1-chancel.liu@nxp.com>
References: <20221028082750.991822-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0210.apcprd04.prod.outlook.com
 (2603:1096:4:187::7) To AM6PR04MB4213.eurprd04.prod.outlook.com
 (2603:10a6:209:4a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4213:EE_|DBBPR04MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: ca24a661-850e-4075-8dcf-08dab8be6260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	V60cH9bKtBZaNfcIThPvcZOTV5dUs1WVOqrloIdAX5iyeKU8sQk4FjJejLKjjpXQUwd2n1/QDlfHAraLbEfyqiV9qLeZu+WbGo5pSmMKcnjUmMOhn7hkxUr4OpEY/8cIA01OABCdsBjw6vpqNH601a9ta/FgbFkUcQcajRinZaqarAGiy4GrQhv5he9X6RXJwZTdUbV8giz3OFIlrfiLhGEtQiSbg2RqiTpKZMoEW7KUFizrdiPevPe2kUoBLjIzfdTPMYh9SQYeUDU357QlYbk8wFuwBj3TozWdcBMhmpDiIEW215Ybd/EZjOHcdEwX7eBXD5RM0cgcxSoJzEmUBuN7pREYBOMxWC0Xj41lEkgJlXxw2vVzjotHL0b3yIHZeeP9SKaT0C/H1+CI1yYCMT3wrKDwRM7ofwK9tK8FdDOWrNMx9Plit6OaoDcbyUxnbr7zGz+GcOdQjjDNDTpIxO96y7I4Xp6pNM7DBnB+A0UfLJD6OhhGSTXCS19iohvee3Wj07g1W2gPz8nUHNJU6YhXb80+iNuN2P53J+5j+jZv6CR791vgzDFlBZSzsJxsxJ8lHj/r9SpsZzVsouAp8V4aXJaVptMnV2Q7gs0030iIU9dVVp7p+tLX62hw/QEFSPRqRipBA+r3ByL46Pkg3ySlSnffG0kRwM81nJhf53eJPYohc9uJFTyzqy/vQeSAUzp71RR/kjxjkf1Mqd45YWA/g8PLYA+9/Dczdq/lWwirLELd0VOYJJ/8cSSeBONxuZWD/9Aa5hFXUAyE0cbT+w0Akjcd5ESyCgnToFIin6U=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4213.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199015)(44832011)(66946007)(7416002)(38100700002)(4326008)(2906002)(66556008)(316002)(4744005)(8936002)(41300700001)(66476007)(5660300002)(478600001)(8676002)(921005)(36756003)(38350700002)(6506007)(6486002)(2616005)(26005)(52116002)(6666004)(1076003)(186003)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?fenlQ63MiTWxLH6ZeEsdJAZ4iz91vwXNSBJVXD2oyE605fdEyl53SLoMJ3wo?=
 =?us-ascii?Q?0WuNQ8aOfAj2N1lapICtO1948ce3QYH1oub3mXzpbu/OQe+h4xlXw0bfMo8M?=
 =?us-ascii?Q?GgvMfZOn/+CUy8QhKHgJeNvgcXdwTXJR4FXl1Am+Nb/G1BBvaGcf5BgqNUNO?=
 =?us-ascii?Q?wqGi3V0BahcwYUTW+FQQ3//o4gknwm5ldrtL7A1/aANHizCpkm4JaaECxlCw?=
 =?us-ascii?Q?d196RV/53oLiQw9esw3DqDdmq1fbhI/4Mtbmm6PGVRA7oN9bVJjbTWBqUYFx?=
 =?us-ascii?Q?vkzqICcGy/RSqjThi7u16nhUDckg+zg3yznw32y5YTZdnT1etABnEOEK2OjS?=
 =?us-ascii?Q?OMd8f292KGMqaoeBko3SOEd14ffW30nr4NfrPFuJk/yBO7uzTNTagziPfOJU?=
 =?us-ascii?Q?Eeczd5N0iAa3ijUW3CkcMYEafuc2JTbi7ZuMviMheEm5xYkoQsnaWVa9B7GK?=
 =?us-ascii?Q?xXhCKMvqv9p+wPsymeFdWcVtzuzavWKIpdBS0E3mJNfQoRO5MtQHJ97C30bP?=
 =?us-ascii?Q?krBjZBQDi0JPu5VYTsz74O1QvNS5TGxOkYvUzhZrFL/KQEG4Xqce49gPIxC7?=
 =?us-ascii?Q?evhOx8ncYUs0b5Jt7gFYrtnaj5edZprESoQjTRngNa1zolvK/HSZuetgmlJ2?=
 =?us-ascii?Q?S5zhTAaARnhYnPRlw1rWx99XxLITm2lGYeoUs5+wbO13WcIljJFetGMLfKWA?=
 =?us-ascii?Q?Z3JjuApdDr6U5KfrKApI+MS+bqJ0KIy8407G5SDbMyuI+FUAIVJ+tzQYCUpn?=
 =?us-ascii?Q?buF3BxPlq1kE/4TGstdUU3VValxbbt1eRM29HBk2dTo3mTtHJYQhXqwcOeqN?=
 =?us-ascii?Q?ywJ4ASQLCzVFPPDyCJ9cmLf5i5N6lrXvsBLq1S2Qlvh+tX2P5qgzb4zENosj?=
 =?us-ascii?Q?iKiqF/AW9ha+N63Yc7m81rlbkszy1K7IWvUm/BEy3ZhVfg8j0HzDuHb7TZfU?=
 =?us-ascii?Q?UtZgJDy3HcFGcVUgnKIaU5H/enmmsWNZyVlxC64N+gqH4lwp+ui5Wt2bFSI8?=
 =?us-ascii?Q?bS/BTVek+w9dq0H3we0OBoxe5XSE7wD+x07+8FuCuY0kHk8MWEbrSDL9KNVe?=
 =?us-ascii?Q?DXVrcKDfpABQuX5OIwcv6q6fsqInf4OoX9OtTcvUwLAPeAb7VrZ6j/MXyUit?=
 =?us-ascii?Q?N5iUKCGSTuJHoqSHLqp4o6IA0nPZ2fLaKc1d1L73jbn4S2e9Vj+DXAC4lkVP?=
 =?us-ascii?Q?Fx3iRcdStmLlgheajQ6YG/+iaJ4Z0rIZAVsVvEodZoiSLp8bPzTxQDTa4Rax?=
 =?us-ascii?Q?3yrDWD8pMi2KviG9GWE7jvLu1jsYIslR2PC37mc28Yd4Dt0HI4vRpOto8VjA?=
 =?us-ascii?Q?nJfGkfTgZhnkqEtfYy5VcpQsJqXvMk7FEnJg1hQj3x3DakTQKWN2PbHS+X4U?=
 =?us-ascii?Q?4o/5Yqo5Qk3P4I7LV5QlvkMzEhev1gC2rMm2Xj99Wk9+gEnligK8oNkdmewv?=
 =?us-ascii?Q?iUY3H41p6vh+UPN4arjFN4XZ3YVFnX+XJ5kOEoZBPL87AuVLWy4K7S/98sMp?=
 =?us-ascii?Q?7AlxHaf7rglrwN3CtYID92Liz8XMkUHVOoAefFE83yA46C9YvvB3vwzOTAcY?=
 =?us-ascii?Q?Lo0Q1oB8m/fBKK/gHBHWLyHNMMoUbmzF00ZAeUUF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca24a661-850e-4075-8dcf-08dab8be6260
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4213.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 08:28:26.2794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnFiKFqat9vc+zqAo3m1Tqmx3Rv+0BAOpAKppTZ71yelQ4JlQiWS2h9KKSTNIrDFWR0P7tT2aimND1FvduHsRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7755
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

Add compatible string "fsl,imx93-micfil" for i.MX93 platform

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,micfil.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
index 64d57758ee67..4b99a18c79a0 100644
--- a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - fsl,imx8mm-micfil
       - fsl,imx8mp-micfil
+      - fsl,imx93-micfil
 
   reg:
     maxItems: 1
-- 
2.25.1

