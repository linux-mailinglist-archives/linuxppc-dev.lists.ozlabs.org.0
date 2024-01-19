Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2F1832FEA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 21:41:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RRsm59p/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGs3Q3PLTz3c2V
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 07:41:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RRsm59p/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::628; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0628.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGs1b39cZz2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 07:40:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3yUBuAz4QHPRIn5Elo2SVmoEb63Vwt2H2c9/JEb4FkYI1zMPDRXQnCxYMWPqoXhx3WR2zlxGc3TjOFvz7d4XPSGMZnQGkzZVoYtdmUcE0DZEJTXHNQqJjuW4BLH82Ikv2ss6d0o4YT5huP8cFYG7InwXOfO8L6n5iUpQ5tdhYI3/B0uoPqKUyBhrbiyykL3n0cy9809JVZlsBte4T9QoDkgvrIBawtf4YfeSY1Z29otr4qY+rVO7wOntENEa2VpMFLe2No98dI6gyqJWr7ZSCpgrvbeNxmOcmDj+emDeqP6oV3RYi5AaLoKeCaftQW0+nMETJPIupOAI5RotSv0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p45joBmEglStok5dM7gIywyLRTyDLUWlJBjDSG0Wu8c=;
 b=SiUgMt5V/SV3VQrFkNAnhTiXWpYRlyY+dy/zeuG1ZRPKGyXJoA0sxLflTavYWH1xPIDKL4yo3SSwsOUsjSULMVum80+RbpPLBCRoxE8z4vIxDGtQMM8hhTTpHgJSwfNr0oPDxqZjf6LP1+B4S8uQLad+tqU2+tYtH9lSXYVnLFj4aCPi41rPvIvtOj3VthX5S5bv2IzStL95vNQb1SBWC21YAzNynMTjvZT3siT92VHNVtlQgHcyd30pBr6JIzNl9RkXTLFJNwqkYv+cEf+BckB2blOKWM5KkbhNxj4DrFKgIIfFI4oIGbeJz9fMMzIfz1WaIVRN8coGRpoZR+GItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p45joBmEglStok5dM7gIywyLRTyDLUWlJBjDSG0Wu8c=;
 b=RRsm59p/TAXRvzTOyH2C4RsyXPWY8Z7d8aWY3FyXtRDhAkc+coOzAjs7dTONa5g+kfG/IPdlAWPKplGElUwy4m72WXCArPdpmeu/tAgBXyqAI0T/l615W5PT17bFqdhVw2Opjx1i3dyZIJWmPJd5O6dbYGZUK57hcJgwViDdqV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6990.eurprd04.prod.outlook.com (2603:10a6:803:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 20:39:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9%4]) with mapi id 15.20.7202.027; Fri, 19 Jan 2024
 20:39:40 +0000
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
	Xiaowei Bao <xiaowei.bao@nxp.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/4] powerpc: dts: p1010rdb: fix INTx interrupt issue on P1010RDB-PB
