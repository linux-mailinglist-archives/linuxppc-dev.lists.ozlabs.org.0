Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E5E832FEE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 21:42:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HYT4lP38;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGs4L2f3pz3cN9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 07:42:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HYT4lP38;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::628; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0628.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGs1c0nC0z2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 07:40:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUZVfaa25InGwLHMFn5eAiYNPNMuEM2NPHJu8MzXydMsWJ8fPl+s06V6DzF1o3G/J0RRlZr9TOg9+jmaoooCEcig8dOgakNH1yRQ+faLjN4fOYdQjNxqUg+foIwSfB1udG/6BtwJkvjTJS66zF5E+SjwtL/bD7Pc9fNgS4rviSbOh/KMN7eMYypvAz1ZbagOndeSQ2CK462QCLkFYUIR4FVtNfJQNWRyUW5r896z8zp910BJrTVZCRzdmoZR0GK6iZRg+1LHownE07oCeThpEiQREivTh4MIBo5uppIjIHDPscjqCJ2Rt6cZYLaRg5G7T5OygVVkFTOugrGkFbPenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZsaPThvML6AL8ircfax/VheS2Kdk84k0nTMRlTK42s=;
 b=LBZlVah7UG2NwVERW5VEHBD3Y/IDkZRUPJX7pQpWIHyYHO5PtiIap7nCYF1WII2YiwK+1/+XWCKvpTPHjHWssLMmBM9/Ns2WXmzMi87NP5DPTUN2BKYgNKzhGuGmbGomb5+9uTi2rHqK+V27ezF9J1+VPCz3I0O+bqqomMmqQJjFy/RMr31Rw5PT8+lYfSVaqSLQwNCIvXYzerOYIV50gT0/mBqryRXxKFCO/0HL5yg87ysa5OLmweJNozVVlIx32X30szpfX/yl0hRlARrYhix47m4rnDQFZpYVsqcL+scNJpcPsN4qSCxvW878+yT6Vunoh64Le/kcSFgrWqaCtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZsaPThvML6AL8ircfax/VheS2Kdk84k0nTMRlTK42s=;
 b=HYT4lP38xIdT9+dQBrDiHC7H+RcwH6IrJ0AKi6fwbkQMRrjX/ulxKEeNSh7hHv8LzwiQzD6ViFPZ1df73jmYrN9n/tOr/WSjGXLBAZTZWqi2N3yVbmphNUaKRemXpvPFn1tpZJJfNnYTnsRorFeaJytqB6h1Fu5aarUYuqF/sZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6990.eurprd04.prod.outlook.com (2603:10a6:803:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 20:39:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9%4]) with mapi id 15.20.7202.027; Fri, 19 Jan 2024
 20:39:51 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Li Yang <leoyang.li@nxp.com>,
	Ran Wang <ran.wang_1@nxp.com>,
	Zhao Chenhui <chenhui.zhao@freescale.com>,
	David Heidelberg <david@ixit.cz>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/4] powerpc: dts: mpc85xx: remove "simple-bus" compatible from ifc node
