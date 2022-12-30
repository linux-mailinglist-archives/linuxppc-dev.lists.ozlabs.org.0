Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CBC65939F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 01:11:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NjlzY3xsYz3cCk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 11:11:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=sdtdXz+1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.88; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=sdtdXz+1;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Njln90LSHz3c6S
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 11:02:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVgxRMgT5ovbPT7RnmlwB6jyc7JT++3cIGyBhEghR6lmtFigpr5kxI26CZeyIUyVtR8keq0VB0dFD03DU5pLA9mkPRoJvG3o14gC8AP6r4IiPr1GW+pDBu1cWAO2uf+X0a7RGqOkIPOHzSChNAXBpT1wK2OWkAugR6obX+9HaiYS6bhbU2iyn6kelWEe8FVTwIQ9X8199humS249PU3Bsf17dlvthTPrtYGiGwv00TfrIN0kCJc/LmkjyWGQ47BloCTZGq6GXnzH52Uoc3pu+gvxwuRcS+9NuCpoJg63g9GUzsuXR3UCZMFhxyy8Ezayjvsrh6kS0lXvpbGLczFnCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8doVtU5aeGb6h2WadHtENFPYKFwKAzaJ/PBwvCu+7Ts=;
 b=BTE7nk8DGTu98lbIibNsghZK4dHhuNODeOUBr1v3446FKgf8sscxZWGcYMwKfgdw7PwPozloraPC542n8TOri8sNmX7tObIqqXTEZZ3BfdZwsM/N/Vi0nONpi+OLmd7MIrvmr+bkxss4oDa2jxPhJVU8IzgfOQbpdw713V4h3sFDGWGoyqk94srnPmkpqDlGvRs7aH92UtXt3VZ6B+QzAuvREkD5trzBNzCA6aM5HXlswLmGYfU4dDrlGyKJjidh2Rv9AQRhBDyCgYzJfYCAdGz6nqPNQP5u7dRIipglx76bnsbrTXMwBo7pHPINSchxnsWXDOJ9ZhZhW7G3BnEbkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8doVtU5aeGb6h2WadHtENFPYKFwKAzaJ/PBwvCu+7Ts=;
 b=sdtdXz+1xyweEVpX38oRVne4EeK74+xqgchH4QX4uF96heafzz+ZtOsymF/XjndSW+Blr3TnA9kUAXcthBERzFQjrRUQRrgdxWR4ZAJ/5WrvEkSF0ya4io4mCZmY4qqd6z28eD2z8CijJQMXl1SFopd8kZZ/vfleu00BNB/BOuXne9UDMyjkg9BebnqI+nFIkDjcVIsdrsfRGeG+CvazXtkKdwH38xJXJzWRyJyTjQpjQpTD/LuWYmuE6reoaBDz3wQpVG2PB1bKoTRDAlPNo8klSVD5Rd3mQV4R00Qq8gIXF7YorITruH+xKiowgjmIYVEKvnMPBcWHin1Dzz7PXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9788.eurprd03.prod.outlook.com (2603:10a6:102:2ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 00:02:04 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%8]) with mapi id 15.20.5944.016; Fri, 30 Dec 2022
 00:02:04 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v9 09/10] arm64: dts: ls1088a: Prevent PCSs from probing as phys
