Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9246EC39C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 04:36:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4Tlk2zMzz3f4D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 12:36:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Ve4GYHcn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=renesas.com (client-ip=2a01:111:f403:700c::708; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=kuninori.morimoto.gx@renesas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Ve4GYHcn;
	dkim-atps=neutral
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on20708.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::708])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4Tkp3lfMz3bjd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 12:35:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRrNTtS0G3cwQUF7T123w/Lxz696AZTnvQmCwnPfUoRQzRdUFHo8+iQac2JuGuX0qoMXYxqcoA6opa/Ed0zoy7Dtv9XtBzR3Gra5SvRNHQmBGh+eMtjN+dO3YnB7f0ErQLjVLzmcY2hPX2xCcbLCDBuIeE9Mhedyivj4JasL1WALEZpArFHCC8h/vikRITsMCc88aEKligEXf7lqH0Z4tU5WufmUXtJVshzdEzcb8lvl7LOIJdol1SUeFddjae49r7qOEeYMz2nwrs0T2vP1071z5JLk6Ii9wI2TelPIDpxhUrzHjLSUToG1XwneM5ddHeraBdmZEBXkOpLiYTMM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuC8/NbudUW2StN+2wr9fflajXO+sOgoptpkUyhWL6M=;
 b=dywkoRGO9T7620Ko3BNiHqfCycdycP1M/XppiQVJzSnb+VXNl7S+y2YH6vqbV5naBiPL80a4iwFKDDpewVBJbOTpPfZMuHbCovTFSfIp6wLDRJlE10PIBfNVHdX4/yyLj0uvWLSBpaAMCpIwetavQTps2MGGccmVRG7y4mABgO3mMTmBOFAS9ufSMZYDjJttgKLGjpbVtpS6VdaE5onven5eUJiIpn5FBIvbAn2HO/PIoWkKmwZ3mTj1Ygo87bPam+6dzwI7bAzBVDhA7qN/c7a6cniPfA6iLx5jplRVT56513PZiPPXcu2zMWsjM+tHPnGf+l2zXznZynvlp4gQoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuC8/NbudUW2StN+2wr9fflajXO+sOgoptpkUyhWL6M=;
 b=Ve4GYHcn/FmQMdANED/t42Kh5dEqRjR4lLR7Q2sXgvIi4JdNhpoE6Oma59JmBCGQOLz4BBUtmp7mUAZYeb4V5rdW2l/LGeC2R4dKiS1RMDMyMiOqPuE+dY3m+AccKCUFBjqgdR6z3IbY/zWb1JFJvWZBRzI7OYAZzyWqHvctUy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5681.jpnprd01.prod.outlook.com (2603:1096:604:b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:35:02 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 02:35:02 +0000
Message-ID: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn
 Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Stephan Gerhold
 <stephan@gerhold.net>, Takashi Iwai <tiwai@suse.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>
Subject: [PATCH v2 00/13] ASoC: add and use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Apr 2023 02:35:01 +0000
X-ClientProxiedBy: TYBP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ae0d26-f086-4a90-f76a-08db446c8162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1hc5WYdn5tAYb7ZI4RR8e9AplU+PsB9S0v1q49YbGTzNZt8P8aeE2TT0aramayUZcT0v0JQVXKq3STAO9bKt4G7Ow+ZBltPv8hBdziABeByrm61JEKQaRKVuPS6HF/IiwyTkh3fexDxQB4Rx7SxIrefkLpI06uciRXRmMbQYyKlU+UxIIJoIhqTkV/N01GQvTQ/U/lpQBX73ifitKjGsD9cbFtdapeVJseOcipqo9w+TahoDNtVDNv0t5TKz++VXFhP1niaiRUzoyrofi1kqOVC0xJBlR9B3TTFHmn26KbxuCzJJu+JObQXXWXbXQ6WAKHMMjqGI/3ZDX/4UTPUbfulTbDOGTqghyGBaMs/siJAbKjTd2RZ3VV8tPZ3KUcfqMrPwgFoLMddHGgyd9uP+Yw67Mjpvpx7afPH5KByuwkMVnIwRAjOyaRwCwfs69mQCm9mBxpEOcJPEGH0QXr0u7pwLoLyRkBKgz9mP6gcgSbWkpOKTgdkcdHb9hmG6I0/PJ9QdvwXUOzflXQIpYK33/OtuORogEhCRnfGmte407iLyvFCWs6mbNT4pWGd/+HzZp5MD/JrnoS4Ppr9J+RrDkjhlC7wlV76WIjXF8IrFN/U30UC7moqmsai0C0ESpfdV
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(52116002)(6486002)(966005)(2616005)(6512007)(6506007)(26005)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(4326008)(478600001)(7406005)(5660300002)(7416002)(54906003)(110136005)(921005)(38350700002)(38100700002)(36756003)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?uqU1kb7AIiR1Oz0wrwb430lOmPhIs2WcdlkYRxLnYM5WD5Wo4lT1Y/O8ze8r?=
 =?us-ascii?Q?FHX7VZfGWgZDNIEsN/ZrXICPY7XzcAFOiuSAvj+2nqsZ/2e3NL9mp1ZgFpjI?=
 =?us-ascii?Q?nxJny8+6kXVSIw3HeOOlJskvAW6kyQ4npe9A9O8SgStXo0+iUfUQBMArbVHF?=
 =?us-ascii?Q?mPHATAIZiWF9ZLDmU2FPDI4T8RX/Orc2Zea5sEujL/23ITm38wIzKzlTvT+u?=
 =?us-ascii?Q?n1TT5H0nT/68EUTHuk+8vN8loj0Qbxe7n4GeSmolLD3DMOwVouQhP1RyR4vm?=
 =?us-ascii?Q?3VmvJKNRhPar8O2f/VUoP2a6AwooNbMighWz5qusEiPuiRUAFMY/aFZyIxhD?=
 =?us-ascii?Q?s0aYtzh11aSepc1XD5i870bzzyrpbyHXHFr7UwHrL89kDgwf9Kg4puFxZUI3?=
 =?us-ascii?Q?BEuSwzG3O7+mZTqnKpSGZSG6quMdRXmls7CIFfg0VEsfBsEucjeEfgJVqPdg?=
 =?us-ascii?Q?xUl3Ykp1pUVfpPWfmzh9xAdL/BdKoxyeQgT+zkYaOQEP7V4/+VU5a3wCfPQf?=
 =?us-ascii?Q?xCgIfqZdDDguGErrVSfYxAK3Rl+IMsFy1atYgjAg9yHB9uecgQtZJgHnTkdT?=
 =?us-ascii?Q?+iS7hTsnWhhuY+ntVfKmiZSHs+xqonGwii1kBR3bdC7zlM+uNSFlY5IaLV3Q?=
 =?us-ascii?Q?n9PKPEbQwL+raxXD/4q5MJMPuy0yKWYLd6UExvPWdEkQ/kRtKLKGHiqb1WJZ?=
 =?us-ascii?Q?DSY4qGpiWQdnoarbjG4S+UxeTp68SKffOzrJNDL4GM8nbMYrlFD8LSNMyX91?=
 =?us-ascii?Q?NEWf7jba1HPLG9290WtnoHBWOQMk1rnKWOWYYweAiySJlVFxZpXCpx+Z9X/w?=
 =?us-ascii?Q?oPabktWrQil+1sAjg++OlNdsNjWZemzPv2h+GZUG/aPOHvF4vvB2F+Sbrf1S?=
 =?us-ascii?Q?f7fBC+lHGh1iNbwkniBw//IndQBmf1SfhjC9gaaEWFcivVmT57Cs7xDp6J7C?=
 =?us-ascii?Q?OEnVwab4PQFpv4g0DpL6u8b5YBSTGQP8iCSLoy3sVXwih4b9z4Cj7dX28z/y?=
 =?us-ascii?Q?NCM4IdXW5FlNCvBzS/FQF5YNp05DmGXpkUgmXj4j6I9oXzCNbDV9nIr9aYVR?=
 =?us-ascii?Q?D0gonDcfM8TOhitExzLr0I4zQySuDxbhgrCJgDZFb18+/0x7fhwjPWKdW/ju?=
 =?us-ascii?Q?G40uIiqg5sfN4OJ4j6zrv4TODyCasxzLiNWqPdET8cklmK6nrYQUDXVqY/Yn?=
 =?us-ascii?Q?z1WITtZ/mXJDUYOAyMuYWsSRZ03JYSXwNxGQ1wS7MK9C6EKW8EqO8bp2kcF2?=
 =?us-ascii?Q?NYQlm36stwyHe5IrdIX+ae11YlYociHSRBrG/2k02yjNpKNFHF5blaDEURCw?=
 =?us-ascii?Q?XdYd05iMt6BzrrvQcZOm5iIKY1it3nrs0vl6taeuo9j3v9tlHZN+KtdLQ8ip?=
 =?us-ascii?Q?/LsjOctcrnCJUkQUBmWtmVQxBqVMjjLhiHkdkT6Z1+soP8acXnYlL6iLr6/z?=
 =?us-ascii?Q?bIBLWHPcVx9GYH2sM6RiTz1KsRcnYrlU3lSYNSCcNWkolnqgwBX1qFm/Nseo?=
 =?us-ascii?Q?RhX+tb9TRJFcPjfhgTpl0R3dy2QXfC6loAlS5aHxI8DX15QP8diilEXWun96?=
 =?us-ascii?Q?kq9M+S5nz3fi5/Wzk/zsedWhJpBmKONjtw88YFIna3vGjBApkDBa7LPRdedK?=
 =?us-ascii?Q?VchufdFTATTHjJQsbcFNnWo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ae0d26-f086-4a90-f76a-08db446c8162
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:35:02.2815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LfCnglRtkOD7U3hh+so4KkB+QYXvupFNIkk/z+RqwFrjJcClMCmMULHf7DiofVo3C0zCEXMXZY5AchHlU27GaLES+yXD3NB/fHduRokRldDsN48FZz38ZvnaqbMxBEO2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5681
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
Cc: alsa-devel@alsa-project.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Mark

These are v2 patch-set of asoc_dummy_dlc.

Many ASoC drivers are using dummy DAI.
I have 2 concern about it. 1st one is there is no guarantee that local
strings ("snd-soc-dummy-dai",  "snd-soc-dummy") are kept until the card
was binded if it was added at subfunction.
2nd one is we can use common snd_soc_dai_link_component for it.
This patch-set adds common asoc_dummy_dlc, and use it.

v1 -> v2
	- Separate intel patch into 3
	- Topology codec doesn't use asoc_dummy_dlc

Link: https://lore.kernel.org/r/874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (13):
  ASoC: soc-utils.c: add asoc_dummy_dlc
  ASoC: ti: use asoc_dummy_dlc
  ASoC: sof: use asoc_dummy_dlc
  ASoC: amd: use asoc_dummy_dlc
  ASoC: fsl: use asoc_dummy_dlc
  ASoC: qcom: use asoc_dummy_dlc
  ASoC: atmel: use asoc_dummy_dlc
  ASoC: meson: use asoc_dummy_dlc
  ASoC: intel: avs: use asoc_dummy_dlc
  ASoC: intel: sof: use asoc_dummy_dlc
  ASoC: intel: skylake: use asoc_dummy_dlc
  ASoC: simple_card_utils.c: use asoc_dummy_dlc
  ASoC: soc-topology.c: add comment for Platform/Codec

 include/sound/simple_card_utils.h            |  1 -
 include/sound/soc.h                          |  1 +
 sound/soc/amd/acp/acp-mach-common.c          | 43 ++++++++------------
 sound/soc/atmel/atmel-classd.c               |  8 ++--
 sound/soc/atmel/atmel-pdmic.c                |  8 ++--
 sound/soc/fsl/imx-audmix.c                   | 14 +++----
 sound/soc/fsl/imx-card.c                     | 11 +----
 sound/soc/fsl/imx-rpmsg.c                    |  3 +-
 sound/soc/fsl/imx-spdif.c                    |  8 ++--
 sound/soc/generic/simple-card-utils.c        |  9 +---
 sound/soc/intel/avs/boards/i2s_test.c        |  6 +--
 sound/soc/intel/boards/ehl_rt5660.c          |  8 +---
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  8 +---
 sound/soc/intel/boards/sof_cs42l42.c         | 11 +----
 sound/soc/intel/boards/sof_es8336.c          | 11 +----
 sound/soc/intel/boards/sof_nau8825.c         | 11 +----
 sound/soc/intel/boards/sof_pcm512x.c         |  3 +-
 sound/soc/intel/boards/sof_rt5682.c          | 14 ++-----
 sound/soc/intel/boards/sof_sdw.c             | 13 +-----
 sound/soc/intel/boards/sof_ssp_amp.c         | 18 +++-----
 sound/soc/meson/axg-card.c                   |  8 ++--
 sound/soc/meson/meson-card-utils.c           | 10 +----
 sound/soc/qcom/common.c                      | 11 +----
 sound/soc/soc-topology.c                     | 22 +++++-----
 sound/soc/soc-utils.c                        |  7 ++++
 sound/soc/sof/nocodec.c                      |  8 ++--
 sound/soc/ti/omap-hdmi.c                     |  8 ++--
 27 files changed, 89 insertions(+), 194 deletions(-)

-- 
2.25.1

