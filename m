Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F337ACE77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 04:51:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=cuu2YzNB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rv6p95NpHz3dJL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 12:51:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=cuu2YzNB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::62b; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rv6mJ0c6yz2ym1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 12:49:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJvDcwgggC5mXY7iSwvC6qBmr/ffqkJU+nCE8fgbHRsnFNFhPfk9T6RYMZvdQLM/FKNbaB2kZHkLLylHCEGZp9IvKtXEy7PG+E5+PX51jADKaQDGDmVP3IcroLE4BKqTsmlan2HBwop2cTJHlE/CzPQQ8mCFnbyBNjZkONctRvk+ElghSN1n5dK7rns9ozWT5ICW0QmPSCaTvQf0sZzPww4jaHIBuUVca7dvHGhc9Mip+hY55wApcYlDHrmYS4OfIee1kgK4IQaYEoNJedQjVeBvznT+h/+c154ToKsWJgDjNUYuXyhrZ4iuXwkcsle02BxA5wiG+WQszoAxvdC9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L815y72ZKLd8Q6n13OC96EtIhZ75mN/FqznbXbkA6rg=;
 b=kXmAJlliFstQxP4YfGvMzDc3av2B0rpYrzYS8xykfJdyj6KOHGm4/9Lu1OcMQ46yTzwZwE+dt9LYBUK5z0MpIzGvS+M9S10w3JA1oSq7fIuCCTlBmWRsNK5YnR7XqVPQryIJhmoSSlDWk4id1LhW4Hs2Th17EPJ4Xd4YdfrY7LGFXZArl2k1ojtjF9iZjrYxrvJEANhSCJZEmw5JnWn2zsmU8LhQwQlbj6SGDm5e6G36wBhqSWzFC6OIP/Tg5Ogla9v/dBzwbsigt0AJ2vyopS9D31PoxRiAsleiX1lL3BZHd64avy6H4E22SIjAWWIqYr5UIZyD0JRld0WI5AoNDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L815y72ZKLd8Q6n13OC96EtIhZ75mN/FqznbXbkA6rg=;
 b=cuu2YzNB6GW51cMAAlF/rXB3zhwTrqy3It79FOT+SCGMVzITxxqQbTwDhbZhkV6a3zaqpaTC/4l7ZjUiwJuuvLLg4sedyUEtlcaWCDSD2WJ4+MdjcznzfsQzfjflLWbwjk/yHHrqfgEL/6ZowIFqh+v9W1mQOUFzZaBgshAdtKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AS8PR04MB8232.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 02:49:43 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 02:49:43 +0000
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
Subject: [PATCH 2/2] ASoC: imx-rpmsg: Force codec power on in low power audio mode
Date: Mon, 25 Sep 2023 10:48:47 +0800
Message-Id: <20230925024847.2971421-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925024847.2971421-1-chancel.liu@nxp.com>
References: <20230925024847.2971421-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AS8PR04MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: d245b4e4-e2d9-4e9e-ab46-08dbbd72123d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	A93I2m3XNfqNq2imK78yIWNa0cKcy0xQ9R022nA1LuS7dlheaY2sVtmb2ZLxMQUAnVN/HP7LnuzOu6DMCrlHavKmj1zexpuUNRyPSXqpz2hODZXtqIK/WBqpExEwpEjrXyHavABtZDrDC/xjo/u4I0GSE45gErrfHFOMl2h9UUq9f/hwkZcQBEh9PPrT1auDk9Vs7R5qL3bj9eofGNytveqjTBQHZIKD001kP4As8Zgp9DEQtIuL5EEYJCto53lM3nGTDjdeeZH7Ow10edmNUb7gD6Me/y6IbJUNWAJt9JHITrniBNPDp7CSoriWDTbjC/jCreEMEH+6nYhHJIgZLno/ejcnkUCRZKjdnREDl1amgMGXSOVxatH4KDaRRADAU19g79eUIcRTzFx3OrAK1+ly02lUcJrxHQYUF6MjKoRvz3ido1HRZYToH2eDkHWpnifuZmL5aauOgLDhjdQ3MaSUYjMadkMFNrZXpz0VfldEuwCstZo9/g2kyb6xsHZvE41XkAdGVUKMq3VoHe7ezc+dY8Fn2vb5xVDfAx8WHrTuZZyYG0itm6ChxIi466JVm5j6ANPBtCJatVyGkZnK8rnzT+IRm+xqnSlmxmc1twFgOV73s0j5AtPlnMsVgk97v1HVpoXBXEmK9Wlwa2LFKuMk8MnvNxS0csrEYslE2x8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(346002)(376002)(230922051799003)(1800799009)(451199024)(186009)(478600001)(6512007)(52116002)(41300700001)(38350700002)(921005)(38100700002)(316002)(2013699003)(26005)(1076003)(2616005)(44832011)(83380400001)(5660300002)(66946007)(66476007)(66556008)(6506007)(6486002)(8676002)(8936002)(4326008)(2906002)(7416002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?oJyj8wOp0l9pHCMb0PuZjDe68pKVBQBjeU7XNjpkPtb4a3pHYQhVW7YBzDgW?=
 =?us-ascii?Q?oAOQ8jIGeyQ9Fqj8yN5c5OqNDptuRV954V6MwmItDhOMim7Db4EqU/bzQDKG?=
 =?us-ascii?Q?d4+0EURkHHquUH2Ok0efUEVs4d0Q6eiKPvjBZiAbXfXVnbVT1QMjl0cj03rT?=
 =?us-ascii?Q?ehJtKE+xjrLKqk4HcXXGCxp/v+0c8UVAY+PGaWEvvBs+IqFvU/s07qHEeqKo?=
 =?us-ascii?Q?xNcIW3yVwAhIW3Om8MjBpkKIruO/J++Kzd2RS2dr2btlnIiNcGJZMmyt0sEb?=
 =?us-ascii?Q?jp6YpTbSG9NFkJyBWQ4zlOsiVxJ5TaFLf6JF31O66PQcRj/82z3qC2RM3bDf?=
 =?us-ascii?Q?PUIcxYDL+d02Y1eAVRR+XfxwA1bEq2R5uz/vnpSzxDkd1DZBHBV5v4oCTDut?=
 =?us-ascii?Q?0QMbYtEmZr589HZMK2XfGCDx7sAVcieTbwBwvHZdlVAT7zNkSipci6KAFiZ8?=
 =?us-ascii?Q?uvCglBo7JYd2GZk0gsqvB4QvSvNMomPnI7UWsx6MNtDmwxG2mkhom6IKqkj0?=
 =?us-ascii?Q?KGvxZS+JOZ5QLEYYrtIUxdjcAJWMyJXz6caw2ExAe2CGeGvzHpYLTkx5gj7A?=
 =?us-ascii?Q?C1fJsbyQH/IUhQxlkQdvWWgE/D4iTT2uIPgG4xocwKDgmXBT9Io52HKtAycQ?=
 =?us-ascii?Q?qZMmAiIw6q3xwl/3whcJvbeDb89Z5Jd0Jd2A4GB0RCtFBJ43sSXUaR2wxf0p?=
 =?us-ascii?Q?Y/60unDvN/5/O+EJlnMuq1t1AIyeZf6a71fjgp8E3cT9OhNIJCmFzlO6Kdgu?=
 =?us-ascii?Q?lsbAmkuDhSJz6XJN3tEw8Z7ARa22CLUkmT46t5dfXnIrQ2f3s9hWfNdw2sn0?=
 =?us-ascii?Q?Cbhr4QsJjG1Z4Ai7NAzTKeD/FK+TK4P00DzQi4jIDsBegOWiKsdLd1E12DDQ?=
 =?us-ascii?Q?LrFYZhqf8Ija6FAS3kvJhwLeNze8S4NvOIsQzefwM2qopgIJJTPZH2ZrDSWn?=
 =?us-ascii?Q?rCHSO+bzZpuziYcmrsynNncJoBc3bBsfghVSD4pwlREKF7mIDsC/TojcKkY8?=
 =?us-ascii?Q?AXuYXYGV0fYN5upMm5rJta2s985puwigO3wGqUpn0VIqtgeRMQ1DwpXQBiGf?=
 =?us-ascii?Q?gJRCFIU5r9OTK+YW3fIcHzBx8J/xcmL2YIeHJkWfradW7ZJd6hRhd1lp+nmh?=
 =?us-ascii?Q?AHF2mnbwJTILx48DdR6gH+/mdnwPtMjWh09n6GAWxtlYZtQI49CS1vz4vJsr?=
 =?us-ascii?Q?hhqRJeBeEzdP7mTcnGn0OjWhIB4RdH/tW9LKaBgAz66UInQ2qOml4nRAkJvg?=
 =?us-ascii?Q?OSChNe1UDd1hXNXi1jtQqWlNLr+TEgJqMIwAiq9GMnkR0KAYOjCSYzp2ldnQ?=
 =?us-ascii?Q?jWSpGYCOYjMeR1Qidysr/o1Y8HrIu9L7YmkKSg8bh+r/LG5dnuuh2uRQhErl?=
 =?us-ascii?Q?qH6Ddy+XjI6IDeYo9UN/MC9qVS36YJToyAh0Yba7ggUK6WfSiJfF8vcPS4IV?=
 =?us-ascii?Q?dfqnLjSn7CgZSV7uLZezWSvvqJX1gnzmE7Pbyx2MHSCk/m5R7f5OwEV8+m1l?=
 =?us-ascii?Q?vxRxWsWH1Kuw9TIwBn4TNrH41ALIxVI08S/LdA9PGqTYgf25QyBMkgHk2R1U?=
 =?us-ascii?Q?A6VysJVtrPPqzv26mVfsoiUuQ2zDNdQq+0o70gSb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d245b4e4-e2d9-4e9e-ab46-08dbbd72123d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 02:49:43.4517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMqaidMqB5DSOkwlW5ATRr2J9mYZu4tgZ3Ptxmmm7A9syRxJoCjlijzmwaXHlFh77gGjvyXEZiVQxNH/I7rWWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8232
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

