Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C79A7AD6C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 13:11:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=jZV0UlnS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvKv72YcYz3cgg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 21:11:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=jZV0UlnS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::61d; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvKtB3xmmz2ydR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 21:10:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXRGMfvCmoOPbtQ2Vj3fnKFyEON+jqNmhZJ3yZkaVVKtQY0ZVvHKcdfM+15IZb9wTtyKa8Ce3QpeEO6y5i2zf2ejRjastdX7WP+HK/M4ZATeOwGywVURn/H6TpgpmwZx4S0KDrbMFYFxPhVtPUEVMZ5YDZ/g0xR+X2cVK6RsbZyVYhcskAZIr6GHhs/tVSfbZLWI63uZRDQBKbGB/G/gnLCs9olAPRSNJNDob3k8eXxGOXW8DTLs1jAZDZokwhpFBAWunMIJ/2xPE4EduCGmuI/yZuzAkSQ9Ec3EujqqrPVB1XBNaXdgHirFBznu1Rl9UOWgoDRxRhccYGz0sGfIyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L815y72ZKLd8Q6n13OC96EtIhZ75mN/FqznbXbkA6rg=;
 b=oNaJSbE0q5ybNxlPxQiVF/iXv81DulYGLdgLS5Zhq8oZG0Ya7gjx7ZtZfsC0pGxl/g+ZHlAz/awLBTx1NFik+JqwNshKorkiXdNPJXkEijnm4W2qunUd0v+gCmwzYJm7bBx5ngWolx1oNhRzNG5Ppwcl2jeWYZhzxlQ1GuD4GkDLJrA9KElF4xaCY3PcMGLA0Qc04x0Xnmi/Dic3JT0lUS01cpP/KlpwhqvALOm4al0K2jR2JbuzXvAEnuWVYW6IPgT9HbE+Gl4KBeaAwg48aMtpW8VO+D2t3zgGL2bObnzhrrZUDFjkusEbrZaWOKXAQxFu4x/67oabhey7EKIYjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L815y72ZKLd8Q6n13OC96EtIhZ75mN/FqznbXbkA6rg=;
 b=jZV0UlnSCrBs+12lQi+6ixtLNPrVELeKIEwXYNE5/U0Yss6BGDpCk/wEl74rNsesq1btudEA6JN1ic2BjsM1zvXHJ6K20SazvxnziB9hCDSdJhXiket+Df+fxtZ1XmUr4sHSOGNPA2qwAZEv8Yicu5zv4ykexG94s3a6w4A2Mr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DB9PR04MB9283.eurprd04.prod.outlook.com (2603:10a6:10:36d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Mon, 25 Sep
 2023 11:10:22 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 11:10:22 +0000
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
Subject: [PATCH v2 2/2] ASoC: imx-rpmsg: Force codec power on in low power audio mode
Date: Mon, 25 Sep 2023 19:09:46 +0800
Message-Id: <20230925110946.3156100-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925110946.3156100-1-chancel.liu@nxp.com>
References: <20230925110946.3156100-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DB9PR04MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c4c6e5-a02f-40dd-59c3-08dbbdb802bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	v5avw5OyV9OlaVblBXbqOhaRNQ4diBn5eOlnJd12M4cnXftdzswoos9DMoK2X2Oce8YW1rz7LQrs59of+JKN1xhVO0yCRl4oGqqeLDOVn8K4isqLWZcwZn0wNovRIw6cg9yoGxXsep+qAP35vwxg0XElNTxDijSxzFhl/XjeZhVAF81yim3T87PfFyP9rvPR95myBUyiRNBOV3z9+jtL7JUFeO+sQqCDQoDXsh8dVtlNXax58xLStg+c3B0BrLD1exlYhPD6tuMTPCZOVWe+hf3icVoT5OCRjC/xIyCRBQB/0+dck+5TwQjzvdq+lwCiB3Aa7siyxJDYoobSOzSOujDpkh3P0gqScgrqD2fhOZ5kE4EHMTM7UN5NiDB5e11nCNOcXdICRVnvB8kFOng3sF2gIhqH0sJE4EXs7eP0l9mNyUmeswKFi6bgtkcOLgADyTLniTaZDp3PN7lG5lcIGqPZ5Nx8g/kg790uDv/mdMANMY67Frk8IvDSsrpSrmntVzEiDbjVTTmJng5LIXKBid/lMTqyvx93daUmcqt+iPUdz95q2B0oLQIxxaxoSTqiMn42aRfrhBY0inmm6vMq7JMDyx9PeFJueI5rMGJo9M3WCv0CCSokeexP0l/eXxDtzmH6QX2I+Xp5RCZo2mI4ri5LmI1qg9YG7slXfqiXn04=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(6512007)(6486002)(52116002)(6506007)(6666004)(83380400001)(921005)(86362001)(38350700002)(38100700002)(36756003)(1076003)(2616005)(26005)(2906002)(2013699003)(41300700001)(316002)(7416002)(44832011)(66946007)(66476007)(478600001)(4326008)(8936002)(8676002)(5660300002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?JXwyA3gz6BSMbZ8vw/AYjIwUpU2hXOc2bOXNeoaAbtt33vqZ2APy02EDre4Z?=
 =?us-ascii?Q?IlCdY/9wiwrbzUzrFDvoO1Q132A6Aj5sAKJCsg1I6v+uX94HV4MYOcEVUQEM?=
 =?us-ascii?Q?55NRV342avmb4mDcg2M0HAH0wkCbooUIPly9SAfTsXD7KyCSkEr1o53cxBzf?=
 =?us-ascii?Q?dcoeg3NHrPMC8PIVZuYoeyD3j17T6s4JDDxC/SX4EhQ7XM7KvtnEhqlUMqtw?=
 =?us-ascii?Q?57Do5F5d5LF/sRuNrCYz4ngTZKRsKY/uuH66l1T3Ll+/rc/fsLY1f4wS+uyI?=
 =?us-ascii?Q?/J8N3p/V92uTJcr5CSRxtosGRMZSrdtiG33ZIDOtaDnTXO3w0F4P4TqLWwJv?=
 =?us-ascii?Q?Q5Lp4IzZLG2fCGqlMtN3LTRYzK/stFy2OrMqPw4RAFjlCotdGMHak7uJYsU5?=
 =?us-ascii?Q?CAKNGinSzip3mErauEhOkplp0GZwojKbGhayDlnphW+w6JENm48w8vqVYENJ?=
 =?us-ascii?Q?nH7u20YGCA/s+u96X6eEil899s3g8Z0iIHGFvsdkc/nLmxCNzYwoMslvP1up?=
 =?us-ascii?Q?xUxnIUsa6sOgqQOHXNGvaEE0AhpzK5EHizGV9aYBCC6UclXYYFsMCvU0c0nD?=
 =?us-ascii?Q?GZGZh06jSwKzktHOz0jno2OfNacbk78KRucLEzUjlTefG8IPxgrHeOdJdkUN?=
 =?us-ascii?Q?orKpi/AknbGoGJ01oBEYhj1WZvrEYXQ6hxyw95eA740PvV2qQYH/hZSfrPV+?=
 =?us-ascii?Q?1hyerWZcZky3vwHSiGxeNapl1GrER+uzlnxxHETkS+aWqfhoxtNzTJ8qfTMA?=
 =?us-ascii?Q?1FrC1Mp0zd+Ph8CPiTaHIaVMpzH2MPkppe8OLufxVbMZIwWYxQFTUWlh72ns?=
 =?us-ascii?Q?YZ4I4YTEbB87yskluvZX6OdYKPr8hRptEtd5o5D/fC0XR0h2H295hVTgkq9W?=
 =?us-ascii?Q?65EUnEPqwOOsIBacRL3vRhwX7p+adaT/QjYNw4gzKZGbrH9BE33xlVwTEm/F?=
 =?us-ascii?Q?BpqANgdDPipGxlOOOpSUtAP+RkNjnrbL+nKw7/lDRNKQf50iwXG9C7y6DuGh?=
 =?us-ascii?Q?C4cQEPk7UKABhVe7e+iU3U44oAkV8ktNSLnyn4S0HLq3EYCa4PTbbPKgrBRk?=
 =?us-ascii?Q?YYGTuUc3ViHQ8aaBUqthEvO5KVZBFUZOWzqOzw0AWMY3t2ldTJWRoxHinioa?=
 =?us-ascii?Q?YbNe6M7Yiu9NkVEnNGX84m7n4c3R8WcNmoTbtaKmi2QMYhbZXnueSWQckfuC?=
 =?us-ascii?Q?Kj2ZZUDGPG70L5qjluzd01x8ve9SpempZbG3y+fdFJm4Nf9dhwpXGr0rT+R+?=
 =?us-ascii?Q?OOGJXah+DmJ2GM1rD+O6DgPddi6FUoz+GCSsTBjImEjbjWOOkD5gdOQ3B6Kf?=
 =?us-ascii?Q?vVwoEHLnbX1mkkZ2C9qyttqkkkCN3XX2iM6Nmd68+e28MXnqBMTgnOm84N3R?=
 =?us-ascii?Q?WVEbKEFzxkmX8Y3V+S9Yoag25Ruwb/i7xAhfHWiZ9tmlyEK0NLL1ZfkYqnxL?=
 =?us-ascii?Q?Wsl2qMvMEziNh26ooYv/rbdn2O8P1u1BGq08/z6iVVFJfuOkKQcRhCAaiIxK?=
 =?us-ascii?Q?Xvj3/P0Vz6lFLovBZL6Q+gR1Aw4/xOBXg9rRy+TJR7JC/omYGaaDQcTkxh8+?=
 =?us-ascii?Q?v6na78wGs28Z7/qk84VQl5cMzC2DqO4I0qdeheqA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c4c6e5-a02f-40dd-59c3-08dbbdb802bc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 11:10:22.2169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbH4X1vt7OH69ZX4SNy4siQhMq68mcYAIkFUz/asOqxkSW3Pnn0ohq/wVBIe738aCiq9XMqwIH+xlFvFC7D1YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9283
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
"fsl,lpa-widgets" property from DT and then forces the path between
these endpoints ignoring suspend.

If the rpmsg sound card is in low power audio mode, the suspend/resume
callback of binding codec is overridden to disable the suspend/resume.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 58 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index b578f9a32d7f..0568a3420aae 100644
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
+									"fsl,lpa-widgets");
+				for (i = 0; i < num_widgets; i++) {
+					of_property_read_string_index(data->card.dev->of_node,
+								      "fsl,lpa-widgets",
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

