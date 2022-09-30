Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED395F0538
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 08:46:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf1412Mr6z3cd1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 16:46:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=jj7T5c23;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.21.84; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=jj7T5c23;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf13L5sVjz3042
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 16:46:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+6xsuWPKo0yU3dxC5Z/6NYG9fHMm7lDapM/XqI3k78FSdIhwXNH+u6mTixO04dy77xWJevdhhEQj6WG7mtTgmczxXSkmkKIVp1/pOc52mZWUG/P9/eD/UumxzTQuzhpSJJzAhnlnS6bkndahwVM8WglPprx/aZMfah+cmuqMesjmT44NQ8b3Uu33n2U9hD+jt/V+O3mBC7e41mHKb9kVv2W++RdOROcLYFl0TQ7YCvbKxYNL4bqTWv/0Ssu8IkoF/f32xVHS+OSlJuw1S42XFbKmN3y5UjeeeqvIyDGxWESupmGsgPmY1BGlVxzduk2w4TZ4HTgwYje+tSUBUdI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JA+lfMWEe10GCJnGuF07YDn2tTo0Tu0Qukb/4Y8U2Q=;
 b=aRx955+3NRhiDbv1LoBbSKOnmFOxKVqEb+GmPwvz7p78vCkc/Hwi8kw1NJ5mZ9/+lAm4DH69aVnMcKwUzeChN6QfUHH393Ms//SOeRIBH0r14l0x1boooGgFrQ/YePYVAROdHv5BFbcAoPC0xGLnRj1vZ2o2pJnoTrafnLqlETiGWjasV/dH96C0bEmFQPxMIvPcwtr86/OqYC/VvEYE2fSwEA/8FXgHKsIU0tO+OBYcWA/GZ0v6Xpwp9o88FSJDmPrjpffo38yCSwkq6t7Unh+El7JHNF1JbhBoUZCL8hUDBo5BLDJA9I8pyRI/4cI3uVYkcwaCJ4/1Ts0kYk48Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JA+lfMWEe10GCJnGuF07YDn2tTo0Tu0Qukb/4Y8U2Q=;
 b=jj7T5c239VSwwFArQkc5AyYKlV/AJg7+EXmFMkkBB6d9xzrhFv8tY69h1ROx189FyxCN8OxAaBpGndF5xJV5Ya9u5GAECr2lDpgBYsxWQ36tXOoBCGngn2nvPriC8RLowyNoJlWQ07KAKInwqu4CCsmaGlcPZBx6+8LhvxZ2QFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 06:46:00 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 06:46:00 +0000
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
Subject: [PATCH v3 0/7] Create a new sound card to access MICFIL based on rpmsg channel
Date: Fri, 30 Sep 2022 14:44:34 +0800
Message-Id: <20220930064441.2548505-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0041.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::10)
 To VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|PAXPR04MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da9bebf-9245-4701-3405-08daa2af6f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	LQ8yMqqvw4T+UuYQhWrffO8RM5DXhrjMXYQ0Txmo1DP3JG6LC//wkkEMNfXKH7/JisPTtg6byqxgRsRwZSwF3Z7dYbud7VZN8ZAvmVlElzK+XxNn6XQOppGYDzOWFzq6co2sri65wLJvcEexeRTUptQhZGgWC7rVH3i1CuiHWDT07/69G+yvb+6Xd/WSANNTCcHEKKY6vrajuHCBs3LgQuAJ19l/bK/DUA8tgV7B25bn+ZytISVPxWV7JGTuG0hL4AN+3eLFlfPo9RKtj+93s0Ed80k/EQvnY76JOnc4oXXU4eMQac0udRVMKFAocRybp/gQZsmlX5fnQLXWR/v/zR2MQ+9dgPXJ5YqLb7xtTP4735wDfsHtmwDu9SYfstODEcTIRUTUXcWYZ4RbXI4eIWEahloXcttKyhTjv/SNEjcGftnl2pumnNHdWOaH99xBEQF+3boPXNcZExHyPRe8kH4Lb/QZ4++rFf3N3F8SenF1aZRqPbocprs1Oi4HXNoLJT1QgBDGyAQGF3Wjnx2NtT1SpkH3MXwojULTNkGLTNbENwMnYZhdf7QTKfqGPzGx1kUjm6IyrK8QNDAngNgQHTBKC8s+M+ly/Hpi1Bjni3h5yOxtaWSKbx5GO+1cN4DIyfxdhUYAHMRPm5nnqUHvi5hl9G9kzMblMNz5qBjjGSPdZBjajrg+z1bhApWZxwDDzK5cLscpUlEoyFaFN483jP9DQeHOoE82m6V+rvIH11z6kjLodCyE00oHZ03jOaKphUhl/V9R5BG2I2BQI26CDjHLDf47p4Aaz0AM/fN+xNA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(83380400001)(7416002)(44832011)(5660300002)(66476007)(66556008)(66946007)(316002)(6506007)(41300700001)(4326008)(52116002)(6512007)(26005)(6666004)(36756003)(8936002)(8676002)(86362001)(2906002)(2616005)(186003)(1076003)(38350700002)(38100700002)(921005)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WNslTYWlFcKBpzDj3Qr9JKUFmUYlFDqPzD0Nv0YOcGAndAIsfDCesmSWL39P?=
 =?us-ascii?Q?V8maIQYIo5dG9lUFDZveHLZIHle/0b0aaWeNBgRqyTrlyj7M9AKt3UPVRLP8?=
 =?us-ascii?Q?pxNhR9mopak1VR9XGnsR/7P8upNL1SDpSZMpE9Qa34MoCGzcueyRMILL+eFB?=
 =?us-ascii?Q?WCyzaprLG51327GZifFf+8y6uU5nIcnhGWp6JmknwJhqmuTapUPVHCsw9RPe?=
 =?us-ascii?Q?9TVLvjgn+mANoR2wtuEd6shKF57jJVuyuaBPKlpo+kbmce+E/mCc4Inwud24?=
 =?us-ascii?Q?MH5ZUR1ROzRDVb3RF+tgm0yYNlzuktCtLTZSK/Qy5SdCYi/NGvpxqHYOTI5x?=
 =?us-ascii?Q?U/bGH1uvGRiTxh5916Svu4v5hzC4oyNaaJR1LoWhCRCAnzJJIkmIyWuyx9RL?=
 =?us-ascii?Q?lqoRFlM/Xuqc36AE+mEgVOCKcrYkDc1cycyP36e+kWScPMb9KAOdxSNucA07?=
 =?us-ascii?Q?+y4F0mUc3VkRucMwEkt9JoUiB3o9n08Y1E6wWYzoVsLfseHuYGQyDzVeP/L3?=
 =?us-ascii?Q?mDOsrt+tNDIcWX7zjBtbwfDYDKn6uJcXRgYu9IfPrbcL8UguXkno+rormjzv?=
 =?us-ascii?Q?yeP743zjBQfDYD4S6k6z6e/1PxA8gC5m2+zRU7br2JsJLOW1GWFrKMBjH6UB?=
 =?us-ascii?Q?Lpp5IMTQ4wOY2NqwGKInCe11hJrMj0UQGJqvZstfn2JgzcbRhPEd7fVsG1up?=
 =?us-ascii?Q?wUaHP28eWQrzppo3KpRNam2C1bqkwAcoXBeWIOJRex+OS9Y+m/lTPc5peS8g?=
 =?us-ascii?Q?PlW2w4Wo9kWca/6fqG4YmzPqFtVyfUH8pxfpWFKpVI12ckBG4lyH+aZJe3Ub?=
 =?us-ascii?Q?N6OhWPuE+FCiqH8nNdk8DkHW86i8YZsQ3Ig3pbmTBZDbBt0Y1a5lHwMN9Cdo?=
 =?us-ascii?Q?LpLmiPVDm60OiuPcgnr639gjHTvdre517YPPunbx3Bjbd/w0d/vBWt4ojwmp?=
 =?us-ascii?Q?00iNYgbhtE02v5FFAnAu6wXnkE1J37w+s4Yb8ON/W4TNGFMMpjIKXGCiaWtI?=
 =?us-ascii?Q?FxK9dJfJ1yBPL1jsp1pf1hKjLmwQ25b/MfDUneUAJRltNxhSodxGpsPgihhq?=
 =?us-ascii?Q?3bcgTUJ3ONY1mDw8jAEOssiit5BYN3OTK+9geeX2r9zvrUC1JgDpzm7ovsX1?=
 =?us-ascii?Q?IfmUXTL2RdoNqIfDvj3SgQVJjWF7kpSMaQfvzB5A/U641NBlhPgJTLT7MKXr?=
 =?us-ascii?Q?uPTgeBLVGPk/kerlQ5nkRK04K7uCZHCq3gQ7DEkPa1dVJBoZCSpRmohYEzNU?=
 =?us-ascii?Q?/oRl1oaQG4sVINICv2TRMPqCn+8lsUkrsVEYKLwCxdGwZfI28ECncfagEXk9?=
 =?us-ascii?Q?Svvg26gWUgfHbsBiJI7wbFNedMBaMXfL/Y5wtz75nvJVgsWuegInG5Afv6V1?=
 =?us-ascii?Q?B9qCe1928rA26zYCOEeCv6dwj2nBff/RWtPzh8armcQp3A7tXJDbfJUI1Gj+?=
 =?us-ascii?Q?sD6fhTzSrIYcn1uxMUi/hvMaxT/BDOI225oSwpDj19rg3SH1RHhwadlQuZEJ?=
 =?us-ascii?Q?pG2Yz9PXnw6OBY6G3E3KmCGWMkvXSbr7vzWsuE3JvkLo0PPYu3U4iP+LmL5p?=
 =?us-ascii?Q?fHhCwlhkVCVgN9Gy5hpAFCEh7hhXP53+AkDnhGl6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da9bebf-9245-4701-3405-08daa2af6f6a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 06:46:00.0585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9yTcWmCZlg0kixZJjHdZ47Dm0q8V6HiEmA7gOJ+Sxte4gzfSyMjM3fBLBEwWSxrgIwgUQC9xhSX7NUlKfBCeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640
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

