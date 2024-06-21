Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C33912F96
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 23:31:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=auAWwwGE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5VtM5Lpkz3cfK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 07:31:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=auAWwwGE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::600; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5Vsd5wXpz3cY5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 07:31:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyLazV2YqGttYKISletp2V6OGmpGhbKu1fd7Sybtvqf6Kd510HOnJ40w+3lmbRy1GxAxfBrQ2MHggxtzd3NKOs4wIuWST5tWbCrT4zfAIUsAoQ5c4JJd4YX9jxqxBZNBaNev/ykeNjPIgAZnLik8PGGygxivyZAzq+2iflzzUIY8r07xz5c+21zzGUJQhFtIZiO3S611ELiQXwxt9OEYz/+PdjmsbvdjCadJYf9JrIB3wijDHehQIy0qhBZlH+ao8Cojq3vM6O2dh3J10RcJm2pBp7TxwwPtWC13Px1Jv0tzgoOjx/ZzuuJlWyEWYD/EuvibFRe0q3U9qkj9in9K6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1237XlY7gSN3Qy6FjcY3xDC5xcQMrSEaf1PpKXMyos=;
 b=Pgh8phI2kr74UeVEyEwhliuWhlLoesnPbHCEWYmPWbZY7JopoEmELrwACpfYgvOWcHDCOEk+NNFYRIaG93uAKg3QWpuPttgOLYiv8wKD+kZJ9Us+vm7NXlAS42JaSY8aQxyF9U9XTfHWqCYRskyeXExHPvd9MKt2pMQa6yfK66EysxqEpTMrZcPYYj6aRHrkj8/NRkuwL9pre1aL++gXY9aEmO0KQLmXht6UoFW8POLoAgAcASl3CtIbZ/WNsb4lnlXIptlPdhyExUbl7j7+rfapZn/PqiiO+3+tvlgtfQCVZ4fcBxKBYlIT6Uokoib3j1AvSue33ycEWsUEZ7n1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1237XlY7gSN3Qy6FjcY3xDC5xcQMrSEaf1PpKXMyos=;
 b=auAWwwGETqkDPEjjQNSlWv90mFYKfO3pd60m2UlKSeo2U94sC5PGWV8L/e+9uI8RxYdabpmW+yqegKJb15i6Q/U2ZxN1ne9zOWbfXNWw2SaMcujXeP08eUPw+3BLUgQmuHbsyhXu0bnafmz2OJUhLtLsPkJFXUxfwvwzR07XdjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 21:30:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 21:30:48 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/1] dt-bindings: soc: fsl: Convert q(b)man-* to yaml format
