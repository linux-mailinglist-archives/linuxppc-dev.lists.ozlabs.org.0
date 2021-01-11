Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C45DF2F0E3C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 09:36:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDn9V5jCXzDqcL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 19:36:14 +1100 (AEDT)
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
 header.s=selector2-windriversystems-onmicrosoft-com header.b=js/8wjW+; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDn184CJqzDqTh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 19:29:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOcIJDqvRH2/VUxj5OEBh0CNEkFeR2KZ1g2U70SloQPMGvEbYkTNTavrC4jBmggYu5duF4ehNBt/KcRrxMfjYCvDulEZhppyL5rWBAhVETeLgLB+TXDLLunR24WtuNTktdJvV1Q0A7/xo3yFwzC8lNU2HpfYFGmHmpRmMvjcCIrauHFXQEeUqLliIHjBZkI7wFtdpIKAWA+PtXFE7rWTKn13L0PD75PPcP1NCtvSqxeM78OgRlu3msautuFqA71TEMY/bG8BwMAp4UssRStX7KbuPcNECI+H+SPvjmJJ2lhXgJ0VsQGjVJFve6+FYCGbrBCrzJqXzFSxnwsuD7TiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhgOpbqL1HxaWZVHQRRKMQfEPQZFTDg2je4zwmu1cxM=;
 b=QTcP1WWBkqAGQlv84WDhVv8eGxJa3oQXko60Q5A1CVNLi9tjGa3Nb3hQOSv94lSf7vHPfONq8nj3rOkLf0JQ0MfAVZex9hBun+0r7d503YgSRWChQWMXM6h3bg/ioFZ2ajmSQB2SofitTXzWbUoz9Ff3HxJkR4hQ02nqP9RGEqge/OIvLzFP9u4Hdg6yoF34JEtv3sw20h2GAGJzI58En1QNkxkdgl4enMQDU/mRR8mMR+aS7sA3MtWCjPFFpXyTTMoBzAGl/EuM82Q8wxgkbZDtuT3DZPiRkQ5qWfwKjfX8k0QiK2evI+y/RuUBjyn2ZFuQ2bL9RZYg2GKfjSK65g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhgOpbqL1HxaWZVHQRRKMQfEPQZFTDg2je4zwmu1cxM=;
 b=js/8wjW+H7NcYmHydR0yMiJQrb78SmrmVDFFVvaiRfFKlVU6sIAyJngW0ldi60mdTpMl9bpPaB42et/WORwg71dGHuXlsW6fhduFmbWRg6MHiMYVZZSFcG6wrrV6QEYMuFQmOzwlfIJTtrnPSdQYIOLWETrxCzv2m9nxc1bvckU=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM6PR11MB4740.namprd11.prod.outlook.com (2603:10b6:5:2ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 08:28:50 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::87:8baa:7135:501d]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::87:8baa:7135:501d%6]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 08:28:50 +0000
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc: retire sbc8548 board support
Date: Mon, 11 Jan 2021 03:28:21 -0500
Message-Id: <20210111082823.99562-2-paul.gortmaker@windriver.com>
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
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 08:28:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce210d89-55ee-4096-f075-08d8b60aec6e
X-MS-TrafficTypeDiagnostic: DM6PR11MB4740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB474012590000FA61862FA7E683AB0@DM6PR11MB4740.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o8/3Duw5QxcPrTViGYebgYCFMrlUez/apGetH2xRACQwfO84wGsXkPfMJ/SEGwQVVr1BzFEa4eG6fdun0B0gsn0OfQNmbQkIala0QB6Gx7QTkFoLJHa13vmKkUCmJBgbPsQ4nG5NBvsJR/zmDgYJkSqQXxTmcF/wE3/U0PIAf7xyNMTSo7Sj3gw6pY7Z4SkqPWOsJwBPTvX5pfR12DDhZbGxNvIM0A5gN3p9dsggWoz0vkiKrU7se8MJ/qLBrlFiBq45PbTlbteur49Uj6ZXA/y1j+QGYAlCiwe9YlU+e6ch7IdvWuzf613474doSCR64z+qHbejVVuAjAuSll/7HUh5LjjHs3YDHkenjYsdh4HmLioQISldgX+JVNVXvSE+WjVq1FUwjzXmclzFq2nOHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4545.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(366004)(396003)(136003)(26005)(186003)(54906003)(2616005)(6506007)(16526019)(6916009)(44832011)(86362001)(956004)(478600001)(83380400001)(6512007)(36756003)(6486002)(66476007)(66556008)(1076003)(30864003)(4326008)(5660300002)(8936002)(52116002)(66946007)(8676002)(2906002)(6666004)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OnWYQ0qvi975jDdmWyh5llc4LQljjWbB31P8G3MTMQcQsdB6PaXehVleeELH?=
 =?us-ascii?Q?4OMi17VlPXToUYX1gc1icWi2GM7rOoevYBeQpnWajKSFl/0e4mDp272y6qoe?=
 =?us-ascii?Q?KpOVSFDbIU9zvHCM8DCW+LU+ati4ofxSo0+EMdwIlpw018byWRvhSjMplmz0?=
 =?us-ascii?Q?44phMVQsCozs6hkZVK1S33MEZwP3ja/53jjc3HRtEWMMnUfPPv+nVWoRysfX?=
 =?us-ascii?Q?fMYPj4/hC9I7SrjA33FNj2Z/WwM99gM0s1igyKe80lvQKxbjCZ0rMHZK/a8m?=
 =?us-ascii?Q?qsKhokOm1R+fDDfZbu7kDDHxgwtpTPJYJ6Z5qewuHAGNYFlgv8NHzsInlbiH?=
 =?us-ascii?Q?zkGrXvIKRWQIrb/eHUOlFCIzstu25NZKQUohvWAnsLtmQ4BrjccwL8OemrOn?=
 =?us-ascii?Q?an3RnPq5qhlNZzerf7OeNhUqmr61j10Cq6OGghTvTYzwZhLfBRO/q1EZT1/y?=
 =?us-ascii?Q?Kx5RvFdUYyqlwU5rRFJlcOCXHlYH0pHuQmi2jhw6ItLeF/XQpKfjs8eq9wNF?=
 =?us-ascii?Q?mUz1MvR/RoEprNinPqjo6I5/qOWLyhiTDpuGdpowt0kJLaLiELj3+j8RtthX?=
 =?us-ascii?Q?tMp3/BCM59IfWmkc+lyIXoYzOVRlKla8y0VCaZ4SXqoEjls9U9l4iHVKOgXP?=
 =?us-ascii?Q?3E2T5NL+Q+TlakQMd+n2eXwpB+bI8P86SP3v+rHuKyz/loPxtFermdnuLKSh?=
 =?us-ascii?Q?0wEOnYdottqMpRNCgYwWXsvroXi64ZZ2dq+AAAK4WHyuRZ6AHGgui7zzKR66?=
 =?us-ascii?Q?LUwuI4F7iEVPnvcWIS38PIp9pK9KOc0C+bxIpOwwqFpqaahySijLeMRUoEHV?=
 =?us-ascii?Q?pZ5jUxF0MGsZRRVwd4WVo4pO6bJ3yhVAti8ll9Bjyed3IR5/7mhWt2gG2Yhb?=
 =?us-ascii?Q?32ZBwUR6R6p7XYnuGLVnOxm9QWXSx5d1GxLjW80qwipQN/DBX3+xa6Rf8YlC?=
 =?us-ascii?Q?MVl9DFYmYDZPyoIhPGrMv3+AqoRBVOujiDOJUoj+YWqVX3ef/Gg82hmI1weA?=
 =?us-ascii?Q?VVzt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 08:28:50.4312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: ce210d89-55ee-4096-f075-08d8b60aec6e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h88YZKM3R5no6/2u+JcLBTSRP37iHfVG9Q9g3v3TqIRdJEUkvRFiELlk3RnH2AcYfQDyadgPZuKle8mKidtgycWv9tCvHEb2/3HRT+Kyp+8=
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
Cc: linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The support was for this was mainlined 13 years ago, in v2.6.25
[0e0fffe88767] just around the ppc --> powerpc migration.

