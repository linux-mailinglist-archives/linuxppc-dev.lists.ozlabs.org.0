Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712D15ABA49
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 23:41:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKBF42Bhsz3dq8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 07:41:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=olKQ+Lnq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.66; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=olKQ+Lnq;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKB9660YJz303G
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 07:38:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejV9JGaMpbTGvQN9KqcPScz90Xa2rXR0hWsey7LHKCUjBt6IiGa5BgyfQWumWiNkLU3lhoWRv4XVHfTgtrKAcfCVlzkoiNylucdkzdV0p4skG8hDFxWIfTst4EhrcWjIgpUBywK/XKyvWhPfDdXaeJKFDMZVRQN0kVM/N9udvvgrhNuqhCflS6iMMttXkAHtiwEgbPurJJ8+zznJ1Mxl+12IWuaXKLbzlNM3iixe4Nc6B3osUulhNmh81E+xibtDleKONYsLaooFyJ3+fCapwtZauEWPPwLA1TH+L2O2zQ8UkNbK3a9jxqdZwtFHX7SyQ7zgQq52wLaSt7UIe4lJ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McHAhMqdWVMftPgZ9YQfhd8ST3HoArae8A3a5CupPo0=;
 b=mFQelRZ7aBV/0RUeR+vu28kEkbrzoBGw1HKTGSxst/ixI0Br61sHcCasWBdkIhOmIeK1x299DxvryypbSRohuU8+hJK1wpLryGr0kqkmijCaTkWvgAK/rJL7FtMVKAbf+EKq+G2hNYsjQJsokryAEmYoP2ON+4HSL0b+JB4wXlDCB4sa8dNqnok4yP7tqJ/p0o3t51OhkRKyV+9P+2hka+KwVy2YqJeGLTdUL+LOEDrXU1mYEROEvEFrcKl8Bn9EoSpGFMfxZpc31t6LI+o67vE2VH49ZJdRJbRF6QOcL8QB3Sr1uhDwInEmjM6CGWYewU5jjeTe4egn7Jmw+aJGNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McHAhMqdWVMftPgZ9YQfhd8ST3HoArae8A3a5CupPo0=;
 b=olKQ+Lnqwrusn8m+rAnXw8uqXatznDULm59CHIOEwZN/YG2USczXyaO37Cq6GmePQloTV+J0pP0zmBOGuYxG/wVaXL+ymuZWzTVzB704RKgAjDnbjx7oDsfvGtxgl6M3Qap67KHiQkL2ZtvAA3U1gDi2S5zATjv9z3g1JJ8JH3gIexGsZfLOBEVqakTdCVj1AWlcTeJoCWftd8EdTbgJ0/bs7uJhGg2QpSkRtNw6v7FBDc1eVrssCG1CqeF/WPpKgjaCB2VbjN98anXNfx3mnov76mLoAE82TFWyx/ABIUUafxQ8fAqefwb3YvwsqOGVUnndWptMQj7Iq/pkvDDdPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by PAXPR03MB7886.eurprd03.prod.outlook.com (2603:10a6:102:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Fri, 2 Sep
 2022 21:37:46 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5566.019; Fri, 2 Sep 2022
 21:37:46 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 5/8] arm64: dts: ls1046a: Add serdes bindings