Date: Fri, 19 Jan 2024 15:38:56 -0500
Message-Id: <20240119203911.3143928-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119203911.3143928-1-Frank.Li@nxp.com>
References: <20240119203911.3143928-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0234.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 354bc7b4-0642-4209-21ec-08dc192ec939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	C/eh/Ii1++nRviuYSddSL5U/7bcZbU4ZCNYoplx9lpWJfAvvP8+Av4WQhcBuXszkXVKJNp894VQz2IwqRVQUKlYDMktWQx/ioaLHO2ELF1bNgoWadKWWMbE+B71zBNoWuv/wUcop3FcJ5joQXU2WDm6qMA3j0hNGAcFr5+pLFMYQtBp2wkiHJpEy/kxSfPruANN9XAxlxKCcG/OPWDyrzlkyGWT/ObnyaT6vySY5DPDK5JALlfe0LI998GJuzeYfh9B78qiuaw/xelTethh2BrELpbeOc3F5vHtJz737NCrJk5SCP5bNHJQTFijrwo8IGLkay9tFZSLflceCQLwVr3dcTnQ/G2r/gr8sHTGZGjSuowQNOvMNKvUn54VOiS9Vnz5ihH9vrzqRESPKGZSMsYpOYG0RKUq9XaU/aE9BF/CaD4CdyIfkT1RO77MqBGEI3+gt3XgXySEPCryoSN7ftEe2F0ly6WNhnBrcdi0kaOSrn9IU9SievrCuQVhunwsKItW30YmxDZw4DbJOhTC51AC1OGeAzG/VwOgH2Bo70hPQaNGeCPj2zS1BNzLVNqKOqZ4kKA2TVpULT/7SwjDsXmAgsHmgcBPa3p5IOJjClhzMw8UVviSHD/bONH1J5ZNN7Gca4G1BGbcab1sEgtl9MA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(346002)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(2616005)(6512007)(6506007)(26005)(1076003)(52116002)(5660300002)(41300700001)(7416002)(83380400001)(2906002)(4326008)(6486002)(478600001)(316002)(66556008)(66476007)(110136005)(66946007)(921011)(8676002)(8936002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?t1APx5pw1KUOUhcTPuVWLlxPLWT2pDp8XbAfk1JCTTpbFPk3aw8vDfgGEMWA?=
 =?us-ascii?Q?AqMZX4ME0vlWQ1wPHwoZQdXN9goPbmWeSq8qTgQvsCGjBqW8IX0n/nVPCZQ8?=
 =?us-ascii?Q?00dDcaJs8U4tZgaMJULCah7xbuQnmHjcK1RhSa50i02OIPzZJisNx4NmKTlD?=
 =?us-ascii?Q?O1nNu/TdWalM9esPz8GvYn3g1iYLRSlodKeFTtbvvFbUfbOcttB7MHjANF7G?=
 =?us-ascii?Q?tx631wlx6oISk9hp1LdmBwlCAJWbR0KO9mMzqs2fRWpE80DLWK3V5OSi46uq?=
 =?us-ascii?Q?HaCTBbs32yeOsfKRYdfKsrXzwry8C4aa77psFUs+mNRyfTaSy395HftFo4u6?=
 =?us-ascii?Q?uWnJIunRun2zkfIN3fAcryqpGCVQhBs3AxZgCD/FBoIe38vPPe6AoffCZ1D7?=
 =?us-ascii?Q?OKV0Z9IK9OBlNrMSkJmU3Q50dg4tXeSZXvJSfGUdwlVS1QWZ47u4P5mnOAZy?=
 =?us-ascii?Q?EXWkMIdUW/ws2naaL515dUvfv3HbAyMsHQgURTpxfPhokCe5FBxWXJp69xuB?=
 =?us-ascii?Q?cij/YVLOXPXA0TLYpmqgQgH5JwXQZpJWg6gfRw0paVsaUK+42uN18RDasrYX?=
 =?us-ascii?Q?CrZJDbnXlFY5TkYWk0tCREXv2/Pob7FMD0SSHNv3nqE2+LZ/3BV38W7YUd4f?=
 =?us-ascii?Q?7T7DXN1M1EgQtfXKV4keUWElf9QeYrJYDDtRN6HXtPuG2sULOWaD1TL+srJ4?=
 =?us-ascii?Q?gyJhFT+LjyCqIyYdSnxGCQnAyOXMjuufBgv0Q6qf1MD7Vu0sU0LOnJgDwcQW?=
 =?us-ascii?Q?u7Sbu+gRcV2mo20Sw5RxXqXwT8w7gYHl7ANiF2djMa9D7Up+CHpOV8BefQcF?=
 =?us-ascii?Q?Mv1kBzlbIXfpWFi/vLBU8sETE8uGQcQPTVRMpF/fv7BzLH1TjUh6mjYzOKuX?=
 =?us-ascii?Q?2Nk1VWe3ZatmwtEblM6ZjCs9Er44flsTD9mwOWkda/AYd2N7G12zA673S5zF?=
 =?us-ascii?Q?ZZDGb7QuTLO8WhCPmMIqJ9vW3hqWyEbfdixEStrz8FFnEiq8b8qAJMqlJ2vv?=
 =?us-ascii?Q?y9GVarJlya0cA5dpFGVM3xM2sQvIcGBa/FZJGJ7gYnaQklt9QB3Ngk+RkufV?=
 =?us-ascii?Q?aHFrVMLarExA3XuwaqxpzxBrpdOAGZWM9bs0ZVudT48FJ6IuxDh9RbwfoCae?=
 =?us-ascii?Q?MAZsndxu1j8bu4xz3Rb9lP5YEx9imkT3ta9g89bSVqqCgeMjDtcY1BLLPwei?=
 =?us-ascii?Q?LxbSLVezFd5mSCRpy15PykMlGwB41bCIG9QKg3dIaQd9uUdEt0rD2Y+lA47h?=
 =?us-ascii?Q?551ns0vJV6xkdZukxLicUGH01gSEVwLBcMu8yL/dY2RHi4S2+RIAnb7Qh0Wn?=
 =?us-ascii?Q?MYWVh2IV92EO+XcqtSfTbrot0mfTjwlRdOIfi17dLkj6YpKGE0yv2V05JJmi?=
 =?us-ascii?Q?5KJXcKR6hwxt50z0G7MoBaYiSofodYEYtE5qgN2PeohxYhLWsCVsGBYldRKL?=
 =?us-ascii?Q?ynjtgVPOUtvp0OrUvnR+Milp9VXXDsbyLMJ/Tzo8474VBLpFEJr/luRtfX3c?=
 =?us-ascii?Q?hZgIwbGWJXv+pL+04aQhRxfBHbvbMJCwQADxkP/rrQ87rTUCWztZsIJsVW5S?=
 =?us-ascii?Q?3UyJOaO6IuJoAy8sMJHMFHhguhUXDdGHWtJQDr5x?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354bc7b4-0642-4209-21ec-08dc192ec939
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 20:39:51.7111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NnCzesehh4uk2TbOodAvvfgCJ0vRWZXG+oa8iR9zlc+FwEiD2V9mFHpGxBbpAX/NMeyZ3ApxzzOdmmpcUzVmw==
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

From: Li Yang <leoyang.li@nxp.com>

Update dts to match dts binding document.

Signed-off-by: Li Yang <leoyang.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/powerpc/boot/dts/fsl/b4si-post.dtsi      | 2 +-
 arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/c293si-post.dtsi    | 2 +-
 arch/powerpc/boot/dts/fsl/p1010si-post.dtsi   | 2 +-
 arch/powerpc/boot/dts/fsl/t1023si-post.dtsi   | 2 +-
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi   | 2 +-
 arch/powerpc/boot/dts/fsl/t2081si-post.dtsi   | 2 +-
 arch/powerpc/boot/dts/fsl/t4240si-post.dtsi   | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/b4si-post.dtsi b/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
index 4f044b41a776b..fb3200b006ade 100644
--- a/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/b4si-post.dtsi
@@ -50,7 +50,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <25 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi b/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi
index 2a677fd323ebe..5c53cee8755f9 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi
@@ -35,7 +35,7 @@
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <16 2 0 0 20 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi b/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
index b8e0edd1ac69a..4da451e000d90 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
@@ -35,7 +35,7 @@
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	/* FIXME: Test whether interrupts are split */
 	interrupts = <16 2 0 0 20 2 0 0>;
 };