I believe the board was introduced a year or two before that, so it
is roughly a 15 year old platform - with the CPU speed and memory size
that was typical for that era.

I haven't had one of these boards for several years, and availability
was discontinued several years before that.

Given that, there is no point in adding a burden to testing coverage
that builds all possible defconfigs, so it makes sense to remove it.

Of course it will remain in the git history forever, for anyone who
happens to find a functional board and wants to tinker with it.

Cc: Scott Wood <oss@buserror.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 arch/powerpc/boot/Makefile                  |   1 -
 arch/powerpc/boot/dts/sbc8548-altflash.dts  | 111 --------
 arch/powerpc/boot/dts/sbc8548-post.dtsi     | 289 --------------------
 arch/powerpc/boot/dts/sbc8548-pre.dtsi      |  48 ----
 arch/powerpc/boot/dts/sbc8548.dts           | 106 -------
 arch/powerpc/boot/wrapper                   |   2 +-
 arch/powerpc/configs/85xx/sbc8548_defconfig |  50 ----
 arch/powerpc/configs/mpc85xx_base.config    |   1 -
 arch/powerpc/platforms/85xx/Kconfig         |   6 -
 arch/powerpc/platforms/85xx/Makefile        |   1 -
 arch/powerpc/platforms/85xx/sbc8548.c       | 134 ---------
 11 files changed, 1 insertion(+), 748 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/sbc8548-altflash.dts
 delete mode 100644 arch/powerpc/boot/dts/sbc8548-post.dtsi
 delete mode 100644 arch/powerpc/boot/dts/sbc8548-pre.dtsi
 delete mode 100644 arch/powerpc/boot/dts/sbc8548.dts
 delete mode 100644 arch/powerpc/configs/85xx/sbc8548_defconfig
 delete mode 100644 arch/powerpc/platforms/85xx/sbc8548.c

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 2b8da923ceca..8edb85b9ae11 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -339,7 +339,6 @@ image-$(CONFIG_TQM8541)			+= cuImage.tqm8541
 image-$(CONFIG_TQM8548)			+= cuImage.tqm8548
 image-$(CONFIG_TQM8555)			+= cuImage.tqm8555
 image-$(CONFIG_TQM8560)			+= cuImage.tqm8560