Date: Fri,  2 Sep 2022 17:37:18 -0400
Message-Id: <20220902213721.946138-6-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220902213721.946138-1-sean.anderson@seco.com>
References: <20220902213721.946138-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:208:239::13) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc5a23ff-270c-434b-3fa4-08da8d2b6068
X-MS-TrafficTypeDiagnostic: PAXPR03MB7886:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zROlEATGDkAwEk+dJ8NNpbE8OJDwtvVk74BofOC7bPYcURGTQBf5q8TJVBOrnAWj80U780qECU7N4mk+e1U03VLgWGCNzGxiukiSjOecdYYE4VOyrEDfPy71Efgj/193/yMMR4xnPIexGGTYbwyNtOr0S4iQBwiNtMMW1flUn38Bju7lR7Z6o8c37Xn4CPu2SynDpBTnawojbuIdRRI7ikWcHUclUpu52x0gbyzldZ9GHsRjvpNd4L2fR+eMhxiNupUQy44VjliFrOkqVQy2PuRSAOoemLTEZWYbN+OoLLGg0Ysg4F/ydpvPxQhOHsOFejAHl1MMLdMerVsirlzg4yZl39+FpvWVsi6uy76+JCWsgbSGQ+zLdQOPBtqHNe6nSBeA9bZVySxP7Sk5AL9f4kmZrb9Mq7NmWc4gwmkB++y525irkNn09hmPYuZIVVuUSmzP/kSSqgoRCnGmDiixfuVMdoQrhHezwof1DT5ny6JYZTUV+AP249iSFYy+KieAo1xbIcKP+BfM7iK3NKlNIpUD5kCGnHH4cO9EaUA6nHux4cE2Zv2MncVNjPvpD5ZZSD9ImfS55lcIHHxwVxkaMiRlqK9ExwpPRuUyL6erGZWkdDkzbbtgvGBpZYb4O2l0dpdKEfIYebzW8UF27INalVx7NZzxSayOdYyh6tBpTG2RDSXcsAtWxTQwShOseMn5b40aQHSYDYMe+KNw2fkyJvOAjAU4AajYwtKgNAc2CgcdsMWG2CeT4DsMRzSzBAgi
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(376002)(39850400004)(110136005)(54906003)(38100700002)(316002)(36756003)(186003)(1076003)(38350700002)(2616005)(86362001)(6486002)(8676002)(4326008)(66946007)(66556008)(83380400001)(66476007)(2906002)(52116002)(6506007)(6512007)(26005)(8936002)(5660300002)(478600001)(6666004)(7416002)(41300700001)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3vi4GlYqs2kGel1Kv0kAuZJk2tLR3w40GRqfqERLgttdTDpBWp8ydx2dSCHe?=
 =?us-ascii?Q?OQNOXPMfFdbwM/bKymGn2C2nbNF/W2Nj0//BEB43aFs/aa7Fb3p7ax+z10b9?=
 =?us-ascii?Q?/5LUhoJbBDT8ENWlqOpyJHUvth1MzoG97hD/f5DcGDsRbsKx66YEB4ZYx++E?=
 =?us-ascii?Q?uHlM416yjGRzKBEwiuq6TXdyGZFBGiyOZIwcx2ip5BJkowxlSdfZPOhYJUOi?=
 =?us-ascii?Q?7P5SxPUIN76YAbmKzwuCvyEKbJA1aNJHVswRCIAm4yZhJR6w/hYnL2SzNNdz?=
 =?us-ascii?Q?YgRP5m9v4tVk2gdn7rXsdToKRFOwVTsIUPBC14MoL/OGSH/rsATJxTgvyugr?=
 =?us-ascii?Q?6tgtd6GgaaCtAcTsE+fNpf2O7jBSnB2lhoO2Yg++mGGO01jeUOc7Oqevrmff?=
 =?us-ascii?Q?qA7PTOvJHATomfw6j/gjHLUgxgcomRaskPc/kRRSb5sTLMBVTjCFDdI6h2kT?=
 =?us-ascii?Q?7mgF+5YI49U3FLLHQVnjTo1rc8Aro92xf++ehOXXh1BBFMCfoWEu4vyODIj3?=
 =?us-ascii?Q?/q7B1AFF55tnFcagDCz+2VS3+uAPrjM+ZusQyKpD5nOxxT+oq/Y38lgNvlW7?=
 =?us-ascii?Q?Vrmz/q0iy10d5TCD4/OS7C3y9Du3UHBOeRQtSmXj11lHPmLLsgns9o8qxxFB?=
 =?us-ascii?Q?+a+vlnr9Q9if+c8+f37Tg8bx3u08efmIMkRQ9r8HEZOi9pJwzhfBYPwHSyRx?=
 =?us-ascii?Q?+astMtQoCXFWIuFAi3J+lfe/qlB9UQYfjs148yQJ4pzgIaP+XbbsCWV+lIH+?=
 =?us-ascii?Q?twCdVotU0cYqvPFOb2SZme9S903WHLYED4KUuUwRn5EKhl0WcZI4u1t0iEn8?=
 =?us-ascii?Q?DV3dVz4gg2ZIp4FHZVUEOhuh2g5RZIMwq8QEeKsxEd0q2su9kjSeAyhkAKP0?=
 =?us-ascii?Q?4cE1Y3+o7/K9qzb7uRRR1zfwjYwpiq4+0kbdH5Bg+MhOJvLEsiWasuoPd5Ne?=
 =?us-ascii?Q?8HdTskgdPOBvOfdU6CI/x22kWMOCFPl/nb9sCMKnbuM8z/C7J2FgXzZm5ke+?=
 =?us-ascii?Q?vMgJw+0SubW9l3mNZ+AqvUldJ/YQXs9Aon6+hxngLjYQ3TKFBTCS4wNLF3IC?=
 =?us-ascii?Q?UxVnZpHIQoKwUrfbgQ6i/Wc7/54grBMhDxKvimnbw14WGf+VRws2ZjAMKrYR?=
 =?us-ascii?Q?MgFEwl3ryJ9cm0Zca06k8Q652eS267CtnJ4jSHrwRo+F6yS3zsUU43bEeKLm?=
 =?us-ascii?Q?BoPJRMDroBV0ET/CS4TWwJBMQkFvj8Oig2hplaL5VEZZvFsJrK5uijnHSFeP?=
 =?us-ascii?Q?DIQjrUFZPaSsD1UDxcC5I4TleR8VXIKGO+sF7tXtUcKUA/j36SRbzbBsJymW?=
 =?us-ascii?Q?fhGqtexNUZrnx9pAJzfo238/8jmydDmAazS44hgZOx4/md4KeRTzdx5hsM7L?=
 =?us-ascii?Q?V4Y0dt1FFd+SJH2Q4Egp/7CHwcgGk7RdsRg06C0fU7tD7J2RfzTtgz2rk+pV?=
 =?us-ascii?Q?NXB0awsXTWjV19bOEzkx/FrttU7gCE/AhmFjRX37RcYRVt3q2PbLncfBH1vq?=
 =?us-ascii?Q?2vMbMl+zvCJ8igRSl7pCtvOyQuGA+xr5Ygw5EC9DK8qdvr1Ml5Oe7msGxheY?=
 =?us-ascii?Q?1BazqkOyfLJ5+8wWdk43wKrKYw+N9bSgapwcQYXIzgLwrxhA/cYfOEnA9mcw?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5a23ff-270c-434b-3fa4-08da8d2b6068
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 21:37:46.7995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGZAeSRVobj8FjV40ZM2GKen0jr9J368wYLoUK4oIt9l4w1VvpIytEFV8SHH0b80DOr6L4rkNsdUvAbnzG5P3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7886
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
index feab604322cf..48d81c6e1cfb 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -421,6 +421,24 @@ sfp: efuse@1e80000 {
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

