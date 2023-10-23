Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A0F7D2846
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 04:09:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Ug/XwqsS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDJYB3V2lz3cfx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 13:09:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Ug/XwqsS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1a::61f; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDJWL6zPxz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Oct 2023 13:08:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8YFMNzu1AIA0DkU62PuxSezwbVESHx+4v5ct+2ru+siqEW4iCHEA/i8v1EJstk+BRFwZDA0XOi/9GH8xPJ/R+FLVXZ1CRq/4wrihsRlMCX18QWq7PMLQuceU8Nzt4XqyLgUhb+Z2tUmGErUE4U4zNkanarJLHjUgQVV+t4kxIzXZE6bq46Nvlg0+x50hGZ5yk283C/dV1uq41b6EynCMz7q5ihOXf1SuDqSrcDbatOLkwju/5RaLq1MH0zHPemBP5gyb1vpqBRQtRqqcRIBiNTPM6dctaeuaWvr46/5YGKZFLcvzzYqbDYRybOZT2th1a+CeaSpAxNtirKHQVeDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5vqGqGWmbk80w1TAHdGYnQK2KuxxtXCJoX8RGwyi80=;
 b=XRUjmqIXMufs3GMNO9bnD2sk3bfyy/nXDcCRmxrPzlGLhoxYcarEWIYiEg9BoZxmEFDn/1EIwHiKsb+qDGl3dk7V9pg7OZH89lq5Axw2NnY3TbFasHScCO6dhRf2BR6IlKn4X/i+POI8riixbQZ2kaHwmrER5OTF+y67mdJxXI71ED5Y/+6C1VeCrlF9S80otguvoHcQI124wd8gZxYgVpANOnLmowObwamOm51eND3aLsTtfBltwHrgFSTfwy93dm4rpRDwJ3vWdROkgbjP6XP1EISWnjGKqmcwUdrPz3KDrjVxvlEYnTpAjGUCso1SfX91/t1Ervi8YKI9vnwC8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5vqGqGWmbk80w1TAHdGYnQK2KuxxtXCJoX8RGwyi80=;
 b=Ug/XwqsSFZ0XALdPJVkbvJpn6iuO0M3tr1d4Obdd42CgrJBVjKNQrni1d3jyfUyyYKIiNCxgw36Frj45zEZk/6aZNWk2CYnRz1a2eNTkx3nBlzXYlbdwv36Jd/XWMo60OCH1kQGOFWTrFnT4MdxE3kHFaB7s43ChXdjCoOdHyYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9504.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::19)
 by PAWPR04MB9837.eurprd04.prod.outlook.com (2603:10a6:102:385::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Mon, 23 Oct
 2023 02:07:52 +0000
Received: from AS1PR04MB9504.eurprd04.prod.outlook.com
 ([fe80::ddf9:e4b4:367d:bc06]) by AS1PR04MB9504.eurprd04.prod.outlook.com
 ([fe80::ddf9:e4b4:367d:bc06%6]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 02:07:52 +0000
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
Subject: [PATCH v4 2/2] ASoC: imx-rpmsg: Force codec power on in low power audio mode
Date: Mon, 23 Oct 2023 10:07:18 +0800
Message-Id: <20231023020718.1276000-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023020718.1276000-1-chancel.liu@nxp.com>
References: <20231023020718.1276000-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0084.apcprd02.prod.outlook.com
 (2603:1096:4:90::24) To AS1PR04MB9504.eurprd04.prod.outlook.com
 (2603:10a6:20b:4c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9504:EE_|PAWPR04MB9837:EE_
X-MS-Office365-Filtering-Correlation-Id: 2abb7609-bdcc-4778-64ee-08dbd36cdcd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iFguM+ilEHO4Bkfn5w8QzHdN+GY76nD9xvK4cwEh2esewIxSlPEsJfvJ9UgVlCOIOHA7QOSi0jA/Wh0oLY4qioeG46XdzfhVfC2VmlfeQtq/65rD869/lbqn684RRVrt+yk6U2GkJO/9Ee7E5eYymOPq2muuILoc/tGPMHv0Vi4atO6q+ap0c8v6ws6dCXuL7dHBMtmMlkD+E2oCqDOceNOQrRoeM5PnYrkkBZ26SbH6VFEeI1u1RCZRpVGyJyQnhHjN8LLZifWuUQ+8mSiQ35CfsUBQOo/0jbucjbL5XGZU5tGbV1ARyWN8ljcwddDpL0B5GjHv1IULRI94AgvDxwUpR84K0kPdwnPI6dbEEGTqrPhIkUaGduiO9e21BB9gZjLO4zoC/xj5zaf0LJ9rTXmvJ6ccCWKBk2rEdQjiLp/BVrLl20abpkXW1R7Vzbcjkwbst9PKkfnyXP3E3MzcjT0vYa39qj12oI26Qfx2Wv2+raIuoC742baAX7QSJAg/AuRWLwIWDDva//OAXEFmSxdwwps3aIx5NiPy8K2f/T0CVCggoCjB3AwTj197ngoH4RAGHSmMsxD1vlQbRr717QV1zmwTVgzILNZeBWJOx1NuPKqKK7t7TvjQV2W/3e5GUbqK4Pvw9mCbJcOXVZKFS3jfqLpD6bJM1h9D1HnBels=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2616005)(7416002)(41300700001)(2906002)(2013699003)(36756003)(921008)(86362001)(26005)(38100700002)(38350700005)(83380400001)(66946007)(66556008)(8936002)(316002)(4326008)(8676002)(5660300002)(44832011)(478600001)(1076003)(66476007)(6666004)(6512007)(52116002)(6506007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?unjxIcZVGEXBkBbsN9rd0st8ARUB7XGhwBMKH5hxMJY0dow0E8tP5pALhT2W?=
 =?us-ascii?Q?lZbQ76E/23XE9xCWBZVS81qql5DMI/dvtGJgyKsAfW0Km4/lz7b/jS45zGW9?=
 =?us-ascii?Q?2DKABYLZBY9Y4mDZM7POOBEqO/NeiBg6DxgEDDUQ3YZZEmr+TTYa9v/Th8RY?=
 =?us-ascii?Q?Ye3pXSR83KvEYuMbyWY8KrP5TniFSPUiTGAPf5TKIBh6fSnbDFK/iglH8fIq?=
 =?us-ascii?Q?neV2Un6hKNxCKtQ2LHGfGhg1H/1QtKhNSiSfC7IDCsVmmgAK/RUrKL6v1Z36?=
 =?us-ascii?Q?a1Wu3x+N+VQk1oIvn/TIR62FwCBdiQyYGWS2O4GX9f67Ns4uhFL25jMLBYZZ?=
 =?us-ascii?Q?FCReFB8b7JlBCuyxGvOMrMhoCyQ24U/5NEWzFWbfhJE+WQOODh2rNvPDvfAw?=
 =?us-ascii?Q?lzvylNzZgWIZ71fUHvBXuv2Oyx5Dn6vFXls5OoHDvpsR/d2USw9t6M+PGvi7?=
 =?us-ascii?Q?Tup0e/ET/yKeFc1hYLnzE/awBNehVDbwIleQbv4V3WFaAH8FO9D5Owgz3i4l?=
 =?us-ascii?Q?ioivYMvg9rsZaKQF0gVi1FTK5HV0MOts924bcojmJe/GOMuNAXSgJT7/HWm+?=
 =?us-ascii?Q?t0/eTK/bAZpy68M/1rynrVGn2/BJaIJOqhEPKzAYbAqeUbi4mwGklNJKHCyH?=
 =?us-ascii?Q?PHt94bJVWpx6KnP5lohYh2BPfw7IyrbLTemjq6m7QxcoFRyeHw2DM/wKO5TT?=
 =?us-ascii?Q?Mau4UhofJgM0o/iglz3yG2PrNlG4dYMBd2zEexpoVRYyNPEmUcnFNGGnQECR?=
 =?us-ascii?Q?PM/C6X/X9wsoJ1j6f/MIGjcxW0Ne5coSVlRMPaCzald34hCm/v1UE5pM3hvH?=
 =?us-ascii?Q?2kwwLQaCFr2ENwvcuC+G/jvjmjncMGEyGwY5ZLIeassYuTb8TFoPdZLKDHRH?=
 =?us-ascii?Q?c/MsTBScXiDA8RoItmeYMomn9466Hx1TYZnX/dM+SFjgiL3pCT60ZM7vjImK?=
 =?us-ascii?Q?hTPsrYJLGGp28INqx2Qh2vSgEfD9TKCVnbw9mSmmma4y06+9Wz+Jt0LNr7Sk?=
 =?us-ascii?Q?CQHEWTq3ZahdnfdfMowoQV0uW2z50+ZfHDZqI6uZ8HRB1o2cSlTnOQay0Xgl?=
 =?us-ascii?Q?vAHSy6wIUoSV/MOR76hYoYRogSQS51ZWe6ocxqacNXvtpqhjNxYS05nuNzCm?=
 =?us-ascii?Q?3UyGyFRaeQrAFqoreiZHlQpWHtjirgk0s4ymnUvMiSK7a055Ho281G6LjzLl?=
 =?us-ascii?Q?e6R061w+djmDusgivBI8J9egbTooi3c3UNsWJdqKE67zdCExwNcgKqtWnV8U?=
 =?us-ascii?Q?Yl8y66QLXUMkV2WU6xT7IL0FUxW/Y0nVsrpzaBoGTJYUyiuoKpL36DzDuHDR?=
 =?us-ascii?Q?AzJpQgkX1M4H3XNynpZiJg8iFhC+91TF9SOJpwm4en4Hk3ZAk99MYmcdw3mY?=
 =?us-ascii?Q?sFEiwh8CYgKF7oP50TP+5QLSMVoDMjHy8yzzglJR2ekzjznf9PGmD9lixTcr?=
 =?us-ascii?Q?zUXFiBLvubAoDscTzPeNf+SzmK9d2+7MlCsxDZMERJcslbb/n8trJ0WSuNlA?=
 =?us-ascii?Q?Mh7bfo2hFZPeNozMJ6CkcwYTigZcuopnr/qspxi3GUshvfgum6WEJFkTqtOc?=
 =?us-ascii?Q?3QxXHiH4bRKjVSaVGlquOPL886Aw0+R9KdUYUcGk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abb7609-bdcc-4778-64ee-08dbd36cdcd9
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9504.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 02:07:52.0095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/dzk7ioM7mrFW8RL4jefvYkQQhjDWKHBqOzy923EqwPf8jsEJhSjBFg41Uph9Q/Zre2dq+OZEYo0W/dP09pCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9837
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
"ignore-suspend-widgets" property from DT and then forces the path
between these endpoints ignoring suspend.

If the rpmsg sound card is in low power audio mode, the suspend/resume
callback of binding codec is overridden to disable the suspend/resume.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 58 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index a9324712e3fa..e5bd63dab10c 100644
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
+									"ignore-suspend-widgets");
+				for (i = 0; i < num_widgets; i++) {
+					of_property_read_string_index(data->card.dev->of_node,
+								      "ignore-suspend-widgets",
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

