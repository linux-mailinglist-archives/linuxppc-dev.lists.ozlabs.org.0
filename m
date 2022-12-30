Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E32A659390
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 01:07:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NjlvF1L9mz3fDJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 11:07:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=t7CYxz85;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.88; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=t7CYxz85;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Njln75g95z3bbh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 11:02:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtX51ir24lPQBXyl7OvqMGvd7VgwcxTg6unDleovfWbWpFRqOCnOe0sDn4XCbsyKgYdfADfxR+Ljmsr01M1XC0QwloihNd+gsPa8ZzIIiJ9aoAkZso2eYE6MwO0cB3jxmOFJw2BBS//CXzbNK41GWNADZed+FjwYMrh3FwTJbcR3b0+/slTgULc/Kqpjyfu5BoCnl1p9KvNbQTtP6kEeFlyCBfQLqhPtrdy0ayY0kvxl6+a7MmnOuR5sWWXR/X+vlcSBWoO3xciF+PjPx0k1uo7yGIA24bxi0FfRMnYz3s85oX6iMtsAN8hVHbmzkmdXQLnYt27UkZew/vZMcIYqkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgRAFWiZkZEEiOK04PA4RWknYHGg2queJARxsGy6XrM=;
 b=jQjM/L4UrgdVGqYpRCqGDLPFLz2t2xCwf3U4pQTOc75DZA1C5UHG1xI55fG6g79PQxCuiErHMnuSNcUOYeUz1cCq41+sn6vL+wix4b57dg+RQBZ1R9NN204cjjCrIoxOa4F1Ukp0qepIceLED/UkqxLL1N1Uz8Yr9mmlF4krHKJWKdDCp8k8hPJOxJ2Ld2xvD+R1B7jvRW6lYTfZqSMist2Fuzfdokf7pnOpMw4uqhObNg8sJpP+s0abTagHArV7IkRJvHCer6fpRQjc4YPZ6X/r6qQUVSPJRimJxuEq5gAwfusGTbqo4kXYnsLtn0GPchgNecSp0PCcl4xMRYFWUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgRAFWiZkZEEiOK04PA4RWknYHGg2queJARxsGy6XrM=;
 b=t7CYxz85U4fgGQdfZGNiyXSOB82ABzvsRJZRRJIWk9ewJBpT+kPYrssLCHuMKmnVpnXiICSh5ZPjTRyGH/K6DK0fz1tbjqdyBhJgZMvntjUX1ix78XS3QkjGCtsq819gtweiP6WGa5WZgavAfUtM+N2AylMf/VNguGXAVy7Z7eAZge+mHqcleudxxos+6WBGG/2h5972xniNte3fs0ksyzwEeIHWAVSx/Xiqp1AAqpTMcFxY72pHRkuwls63Za/QkJtTmXlXRMXO08f18zhgOrQ9mg+j6uEl7CF2+16eWup73tFRq4+nw+EtrqvZH9I0/KNOerrCtqoYl/Y0N8QzBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9788.eurprd03.prod.outlook.com (2603:10a6:102:2ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 00:01:59 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%8]) with mapi id 15.20.5944.016; Fri, 30 Dec 2022
 00:01:59 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v9 06/10] arm64: dts: ls1046a: Add serdes bindings
