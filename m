Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1498A4D07B0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 20:28:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KC7mL6fxKz3bsW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 06:28:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=variscite.com header.i=@variscite.com header.a=rsa-sha256 header.s=selector2 header.b=GRH8vOiV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=variscite.com (client-ip=2a01:111:f400:fe0e::621;
 helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=alifer.m@variscite.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=variscite.com header.i=@variscite.com
 header.a=rsa-sha256 header.s=selector2 header.b=GRH8vOiV; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::621])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KC0lB0BxTz3002
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 01:12:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQygDwizy5xvTcNr7QKinmNuxiYeWONMXfY/qKrSQAkxMH8Jdf5gZeRYBM+chMvrnuRPC882f2RMVpCdA0HWEuJL+CB6TnzzEo3Jh2SsljkprLGLvHzNH6Km0dIcAlyTmkjgeIOOs9OywzK2XGlI5HAALfFMH3KeqE70bB3o6FPdl2yk0eAIsIjyNjfwJcjyOpwnMi5E/U2rBqg5nPgfB65wEsjnmJ5qccvnsrUFcJcrKCJHR8o3Uv72g4uBsJXnGVnNN7ji+Ttea+iLtnQaqq1TxK8GIbpPnEHs/IL4BOuSwFZfeWO70u5Z5XxyNb03jnWa+YqlGAP/bWCXp2XW3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gx8BNL3s+XeagdGo0wt7kXm6iK7lPEosXJ3aAMvoDY=;
 b=OzpP0pnTIrhvS2pqnMJMgMTXQGoz0GiDjWks0AwE2ZQ26c4+VvWHCfa5y5KqrGFc/1gzU2nlfXZYZKct5kwtVuc0nfBuyZn1FSJ7GMEMJn3pJymBXwwOlBj/jq8shN7XQIO1nAjtEEWAFCy5ejyYasm5WxHUvymxpQwu600zg6G1Ji/TlSKu3fDGEUY1r9EhnS1nbM0ybVzgBy4D9UJyGHqem6iNmLdKDV6NRgpEELDzD1aWbaIF9qrGFBULzBTBKBs3+hiJstHmfewxgKkYFlzSr+C2MzU1eAGi/aI7vrP74SDmhmbJZde2UoTkwJboMRnHVniEIo8nng92qzxaPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gx8BNL3s+XeagdGo0wt7kXm6iK7lPEosXJ3aAMvoDY=;
 b=GRH8vOiVB9r01fL3lOXA+LYqhPZeD9sJNHPHi+ESpUeYfSNeiQY1JuzcMw263SW1Y/tFWp992fdx72AGh8cU/2TaNFSpC5yHuqmojlyolNpucoa5IxW+VXV04gzO4Fwv+VtmWiT9jkEbjCdeJ1ZLdIMZzRHD36bs9pNm9LoGQKX1YNYfgKhbjamGeXEp8vAWQgb+1ps+wm7Ap5NuRBekjTBvNrjwDzK1+pDnrcWiCnGG/3+uQ2XmG+G71vygvdkScI5/YdHsPX2z/CFzrnevxQmn7/KV+JnRUpmIQaHNKolUa6iiuY0qQ90kpbXBWtsudfsSomzlFSIDU5lxb9oR7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from AM9PR08MB6999.eurprd08.prod.outlook.com (2603:10a6:20b:41a::7)
 by AM6PR08MB5219.eurprd08.prod.outlook.com (2603:10a6:20b:ce::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 14:12:06 +0000
Received: from AM9PR08MB6999.eurprd08.prod.outlook.com
 ([fe80::784c:5631:d38f:9a63]) by AM9PR08MB6999.eurprd08.prod.outlook.com
 ([fe80::784c:5631:d38f:9a63%6]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 14:12:06 +0000
From: Alifer Moraes <alifer.m@variscite.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ASoC: wm8904: add DMIC support
Date: Mon,  7 Mar 2022 11:10:41 -0300
Message-Id: <20220307141041.27538-4-alifer.m@variscite.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307141041.27538-1-alifer.m@variscite.com>
References: <20220307141041.27538-1-alifer.m@variscite.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CP2PR80CA0081.lamprd80.prod.outlook.com
 (2603:10d6:102:14::19) To AM9PR08MB6999.eurprd08.prod.outlook.com
 (2603:10a6:20b:41a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39063901-efac-4b8f-b88a-08da004475df
X-MS-TrafficTypeDiagnostic: AM6PR08MB5219:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB5219EFE3CF32D8B38E392ECB87089@AM6PR08MB5219.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4/NjRiVRDQFTTrYXLrbj+Ic7yBa2qMffIURHm1mQA2Zt+A6UwTClc8aIEYgvUcdigp0qS28FWB/hbu8kNJA1San4aMQes4b4KWeI8gYg/xzTT5B9QaDcxfPmcweOpGhgq6lSb8WGQc6W8BcTJBG0E79Qsf48p0MDduHZQ62dg6vgjxuaUlxiMKjN6EpYuNdAaTV5ylPJYazhidsr9qN2qTozwo4VxxgdkSUWXZD2c4u2zATRKx6yyLslxlCbeySfBPzPNrPsMIsSgStWlsweGxAFsins4KlfnOQbBfDzJocL9SCEEdvjt+16GqqPRLjJjkhLXeT9Gu6qzjJPJP+EsJDU3nbb6xr9HTL5VycIEhE1uw9A0mb1WVkUWRYP7MAwlmydmYHRDSzcnbkOKwqTLsqjU2CFtTXfTGovL1MosHgNK1VmhSG/DN783mHHcc6QOCwCjdLiDLOaqXFrhzV02soSYIEJ7L7a997rJdZNTQ/E65WIgZc8U3bdcBJrvDvziWhD/Gs/Ifhp+Ok+yhhtwHOv2gxJ8r/mC7faTRwmRXYlEgkYN2HvPxZpl1j98bUS9ZGg3Z+sH9OG2FeCfTkxwNtx3f2Y8nH5Qs273bzD/BwvLmg2qpiF3B0X8emv7wdnkZ1g9EuRxagsscpIMoAxnZmiAKv9CqBXuN5UH0PIHFkr+HFaMy6+7TOgOl+27Uc8bqNiD+NSJRfMcWxV9nMx8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6999.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(346002)(6916009)(186003)(26005)(2616005)(1076003)(508600001)(6486002)(52116002)(6666004)(6512007)(6506007)(86362001)(38100700002)(38350700002)(36756003)(2906002)(66946007)(66476007)(8936002)(8676002)(66556008)(7416002)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ix1VWjlxmevFZYjgBNsZ1oVy3c+JvEYTYo5PItLrngnZ1bBWkf/fz53LLI79?=
 =?us-ascii?Q?ZeEx3zYOSy4pessprbjunUWRrCO2ez/c3HHWv3gh4m7rvN8Zmu/o8pLU7clT?=
 =?us-ascii?Q?NgCbP71Z3kOC0eGpuVhe6VuzuUWXr5Krs4G2CWsEVyazMO92+PZKbSA6BxMl?=
 =?us-ascii?Q?Ll0jnyefZ2pa3lnxT81w4Ne6PseK9UvIhcnBpIAEXO94awrPLINQUKAYaYaV?=
 =?us-ascii?Q?cxZszLEm/CnTSsEtWey2o++BRzHcr+H9oyOAUxkfMZqV4pn+/n8fSIKA2En+?=
 =?us-ascii?Q?WN+UsZtsQ5RxYsCrV5s+FhyfhA7BbE38CeFVH0hs4jFfq3KuSbKd5pSe+atn?=
 =?us-ascii?Q?Bsa8hnFnXoUoryJkI/tshGkSHhoIQ8PERiYp01g5LfvBS/UlFb3u6CozRdxM?=
 =?us-ascii?Q?/0bnLXEllvWgO0RKc/CmGCL9UdFcj/8P4qxBuilJeKZagGWUdosWU7lefc8T?=
 =?us-ascii?Q?5ziqFZFdnV86nHnq+Ktp0yXmacuBiJyn0MAvh4ySQr2aML2auYlax9DlNa4o?=
 =?us-ascii?Q?Fa2kgB4l181/oBp49K7QONR46EGd0juroUbfAFcP/uZSZJCu1gIU/odmQoQZ?=
 =?us-ascii?Q?1A/kg2i3n+OGWIme0I1nXInvgUIEPAaZzNW3dGiP2IAUnF3qMxkWe9HMGjoA?=
 =?us-ascii?Q?h5l+76J5KSWEOImkHBMD6s7Q9/DikJg4AHQWzCsp7h2NYXt3Vb1fwPfQinHH?=
 =?us-ascii?Q?h/eKS/Tcg8QJ0/CLTyr5q7+tAyTjkgsZgyPBObzV74B3KK9e1oFuEvQUhKOc?=
 =?us-ascii?Q?+YN/PCtQW08dclxCue6UU5hAv8tRPCWdkekDATJCmGClH9434X1npJclKB2O?=
 =?us-ascii?Q?sD+wbL5aJFaxRO7M6dPJLt1CmsTojiS7bicS3wHpYF7UhbGVB3265Qm6pGfP?=
 =?us-ascii?Q?OxFg8Ujk4tA8/GxGR4zn871iziZ4ymZu1etwO+L2tVB0HtnvZA5nfvvCqLkQ?=
 =?us-ascii?Q?6DK3/2eHu5/Ysd+6IIipT4tYhL5owNVdhjieGA/tCgj4s2FPcG5cKP7fytMD?=
 =?us-ascii?Q?PlO7gXddSCUuwPuLy9uf7WSOji17NuqmDYUkWjI25aIum2xwGqHvH+TetvqJ?=
 =?us-ascii?Q?weIyd/BJ7NiPmlZm526DqOc+jGsN1wWbq5zDUZT8s+c+SY69El+MZ9PcgdUC?=
 =?us-ascii?Q?gKJVlkRlCwv15oHPiA8PwKUBJyVbjK10cnn48prq9oZaJykNka/TdAzFdbT7?=
 =?us-ascii?Q?knQU/4o+rnUTKLWfyOwgJmUCfM9l8ZJUeNb0pTEjWMKDE9yZSLVK7KD0COh8?=
 =?us-ascii?Q?uEx7ePORzCuZ/qqx0uQJfht8cGmCZg+CpY3oAWt4U9LyoC1pGiOh9kSp5CS1?=
 =?us-ascii?Q?KFMDzy532UjKWZFrpI+FeoW2X2cmyMl26xwI1gXw5bHAaU7GyHTUpOgKXTKl?=
 =?us-ascii?Q?gpUDEJAbGF310Ue8/Tttun/0DknyjJCixyz5Ap5N22y0qJCk2h41lQ7QcFJ1?=
 =?us-ascii?Q?8Lui54vJuVr4UDikoZqW6AtisHxw8dN8cL0ObRbFGvkAp+3h2naMJUgZc+Gm?=
 =?us-ascii?Q?bt/Xt8DF+WPtuBM0HBtQbNX3h+SQK5KRrG0TnseJfiLM6ZJ+VXqKYPynkCwb?=
 =?us-ascii?Q?I2OUwAV5LY4JXcyU84d+qlRtsGr7dk3E79df0Me8U/R5GhCL/c1ca89GOdUu?=
 =?us-ascii?Q?zY76qZSP+A+GV4DfcW5G308=3D?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39063901-efac-4b8f-b88a-08da004475df
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6999.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:12:06.2499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYx0NfhGEOceVS5NQhX1NviuJfrPDuAD33JWsXyRNw45brM1JTHyLqYMuesVQQUdBhF2Pq+qh4yfrsQCu2/6Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5219
X-Mailman-Approved-At: Tue, 08 Mar 2022 06:26:32 +1100
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
Cc: pierluigi.p@variscite.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz, eran.m@variscite.com,
 broonie@kernel.org, patches@opensource.cirrus.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Pierluigi Passaro <pierluigi.p@variscite.com>

The WM8904 codec supports both ADC and DMIC inputs.
Add dedicated controls to support the additional routing.

Signed-off-by: Pierluigi Passaro <pierluigi.p@variscite.com>
Signed-off by: Alifer Moraes <alifer.m@variscite.com>
---
 sound/soc/codecs/wm8904.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 4121771db104..c7987dc81e4d 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -837,6 +837,26 @@ static int out_pga_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static const char *dmic_text[] = {
+	"DMIC1", "DMIC2"
+};
+
+static SOC_ENUM_SINGLE_DECL(dmic_enum,
+			    WM8904_DIGITAL_MICROPHONE_0, 11, dmic_text);
+
+static const struct snd_kcontrol_new dmic_mux =
+	SOC_DAPM_ENUM("DMIC Mux", dmic_enum);
+
+static const char *cin_text[] = {
+	"ADC", "DMIC"
+};
+
+static SOC_ENUM_SINGLE_DECL(cin_enum,
+			    WM8904_DIGITAL_MICROPHONE_0, 12, cin_text);
+
+static const struct snd_kcontrol_new cin_mux =
+	SOC_DAPM_ENUM("Capture Input", cin_enum);
+
 static const char *input_mode_text[] = {
 	"Single-Ended", "Differential Line", "Differential Mic"
 };
@@ -930,6 +950,10 @@ SND_SOC_DAPM_INPUT("IN2R"),
 SND_SOC_DAPM_INPUT("IN3L"),
 SND_SOC_DAPM_INPUT("IN3R"),
 
+SND_SOC_DAPM_MUX("DMIC Mux", SND_SOC_NOPM, 0, 0, &dmic_mux),
+SND_SOC_DAPM_MUX("Left Capture Input", SND_SOC_NOPM, 0, 0, &cin_mux),
+SND_SOC_DAPM_MUX("Right Capture Input", SND_SOC_NOPM, 0, 0, &cin_mux),
+
 SND_SOC_DAPM_SUPPLY("MICBIAS", WM8904_MIC_BIAS_CONTROL_0, 0, 0, NULL, 0),
 
 SND_SOC_DAPM_MUX("Left Capture Mux", SND_SOC_NOPM, 0, 0, &lin_mux),
@@ -1093,11 +1117,21 @@ static const struct snd_soc_dapm_route adc_intercon[] = {
 	{ "AIFOUTL", NULL, "AIFOUTL Mux" },
 	{ "AIFOUTR", NULL, "AIFOUTR Mux" },
 
+	{ "DMIC Mux", "DMIC1", "IN1L" },
+	{ "DMIC Mux", "DMIC2", "IN1R" },
+
+	{ "Left Capture Input", "ADC", "Left Capture PGA" },
+	{ "Left Capture Input", "DMIC", "DMIC Mux" },
+	{ "Right Capture Input", "ADC", "Right Capture PGA" },
+	{ "Right Capture Input", "DMIC", "DMIC Mux" },
+
 	{ "ADCL", NULL, "CLK_DSP" },
 	{ "ADCL", NULL, "Left Capture PGA" },
+	{ "ADCL", NULL, "Left Capture Input" },
 
 	{ "ADCR", NULL, "CLK_DSP" },
 	{ "ADCR", NULL, "Right Capture PGA" },
+	{ "ADCR", NULL, "Right Capture Input" },
 };
 
 static const struct snd_soc_dapm_route dac_intercon[] = {
-- 
2.25.1

