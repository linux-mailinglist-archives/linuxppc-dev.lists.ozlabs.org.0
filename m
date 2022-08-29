Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 588605A4B88
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 14:22:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGV1x3Kq9z3bnV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 22:22:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=DGDRD7JI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.21.70; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=DGDRD7JI;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGN6k6ZwSz3bY5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 17:56:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7XBzdXNZkAag/qGc07a3Ou9YX6v2bNA0XvSyNm5SjZEYQLtJCNzzzxW3BJ1fEHehhxM7EElzNH8enPhYv2juiGZDnPPD8rrLH5KITDZU9EiqY9wbmMuYkinzhitBg9+heWsKZAmlKBUBSCcrL0xljNpDbQw+KXwAZpc7ZpoKxs5Ktcr8XoNm90jlJlHB8hyZ+9BgvcR6sKqZb5m+DxqXjoiV56g5G8QNTyrvPy3qdrqBRJiq8V6oSUacA6OhEVFJCN89Grdxd6HkhMZkHSp1TLFcWAlguIxc+9IKasFolyGKbSWqztbzPfDgL49gt49z+gwToUGK4AtrOijv8Qmjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVuBw52pC0wM0ynQfdfQ75zsf3a8DcBHIpsVIwVQkTE=;
 b=XTJd2yI2govGyAfDazZNpkSO7HAtapNhaEYmUzfYqHXW3fgDENYz46u7pIHeRAKt2AOjmG40Pxrcd1vyYmgK6YE4OI2yJEZmwNNqod2n8e8tx81CHHyNYoAVaj3KRP49j2OR+vBjCHo/udFWrft0qd9El1znsLRjyH1K0unIXcTX3sh/jPBUX+Hrv0VRmmIEI4STbw4Vr6sc2w5KNyuJXxMaBzKGFBXsZHO+l6onXNt1shxwPKtXmJsZpz5vDATylKf0Z+x5TCErEeSA0c9/FKkIqZ5GXUgKVVDX0iH5y1KBykzYUAuTFsXWOYaoHi7k4Lvi3OITZAZXi0WP7bzbtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVuBw52pC0wM0ynQfdfQ75zsf3a8DcBHIpsVIwVQkTE=;
 b=DGDRD7JIRE12hw/H3DHNee4rUOLxD4YoTUTTPmBWmYJCV2WLr3h4n54DfcKLQ8D+CwLv23I8oGKK9gpKKnbQq6B1tXcWtzRCKK/wo8C83ooT7xcouKWn0kzlvljV4W2v0mIS4OnN8Iazdk28X/2QGouXDqvHOPQmVcta5S6Ty/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PR3PR04MB7482.eurprd04.prod.outlook.com (2603:10a6:102:8f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 07:55:53 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::3139:70b4:6648:bd32]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::3139:70b4:6648:bd32%4]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 07:55:53 +0000
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
	shengjiu.wang@nxp.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/5] Create a new sound card to access MICFIL based on rpmsg channel