-image-$(CONFIG_SBC8548)			+= cuImage.sbc8548
 image-$(CONFIG_KSI8560)			+= cuImage.ksi8560
 
 # Board ports in arch/powerpc/platform/86xx/Kconfig
diff --git a/arch/powerpc/boot/dts/sbc8548-altflash.dts b/arch/powerpc/boot/dts/sbc8548-altflash.dts
deleted file mode 100644
index bb7a1e712bb7..000000000000
--- a/arch/powerpc/boot/dts/sbc8548-altflash.dts
+++ /dev/null
@@ -1,111 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * SBC8548 Device Tree Source
- *
- * Configured for booting off the alternate (64MB SODIMM) flash.
- * Requires switching JP12 jumpers and changing SW2.8 setting.
- *
- * Copyright 2013 Wind River Systems Inc.
- *
- * Paul Gortmaker (see MAINTAINERS for contact information)
- */
-
-
-/dts-v1/;
-
-/include/ "sbc8548-pre.dtsi"
-
-/{
-	localbus@e0000000 {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		reg = <0xe0000000 0x5000>;
-		interrupt-parent = <&mpic>;
-
-		ranges = <0x0 0x0 0xfc000000 0x04000000		/*64MB Flash*/
-			  0x3 0x0 0xf0000000 0x04000000		/*64MB SDRAM*/
-			  0x4 0x0 0xf4000000 0x04000000 	/*64MB SDRAM*/
-			  0x5 0x0 0xf8000000 0x00b10000		/* EPLD */
-			  0x6 0x0 0xef800000 0x00800000>;	/*8MB Flash*/
-
-		flash@0,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			reg = <0x0 0x0 0x04000000>;
-			compatible = "intel,JS28F128", "cfi-flash";
-			bank-width = <4>;
-			device-width = <1>;
-			partition@0 {
-				label = "space";
-				/* FC000000 -> FFEFFFFF */
-				reg = <0x00000000 0x03f00000>;
-			};
-			partition@3f00000 {
-				label = "bootloader";
-				/* FFF00000 -> FFFFFFFF */
-				reg = <0x03f00000 0x00100000>;
-				read-only;
-			};
-                };
-
-
-		epld@5,0 {
-			compatible = "wrs,epld-localbus";
-			#address-cells = <2>;
-			#size-cells = <1>;
-			reg = <0x5 0x0 0x00b10000>;
-			ranges = <
-				0x0 0x0 0x5 0x000000 0x1fff	/* LED */
-				0x1 0x0 0x5 0x100000 0x1fff	/* Switches */
-				0x3 0x0 0x5 0x300000 0x1fff	/* HW Rev. */
-				0xb 0x0	0x5 0xb00000 0x1fff	/* EEPROM */
-			>;
-
-			led@0,0 {
-				compatible = "led";
-				reg = <0x0 0x0 0x1fff>;
-			};
-
-			switches@1,0 {
-				compatible = "switches";
-				reg = <0x1 0x0 0x1fff>;
-			};
-
-			hw-rev@3,0 {
-				compatible = "hw-rev";
-				reg = <0x3 0x0 0x1fff>;
-			};
-
-			eeprom@b,0 {
-				compatible = "eeprom";
-				reg = <0xb 0 0x1fff>;
-			};
-
-		};
-
-		alt-flash@6,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "intel,JS28F640", "cfi-flash";
-			reg = <0x6 0x0 0x800000>;
-			bank-width = <1>;
-			device-width = <1>;
-			partition@0 {
-				label = "space";
-				/* EF800000 -> EFF9FFFF */
-				reg = <0x00000000 0x007a0000>;
-			};
-			partition@7a0000 {
-				label = "bootloader";
-				/* EFFA0000 -> EFFFFFFF */
-				reg = <0x007a0000 0x00060000>;
-				read-only;
-			};
-		};
-
-
-        };
-};
-
-/include/ "sbc8548-post.dtsi"
diff --git a/arch/powerpc/boot/dts/sbc8548-post.dtsi b/arch/powerpc/boot/dts/sbc8548-post.dtsi
deleted file mode 100644
index 9d848d409408..000000000000
--- a/arch/powerpc/boot/dts/sbc8548-post.dtsi
+++ /dev/null
@@ -1,289 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * SBC8548 Device Tree Source
- *
- * Copyright 2007 Wind River Systems Inc.
- *
- * Paul Gortmaker (see MAINTAINERS for contact information)
- */
-
-/{
-	soc8548@e0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		device_type = "soc";
-		ranges = <0x00000000 0xe0000000 0x00100000>;
-		bus-frequency = <0>;
-		compatible = "simple-bus";
-
-		ecm-law@0 {
-			compatible = "fsl,ecm-law";
-			reg = <0x0 0x1000>;
-			fsl,num-laws = <10>;
-		};
-
-		ecm@1000 {
-			compatible = "fsl,mpc8548-ecm", "fsl,ecm";
-			reg = <0x1000 0x1000>;
-			interrupts = <17 2>;
-			interrupt-parent = <&mpic>;
-		};
-
-		memory-controller@2000 {
-			compatible = "fsl,mpc8548-memory-controller";
-			reg = <0x2000 0x1000>;
-			interrupt-parent = <&mpic>;
-			interrupts = <0x12 0x2>;
-		};
-
-		L2: l2-cache-controller@20000 {
-			compatible = "fsl,mpc8548-l2-cache-controller";
-			reg = <0x20000 0x1000>;
-			cache-line-size = <0x20>;	// 32 bytes
-			cache-size = <0x80000>;	// L2, 512K
-			interrupt-parent = <&mpic>;
-			interrupts = <0x10 0x2>;
-		};
-
-		i2c@3000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			cell-index = <0>;
-			compatible = "fsl-i2c";
-			reg = <0x3000 0x100>;
-			interrupts = <0x2b 0x2>;
-			interrupt-parent = <&mpic>;
-			dfsrr;
-		};
-
-		i2c@3100 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			cell-index = <1>;
-			compatible = "fsl-i2c";
-			reg = <0x3100 0x100>;
-			interrupts = <0x2b 0x2>;
-			interrupt-parent = <&mpic>;
-			dfsrr;
-		};
-
-		dma@21300 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "fsl,mpc8548-dma", "fsl,eloplus-dma";
-			reg = <0x21300 0x4>;
-			ranges = <0x0 0x21100 0x200>;
-			cell-index = <0>;
-			dma-channel@0 {
-				compatible = "fsl,mpc8548-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x0 0x80>;
-				cell-index = <0>;
-				interrupt-parent = <&mpic>;
-				interrupts = <20 2>;
-			};
-			dma-channel@80 {
-				compatible = "fsl,mpc8548-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x80 0x80>;
-				cell-index = <1>;
-				interrupt-parent = <&mpic>;
-				interrupts = <21 2>;
-			};
-			dma-channel@100 {
-				compatible = "fsl,mpc8548-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x100 0x80>;
-				cell-index = <2>;
-				interrupt-parent = <&mpic>;
-				interrupts = <22 2>;
-			};
-			dma-channel@180 {
-				compatible = "fsl,mpc8548-dma-channel",
-						"fsl,eloplus-dma-channel";
-				reg = <0x180 0x80>;
-				cell-index = <3>;
-				interrupt-parent = <&mpic>;
-				interrupts = <23 2>;
-			};
-		};
-
-		enet0: ethernet@24000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			cell-index = <0>;
-			device_type = "network";
-			model = "eTSEC";
-			compatible = "gianfar";
-			reg = <0x24000 0x1000>;
-			ranges = <0x0 0x24000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <0x1d 0x2 0x1e 0x2 0x22 0x2>;
-			interrupt-parent = <&mpic>;
-			tbi-handle = <&tbi0>;
-			phy-handle = <&phy0>;
-
-			mdio@520 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,gianfar-mdio";
-				reg = <0x520 0x20>;
-
-				phy0: ethernet-phy@19 {
-					interrupt-parent = <&mpic>;
-					interrupts = <0x6 0x1>;
-					reg = <0x19>;
-				};
-				phy1: ethernet-phy@1a {
-					interrupt-parent = <&mpic>;
-					interrupts = <0x7 0x1>;
-					reg = <0x1a>;
-				};
-				tbi0: tbi-phy@11 {
-					reg = <0x11>;
-					device_type = "tbi-phy";
-				};
-			};
-		};
-
-		enet1: ethernet@25000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			cell-index = <1>;
-			device_type = "network";
-			model = "eTSEC";
-			compatible = "gianfar";
-			reg = <0x25000 0x1000>;
-			ranges = <0x0 0x25000 0x1000>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <0x23 0x2 0x24 0x2 0x28 0x2>;
-			interrupt-parent = <&mpic>;
-			tbi-handle = <&tbi1>;
-			phy-handle = <&phy1>;
-
-			mdio@520 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "fsl,gianfar-tbi";
-				reg = <0x520 0x20>;
-
-				tbi1: tbi-phy@11 {
-					reg = <0x11>;
-					device_type = "tbi-phy";
-				};
-			};
-		};
-
-		serial0: serial@4500 {
-			cell-index = <0>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4500 0x100>;	// reg base, size
-			clock-frequency = <0>;	// should we fill in in uboot?
-			interrupts = <0x2a 0x2>;
-			interrupt-parent = <&mpic>;
-		};
-
-		serial1: serial@4600 {
-			cell-index = <1>;
-			device_type = "serial";
-			compatible = "fsl,ns16550", "ns16550";
-			reg = <0x4600 0x100>;	// reg base, size
-			clock-frequency = <0>;	// should we fill in in uboot?
-			interrupts = <0x2a 0x2>;
-			interrupt-parent = <&mpic>;
-		};
-
-		global-utilities@e0000 {	//global utilities reg
-			compatible = "fsl,mpc8548-guts";
-			reg = <0xe0000 0x1000>;
-			fsl,has-rstcr;
-		};
-
-		crypto@30000 {
-			compatible = "fsl,sec2.1", "fsl,sec2.0";
-			reg = <0x30000 0x10000>;
-			interrupts = <45 2>;
-			interrupt-parent = <&mpic>;
-			fsl,num-channels = <4>;
-			fsl,channel-fifo-len = <24>;
-			fsl,exec-units-mask = <0xfe>;
-			fsl,descriptor-types-mask = <0x12b0ebf>;
-		};
-
-		mpic: pic@40000 {
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			reg = <0x40000 0x40000>;
-			compatible = "chrp,open-pic";
-			device_type = "open-pic";
-		};
-	};
-
-	pci0: pci@e0008000 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-			/* IDSEL 0x01 (PCI-X slot) @66MHz */
-			0x0800 0x0 0x0 0x1 &mpic 0x2 0x1
-			0x0800 0x0 0x0 0x2 &mpic 0x3 0x1
-			0x0800 0x0 0x0 0x3 &mpic 0x4 0x1
-			0x0800 0x0 0x0 0x4 &mpic 0x1 0x1
-
-			/* IDSEL 0x11 (PCI, 3.3V 32bit) @33MHz */
-			0x8800 0x0 0x0 0x1 &mpic 0x2 0x1
-			0x8800 0x0 0x0 0x2 &mpic 0x3 0x1
-			0x8800 0x0 0x0 0x3 &mpic 0x4 0x1
-			0x8800 0x0 0x0 0x4 &mpic 0x1 0x1>;
-
-		interrupt-parent = <&mpic>;
-		interrupts = <0x18 0x2>;
-		bus-range = <0 0>;
-		ranges = <0x02000000 0x0 0x80000000 0x80000000 0x0 0x10000000
-			  0x01000000 0x0 0x00000000 0xe2000000 0x0 0x00800000>;
-		clock-frequency = <66000000>;
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0xe0008000 0x1000>;
-		compatible = "fsl,mpc8540-pcix", "fsl,mpc8540-pci";
-		device_type = "pci";
-	};
-
-	pci1: pcie@e000a000 {
-		interrupt-map-mask = <0xf800 0x0 0x0 0x7>;
-		interrupt-map = <
-
-			/* IDSEL 0x0 (PEX) */
-			0x0000 0x0 0x0 0x1 &mpic 0x0 0x1
-			0x0000 0x0 0x0 0x2 &mpic 0x1 0x1
-			0x0000 0x0 0x0 0x3 &mpic 0x2 0x1
-			0x0000 0x0 0x0 0x4 &mpic 0x3 0x1>;
-
-		interrupt-parent = <&mpic>;
-		interrupts = <0x1a 0x2>;
-		bus-range = <0x0 0xff>;
-		ranges = <0x02000000 0x0 0xa0000000 0xa0000000 0x0 0x10000000
-			  0x01000000 0x0 0x00000000 0xe2800000 0x0 0x08000000>;
-		clock-frequency = <33000000>;
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		reg = <0xe000a000 0x1000>;
-		compatible = "fsl,mpc8548-pcie";
-		device_type = "pci";
-		pcie@0 {
-			reg = <0x0 0x0 0x0 0x0 0x0>;
-			#size-cells = <2>;
-			#address-cells = <3>;
-			device_type = "pci";
-			ranges = <0x02000000 0x0 0xa0000000
-				  0x02000000 0x0 0xa0000000
-				  0x0 0x10000000
-
-				  0x01000000 0x0 0x00000000
-				  0x01000000 0x0 0x00000000
-				  0x0 0x00800000>;
-		};
-	};
-};
diff --git a/arch/powerpc/boot/dts/sbc8548-pre.dtsi b/arch/powerpc/boot/dts/sbc8548-pre.dtsi
deleted file mode 100644
index 0e3665fd15d0..000000000000
--- a/arch/powerpc/boot/dts/sbc8548-pre.dtsi
+++ /dev/null
@@ -1,48 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * SBC8548 Device Tree Source
- *
- * Copyright 2007 Wind River Systems Inc.
- *
- * Paul Gortmaker (see MAINTAINERS for contact information)
- */
-
-/{
-	model = "SBC8548";
-	compatible = "SBC8548";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	aliases {
-		ethernet0 = &enet0;
-		ethernet1 = &enet1;
-		serial0 = &serial0;
-		serial1 = &serial1;
-		pci0 = &pci0;
-		pci1 = &pci1;
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		PowerPC,8548@0 {
-			device_type = "cpu";
-			reg = <0>;
-			d-cache-line-size = <0x20>;	// 32 bytes
-			i-cache-line-size = <0x20>;	// 32 bytes
-			d-cache-size = <0x8000>;	// L1, 32K
-			i-cache-size = <0x8000>;	// L1, 32K
-			timebase-frequency = <0>;	// From uboot
-			bus-frequency = <0>;
-			clock-frequency = <0>;
-			next-level-cache = <&L2>;
-		};
-	};
-
-	memory {
-		device_type = "memory";
-		reg = <0x00000000 0x10000000>;
-	};
-
-};
diff --git a/arch/powerpc/boot/dts/sbc8548.dts b/arch/powerpc/boot/dts/sbc8548.dts
deleted file mode 100644
index ce0a119f496e..000000000000
--- a/arch/powerpc/boot/dts/sbc8548.dts
+++ /dev/null
@@ -1,106 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * SBC8548 Device Tree Source
- *
- * Copyright 2007 Wind River Systems Inc.
- *
- * Paul Gortmaker (see MAINTAINERS for contact information)
- */
-
-
-/dts-v1/;
-
-/include/ "sbc8548-pre.dtsi"
-
-/{
-	localbus@e0000000 {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		reg = <0xe0000000 0x5000>;
-		interrupt-parent = <&mpic>;
-
-		ranges = <0x0 0x0 0xff800000 0x00800000		/*8MB Flash*/
-			  0x3 0x0 0xf0000000 0x04000000		/*64MB SDRAM*/
-			  0x4 0x0 0xf4000000 0x04000000 	/*64MB SDRAM*/
-			  0x5 0x0 0xf8000000 0x00b10000		/* EPLD */
-			  0x6 0x0 0xec000000 0x04000000>;	/*64MB Flash*/
-
-
-		flash@0,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "intel,JS28F640", "cfi-flash";
-			reg = <0x0 0x0 0x800000>;
-			bank-width = <1>;
-			device-width = <1>;
-			partition@0 {
-				label = "space";
-				/* FF800000 -> FFF9FFFF */
-				reg = <0x00000000 0x007a0000>;
-			};
-			partition@7a0000 {
-				label = "bootloader";
-				/* FFFA0000 -> FFFFFFFF */
-				reg = <0x007a0000 0x00060000>;
-				read-only;
-			};
-		};
-
-		epld@5,0 {
-			compatible = "wrs,epld-localbus";
-			#address-cells = <2>;
-			#size-cells = <1>;
-			reg = <0x5 0x0 0x00b10000>;
-			ranges = <
-				0x0 0x0 0x5 0x000000 0x1fff	/* LED */
-				0x1 0x0 0x5 0x100000 0x1fff	/* Switches */
-				0x3 0x0 0x5 0x300000 0x1fff	/* HW Rev. */
-				0xb 0x0	0x5 0xb00000 0x1fff	/* EEPROM */
-			>;
-
-			led@0,0 {
-				compatible = "led";
-				reg = <0x0 0x0 0x1fff>;
-			};
-
-			switches@1,0 {
-				compatible = "switches";
-				reg = <0x1 0x0 0x1fff>;
-			};
-
-			hw-rev@3,0 {
-				compatible = "hw-rev";
-				reg = <0x3 0x0 0x1fff>;
-			};
-
-			eeprom@b,0 {
-				compatible = "eeprom";
-				reg = <0xb 0 0x1fff>;
-			};
-
-		};
-
-		alt-flash@6,0 {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			reg = <0x6 0x0 0x04000000>;
-			compatible = "intel,JS28F128", "cfi-flash";
-			bank-width = <4>;
-			device-width = <1>;
-			partition@0 {
-				label = "space";
-				/* EC000000 -> EFEFFFFF */
-				reg = <0x00000000 0x03f00000>;
-			};
-			partition@3f00000 {
-				label = "bootloader";
-				/* EFF00000 -> EFFFFFFF */
-				reg = <0x03f00000 0x00100000>;
-				read-only;
-			};
-                };
-        };
-};
-
-/include/ "sbc8548-post.dtsi"
diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 41fa0a8715e3..b6e4be96b9b7 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -298,7 +298,7 @@ cuboot*)
     *-tqm8541|*-mpc8560*|*-tqm8560|*-tqm8555|*-ksi8560*)
         platformo=$object/cuboot-85xx-cpm2.o
         ;;