Date: Fri, 21 Jun 2024 17:30:14 -0400
Message-Id: <20240621213031.2759046-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0177.namprd05.prod.outlook.com
 (2603:10b6:a03:339::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af5a8e9-5cea-4f50-ba76-08dc92396a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230037|366013|376011|1800799021|52116011|38350700011;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?zL73QbvBC1A2YWV/GAi+CI+7osF5vpRMVWDrsl/UDFQ7oNZr2XUBHnlmKYOT?=
 =?us-ascii?Q?tNhmiGeFNkqvdLO6273QLiWwuE2GhWc5SF4xWjx/xb6utJZrUADHLokzHKci?=
 =?us-ascii?Q?L2fHoHJha8y2yEevKV6x11lPPMb5fHtjEdzsmNhndC90fwVeBr4bteeVhkC1?=
 =?us-ascii?Q?6VgUzQ/F4QW9sRXZtdGpXrNvuZsNcAgc/1vtIfaIiopvFgrTDpzXctr7qELf?=
 =?us-ascii?Q?yC7oYBKLlDtupmjmSH+T58xGms01DrrbYV+fpltvM1ivQSlP2LrNM2ZamFA1?=
 =?us-ascii?Q?W00SH33KREzh1dsknw9dzUmHZLEBVdq0MYzEtYodYScV7cWAXEI2zXC7E04V?=
 =?us-ascii?Q?fa1MihiI2+t9aH9Ke7ERZTXEN69W08jRpSZPTX9MnmCuYWNZZizUviaRjv08?=
 =?us-ascii?Q?7dxdGT3ZQtXAPoB3I+51OQ3U247r0OGZqpmJJcLQYZxbi8YTa//toxi3+/xn?=
 =?us-ascii?Q?b29rOzKYhSlVYvssmhQl+53b5Gj0QJie2nDlM5iOLQhJ1swyu8lKSg142TSS?=
 =?us-ascii?Q?i/HbAIWWAQqS1sUOJ8x+B1IrkNz6qM7Zq64G5X+tOmU4PqpkX1dbLNo950o7?=
 =?us-ascii?Q?ON+nO3CehPHlr1xJHGr2MDNFzbaAFeeuAkuei/88xTQ8FJdy4SKvQ8mfekAW?=
 =?us-ascii?Q?A9ROVk0fwS0xJltdiUNKH4BxstmzZR0If0r4uRRjIBFJSCfjd3EEsSFOvf/F?=
 =?us-ascii?Q?hjQ+j+LwG1UTxESLtDUrZBkTluRr4tQH+xRcZqP+9oOeTKCPDif6aFRnp1gr?=
 =?us-ascii?Q?wc2v+ufaSHwVAppri7RZUzo+XiYAM3Rezgp7cZ1IypvIIKnhMhkCCEWqfz+C?=
 =?us-ascii?Q?WbvLHpEKMvvGG3mLFIaZw6MvBYF3Uows4M3w7inMgME1cMf1gdm33naIXV8R?=
 =?us-ascii?Q?NiT2aZ2VkRkDYjhNwyCXYBK7XHRhfTl47aDWt1KuyioaJounxCQXN9s2AWMT?=
 =?us-ascii?Q?YnBoUzsgn1rvixhZPW4dHZ5PhmAiKQCM+sfDGle+vItg+66It2My57EjdMGL?=
 =?us-ascii?Q?De7M3qr4I8/zIRTCI+Q3VRJTwCXtoLXgYnXkRWrAlXP6UXyAz9KdrArewha/?=
 =?us-ascii?Q?D+/PNAowapTOXH4RA/yss4gJxQCK18xYCASFJUvMYERzTOmm6sjH4KJuEEU4?=
 =?us-ascii?Q?aDno4pIyScf3q/6TUttFXvprDH9bUQ9VrzL/34/7NXIBaIxWvAuEF1X3EO3B?=
 =?us-ascii?Q?gHGW7K6r23wy7QmJHbfngiWJ1iI+EYmP+hOJkUR+EN/zw6s0lKfG3i+Rihv+?=
 =?us-ascii?Q?gkhwFS5FFT/jQgddf7f2JHSAYt/YKppkxoN2sQm6HK4wAZI2RjfDDZFy8S3N?=
 =?us-ascii?Q?LrOOhQFWeZMvq/96buSzAFD9?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021)(52116011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?2QpFGGsyrPasHPhMY4hngYD31+1aKVTFIMZY8moI6EIIt8zgFA5QWeO/PAVk?=
 =?us-ascii?Q?WhRZkYscaAXXvCJjXHbqx5Ehl1NC2iyl+7Pk9HV1HGpqJ8t8BOmtx+RKdUlm?=
 =?us-ascii?Q?dANn2OxtRNp88WFm3TGb7WNLBbHDklCUVX/gTnr7Gd0zR268L9syXibBxJFQ?=
 =?us-ascii?Q?h5SOt/rUKppPu4sIbcshFTSaQJ71b4K+5zAZnzzQDGmihGefYT5dQEVIEp0B?=
 =?us-ascii?Q?he2lFaxjXaHys/fWHiw7CCMqeR4TIQRvtTctZV+d4n7Huat5hgAIWy1DTgbN?=
 =?us-ascii?Q?WBs4a4c3GS+SwfuG6o/kuAOBklWBDerVASkvSmE6n7ET/cXSNVtcnpLSfq02?=
 =?us-ascii?Q?nJThy03T2FYMS6N2dMqY15aJZNpLnLMeeKX2xrlDGED4UztCZa4VfuIAu3Ga?=
 =?us-ascii?Q?8dqBT8rV7gIp0XZIJhgfQCCZvbJ8Ohw+X/7A4ETAjIBLd+UflR1TQZK+kP2q?=
 =?us-ascii?Q?MGxIosQL0IvuntP5euFkPsGB/A+O51SRGaygYSWJ2Eqr72za4FJVtz3/vkMf?=
 =?us-ascii?Q?zWMg9pjGdouk7nrTAgQoGyMLGMoLzpoAbH6PwxHWFzO8DUFS07vlX5IboHMc?=
 =?us-ascii?Q?cIcskRhsLFUhYVtqXT2BtFD4bWpOUFYqfT2zGh0sUozKUqw3HY5AF7uwcx4U?=
 =?us-ascii?Q?AuP20TPpi3EDboAoZx2RPLUOnpxfjlry+l7cwvraCZJKexZ36hKgkdv2RFET?=
 =?us-ascii?Q?7WEbLABWcWq12Obi32vFq1n3IcFz+EVUxZ7iZaddUW3W1sOOyAo0z1RPzCGJ?=
 =?us-ascii?Q?GMsPMPl0Azif8/NLWnaobbIScb3CYwFteAXPHNggGFn78atBs2n1o1lriehL?=
 =?us-ascii?Q?BwDnQ4t86DgTip/8fRUbybYr6treCoTlBFLAIL5PkseDrmwDGq6dqBBvSh5B?=
 =?us-ascii?Q?rXNVN1SMPoTHuIYLQCNhOyLE0E2mRdVrcNsEa8s8WSCTrtg97QXTP36YYBAA?=
 =?us-ascii?Q?Gi0yunbFlx8LOOyRVhh/DID/S9FyoBCHSxf0dvU/1FH+Z5pM0jLjyTfFT/PH?=
 =?us-ascii?Q?aEIVDbfFfrlp/WD25SHrrZbXuCXmc99IykYDh+i9RoRKdsRIPVqKMEwLSOEi?=
 =?us-ascii?Q?7z13dHlHwMyJ0HeNO1WpnMWA7YNYw0I5Udc2qlsSYrkTAbcR575Ra2iMqD7I?=
 =?us-ascii?Q?9zD86LKX34S11xzJVTcj9ydr+coyA3fTsT5FCZvGfWxe2+cE/5O6RkRuiDOr?=
 =?us-ascii?Q?S/Arpo1Q854qQTDbiHcyVKSY2MzP+kjWXrZ1SIopGFSKxUWd+vd2HqrHwPdr?=
 =?us-ascii?Q?7Yoc0EVfRrLN6U/OX54em1y+Nv9WzABwX8RCC62W9NG4aXM2sleXQK2v4vHw?=
 =?us-ascii?Q?5ZC+LsHb32GArmZ8v1W0aUhyLQgmNftu8s3I377ns6t4wBoHckMmMfNvjSCl?=
 =?us-ascii?Q?FonnM0m6vz0YZ1z9ZeuzLtdaIO90xM1sEeVADCVa6Av2pBPhl0+fYFZDqa1/?=
 =?us-ascii?Q?8wzOXuBIXs7vNe3xNJd8RNtEGBevrLNwYB9p24d2QWQb6vx/Dh4JxdC6+ztn?=
 =?us-ascii?Q?SiEtlkwpREgJ2tSsMMVbmRm4IkUPhtf+hCblHOQFnnS0dQVtMcSCTH2pOU0w?=
 =?us-ascii?Q?ZRH/BQX1MAp6r2pePq/y8A9Wt0wom9cu8bEUbUUT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af5a8e9-5cea-4f50-ba76-08dc92396a91
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 21:30:48.1539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqYmxYjTyWONmYMBey038bWA176N6Y/VaTVyE2Wj1B4E/oUdG9uo1+nssiVOzJCpgi8uJ94OTYDspMqYrkEUhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909
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

Convert qman, bman, qman-portals, bman-portals to yaml format.

Additional Chang for fsl,q(b)man-portal:
- Only keep one example.
- Add fsl,qman-channel-id property.
- Use interrupt type macro.
- Remove top level qman-portals@ff4200000 at example.

Additional change for fsl,q(b)man:
- Fixed example error.
- Remove redundent part, only keep fsl,qman node.
- Change memory-regions to memory-region.
- fsl,q(b)man-portals is not required property

Additional change for fsl,qman-fqd.yaml:
- Fixed example error.
- Only keep one example.
- Ref to reserve-memory.yaml
- Merge fsl,bman reserver memory part

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/soc/fsl/bman-portals.txt         |  56 ------
 .../devicetree/bindings/soc/fsl/bman.txt      | 137 -------------
 .../bindings/soc/fsl/fsl,bman-portal.yaml     |  51 +++++
 .../devicetree/bindings/soc/fsl/fsl,bman.yaml |  83 ++++++++
 .../bindings/soc/fsl/fsl,qman-fqd.yaml        |  68 +++++++
 .../bindings/soc/fsl/fsl,qman-portal.yaml     | 110 +++++++++++
 .../devicetree/bindings/soc/fsl/fsl,qman.yaml |  97 +++++++++
 .../bindings/soc/fsl/qman-portals.txt         | 134 -------------
 .../devicetree/bindings/soc/fsl/qman.txt      | 187 ------------------
 9 files changed, 409 insertions(+), 514 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/fsl/bman-portals.txt
 delete mode 100644 Documentation/devicetree/bindings/soc/fsl/bman.txt
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,bman-portal.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/fsl/qman-portals.txt
 delete mode 100644 Documentation/devicetree/bindings/soc/fsl/qman.txt

diff --git a/Documentation/devicetree/bindings/soc/fsl/bman-portals.txt b/Documentation/devicetree/bindings/soc/fsl/bman-portals.txt
deleted file mode 100644
index 2a00e14e11e02..0000000000000
--- a/Documentation/devicetree/bindings/soc/fsl/bman-portals.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-QorIQ DPAA Buffer Manager Portals Device Tree Binding
-
-Copyright (C) 2008 - 2014 Freescale Semiconductor Inc.
-
-CONTENTS
-
-	- BMan Portal
-	- Example
-
-BMan Portal Node
-
-Portals are memory mapped interfaces to BMan that allow low-latency, lock-less
-interaction by software running on processor cores, accelerators and network
-interfaces with the BMan
-
-PROPERTIES
-
-- compatible
-	Usage:		Required
-	Value type:	<stringlist>
-	Definition:	Must include "fsl,bman-portal-<hardware revision>"
-			May include "fsl,<SoC>-bman-portal" or "fsl,bman-portal"
-
-- reg
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Two regions. The first is the cache-enabled region of
-			the portal. The second is the cache-inhibited region of
-			the portal
-
-- interrupts
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Standard property
-
-EXAMPLE
-
-The example below shows a (P4080) BMan portals container/bus node with two portals
-
-	bman-portals@ff4000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		ranges = <0 0xf 0xf4000000 0x200000>;
-
-		bman-portal@0 {
-			compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
-			reg = <0x0 0x4000>, <0x100000 0x1000>;
-			interrupts = <105 2 0 0>;
-		};
-		bman-portal@4000 {
-			compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
-			reg = <0x4000 0x4000>, <0x101000 0x1000>;
-			interrupts = <107 2 0 0>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/soc/fsl/bman.txt b/Documentation/devicetree/bindings/soc/fsl/bman.txt
deleted file mode 100644
index 48eed140765b0..0000000000000
--- a/Documentation/devicetree/bindings/soc/fsl/bman.txt
+++ /dev/null
@@ -1,137 +0,0 @@
-QorIQ DPAA Buffer Manager Device Tree Bindings
-
-Copyright (C) 2008 - 2014 Freescale Semiconductor Inc.
-
-CONTENTS
-
-	- BMan Node
-	- BMan Private Memory Node
-	- Example
-
-BMan Node
-
-The Buffer Manager is part of the Data-Path Acceleration Architecture (DPAA).
-BMan supports hardware allocation and deallocation of buffers belonging to pools
-originally created by software with configurable depletion thresholds. This
-binding covers the CCSR space programming model
-
-PROPERTIES
-
-- compatible
-	Usage:		Required
-	Value type:	<stringlist>
-	Definition:	Must include "fsl,bman"
-			May include "fsl,<SoC>-bman"
-
-- reg
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Registers region within the CCSR address space
-
-The BMan revision information is located in the BMAN_IP_REV_1/2 registers which
-are located at offsets 0xbf8 and 0xbfc
-
-- interrupts
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Standard property. The error interrupt
-
-- fsl,bman-portals
-	Usage:		Required
-	Value type:	<phandle>
-	Definition:	Phandle to this BMan instance's portals
-
-- fsl,liodn
-	Usage:		See pamu.txt
-	Value type:	<prop-encoded-array>
-	Definition:	PAMU property used for static LIODN assignment
-
-- fsl,iommu-parent
-	Usage:		See pamu.txt
-	Value type:	<phandle>
-	Definition:	PAMU property used for dynamic LIODN assignment
-
-	For additional details about the PAMU/LIODN binding(s) see pamu.txt
-
-Devices connected to a BMan instance via Direct Connect Portals (DCP) must link
-to the respective BMan instance
-
-- fsl,bman
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Description:	List of phandle and DCP index pairs, to the BMan instance
-			to which this device is connected via the DCP
-
-BMan Private Memory Node
-
-BMan requires a contiguous range of physical memory used for the backing store
-for BMan Free Buffer Proxy Records (FBPR). This memory is reserved/allocated as
-a node under the /reserved-memory node.
-
-The BMan FBPR memory node must be named "bman-fbpr"
-
-PROPERTIES
-
-- compatible
-	Usage:		required
-	Value type:	<stringlist>
-	Definition:	PPC platforms: Must include "fsl,bman-fbpr"
-			ARM platforms: Must include "shared-dma-pool"
-				       as well as the "no-map" property
-
-The following constraints are relevant to the FBPR private memory:
-	- The size must be 2^(size + 1), with size = 11..33. That is 4 KiB to
-	  16 GiB
-	- The alignment must be a muliptle of the memory size
-
-The size of the FBPR must be chosen by observing the hardware features configured
-via the Reset Configuration Word (RCW) and that are relevant to a specific board
-(e.g. number of MAC(s) pinned-out, number of offline/host command FMan ports,
-etc.). The size configured in the DT must reflect the hardware capabilities and
-not the specific needs of an application
-
-For additional details about reserved memory regions see reserved-memory.txt
-
-EXAMPLE
-
-The example below shows a BMan FBPR dynamic allocation memory node
-
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		bman_fbpr: bman-fbpr {
-			compatible = "shared-mem-pool";
-			size = <0 0x1000000>;
-			alignment = <0 0x1000000>;
-			no-map;
-		};
-	};
-
-The example below shows a (P4080) BMan CCSR-space node
-
-	bportals: bman-portals@ff4000000 {
-		...
-	};
-
-	crypto@300000 {
-		...
-		fsl,bman = <&bman, 2>;
-		...
-	};
-
-	bman: bman@31a000 {
-		compatible = "fsl,bman";
-		reg = <0x31a000 0x1000>;
-		interrupts = <16 2 1 2>;
-		fsl,liodn = <0x17>;
-		fsl,bman-portals = <&bportals>;
-		memory-region = <&bman_fbpr>;
-	};
-
-	fman@400000 {
-		...
-		fsl,bman = <&bman, 0>;
-		...
-	};
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,bman-portal.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,bman-portal.yaml
new file mode 100644
index 0000000000000..06b51f049098f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,bman-portal.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,bman-portal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QorIQ DPAA Queue Manager Portals
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  QorIQ DPAA Buffer Manager Portal
+
+  Portals are memory mapped interfaces to BMan that allow low-latency, lock-less
+  interaction by software running on processor cores, accelerators and network
+  interfaces with the BMan
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,bman-portal
+      - items:
+          - enum:
+              - fsl,ls1043a-bmap-portal
+              - fsl,ls1046a-bmap-portal
+          - const: fsl,bman-portal
+  reg:
+    items:
+      - description: the cache-enabled region of the portal
+      - description: the cache-inhibited region of the porta
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bman-portal@0 {
+        compatible = "fsl,bman-portal-1.0.0", "fsl,bman-portal";
+        reg = <0x0 0x4000>, <0x100000 0x1000>;
+        interrupts = <105 IRQ_TYPE_EDGE_FALLING 0 0>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml
new file mode 100644
index 0000000000000..e6b3d489ce5cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,bman.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QorIQ DPAA Buffer Manager
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The Buffer Manager is part of the Data-Path Acceleration Architecture (DPAA).
+  BMan supports hardware allocation and deallocation of buffers belonging to pools
+  originally created by software with configurable depletion thresholds. This
+  binding covers the CCSR space programming model
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,bman
+      - items:
+          - enum:
+              - fsl,ls1043a-bman
+              - fsl,ls1046a-bman
+          - const: fsl,bman
+
+  reg:
+    items:
+      - description:
+          Registers region within the CCSR address space
+
+          The BMan revision information is located in the BMAN_IP_REV_1/2 registers which
+          are located at offsets 0xbf8 and 0xbfc
+
+  interrupts:
+    items:
+      - description: The error interrupt
+
+  memory-region:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of phandles referencing the BMan private memory
+      nodes (described below). The bman-fqd node must be
+      first followed by bman-pfdr node. Only used on ARM
+
+      Devices connected to a BMan instance via Direct Connect Portals (DCP) must link
+      to the respective BMan instance
+
+  fsl,bman-portals:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: ref fsl,bman-port.yaml
+
+  fsl,liodn:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      See pamu.txt, PAMU property used for static LIODN assignment
+
+  fsl,iommu-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      See pamu.txt, PAMU property used for dynamic LIODN assignment
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - fsl,bman-portals
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bman@31a000 {
+        compatible = "fsl,bman";
+        reg = <0x31a000 0x1000>;
+        interrupts = <16 IRQ_TYPE_EDGE_FALLING 1 2>;
+        fsl,liodn = <0x17>;
+        fsl,bman-portals = <&bportals>;
+        memory-region = <&bman_fbpr>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
new file mode 100644
index 0000000000000..f7af14dc7deb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,qman-fqd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QMan Private Memory Nodes
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+  QMan requires two contiguous range of physical memory used for the backing store
+  for QMan Frame Queue Descriptor (FQD) and Packed Frame Descriptor Record (PFDR).
+  This memory is reserved/allocated as a node under the /reserved-memory node.
+
+  BMan requires a contiguous range of physical memory used for the backing store
+  for BMan Free Buffer Proxy Records (FBPR). This memory is reserved/allocated as
+  a node under the /reserved-memory node.
+
+  The QMan FQD memory node must be named "qman-fqd"
+  The QMan PFDR memory node must be named "qman-pfdr"
+  The BMan FBPR memory node must be named "bman-fbpr"
+
+  The following constraints are relevant to the FQD and PFDR private memory:
+    - The size must be 2^(size + 1), with size = 11..29. That is 4 KiB to
+      1 GiB
+    - The alignment must be a muliptle of the memory size
+
+  The size of the FQD and PFDP must be chosen by observing the hardware features
+  configured via the Reset Configuration Word (RCW) and that are relevant to a
+  specific board (e.g. number of MAC(s) pinned-out, number of offline/host command
+  FMan ports, etc.). The size configured in the DT must reflect the hardware
+  capabilities and not the specific needs of an application
+
+  For additional details about reserved memory regions see reserved-memory.txt
+
+properties:
+  $nodename:
+    pattern: '^(qman-fqd|qman-pfdr|bman-fbpr|)+$'
+
+  compatible:
+    enum:
+      - fsl,qman-fqd
+      - fsl,qman-pfdr
+      - fsl,bman-fbpr
+
+required:
+  - compatible
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        qman-fqd {
+            compatible = "shared-dma-pool";
+            size = <0 0x400000>;
+            alignment = <0 0x400000>;
+            no-map;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml
new file mode 100644
index 0000000000000..6c81e0d66f4d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,qman-portal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QorIQ DPAA Queue Manager Portals
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  Portals are memory mapped interfaces to QMan that allow low-latency, lock-less
+  interaction by software running on processor cores, accelerators and network
+  interfaces with the QMan
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,qman-portal
+      - items:
+          - enum:
+              - fsl,ls1043-qman-portal
+              - fsl,ls1046-qman-portal
+              - fsl,qman-portal-1.2.0
+          - const: fsl,qman-portal
+
+  reg:
+    items:
+      - description: the cache-enabled region of the portal
+      - description: the cache-inhibited region of the portal
+
+  interrupts:
+    maxItems: 1
+
+  fsl,liodn:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: See pamu.txt. Two LIODN(s). DQRR LIODN (DLIODN) and Frame LIODN
+      (FLIODN)
+
+  fsl,iommu-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: See pamu.txt.
+
+  fsl,qman-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: qman channel id.
+
+  cell-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The hardware index of the channel. This can also be
+      determined by dividing any of the channel's 8 work queue
+      IDs by 8
+
+      In addition to these properties the qman-portals should have sub-nodes to
+      represent the HW devices/portals that are connected to the software portal
+      described here
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+patternProperties:
+  '^(fman0|fman1|pme|crypto|)+$':
+    type: object
+    properties:
+      fsl,liodn:
+        description: See pamu.txt, PAMU property used for static LIODN assignment
+
+      fsl,iommu-parent:
+        description: See pamu.txt, PAMU property used for dynamic LIODN assignment
+
+      dev-handle:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          The phandle to the particular hardware device that this
+          portal is connected to.
+
+    additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    qman-portal@0 {
+        compatible = "fsl,qman-portal-1.2.0", "fsl,qman-portal";
+        reg = <0 0x4000>, <0x100000 0x1000>;
+        interrupts = <104 IRQ_TYPE_EDGE_FALLING 0 0>;
+        fsl,liodn = <1 2>;
+        fsl,qman-channel-id = <0>;
+
+        fman0 {
+            fsl,liodn = <0x21>;
+            dev-handle = <&fman0>;
+        };
+
+        fman1 {
+            fsl,liodn = <0xa1>;
+            dev-handle = <&fman1>;
+        };
+
+        crypto {
+            fsl,liodn = <0x41 0x66>;
+            dev-handle = <&crypto>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml
new file mode 100644
index 0000000000000..341c3d2cfd6c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,qman.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QorIQ DPAA Queue Manager
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The Queue Manager is part of the Data-Path Acceleration Architecture (DPAA). QMan
+  supports queuing and QoS scheduling of frames to CPUs, network interfaces and
+  DPAA logic modules, maintains packet ordering within flows. Besides providing
+  flow-level queuing, is also responsible for congestion management functions such
+  as RED/WRED, congestion notifications and tail discards. This binding covers the
+  CCSR space programming model
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,qman
+      - items:
+          - enum:
+              - fsl,ls1043a-qman
+              - fsl,ls1046a-qman
+          - const: fsl,qman
+  reg:
+    items:
+      - description:
+          Registers region within the CCSR address space
+
+          The QMan revision information is located in the QMAN_IP_REV_1/2 registers which
+          are located at offsets 0xbf8 and 0xbfc
+
+  interrupts:
+    items:
+      - description: The error interrupt
+
+  fsl,qman-portals:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: ref fsl,qman-port.yaml
+
+  fsl,liodn:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      See pamu.txt, PAMU property used for static LIODN assignment
+
+  fsl,iommu-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      See pamu.txt, PAMU property used for dynamic LIODN assignment
+
+  clocks:
+    maxItems: 1
+    description:
+      See clock-bindings.txt and qoriq-clock.txt
+      Reference input clock. Its frequency is half of the platform clock
+
+  memory-region:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of phandles referencing the QMan private memory
+      nodes (described below). The qman-fqd node must be
+      first followed by qman-pfdr node. Only used on ARM
+
+      Devices connected to a QMan instance via Direct Connect Portals (DCP) must link
+      to the respective QMan instance
+
+  fsl,qman:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      List of phandle and DCP index pairs, to the QMan instance
+      to which this device is connected via the DCP
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - fsl,qman-portals
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    qman: qman@318000 {
+        compatible = "fsl,qman";
+        reg = <0x318000 0x1000>;
+        interrupts = <16 IRQ_TYPE_EDGE_FALLING 1 3>;
+        fsl,liodn = <0x16>;
+        fsl,qman-portals = <&qportals>;
+        memory-region = <&qman_fqd &qman_pfdr>;
+        clocks = <&platform_pll 1>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/qman-portals.txt b/Documentation/devicetree/bindings/soc/fsl/qman-portals.txt
deleted file mode 100644
index 5a34f3ab7bea3..0000000000000
--- a/Documentation/devicetree/bindings/soc/fsl/qman-portals.txt
+++ /dev/null
@@ -1,134 +0,0 @@
-QorIQ DPAA Queue Manager Portals Device Tree Binding
-
-Copyright (C) 2008 - 2014 Freescale Semiconductor Inc.
-
-CONTENTS
-
-	- QMan Portal
-	- Example
-
-QMan Portal Node
-
-Portals are memory mapped interfaces to QMan that allow low-latency, lock-less
-interaction by software running on processor cores, accelerators and network
-interfaces with the QMan
-
-PROPERTIES
-
-- compatible
-	Usage:		Required
-	Value type:	<stringlist>
-	Definition:	Must include "fsl,qman-portal-<hardware revision>"
-			May include "fsl,<SoC>-qman-portal" or "fsl,qman-portal"
-
-- reg
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Two regions. The first is the cache-enabled region of
-			the portal. The second is the cache-inhibited region of
-			the portal
-
-- interrupts
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Standard property
-
-- fsl,liodn
-	Usage:		See pamu.txt
-	Value type:	<prop-encoded-array>
-	Definition:	Two LIODN(s). DQRR LIODN (DLIODN) and Frame LIODN
-			(FLIODN)
-
-- fsl,iommu-parent
-	Usage:		See pamu.txt
-	Value type:	<phandle>
-	Definition:	PAMU property used for dynamic LIODN assignment
-
-	For additional details about the PAMU/LIODN binding(s) see pamu.txt
-
-- cell-index
-	Usage:		Required
-	Value type:	<u32>
-	Definition:	The hardware index of the channel. This can also be
-			determined by dividing any of the channel's 8 work queue
-			IDs by 8
-
-In addition to these properties the qman-portals should have sub-nodes to
-represent the HW devices/portals that are connected to the software portal
-described here
-
-The currently supported sub-nodes are:
-	* fman0
-	* fman1
-	* pme
-	* crypto
-
-These subnodes should have the following properties:
-
-- fsl,liodn
-	Usage:		See pamu.txt
-	Value type:	<prop-encoded-array>
-	Definition:	PAMU property used for static LIODN assignment
-
-- fsl,iommu-parent
-	Usage:		See pamu.txt
-	Value type:	<phandle>
-	Definition:	PAMU property used for dynamic LIODN assignment
-
-- dev-handle
-	Usage:		Required
-	Value type:	<phandle>
-	Definition:	The phandle to the particular hardware device that this
-			portal is connected to.
-
-EXAMPLE
-
-The example below shows a (P4080) QMan portals container/bus node with two portals
-
-	qman-portals@ff4200000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		ranges = <0 0xf 0xf4200000 0x200000>;
-
-		qman-portal@0 {
-			compatible = "fsl,qman-portal-1.2.0", "fsl,qman-portal";
-			reg = <0 0x4000>, <0x100000 0x1000>;
-			interrupts = <104 2 0 0>;
-			fsl,liodn = <1 2>;
-			fsl,qman-channel-id = <0>;
-
-			fman0 {
-				fsl,liodn = <0x21>;
-				dev-handle = <&fman0>;
-			};
-			fman1 {
-				fsl,liodn = <0xa1>;
-				dev-handle = <&fman1>;
-			};
-			crypto {
-				fsl,liodn = <0x41 0x66>;
-				dev-handle = <&crypto>;
-			};
-		};
-		qman-portal@4000 {
-			compatible = "fsl,qman-portal-1.2.0", "fsl,qman-portal";
-			reg = <0x4000 0x4000>, <0x101000 0x1000>;
-			interrupts = <106 2 0 0>;
-			fsl,liodn = <3 4>;
-			cell-index = <1>;
-
-			fman0 {
-				fsl,liodn = <0x22>;
-				dev-handle = <&fman0>;
-			};
-			fman1 {
-				fsl,liodn = <0xa2>;
-				dev-handle = <&fman1>;
-			};
-			crypto {
-				fsl,liodn = <0x42 0x67>;
-				dev-handle = <&crypto>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/soc/fsl/qman.txt b/Documentation/devicetree/bindings/soc/fsl/qman.txt
deleted file mode 100644
index ee96afd2af721..0000000000000
--- a/Documentation/devicetree/bindings/soc/fsl/qman.txt
+++ /dev/null
@@ -1,187 +0,0 @@
-QorIQ DPAA Queue Manager Device Tree Binding
-
-Copyright (C) 2008 - 2014 Freescale Semiconductor Inc.
-
-CONTENTS
-
-	- QMan Node
-	- QMan Private Memory Nodes
-	- Example
-
-QMan Node
-
-The Queue Manager is part of the Data-Path Acceleration Architecture (DPAA). QMan
-supports queuing and QoS scheduling of frames to CPUs, network interfaces and
-DPAA logic modules, maintains packet ordering within flows. Besides providing
-flow-level queuing, is also responsible for congestion management functions such
-as RED/WRED, congestion notifications and tail discards. This binding covers the
-CCSR space programming model
-
-PROPERTIES
-
-- compatible
-	Usage:		Required
-	Value type:	<stringlist>
-	Definition:	Must include "fsl,qman"
-			May include "fsl,<SoC>-qman"
-
-- reg
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Registers region within the CCSR address space
-
-The QMan revision information is located in the QMAN_IP_REV_1/2 registers which
-are located at offsets 0xbf8 and 0xbfc
-
-- interrupts
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Definition:	Standard property. The error interrupt
-
-- fsl,qman-portals
-	Usage:		Required
-	Value type:	<phandle>
-	Definition:	Phandle to this QMan instance's portals
-
-- fsl,liodn
-	Usage:		See pamu.txt
-	Value type:	<prop-encoded-array>
-	Definition:	PAMU property used for static LIODN assignment
-
-- fsl,iommu-parent
-	Usage:		See pamu.txt
-	Value type:	<phandle>
-	Definition:	PAMU property used for dynamic LIODN assignment
-
-	For additional details about the PAMU/LIODN binding(s) see pamu.txt
-
-- clocks
-	Usage:		See clock-bindings.txt and qoriq-clock.txt
-	Value type:	<prop-encoded-array>
-	Definition:	Reference input clock. Its frequency is half of the
-			platform clock
-- memory-regions
-	Usage:		Required for ARM
-	Value type:	<phandle array>
-	Definition:	List of phandles referencing the QMan private memory
-			nodes (described below). The qman-fqd node must be
-			first followed by qman-pfdr node. Only used on ARM
-
-Devices connected to a QMan instance via Direct Connect Portals (DCP) must link
-to the respective QMan instance
-
-- fsl,qman
-	Usage:		Required
-	Value type:	<prop-encoded-array>
-	Description:	List of phandle and DCP index pairs, to the QMan instance
-			to which this device is connected via the DCP
-
-QMan Private Memory Nodes
-
-QMan requires two contiguous range of physical memory used for the backing store
-for QMan Frame Queue Descriptor (FQD) and Packed Frame Descriptor Record (PFDR).
-This memory is reserved/allocated as a node under the /reserved-memory node.
-
-For additional details about reserved memory regions see reserved-memory.txt
-
-The QMan FQD memory node must be named "qman-fqd"
-
-PROPERTIES
-
-- compatible
-	Usage:		required
-	Value type:	<stringlist>
-	Definition:	PPC platforms: Must include "fsl,qman-fqd"
-			ARM platforms: Must include "shared-dma-pool"
-				       as well as the "no-map" property
-
-The QMan PFDR memory node must be named "qman-pfdr"
-
-PROPERTIES
-
-- compatible
-	Usage:		required
-	Value type:	<stringlist>
-	Definition:	PPC platforms: Must include "fsl,qman-pfdr"
-			ARM platforms: Must include "shared-dma-pool"
-				       as well as the "no-map" property
-
-The following constraints are relevant to the FQD and PFDR private memory:
-	- The size must be 2^(size + 1), with size = 11..29. That is 4 KiB to
-	  1 GiB
-	- The alignment must be a muliptle of the memory size
-
-The size of the FQD and PFDP must be chosen by observing the hardware features
-configured via the Reset Configuration Word (RCW) and that are relevant to a
-specific board (e.g. number of MAC(s) pinned-out, number of offline/host command
-FMan ports, etc.). The size configured in the DT must reflect the hardware
-capabilities and not the specific needs of an application
-
-For additional details about reserved memory regions see reserved-memory.txt
-
-EXAMPLE
-
-The example below shows a QMan FQD and a PFDR dynamic allocation memory nodes
-
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		qman_fqd: qman-fqd {
-			compatible = "shared-dma-pool";
-			size = <0 0x400000>;
-			alignment = <0 0x400000>;
-			no-map;
-		};
-		qman_pfdr: qman-pfdr {
-			compatible = "shared-dma-pool";
-			size = <0 0x2000000>;
-			alignment = <0 0x2000000>;
-			no-map;
-		};
-	};
-
-The example below shows a (P4080) QMan CCSR-space node
-
-	qportals: qman-portals@ff4200000 {
-		...
-	};
-
-	clockgen: global-utilities@e1000 {
-		...
-		sysclk: sysclk {
-			...
-		};
-		...
-		platform_pll: platform-pll@c00 {
-			#clock-cells = <1>;
-			reg = <0xc00 0x4>;
-			compatible = "fsl,qoriq-platform-pll-1.0";
-			clocks = <&sysclk>;
-			clock-output-names = "platform-pll", "platform-pll-div2";
-		};
-		...
-	};
-
-	crypto@300000 {
-		...
-		fsl,qman = <&qman, 2>;
-		...
-	};
-
-	qman: qman@318000 {
-		compatible = "fsl,qman";
-		reg = <0x318000 0x1000>;
-		interrupts = <16 2 1 3>
-		fsl,liodn = <0x16>;
-		fsl,qman-portals = <&qportals>;
-		memory-region = <&qman_fqd &qman_pfdr>;
-		clocks = <&platform_pll 1>;
-	};
-
-	fman@400000 {
-		...
-		fsl,qman = <&qman, 0>;
-		...
-	};
-- 
2.34.1

