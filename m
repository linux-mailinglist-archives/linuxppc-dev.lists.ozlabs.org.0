Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E87487C5275
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 13:50:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=kVU1hys6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5B0p6HYPz3vdt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 22:50:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=kVU1hys6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7eaf::604; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S59yw5grZz3c8n
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 22:48:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmoXBf3OCpagqAbbVL/nVrDYJDghFVd4Otz8sOhoeDBeaYAeenwiJXChbCtN8DK7ZW+7gsTy55/BTrCI/zVteL2Rmd79l5laVZUnIPT2o7sBTZR333gihmBh/PQDlx38A0Sz1MMYRl/GRLe7/U1NSJj/1ptykiDRJc7wbvMWU7eObJ6Q0NZybB+zwl8wc97XvoHLBL+YIWselul5uxKzS2LDrrXPP2yRg8jaPLAWNF6GfWrgAxxTsRc1fFYTlRGKVDvotwzmHtSDqd+bQaWslsyZccM/wROkD0tJe/FhWzhEYSHSpr+/tCW4Rg3YnI/68q+IWkLT6PxnPFlJ8GMadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEyCPyZgpvDOSO3JuNyZDEiyTPUOU88DIYgf377bypU=;
 b=eDr0GOrqQbzCsSw+DE5ax/2yNCG6Q6DfOmi1WttacHLDJiptBGmmIRSyZHogVvHN96gqzARLkHmXj7MDvgg/YVEg4Q9sXVQzfTJ7lxfCe9HPc5guo+1gQPZ5aorO8wSgdoCefAGY9/nfeKA3YZ/9cGM2vtOgiMUK1KIjP6tYL1w6aHheELWC4gy8tgryj/RCUvLWMxF+n2pyWcnqrpBdzpe5BSgulnKldSCGE0K+vT8ztJ+RsYdiF23GKW4lI6VVHP0Ib2uBHPQnoRtRLAozogVBIZV0LHX42NPtoXhHxm15kzvGPVsEMzQk/zuHfFT+ydSCj0cop9o20hBovvOQZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEyCPyZgpvDOSO3JuNyZDEiyTPUOU88DIYgf377bypU=;
 b=kVU1hys65GSu7GT2rjAqVgMaBkn54msdhiHJl0ojh/It0vcdhsOoKdUwdEu9dmJRHDmKl3HNkq5hnL7qs8C34MK/cMpge7p7Ebo7iBm9MlRMrEnfrECLNgqpVJfc+35Rldodh/KEOOZSIAf5e2xEb3Vcyf2m8WFZeq3JkCo26pA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DB9PR04MB8300.eurprd04.prod.outlook.com (2603:10a6:10:243::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 11:48:35 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f%6]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 11:48:35 +0000
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
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] ASoC: imx-rpmsg: Force codec power on in low power audio mode
Date: Wed, 11 Oct 2023 19:47:59 +0800
Message-Id: <20231011114759.1073757-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231011114759.1073757-1-chancel.liu@nxp.com>
References: <20231011114759.1073757-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DB9PR04MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aaf73d0-a7c7-44ba-f37f-08dbca50004e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iXGJYhJBz1JNhOEZrX1ZOZCrWmh3mEHeeZ2+tvYRHswluru7+9Kav4vEsakfRsjaxw4dghP9mSlo1pc6tuw5uJEl87Wqwwu62EDI+i7ScIzIToY1SOLLU19svbg2mBHO0p4HgD4YNRIdErEvo+CDAq/8pL0eotAnxcYh1wtR4YXRUOPe1WToeMkbMJgHVmagFUCLQ08os/8vXcj3a0s2TZ3uu8Rr9GKI8b1nkVNl3ozjAWvjVyM8EBbW3hm/OFyfy8rKBl9mf4VCvoYUJO5O5etjxnbYw8Bb7d+FaYKuOHpAdsredEoylCTYk4vhYm2EkTodWVTrxpEg0rtNqXST6NHnsErJoXwVhyQ4BrRKAEndaOaFJ4JOh/f2mFv3/0AmvecSyik5VB7JjkRHeXICV4H+PtsSm2a4bAOrR+nGGQoZBJdZutJJhekRa0sR5rX+TrObkBkao4QgXSRqSvjUKzDLksPmzdLLyshYEY4aNKI2HdOm5RdnW86JTff8vWTpMPmbGrZRMNY8Gc3LL9EI8dTS9DrWA7oSGoN0VNyJqUWoOe5mK2UNsbits/TU/adwdjaxT/gqa1n9uvA9kUFkVkrHDPiiEHdmF4GSg3IPPnR6iCJwZnYvvw6VTi6O0gP7x6P6YHUvBWg2HHhPcySLbqbxRKBqHO7EXi20wUgR370=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6506007)(6512007)(52116002)(1076003)(478600001)(921005)(44832011)(6486002)(6666004)(2616005)(26005)(83380400001)(7416002)(2906002)(5660300002)(66556008)(66946007)(66476007)(8936002)(8676002)(4326008)(316002)(41300700001)(2013699003)(36756003)(86362001)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?tT8uBSan+CMGGBbaQlBRmBodU8ItOjjgVoKimDg20IFS5OI29pFTPB7pF9JR?=
 =?us-ascii?Q?a/bGj6IPEw8Ih2uosUtQ242o38wu3iHk6tVVWYVjV9q6alknzajIXshkXSww?=
 =?us-ascii?Q?LPNuUR5k5/jh8nE9u1nAUjNlUvzEfZXDfyAwLD1XpkYC/2FE+U56jEIkltrP?=
 =?us-ascii?Q?kYyPX+4MN5tXFQMCp/ZMpwn0fSdDUqBSZcb66WK1TS5ivKm76H8mkbdvZdRn?=
 =?us-ascii?Q?Veup3facm54lKI6jwtzFrKHUMELqH2/n0lFupqogJyyZrVm26yNH1mLnlQn6?=
 =?us-ascii?Q?LTXOBe5jtIg0mmo3aThQLLs3oJpI2eeTfj7J5vJPTSTjNELNKlHfB2Uzx6IJ?=
 =?us-ascii?Q?XtIjIz/vkM2XOdiBhdXK9DEUiL8WGKLgFLmikAb54STwcgC3Er7/0uaNkE9X?=
 =?us-ascii?Q?sm0DAVlEP6K1l15OUW+uiIJAtcm21EBeD+ExD288/PWr+DB/DEiTQMzaZX0q?=
 =?us-ascii?Q?dzKUQg90JUcaX4KvAuWCO+yzHxzDpWzNSBRIOie5ZMs9AYQtt7+1gQK2OSXh?=
 =?us-ascii?Q?Fjmd9agVGwNERwQeho6p8+YJEd224qG74/BNp0OHQBSAOu/DWejAvIWRLh3l?=
 =?us-ascii?Q?ntLhxVQ06zxgdPGcf8S0IPDt6VLNXHcZq7EW8FqEGwb9U3Onojvx4tyX395H?=
 =?us-ascii?Q?lEt+7XsHQ0pg+EA4Kdx5qlKkOYUh6Jvva3cge26kLG7FKQqEq0mGzhcP9bIC?=
 =?us-ascii?Q?yHQEKMUyr+R1bzG9oC7HwAZFK9fyEKHOQeMtiuL8YJ6aObLVker0pjRmGW1n?=
 =?us-ascii?Q?1HbRso0cgXfln48qoOb7LsIiGM5xodf7/3Iil+wr8I0DSX2fmnShBsIRMrQn?=
 =?us-ascii?Q?59jDeIzfLpmDMDsCnG/7xfEDzfnwz5aCemuaBa+VQ1Dtxqy6lh86Ru7BAeFz?=
 =?us-ascii?Q?NUAB/guGlqbpnV0oKBffYMOmztSTfEn9KjW9Sn+X2Da0QN8MKaJldKuYxRzl?=
 =?us-ascii?Q?w78ARlEBqseaRzvcy/RyvObbEPXyhvTi+XE4SpLQMNFdwXZNojPYe0tdy3Pd?=
 =?us-ascii?Q?XGMAZpMBSWy4LCA4GVr5T6BUcBQHGUplW5/ZmL8YLGbh34LOBIHd+Jmn4UO7?=
 =?us-ascii?Q?yHJP+eigk2OTMnH43QGsSxUr4vbCv0Fpb943SdUpziMEAnN0QQP+FxG1kKa7?=
 =?us-ascii?Q?meGpTMuU/9FBETyjiZ9Im4jxmQQQI+YgTRTjFOR1BUVDhljaQmB4vpjgFmKf?=
 =?us-ascii?Q?yspHOQ+rgSBxHQYO7FCHqkqGcMGfVpLHh26MHKU935cuX+4lfCOkhbtCWJLV?=
 =?us-ascii?Q?9UodHKAiMecF80YTnbeJ/xQ62EfqbKArduczm0LY9zxgeoJb7/arWCOukOR8?=
 =?us-ascii?Q?Ejg+KmbI9fJYk16c6q6jejYgdoHZdYxqqL+erXT1UiFpFAPPtZyHqXiHyjfh?=
 =?us-ascii?Q?NaRcMXLlWeNM+4OxroOM6ixtab8STgYDC0qQc0a/pLRcCEHDFDfU/ts0TObF?=
 =?us-ascii?Q?7g/6iJrK1H4eC0m0NKGXL6aERcfqmZRDwYKJTBEalzIZBk7VXz5rGZZ8gIF9?=
 =?us-ascii?Q?Nc8FJMZ9LmsugMhCZnttnhqgZNJLEGvKuVQa+AhJtfzOWxu4oU2uJ5Fi4HTk?=
 =?us-ascii?Q?AREgBepKIW35zbo2eSs/d2D1zSiJEpXbWUm57SYW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aaf73d0-a7c7-44ba-f37f-08dbca50004e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 11:48:35.5959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2F+eTIYlGmO19vSLRM+9hU57kWWgiYcrV6QLTxVHY8rkXGJWwirUnima3FY/616fko8mbw89wSmbe1cjlOhEoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8300
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