Date: Fri, 19 Jan 2024 15:38:55 -0500
Message-Id: <20240119203911.3143928-2-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 08417b41-377b-4829-7b3e-08dc192ec2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7aEeZw/UgzgpqLtURQxgNQ3ZVik29stJ8tzr4E7pcO+dmhX7VniLmYpsTUXsrSIMeCjF/dp6pM9TiBgCZIzjeXlV4wPCgdsQM5PqzJSDTs5GOCirJcxi94fYPnVDiBAxNtZNK1u6L1tCdGcN5tL8qXfY8aFj8ROFAcUJc4MDNImnl98VWM5eg2dpOt/cx7V3FL83IzX7vAqQdMkNWOhDeyFsvjCjY12cIVYuXmnU8h/pOl7vTPujVvmBiJehfTt98rVT7TZBUve2CLLj2PGTDADVdSvoY6endAhoTk6J6TjkHTbxDKvwDMUrLku7YIRhLauKHJBT4F2xqwYVAAZY/dNxYi3fAiSvCxF09kd1+4ULcuEEXWZVNxQLR+iO5gC/Z7Dug4ZKrYgudIhV4kO5zcwLkIKc/37sRQivxszz7BTUWhzvsXyAa/HdWsSDBZZBw30cHWDruXFt2VY05IRe14T/eeaLmHD32TfPLwJQUd99+JXKYJCe9bMwCzXOI6wv7rZLNwbaW20u6NoWg+lpTCZIUFCQqhmBK+PHvBMK6XsXiLBbSIH6SSEkE9cEjbtRy1w4910m+OEYZjH0D6Utql5zRCQ0WyCe4OpcBO2FeZKoEDUwHF41OoOO/PfRSd0N+wUWW5rOlzl5W553yT/wxQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(346002)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6666004)(2616005)(6512007)(6506007)(26005)(1076003)(52116002)(5660300002)(41300700001)(7416002)(83380400001)(2906002)(4326008)(6486002)(478600001)(316002)(66556008)(66476007)(110136005)(66946007)(921011)(8676002)(8936002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?B8QOt3cv6ROuakdYKqpMG/xCWn5gFm2/aWFn/9+gpFfOn9MwY+sYsP0midxh?=
 =?us-ascii?Q?0VvRNp/sYKlMhoAHBk6GUvcF4qfr7VXsxateWIolHFvSeyMePyhqlXkVU5Cs?=
 =?us-ascii?Q?V1kExtvlM1eGQP+MidEbBDYL6hKxDRmNhoDJFeqPLF2Ve7ed4wkTVpMxD+dz?=
 =?us-ascii?Q?bdI+kHJI6UKZo2qL9yuVm40XxUvsz4b/QqTrZO2tPvtmfg0EkWE5aoAOHeMT?=
 =?us-ascii?Q?irNwBj+n/hF0+j7+GrS2XXsvugY3iKngCOE3bSC0i/175RWhq4jJGhXLwIsV?=
 =?us-ascii?Q?CWeImmN6XAU2ISRw/4OZPzDnKa3uQuCgouN+6ZdW75Nw2mgPqK9dofo8prAs?=
 =?us-ascii?Q?j9ajxooIHqe9ZJImG4K/fis2uYuasDJLQG0us/l+s9vJE08np8/WTKbHsRJg?=
 =?us-ascii?Q?fZJsryT/5hmI5FgoHhZ/C/LV0ONwxDoZxM/apqiKpwlxUlxA18wqCFRAVZSy?=
 =?us-ascii?Q?AtlioDzo2UkoxuQQyDPqELMEbJlNpOA7jHGS4aGuizsnuYs0dVHf3WD0d33/?=
 =?us-ascii?Q?9GqtojXVY09StAeRTpi823Oy50k6RRob2VilqeGzZeFrEf7OVviTXXQP+HUM?=
 =?us-ascii?Q?lJ8EThMzwaN4khpeHnzLLEjbxhOdFXjwoMuvegTTQErlMcM0ZI7cffqZyNp9?=
 =?us-ascii?Q?Q7BlHyW435qb7v07PS1AtM6echr0/+Vu8AstTKpsVId66xwHKwzwmVWmFXGn?=
 =?us-ascii?Q?P1LFoEtPkw0gZbq/lTyCYyenDmo49iH/YbrY+bekutJhsyPU1ni9zUzsgvSJ?=
 =?us-ascii?Q?BYzmRvo/ktfWuev/bqh42V53qbWur27ACATFj3ke9thePTGOHBHZhY35AQEn?=
 =?us-ascii?Q?n99fo5AudtWdnyWxapcw91GxuIca1rX5yS6/IjZLyCrCpLrYGtFPDk+GIkB0?=
 =?us-ascii?Q?XsfSlPJDMXU0Gxy3oAli2S2rHm23HWcwpdkpWcuALPC9Rd8RkH8IVv/ZpknW?=
 =?us-ascii?Q?Fdo5omDT/jsVpX36HZO5214Ou/oFYmQL7QCZk50AVd7vzreET6YnrS2ekYVo?=
 =?us-ascii?Q?t3lFAd+FnB5jEaggC/NJjDgcICtDkQYxAVIalXwUbP6VxXoXvB/zIDLvXhBE?=
 =?us-ascii?Q?wg5rx0opQu2hTHwo4TZqlHMmpN2nFX4OctDfJc7F3eC/QVPtgpelFxkebxg/?=
 =?us-ascii?Q?XEd3+TMrcNzKGRuq0Ns2k6FCyij7KSBCxoAlID/EZJwfVE1mOdYsJ9K4Kq6g?=
 =?us-ascii?Q?/974Dfl8+Td/G0rSf1RzHdkhsgYhaka9xn/kFP3t05jNvnLDpPfw1LbMfQ2H?=
 =?us-ascii?Q?Gy9W1Ly29e6ld924HttPpCm7drteqENcnH3D7OS+i74PdWN42BuHIr2mvRKH?=
 =?us-ascii?Q?yqLrdxb4moNSJMA5fJVIj68dvQfSlWHXux1VnOyuMXvEh2vg19tN4CrB227H?=
 =?us-ascii?Q?YYbWjxvJcfjMSN2l9ZWSADj2GpiW2jW3AKbp15nWlj7xVdMXHWR0tKMz0B8o?=
 =?us-ascii?Q?9QxyUaMqz71J87YnintjrfRVD/TSM7mfVaGkEpVQYGe5Jdxv2cCxOrYVgpV8?=
 =?us-ascii?Q?c4dh+hPEidsyKHccrCQnf5Xc9M8cIjUAM+jLiFV7eWMd2cYHytIvwXj2qGyk?=
 =?us-ascii?Q?uSkoV0h8yP/AgBNXGFrCTLc/Xv6+HE5dYnCV1sfq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08417b41-377b-4829-7b3e-08dc192ec2c2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 20:39:40.8215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGSCG7AHPSLNA4b1j4pNkjiVelDaXMysmTaxU+dbJ5darxFlzxYWzjv+lxdLF0d/F8Dm+rYW6RxolzPmmFUsjQ==
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

From: Xiaowei Bao <xiaowei.bao@nxp.com>

Due to the INTA is shared with the active-low PHY2 interrupt on
P1010RDB-PA board, so configure P1010RDB-PA's INTA with polarity as
active-low, the P1010RDB-PB board is used separately, so configure
P1010RDB-PB's INTA with polarity as active-high.  The INTX in
P1010RDB-PB do not work because of the pcie@0 node fixup will be
overwrited by p1010si-post.dtsi file, so we move the pcie@0 node fixup
to p1010rdb-pb.dts and p1010rdb-pb_36b.dts.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
Signed-off-by: Li Yang <leoyang.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts     | 16 ++++++++++++++++
 arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts | 16 ++++++++++++++++
 arch/powerpc/boot/dts/fsl/p1010rdb.dtsi       | 16 ----------------
 3 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts b/arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts
index 3a94acbb3c033..ce3346d77858f 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts
@@ -29,3 +29,19 @@ &phy2 {
 };
 
 /include/ "p1010si-post.dtsi"
+
+&pci0 {
+	pcie@0 {
+		interrupt-map = <
+			/* IDSEL 0x0 */
+			/*
+			 *irq[4:5] are active-high
+			 *irq[6:7] are active-low
+			 */
+			0000 0x0 0x0 0x1 &mpic 0x4 0x2 0x0 0x0
+			0000 0x0 0x0 0x2 &mpic 0x5 0x2 0x0 0x0
+			0000 0x0 0x0 0x3 &mpic 0x6 0x1 0x0 0x0
+			0000 0x0 0x0 0x4 &mpic 0x7 0x1 0x0 0x0
+			>;
+	};
+};
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts b/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts
index 4cf255fedc96e..83590354f9a09 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts
@@ -56,3 +56,19 @@ &phy2 {
 };
 
 /include/ "p1010si-post.dtsi"
+
+&pci0 {
+	pcie@0 {
+		interrupt-map = <
+			/* IDSEL 0x0 */
+			/*
+			 *irq[4:5] are active-high
+			 *irq[6:7] are active-low
+			 */
+			0000 0x0 0x0 0x1 &mpic 0x4 0x2 0x0 0x0
+			0000 0x0 0x0 0x2 &mpic 0x5 0x2 0x0 0x0
+			0000 0x0 0x0 0x3 &mpic 0x6 0x1 0x0 0x0
+			0000 0x0 0x0 0x4 &mpic 0x7 0x1 0x0 0x0
+			>;
+	};
+};
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi b/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
index 2ca9cee2ddeb2..ef49a7d6c69dd 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
@@ -215,19 +215,3 @@ enet2: ethernet@b2000 {
 		phy-connection-type = "sgmii";
 	};
 };
-
-&pci0 {
-	pcie@0 {
-		interrupt-map = <
-			/* IDSEL 0x0 */
-			/*
-			 *irq[4:5] are active-high
-			 *irq[6:7] are active-low
-			 */
-			0000 0x0 0x0 0x1 &mpic 0x4 0x2 0x0 0x0
-			0000 0x0 0x0 0x2 &mpic 0x5 0x2 0x0 0x0
-			0000 0x0 0x0 0x3 &mpic 0x6 0x1 0x0 0x0
-			0000 0x0 0x0 0x4 &mpic 0x7 0x1 0x0 0x0
-			>;
-	};
-};
-- 
2.34.1