-    *-mpc85*|*-tqm85*|*-sbc85*)
+    *-mpc85*|*-tqm85*)
         platformo=$object/cuboot-85xx.o
         ;;
     *-amigaone)
diff --git a/arch/powerpc/configs/85xx/sbc8548_defconfig b/arch/powerpc/configs/85xx/sbc8548_defconfig
deleted file mode 100644
index 258881727119..000000000000
--- a/arch/powerpc/configs/85xx/sbc8548_defconfig
+++ /dev/null
@@ -1,50 +0,0 @@
-CONFIG_PPC_85xx=y
-CONFIG_SYSVIPC=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_SLAB=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_SBC8548=y
-CONFIG_GEN_RTC=y
-CONFIG_BINFMT_MISC=y
-CONFIG_MATH_EMULATION=y
-# CONFIG_SECCOMP is not set
-CONFIG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_XFRM_USER=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_SYN_COOKIES=y
-# CONFIG_IPV6 is not set
-# CONFIG_FW_LOADER is not set
-CONFIG_MTD=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_ADV_OPTIONS=y
-CONFIG_MTD_CFI_GEOMETRY=y
-CONFIG_MTD_CFI_I4=y
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_NETDEVICES=y
-CONFIG_GIANFAR=y
-CONFIG_BROADCOM_PHY=y
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-# CONFIG_VT is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_USB_SUPPORT is not set
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
diff --git a/arch/powerpc/configs/mpc85xx_base.config b/arch/powerpc/configs/mpc85xx_base.config
index b1593fe6f70b..85907b776908 100644
--- a/arch/powerpc/configs/mpc85xx_base.config
+++ b/arch/powerpc/configs/mpc85xx_base.config
@@ -13,7 +13,6 @@ CONFIG_P1022_DS=y
 CONFIG_P1022_RDK=y
 CONFIG_P1023_RDB=y
 CONFIG_TWR_P102x=y