Date: Mon, 29 Aug 2022 15:51:39 +0800
Message-Id: <20220829075144.2405000-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45b6a89b-30a0-4e36-0c92-08da8993e577
X-MS-TrafficTypeDiagnostic: PR3PR04MB7482:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VgE8hGf73FMjvzg6L5YfJXhz8yuIc+w4vzk7YUPbQbEodUYe00lndtYf4PlRv/u8gKEqtqDRcdd/E5WsVi9kuQNl9HHiImuxP+zXkAIL/azqsJFRt/mSCIy9lsxjdpVq4ShZR4HMz7yL0pN9NHJ3l3mLPvvn3w65bERBj69NJkjKIGcYG477iIGOQDxsxYEv+OcyYH6HM62SKoOOfbou2ZH17gIzIRnOQVD/wOPQPyACZU5DpgbnZEBRp6BX5s3jSybyjdPIdPUiueKRRSP3E7Knb57o0FzQVYVdRsO62nT5uDtlMMFk4SYiEU6hDABcxXD/ph3n+4wL+Au7EpCz+Z5kwcJSoUxlQOMwdlprUkI6mrHQ1cy86ipkDuNI7s+uchF+pAwQYreOmIeAq3tPvWK43rX1xwj31dxQ/QwU9mTaOg/bVOReSxyMSsKpNwaJ2bPGxhnvA4Iw1Iv2qKry1uEFoa8cPqBQYIKJQQyUZidPlaIkeL5xwt/1IVDYxMRVCT1y21aWJITUXYEhvbBhw1n89daK6XSMmiSROLx1Nec79fZBN4SVAs474obqcgrvkw7A0epKMdChhFD4PdUCxKnGw6KIjh5i6TzTZny8NzvVabTqCeF9eM1yKlMyQ5uT0AhEdbc7Ct/4cQQ/p+J2y/flx9zSeYCJtSpAIKxNYa8BT9Pjf9SleB24cL6rNzweLJ2x/LPk4pgd97DUaW8rLMMUhhYK9INwKZUJEUPqty6wkvwUUKk8IgQSddDXv73H+eRPJzkS79qRu+fLF9tXQA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(7416002)(5660300002)(8936002)(41300700001)(186003)(6506007)(2616005)(6512007)(86362001)(1076003)(6666004)(44832011)(52116002)(2906002)(26005)(38350700002)(316002)(36756003)(66476007)(83380400001)(478600001)(38100700002)(921005)(4326008)(6486002)(66556008)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ZJWI92TsNCnjPLKuPto27fDw1BTpz2jwFUHWz94Ens8eZXsBiu/LH9JKvsjG?=
 =?us-ascii?Q?nEcSxk+PReMQbnprebIocPn9SIK2KbNJN4V9RHQ0GR4MBY0tcVpFF866w0y3?=
 =?us-ascii?Q?4iVTBYbv4ILrzKZF/yv7aTnSlzCG4d/HIlo690bMFIB3PgTkMxhBC+vQhsAo?=
 =?us-ascii?Q?UFOXN2FaQOby7wh/HWqyWOZoQF4cCen2ZcGUojtMo9EAuyjEd6S5lmWdlRE9?=
 =?us-ascii?Q?CEAM6OE2CLXWg923Jh/jMhfKf+Rp+oK5l0ixpKyn3Rg1h1UrANEE3vHKs48d?=
 =?us-ascii?Q?BpcE1Bu2C00mGMHNWnLEPjJxAbAx2pc5rOUgZz9nlmVkksJiWBthDOZGgZui?=
 =?us-ascii?Q?QAuCg43QLwa2DJnP8pRouqcmOgvZmVi+hoQ1iZTyEqI2tYkE3JIvnJVstDje?=
 =?us-ascii?Q?Ui9OnC/9F5AAEYs58ePnvXzPzDGniVH4kaEcUfTqpWNmLFwIo0lbTLBQHvLJ?=
 =?us-ascii?Q?hRGUksaVfLrp4QQMv79Aq+FpjENFWU45S9bvJE5IikNAKGjTrWSKOdJ9BkcD?=
 =?us-ascii?Q?nMeZfx3m3kOwdbmnJQrC2Gicei4IMwPL/1C8g0JOXq1txY5DRfDou2+OWmmL?=
 =?us-ascii?Q?lO3/Uoxm7zfWvMAX2UCsB75yvyb+3bm472vtYMYE4aIqNRz2BpiRFR2Dv8OC?=
 =?us-ascii?Q?PogcbZ5y8F0a0b1SZaKH/eiXW2SfEgmkv1WOuqAgw6qe6ixITsLdhsenSdYC?=
 =?us-ascii?Q?s/nYSiHSptUf/Xff9112prrMzedJeZRDVcp9k7SeKrA4azONexWJq/FI9IiG?=
 =?us-ascii?Q?Nyx7sg4mP692SCAqJ5VnODbLRHHtrlVDGfzlHefnaRQAWQq975+bITv4CHo9?=
 =?us-ascii?Q?ksuPzGjFZ4+rnoSCpCKRnRF/l83JJT85gyMkc0OG9YdNtce2Aq1c1SAHHHVo?=
 =?us-ascii?Q?KfdafV8IuA4/RkajnlYLPDubU/DAiC7ignlebVCiA6rPxTvRDiCos/ao92zo?=
 =?us-ascii?Q?x/o63R9e15pNYa+bWeuTrNkavrwGzGI0tzkMaVDMlwrbzODmWm/HqiIHWacq?=
 =?us-ascii?Q?+oIy4godCxZIcekCA8r3AE4w4t+hsF/Rd1M+XlGbF8DMsVDD+nIYpZCKI24/?=
 =?us-ascii?Q?LSOWlU97tlo3L4BgzPnVhIejoOkz8LCKNwMWEoq7XjFg7rcAQe9D+VVVflug?=
 =?us-ascii?Q?12LlEydrfDP+/vWnrAaiq//P/QEEIHB3KjYMKiuBPSWnmt1AZ6pgfs6MX/iC?=
 =?us-ascii?Q?83FeLTEpwdazl6uolEl3P4mHPofraRufLPzVwwPG1guJTPSnJnfNm8OCLnEm?=
 =?us-ascii?Q?/IPyoC/dChJnzloN+oyi2YdbxBWGxYoCpS7nrFQtW/KMddLtYiCIF78ucc2V?=
 =?us-ascii?Q?8Ishw4VhdIPklnFox34tN2GkvjaLQsBR/0RCX7nIntWh4C0LOyhT4hc4uipg?=
 =?us-ascii?Q?3goU1zuPmsOPC232TiMBEHd1ZYbf7YzCNemR1QTLsHlOr+HEulhX3r50iCvH?=
 =?us-ascii?Q?t30BmiQZAYss1lAsP6x0B1D0rw/cRYS+X5Mz8FBbZaI+3dE/pj13x4tDFPsd?=
 =?us-ascii?Q?lPb7VZ5PzT+/qB5TbjSrUJDZXbX0V6HLl6W+RhWOwKoWO0FFQF0yhiwOBrlb?=
 =?us-ascii?Q?u3N7zvox7JJ5CN1nSNIErbIkkfK+RXhFpIELm9cf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b6a89b-30a0-4e36-0c92-08da8993e577
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 07:55:53.1828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOTs4L9UGsza2Q3tdJEmv1IDQzrUWZCwhnRyU693HMnpg7eXMF1fgEu9k1YCjFsxXfpBeGA3X9SY6MxSMPO49Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7482
X-Mailman-Approved-At: Mon, 29 Aug 2022 22:21:55 +1000
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

Chancel Liu (5):
  ASoC: dt-bindings: fsl_rpmsg: Add a property to assign platform driver
    name
  ASoC: imx-audio-rpmsg: Create rpmsg channel for MICFIL
  ASoC: imx-pcm-rpmsg: Register different platform drivers
  ASoC: fsl_rpmsg: Register different CPU DAI drivers
  ASoC: imx-rpmsg: Assign platform driver used by machine driver to link
    with

 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 34 +++++++++++++++++--
 sound/soc/fsl/fsl_rpmsg.c                     |  2 +-
 sound/soc/fsl/imx-audio-rpmsg.c               |  3 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                 | 10 ++++--
 sound/soc/fsl/imx-rpmsg.c                     |  6 +++-
 5 files changed, 47 insertions(+), 8 deletions(-)

--
2.25.1