Date: Thu, 29 Dec 2022 19:01:35 -0500
Message-Id: <20221230000139.2846763-7-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221230000139.2846763-1-sean.anderson@seco.com>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::29) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PAWPR03MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b4e1816-a4c1-4167-accc-08dae9f912a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kbZT1mL00W5tzMan8S+CIKP8WFxBridCA5lyhhapBJjDaFQc/ofGHgmjJI+QSGYdjsyMh75wHyN9XXVpvnL9kAAE6mlMuRhpVl48TTQQsISjjjeUNVDrPBHsukZNFHlv1yDs2yDbk/BlGl8UCP97xE0qybiio364/WfZmwtNKe+iIHX/mXl69+myHZb24jf+USfMWl4POSsQ1LgGAknMdm7mc8wu0lywwfDF7wZdEQu6VUeh8iwj7AA/Wv/UdZpGlRjWxMCC+cm+T7vUTxip7K7kJ66sB4ZHWaLFzQnT7NK4tWKljaCDYnHuRzJ09/Qrzm6KLMU7tggN7q7pR0oc9R/ZXtDSONr/deii7jbk89Ku5UHF3vnjT2MxJ7ekhjx+6kWw5Hw6bH07gh1zX9A9sUmXO5D+8Qn2IEJObp4oaIXFnEkDN6r1zErSEdZEbmcYSNtNQRJi628KUxvzcXEe98ubHOH7UyVPrLjda2Texikz4H6hfuVEqp/Exyarq+zb8mxBZCIPm2fr9EtyieOuxoCQUuBagia+np6Vw0GjVHlymoKq9sMWmgcJQdwBO/SbMS5Mgi+DWl7FQZMZxM4kczxCc9f7giVuBT093P5iTSiYrdc1GW5cjH+mAEXS1odRVrOYLhirEbboBWWv89Npz8Ad9efLV+0q8n5Uk5JeUdQ/t5rMd2M0We+4UxXI3fNu
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(376002)(136003)(39850400004)(451199015)(8936002)(83380400001)(4326008)(8676002)(66556008)(66946007)(7416002)(5660300002)(1076003)(66476007)(44832011)(38100700002)(6506007)(186003)(26005)(6512007)(2616005)(38350700002)(6666004)(316002)(86362001)(2906002)(110136005)(36756003)(54906003)(41300700001)(478600001)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?HF2j7MQl1piPCbCwCT4kabfgWuMwzPXKF+86k5fMYwQBEeBlLn3mmrEyrOCF?=
 =?us-ascii?Q?7ezoylPPd2IAm7aKHM8tLeggcP/ifhuHyPzV2FpReKrP0KbcBDu0oJzJfbSN?=
 =?us-ascii?Q?X/Gvp4gyxzG4nEZRu/bjOzZdLE8xcHuVwxyIyYqdql2WAUR/zhqn0bYlS4GV?=
 =?us-ascii?Q?oHWLytAscrLjpkFcdh+HSBYzY5TlKO/TGbhJSZLAtVDpa0kP69sUA5JMZfgW?=
 =?us-ascii?Q?6K4op0j8f78z0JoftdmQss82mkPCYGmrqE2PZKO/5pnC2bqyFA1gIQauVwj4?=
 =?us-ascii?Q?Yrwx34ElWgkp0VtR7EsuPFqYgzY43ATE8Siz/OBmbaKdu8lJrSTT7Q6xJGqf?=
 =?us-ascii?Q?KbImmT1qK8uLh0YVOBAggOd/JdggXkJwKHB9wky0vXO97O7N+9Z6m0igeO6T?=
 =?us-ascii?Q?kpZuPIXKdCU0CQqgselvZOOW4aSKzFeI8vXINqGslx2Oewvk4N5M5ljLD7A8?=
 =?us-ascii?Q?c3Za3TdrOFfthINqNDgvBLrtEX6Jpd2m5P2fVL9E/9RTVm8/YF4ZYnOutZMz?=
 =?us-ascii?Q?He1PNINR7A+DFpPsY4vE185frZLZKfy65IaJZtxeG3TeoXLJ7GQV9bZLilYo?=
 =?us-ascii?Q?sTFHEzftQx72ONKelk0/7VeZZqkYSdxChvi8AncuVeI7sFNudkT90RFV+FHi?=
 =?us-ascii?Q?MhVUqRQ3Jhwcpbiowa5QmgNoAhJQ+/Uyw439A1GDK5Zniiay676LhjkLG4RF?=
 =?us-ascii?Q?q2sKFj1+Gh2SBsBxCQg6wopMQPd6nOzO/ZkzE86RIJT5XBIYdPjXgJBmseAe?=
 =?us-ascii?Q?XYSRi6nMLB5KHOdf/h4VE4P9/mWMpRxZjS41LFWDTLsh8jSBZ7JA11jm9hU6?=
 =?us-ascii?Q?6/RMb8JXy6XKoq5HHnVVaJk1QAE/S3u9eH7lH2zhdRCX034b+P4MBobIYJGi?=
 =?us-ascii?Q?JZLO5wvbCqCtFGL0FL6mH/iEA0u/ewoM9+8KWJ+XvpifrvoXosrWLoOhrlsp?=
 =?us-ascii?Q?nYXKPbwBBMX/DTomIiHqf0RMnpttGifSk4pc3if/Ler6GL/a1Ue0fDCssP8L?=
 =?us-ascii?Q?0W+hlwVBDdKgV0s4AuWFSaaUNLOPWbxxD9B7rVfkvRWKzxddY2GeFo7IRdvb?=
 =?us-ascii?Q?dvH0fM4Q0PSTStfrJ+WVQ7kQTvECNYIxhaCvdvkqCvDcFl+Te7k9vDKqvpZ0?=
 =?us-ascii?Q?SMif19a6KkKpcRl/bwRVAHg0bS0nWRijxGK9cyMwblrsgccOhWBCIWEsCAG1?=
 =?us-ascii?Q?/s7JhRmHK7m2lfZjoRjddmk/ZLOlxKoCFsFYPxhmvI+X1sgIeM7XLVfGjwqR?=
 =?us-ascii?Q?/NMbXyo9xM0W6dyggkV7Fdjd5A+Z9KEBRWOsagzD0groWc2xFwjxBqUhEBBN?=
 =?us-ascii?Q?x1eZP7TKYDPvrRO/e+hEjtalvf61Mkz/F+VEYdsMHdwlynI93TJ62zIhp/xn?=
 =?us-ascii?Q?sH04qW4nZT0oqNDa1q3bUZCGb0Yr3t7g2Z/vxhjJ2Vdk9reRS08ba8TqBlHB?=
 =?us-ascii?Q?+8VQ9qsga+/nJvBlguU+ecA1rlaDEX2UoEitiV68ANJ3aCQynw+QGyS3+C7u?=
 =?us-ascii?Q?GqIhJN2Ij17HoRytEDbD11ZBLh2oIaACcz1ACsVJJ5QRly7aU3G0V8uxPUi7?=
 =?us-ascii?Q?eI8CeSQ+hSHY1J123xFYi5J/DLpWPivUJhIcgQyqQCcRsbCRtg/sW1wAsUHO?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4e1816-a4c1-4167-accc-08dae9f912a1
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 00:01:59.5842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlGQSWKRh5RM0RZCS2i6wJk6mpKVf1BdQXB2r+o2B4wmfG5Yy/QQGL1iPnM7nPJjo2iZzdxGHxoUZ2EZfmk8fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9788
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds bindings for the SerDes devices. They are disabled by default
to prevent any breakage on existing boards.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

(no changes since v4)

Changes in v4:
- Convert to new bindings

Changes in v3:
- Describe modes in device tree

Changes in v2:
- Use one phy cell for SerDes1, since no lanes can be grouped
- Disable SerDes by default to prevent breaking boards inadvertently.

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index a01e3cfec77f..12adccd5caae 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -424,6 +424,24 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
+		serdes1: serdes@1ea0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1ea0000 0x0 0x2000>;
+			status = "disabled";
+		};
+
+		serdes2: serdes@1eb0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1eb0000 0x0 0x2000>;
+			status = "disabled";
+		};
+
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1046a-dcfg", "syscon";
 			reg = <0x0 0x1ee0000 0x0 0x1000>;
-- 
2.35.1.1320.gc452695387.dirty

