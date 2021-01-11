Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1172F0E36
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 09:34:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDn7S4zYJzDqdq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 19:34:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=40.107.220.48;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=windriversystems.onmicrosoft.com
 header.i=@windriversystems.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-windriversystems-onmicrosoft-com header.b=A/2l2T33; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDn175zqBzDqTh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 19:28:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEukpzFhDG/GRcuqJkA3mavbT9MYlL0tcoMTpqdg/qhIw5sotEFWBEzi4o0oDtKKXH5Zzx1H1flQFZ+PUxZ36B6nZSXcjY0w48CuSDHwCKg6W7k02u+lZ/3g5B9th/gCojhmGXOE7uqx/YGpSMUeyuLRITz/6MiuQAgilqwPRZdSwho1OoEINmysk2xztbHNTN91kY6oZAcCaY4eJWqPiHURcQcQW9hFSDMH9xk+fuQvTb2cdpXTXpogYsu3IzcZ1bwYUvbMYV6soYgif/51TVOofrRlY1n3oj6ioSys9xGiXm83cVyD33wgtMY6GzdF3Gr+hkaS9Bz83pNhCgcRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5Qi9Gzq9gDM/g4xSz0WhDs/3ElWlwljmLdK9rp8RAo=;
 b=fn8xrQSSSz3qna1NR7cy3CkSZmbMbjzKaG58ZvIfENzTKJWx7FDLmpw3cUMqs31ijse9nUvHXW2clnRdcVZsqM4HWKjK2B5QgySfsGCLHN14mm4KQPo/09zv7ucnh4LvaKWqRcfy44FDCtR7M49TelmHt8X2GwgQVflBbo2JcxZtOTo+sQbfbY3wArkIxXnDFwPYNWL48BDHvgZjHX/qFJdW8YqzjyutGXy3VecCIDvIhkqOANBmMkYBRQoXvsOPMyc125u9dwWoUQlO+FHNgrKig2AdytvyQxzDuv8ncpgn92kGcUTOn8x1vuT0iExEgX2tRi6w10mxPoanBknSpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5Qi9Gzq9gDM/g4xSz0WhDs/3ElWlwljmLdK9rp8RAo=;
 b=A/2l2T33pCWZCUhv5SkuQL0Jojh2axUH8yCERZlW0g8lSDccuHnEcDhjgEDUV+FYVgi2Atdcl4KyAtDaqFQ9O+A4EI/7hHoUXtKGb1wlCQJ0zTZ9L5ldTmA6JlNKp97a2DzJp0qImVMq8r6jQq5v1nZ3c/zDTRu7xXda2DHp1gg=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM6PR11MB4740.namprd11.prod.outlook.com (2603:10b6:5:2ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 08:28:51 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::87:8baa:7135:501d]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::87:8baa:7135:501d%6]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 08:28:51 +0000
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc: retire sbc8641d board support
Date: Mon, 11 Jan 2021 03:28:22 -0500
Message-Id: <20210111082823.99562-3-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111082823.99562-1-paul.gortmaker@windriver.com>
References: <20210111082823.99562-1-paul.gortmaker@windriver.com>
Content-Type: text/plain
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::49) To DM6PR11MB4545.namprd11.prod.outlook.com
 (2603:10b6:5:2ae::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-pgortmak-lx2.corp.ad.wrs.com (128.224.252.2) by
 YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 08:28:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccef5e5c-9e91-4bcf-06ed-08d8b60aecbd
X-MS-TrafficTypeDiagnostic: DM6PR11MB4740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB474060994F6B194CE20DBA8B83AB0@DM6PR11MB4740.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2X9QnAXU5alI7k8uUwf/UAWxISJWl2ahytEtaofIi+H9nQfMjmfEIiPlZYj0v6Q/qkVXMeIA1K2Z1rm0TAjRxWFwx32qxEP5U/JAnkjvHLl92W2DOIxbrwUsyl2BLJr2aGDty5VI6a4l291Z3m37e/bnb5E8pOz9iDPLHXW7ybPXyOnM9GHNgPd+0GXBAhqopjxBJPeyT77NU93R0yFdxXsSSZlmvB4fSWBf5If8qPrdJYHu9ZUAij752FZvO/I0IPWheplP8TVDVXAnh6VkF3ABFoJcuQHERWD13uUFcKCxm81lWLXD92bM/FYhZlRyrOELI50eO1GmkhUTIpFcErboqX9iEYd7LjHNy6vyCc9hiozkmxa3eZOWe0I9HZxc+OH/mMOleylOxYqMFBSd6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(366004)(396003)(136003)(26005)(186003)(54906003)(2616005)(6506007)(16526019)(6916009)(44832011)(86362001)(956004)(478600001)(83380400001)(6512007)(36756003)(6486002)(66476007)(66556008)(1076003)(4326008)(5660300002)(8936002)(52116002)(66946007)(8676002)(2906002)(6666004)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?N3jKYvch95cqMJ/KoagR7P62Cn7MtdPNmM63DtPM+Zh7FsVgeSocjaMF+ALe?=
 =?us-ascii?Q?pDkaarBCnOXIKc43lZVs7Abw3bGPpoIcvcB8YMdYOcxJxP7fcRs3SM0Q2pJ9?=
 =?us-ascii?Q?ooQk/qV6on6rSO1d5NA23GBkDMi8XWjRPOLi5WIJU8ZLM4HfQ6Xiqznvrem/?=
 =?us-ascii?Q?lFcOBbi2WnI7/Mk/kPmf0XvqlS8ChO+sIpWl6nyhtcobJZrFCWcgOfkx6GlG?=
 =?us-ascii?Q?Ggms9AH8BEFcawkBTwsyQGshqrZSvdkhdjMDnQ5Ohv4R1Iizgo6lsD8oMtfa?=
 =?us-ascii?Q?KLZ1QKuHr09uOFxktCeUDpd2HmCy7rgdvYoe3/nHTp9Z7M4d/qzTb1VwoBLL?=
 =?us-ascii?Q?N3xigHBtjhSLPPTuxVrSdUvWwgBF45MWTR54txZN0x9+E1p7x/VEuyM4iUj7?=
 =?us-ascii?Q?lDUVkvPkoG4LsyO3B9K0nEXgkQv9D6qWcMkYaJMph+TTgKwoGKbSUqW+TEn/?=
 =?us-ascii?Q?ODEmw9pBhLTy5gR0vN2SbwGrWrnlzYpQ0ikTSWj907J4aFWZjyKAL2y1MMjh?=
 =?us-ascii?Q?GcRHFhOQe+TaAE5Vk2loFkg5v8mqwO44OumT9Sqr2rqWOelZUf+A88JB/PfL?=
 =?us-ascii?Q?TilFftdDeLd1HKQ1l2sUkswnkMag1Q10WCK2nnyNBXM3PuaAyKftsNH8nLsz?=
 =?us-ascii?Q?Pg10H4NIVs1sw3FZ8idtEwg7uoDlVaqIhe7F4vfxNuL8/pYDaNVPtVi8JCdf?=
 =?us-ascii?Q?+VIgHtOy+GNkWreHRsYjanakCixhWt7IABNaUvq3XZyLPewx3dKwF4d4d7ZF?=
 =?us-ascii?Q?U/0Bz+ItzfGBpXK3d7iH8znwDO0lz4p4sz+9i1fgo/7lp4Lr3j5jn8yB2gkd?=
 =?us-ascii?Q?pTqglcw2o19oZ1rW+6kSd31E3i9J4r/JLgcBi0wWFh2+rg/JZsziKg8kzPo9?=
 =?us-ascii?Q?ybBUF2yjlRv0Ch00ztkALXBbGvN30iCv2ugcwf1paWzE9XvUoBEiyChjdBwX?=
 =?us-ascii?Q?RAcAHrddcG1bugAuh6EMI4kE+rrC7ffPknwei2KUkYeYzpcassy1hd0AqwDB?=
 =?us-ascii?Q?sbyz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 08:28:50.9539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: ccef5e5c-9e91-4bcf-06ed-08d8b60aecbd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eg9u8Offhjc1OMcmIdkWVH0HkV2FewVPt3tFrqEVij0d/k7APrhbtkXOVrcj6ymO0yDC32OrP1wcQqbp86VdcU43X9y53dxzqNNQMjA9g5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4740
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
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The support was for this was added to mainline over 12 years ago, in
v2.6.26 [4e8aae89a35d] just around the ppc --> powerpc migration.

I believe the board was introduced shortly after the sbc8548 board,
making it roughly a 14 year old platform - with the CPU speed and
memory size typical for that era.

I haven't had one of these boards for several years, and availability
was discontinued several years before that.

Given that, there is no point in adding a burden to testing coverage
that builds all possible defconfigs, so it makes sense to remove it.

Of course it will remain in the git history forever, for anyone who
happens to find a functional board and wants to tinker with it.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/powerpc/boot/dts/fsl/sbc8641d.dts   | 176 -----------------------
 arch/powerpc/configs/mpc86xx_base.config |   1 -
 arch/powerpc/configs/ppc6xx_defconfig    |   1 -
 arch/powerpc/platforms/86xx/Kconfig      |   8 +-
 arch/powerpc/platforms/86xx/Makefile     |   1 -
 arch/powerpc/platforms/86xx/sbc8641d.c   |  87 -----------
 6 files changed, 1 insertion(+), 273 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/fsl/sbc8641d.dts
 delete mode 100644 arch/powerpc/platforms/86xx/sbc8641d.c

diff --git a/arch/powerpc/boot/dts/fsl/sbc8641d.dts b/arch/powerpc/boot/dts/fsl/sbc8641d.dts
deleted file mode 100644
index 3dca10acc161..000000000000
--- a/arch/powerpc/boot/dts/fsl/sbc8641d.dts
+++ /dev/null
@@ -1,176 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * SBC8641D Device Tree Source
- *
- * Copyright 2008 Wind River Systems Inc.
- *
- * Paul Gortmaker (see MAINTAINERS for contact information)
- *
- * Based largely on the mpc8641_hpcn.dts by Freescale Semiconductor Inc.
- */
-
-/include/ "mpc8641si-pre.dtsi"
-
-/ {
-	model = "SBC8641D";
-	compatible = "wind,sbc8641";
-
-	memory {
-		device_type = "memory";
-		reg = <0x00000000 0x20000000>;	// 512M at 0x0
-	};
-
-	lbc: localbus@f8005000 {
-		reg = <0xf8005000 0x1000>;
-
-		ranges = <0 0 0xff000000 0x01000000	// 16MB Boot flash
-			  1 0 0xf0000000 0x00010000	// 64KB EEPROM
-			  2 0 0xf1000000 0x00100000	// EPLD (1MB)
-			  3 0 0xe0000000 0x04000000	// 64MB LB SDRAM (CS3)
-			  4 0 0xe4000000 0x04000000	// 64MB LB SDRAM (CS4)
-			  6 0 0xf4000000 0x00100000	// LCD display (1MB)
-			  7 0 0xe8000000 0x04000000>;	// 64MB OneNAND
-
-		flash@0,0 {
-			compatible = "cfi-flash";
-			reg = <0 0 0x01000000>;
-			bank-width = <2>;
-			device-width = <2>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			partition@0 {
-				label = "dtb";
-				reg = <0x00000000 0x00100000>;
-				read-only;
-			};
-			partition@300000 {
-				label = "kernel";
-				reg = <0x00100000 0x00400000>;
-				read-only;
-			};
-			partition@400000 {
-				label = "fs";
-				reg = <0x00500000 0x00a00000>;
-			};
-			partition@700000 {
-				label = "firmware";
-				reg = <0x00f00000 0x00100000>;
-				read-only;
-			};
-		};
-
-		epld@2,0 {
-			compatible = "wrs,epld-localbus";
-			#address-cells = <2>;
-			#size-cells = <1>;
-			reg = <2 0 0x100000>;
-			ranges = <0 0 5 0 1	// User switches
-				  1 0 5 1 1	// Board ID/Rev
-				  3 0 5 3 1>;	// LEDs
-		};
-	};
-
-	soc: soc@f8000000 {
-		ranges = <0x00000000 0xf8000000 0x00100000>;
-
-		enet0: ethernet@24000 {
-			tbi-handle = <&tbi0>;
-			phy-handle = <&phy0>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		mdio@24520 {
-			phy0: ethernet-phy@1f {
-				reg = <0x1f>;
-			};
-			phy1: ethernet-phy@0 {
-				reg = <0>;
-			};
-			phy2: ethernet-phy@1 {
-				reg = <1>;
-			};
-			phy3: ethernet-phy@2 {
-				reg = <2>;
-			};
-			tbi0: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-
-		enet1: ethernet@25000 {
-			tbi-handle = <&tbi1>;
-			phy-handle = <&phy1>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		mdio@25520 {
-			tbi1: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-
-		enet2: ethernet@26000 {
-			tbi-handle = <&tbi2>;
-			phy-handle = <&phy2>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		mdio@26520 {
-			tbi2: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-
-		enet3: ethernet@27000 {
-			tbi-handle = <&tbi3>;
-			phy-handle = <&phy3>;
-			phy-connection-type = "rgmii-id";
-		};
-
-		mdio@27520 {
-			tbi3: tbi-phy@11 {
-				reg = <0x11>;
-				device_type = "tbi-phy";
-			};
-		};
-	};
-
-	pci0: pcie@f8008000 {
-		reg = <0xf8008000 0x1000>;
-		ranges = <0x02000000 0x0 0x80000000 0x80000000 0x0 0x20000000
-			  0x01000000 0x0 0x00000000 0xe2000000 0x0 0x00100000>;
-		interrupt-map-mask = <0xff00 0 0 7>;
-
-		pcie@0 {
-			ranges = <0x02000000 0x0 0x80000000
-				  0x02000000 0x0 0x80000000
-				  0x0 0x20000000
-
-				  0x01000000 0x0 0x00000000
-				  0x01000000 0x0 0x00000000
-				  0x0 0x00100000>;
-		};
-
-	};
-
-	pci1: pcie@f8009000 {
-		reg = <0xf8009000 0x1000>;
-		ranges = <0x02000000 0x0 0xa0000000 0xa0000000 0x0 0x20000000
-			  0x01000000 0x0 0x00000000 0xe3000000 0x0 0x00100000>;
-
-		pcie@0 {
-			ranges = <0x02000000 0x0 0xa0000000
-				  0x02000000 0x0 0xa0000000
-				  0x0 0x20000000
-
-				  0x01000000 0x0 0x00000000
-				  0x01000000 0x0 0x00000000
-				  0x0 0x00100000>;
-		};
-	};
-};
-
-/include/ "mpc8641si-post.dtsi"
diff --git a/arch/powerpc/configs/mpc86xx_base.config b/arch/powerpc/configs/mpc86xx_base.config
index 67bd1fa036ee..588870e6af3b 100644
--- a/arch/powerpc/configs/mpc86xx_base.config
+++ b/arch/powerpc/configs/mpc86xx_base.config
@@ -1,6 +1,5 @@
 CONFIG_PPC_86xx=y
 CONFIG_MPC8641_HPCN=y
-CONFIG_SBC8641D=y
 CONFIG_MPC8610_HPCD=y
 CONFIG_GEF_PPC9A=y
 CONFIG_GEF_SBC310=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index ef09f3cce1fa..e5823a8bf856 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -56,7 +56,6 @@ CONFIG_MPC837x_RDB=y
 CONFIG_ASP834x=y
 CONFIG_PPC_86xx=y
 CONFIG_MPC8641_HPCN=y
-CONFIG_SBC8641D=y
 CONFIG_MPC8610_HPCD=y
 CONFIG_GEF_SBC610=y
 CONFIG_CPU_FREQ=y
diff --git a/arch/powerpc/platforms/86xx/Kconfig b/arch/powerpc/platforms/86xx/Kconfig
index 07a9d60c618a..be867abebc83 100644
--- a/arch/powerpc/platforms/86xx/Kconfig
+++ b/arch/powerpc/platforms/86xx/Kconfig
@@ -20,12 +20,6 @@ config MPC8641_HPCN
 	help
 	  This option enables support for the MPC8641 HPCN board.
 
-config SBC8641D
-	bool "Wind River SBC8641D"
-	select DEFAULT_UIMAGE
-	help
-	  This option enables support for the WRS SBC8641D board.
-
 config MPC8610_HPCD
 	bool "Freescale MPC8610 HPCD"
 	select DEFAULT_UIMAGE
@@ -74,7 +68,7 @@ config MPC8641
 	select FSL_PCI if PCI
 	select PPC_UDBG_16550
 	select MPIC
-	default y if MPC8641_HPCN || SBC8641D || GEF_SBC610 || GEF_SBC310 || GEF_PPC9A \
+	default y if MPC8641_HPCN || GEF_SBC610 || GEF_SBC310 || GEF_PPC9A \
 			|| MVME7100
 
 config MPC8610
diff --git a/arch/powerpc/platforms/86xx/Makefile b/arch/powerpc/platforms/86xx/Makefile
index 2c04449be107..5bbe1475bf26 100644
--- a/arch/powerpc/platforms/86xx/Makefile
+++ b/arch/powerpc/platforms/86xx/Makefile
@@ -6,7 +6,6 @@
 obj-y				:= pic.o common.o
 obj-$(CONFIG_SMP)		+= mpc86xx_smp.o
 obj-$(CONFIG_MPC8641_HPCN)	+= mpc86xx_hpcn.o
-obj-$(CONFIG_SBC8641D)		+= sbc8641d.o
 obj-$(CONFIG_MPC8610_HPCD)	+= mpc8610_hpcd.o
 obj-$(CONFIG_GEF_SBC610)	+= gef_sbc610.o
 obj-$(CONFIG_GEF_SBC310)	+= gef_sbc310.o
diff --git a/arch/powerpc/platforms/86xx/sbc8641d.c b/arch/powerpc/platforms/86xx/sbc8641d.c
deleted file mode 100644
index dc23dd383d6e..000000000000
--- a/arch/powerpc/platforms/86xx/sbc8641d.c
+++ /dev/null
@@ -1,87 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * SBC8641D board specific routines
- *
- * Copyright 2008 Wind River Systems Inc.
- *
- * By Paul Gortmaker (see MAINTAINERS for contact information)
- *
- * Based largely on the 8641 HPCN support by Freescale Semiconductor Inc.
- */
-
-#include <linux/stddef.h>
-#include <linux/kernel.h>
-#include <linux/pci.h>
-#include <linux/kdev_t.h>
-#include <linux/delay.h>
-#include <linux/seq_file.h>
-#include <linux/of_platform.h>
-
-#include <asm/time.h>
-#include <asm/machdep.h>
-#include <asm/pci-bridge.h>
-#include <asm/prom.h>
-#include <mm/mmu_decl.h>
-#include <asm/udbg.h>
-
-#include <asm/mpic.h>
-
-#include <sysdev/fsl_pci.h>
-#include <sysdev/fsl_soc.h>
-
-#include "mpc86xx.h"
-
-static void __init
-sbc8641_setup_arch(void)
-{
-	if (ppc_md.progress)
-		ppc_md.progress("sbc8641_setup_arch()", 0);
-
-	printk("SBC8641 board from Wind River\n");
-
-#ifdef CONFIG_SMP
-	mpc86xx_smp_init();
-#endif
-
-	fsl_pci_assign_primary();
-}
-
-
-static void
-sbc8641_show_cpuinfo(struct seq_file *m)
-{
-	uint svid = mfspr(SPRN_SVR);
-
-	seq_printf(m, "Vendor\t\t: Wind River Systems\n");
-
-	seq_printf(m, "SVR\t\t: 0x%x\n", svid);
-}
-
-
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init sbc8641_probe(void)
-{
-	if (of_machine_is_compatible("wind,sbc8641"))
-		return 1;	/* Looks good */
-
-	return 0;
-}
-
-machine_arch_initcall(sbc8641, mpc86xx_common_publish_devices);
-
-define_machine(sbc8641) {
-	.name			= "SBC8641D",
-	.probe			= sbc8641_probe,
-	.setup_arch		= sbc8641_setup_arch,
-	.init_IRQ		= mpc86xx_init_irq,
-	.show_cpuinfo		= sbc8641_show_cpuinfo,
-	.get_irq		= mpic_get_irq,
-	.time_init		= mpc86xx_time_init,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-#endif
-};
-- 
2.17.1