At a previous time, we have successfully created a virtual sound card
based on rpmsg. The sound card works under this mechanism Cortex-A core
tells the Cortex-M core the format, rate, channel, .etc configuration
of the PCM parameters and Cortex-M controls real hardware devices such
as SAI and DMA. From the view of Linux side, the sound card is bound to
a rpmsg channel through which it can access SAI.

Here these patches are introduced to create a new virtual sound card to
access MICFIL based on a new created rpmsg channel. It's easy to create
a new rpmsg channel for MICFIL through rpmsg name service announcment.
Also the other ASoC components bound to this rpmsg MICFIL sound card
will be registered with these patches.

If other sound cards using different hardware devices needs to be
created over rpmsg in the future, these patches can be referred.

changes in v3
- Delete the statement referring to linux drivers in dts

changes in v2:
- Rename property in bindings file according to Krzysztof's comments
- Update codes and comments according to Shengjiu's comments

Chancel Liu (7):
  ASoC: dt-bindings: fsl_rpmsg: Add a property to assign the rpmsg
    channel
  ASoC: imx-audio-rpmsg: Create rpmsg channel for MICFIL
  ASoC: imx-pcm-rpmsg: Register different platform drivers
  ASoC: imx-pcm-rpmsg: Multi-channel support for sound card based on
    rpmsg
  ASoC: fsl_rpmsg: Register different ASoC machine devices
  ASoC: fsl_rpmsg: Multi-channel support in CPU DAI driver
  ASoC: imx-rpmsg: Assign platform driver used by machine driver to link
    with

 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 36 +++++++++++++++++--
 sound/soc/fsl/fsl_rpmsg.c                     |  6 ++--
 sound/soc/fsl/imx-audio-rpmsg.c               |  3 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                 | 10 ++++--
 sound/soc/fsl/imx-rpmsg.c                     |  6 +++-
 5 files changed, 51 insertions(+), 10 deletions(-)

--
2.25.1

