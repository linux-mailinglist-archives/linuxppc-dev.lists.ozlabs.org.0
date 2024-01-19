Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4797B832FE6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 21:40:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ijdbeDA4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGs2V1YnHz3cPR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 07:40:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ijdbeDA4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::628; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0628.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGs1Z0RDqz2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 07:39:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5UqKrgoSOk3CytrVVJz4JF2zgEfgxJPUlTQbnBIHtzpZC5R6m3lIAdWRJfqBUd+KBnu3ISI7LmkP/tLBqsH2Mw/hqxwE7XS9NUjKkVYxFvzmFPy+PWoykkT2IkT+3ZLtcxoKGx6V7eIKQOjsZz0PmCRwZLteLbhZbV7621D266ljxW2mAq/UoGHUrqfP1//iOUcgNNofjZkost8tHi5Y/W+iqYwxYF0xmRPLaSvuOvZ7sJCZNCXjSdp2qx97iXgQcasEuoZZIbrRI+bhK9oHJyhtWrAvWQ0m18SemrCyWCoMRoC6x2ydg6olFAoS+OVU5n7fjVYEzW2Ih0A1O2tKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8R5CzkSlQLdefDpVhN8H22X2D9SrSyWakrAIjmeD60=;
 b=W0ZlY8BB/kpkwefNZwllsLzN0gZ1X59MjDyeNr15n8yta+13xhCNVncZg4VI1huYKDlfg5YYUAinpoR4Ppu+hH/P6KLXGZdgZGs7OI0m8pZHw9wUwRWuU8Uka0b76+pfRphGF3L35M19IhJc1C11F0E70RtlJ/kQ+qdjRCo48OlwmPGQ1OCS4dmCxqzXhaC0hN90we2X7Wgh8i5eW2NFthzigKYwreMhHrWbk8xNYxssf3D37e/yx0gY4Hc8+8JCxpaJG9q3VPrumypLPfoTU+yRgF0AI/S+S1x3lFCgy8qTXWUcP9epe6C2Tlz9bAhxnpHwYVONFJ5MfOdNCO30Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8R5CzkSlQLdefDpVhN8H22X2D9SrSyWakrAIjmeD60=;
 b=ijdbeDA44KVhxTqEstKmpASiEBrh4TulPuQC5oBGUunBMXEUKGRDYB/kn33do1RQYb1RRy9eanmEIbvY5BA59ME9dVzwnkQZRV0cBS4xCnhZZgQJy699d7gaAcDGKJyBPEZpyWjXCG6cqNs8ecbN1Hib/FMp2P71MlSE3ZEvOPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6990.eurprd04.prod.outlook.com (2603:10a6:803:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 20:39:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9%4]) with mapi id 15.20.7202.027; Fri, 19 Jan 2024
 20:39:35 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Ran Wang <ran.wang_1@nxp.com>,
	Zhao Chenhui <chenhui.zhao@freescale.com>,
	Li Yang <leoyang.li@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/4] powerpc: dts: add power management nodes to FSL chips
