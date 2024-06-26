Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAFB917968
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 09:13:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=oUg8vIl9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8Cbb2bGtz3cQq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 17:13:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=oUg8vIl9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::626; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20626.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8CZs4FNnz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 17:12:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHFVvUnk5T7LHghqhFiLeucYMJTE4vFM6bIzCp6oiySIwtigcVnZiwGGU2eNsfl9CG8fuZkpK/sWpd+xkf+6OR5MVdWAK7aQ50EUVONtxCSwHTRGfIag6AS9ysrKxP199SyPST2o+JTJrvxhouRnkIg+XU/eVaYUVOH0T1332MUeo8Dv8OdtkNbB42m553r95ny6D4cO0bb5XPL1AkHu/pzdywIZUwPfmrTWkaZYqx+CrhyN7nRWdVaZmjq4b1MbXiV4kbmY6Kk1MYKD+rSwBsHYl4WiTmzhAbf7VYMI5aOqEXCMtnVFSnvGm4L/j5jtv4gZwqmeSnIBWZZBffl//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOq/XLbtSKWeeH7t+2vt0Lp8rFoErt5wIiZIzS5ofgM=;
 b=hp+jmuAEWZb0FMWiQFJnwLKk+vnDFjt7di2cVQgJ50DkC+FeIckAgKfnKpRUa83HAhyjw6YqDNQvuuxysOtwe6wlniaq0KAAQn1APD9J5nm4GX0h4d90/KpkdYD0tRc36XcveFxucAmeoMpO67NX/OesIZva5mauiYSmf8VviLaf4JK6iCeguYBptaV9jgtIXA+95r5KyUW0CxLOIXlxo5fWhP6A+drJY93isYE2o5W3YnDscA4IkZ14nPkDoZQNWk4eNmz4qX0JKh7Cj1viAzzIPn1FUBPdE2bjSp2/8f6uEdtsJsPbD+UjsPtYmuFIff7tngFoH1+TklcJ9BwaUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOq/XLbtSKWeeH7t+2vt0Lp8rFoErt5wIiZIzS5ofgM=;
 b=oUg8vIl9ejR+7s3ds5zfV4P2THgEgCa9n0NT1mPwKYz6yCtJkkgtJauI+ocumqOGfnyHPXFZeWhquDkckMj/pOzYALFTTIyKLBkpX2fNgWARb8oSUIFM8xBFTESuU7X6vR/tKBo09Y+SKp1CAglSy4gskWPs4BThzhnhpk/2mCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AS8PR04MB8689.eurprd04.prod.outlook.com (2603:10a6:20b:428::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 07:12:25 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%7]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 07:12:25 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX95