Date: Thu, 29 Dec 2022 19:01:38 -0500
Message-Id: <20221230000139.2846763-10-sean.anderson@seco.com>
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
X-MS-Office365-Filtering-Correlation-Id: d837e351-1421-43ec-a52d-08dae9f9158b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NtBxawISM+qWVA/IGvaiSxJM47OoQWwaxK6movfmQifYSNwsMPLLPq1U+/3v8nzSgnxuQhji8R0i9pz/2+hkodjtKOTLhMP8IYabcoyj8JJOz6EczStvvQe0Q658nk0snBQr1ndJtGsX0Eag/gevnbFu4qQsoRmhptEJ9vJ5J9aOK4/yVciAVaQvh9PuQlElA58iuW9Xp0TcAC2QSVFtHX4/FzYGkdQuUWNO9enVHB6LrXXotL+tO8w4ZEjzN2i5UpDK9wXll1Ie+LalYf01W5BqX1lYBHkett7f9DzHmHBOiUicLIXCzpdAhUSnMrxiNOcbJkrdeFUNADTtF/BunsHH4aE/xh7WcLCZa8j0Sj5wAPC471TsaotjZS+lZfyThjbXZtH0A8cTh2brx+rwgTxtCw/eW37yqEzQ4g2SQ42IBh+wI2/SY8oDerOSewG1IpxOSK7cVrx/gDPNehKOROkufIEzbE6kRNUGiPNW0GfFTmR4jZ+w9Z4F8w1LrxNCI6cQu9XZzVdnrFeoFpNOdFTVvrXGcv5TVzwnO3HVorjlt4/Pgj+oCjR8k7YECIF42o/ni0rude2zJQo0J/8ijqsPD+wHAqzc9FtSYVxNGSD9JP0TIHOcQKdFZLjSF0jaN4Zs4CcPfFrD6UredrP+UPb26ZlXV713sB/HoAgGu0KGPmzgN6N5SRXULh96e8ME9Q/FS+KLPAtppXJoVQA0ag==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(376002)(136003)(39850400004)(451199015)(8936002)(83380400001)(4326008)(8676002)(66556008)(66946007)(7416002)(5660300002)(1076003)(66476007)(44832011)(38100700002)(6506007)(186003)(26005)(6512007)(2616005)(38350700002)(6666004)(316002)(86362001)(2906002)(110136005)(36756003)(54906003)(41300700001)(478600001)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?IQn2z/riFiqYhvFutRcFiawoYBxvGmeb/VbV9XWBy1XAEjG3Im1NHCElum6r?=
 =?us-ascii?Q?AC44Vl5BH73RH7/cuPlFDLVZYs7Q7lSIO1Exb4YDUMhVUSUmgaSKGpFLiwsY?=
 =?us-ascii?Q?SR0N2bSkLbnP0c5hhhO2TBTovZ1//+KZKxI7AsfB7lWXHan4jigLyWySVrAe?=
 =?us-ascii?Q?mDR1F1ywiZwkkdeWmyOULFv+vzCs8OMctakhjLmByCNcjxoZJ0iC/xrHIQTP?=
 =?us-ascii?Q?cDG82QNdLYLjKCseqaiR2ih9ZzY5v5JCazkmXpzC18tjyB/DZznFgH30zNZI?=
 =?us-ascii?Q?ZQk/aYZA1Q2zqASWdsjg9F3G3mRA4MFIwvvhKSksP6Ga3M9OS3ZiYh0hK1Qb?=
 =?us-ascii?Q?7EpmD+9aYZi17c7n6Na326913em2Taofkh/5QtKUqS0iqKGCpTxRnNOXZX5R?=
 =?us-ascii?Q?3MnpyQ6r8AyTEpoLBy85PmABR86/fWMPBix6Q/Y3mnXou3hT2zp6D757c1Vl?=
 =?us-ascii?Q?0vXJQb+XYdwM5bgZ7eTbkBhzuK4wfB24119AtNMIBRvEf8l/qBLnYisMmpdw?=
 =?us-ascii?Q?5CARikq7+ox1xtWfQnIC1MwxyM7CfaMUUeJdo55ti27G3iWvaPm2NlJ2Q0au?=
 =?us-ascii?Q?oNREX56Y9sOh4Rbxb5aX81LPed7GeMA7FFMBtJ+F58C1k9V4PKUgTNTYXYrS?=
 =?us-ascii?Q?F+RFSevjS9xgJGPlKIGVmvsO8p7TA7PxValXQAZpabKsjxAan9a27qnWichh?=
 =?us-ascii?Q?xPBFzoGEjW/QdSxOtfOYQnYlvBkSQ9NRnuo5pp3Hd7CxtApfgp1pMQNseNZ3?=
 =?us-ascii?Q?nnRxpgohaAdjDUqCVyzfGHDnt6/7XZAdBIkpWK5RwksO8NZcvOssWAquHeJ+?=
 =?us-ascii?Q?FsO0qAeeKo0jOATpHH8m8C6aJsKrunjMqxar/rk4q91fORf8gqfHSK0aiTvT?=
 =?us-ascii?Q?94Oxn0roecsvpaPEQ5+zj1OgKReJjh9n12pHErDeRv6IkrsiqjhnhGoFkx1/?=
 =?us-ascii?Q?qUT/sLyiRz2j1SMdmU6dFtDh5+J70FhJuClcFL3O2bZ4Hg6BC26C/5BKxbBg?=
 =?us-ascii?Q?F+NBUJKb17igUMYwKiVXnPiki3Ubo8iIE3/sJ9XhKCL8089/J/euHh2xD2qS?=
 =?us-ascii?Q?yMlzw6girxXFvVaNodc/UjmqdcpvV9JqcRCxPsulcF0wegGeY0fWfiiZQFRY?=
 =?us-ascii?Q?PpM7/vtF7ATXQOnH/IqkF/Fgq8V1tWLNRJqCYfwtrl/maTZiBsWtfXHKlov0?=
 =?us-ascii?Q?ZK1dP/rfaISW37LnMvSYt8vhtCCH7Tna/5YbyV47fUFLcZf8WdKDMetVHAiV?=
 =?us-ascii?Q?Lqqd0hqKmWwUa3e78x3SzxFCGPC7bQx0S5ezRKRHMXPhRWlM5TmD0jeyWUR1?=
 =?us-ascii?Q?LeIKNW+IB5yoUaVzH05+W13Rk0xaFtIyZHtOSyiG2VVcdP0WLzt2jbTahvoX?=
 =?us-ascii?Q?wHgBx+1kveSPBdzDjFBma3mlAkqW8ZYLCCLYiSF7n+cYzJM11IvRs4OuQdYo?=
 =?us-ascii?Q?m+kMpOjI4Y15IV5rkpomu3GP4jC+Hc9U+IoFfxprRUYXx66JnIC167gP76Zc?=
 =?us-ascii?Q?L9Zq+4U/A6fHklB+qVwz9rI3kHwPdNKmBaeP63F31DoiDXB/Fj/UovtunDtN?=
 =?us-ascii?Q?0y6U2Lw98kZ2am61kzIqB2Wa5sRaGfwPiIQu1MN21XeUfMa/l6/VA+vfblyG?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d837e351-1421-43ec-a52d-08dae9f9158b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 00:02:04.4573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NTAdwW0JnTRUlQF+sYEUAa2M+mLwEqrTkLG9ypUk0roXv+xHS6US7f5EMOQMBQkgWwidYNsYBLOSriHCBmCfg==
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

