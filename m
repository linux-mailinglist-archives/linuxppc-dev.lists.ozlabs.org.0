Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E14764434
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 05:16:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RGt8ZG4j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBGBx0l85z3cM1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 13:16:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RGt8ZG4j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0c::61c; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBGB15G4Xz2yGC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 13:15:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgFnZx5SJacIK09lMbuT8om/+SdFMSjXbcbMwydvwKNsZ/1RELEwocvgaXbyRs2d6U/z8isjuOl5hjVcE/qwuCdm8snvVFPHyH/8I74+BuR4ZQo7xbJ7d+U8t87g+s4KrdQq4t86k4Q/TMPBEVK2lriXgxciIAuOSlecnOZWTsH5MPqhtvdsL/h8+iD9SCFDA+P0a16weMaKUbmETHlf2b2X9BcWEhaJ41N7nbYcUk7BCbDecAkwDsM5wpLK/UqrXH0+6fxM66F44kbsN3qI11nwn1JxvU9S1XwwBbZpKOUABi9opb26Ob9x9AgJM5gnjOy/ysO62/yeQLRYKHOipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NQDVaOvDIFC/JYEJ/i8MTMp3U87MhLuUdls8eME9Ug=;
 b=IpRP7V6ayP6Feb+19NsBVuQwfgdODaMq7q/oaeS51Q6RcxaqOmOhgstwT3ZI6cDub+f/Ms2j2xXpEIJ3vbIPMzNWKCjP4Vw4rfA7jC79hoc31gUUkFlY8/MviZP6cM99p8rI+J2wdsTikYfTXZBmqiaK1gHeEOf4MhzQozR7O6awmpgtQ2kgkzX3NZn/hzFjosHBqPEkYNuiN+atzFo/ni67QdeFH6nYH49ut+vzD7vlQ1Rq1CrXLKwAEjrkcUR1PDc9MkZo3cDy8vhS2FROVqr1EewUMYS+aX2JlALphUIeT/AHLnJtVhwCAFnMRaL7hls9Y1zZGITmkMuTn6sErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NQDVaOvDIFC/JYEJ/i8MTMp3U87MhLuUdls8eME9Ug=;
 b=RGt8ZG4jbg9zivurFbP/NlRyySAABPnADi+PlxfdhuKUkwNrJjA+FPof65VooItfV2G2ZIXcnRqHCZYZFo860hvtK29v+M/Ra+34DcA+gZPR9dr83asj1dcEnwH/IM7rf3qlhp9I3dWY///R//Gzu/AHM+fv4QjPn/wl8GzVQdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AS4PR04MB9411.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 03:15:31 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 03:15:31 +0000
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
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Update the register list of MICFIL
Date: Thu, 27 Jul 2023 11:14:56 +0800
Message-Id: <20230727031459.571559-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0126.apcprd03.prod.outlook.com
 (2603:1096:4:91::30) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AS4PR04MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: 3649b99e-3138-48c0-c9bb-08db8e4fbbe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Xh+iQb+919l/WFsPrBHa9adfPH8xF95k4kkQhF7iLMYnE5wcryxgdmRlkv3/mgjzfgBs+aBt9M2o2JHjQSsVlWg3FNS0LqxMQJT8XBNLCBg72qr4+RAzmqeg+LnqiaT8GAMtCJbuPqkdSj2UNvvcN8WkMspaJIjLnaZbpdCUCiYO6y6hfaJAb186YIz5JBPxUM7IPrjwKk0PPzZvX5O98rSa7cSAG14o6nmLUOnzvbOOD8nSSvVjRNMjBg2e4rYiqZO4GW5AN/iAHbVz19DfO2wAf/CaAk64CtLoTgWs6UYjmZTZH2Bgo4sO0zisbt8KRV4O+nZfXWIDyWXZeh9msjwpLmTup9y3tsDr+kZaQCKdr4lomqXT2UfWms8UyQUuwf4J+ldL/rWmmRDxPcB9ao0q1rkwxKJvukl3SXb5C1ssHewl3XZw8wQpj41UCzE/VNKnFv6hTvff2r+J/QRfgK8lqwdLbp83y7fwq/ir4D5M5jSQA/mD3lN2y42/+/PI6w/j8NoeFVkcGHN6Tuv1WqSOYcXsJV3LyBkigB9h4lvKQgAmhjlxE8J3hzxr5L3ajy5rjgWvdoqBrzs3lpowW8Ixlzaot1LRgZM3JW03tLkvfBey5PyMKNkFpZB1QtN/I2gAI5ArT7lZhP7/7ttTug==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199021)(36756003)(86362001)(921005)(52116002)(2906002)(4744005)(478600001)(38100700002)(38350700002)(186003)(26005)(1076003)(2616005)(6506007)(41300700001)(7416002)(44832011)(8676002)(6666004)(6512007)(5660300002)(6486002)(66556008)(66946007)(83380400001)(66476007)(4326008)(8936002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?U2VHglL/jlXIt/v7AQ48oFPK27xqFopDKnjlj/vn3duKgJ0LBlVVVhm/zaEo?=
 =?us-ascii?Q?eU3bJXkvGJL6aB3//FhsEsEc3yvugkdbainT+zNcfHRVhCjCx12gr0hAg32x?=
 =?us-ascii?Q?mWcJwxB7iEC6T0ywTYGF+3vo10zb3CmQIoCe8brNzwxyFsfrybo+olrUIc1i?=
 =?us-ascii?Q?68HRXwPmkaTv8hpm1axEZTU1Mi6ffs7NvfL1Uy4JlXrqwm4NE+VpmHx9Pnkw?=
 =?us-ascii?Q?63SN7+mxs0rSWtR5K2XVHskoBsxNpc57WTnd0f5C1YixoZIndq7GsIeNYvDQ?=
 =?us-ascii?Q?f8SkF4b9vQGPOgjdFPo9tI639UG+UArYtFlEuJR/sFtirAjqzItERjPg5LM0?=
 =?us-ascii?Q?sX+GEOW5HcSIz3CApaP3vdn6wsUCFxxwjH6+msBZLbqjh0aSmE+kW7+BmmlS?=
 =?us-ascii?Q?dcrKKLBH9mcMAQEYA+VjatffsEtVbuGTZIk2qdkCWZ9gKqTvYB9Zw4FUWJlt?=
 =?us-ascii?Q?A0RXrlD7UukX+8Imt+5yEm911DTCsXetRlwrEcNeM1HbIWp5qmRs5leTM5nK?=
 =?us-ascii?Q?m7LldSCThmJcqCggYMwIG4uq7k61lvgRV6RT94IcguWJ1lLqoDjDVZtBJ5ZV?=
 =?us-ascii?Q?qbyGBA2nOuORPeerbC9CL+wLjigm6QJFu41K4NBa30ki6lXKgiZ9v48g/qgb?=
 =?us-ascii?Q?rFT3iRXF2iT6Q6KI1O6NMc+bfeq8DlVhaXzs1ubPvRJWvA/iu+c9JjoaL2mi?=
 =?us-ascii?Q?QfApyxcVz/WfuOf90aBZVhAAjCze/OhoLqfpYukweDMn3rp1bu8Ui9A2PXRo?=
 =?us-ascii?Q?rtf+q1r96IpI/67fsbrilXTg+feY1gHbCxkj+kKLk1gfpcS0uYLvixZq5WeB?=
 =?us-ascii?Q?w851crqtxBzKMNbhBGfWN2G6/9wSLDJFdaXVN3tf7PuYnZs6HJqC5P26tFk7?=
 =?us-ascii?Q?sFamtZXvf+hGmspj53Ym05RMdB+m3R/WgxlZ1fPpjuMffsKX+w6E0SuzZXot?=
 =?us-ascii?Q?+YtrKmCbY6eubNWf/R+iSyH99oCT1SFDrv+LjBBuDoZMSurGfNO6tZb3Iral?=
 =?us-ascii?Q?X4LeXt/Y96frOZIBwA5IX3VtbJaUAlzd8xp6T1fZM4M7KNoBhYZeIoD1BEcp?=
 =?us-ascii?Q?P352c28NOlOL8lMqPvyYyz/FP1BBY5Em+64cbHoUpkBArJt3hnL889FPVbw8?=
 =?us-ascii?Q?39SpExdArHi5A/EK0yAA31XRsw7nIJ3GECqe6wDhOQ6xhuwW763C90i2jhC3?=
 =?us-ascii?Q?wyKOtLC0Io4XuH4z9nKeYx4CKLeiOvmrDXZ8cRP+J+yg3Bp2Ce69xtBCgmtx?=
 =?us-ascii?Q?eDEcqDbJ2/YjTBkgUw/KvU4dW1H6DrtsegctmuHtveBrQc0eBFaBTtvL71bL?=
 =?us-ascii?Q?zThS+47hL3N98YlJs8fx1VZXJb1A6ewMUQbQYif+c501+XoV2obPEt4Gjrj/?=
 =?us-ascii?Q?mW8YBpfBqq21IyN4xsQnEzs1nQAPMX1LAnPq/r3mQ3VbG9NoxXhsECOauyxr?=
 =?us-ascii?Q?jslRGCvQfb5Sra/0+e6UoUYjAQFUu3xt6YXizPBYD37kBXrb8LTnDXIIbShA?=
 =?us-ascii?Q?vie+Kbupo6EhxXdtQZvA9FO/udMt+AP2cVt0ElhobfotWQyhl3Ii4rWUuDzN?=
 =?us-ascii?Q?/zWFGXT5kNq+e/HPVY0CWvnSb7kbEpFUKNgoSu8n?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3649b99e-3138-48c0-c9bb-08db8e4fbbe3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 03:15:31.1773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIG7ZHOgyx+Tk2du3YHhUvrwsrzi29oDIT1to/BatcebBt2HbOt+hrFZJRsDCpUOCmUserSVkRnuWMLVpOM86Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9411
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

MICFIL IP is upgraded on i.MX93 platform. Add new registers and new bit
definition.

Chancel Liu (3):
  ASoC: fsl_micfil: Add new registers and new bit definition
  ASoC: fsl_micfil: Add fsl_micfil_check_version function
  ASoC: fsl_micfil: Use SET_SYSTEM_SLEEP_PM_OPS to simplify PM

 sound/soc/fsl/fsl_micfil.c | 100 ++++++++++++++++++++++++++++++-------
 sound/soc/fsl/fsl_micfil.h |  64 ++++++++++++++++++++++++
 2 files changed, 146 insertions(+), 18 deletions(-)

--
2.25.1