Date: Wed, 26 Jun 2024 16:12:01 +0900
Message-ID: <20240626071202.7149-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:3:17::35) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AS8PR04MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ebbff32-da30-43c8-5049-08dc95af5480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230038|1800799022|376012|7416012|52116012|366014|38350700012|921018;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?zlLflNd0lpaV3IShgYBa2bxm8pU4FKssCiL8FiwIPP87T5JLg5v8BNQHExPo?=
 =?us-ascii?Q?jEQ1odLPBpkN2EJKnORMnD/J3SmyRXInCMFRQI9qU6CiqXWjudTWYRx9MjP6?=
 =?us-ascii?Q?2ysA7M8/HSGhdkTjc2A+BBb2B3Zw20Q3IHivsgFZE+/Kmd/zaTUCy/05eV3g?=
 =?us-ascii?Q?I1D8PcsZKeJQqCUG4Kljuys8+ggATA4Dlu7rKuxPBJhyfpUrGY2hMUNEqx0t?=
 =?us-ascii?Q?/BtBBxEqIpNmP7WmjHVHXlDS9zFv+reNokDNx3gvZLhKCzXPjgYEbcWbTAde?=
 =?us-ascii?Q?jaqMGKK8LcKw5pkqIkmsWDIf+qve2m7h8jp5eARC+ELCEReQrP8yTlA5GIVH?=
 =?us-ascii?Q?3LPAlqbLDYkD8tS6wolYe+3zqN9La9eMr0pob1Y5qZcZ7J9Z2A44qDh3jIro?=
 =?us-ascii?Q?j7SwkUpKptY1BPAe4yQwxQm768Xlc5CsoXUOYfE+tWk3W9xRJmI2w9wRdSoA?=
 =?us-ascii?Q?26xwLNEpaWEJG0JWmtPr6S/c4SYh+P6IjObOM9xGZdqNC5oOgTg5+yaWxcvl?=
 =?us-ascii?Q?ig5/WLIPU8VJNaLR9VzQL/yUqLOxBmFjTNckkmUVOKC5lfvGOekarkWkYamA?=
 =?us-ascii?Q?c2k9+SRejXrSzy/l5e9PCnb6E1Eg8Rx+WWm9ezbHq2vkSQ1e2Cp6IhSuCrkj?=
 =?us-ascii?Q?n9OA/6xiiDwKQnr569Gr7M4LQXRCS8wuybJu2fMDpDfKOOJOPyb3wPCSJbDf?=
 =?us-ascii?Q?qK6qqy9nEc4BlohYHnaI/iQvYYWk6f0ez1EUmBj7xPqvCNVGuuH+cgB9hce7?=
 =?us-ascii?Q?60bmWaSHymWbqTXh1WBgpQmWnzglwoY8hA7h8QYO55DN1sBj8pAnp/KYkTXF?=
 =?us-ascii?Q?GcGZ5V0L/wpp+rid9OX49yic4cChNXXcWLo6NvISvWVN9XQCUoi/lpTC89Xd?=
 =?us-ascii?Q?lc4LorSK1AUeCh1+yPcsn6RFRpe/Oe0HFcT66C1x/3HCDcdJ+TC6xHjU93jw?=
 =?us-ascii?Q?S31Hmdbmf+K67XtfiCg4QWhiJLPofYQzlkZKzB0KeftYjiW0oJXJMFn0O7UI?=
 =?us-ascii?Q?nlwT2I74zAtxcXUi0HQnu6zErKIBx2kpH0qjlN5whi9uW0nGcNDCRZ43Cy7J?=
 =?us-ascii?Q?kbcMcbo0kCdq6Nq+RMSqdManh8SsL8O6Jrn6TCKQ277D2YloSh9XwazH/8w0?=
 =?us-ascii?Q?P9cDW0EKAH/G64uucvYwVJ2+KpvjdN2ilYPhBRLmHHn8hGtH62XTxvt3fGWj?=
 =?us-ascii?Q?xBMIBaZg1+FMDg3qtGBnZbkqYkVq3UvsaNtaSDSpK46BSOqUeIg3E+fNLMaP?=
 =?us-ascii?Q?oRrj3zE1b8a05suVzpIta0M6xiPvEBE+SliJC0BxR3aqz2POBCmYyGRVVHdu?=
 =?us-ascii?Q?RnRDBAiotOneNwJppROyT2n0uvVHxO9DXAtHwgy9iXI8iPUPwDmUlC99Mf6c?=
 =?us-ascii?Q?wTzAblPQFPGwlGoHHzDxzDOTjYNyKsuTddVs9PQyzQPSfumPif+PGAr/i+gF?=
 =?us-ascii?Q?IvLexXMEM/U=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(1800799022)(376012)(7416012)(52116012)(366014)(38350700012)(921018);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4edOSMwmzBxdQnfMvR9ywbR1gggj6FiAdk7KLDX3/hnEDQ+H4QC56bEe45bk?=
 =?us-ascii?Q?edm0nzQJgNOCvu0+v/FuyK3Nkxr9DVXXaB5KhkXGbseE2vDEixPdPckjUiT2?=
 =?us-ascii?Q?T1JyRjSv3hQEJTmLPqZv58UIm2KRx3v2Vhp+C4SHRTdkRDmIi2ePnUwMygge?=
 =?us-ascii?Q?ebvK/OH8r0hOG1e3/G99lSViQWxLcfNbbmtaUBdZAQxr3UQZ9poo7nyjDfXA?=
 =?us-ascii?Q?z4vGca+ua6yZV5wmqB8zSkvhCtgpKlToe50mIEXRR7zCuvFzUHvrsAVJGYET?=
 =?us-ascii?Q?Uc40hwjRnYGDtINOs0YJE/L84u8KLusArtkPDlZA+5Ox6VWoMartZwy30PJU?=
 =?us-ascii?Q?oOXCD9NzpInUTl7Sf6kaoPl7uJJBiKIRPeMGCmMy2ZN2D1wPBIOzViwhg2j0?=
 =?us-ascii?Q?WONxcR+dmQ9QvHm3I94YJBSU1FFVPkIplP1MAICm6tv/5NSx6mt3TbM3O4Jf?=
 =?us-ascii?Q?NFinX9Q6FHUOHx+L1vHYsttP/wHgLK47WeZyJ3FJrb0+qDmwxuOSmG47PyhS?=
 =?us-ascii?Q?VJD+J+v5faVl0B+MMGDzPWGAQOZRUfU5MyPOOTI3jVH7zqMpUHPMxiGaDzAx?=
 =?us-ascii?Q?rhZJak7d+EjXI9ASDGg4g1Kc1DglIFIwVfOzbIXzhuBQ2+9eBqWOYT17MnDn?=
 =?us-ascii?Q?JC4QzU+oK9+GKmALGLLO5QPBC0CGjwqqFSmvkFrrrghrHAWAMjuYc69u/7Uk?=
 =?us-ascii?Q?Rkb93Ii0UJbVtEXCrJF7LUqFVCedqur80AIYeYyuQWdI/oIFPDm1tYOqLQsx?=
 =?us-ascii?Q?3NozJUwIi928qikv6xsgVfeWH/WGLb2YfpbbOADsPsmT6VvjyPCRNTJBfb+h?=
 =?us-ascii?Q?w8JJVOw1TdLg/mHTPQMzkm7gX/VALcI7Xo335fy4fbexl7ZYF7/SfUQ9RVh0?=
 =?us-ascii?Q?XwNejD51Yc/pSatTXtoeikYqYY/VrYIwvuryrCAfsuqW0/gGUI9gdsVhq249?=
 =?us-ascii?Q?uUxdzHkxDySaywIn+2ISTzKTSdcvDCOiwPaJA7Br6L4kaZLPET76EOTwG8L8?=
 =?us-ascii?Q?Hg4PeCnmE8vwHrVVvvLBCuNay0H6m7ubOk7uaD9n4qBvjHNlgX7tpAAi8w3d?=
 =?us-ascii?Q?KREgtNsPACEYkbXVmIDxWwI0cfC0NkTDMdp8ZcxsanlNrQcYx2CN/RxSlyrN?=
 =?us-ascii?Q?ho02bGLb9/Ef0hRo8M3cMcOby9J7YkaH7RMxia2KkwO5swH0KkLyJhvy8N8b?=
 =?us-ascii?Q?YNOTKBVzIL2A6cwLxUXrQFZLyX1TwauRiKmoKCq9lz4NO9LEqvF4zS0y//0H?=
 =?us-ascii?Q?KgzgNvwGlxZ7UZBvETEjaM2gsGm9ceqsIf3882q8WZWAl4sngc5eZDUZdoTY?=
 =?us-ascii?Q?AhBE+Ybt7k3XJ6gWBByD2kxvZ9Je+VG2lwUwAdpvO/1ohp07bAzHrhVqUrt3?=
 =?us-ascii?Q?Y8yFjF546BTKhaJED0Ar85NtmnvsUbD1GqtnHQ1QjSB5HdhFIpQsMI0+fHGb?=
 =?us-ascii?Q?Etww6jCMMREuxSVFeWMGNBcunHTi7WmIWrVXCeZnuYPatujCUTU37qjc1XHp?=
 =?us-ascii?Q?Rj/2YcBS0Hi1iS6GMgOawwN5Tk/2gZ5kDOyNxQzfy4FS993ieeNOE9LkkTQ2?=
 =?us-ascii?Q?Vh5jHmdkULizedbzJTvsCLxtIM2WnKVwS2oEnyT8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebbff32-da30-43c8-5049-08dc95af5480
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 07:12:25.2883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAyOzIcbk9011ykcG1i+SwAs+R6PmCTDf4h264Kv6gMyMbrElIbC0WT0xxp65iQMEmvHvz7+7pE1KZSYfQYExQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8689
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

Add compatible string for i.MX95 platform which supports audio
function through rpmsg channel between Cortex-A and Cortex-M core.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index 188f38baddec..3d5d435c765b 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -29,6 +29,7 @@ properties:
       - fsl,imx8mp-rpmsg-audio
       - fsl,imx8ulp-rpmsg-audio
       - fsl,imx93-rpmsg-audio
+      - fsl,imx95-rpmsg-audio
 
   clocks:
     items:
-- 
2.43.0