-CONFIG_SBC8548=y
 CONFIG_SOCRATES=y
 CONFIG_STX_GP3=y
 CONFIG_TQM8540=y
diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
index b77cbb0a50e1..4142ebf01382 100644
--- a/arch/powerpc/platforms/85xx/Kconfig
+++ b/arch/powerpc/platforms/85xx/Kconfig
@@ -208,12 +208,6 @@ config TQM8560
 	select TQM85xx
 	select CPM2
 
-config SBC8548
-	bool "Wind River SBC8548"
-	select DEFAULT_UIMAGE
-	help
-	  This option enables support for the Wind River SBC8548 board
-
 config PPA8548
 	bool "Prodrive PPA8548"
 	help
diff --git a/arch/powerpc/platforms/85xx/Makefile b/arch/powerpc/platforms/85xx/Makefile
index d1dd0dca5ebf..60e4e97a929d 100644
--- a/arch/powerpc/platforms/85xx/Makefile
+++ b/arch/powerpc/platforms/85xx/Makefile
@@ -26,7 +26,6 @@ obj-$(CONFIG_CORENET_GENERIC)   += corenet_generic.o
 obj-$(CONFIG_FB_FSL_DIU)	+= t1042rdb_diu.o
 obj-$(CONFIG_STX_GP3)	  += stx_gp3.o
 obj-$(CONFIG_TQM85xx)	  += tqm85xx.o
