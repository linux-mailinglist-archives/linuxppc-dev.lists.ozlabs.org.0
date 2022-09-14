Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5B75B86B4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 12:53:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSHHz1HF5z3bqj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 20:53:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=kphC23G7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.5.66; helo=eur03-ve1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=kphC23G7;
	dkim-atps=neutral
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50066.outbound.protection.outlook.com [40.107.5.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSHHG3tbWz2xgN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 20:52:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjtGXM9LBQtNSWHBbKEL7pXQPHY8SuEDKOWJmkVZBNTRoNVQSj28ykRK3sGq3gZmiKFdrVK6QMVQQqOKOyVGwpEFnEoIpub6XV99addHahWKLIXbCgbOV6Xfn0q53mfZe+34/ZSdOUcHdY5UHYojKpQxjkr6L9f2ttPdFwsyuVgU0qIje9348Hr93KtRPYW88aUcJvWdWqEgtMOZyHJTHma2B1OD7rfb2ytlHJwTXzE2W3lpn2a5lu7YmHAwoszctnaMEKlCa4Onwq7RDZIo2LhS6jkjqAetAzcbhurDPydTQ6+5dvhc+XL2t16ZTBsuAgIfUXEepJecp8Ioljc74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsrqmrLv74rcLj6YggfdbLsnbkEzyJCO9HjL70xxRms=;
 b=geBW7NZvKCig3/tJVUFOwMdzuEK8j8vRi6hs14aSXCG/4ECniMXjk3oqx0HBUPP9tAL4sKWX6YsNHUJuoObDzLHWhfbSteyqZTFO9j0y0xk1II5VpBr25cQnRdrYSTLAMyTAqIBKsUeEZlsWFg4IlW1O28b176X1xaLjBF0UkmZVWYyiSdTNbyL9FqThNaZW1wbms4z1y+2gqOa88UkOfENav24uAwwC7uOS7GqvKDOBzN9d3hattct8ipImEfVC4FkqMODClgLDHZaKA+x/A2vQ7vv0mCNjFfj5PrqcinpRDSSqAgdiVPGHCa7WC+xaWdX+Vz/HBWl9bxVOREmR6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsrqmrLv74rcLj6YggfdbLsnbkEzyJCO9HjL70xxRms=;
 b=kphC23G7uSR/uGKB9lNFHX37g7hTBrMYoFUnTj35i4Gli/cfMHTT/n/uFA9FZdhutlAE5jy0MM8EI+lQDGUpACRJH/Ht8qly/gVwrcW+grOEh+wShQF8MO8FKHw5qVBPdrTc8xhIuTp/8HKithE4xAzM0py0UwGHAz5syjNERpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by DU0PR04MB9466.eurprd04.prod.outlook.com (2603:10a6:10:35a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 10:52:36 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 10:52:36 +0000
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
	shengjiu.wang@nxp.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/7] Create a new sound card to access MICFIL based on rpmsg channel
Date: Wed, 14 Sep 2022 18:51:38 +0800
Message-Id: <20220914105145.2543646-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|DU0PR04MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: 30fb2649-5d92-4f27-4d3c-08da963f3c4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RQfA72kCzXAvm7CljvDOdL7oZNatUHbBoEh2YrGRv8NRtteOv0moI5vM2UEicStyg7nn2pSLJIvynoSqhDClbbVbrAI7mSWhtzF727yht5waQe61mMryp6CrfWufPxBsGNbtAbdvLo1Q5WFJWnqchcy+FBwe6M/yQ4gRRP29aw0GLIKjlPCVrLgq+9Pi0TlqFkBZTyqmNQiL+U0SCdq3QZk/noUmKTeydKUnXQ58QH/OtWbJj7ZoxD1YvHHMvuwjGQuvyhAh2/SUL2zKiG7Q8wqHLmlHNyvadOjFXhU7CPr4tUoTqcQsxd8Cw+gCIRZBw3qfcdOMpwILgMpme6QAr/S+lhb6kDoKQ6EFVZz8KD4h1DCM874wpgIjYfdF7LDjciUYy9sHKgF9N8CLgTZsz253U7xJu1STBmRGOyDvgZPX3X4na3syF47HozPpjPUeroel4/4Mp6t6IEU/CrhKz8pSBMAxmu08svOqc6fS4SQfTQLC2WtdWwrlX7LgYFPgRUaIQZRCqG82K4JDZ7s6Ts0SiM99V5I7RnfODuJclSVhFbGr1qyYdsqKod7s/xJy6MMBMeaLtXyV0PG9ppoicS2Cz5Bp+8YROSNFbGXQvZl5wBkNCEHW8MBtPyQnjkZW5ga+qql9kYLq0sopitYDNKb8cnRohpwdWebPMwfRVhtdSkVfhED2Q64HevVuqAqRHKBuwIW4rL3j0CUU8PVp0DfqOLcvDxV/TyQVnx+kbcVm3+xSNpgprGUm12932bf5JE0qREWiVe2fEDZRY1mg+t0/kf29nfK7mxAEIKBC1to=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199015)(38350700002)(478600001)(5660300002)(8676002)(8936002)(66476007)(6486002)(66556008)(186003)(2616005)(26005)(41300700001)(6506007)(44832011)(1076003)(83380400001)(921005)(86362001)(38100700002)(52116002)(36756003)(4326008)(7416002)(2906002)(66946007)(316002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?deuDKcHOkXqFis8gjP7nBD5rC3xekdDAzNnuoi/ODYKoQxdSoNEndAjf66Og?=
 =?us-ascii?Q?8kH8MRHeR2RwaAPOGg7fBZ1ScUnFo5RXxrDgC2yCIWxJvHUTdxtTy1DV1SsY?=
 =?us-ascii?Q?aLjRJPwMnx+iYT7SU/AvgI2D7bhi3sWQUfaZPCT4iDTQnpFqfQSnOruWiOyZ?=
 =?us-ascii?Q?B1T5BT+RMfFN2HvDaG/CZ13CvoBNysXkk6V8rsm5uhWllmGuRkuJJEkr7lgy?=
 =?us-ascii?Q?G6m7LZAw3YDBYW8bgCL1uwHGwg/EgJc1u2EuNzgFYqdr4EmqVLOR65vPLlJv?=
 =?us-ascii?Q?0rVfSngHm4KoxhWQsO4Gogml80jvu5UOnTsb3vubpwa6EE6ogaNxo5QiF8sG?=
 =?us-ascii?Q?TkH071BfPdd/q2tyzrFBIKwmXYeMSsNbs9YR68RlexIDqlRiHtd0TQHR/BXi?=
 =?us-ascii?Q?Dc5dxmypdKh/8VMx+x3hZtubcw2x7VtZktj+NuXXXw27Gu4tQRRRWMY5qUK4?=
 =?us-ascii?Q?d2KVANY+Jym42YCd43GEb4aVqegW7LlhG1WTb1ASvhyLsFaIsXmTYcl7N5Pu?=
 =?us-ascii?Q?DHqqyI2viVTTJ2wBAqPuEEbO8nj4cGG9b4rlQnQXBqt19059A2dXIiyxnC2f?=
 =?us-ascii?Q?mw7EVVeKtXmXFLNThgYWpcyngV7SrRutf3Wu/r0723ZGvUNS6pcHvfyzOX2B?=
 =?us-ascii?Q?1zj7MyRX5xTeZ2ewSkPmXqTDHgjbMRZJ0XRuuc9lzBgL2Umh54WGp1ZNXf82?=
 =?us-ascii?Q?LBjtweuGu3Vx/10Y5hoNsVCy3GTTfda1H3bwhSDw0spsns/MATVl+MEWMBoW?=
 =?us-ascii?Q?90AdrsehSwqvxct089RHYocCRWMgsITJctxEHPAFI89HhQCPhE6/UpyQRNJl?=
 =?us-ascii?Q?IqjS9abtbllgka7ANVHgQB7XyakKX984lYNbdh1VD+iRwxLK3pr6Al4FTyua?=
 =?us-ascii?Q?45vaw2heETK535cvjWHOPSmrNYnwNnPKEXv1gqAo9XubDKi4IAQBjL7R9hCr?=
 =?us-ascii?Q?RygWT8IReTHfsQo0uy6tQUEv3zvFt+HASkkIQ77jBLoY+XnxWuLxu9N6zhbM?=
 =?us-ascii?Q?in/isJeTu9/svr54Q/xlhhENIqWnKI9jQWiVoBNwSNNYLPhfV5LlqN/mre1G?=
 =?us-ascii?Q?8VtOwq0BHInOVyQqJmE2vO5S5qbYK06QgyNpt8MJfP824rqQb5T+IaekFZxW?=
 =?us-ascii?Q?vukGZEPVhJ6dMfwvowApFNrAFvtxPeTtDHCTED6jmsoJGTSm2a9nZ1WARZUH?=
 =?us-ascii?Q?YuIvdGIac0N5Z0bzbihn/RDmpEmWd9R4NYFfxmDb+7jr3J9IZQno81PrJ18F?=
 =?us-ascii?Q?VITCBqnvScgy2fUo/8/A51Y7aebKx3YmgTiE/sgJWbezf7jQ5QL5sg+i+uGO?=
 =?us-ascii?Q?Rr+VSFhx84TyViEz2vtDxfUU9np7vCfvaibmx8DqfLp80C/vV/WuMrjpY90J?=
 =?us-ascii?Q?r3ArGhHW8Eflbs/KH3EI2SsAxwbbL+sZhjgueMTHbZSV+p4A16ZDNMQCqEBp?=
 =?us-ascii?Q?+/krBSB4swXdFNp94S8kHnLcsf4TcKCjQIxlxf1oP3/m3iUbb+9xf+Dum/3D?=
 =?us-ascii?Q?eSP7H0QwXZn6ZZF5xiXV7AoYztGl1Qhltl1tOY9u0/JSfY1UZb6eCBtB2QcT?=
 =?us-ascii?Q?15msaaRrFaKf9xjCHUU3+9gPsuSI093AWQZZwGvj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fb2649-5d92-4f27-4d3c-08da963f3c4a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 10:52:36.7298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9xakmwfVQpO5UdqJpfZ9CNvAYywga7qa0A8urBSKnF3k2qNpGz1pf/rujwz9WKFPQnaF7YUF1B6djB0AqMeSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9466
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

 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 37 ++++++++++++++++++-
 sound/soc/fsl/fsl_rpmsg.c                     |  6 +--
 sound/soc/fsl/imx-audio-rpmsg.c               |  3 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                 | 10 +++--
 sound/soc/fsl/imx-rpmsg.c                     |  6 ++-
 5 files changed, 52 insertions(+), 10 deletions(-)

--
2.25.1