The internal PCSs are not always accessible during boot (such as if the
serdes has deselected the appropriate link mode). Give them appropriate
compatible strings so they don't automatically (fail to) probe as
genphys.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

(no changes since v8)

Changes in v8:
- New

 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 30 ++++++++++++-------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index ecf9d830e36f..3f7536ed2ced 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -823,7 +823,8 @@ pcs_mdio1: mdio@8c07000 {
 			#size-cells = <0>;
 			status = "disabled";
 
-			pcs1: ethernet-phy@0 {
+			pcs1: ethernet-pcs@0 {
+				compatible = "fsl,lynx-pcs";
 				reg = <0>;
 			};
 		};
@@ -836,7 +837,8 @@ pcs_mdio2: mdio@8c0b000 {
 			#size-cells = <0>;
 			status = "disabled";
 
-			pcs2: ethernet-phy@0 {
+			pcs2: ethernet-pcs@0 {
+				compatible = "fsl,lynx-pcs";
 				reg = <0>;
 			};
 		};
@@ -849,19 +851,23 @@ pcs_mdio3: mdio@8c0f000 {
 			#size-cells = <0>;
 			status = "disabled";
 
-			pcs3_0: ethernet-phy@0 {
+			pcs3_0: ethernet-pcs@0 {
+				compatible = "fsl,lynx-pcs";
 				reg = <0>;
 			};
 
-			pcs3_1: ethernet-phy@1 {
+			pcs3_1: ethernet-pcs@1 {
+				compatible = "fsl,lynx-pcs";
 				reg = <1>;
 			};
 
-			pcs3_2: ethernet-phy@2 {
+			pcs3_2: ethernet-pcs@2 {
+				compatible = "fsl,lynx-pcs";
 				reg = <2>;
 			};
 
-			pcs3_3: ethernet-phy@3 {
+			pcs3_3: ethernet-pcs@3 {
+				compatible = "fsl,lynx-pcs";
 				reg = <3>;
 			};
 		};
@@ -874,19 +880,23 @@ pcs_mdio7: mdio@8c1f000 {
 			#size-cells = <0>;
 			status = "disabled";
 
-			pcs7_0: ethernet-phy@0 {
+			pcs7_0: ethernet-pcs@0 {
+				compatible = "fsl,lynx-pcs";
 				reg = <0>;
 			};
 
-			pcs7_1: ethernet-phy@1 {
+			pcs7_1: ethernet-pcs@1 {
+				compatible = "fsl,lynx-pcs";
 				reg = <1>;
 			};
 
-			pcs7_2: ethernet-phy@2 {
+			pcs7_2: ethernet-pcs@2 {
+				compatible = "fsl,lynx-pcs";
 				reg = <2>;
 			};
 
-			pcs7_3: ethernet-phy@3 {
+			pcs7_3: ethernet-pcs@3 {
+				compatible = "fsl,lynx-pcs";
 				reg = <3>;
 			};
 		};
-- 
2.35.1.1320.gc452695387.dirty