diff --git a/arch/powerpc/boot/dts/fsl/c293si-post.dtsi b/arch/powerpc/boot/dts/fsl/c293si-post.dtsi
index f208fb8f64b37..2d443d5192749 100644
--- a/arch/powerpc/boot/dts/fsl/c293si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/c293si-post.dtsi
@@ -35,7 +35,7 @@
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <19 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi b/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
index b540e58ff79e7..2d2550729dcc2 100644
--- a/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010si-post.dtsi
@@ -35,7 +35,7 @@
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <16 2 0 0 19 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
index aa5152ca81201..8ef0c020206b9 100644
--- a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
@@ -52,7 +52,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <25 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
index 7767886232040..c9542b73bd7f1 100644
--- a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
@@ -52,7 +52,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <25 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
index 27714dc2f04a5..6bb95878d39d3 100644
--- a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
@@ -50,7 +50,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <25 2 0 0>;
 };
 
diff --git a/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi b/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
index fcac73486d487..65f3e17c0d413 100644
--- a/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t4240si-post.dtsi
@@ -50,7 +50,7 @@ &qman_pfdr {
 &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
-	compatible = "fsl,ifc", "simple-bus";
+	compatible = "fsl,ifc";
 	interrupts = <25 2 0 0>;
 };
 
-- 
2.34.1

