Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B27F60EFD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 08:05:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyZsJ4JsVz3c87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 17:05:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=nR+cnfjm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.8.71; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=nR+cnfjm;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80071.outbound.protection.outlook.com [40.107.8.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MyZrK1ddpz2xsc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 17:04:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iyna4aT2sZpW6wa9DWYd1yc4X2qXhRIaepM6wAIXeqgSFqsEZTIZWaFO3ZMEgRtueiQ97FmsfbiM5xMsRq+zh8FZBMG0jlFRtP+6NwOPivmIJGk4NqlP6JmF/H4Spbfln+nDWpD62mt5zgBl56LK+93yNY27f97uxd/sSZsV4gLYKPue19Sjz4h8WyfmmoFwVuag69l0uE5AhxILGXrpt4GdV5MrKq6hUA1SmYh17jqzPEsRJR003IJTMqOmJ56vXlmmlb/pxYGZgAMbrLmtN2A9ZBZcBv9lyHr4QZYRGxKTAHRFs9bqcjusregb8csSlDLOK+OWPJWjyOMpUowJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7z/IMKA3y7ygoa63mjPB10gedAbJxpsIG8WsjUK6hY=;
 b=jcu/+nlQrg5pWDVzD3CYnZX/D+Hx7mL9PPb3GSlQuUO4qI0QyFZ83fEZXXYglQuDyUy5KbrO0kfRfeQf39iJ3XCFfPTpZovUkL+hca5oUoS0RZr/PzJsCJZoAalgLemIcHGZs2flrq3K+fja60Ps8XOcU6hTxF0tAUJ1DnTwrcxV5A4+shvrclWMIk15QjfES/kTM2IyeUsSq5sKYYTrJvcMienPMSINaey1cr3zGH+6A6dfuq+DreasBw/wyTonQEoV9eyt05S3f6LaJ4HkvRZBoBh35Ab9zBfDeYtiTFTwE+nqKHpa3XLj7AK440xWtLw/zNdQBXQN+W9t6ocHzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7z/IMKA3y7ygoa63mjPB10gedAbJxpsIG8WsjUK6hY=;
 b=nR+cnfjmUruo9Nl44GUjuhpxk1urkuOqYwkn2rwlKDbYIj7sGiNQ/So/qMoQLItpHwe370Z4mjBh4t6xQQZWicGLa8Uvn5S9zpnXhQfnkCI4SvHZ4pL6W/hnh0+xuxyTP2fy3U4lHMo2py3vTVRjNt4E/0vwbcjtAu/A2JZoaZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by DU2PR04MB8805.eurprd04.prod.outlook.com (2603:10a6:10:2e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 06:03:55 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::33ab:7f2:7263:ee79]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::33ab:7f2:7263:ee79%6]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 06:03:55 +0000
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
Subject: [PATCH 0/3] Add support for SAI on i.MX93 platform
Date: Thu, 27 Oct 2022 14:03:08 +0800
Message-Id: <20221027060311.2549711-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:4:186::15) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|DU2PR04MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d6b5aa9-c28a-41fe-20bf-08dab7e1078f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	wchpHO3UoyD7wyrilw8wBKLutg/NsXerkm7b0d8eAfp6yOie5HtIj3BpExX6HEZPTUC2Q4A3RZFPb3Uo/iXga8mGgAOniuOJbvLmCj+e1hNBVxf7h0YdIQgt6JE7eV9wKirnUTA1jMqp1c18GYCtDGBb9LLyMThZ/yORwnj0LlBwVT1LJZpTuBbsO3WABSfYlAuaqJGVFpAvbGN0+g/lApGX/rHNIPxVeeaLLeVQV5yZ387n6DhuWVb5x+qKhMUwQwfHKzF9CXdhpFkZsQbGsm0nh77d3w3hPQADOXibdMrNJWXmVZS2JkFi3OjD8GbyOLyFsXPxPI+3dzlnQX63/oo4bLv3TZiZToYvHaqGlViJ2ndMTUoRAyROOLnqI7kBAj4MWsQZfqE8S1WzvyHsCn2q2eMHwfJ7EyN3XmWf0gmuB0zt3keI1f0j1wApT0qdMut7SIUUHs1V2dpLgPCWwF7iyCbhfGZLZ8+1Hn4mOEp2kX4jWldQZeNZ1kboLukKgo5NbPcXKlDdWjYOM0Gfe6nNHmAtjZxvxH6jAShLFPO7/H6E546HIiwEWBmE4pL3R8YyGX6AKVw3/WNm8/ERC++CqruJplONRNkd2dINiqeoi52SBAAvjWKzoXiw/XfvLk6AbmqpWJTbeFFWcKg0P7FjoUCvWIqKK2pDE3TZpZ7SIq6u3hnx/6/Gx1UVfDNiqipU8fEAY6OPn/i1mfo60MkYQTGmymdpyhwJNULSD65aTddPPlo0E4ss6yEt+drpgpdFy56QjxHlolWSh/PmClkncd974UdbKjDDWcwjmeE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199015)(38350700002)(7416002)(4744005)(38100700002)(2906002)(5660300002)(83380400001)(36756003)(86362001)(921005)(186003)(1076003)(26005)(6512007)(52116002)(6666004)(2616005)(6486002)(478600001)(316002)(41300700001)(44832011)(66476007)(8676002)(66556008)(66946007)(4326008)(6506007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Bhd33wyHRcBQV6oL3mfCMY2kKdJi/udjiuBZnizzI8VbLVGvZG2dkmSIH2Qa?=
 =?us-ascii?Q?vDdNAOjlpbg/48jtA7cTS2WD9eaVuPMdLpzrNHMPOIDF01Noowng5rPRlVYU?=
 =?us-ascii?Q?d6j3wV7HHOEgPnGt3ToJChu2Yz3B6rWkNyZa4AyGDTrbG17PwWTBncBcNGNN?=
 =?us-ascii?Q?NrFvEtK23nYFEetPNezzXyPWQbf6SpBuSwucQyn6yj+vXbRv8K5vWPSO+gQV?=
 =?us-ascii?Q?tfisAJwd8G4nUnUGLmYDXgWLWErBG/vgQKx8yxR+2VYNztr/DMOgYIjPyCJQ?=
 =?us-ascii?Q?TMZsRkYLAQ46aM82WWDaX1QYVOqdCIFTRV/RbUlsrZ9RxTsT3/t/0pvy6s9Y?=
 =?us-ascii?Q?hnsw451uD0YXdqnEkmoAP1KTqDL1sMuTPGJHlm4Q+qHf5d7lyzZK2fVD1/2E?=
 =?us-ascii?Q?yOuxncvKiE4/C8I1yQciZVaJfjuF5N2pt5WJdaVcTdIlYC0sjDp6D4rBckV6?=
 =?us-ascii?Q?Z0/LlVSinvlO+Rm+WyvZK0avStYpjFh0JhyEEZaX/XHrJmA9mIi71s0gtjzE?=
 =?us-ascii?Q?nxXq6UARuOqChO6/na5sUX8NzJzjFZLvkaQIgSxZzz6yeKbBOPP6Z8t86x8f?=
 =?us-ascii?Q?XuDxKzaW1Io6dKEZvfakkIl57TzqE8Uazp2qK8vFFs60vGuWVKGexFYvUrda?=
 =?us-ascii?Q?Yydppo+JTAU8f1VB943cCbmXNgkEZ6JVk0ZVOhUKWk+dqZ97vEbzqZa/jIJv?=
 =?us-ascii?Q?VJ4WmyMBENwd2OYpFjHsCd+69YHSgHmpmmwYizVtzmnl7E9wG8NSGbzFrxzm?=
 =?us-ascii?Q?lLEMtpOp6EDcAJNlMmH6BhVGvdVJUN7pYf2BUKL0zAhl2au9PvtOL8kN4FcD?=
 =?us-ascii?Q?G5sSsurONud8rRQzyZjkuiZkW9LKzPiecHxpPmUt8URbNarJ1kuVxSKtFsEF?=
 =?us-ascii?Q?rgG8yurIEfKTfbzLPf1Rjrt1j2x8M42xhafzJsvzpgrzVc/E0uxZDOWI2fuR?=
 =?us-ascii?Q?uu44mk5OY74GqOq/fxKcta9mPTqDx4Nq1GEoY2qtWy+D+bPwpKelgPt55wws?=
 =?us-ascii?Q?ZvXablh7zw4a1ySnspbaJn/BjfGQeU18fNTZ3+H5175+92b10cwdvL89oWol?=
 =?us-ascii?Q?snhbZLdWm6P3AJu37pUZ9tsETFh4zXN5STMZeoWBjF2L/A3aEZIaSrLg6bz3?=
 =?us-ascii?Q?t9eovNZ4TuSAN92JgHWVJkyPpgvOeEvuMqL1p/3nyK1DsPHNo9hE0uUdO/jU?=
 =?us-ascii?Q?tHAr6UcsFU3VdhChOVAB6t467scgedMSKlQ5NK8zuLJ0D4Puy+0SuO5Xu2wn?=
 =?us-ascii?Q?PZMQputijmnt2zqwfrwwz/T022tt3ajNVpCsAe+D2+nuRXtW3JwIUEkuQvkU?=
 =?us-ascii?Q?NA7xuKAZedkjcOWT8GmKxTyzIR5VtELpBuh352ny+SukijRQFRWjxzQ5CFvZ?=
 =?us-ascii?Q?gwbBrUQF8x1nYrm90WdhfS7F6VV78bgFxvdSl1zXJ3zP2AFVjFd3KYw4KeL2?=
 =?us-ascii?Q?VpHp9F/aMmp4w1PPxZrgSW6uer+QjlFg5rm1P3ri3NXK5A/TujPIX4vhQ8/A?=
 =?us-ascii?Q?4MJXrkNG1XCQYk+OA0QksKf8rvRExgwWfzooJnsbO6UQavj5wm+9evivAp6I?=
 =?us-ascii?Q?oXFQ9gQYzxDq32yafpRqG6S8fzzHggsbogARhMqh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6b5aa9-c28a-41fe-20bf-08dab7e1078f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 06:03:55.1816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcGzFdiOTDhTlJi6l23fN6TFCQDhySjr6ySsndl+7tTHG9V2ecnayFMinxM5b7roZNP1wB++7cXhIQM/M0KKWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8805
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

This patchset supports SAI on i.MX93 platform.

Chancel Liu (3):
  ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX93 platform
  ASoC: fsl_sai: Add support for i.MX93 platform
  ASoC: fsl_sai: Specify the maxburst to 8 on i.MX93 platform

 .../devicetree/bindings/sound/fsl,sai.yaml    |  1 +
 sound/soc/fsl/fsl_sai.c                       | 23 +++++++++++++++----
 sound/soc/fsl/fsl_sai.h                       |  1 +
 3 files changed, 21 insertions(+), 4 deletions(-)

--
2.25.1

