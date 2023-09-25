Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A7C7ACE74
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 04:50:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=eoaSR7gV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rv6nD06YVz3clP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 12:50:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=eoaSR7gV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::62b; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rv6mG68tZz2ym1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 12:49:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQkp+qIpI4bGHnxvxodeSqlXE8QUEHO1iFcAeK8OfakvUfwCxvULPhC7fXjyWgcfhWjpfooJUydP91DmgiCOLOop6v/igq8guqax0aCh2NVo+VSNrl3j1SD20Gc+APcSv4qZNa+xz1T9dk7gh5so8NQpJF8OvAZWmjZFBM2EZsHwvBdzVND9H15OeWFH/KLeiw48agoSFV/KHgBIziVB8KRCYJmsZgx6uz1qmoNgqT0BiQHXJEv2ywBNzS1BY/li2Mn154hf39QvSrtJt3j9ITuqIUbXb6oe4o100ZyaAV8fg/PTVXoAPp+pOshtoiGnP5Kdb9rt/sCtWpV5DVpvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Atu2yeOUMSdGg0Bv9GuZJULBgLbhni+7Y8Yt8KV6bw8=;
 b=YVmOzs25AFqnjCC936rXdKI6ZYNWWg9TwKDCKSuYwlr7cawWIPLWvkNa7yvIovFb8tjEYR78mIyB/L1RVZ8FlHwE52wmo4Ndgnk3pspQ66ICjUzj2OjCVeZNz29o5yKwwgy3oKs9Ddix+UgiwBthDBKeqg6ml7cghJywhyog6c9KKP8z5Czd0mG+76SkUd9dQ4Mqg9pSamg0w3HsvBh7dCVo0CjtwG/chjPinwOjUmbuQt8v06+XQ1zOs3TxqmxMli2WxZXfA43xt8pdgUPWcgQnDrtxQt963deaZEKtd8z6OZuD2jgX+c8NkuwnjJl6HJcltzQ0aAYhrXjXLOllsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Atu2yeOUMSdGg0Bv9GuZJULBgLbhni+7Y8Yt8KV6bw8=;
 b=eoaSR7gVGBNd/0jHri4De5OKTx2c/+ZLoxcfOmtI+EBazQ+BSODDPLsKt0G/Q8yWVL7/eTPXo86tcR0M4CJI/ioDcdNTFrldnx6plCf2eecv3NU9qKjZ8y7RUzFBiFcPfe4sOJM3n5hO3i0X1Q5v+db+xo6Aa6d45qcPos8DiGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AS8PR04MB8232.eurprd04.prod.outlook.com (2603:10a6:20b:3b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 02:49:28 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 02:49:28 +0000
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
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl_rpmsg: List DAPM endpoints ignoring suspend
Date: Mon, 25 Sep 2023 10:48:46 +0800
Message-Id: <20230925024847.2971421-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AS8PR04MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 08cc7204-79b1-4f6e-a40f-08dbbd72094f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	i7JIQbjns09NJq/hZlGPCrmHr0oobaQiAWxDPbMKALdyTvnp2z4jjKU2+4KFsSp6pMualjzuBSMs+Zpv0H2grB/qVfYSnzbtgde0fIfRCQfQ+47EcrFRZrAfulhAiM7v6zyyw31fXtY/idxrmCLmon8uOnlyUCLi/LraGykyZmFA6GjNfyRlRAEV1fC7K3HV3Q30eo6RylSnhpORQCsg2eN8mf6bdILxluV7ZVV0HVP6mJtc3fnulBrXAqCi1kSzQmTx9cM3K3g30WPlIkVk5VOeamGA3X/pPhwwtqjruDnFjF2qC3OeaHinLLfsJ6Xni9llxdw6XasKUV5iyzoFFp0/gF7YwoHx8F30KYHdMK+dahg6HQGOWgEuX2iZkiQyt5NRra1N7Zqm1QBA2vovlig9m34EIBx2fDQ2FI06/teV75w8nlDPpmTPbblNneaFXpJgJTWRU7t59Q71zPgwCkKKdHTpS4gBvrrG+0n71F8PMstHeyr4qs1Ft+I4GnAanMGSkwBlLewsqlirbuiwjKNeFQh1SF5yfAA20mOyNk1qzdB3GTPqnLO7MRCgfCkjxX5of6M3CDADzsxoJzO0UcbYrPxpIuNy73XdbC/JP8AHGgyJLtE83XMc/6S8fRo3rk/dIze/ldaU6H2sMuI9qw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(346002)(376002)(230922051799003)(1800799009)(451199024)(186009)(478600001)(6512007)(6666004)(52116002)(41300700001)(38350700002)(921005)(38100700002)(316002)(26005)(1076003)(2616005)(44832011)(83380400001)(5660300002)(66946007)(66476007)(66556008)(6506007)(6486002)(8676002)(8936002)(4326008)(15650500001)(2906002)(4744005)(7416002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4eZoP03Pm6sd57TIlBDgsrAt93febvjPfyxmtOYaCmB+V4ZvZWW0c2uWaJMH?=
 =?us-ascii?Q?gvgO7Ee84gQgfcbSIQFUOO6Z1+jW43dvGCqxGz4Y8UKR2UX5l8TZx+M11VGf?=
 =?us-ascii?Q?+AihQO8ofZRhIOpjIxjWxdv0668V/HPl9D5aYuZLr0j+mtj9qdBetAlFEuHN?=
 =?us-ascii?Q?p0hjnJiscLrHeYVaFwWNH5KWE97eUtwoA1bMepUyzVPHXqFMJs7QikPVO4Pn?=
 =?us-ascii?Q?0dArzHCM3zOJgMFuj2MMdCpvcuufTR9kRrgkTp41DbdBqesVFoo2wDro/kR8?=
 =?us-ascii?Q?uyF8uOgjVeWJArpaxY/mZJt8VkPln3fmUTgvm5O9tlhOic/HLNSnPVeSB+5d?=
 =?us-ascii?Q?QITsDeJNTLvuTyfTLHeDwVul6S5NjqnHV12caX4+FqaKVWQaoxwpX6SJVp3t?=
 =?us-ascii?Q?EbyqeLUXyVQqHXmMT+lk8T/PNsQ01gCBENug4S/R6gXBfW2gBYFZt22eJOK8?=
 =?us-ascii?Q?6iC2quopopeR9jAIz+x+ksKVc2uZqu2qQDrCHp81LjEff2fGAzdR5W/8zMKv?=
 =?us-ascii?Q?SUMp9QwhvJq1oTT528i61x2kZaIlTTj+zZO60aROF8oVIkedTHsAqnzRGoH/?=
 =?us-ascii?Q?BLfDHndK0pqXZzvDpfxN9yzx0g0N/huAXo7lOwzDxdietSuFZsRXEAfpwQY/?=
 =?us-ascii?Q?sYXG3x0W2MBG69iZe3gqcNlF3KX5zFYgf8YrT1UGVwUoQfnY7Hm+lAfPSsa6?=
 =?us-ascii?Q?p0wOIBmxNW2LlqCmL5F4YeefxsnLv9KTPuyxa7tl6SIU1eUnuhesF665HkUd?=
 =?us-ascii?Q?c+nI5lf1Nskw/ziIZCeeB1aWELAjlcZY3CR6+xqU4zpebxGBIfKcdKgnNCC3?=
 =?us-ascii?Q?maz5KVoFFDUhzkzvolvZn8Di64G/de/ssOds84JHzbpFVcbLterm58QomycV?=
 =?us-ascii?Q?Y9Q+4iCdJVVPuZZDvl1OCTDRSJBqiFHgQ6zdzgIOEiy0pxgUsFwVLI8zjJe8?=
 =?us-ascii?Q?qmHBMGWbVDogoJTGKHve2xY7kl4Re3uSuoU9Str0G0sZcF0kz/gbFfa6hhFV?=
 =?us-ascii?Q?4oE8bmahPoU4qe4QXwvy8FXELdsEM0GoJXRDgw0J2cjt2hKSOul3DbUii7xO?=
 =?us-ascii?Q?c13IfGy1DcL9IcoUo6eSNuaKMI9QWofktYYkptKaB9s2BJEeokh9a1nXRlGN?=
 =?us-ascii?Q?OTAwPwwOjVt1/BIDN/zrRgZvdHSzR77x2ov9JtHnWFvnTsLvL9vGycRJFvnX?=
 =?us-ascii?Q?0vra+SZWpoo+sx+vIoGreV3PlOgNXI9hqSnxkEelR5H84EZreW0U3gE67K83?=
 =?us-ascii?Q?78XIAcZCdBN6jW8LrzRdIbxYT+R7Q5vCHxL1YUP+loQDGZScMDyX6X45PdY7?=
 =?us-ascii?Q?ZTGsp5wx+RUN7bg1fvH2hKGnHwD3wD45dxYm3GwgaUuz6J8D2ivEC50CWsHD?=
 =?us-ascii?Q?dFNEI2AEJRDCBsNvcatoNqC0K5SQqznvphJe3NcK/Hcoutp5CNJckgoOZRb2?=
 =?us-ascii?Q?6Kl6QaUnqovC5IDQDtCERVxYGjsuHT9qZkWHK3OX44hZJUGgaVZUFtgT7rNn?=
 =?us-ascii?Q?9K0sd828GxGf03uMaoTUkUO9wicjEcV0g4jOXTwgDytQla+3PAP1WrZG5zwf?=
 =?us-ascii?Q?Q/OQ6nQ3BRRBtfO0Xla/KQTq3BGJWA4ZffoM02uY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cc7204-79b1-4f6e-a40f-08dbbd72094f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 02:49:28.6031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTR/TjFBi3pWElb2xjIW1hY162F1/IC0hGMdODv2KuNLKEozymoBxeBc8AxRqo5LUMXURzKeNMoYCZKEfsm6iA==
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

Add a property to list DAPM endpoints which mark paths between these
endpoints ignoring suspend. These DAPM paths can still be power on when
system enters into suspend.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index 188f38baddec..ec6e09eab427 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -91,6 +91,12 @@ properties:
       - rpmsg-audio-channel
       - rpmsg-micfil-channel
 
+  fsl,lpa-widgets:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of DAPM endpoints which mark paths between these endpoints
+      ignoring suspend.
+
 required:
   - compatible
 
-- 
2.25.1