Date: Fri, 19 Jan 2024 15:38:54 -0500
Message-Id: <20240119203911.3143928-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0234.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc88c99-7159-47ad-7e74-08dc192ebf19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	got6kiY1cAKXgHEzHI72uLp7T5y+UCjfbe3vk85DTDdwuSYwzs3XLAOOmIZG4QhAnCIQXrMht4/eSMabO2girHCg8iJ0YCr7SMZ8hWMOf/B8afSf0nboA2o4ukC0mKQj+1KNFdm/D0fUnBpqrDhhyaNLNAdYcVhDWjzgIeb2Tc/YqU1X6bkvDQMQpPniaBdz8vbTpxivuq5uqSS2scTx+CIk2G6QwHJPMBlp8+j/Sj4SJX+aQNIvYyv8kh389v0u51DeM93KWHR9q6/ZAGMD+4tsY7ktOl5SGmPZpcGQda71+zVKYgULBHtwKzGGyqHMK5X4M973E31bFIwMC92BhTDQvAqo5KG9cDIYHOrx76HcYa2Jt/u8t09qzbDs0t+62GzBxJF+CZHb9KTEs0FCmaUz0UKXYb27oi566S8Q/+jpJd2zhWBjv8uG7mj8u8nApJQmZaMlKre6kgKp7axoF67doa/wAzRKE0rv0tGZAavgP+we2sDgE9mIQvpM6fauzVNLSJdIaYaD9ZOdv9GpyNKm6TDOV5ygyCzM3SZ3RmcV0Qs2lFcHXBiosJkui1uUhRhlB+85V5n4FRPWZaqwlbOzIohaQl0OfEOJIqt8vxpV3vi9WBy7VjJr/B8Qhxo/sKkAHc0Av3yFL5Z328pDNA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(346002)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6666004)(2616005)(6512007)(6506007)(26005)(1076003)(52116002)(5660300002)(41300700001)(7416002)(83380400001)(2906002)(4326008)(6486002)(478600001)(316002)(66556008)(66476007)(110136005)(66946007)(921011)(8676002)(8936002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?oxsv7Y6Tlb/mFEmaUKr/uVUBvasf8uOwKvL7i3zj7ZPqxpSKL5xYZXUB04Nm?=
 =?us-ascii?Q?XgpZBt+PH5D6CaWZrsfBJUlMBeZNFY2HJZu4198CjnToFuY9qlD0//Qsi2jm?=
 =?us-ascii?Q?mx1f+Hai11DA95t+pozqfhbUdp+ckHOQwt95zNUDZEQ4NoXQLABrYEhqDPWy?=
 =?us-ascii?Q?NrpNyfmajP+NNPTe7g7kvJJrSEJLGlHEpRklsZVI6R9+NUaQbMQQMrFHJ7DZ?=
 =?us-ascii?Q?8Nf2Q2eMixsIYu5J43g/O3vTSZOWT0xBJVDlGDFhIBh3Vpr7SCJk01ySnLlR?=
 =?us-ascii?Q?Y81RVsbGn3bg1xynsupdyrZASa7hysVJ8evzCrmZqw52L4YkDNH33j2O98qo?=
 =?us-ascii?Q?Ccper8Ug+eQcYpuAkdtys1MQwaTndHGGzEhnyODLT2do5dtH+iYCJJE4fVaX?=
 =?us-ascii?Q?a94uhMw4VR4mJk4r9ljE2XKABIA6UJ11deA1OY8ZVYpSQskJcO9tu3jtRGoE?=
 =?us-ascii?Q?pKkAItgLd7TvhPF/G/yl3hhkCfMSxPw9uC+JnXCqIrPdMWsCzQUoXrfNwtQk?=
 =?us-ascii?Q?7NDFupojBjzJ1mEZ4QO13xRUk8Z1fpbvtVEIMEYY+ij3GtO/Htag0LpPx1cI?=
 =?us-ascii?Q?+mzufb9kqkZLpGet28Pyt5Cne7lKgYpEi9ywhmn1wLNnaWApBXu5EKJtrEiJ?=
 =?us-ascii?Q?jnp041wf6YgsKevqjGkyCrylNPvUm4gWCFsYhCIjP0xfoJwC6MUpyFshh64p?=
 =?us-ascii?Q?3XNZi2yVaJ6lNalaJnwiutD18IJMBxwkP6wZUiSAKdoBRkLSxmEgm78G05Jd?=
 =?us-ascii?Q?tjuflUCjQrVMbW6WEXNwBrYWdnKrzlbYIteu26LNx5Y3p7go31uYnv5vGAyQ?=
 =?us-ascii?Q?eO96sAga31tdDRbAy4bs03PO5Z2+t1RFEebehLuJ9cSN39CQE8PbpL/2ge5D?=
 =?us-ascii?Q?s7j0CadMQZSi6/TGOdcUbAfoJ+tPP/5PPISHJFOGV803OXJd+oANF6SsVCa8?=
 =?us-ascii?Q?L+t9aSZQEQwsRZaiF2zAa4YWxwAERf3/AZti5iUzOiw77NCfrXaakpaxIz7q?=
 =?us-ascii?Q?6SE3anoNl6iRjkFG3Fh7rlartV2d3OVhCWc41KlK/5BDQLvwAqkXxkKOGYfr?=
 =?us-ascii?Q?6DusEzulDkLUJ2QiYQHTQvj1eF85qNmhjSUqW6xfNXhj8VhdUsUBsu9RCv1t?=
 =?us-ascii?Q?sq2rNvm3gmkTkwBM+tctZ8Haq9V8UszV+ADJzCEUjYMfgbAN76gnv06fe3ED?=
 =?us-ascii?Q?dB+6p24AArU7ZbORXfTcNuE/Wjv2Ut1+TKKQ9Alm4tQT0j4hmIk2s1xd+NvB?=
 =?us-ascii?Q?RiDJbL//CAKYC979xdGSvgDHdK8QwT/nvl5XUEZvioz8UbP+AhQw+YVJFwRn?=
 =?us-ascii?Q?Duyy93J5HRIyCp3OM+LGLErhN97oZD97dZOtYSeAOlfRGdWSBNTPZYPae0la?=
 =?us-ascii?Q?MWtB0Wpd4/OPwtvrJpH0jhVTQ/7ALfwM6OZF74wK2wROE0t0wOxz03Qd7AJj?=
 =?us-ascii?Q?V/2n0kCbU9SMf/+YwWFerp0OnTgfmClgI7X8WL3vsAY370UDDSSMDUeTMB9S?=
 =?us-ascii?Q?GUWdZNIpHlgtNvtEoYbmHTd4Rx4Ctqm5BCADWlQIkqf3vw5KCA+hme8BbAaF?=
 =?us-ascii?Q?2EzREQHDX2mMM9ZZQ4stg//YcdWcVJ4cSbwR++ca?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc88c99-7159-47ad-7e74-08dc192ebf19
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 20:39:34.9006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qI99F5A8G776ZbuvcBHAMMI8U0ST5dsAHR7zWuwBVw9qru+VQBZXk5X30QPNwPlGAgZVzZxcZuqKKFZxgqMcpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6990
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
Cc: imx@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ran Wang <ran.wang_1@nxp.com>

Enable Power Management feature on device tree, including MPC8536,
MPC8544, MPC8548, MPC8572, P1010, P1020, P1021, P1022, P2020, P2041,
P3041, T104X, T1024.

Signed-off-by: Zhao Chenhui <chenhui.zhao@freescale.com>
Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi | 14 ++++++++++++--
 arch/powerpc/boot/dts/fsl/mpc8544si-post.dtsi |  2 ++
 arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi |  2 ++
 arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi |  2 ++
 arch/powerpc/boot/dts/fsl/p1010si-post.dtsi   | 14 ++++++++++++++
 arch/powerpc/boot/dts/fsl/p1020si-post.dtsi   |  5 +++++
 arch/powerpc/boot/dts/fsl/p1021si-post.dtsi   |  5 +++++
 arch/powerpc/boot/dts/fsl/p1022si-post.dtsi   |  7 +++++--
 arch/powerpc/boot/dts/fsl/p2020si-post.dtsi   | 17 +++++++++++++----
 arch/powerpc/boot/dts/fsl/pq3-power.dtsi      | 19 +++++++++++++++++++
 arch/powerpc/boot/dts/fsl/t1024rdb.dts        |  2 +-
 arch/powerpc/boot/dts/fsl/t1040rdb.dts        |  2 +-
 arch/powerpc/boot/dts/fsl/t1042rdb.dts        |  2 +-
 arch/powerpc/boot/dts/fsl/t1042rdb_pi.dts     |  2 +-
 14 files changed, 83 insertions(+), 12 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/fsl/pq3-power.dtsi

diff --git a/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi b/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi
index 41935709ebe87..fba40a1bccc04 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8536si-post.dtsi
@@ -199,6 +199,10 @@ L2: l2-cache-controller@20000 {
 
 /include/ "pq3-dma-0.dtsi"
 /include/ "pq3-etsec1-0.dtsi"
+	enet0: ethernet@24000 {
+		fsl,wake-on-filer;
+		fsl,pmc-handle = <&etsec1_clk>;
+	};
 /include/ "pq3-etsec1-timer-0.dtsi"
 
 	usb@22000 {
@@ -222,9 +226,10 @@ ptp_clock@24e00 {
 	};
 
 /include/ "pq3-etsec1-2.dtsi"
-
-	ethernet@26000 {
+	enet2: ethernet@26000 {
 		cell-index = <1>;
+		fsl,wake-on-filer;
+		fsl,pmc-handle = <&etsec3_clk>;
 	};
 
 	usb@2b000 {
@@ -249,4 +254,9 @@ global-utilities@e0000 {
 		reg = <0xe0000 0x1000>;
 		fsl,has-rstcr;
 	};
+
+/include/ "pq3-power.dtsi"
+	power@e0070 {
+		compatible = "fsl,mpc8536-pmc", "fsl,mpc8548-pmc";
+	};
 };
diff --git a/arch/powerpc/boot/dts/fsl/mpc8544si-post.dtsi b/arch/powerpc/boot/dts/fsl/mpc8544si-post.dtsi
index b68eb119faef3..ea7416af7ee3e 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8544si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8544si-post.dtsi
@@ -188,4 +188,6 @@ global-utilities@e0000 {
 		reg = <0xe0000 0x1000>;
 		fsl,has-rstcr;
 	};
+
+/include/ "pq3-power.dtsi"
 };
diff --git a/arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi b/arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi
index 579d76cb8e329..dddb7374508d6 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi
@@ -156,4 +156,6 @@ global-utilities@e0000 {
 		reg = <0xe0000 0x1000>;
 		fsl,has-rstcr;
 	};
+
+/include/ "pq3-power.dtsi"
 };
diff --git a/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi b/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi
index 49294cf36b4e6..40a6cff770327 100644
--- a/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/mpc8572si-post.dtsi
@@ -193,4 +193,6 @@ global-utilities@e0000 {
 		reg = <0xe0000 0x1000>;
 		fsl,has-rstcr;
 	};
+
+/include/ "pq3-power.dtsi"
 };
diff --git a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
index ccda0a91abf00..b540e58ff79e7 100644
--- a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
@@ -183,9 +183,23 @@ sdhc@2e000 {
 /include/ "pq3-etsec2-1.dtsi"
 /include/ "pq3-etsec2-2.dtsi"
 
+	enet0: ethernet@b0000 {
+		fsl,pmc-handle = <&etsec1_clk>;
+	};
+
+	enet1: ethernet@b1000 {
+		fsl,pmc-handle = <&etsec2_clk>;
+	};
+
+	enet2: ethernet@b2000 {
+		fsl,pmc-handle = <&etsec3_clk>;
+	};
+
 	global-utilities@e0000 {
 		compatible = "fsl,p1010-guts";
 		reg = <0xe0000 0x1000>;
 		fsl,has-rstcr;
 	};
+
+/include/ "pq3-power.dtsi"
 };
diff --git a/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi
index 642dc3a83d0e3..cc4c7461003bb 100644
--- a/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1020si-post.dtsi
@@ -163,14 +163,17 @@ sdhc@2e000 {
 
 /include/ "pq3-etsec2-0.dtsi"
 	enet0: enet0_grp2: ethernet@b0000 {
+		fsl,pmc-handle = <&etsec1_clk>;
 	};
 
 /include/ "pq3-etsec2-1.dtsi"
 	enet1: enet1_grp2: ethernet@b1000 {
+		fsl,pmc-handle = <&etsec2_clk>;
 	};
 
 /include/ "pq3-etsec2-2.dtsi"
 	enet2: enet2_grp2: ethernet@b2000 {
+		fsl,pmc-handle = <&etsec3_clk>;
 	};
 
 	global-utilities@e0000 {
@@ -178,6 +181,8 @@ global-utilities@e0000 {
 		reg = <0xe0000 0x1000>;
 		fsl,has-rstcr;
 	};
+
+/include/ "pq3-power.dtsi"
 };
 
 /include/ "pq3-etsec2-grp2-0.dtsi"
diff --git a/arch/powerpc/boot/dts/fsl/p1021si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1021si-post.dtsi
index 407cb5fd0f5ba..378195db9fca5 100644
--- a/arch/powerpc/boot/dts/fsl/p1021si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1021si-post.dtsi
@@ -159,14 +159,17 @@ sdhc@2e000 {
 
 /include/ "pq3-etsec2-0.dtsi"
 	enet0: enet0_grp2: ethernet@b0000 {
+		fsl,pmc-handle = <&etsec1_clk>;
 	};
 
 /include/ "pq3-etsec2-1.dtsi"
 	enet1: enet1_grp2: ethernet@b1000 {
+		fsl,pmc-handle = <&etsec2_clk>;
 	};
 
 /include/ "pq3-etsec2-2.dtsi"
 	enet2: enet2_grp2: ethernet@b2000 {
+		fsl,pmc-handle = <&etsec3_clk>;
 	};
 
 	global-utilities@e0000 {
@@ -174,6 +177,8 @@ global-utilities@e0000 {
 		reg = <0xe0000 0x1000>;
 		fsl,has-rstcr;
 	};
+
+/include/ "pq3-power.dtsi"
 };
 
 &qe {
diff --git a/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi
index 093e4e3ed3689..6ac21e81344ad 100644
--- a/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1022si-post.dtsi
@@ -225,11 +225,13 @@ sdhc@2e000 {
 /include/ "pq3-etsec2-0.dtsi"
 	enet0: enet0_grp2: ethernet@b0000 {
 		fsl,wake-on-filer;
+		fsl,pmc-handle = <&etsec1_clk>;
 	};
 
 /include/ "pq3-etsec2-1.dtsi"
 	enet1: enet1_grp2: ethernet@b1000 {
 		fsl,wake-on-filer;
+		fsl,pmc-handle = <&etsec2_clk>;
 	};
 
 	global-utilities@e0000 {
@@ -238,9 +240,10 @@ global-utilities@e0000 {
 		fsl,has-rstcr;
 	};
 
+/include/ "pq3-power.dtsi"
 	power@e0070 {
-		compatible = "fsl,mpc8536-pmc", "fsl,mpc8548-pmc";
-		reg = <0xe0070 0x20>;
+		compatible = "fsl,p1022-pmc", "fsl,mpc8536-pmc",
+				"fsl,mpc8548-pmc";
 	};
 
 };
diff --git a/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi b/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
index 81b9ab2119be6..d410082d21c0f 100644
--- a/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p2020si-post.dtsi
@@ -178,6 +178,10 @@ usb@22000 {
 		compatible = "fsl-usb2-dr-v1.6", "fsl-usb2-dr";
 	};
 /include/ "pq3-etsec1-0.dtsi"
+	enet0: ethernet@24000 {
+		fsl,pmc-handle = <&etsec1_clk>;
+
+	};
 /include/ "pq3-etsec1-timer-0.dtsi"
 
 	ptp_clock@24e00 {
@@ -186,7 +190,15 @@ ptp_clock@24e00 {
 
 
 /include/ "pq3-etsec1-1.dtsi"
+	enet1: ethernet@25000 {
+		fsl,pmc-handle = <&etsec2_clk>;
+	};
+
 /include/ "pq3-etsec1-2.dtsi"
+	enet2: ethernet@26000 {
+		fsl,pmc-handle = <&etsec3_clk>;
+	};
+
 /include/ "pq3-esdhc-0.dtsi"
 	sdhc@2e000 {
 		compatible = "fsl,p2020-esdhc", "fsl,esdhc";
@@ -202,8 +214,5 @@ global-utilities@e0000 {
 		fsl,has-rstcr;
 	};
 
-	pmc: power@e0070 {
-		compatible = "fsl,mpc8548-pmc";
-		reg = <0xe0070 0x20>;
-	};
+/include/ "pq3-power.dtsi"
 };
diff --git a/arch/powerpc/boot/dts/fsl/pq3-power.dtsi b/arch/powerpc/boot/dts/fsl/pq3-power.dtsi
new file mode 100644
index 0000000000000..6af12401004db
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/pq3-power.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+)
+/*
+ * Copyright 2024 NXP
+ */
+
+power@e0070 {
+	compatible = "fsl,mpc8548-pmc";
+	reg = <0xe0070 0x20>;
+
+	etsec1_clk: soc-clk@24 {
+		fsl,pmcdr-mask = <0x00000080>;
+	};
+	etsec2_clk: soc-clk@25 {
+		fsl,pmcdr-mask = <0x00000040>;
+	};
+	etsec3_clk: soc-clk@26 {
+		fsl,pmcdr-mask = <0x00000020>;
+	};
+};
diff --git a/arch/powerpc/boot/dts/fsl/t1024rdb.dts b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
index 270aaf631f2ab..7d003e07a9fb2 100644
--- a/arch/powerpc/boot/dts/fsl/t1024rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1024rdb.dts
@@ -91,7 +91,7 @@ nand@1,0 {
 		board-control@2,0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-			compatible = "fsl,t1024-cpld";
+			compatible = "fsl,t1024-cpld", "fsl,deepsleep-cpld";
 			reg = <3 0 0x300>;
 			ranges = <0 3 0 0x300>;
 			bank-width = <1>;
diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb.dts b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
index dd3aab81e9dea..4347924e9aa7e 100644
--- a/arch/powerpc/boot/dts/fsl/t1040rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
@@ -104,7 +104,7 @@ phy_qsgmii_7: ethernet-phy@b {
 
 	ifc: localbus@ffe124000 {
 		cpld@3,0 {
-			compatible = "fsl,t1040rdb-cpld";
+			compatible = "fsl,t104xrdb-cpld", "fsl,deepsleep-cpld";
 		};
 	};
 };
diff --git a/arch/powerpc/boot/dts/fsl/t1042rdb.dts b/arch/powerpc/boot/dts/fsl/t1042rdb.dts
index 3ebb712224cbe..099764322b33c 100644
--- a/arch/powerpc/boot/dts/fsl/t1042rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1042rdb.dts
@@ -68,7 +68,7 @@ phy_sgmii_2: ethernet-phy@3 {
 
 	ifc: localbus@ffe124000 {
 		cpld@3,0 {
-			compatible = "fsl,t1042rdb-cpld";
+			compatible = "fsl,t104xrdb-cpld", "fsl,deepsleep-cpld";
 		};
 	};
 };
diff --git a/arch/powerpc/boot/dts/fsl/t1042rdb_pi.dts b/arch/powerpc/boot/dts/fsl/t1042rdb_pi.dts
index 8ec3ff45e6fc7..b10cab1a347bf 100644
--- a/arch/powerpc/boot/dts/fsl/t1042rdb_pi.dts
+++ b/arch/powerpc/boot/dts/fsl/t1042rdb_pi.dts
@@ -41,7 +41,7 @@ / {
 
 	ifc: localbus@ffe124000 {
 		cpld@3,0 {
-			compatible = "fsl,t1042rdb_pi-cpld";
+			compatible = "fsl,t104xrdb-cpld", "fsl,deepsleep-cpld";
 		};
 	};
 
-- 
2.34.1

