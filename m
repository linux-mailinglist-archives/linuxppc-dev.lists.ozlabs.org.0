Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0602C610C31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 10:29:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzG1S6QcKz3cK2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 19:29:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=flC9jFgB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.6.42; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=flC9jFgB;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60042.outbound.protection.outlook.com [40.107.6.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzG0S0ZVfz3bqt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 19:28:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dInrPjHXt7fQcOilH5oY4aX+hMI2K97QkBo+ndRSfcDPqwJsAGCUOh+FY0E+0smdvMF/2P8QwnQmpftL5+FYq1uvW5i9H1hXcMxE4vgMK2lQeS9Q2IAmzV1lCGGc2RRaV2fJ35jmj7ak0OkdoPIkEXvE9Rs7MFq0IZPLbEsRJivqMKky6kXy5IZlUph8R1SA53Gka1f1m/CwKAbngsZ/epuzciAPm24CGLDYnk0cEutqs9IO5lcGieSJ60H3Lpf4xlUkyf0CKSpkJNJ0dJF4TGCiGOfA3uVjmq5kU1DV1hsufcs4/88tZrbdHUqQGxJzHztcEE3+OPTsF6Ut9zPWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ElbBtTD6uLwAkpkL+VKeeBVjXwKEVaLkeNtsoGirC8=;
 b=QQC1PkuzQCblzNye1oZW+BXGOltqYpteNZ/Ww9k5UoMPphyx4k+hl9bmpC5Qvpl4XMRVeLD7UFibjjyNTYGstBPJxuWTBvfKXolK2fSSf/OzEBDjEOdfcDma/YV1AtLpFKbZ7bUhNh/xuAal+Ifo6brEx8NqSYoZX9MC8T2puU6INLQ1fowPu08ouE9LIgITdwgxci3H6sYrP0gSysmO4gL4P8hOTmf/6+MGbVueLsVwHc8bAw3rCopgwwTLmPmxVMTd3ddnUiqshkTi91C1nQwzlZhWLIMt5qSGatd3fHHMAlq0Kaft8Ze1g8iY0L2tIA1+AahXOVTXC4AxCD7PQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ElbBtTD6uLwAkpkL+VKeeBVjXwKEVaLkeNtsoGirC8=;
 b=flC9jFgBHu66DgDQsfToytafj96dvaFPYqlAy7Sp+zC0m3DcOSWGvK3rufLYSIsS8XyLyKAnJLJHJqraVE7sNz3bhR2p3tLKEIkGa/rei7HClwxijTpdCj2z/lfp8Co3t2YJqrCij6nisrxX03Rqu6EEEUs6U1exlUGyyXoGuCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4213.eurprd04.prod.outlook.com (2603:10a6:209:4a::21)
 by DBBPR04MB7755.eurprd04.prod.outlook.com (2603:10a6:10:1e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 08:28:19 +0000
Received: from AM6PR04MB4213.eurprd04.prod.outlook.com
 ([fe80::1991:3060:d022:a541]) by AM6PR04MB4213.eurprd04.prod.outlook.com
 ([fe80::1991:3060:d022:a541%4]) with mapi id 15.20.5746.021; Fri, 28 Oct 2022
 08:28:19 +0000
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
Subject: [PATCH 0/3] Add support for MICFIL on i.MX93 platform
Date: Fri, 28 Oct 2022 16:27:47 +0800
Message-Id: <20221028082750.991822-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0210.apcprd04.prod.outlook.com
 (2603:1096:4:187::7) To AM6PR04MB4213.eurprd04.prod.outlook.com
 (2603:10a6:209:4a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4213:EE_|DBBPR04MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: 68698188-c51e-4173-607b-08dab8be5e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iigU3qgEwK0eKam6P+6c9Yb/oeKwHvmtQzs/a8DF4qsc99MSpX8B2tNqw+IHeB94+H8GfV2lHfNT3MumfC2PyJWBagpGN+QBOtdriO4oWGON8z2IeSUD/vQCTNDs4e1LxypWEskpNAk6X6wUoxvyoVMsYuDK/T86xJ/9ncgjDXwhaAgGkzeOMLAEyLe5T1bHfctS69rnMdtIXbifXF4I46uATUUp1N5xMI58sZUWG7CK/eUzdQKiZORizSauVnsOzNBMlRYVCsHJvKanNHnEH7/OgoMea1vfa039pXXXKEncskJFdOexPBPkYsJQtC3MF6dgSGoTeodM1QbBl0nF+AweIjb+ag6GjWW9lVyIkWcFNKfBhErwO7N0yccu4rvrkE01mXZwQEbAX2WLmOvWvIy6vB/vRYDqdWdx+i44Sg2FgU3eZfC+5Jhhm2X0t12CK2JIlNH+ehDwzfk3KjiVtj8h4bD1+5/P1bbk5rJwr0rWMyLGf1cqmgefIrHX91kEZ6kBZDMV0rwCyr2C66CVPaqiep/hoU9TAa+/cKevcLeit3qn1P/SjU2Eh9vMMcx9TsK9idimCWwSYfLfz+C1yJANwhZxLc/JMJMETVvKfs3wW1tL5tRDfIJqoUaV5dIeaeJBCW7D5WG4AO/YOO3KQtw3mI0LT2EjkzQnk6wAFuqz78pxOpZ7L9Oxr0epBmAih1iH2lqaDOQyejozHqbS+2PwqjIZh6cbE+Cl0ksA6ka0NQm1MO+5T9GnZJQR6dolmyvSY/VJTOh2RGwNWy7XT7j8pWHrw+bVJt8fS0P3KaQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4213.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199015)(44832011)(66946007)(7416002)(38100700002)(4326008)(2906002)(66556008)(316002)(4744005)(8936002)(41300700001)(66476007)(5660300002)(478600001)(8676002)(921005)(36756003)(38350700002)(6506007)(6486002)(2616005)(26005)(52116002)(6666004)(1076003)(186003)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?paY2/GVVZ0SA8xeLLhH7aQ4XnZFcQHQO9rOaudXzgX/oWRVCZzen5XnW2/bM?=
 =?us-ascii?Q?1w3FtJ5xDZ37k60ZpM4qhVwgPkuMOFyft70+odgylkZ3my5M9Kcn8oM4UeBR?=
 =?us-ascii?Q?ZozbH4XPaIFr1bp0PE4LhfU9ApJwRXwWyaQTylSV+unPT96rRApzUy7ePlC+?=
 =?us-ascii?Q?xEVZU0gdRTUxLMvsRnY2jLFHwS1K9/royHqnmZ90YE/fgmkGbZkXcRyCd2su?=
 =?us-ascii?Q?WNo/noGdGa+BW4uZQ/r0/+of/VyqdRcHWezDCqn7RCyOXZm81plV0YrE/aCO?=
 =?us-ascii?Q?GBlJ+AN/lGnelPCKsGcC6IumjzEVodiQyOMW+CmriAI5nKFKrsb+S8zSvASM?=
 =?us-ascii?Q?4ZZVorsy1UkVvo84wN/YTgh7KqW0w/F4erkj+RR+0yFpuzhL/qoU7R5JwMj9?=
 =?us-ascii?Q?1AdXE3J73pE5W9vzkYdC8948lkGqR0s5a74WYNZ/wL6VZCuUdMbx8066jfGv?=
 =?us-ascii?Q?oa+hI4eaP+dsiSihXJPUpqxLtUJ45m5bLVvIXXV9rpngMGqh7nKOW9RYmIwv?=
 =?us-ascii?Q?xHaRyyspNX/SVgV4SqYyzXe+xDcg1080MsKQ/8YILWsMTFyAGooC785hCvY5?=
 =?us-ascii?Q?Wt5vAjXfUWuUn6JtvT3hFx1HBssnKZeWkPqhHQGlpmgPwSlfOkoldvS2Hyj+?=
 =?us-ascii?Q?5QyS7VGBff9fq5NejQL6j02xoUVjWkNQcHEmJ7Onh844y/JPrJkoBcqmsdnV?=
 =?us-ascii?Q?b7Vmioig4NtRxv4iwkWB16gqSwvnkUUe2ZPa+IGE7VaDIVU2cOT9kBDSIhjw?=
 =?us-ascii?Q?o3QU8sh/hmDKq8Q2B2OIzbamFVMX9AjIYC1rBX4KJgKI1koAbb7DvrLQ7onu?=
 =?us-ascii?Q?rF2Su4bNBxCiKnal08TmyoN8qzEfJeL66txhuEL09ANeZc4LrRTpk2fXUP9M?=
 =?us-ascii?Q?RxTnBAZZF/lS8SmbL8QBmbMtE2/qamtiLVDy5963tT8G+o37dWqEYLSudXVM?=
 =?us-ascii?Q?rmLEedfDIoO//0lFRvC79vEtSJEb6V3pF6rKaCm9K6hphOaPhAZDctjgMOAo?=
 =?us-ascii?Q?d1mk5hyv452I2RJNZKwW4j1RiigAt2EnTlxtW7dXRszr9FyAyD9/NVyZsUUB?=
 =?us-ascii?Q?Pe1TWsFUVyCNdNWs4ELxBpv7nmAWZP+Rn+uo2vTP3desoq+BTwuhOyEBBqct?=
 =?us-ascii?Q?F0toz6H97E+7Upy118KZe7/dMyoxVurUj6bddQScUR6s+fhXx5Soz5cXAvgn?=
 =?us-ascii?Q?02e0T7yVDsqb/Gg/lo9IFouA8lZUArwog9o+BxNXO9zqTT6/N+AxxFTWCq3O?=
 =?us-ascii?Q?v5VpwDjXi8emLFWa12t2cuw3uC01f5l6itUeP9T0uxwJyceYqdfnrnh4McBW?=
 =?us-ascii?Q?+SAr/T4dZxWHe44RFDYPg3aUMMBABMYE8VpIKykIO8WDe07Hz3kxq6T+AtED?=
 =?us-ascii?Q?Ps3nnP4Zdgj/mg5/Ms25dronCCAzDrRgRKR5819wt4xOs5OTtskCBxb0K8QI?=
 =?us-ascii?Q?lri8MPB+xjB7KkehxAAMW/+0wJ6AxwnZajgOjkZcpXfrBfNxi6gPdXyluSXq?=
 =?us-ascii?Q?OWpAYHZdK/wkN9IxMpSMJeFYahH5IcZvrUR2Vlsbnek4OAc3gEy1p/gxQEaE?=
 =?us-ascii?Q?zvYXGHnYMVvP51PwT2iNl5O6qV6riyNYEruxrB1f?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68698188-c51e-4173-607b-08dab8be5e2d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4213.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 08:28:19.3269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StP7zgLzABdmzSIDBEthaonq0pPdEpRUBUw5Hhj6rwqRLRir62hjZ4QYzLyHX5YFP9pRwAk6bh6NVZ0mcqd5Fg==
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

This patchset supports MICFIL on i.MX93 platform.

Chancel Liu (3):
  ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX93
    platform
  ASoC: fsl_micfil: Add support for i.MX93 platform
  ASoC: fsl_micfil: Add support when using eDMA

 .../devicetree/bindings/sound/fsl,micfil.yaml       |  1 +
 sound/soc/fsl/fsl_micfil.c                          | 13 +++++++++++++
 2 files changed, 14 insertions(+)

--
2.25.1

