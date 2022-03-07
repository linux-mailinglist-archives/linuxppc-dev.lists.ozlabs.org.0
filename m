Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ABB4D07B6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 20:29:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KC7n92ytgz3bpy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 06:29:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=variscite.com header.i=@variscite.com header.a=rsa-sha256 header.s=selector2 header.b=Awa9Lpqi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=variscite.com (client-ip=2a01:111:f400:fe0d::62f;
 helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=alifer.m@variscite.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=variscite.com header.i=@variscite.com
 header.a=rsa-sha256 header.s=selector2 header.b=Awa9Lpqi; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KC0lW2QtPz30NC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 01:12:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INPA6JW4cxffBbFS3fg+/eJXvy39OWtedQMchpbJek4nctKjMEdHvBjTxKTKhOLktnnOSdaOaQTqpa+CiizfB3LGoMx1Mdk06NWzQU2kE8M79JrXztV3wn7QuIoqGcyRl2p6T6kkfnvahPq2EHLqdLMER+eiBBXSfH672N1Q4Z5zgmved0PiXlaeAt/qQjjsAvnE/BQtV20GTDJyiWOLtT3f44lA7E+mwJNERmQkawIA5ybZ1+WnLjgLiaDGKav0k8NfvDw7voZqOrCIHsjJmyb6eYmojaHyhe8Q79aKtZorZ9pELcBTXlRcwgpN87jsgNaLKiowLFbCtwGI4ePSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xfxO2QESzsMoYzM5KotQCqjNI96AHoOTOUeJF3hLyQ=;
 b=DH2V5zCuAxTPgw0eZqJNfT956KWTila45XHyref5ae7BD/y99zKHpC8lfuZyDGSNNC5AmoM2M5yvL91NHJYZwlP0v+UrL2/1/Dckph63D3HOE9iOfE1iRkvTR5K50oHdUYWpi8d1Ba532Raq3iOl2IeEc0Nv8cJ0L45qsP5HMl1iBMlqlbgfeTqcrWCy/dpANU1jAmm1iVHEnz0NAg64tPulUyQEdZESYLTzvFVAqLFRc1+4N30yXqnlPoXrkaKaG8vfUx9t/Wc8+EP5Iqn509MWaW3bGQzkX+w83p+6DOMuO5oO0tOY/VmZAXauELvdg5Ebklkd6TvBmB3fG9rsYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xfxO2QESzsMoYzM5KotQCqjNI96AHoOTOUeJF3hLyQ=;
 b=Awa9Lpqi7hbuKkKn498XXfnDiLvWHbm4KKCC9OHcOxrhFhanS3gvXiTU4YTgKGYHjQNn7cR5YWp5TLojRxZYN0gggPPXdbEsi8s/qaRPiELOW+ZP+nCDE/upBitUI7LaYkBBFtXbo1UK1zQl6kKWCYi4Q+Q5BDOZeQTOMRgXRToQ8Ylx9J1di94wOIWzSOI8d57SHCw+yATEBGoP52wDdMHwtiyJxK0qh4XaN/PQ9S1sKV0md5S3E7nHdVj9t4b6bsM2ucEBYfk9kp/vAPq2tBLBxsYhe2jqx2LbS0QmHvxHPbV8Ku/NVI3AnBrRkjA4GF/8lMIxWSa22TWVHieGfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from AM9PR08MB6999.eurprd08.prod.outlook.com (2603:10a6:20b:41a::7)
 by PAXPR08MB7393.eurprd08.prod.outlook.com (2603:10a6:102:2bd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 14:12:00 +0000
Received: from AM9PR08MB6999.eurprd08.prod.outlook.com
 ([fe80::784c:5631:d38f:9a63]) by AM9PR08MB6999.eurprd08.prod.outlook.com
 ([fe80::784c:5631:d38f:9a63%6]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 14:12:00 +0000
From: Alifer Moraes <alifer.m@variscite.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ASoC: wm8904: extend device tree support
Date: Mon,  7 Mar 2022 11:10:40 -0300
Message-Id: <20220307141041.27538-3-alifer.m@variscite.com>
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
X-MS-Office365-Filtering-Correlation-Id: f06d0828-2c72-491c-3a91-08da00447279
X-MS-TrafficTypeDiagnostic: PAXPR08MB7393:EE_
X-Microsoft-Antispam-PRVS: <PAXPR08MB739351508645743DE3FA1EED87089@PAXPR08MB7393.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MG0PoqhoZfE/HQTQ69he8f0MnqDurkJs0vj1US2bKYaguYwiRiPFDNWUoJ9dpMd6t+r1WADV1aBI33SkZY35HLkve8TzMA+UbxvI20YuYR0q5vyU4RrEKV3uw/OkvUrNV4YmZ5MNRz3YF9LTxDJdxAzgnsU3KQz7wjz6FTeGvWDq5dK16I49vSqUZzyWEOSW/u5FZ2Qq+dry6K6VLvsQ0de79TEPodSs0LacMwBrn6p//JR6mfoLX8QK/Naey0ktf4zAqV6vzfa5jANkL1JOjrhat3qsA+7pG3TCIkZDUrW4L3gMoQC1r5YrBeHRMzhjHrteHQVAlunMTzs30b2AI+2OCEDCdko6XS3+QWgquSvN9/jljxiaSlpG32nbzm7xqrXVk+srHRn6osJIkrDtS9Z44ZA7m+w9BtgriGyn8qAHqQQh07oobwaliCqLK7qE/4eeyVtwOth3H2MsD3dr40YflMr0+ELW2VQF39KhB7Pr0xhQYm9eMAYS5WZkl20ke4EI7h+w/1ofeP0CMDtMfAtzvRwwQFlo/3P09jKYV6jAdoQGlquAc9sPtRG1TBYstRZ6RdUdJa9xaGPsP4qViA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6999.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(346002)(4326008)(186003)(26005)(8676002)(83380400001)(2616005)(86362001)(7416002)(6666004)(38350700002)(107886003)(38100700002)(66476007)(66556008)(66946007)(5660300002)(1076003)(508600001)(6916009)(2906002)(8936002)(6506007)(6512007)(36756003)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5CsgTuJoYOORMR+x9Jazr00eIeSL07coNy9/K390RFqX2r1XzpnnYaHwgGVF?=
 =?us-ascii?Q?y373DJ5O3bomcQv07jGL3mM/qhsLMEE5vOR5xghduWj9IiP7vMaacf0LRyKj?=
 =?us-ascii?Q?ecEiyMmfkP7YckPVl0zh+HpJvCYs7fiCnxNsYbR0ucapvTmxXxA0zwQMq7sP?=
 =?us-ascii?Q?j3h78zmrezSFD59b+Dn9mTgkG6tspsoGTjVp5oJMNgryy27nBqY2rNz+6oWw?=
 =?us-ascii?Q?rpsIIwyyJOwxCmL56es9esk/u7/vjeLtB5nPqakvUAPR3q6Mm1J9KD00MtoV?=
 =?us-ascii?Q?LmRI34gK2j/7ElYtafkputgczSKHl7YU6Pe3cmwn71WSzufPBUahq7qkejMm?=
 =?us-ascii?Q?/yn+UmdOLo21OjQrJSPfjFKj4kfz+wMVTQRJ1pBRe4m4VwCgp3SDBZeI5blq?=
 =?us-ascii?Q?2tlS+DB0dMdYOEcGiRIBP3h+Oh4lf93DbmdGzO74/dgYcpOkh5sp3F18CVIB?=
 =?us-ascii?Q?iz6Wsk6WxbCtTXqewd1YwaMbt/2CIIPOD9NLJosDfI0fJKnl3wVDiR88jHx8?=
 =?us-ascii?Q?DcYHKX8RMrhSy4RzsZ8f9WnOa8nqo4Q1PLwSB3R3/5/XX2fM1kYmcM13HE4l?=
 =?us-ascii?Q?sF6AISdFuVi57ihSs1sxssKy9LkWZrxrpqjdG/F3RsmsV343bjnOCW046qdT?=
 =?us-ascii?Q?ZS48SxNzkd3gucQSlbOtAcabRf0hEEM79psNxjCdCFxTFdkrQ1B/swvCnxwJ?=
 =?us-ascii?Q?QccCPKuXOlsjkjPZhvWT0TsQu0Q/m19a7PtLuKvp/LTQeW16qV8sZiOB/8Nz?=
 =?us-ascii?Q?Lr0XehFzQAe7GTbv9z4trvxru/onJsfbS6MmcVFdhctFgIJ7NUxQggmdwfrd?=
 =?us-ascii?Q?RfktGKCO/7MdfRvVBWWXXw3Y6xkiSOROwoR7GU6P9PWmFpdue+b2QPN0dBFo?=
 =?us-ascii?Q?nS4VlsI8mt9GN2Eu1uz0ZycfFO0qUlO9LJnroo4hU/bYcFVE8a9c8knMrGUf?=
 =?us-ascii?Q?r9eOBcuTHW3IEaXf/2GjaixpwehF7UD9Rl+XvjGTXw60AOUmB0VQT6qWssx0?=
 =?us-ascii?Q?2thD0WzzttYDKjI/AAbjz9sPzm90RjkfrlJzAGzY6CddZ3VoOl5nT0ngb1rQ?=
 =?us-ascii?Q?Svw6dJ3g4t8Bo9OxI5WazmydtqwzaaUKe5ZXpQwldU1m0lw3hehTT1Wr/UA3?=
 =?us-ascii?Q?3JMz9TleUDekvTQPAYxQo+uA7UC9BBHhrnYhmdcIWfzdjhmUsdmgJDcC3GDI?=
 =?us-ascii?Q?v3DpROjidFBLVQ24aFNDsX0OPkByuYEBNOg6j/gDWKVcCY89YPo6x7Cyb9aO?=
 =?us-ascii?Q?18UX5CehWDjM9fY+9QY0ROL4JFFRwyDvgElqVRnHRwekyBW0Fm8H0AEdSPEs?=
 =?us-ascii?Q?MbJXDgiZYJYd+La6cmGYFCHoJ+O0jtWP0/tdSDoNxb/Z/BF7bteAJrc5uyWc?=
 =?us-ascii?Q?gvJDKJouKp1zUUagcOsfgUCb+9ING8ubRvOgdwPHLBimlo7WEc7zowRS3U9z?=
 =?us-ascii?Q?dO4qRinsGimteBowhDxQR2vDvNCSl+6pulzR5grt+E4JeZv0sRMmFXn5m8Vz?=
 =?us-ascii?Q?t2fhbvosXolf6yohcLp5kUdDMjnJ+VorMxASlBBH/YAHTslFTVPH+AlwHDCB?=
 =?us-ascii?Q?nWNlIbRozBNztPCntMQmcIAcMT9GnjjeqaWswu0LkEtJGnTGiKZFjZXwvK/w?=
 =?us-ascii?Q?xUZFQAzsQX4vv0Vha+9VQ3w=3D?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06d0828-2c72-491c-3a91-08da00447279
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6999.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:12:00.7806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rNvGWe60dP6i8tA23HPOV+blX5m0RvOy8Y4c0KYfyef4v0WaIQCr+T6uwcaOXz+TMEg+L0WxOcTNUatjPLAsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7393
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
 broonie@kernel.org, Alifer Moraes <alifer.m@variscite.com>,
 patches@opensource.cirrus.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Pierluigi Passaro <pierluigi.p@variscite.com>

The platform_data structure is not populated when using device trees.
This patch adds optional dts properties to allow populating it:
- gpio-cfg
- mic-cfg
- num-drc-cfgs
- drc-cfg-regs
- drc-cfg-names
- num-retune-mobile-cfgs
- retune-mobile-cfg-regs
- retune-mobile-cfg-names
- retune-mobile-cfg-rates

Signed-off-by: Pierluigi Passaro <pierluigi.p@variscite.com>
Signed-off-by: Alifer Moraes <alifer.m@variscite.com>
---
 .../devicetree/bindings/sound/wm8904.txt      |  53 ++++++++
 sound/soc/codecs/wm8904.c                     | 113 +++++++++++++++++-
 2 files changed, 164 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/wm8904.txt b/Documentation/devicetree/bindings/sound/wm8904.txt
index 66bf261423b9..e3bfd3ec2905 100644
--- a/Documentation/devicetree/bindings/sound/wm8904.txt
+++ b/Documentation/devicetree/bindings/sound/wm8904.txt
@@ -9,6 +9,40 @@ Required properties:
   - clocks: reference to
     <Documentation/devicetree/bindings/clock/clock-bindings.txt>
 
+Optional properties:
+
+  - gpio-cfg: Default registers value for R121/122/123/124 (GPIO Control).
+    The list must be 4 entries long. If absent, the registers are set to 0.
+    If any entry has the value 0xffff, the related register won't be set.
+
+  - mic-cfg: Default registers value for R6/R7 (Mic Bias Control).
+    The list must be 2 entries long. If absent, the registers are set to 0.
+
+  - num-drc-cfgs: Number of available DRC modes from drc-cfg-regs property
+
+  - drc-cfg-regs: Default registers value for R40/41/42/43 (DRC)
+    The list must be (4 x num-drc-cfgs) entries long.
+    If absent or incomplete, DRC is disabled.
+
+  - drc-cfg-names: List of strings for the available DRC modes.
+    The list must be (num-drc-cfgs) entries long.
+    If absent or incomplete, DRC is disabled.
+
+  - num-retune-mobile-cfgs: Number of retune modes available from
+    retune-mobile-cfg-regs property
+
+  - retune-mobile-cfg-regs: Default registers value for R134/.../157 (EQ)
+    The list must be (24 x num-retune-mobile-cfgs) entries long.
+    If absent or incomplete, retune is disabled.
+
+  - retune-mobile-cfg-names: List of strings for the available retune modes.
+    The list must be (num-retune-mobile-cfgs) entries long.
+    If absent or incomplete, retune is disabled.
+
+  - retune-mobile-cfg-rates: List of rates for the available retune modes.
+    The list must be (num-retune-mobile-cfgs) entries long.
+    If absent or incomplete, retune is disabled.
+
 Pins on the device (for linking into audio routes):
 
   * IN1L
@@ -30,4 +64,23 @@ codec: wm8904@1a {
 	reg = <0x1a>;
 	clocks = <&pck0>;
 	clock-names = "mclk";
+	num-drc-cfgs = <5>;
+	drc-cfg-names = "default", "peaklimiter", "tradition", "soft", "music";
+	drc-cfg-regs =
+			/* coded default: KNEE_IP = KNEE_OP = 0, HI_COMP = LO_COMP = 1  */
+			<0x01af 0x3248 0x0000 0x0000>,
+			/* coded default: KNEE_IP = -24, KNEE_OP = -6, HI_COMP = 1/4, LO_COMP = 1 */
+			<0x04af 0x324b 0x0010 0x0408>,
+			/* coded default: KNEE_IP = -42, KNEE_OP = -3, HI_COMP = 0, LO_COMP = 1 */
+			<0x04af 0x324b 0x0028 0x0704>,
+			/* coded default: KNEE_IP = -45, KNEE_OP = -9, HI_COMP = 1/8, LO_COMP = 1 */
+			<0x04af 0x324b 0x0018 0x078c>,
+			/* coded default: KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1 */
+			<0x04af 0x324b 0x0010 0x050e>;
+	gpio-cfg = <
+		0x0018 /* GPIO1 => DMIC_CLK */
+		0xffff /* GPIO2 => don't touch */
+		0xffff /* GPIO3 => don't touch */
+		0xffff /* GPIO4 => don't touch */
+	>;
 };
diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index a02a77fef360..4121771db104 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -2162,6 +2162,110 @@ static const struct of_device_id wm8904_of_match[] = {
 MODULE_DEVICE_TABLE(of, wm8904_of_match);
 #endif
 
+static int wm8904_set_pdata_from_of(struct i2c_client *i2c,
+				     struct wm8904_priv *wm8904)
+{
+	const struct device_node *np = i2c->dev.of_node;
+	struct wm8904_pdata *pdata;
+	bool drc_cfgs_is_valid = true;
+	bool retune_mobile_cfgs_is_valid = true;
+	int i, j, offset;
+	u32 val32;
+
+	pdata = devm_kzalloc(&i2c->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	if (of_property_read_u32_array(np, "gpio-cfg", pdata->gpio_cfg,
+					ARRAY_SIZE(pdata->gpio_cfg))) {
+		dev_dbg(&i2c->dev, "No 'gpio-cfg' property found\n");
+	}
+
+	if (of_property_read_u32_array(np, "mic-cfg", pdata->mic_cfg,
+					ARRAY_SIZE(pdata->mic_cfg))) {
+		dev_dbg(&i2c->dev, "No 'mic-cfg' property found\n");
+	}
+
+	if (of_property_read_s32(np, "num-drc-cfgs", &pdata->num_drc_cfgs)) {
+		dev_dbg(&i2c->dev, "No 'num-drc-cfgs' property found\n");
+	} else if (pdata->num_drc_cfgs < 0) {
+		dev_err(&i2c->dev, "Negative 'num-drc-cfgs' property found\n");
+		pdata->num_drc_cfgs = 0;
+	} else if (pdata->num_drc_cfgs > 0) {
+		pdata->drc_cfgs = devm_kzalloc(&i2c->dev,
+					       pdata->num_drc_cfgs * sizeof(struct wm8904_drc_cfg),
+					       GFP_KERNEL);
+		for (i = 0; i < pdata->num_drc_cfgs && drc_cfgs_is_valid; i++) {
+			offset = i * WM8904_DRC_REGS;
+			for (j = 0; j < WM8904_DRC_REGS && drc_cfgs_is_valid; j++) {
+				if (of_property_read_u32_index(np,
+							       "drc-cfg-regs",
+							       offset + j,
+							       &val32)) {
+					dev_err(&i2c->dev,
+						"Invalid 'drc-cfg-regs[%i,%i]' property found\n", i, j);
+					drc_cfgs_is_valid = false;
+				} else {
+					pdata->drc_cfgs[i].regs[j] = val32;
+				}
+			}
+			if (of_property_read_string_index(np, "drc-cfg-names", i,
+							  &pdata->drc_cfgs[i].name)) {
+				dev_err(&i2c->dev,
+					"Invalid 'drc-cfg-names[%i]' property found\n", i);
+				drc_cfgs_is_valid = false;
+			}
+		}
+	}
+	if (!drc_cfgs_is_valid) {
+		pdata->num_drc_cfgs = 0;
+	}
+
+	if (of_property_read_s32(np, "num-retune-mobile-cfgs", &pdata->num_retune_mobile_cfgs)) {
+		dev_dbg(&i2c->dev, "No 'num-retune-mobile-cfgs' property found\n");
+	} else if (pdata->num_retune_mobile_cfgs < 0) {
+		dev_err(&i2c->dev, "Negative 'num-retune-mobile-cfgs' property found\n");
+		pdata->num_retune_mobile_cfgs = 0;
+	} else if (pdata->num_retune_mobile_cfgs > 0) {
+		pdata->retune_mobile_cfgs = devm_kzalloc(&i2c->dev,
+			pdata->num_retune_mobile_cfgs * sizeof(struct wm8904_retune_mobile_cfg),
+			GFP_KERNEL);
+		for (i = 0; i < pdata->num_retune_mobile_cfgs && retune_mobile_cfgs_is_valid; i++) {
+			offset = i * WM8904_EQ_REGS;
+			for (j = 0; j < WM8904_EQ_REGS && retune_mobile_cfgs_is_valid; j++) {
+				if (of_property_read_u32_index(np, "retune-mobile-cfg-regs",
+							       offset + j, &val32)) {
+					dev_err(&i2c->dev,
+						"Invalid 'retune-mobile-cfg-regs[%i,%i]' property found\n",
+						i, j);
+					retune_mobile_cfgs_is_valid = false;
+				} else {
+					pdata->retune_mobile_cfgs[i].regs[j] = val32;
+				}
+			}
+			if (of_property_read_u32_index(np, "retune-mobile-cfg-rates", i,
+						       &pdata->retune_mobile_cfgs[i].rate)) {
+				dev_err(&i2c->dev,
+					"Invalid 'retune-mobile-cfg-rates[%i]' property found\n", i);
+				retune_mobile_cfgs_is_valid = false;
+			}
+			if (of_property_read_string_index(np, "retune-mobile-cfg-names",
+							  i, &pdata->retune_mobile_cfgs[i].name)) {
+				dev_err(&i2c->dev,
+					"Invalid 'retune-mobile-cfg-names[%i]' property found\n", i);
+				retune_mobile_cfgs_is_valid = false;
+			}
+		}
+	}
+	if (!retune_mobile_cfgs_is_valid) {
+		pdata->num_retune_mobile_cfgs = 0;
+	}
+
+	wm8904->pdata = pdata;
+
+	return 0;
+}
+
 static int wm8904_i2c_probe(struct i2c_client *i2c,
 			    const struct i2c_device_id *id)
 {
@@ -2196,12 +2300,17 @@ static int wm8904_i2c_probe(struct i2c_client *i2c,
 		if (match == NULL)
 			return -EINVAL;
 		wm8904->devtype = (enum wm8904_type)match->data;
+		ret = wm8904_set_pdata_from_of(i2c, wm8904);
+		if (ret != 0) {
+			dev_err(&i2c->dev, "Failed to set platform data from of: %d\n", ret);
+			return ret;
+		}
 	} else {
 		wm8904->devtype = id->driver_data;
+		wm8904->pdata = i2c->dev.platform_data;
 	}
 
 	i2c_set_clientdata(i2c, wm8904);
-	wm8904->pdata = i2c->dev.platform_data;
 
 	for (i = 0; i < ARRAY_SIZE(wm8904->supplies); i++)
 		wm8904->supplies[i].supply = wm8904_supply_names[i];
@@ -2272,7 +2381,7 @@ static int wm8904_i2c_probe(struct i2c_client *i2c,
 	/* Apply configuration from the platform data. */
 	if (wm8904->pdata) {
 		for (i = 0; i < WM8904_GPIO_REGS; i++) {
-			if (!wm8904->pdata->gpio_cfg[i])
+			if (wm8904->pdata->gpio_cfg[i] == 0xffff)
 				continue;
 
 			regmap_update_bits(wm8904->regmap,
-- 
2.25.1

