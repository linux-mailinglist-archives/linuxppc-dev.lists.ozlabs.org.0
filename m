Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA6D610C3B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 10:31:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzG3Y0Ky0z3dsJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 19:31:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=G54I37IN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.6.42; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=G54I37IN;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60042.outbound.protection.outlook.com [40.107.6.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzG0V2flGz3bqt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 19:28:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiFeWYEbCLwEFqgSbhC/TMnGUg37TSKpHUD8P+cazBXOFjgVM4FZ0wHkqDyLtywr3vh9yEAd4+iTB5s6QZ7n6rrIuX1z+5OXp9BYAGwT07EUG6ucYMVKyvLIQLF1pxj1KzrpIW+ky1xDeOp5HC6p1PcFjw6LyZn1Tdt6/ycHPdNpmOX+D/2mv4V3juUaf+VFhjMIYJ2RGlUJ35VGrMXrxtZxyl5upzkPRGVEBHfPjLzKFybKBvkugoY/tBLCiLmGWzP9ChNgP3kP62Jyv2L2YkCgxlRFY+BAb8Mce6iOf4XS2vCKOrIymrp2yXKUOtVgYPuRxnarjDwm0k975KAIMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+5PDrCkDa3tyypP39fJzbLkUlVhQaPxOiqqXef4VRI=;
 b=mb6BuqFzr0D866ja3RdnUP2K1sbJOTCwSb7HTpD7f93Mgvz3TEEBhbwnCqiwRa14QnCqvn4BN/OdHTBYKAMDAnLaYAfmvA6nqaJvCcPUS+lNnmslmTNzuFJ3LQSusesYJ50WiaIuMzEQxf+1f+cTAJ3i/PhgSlfoXDUdI1bDZsqz1jOU8k7Y1eimV2mtJvbu1TkoRN/CM3stXA9Lbw4dhwke20apbddGfFgkdeWcRiyw+a8gLcBb1SIIeHYQBJtmFt8+RhkPIdPtQ7IIuuej/zlSfcC/ur0nvNZ8K2vk7tt+pDTusFzC/fZondubRuBkWTY9tdZMBUEOiqJaOoU9jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+5PDrCkDa3tyypP39fJzbLkUlVhQaPxOiqqXef4VRI=;
 b=G54I37INf1ybhohmDMw+RR/co/a/NbKNo28ojOUqE2NhdT5wsIdZUyrClCRGsLAzBb2MqaZOVjW2aEye/sNIARmhIvZ9nlXoLSJR+StUfMVQ93HOz1Ma4uiy5dAgE8g5yn8M8gMWUZkejrNNNN5iM+fSpBrgsmcOdQQS8TDZ7sI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4213.eurprd04.prod.outlook.com (2603:10a6:209:4a::21)
 by DBBPR04MB7755.eurprd04.prod.outlook.com (2603:10a6:10:1e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 08:28:32 +0000
Received: from AM6PR04MB4213.eurprd04.prod.outlook.com
 ([fe80::1991:3060:d022:a541]) by AM6PR04MB4213.eurprd04.prod.outlook.com
 ([fe80::1991:3060:d022:a541%4]) with mapi id 15.20.5746.021; Fri, 28 Oct 2022
 08:28:32 +0000
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
Subject: [PATCH 2/3] ASoC: fsl_micfil: Add support for i.MX93 platform
Date: Fri, 28 Oct 2022 16:27:49 +0800
Message-Id: <20221028082750.991822-3-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3b26c7bf-1b72-4fa0-19c4-08dab8be65aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	z/YZx7ariVB+4WHd8pms2be4LhaF8J8PML9A58yMStapS1860m38+18J5n70KrtV/Bu/GfYkP2cLLwofWaEO1V/71IldPc7pcccs+MBsOzsKIgkMwHdlbTmGQgG/0muJGjzLRo4hgB1scJkheVwb18dPpTNeDZCDOkGXPTahkxzgDDxfFeYZyEY16P98fxiyAAO+bW91e7xHQVFM6gK3/O+XPDJjTOxWZrDTVnM1iM/5D2hWBu1i605m11EcW+DgG6U612AYiXee3A7GwB6mEv6qgW4nGT+ZCCgmX9M+T4/aoYGqJ+cq0IrhpLerXLHJayq23SI+51ZSGeZY/jROSCoXonRNNYrpud0H2GTYxfVtUCmD5bSg4Q4ro226xVaSDxf9wz425QmRAp/gS5ed4CLX7DVZzhJOvJEz2L7jVUsI7HnxivxphRnauBKRH2tta8COYjISW51qpJcYmvSbqYhn1gbjZ8AxMzjB3gdh8cNKUoVwV7BPD73VKZLzDO29RzTXID0gZB+9PPpJEHpLuMwdBAgFEiVCflPfkweRpkUhIgfE0IyeybuoOuaLsD55glYEhNMv/SfkVIs3OwAMsSx5jOGMxvNyiLeuDNxVXdz6N/F5xA6GQe3hi0E3RDx9DkNZSdAIbTNvMyQ+yYZtMXwBZazu0Td6eBQ3Ex8WsZRUaKsIHT9FpeAsWSpTte2ojwkWPCKdRfLAEnCHlHDftwU/2a/hnD3ZVjLsR0+O1ORH9Daoaeem6cBLhPwRJW0z9MwJlVJoMPF/neoTltoj1UBMs1yCIwoluhH7uahTrmg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4213.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199015)(44832011)(66946007)(7416002)(38100700002)(4326008)(2906002)(66556008)(316002)(4744005)(8936002)(41300700001)(66476007)(5660300002)(478600001)(8676002)(921005)(36756003)(38350700002)(6506007)(6486002)(2616005)(26005)(52116002)(6666004)(1076003)(186003)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?EwEZ+CSJuezH7lXn4frqejqDv3aB2mfHgMzj87rDUVixG0Sk9lO3iEdCxmvN?=
 =?us-ascii?Q?JqrEQpwyzzgdMzi4RoH8KflVEi+SMrG5l23jkZ3vED3RseUKUdhszlXi04/f?=
 =?us-ascii?Q?969wUEbL5ltP7vQTdwKrb9vq97FWx+CHlLFRKQKx3oMknlIZe+5Z6GoTS6mn?=
 =?us-ascii?Q?Bh7VIqw6cvCQ18W1u77PT9PWJYjyHBVHJbozO5xemqsBLZhS9LuSrkTRx1n5?=
 =?us-ascii?Q?6oVNoi+b641xUU88ag9wGm9ZYHDFDyXENV37UarvwbFbP7LuilSWJQn+2HcC?=
 =?us-ascii?Q?t91xx4T/hj6MNUQAvRmMt7u7s3iK9WTr4RMZogHhJ7uks5YhXphCsPgque/F?=
 =?us-ascii?Q?uwIOkLeWdPPJNzolg8tvbw931Wd0nMxOln9Bg1HWpwV5xTL6+x+l8dgHMQnx?=
 =?us-ascii?Q?YQ038GDdhd9x/Fgkq5J+fSrk7RTrJgsmmBuVhSZDu3t2G7O43Zk+5HPBpHc8?=
 =?us-ascii?Q?pNEdeen2K7zc1aVuhvIzSxGOcUpBVEzef6DFGYf5DpE6CHkkv9YFgTcu7WOZ?=
 =?us-ascii?Q?EWjRmSejX8U7Xe3zS1QTfYK1uFyc2HH0bRSkjGRaGFty32vkmQi4dohnUc/y?=
 =?us-ascii?Q?gsbcSbpu69OGWkYFTyYH6fLL/I1qEjUg00DOgKQT6WUTafZZuKZh0z2K6SZu?=
 =?us-ascii?Q?5baZF0p6e9cJHajup/PCIa4rgl37zwAgHLrCSDJW8SodgQiILEblz5cqQaGE?=
 =?us-ascii?Q?Gd+mv/SmO35eMlZ4VicI7fxy6T2BfQgNpdn6xBSrv9Iwlvu3b/A/OgRU+eJl?=
 =?us-ascii?Q?UWWytaOU+0pZkAZH7Lc+q6BvuxVtyeW5iWRRX+iBBD+4+qbW9XAc64P874td?=
 =?us-ascii?Q?oyiX+ELgX7UO7V8LL/aW/snd6Jl9qjWn4K/VsAmvVch4QzXIBDDARKoPa8Df?=
 =?us-ascii?Q?OApJETdZewDticNVqqlMguchKOMaJE6uv8XO+67/STctpSwGKofwiKWR6qQs?=
 =?us-ascii?Q?W8et7HPgBKLLNT0ji25nF4rS00lrj76mJp8mnkmTKJGRHY/005bC8TMoQ2DL?=
 =?us-ascii?Q?96xzd+5KNoYn+h1IV1P21CU5zARBxmuwsieUJuiiC13XnUBjKbOpE+kttO6N?=
 =?us-ascii?Q?rDjLutT5DJVxXaQ/m3QoA8E1crHW9CuhTw8VFVPZNi044mRKJUSgQrCtPxEH?=
 =?us-ascii?Q?vc5lLVWXJVtAgBf/YJxMPoK35+MYs2dMR13o5wsNcbtFvIdXX+uCG4udJUhh?=
 =?us-ascii?Q?7pxzHjsuSrlVC1BoTE2p+v/dmniQDmWNqoz4LXxfyf/Rh+5MCPXYPloX12mX?=
 =?us-ascii?Q?pIsVyRo79DsLjGvkH6fAzHWnfx/q4vYQL2qiHzKZp/X3Ac1D6WcvTg7mMwoG?=
 =?us-ascii?Q?JgXRhPPLRUCK5Jvh2E8PpFtxxt007zx2MJtft9IYHghbToiWfYrqV3Uu2hkA?=
 =?us-ascii?Q?FXpRAlU7OS4k7yXd3whPi4jOc71sZJX0/3XrUHOIFjVOhhavlHkRIgGjjsC9?=
 =?us-ascii?Q?cdeezLzE7IUxZHuQu7tsLddpgc2yTsTvM5rT4LUeY04ADP3ZCbaLuDyMVAKq?=
 =?us-ascii?Q?q0A/h+E7/DNfLHUJ2g9aiBTLhBajO+J+vPVGJgowAz9p0WUe9joXRL8kRYqn?=
 =?us-ascii?Q?MlrcP25Sbx2TS15lfeKtZVk8d6msGOubSK23QghY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b26c7bf-1b72-4fa0-19c4-08dab8be65aa
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4213.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 08:28:31.9977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHmNhRjKIVGzxVZtxKvqyKfGo6UEHlInJmBV+UfXkE7mHtADAtA6n2amuaYckwWLxBNruiijQhW3PgRE02fH3g==
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

Add compatible string and specific soc data to support MICFIL on i.MX93
platform.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index eeaa75fb9196..b8a9504441df 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -82,9 +82,18 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mp = {
 	.formats = SNDRV_PCM_FMTBIT_S32_LE,
 };
 
+static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
+	.imx = true,
+	.fifos = 8,
+	.fifo_depth = 32,
+	.dataline =  0xf,
+	.formats = SNDRV_PCM_FMTBIT_S32_LE,
+};
+
 static const struct of_device_id fsl_micfil_dt_ids[] = {
 	{ .compatible = "fsl,imx8mm-micfil", .data = &fsl_micfil_imx8mm },
 	{ .compatible = "fsl,imx8mp-micfil", .data = &fsl_micfil_imx8mp },
+	{ .compatible = "fsl,imx93-micfil", .data = &fsl_micfil_imx93 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_micfil_dt_ids);
-- 
2.25.1