Low power audio mode requires binding codec still power on while Acore
enters into suspend so Mcore can continue playback music.

ASoC machine driver acquires DAPM endpoints through reading
"lpa-widgets" property from DT and then forces the path between these
endpoints ignoring suspend.

If the rpmsg sound card is in low power audio mode, the suspend/resume
callback of binding codec is overridden to disable the suspend/resume.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 58 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index a9324712e3fa..2c54c92fb911 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -20,8 +20,11 @@ struct imx_rpmsg {
 	struct snd_soc_dai_link dai;
 	struct snd_soc_card card;
 	unsigned long sysclk;
+	bool lpa;
 };
 
+static struct dev_pm_ops lpa_pm;
+
 static const struct snd_soc_dapm_widget imx_rpmsg_dapm_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_SPK("Ext Spk", NULL),
@@ -38,6 +41,58 @@ static int imx_rpmsg_late_probe(struct snd_soc_card *card)
 	struct device *dev = card->dev;
 	int ret;
 
+	if (data->lpa) {
+		struct snd_soc_component *codec_comp;
+		struct device_node *codec_np;
+		struct device_driver *codec_drv;
+		struct device *codec_dev = NULL;
+
+		codec_np = data->dai.codecs->of_node;
+		if (codec_np) {
+			struct platform_device *codec_pdev;
+			struct i2c_client *codec_i2c;
+
+			codec_i2c = of_find_i2c_device_by_node(codec_np);
+			if (codec_i2c)
+				codec_dev = &codec_i2c->dev;
+			if (!codec_dev) {
+				codec_pdev = of_find_device_by_node(codec_np);
+				if (codec_pdev)
+					codec_dev = &codec_pdev->dev;
+			}
+		}
+		if (codec_dev) {
+			codec_comp = snd_soc_lookup_component_nolocked(codec_dev, NULL);
+			if (codec_comp) {
+				int i, num_widgets;
+				const char *widgets;
+				struct snd_soc_dapm_context *dapm;
+
+				num_widgets = of_property_count_strings(data->card.dev->of_node,
+									"lpa-widgets");
+				for (i = 0; i < num_widgets; i++) {
+					of_property_read_string_index(data->card.dev->of_node,
+								      "lpa-widgets",
+								      i, &widgets);
+					dapm = snd_soc_component_get_dapm(codec_comp);
+					snd_soc_dapm_ignore_suspend(dapm, widgets);
+				}
+			}
+			codec_drv = codec_dev->driver;
+			if (codec_drv->pm) {
+				memcpy(&lpa_pm, codec_drv->pm, sizeof(lpa_pm));
+				lpa_pm.suspend = NULL;
+				lpa_pm.resume = NULL;
+				lpa_pm.freeze = NULL;
+				lpa_pm.thaw = NULL;
+				lpa_pm.poweroff = NULL;
+				lpa_pm.restore = NULL;
+				codec_drv->pm = &lpa_pm;
+			}
+			put_device(codec_dev);
+		}
+	}
+
 	if (!data->sysclk)
 		return 0;
 
@@ -137,6 +192,9 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
+	if (of_property_read_bool(np, "fsl,enable-lpa"))
+		data->lpa = true;
+
 	data->card.dev = &pdev->dev;
 	data->card.owner = THIS_MODULE;
 	data->card.dapm_widgets = imx_rpmsg_dapm_widgets;
-- 
2.25.1

