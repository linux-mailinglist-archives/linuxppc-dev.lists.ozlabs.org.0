Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E64827FD8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 08:57:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=OUxXYZx7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8NZr3NPcz3cVx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 18:57:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=OUxXYZx7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260d::600; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:260d::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8NYy75HMz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 18:57:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huJBwMR9uzWCMHVWjjjLABPsCoM9PuffWb30xa5PzcueGhyPvlmMyLFS5V51QAEjKQp1fvdlc5Pws6tOLuOK7zOoodMhlbClUM9CFMF0RbRtxKvHfBk5B3puw3MzWfx7uv9GRDLlwuf6eK9u2Yj6s3W+8O9nTqzqEQt7VkZqkKwthzAIc5LyHKX0TlPf8qCgc9URcXYV5Jt1qAvOz80otJb95UeePMDNepMdidA5stRstg81PFfXGPMaBTY+0eaghpT4L5fUDnhAX2ZLhZCynCt90CS/OkufobFLBbn4ygE50p4Nben7TqhajL+5Z42anoBR/IuQqCaexLzp47MqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQbiZjA7EDN5zEOGAyQMMtT+F6XBWMl/5IrKpQIGPBo=;
 b=fbzsQFFy48i4qFnU2yMFDj8no3U+V9t0hozL1F/3deXi3ngA39CLebP9Y3PtSRE0PSUiyn0S+LPzQzf+xxsR1xtJ4jWmSwmGXzLh9MQTHmK+pwH7Bx0FA6a/xoSIvT9pOnYNtvJ3GM3uG5TBS00EiM4T2gFvEATJCuWS/z/o+ucK+5sgS6tSosPqH9v3Pv0+8aCskYfQjXvqokACJ4jFKNA5ox/p55e+g23HZOPfMXuWzWg+SqF8rqBCdQf7BMWSLUMpmmQd8+7sQc2Z0atR5TtOmmlSDmc/0CzHE4Exb9Ebqa3iBe2FvAfm+eDKuPdNnXyETWvZQP8QoHSo4adk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQbiZjA7EDN5zEOGAyQMMtT+F6XBWMl/5IrKpQIGPBo=;
 b=OUxXYZx7z0ZYfE9iCNXjitRt6bnM68xKK1WuMPp6WLe8hLWoOpu08a0GlPuj3ayESGTz0Ej77VqPnJPGkME8gWXgcZ5tR/g39LehDSpISsoPkWv+S0A74m9PjYk3VBvJslLnG+buN5wyex8OLMhaeKmZj49ufk+JolOiBuvld7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by GVXPR04MB9994.eurprd04.prod.outlook.com (2603:10a6:150:11a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 07:56:49 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c%3]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 07:56:49 +0000
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] ASoC: Support SAI and MICFIL on i.MX95 platform
Date: Tue,  9 Jan 2024 16:55:48 +0900
Message-ID: <20240109075551.870001-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16)
 To DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|GVXPR04MB9994:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4bf19f-549a-444b-0dcf-08dc10e8887a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	XQmF9O0KhgBLrmmjDc/Ve5wwNHa+4hDJfs8a6u03zfXubpQSXJe5BLeDJQRynAi6DGh/ffxA11JRS8FqWu3N60pDtyE+0w1gowv57/G/IM9r4t44Y0sEjLcIqRn8SkDydKMkeKgGpGkmoKC7E0OJ9pfgCVeptl3SfmPYuXf7G6BWTOVYM3nBLb1AU3x/fa5HGx1vSEzEhwuPrPdg/71RK8HFRKOfBsnjLSCcUvwNOmBsK6p8HDh8/7AllvIA/tHolS2g7mfEG2d3x07NqtYeNWyL9FX1NdM6E+pgzQku6Yl6f47ymrNaG9IgKp8+RLz3nXN3wgmABIym+P+DJktLPIeNMhnIK5kI3EwcRxDNQDxHkYeapuCguUTdnTe+1ozZfjgI/6kPS7+gea/L8N3Q8AnJ81j9a6221kvYJHHKsLt3A13ZI3ciKfj/Nlsa4ymIf3dDT3WzI5H3Y4V+S/3sSpTtnQ7h47u05OItniRq74h6ZJa34nEpHO9nJ9azII/7Teg0VguLSYgY+v24hEDgUy6NHVLs9igMJRiE278N5ci9d0NR/X0sg3C1CgS9oChoVF4swKUR9WksPeeAvtZ/BnkZcSIZSWY050XZe8R1lVv8Fury7BnzpL9FmTIyKAGglEqVLNTuJiQaHi5zgyO1uA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(1076003)(2616005)(26005)(52116002)(478600001)(6506007)(6512007)(6486002)(38100700002)(921011)(36756003)(86362001)(38350700005)(4744005)(2906002)(7416002)(41300700001)(5660300002)(83380400001)(66556008)(4326008)(66946007)(316002)(44832011)(8936002)(8676002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pNvKrh7DvC11zDfORfF0S762gNEmixDvJ3hB9C5/AB6gGfPNB9kPu6E+F4GO?=
 =?us-ascii?Q?e/PM4o69ObUVDlDDpx+4TyYxJuoY/zmTY5AmXkqqGasy2HkRFS3QofHbP0r5?=
 =?us-ascii?Q?p/iRE6ezRF5lH9qyZ5UlYtz6nSshUGbVSRbS3N2jlUCHuufNuQ4vsaHFjq0E?=
 =?us-ascii?Q?MNe0e2H13N8oPae8TUu1+Pt/lbXAPDIf0OkpaNII6137nTSRlKRfsjQXLLWn?=
 =?us-ascii?Q?6bAkbiLtjKi3ZMfiG6DJyjJFDRsRZvQ8MnMdPD292QjTgGxMYYjjtMXimQKc?=
 =?us-ascii?Q?+mNs3InoPAlSfh9SF2uUKMLyytDA1rLSPkqZ1sIbWhhkU66PU1g13rlQVhvL?=
 =?us-ascii?Q?IXM2Y3oXKuMT56sq3GSihLayvf4uLfhbkBUfVwBMGy/343v9sMKx7G30eY5H?=
 =?us-ascii?Q?D6Zri8gebSNN2jvmcyWiAMLuaa5ub/SxLUnX5Ow3lPh7RcFoJS6sHjLLWxOP?=
 =?us-ascii?Q?73Uoi+ORaWFjPJxcqm03S0ljCYRUnefGaa/JECg9QMUIqGuBV2kXZ1D2SL1Y?=
 =?us-ascii?Q?9DZYGUz2F9U0tpDVMLDwOeqwsFfa736pi7c8qe9wmGJHGSloUWxxtsORWzGR?=
 =?us-ascii?Q?DkjIAWut+xSrL9QVHceyg+I6vOKhnaLcqM65CzkrGKjv4rNLwHOIK7/fDSHt?=
 =?us-ascii?Q?rxgpwq+zaE7PC7bA0pC4tlIU8+gYLED54ieaz6cK4RFWoE4hDTCmznWLrDU+?=
 =?us-ascii?Q?gyObA96sL9OTnYbLTuztLhjTQHiKxPBVCyhiNgJLNXchkLa+WWg/iGVd/Q2B?=
 =?us-ascii?Q?RG3knf4dZwPV7PO5feMIy9TF9Z4cq0Pyk1hPakR7wLi95CCquLKGRqiAwFnk?=
 =?us-ascii?Q?zGjPzCOZbKbJSD4vPpk+THftz3wTmIcS1NOGhjkSnTuiFyRZfe0GbbdHt8v7?=
 =?us-ascii?Q?SYhS1bGNqRBdpbF24nLVaSNZYf2xHWhnjeLrTxm+TsB33YkVOgmF2xdYhlfe?=
 =?us-ascii?Q?wUnvHNjxEUPBghXJ8AuuX9/7VP0e4MeiPHfBgsZLJuAI67B0Od/UcAV8IwF2?=
 =?us-ascii?Q?VYvI42iq0KswZ1aEzVgx44+KVWfXo7YBSGT8NzBQVZlWhIY+ZBtWN2Vs0ljm?=
 =?us-ascii?Q?0NZMG5d6/DED9de5X8xh3a5B2umiUSAwl9KABqFi4XRQHSslQ7/jy0s5OBE+?=
 =?us-ascii?Q?3IR1jDA0KTIJfbxLF2yZBb9yBnOGseErKBMscXpfFEUk0kUlE4sJPlv3+8uz?=
 =?us-ascii?Q?6imgWCL9A7PleGtxut5LDNgeVpAg/77vbPDmD9TtnzSBZIHTVGFJh8y5/NHL?=
 =?us-ascii?Q?FvttA2/IbCo/EswnvCAUzyGqToa0UEazslNNY62QWpXWtSCyYYpDiU06vQ2Z?=
 =?us-ascii?Q?dbrOwbAdrxtDqF/PrhRcK6sxFqqeQBTq5RgkY9iHNcRV0g2bd6OMk7p77nM4?=
 =?us-ascii?Q?qi4fnHkikZmdF7nCMJbyZqVFePlSlJSxx0IqAdrR5A+sQ6Xv3WIc69ybwWv+?=
 =?us-ascii?Q?gfLaLwBhuBMfoiiTHbZpZvavPcD85VBBX8uU2rcw79Dcau963SUxxdgdff/P?=
 =?us-ascii?Q?tqzByR4C7QDxVhxbaBGiC69z2v4SqW35Me0VaQ5jI+qXaYPChMXqfK40hW5W?=
 =?us-ascii?Q?LECmwtrWCk81yAdqOqkeaJShu81prGAlIN53wvtA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4bf19f-549a-444b-0dcf-08dc10e8887a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:56:49.1007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3vwlxZPU7FkZfmVpVWrJhQWBnRPejFFWHpIFnilwDq6vRTMDu2zx3bK3NJSQKVgbDZRS0rt7xjMQR8nuWCxaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9994
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

Support SAI and MICFIL on i.MX95 platform

Chancel Liu (3):
  ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX95 platform
  ASoC: fsl_sai: Add support for i.MX95 platform
  ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX95
    platform

 .../devicetree/bindings/sound/fsl,micfil.yaml     | 15 +++++++++++----
 .../devicetree/bindings/sound/fsl,sai.yaml        |  1 +
 sound/soc/fsl/fsl_sai.c                           | 13 +++++++++++++
 3 files changed, 25 insertions(+), 4 deletions(-)

--
2.42.0