-obj-$(CONFIG_SBC8548)     += sbc8548.o
 obj-$(CONFIG_PPA8548)     += ppa8548.o
 obj-$(CONFIG_SOCRATES)    += socrates.o socrates_fpga_pic.o
 obj-$(CONFIG_KSI8560)	  += ksi8560.o
diff --git a/arch/powerpc/platforms/85xx/sbc8548.c b/arch/powerpc/platforms/85xx/sbc8548.c
deleted file mode 100644
index e4acf5ce6b07..000000000000
--- a/arch/powerpc/platforms/85xx/sbc8548.c
+++ /dev/null
@@ -1,134 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Wind River SBC8548 setup and early boot code.
- *
- * Copyright 2007 Wind River Systems Inc.
- *
- * By Paul Gortmaker (see MAINTAINERS for contact information)
- *
- * Based largely on the MPC8548CDS support - Copyright 2005 Freescale Inc.
- */
-
-#include <linux/stddef.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/errno.h>
-#include <linux/reboot.h>
-#include <linux/pci.h>
-#include <linux/kdev_t.h>
-#include <linux/major.h>
-#include <linux/console.h>
-#include <linux/delay.h>
-#include <linux/seq_file.h>
-#include <linux/initrd.h>
-#include <linux/interrupt.h>
-#include <linux/fsl_devices.h>
-#include <linux/of_platform.h>
-#include <linux/pgtable.h>
-
-#include <asm/page.h>
-#include <linux/atomic.h>
-#include <asm/time.h>
-#include <asm/io.h>
-#include <asm/machdep.h>
-#include <asm/ipic.h>
-#include <asm/pci-bridge.h>
-#include <asm/irq.h>
-#include <mm/mmu_decl.h>
-#include <asm/prom.h>
-#include <asm/udbg.h>
-#include <asm/mpic.h>
-
-#include <sysdev/fsl_soc.h>
-#include <sysdev/fsl_pci.h>
-
-#include "mpc85xx.h"
-
-static int sbc_rev;
-
-static void __init sbc8548_pic_init(void)
-{
-	struct mpic *mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN,
-			0, 256, " OpenPIC  ");
-	BUG_ON(mpic == NULL);
-	mpic_init(mpic);
-}
-
-/* Extract the HW Rev from the EPLD on the board */
-static int __init sbc8548_hw_rev(void)
-{
-	struct device_node *np;
-	struct resource res;
-	unsigned int *rev;
-	int board_rev = 0;
-
-	np = of_find_compatible_node(NULL, NULL, "hw-rev");
-	if (np == NULL) {
-		printk("No HW-REV found in DTB.\n");
-		return -ENODEV;
-	}
-
-	of_address_to_resource(np, 0, &res);
-	of_node_put(np);
-
-	rev = ioremap(res.start,sizeof(unsigned int));
-	board_rev = (*rev) >> 28;
-	iounmap(rev);
-
-	return board_rev;
-}
-
-/*
- * Setup the architecture
- */
-static void __init sbc8548_setup_arch(void)
-{
-	if (ppc_md.progress)
-		ppc_md.progress("sbc8548_setup_arch()", 0);
-
-	fsl_pci_assign_primary();
-
-	sbc_rev = sbc8548_hw_rev();
-}
-
-static void sbc8548_show_cpuinfo(struct seq_file *m)
-{
-	uint pvid, svid, phid1;
-
-	pvid = mfspr(SPRN_PVR);
-	svid = mfspr(SPRN_SVR);
-
-	seq_printf(m, "Vendor\t\t: Wind River\n");
-	seq_printf(m, "Machine\t\t: SBC8548 v%d\n", sbc_rev);
-	seq_printf(m, "PVR\t\t: 0x%x\n", pvid);
-	seq_printf(m, "SVR\t\t: 0x%x\n", svid);
-
-	/* Display cpu Pll setting */
-	phid1 = mfspr(SPRN_HID1);
-	seq_printf(m, "PLL setting\t: 0x%x\n", ((phid1 >> 24) & 0x3f));
-}
-
-machine_arch_initcall(sbc8548, mpc85xx_common_publish_devices);
-
-/*
- * Called very early, device-tree isn't unflattened
- */
-static int __init sbc8548_probe(void)
-{
-	return of_machine_is_compatible("SBC8548");
-}
-
-define_machine(sbc8548) {
-	.name		= "SBC8548",
-	.probe		= sbc8548_probe,
-	.setup_arch	= sbc8548_setup_arch,
-	.init_IRQ	= sbc8548_pic_init,
-	.show_cpuinfo	= sbc8548_show_cpuinfo,
-	.get_irq	= mpic_get_irq,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.calibrate_decr = generic_calibrate_decr,
-	.progress	= udbg_progress,
-};
-- 
2.17.1

