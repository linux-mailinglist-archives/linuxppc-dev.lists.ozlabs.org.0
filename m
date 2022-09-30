Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1C45F135D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 22:13:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MfLyf5KMdz3cDk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Oct 2022 06:13:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kqbs8G25;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.104.58; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kqbs8G25;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2058.outbound.protection.outlook.com [40.107.104.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MfLtt4nQlz3c6K
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Oct 2022 06:10:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6OStW+XmFx66IT3YbN+Xm2OnXjUEtwutEBS6riCJTEaWU7QsRza8Xqx1AyAQB5LNmnSEUZjtLom55PimbXznFUi3IGMNyG49Vfm0xCtqc01ApICFcOkVdHyfOfUuMjZmtEvSMdEwKvEopUDv5xFYyaeW1g1enALV8T7twzhCA18vQuqiMU4QPIS5566FDq3tCj7Plc45uRJW51d+d3ZHk0m4e/5pOdUlOgiXCVlfLB8pf1bKFm9t443YNKjJZjYiZ0Q4MAQFoskcC/3UjQgQwDQiIiBEx9FqlaVzUnbQVEvy1piKNCG60/ROClEtn4wu5yoTuiMAY34a3GcJQFQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpcRSaTRyMDrfNxWyWDNnuM6Ik1YXSUjdwexaPXKA/Y=;
 b=gzbHBrikQiRRctwtcbbA/JJzQPmqUwDZzpLvxcdWq9L9dIUQDK2JtjjI1ZI3NxwIGV8edjLVxtQ7LU9YcXBhBg0VyhshVIEoR+TslFuQnSWvPPk2icuIhE99KHKuklT49kt6QbUWZTtrFxaHh8qTLOQw9IRAdXAhlOPJ5gMAiCquTCi06le03ZxQ5fQz+06COMV+6YgXAVVfHRB5xBeK27/KUB71pjTynrzWYmcZ77ImDAOtTfugmROGYn7Z1AMcHK27HkCpURPB3h7OBXhePddxLQGeuly8vsPG1OFZOnvMxtTjeyc7JJNmtKBi1bAEc+glbLeTBW4Z5hJT82FNBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpcRSaTRyMDrfNxWyWDNnuM6Ik1YXSUjdwexaPXKA/Y=;
 b=kqbs8G25MaaOF4vT5h53n7I/3/3+9chD9n/vZIG9Vu2pAdtJm9s/W2UKYsbn1PSrKmMkHiZ3xmLgSLH/64yxcQ4/6DDm43EFCTuhwYRZ5MdKcYZXmPPBq5KX9QVNruuaMV5MgaAmbW/lXzspxFYcA5Nz0sCWvYQASp+kwi88WxXI/iNJWqkbRaUadT9mLbZXAbxGJC9vqejIgSjpgNdlzteMHvMG1cC3AJCS5PWY5Vj+WIa9y+MDCHIVRupvAWZcvmDz1cUrzxzdabY3YGn0Ww8odtHwu+Ol4YJ9CoDZFrMWTc8qn0X1OR2bqGim28e5uWw/qdXwAnn6s1XXbGgLMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB7749.eurprd03.prod.outlook.com (2603:10a6:20b:404::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 20:09:55 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 20:09:55 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Camelia Alexandra Groza <camelia.groza@nxp.com>,
	netdev@vger.kernel.org
Subject: [PATCH net-next v6 5/9] net: fman: memac: Use lynx pcs driver
Date: Fri, 30 Sep 2022 16:09:29 -0400
Message-Id: <20220930200933.4111249-6-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220930200933.4111249-1-sean.anderson@seco.com>
References: <20220930200933.4111249-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::29) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AS8PR03MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a583d2-0a08-41eb-a014-08daa31fbdce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kUfX6l7Wx1EVsJ6pb0Rf3Jj+3iq5SxNN33VazHXXp1NOOmJYhbVyw/WZ/dZagIrdqOsW3nxsvr2ixDNUKN+fe/GIMpahc1g2FqZBGxS4DCK0mFOz2KrMVoliCFusWTceqU4bg94mP9ijwNqB0VkOW5W5cYIrEnejQituXgvQK8k1d4Ysf5eHCRP77RBVyqWaWPGCKISulIZqp7Vl8MIvY/D8NxLx6TyUGG3OOcMHHbtP0M5w+QTjFTvn4QLiinuHvPjvzVGj/DBdGdkLUpcIN1XuVk9DuT49ttdml7PNgh6vNyZq0iKnge6lHDoO8Mrywjsi06nNC2FbSAAwxDRtf7Xvd8k/qbHds6KzccBk8v9QR6kjtn3e7OoVHn1ISss6bVkFq+x5mO2PH/cxkagazql3Khpocq5YDDzhwsCP0XLksAIKMU9sxB9L7FZyDH0ooOiFKb5qVKCyuKzxu9djIpUfn8041gGdz6qJh0R+vf929HLyMlY6FuYvOlY2R5aq8HhoHsyC2edymZUZr/fbtgvTcx1WkmN4bjlVaS4SzDDOs0OTrkbMgTIwFj/Mf4d2IMt6GiRE6zLi1I8dfWRg/2iWcy7gYjlcVsz1Xtx4tNDi03yfrhLYkLxCtsvH6Zl5nSTKlaH3sBh0pxTrShqMVIi6NXOXZ1bIk8vGN/6LUzyQjQseQ+PYPSc0ynBevKnGF9g3DB5yclILJKlEBcOqC6Te08D1/2jPryoXXxbRknK3hY3pzEMXm5o4IzWafGvOBJBysYRQ9bJZjQemh3fMoA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(396003)(346002)(39850400004)(451199015)(66946007)(2906002)(6666004)(38350700002)(38100700002)(8676002)(66476007)(66556008)(4326008)(83380400001)(41300700001)(36756003)(6486002)(6512007)(478600001)(6506007)(52116002)(26005)(110136005)(316002)(107886003)(54906003)(186003)(1076003)(2616005)(86362001)(8936002)(7416002)(44832011)(5660300002)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?LEWfsncpotwdfAzjQ+YnGYjsdRRCpx5dw+71cyX5uKp00CqH5jVqFA3U9yCH?=
 =?us-ascii?Q?iwS7maDhSV/Tnu0hYbh20eL/XM6YJwbBdAor03gj9HWsPuJ2UNXLuwDv6Ieu?=
 =?us-ascii?Q?U+Sf09TCsgNvoILVxgfxuh8NzkVraQZQsLVoAIj6pPWbhNEgW7klYzbQdJ1Z?=
 =?us-ascii?Q?o+Z9l4fi8y9p7GpdYStqeD48QYyhZbPgoYNd+8Bg/tJbvf9/inu8a9lpatWt?=
 =?us-ascii?Q?I9/BRt4UNHv8Zsg/wZ2yhUPLUTSB0LGI+Ry9wkhOFF4eM6QRk/2wr9Pa1soG?=
 =?us-ascii?Q?jUT54ToHoe2Yf+AOMeaWAvIOKbj+XVlhgIZHwc0UyViWARRji2M2ycChIkIH?=
 =?us-ascii?Q?v71QvslPIZTh6XDTRFVQWdArtjCnDCMRPSinpEuox83t1/JHJHc3HMm2tNIS?=
 =?us-ascii?Q?zPmEMGr/wvCp92xozsHw+/x+WveVrHlIVyBFMBIQDt6jR7lI06UFLgIMvxMr?=
 =?us-ascii?Q?j8RcFOs0N8Q69QQ0pM0UF4JH6xTTxSbQxuySS5JnKrsBfynDasUO3OS5RTpl?=
 =?us-ascii?Q?SVuQ2TNjgxSxFtbzmStd3Juq1P+eBmXCBhsdJ70ig3MwoRYaXbD9XdaVGKUl?=
 =?us-ascii?Q?tV8vjf9+aI/fyXoqsOoz9kUH6c9v00FV/Rw4SJAXav/WFha0yQheWcqX4rZB?=
 =?us-ascii?Q?BMZ5Ycay5a8zOJoUVGVFlSAH/PWFhdIWzOdey7OeLQEJRNRBgltbeSbooXky?=
 =?us-ascii?Q?xV533Qh9RYMv0sPFxyQv3+oE2nG/qlI01NrzM+HUKOfK1+dcUFRe3R+s2Kpi?=
 =?us-ascii?Q?WEnw6pN88dhl0jxOcsjlUrywMoBXBxpPeUZ0d1RK+wEuL99K1DVS7IoqC785?=
 =?us-ascii?Q?0t6JcmyopkEg88qJGPlyh9w/7WddX6SYDojdlRHzIqngICtHW8PeeX9no0cV?=
 =?us-ascii?Q?kY/LFcgbB1rxwGBfgb5/4OkTO0O0pCS1JCcxZ+6yBJTY9o38QiNqtOgpnNTD?=
 =?us-ascii?Q?E3rMmvCIxUDCIxhPICEwpkDvAyX83IKHi5MF2wXWj6xdbgdvnhJhJAusDPlE?=
 =?us-ascii?Q?ONk762dWMCRItbzLJW6uk0X0fBvxN90eGCmfr+R6a00urG3V/7pRj18pnXf0?=
 =?us-ascii?Q?/1+40Tia3F+N67D3oKfM63IP2ORjSNwAcIrI4+kShsQF2zn1elF8GevAMm0V?=
 =?us-ascii?Q?d2IORyuIyb5KQM9Q/AYk+eVGp9H6bIGNaj3GtRuK12xoOMdU3rkoz0qiPbDw?=
 =?us-ascii?Q?CmkuLxRVDYg2zjvDa5nv4Dp9ORR75yRkiKrpFWiaf3hVg4qX/nPNKDuAmpbk?=
 =?us-ascii?Q?nQyLyNqylYoz/AAA1kGmGwPFYnbPjstJt29QKRnqyDuJ1HXAooXvZthwlAti?=
 =?us-ascii?Q?gmAt8LmyUUsteN7vA+nBb+pA9bYi2nWBnJjpvaHTddkQyUZx5mCTlGv9AB8N?=
 =?us-ascii?Q?CzZwRyqES+C2KC2fUCFgqxIWkJ5q0OxNjokHt6L8u+n+lZ/6xYig2R3lFM9x?=
 =?us-ascii?Q?Hz0nsm4b7MP/lDMC9x7ecxonbMGmfaGT4OQMJ5pyOJS894acP197/ZypE1Rn?=
 =?us-ascii?Q?mpjVXw0b6LugU5qsIJhAYyGrOopRBNee5rUAFhXtJ987IyVYGGkhCv5oUxG3?=
 =?us-ascii?Q?T1T77jnqc3t2OMSgpWW2QFwxkhdDfboMeM5X3f0+vYbhSjFV1dKsfpSlRiAC?=
 =?us-ascii?Q?vA=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a583d2-0a08-41eb-a014-08daa31fbdce
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 20:09:55.1657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhcSIiFq6lMk1zh3jXF1yW/PmWv09od0EiIMMbZv01l2UDW8Mkew8cWNDn5NQqRL0ivEqWf40VmuNvRqKigVAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7749
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
Cc: Sean Anderson <sean.anderson@seco.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Although not stated in the datasheet, as far as I can tell PCS for mEMACs
is a "Lynx." By reusing the existing driver, we can remove the PCS
management code from the memac driver. This requires calling some PCS
functions manually which phylink would usually do for us, but we will let
it do that soon.

One problem is that we don't actually have a PCS for QSGMII. We pretend
that each mEMAC's MDIO bus has four QSGMII PCSs, but this is not the case.
Only the "base" mEMAC's MDIO bus has the four QSGMII PCSs. This is not an
issue yet, because we never get the PCS state. However, it will be once the
conversion to phylink is complete, since the links will appear to never
come up. To get around this, we allow specifying multiple PCSs in pcsphy.
This breaks backwards compatibility with old device trees, but only for
QSGMII. IMO this is the only reasonable way to figure out what the actual
QSGMII PCS is.

Additionally, we now also support a separate XFI PCS. This can allow the
SerDes driver to set different addresses for the SGMII and XFI PCSs so they
can be accessed at the same time.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v6:
- Fix 81-character line

Changes in v3:
- Put the PCS mdiodev only after we are done with it (since the PCS
  does not perform a get itself).

Changes in v2:
- Move PCS_LYNX dependency to fman Kconfig

 drivers/net/ethernet/freescale/fman/Kconfig   |   3 +
 .../net/ethernet/freescale/fman/fman_memac.c  | 258 +++++++-----------
 2 files changed, 105 insertions(+), 156 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fman/Kconfig b/drivers/net/ethernet/freescale/fman/Kconfig
index 48bf8088795d..8f5637db41dd 100644
--- a/drivers/net/ethernet/freescale/fman/Kconfig
+++ b/drivers/net/ethernet/freescale/fman/Kconfig
@@ -4,6 +4,9 @@ config FSL_FMAN
 	depends on FSL_SOC || ARCH_LAYERSCAPE || COMPILE_TEST
 	select GENERIC_ALLOCATOR
 	select PHYLIB
+	select PHYLINK
+	select PCS
+	select PCS_LYNX
 	select CRC32
 	default n
 	help
diff --git a/drivers/net/ethernet/freescale/fman/fman_memac.c b/drivers/net/ethernet/freescale/fman/fman_memac.c
index 56a29f505590..eeb71352603b 100644
--- a/drivers/net/ethernet/freescale/fman/fman_memac.c
+++ b/drivers/net/ethernet/freescale/fman/fman_memac.c
@@ -11,43 +11,12 @@
 
 #include <linux/slab.h>
 #include <linux/io.h>
+#include <linux/pcs-lynx.h>
 #include <linux/phy.h>
 #include <linux/phy_fixed.h>
 #include <linux/phy/phy.h>
 #include <linux/of_mdio.h>
 
-/* PCS registers */
-#define MDIO_SGMII_CR			0x00
-#define MDIO_SGMII_DEV_ABIL_SGMII	0x04
-#define MDIO_SGMII_LINK_TMR_L		0x12
-#define MDIO_SGMII_LINK_TMR_H		0x13
-#define MDIO_SGMII_IF_MODE		0x14
-
-/* SGMII Control defines */
-#define SGMII_CR_AN_EN			0x1000
-#define SGMII_CR_RESTART_AN		0x0200
-#define SGMII_CR_FD			0x0100
-#define SGMII_CR_SPEED_SEL1_1G		0x0040
-#define SGMII_CR_DEF_VAL		(SGMII_CR_AN_EN | SGMII_CR_FD | \
-					 SGMII_CR_SPEED_SEL1_1G)
-
-/* SGMII Device Ability for SGMII defines */
-#define MDIO_SGMII_DEV_ABIL_SGMII_MODE	0x4001
-#define MDIO_SGMII_DEV_ABIL_BASEX_MODE	0x01A0
-
-/* Link timer define */
-#define LINK_TMR_L			0xa120
-#define LINK_TMR_H			0x0007
-#define LINK_TMR_L_BASEX		0xaf08
-#define LINK_TMR_H_BASEX		0x002f
-
-/* SGMII IF Mode defines */
-#define IF_MODE_USE_SGMII_AN		0x0002
-#define IF_MODE_SGMII_EN		0x0001
-#define IF_MODE_SGMII_SPEED_100M	0x0004
-#define IF_MODE_SGMII_SPEED_1G		0x0008
-#define IF_MODE_SGMII_DUPLEX_HALF	0x0010
-
 /* Num of additional exact match MAC adr regs */
 #define MEMAC_NUM_OF_PADDRS 7
 
@@ -326,7 +295,9 @@ struct fman_mac {
 	struct fman_rev_info fm_rev_info;
 	bool basex_if;
 	struct phy *serdes;
-	struct phy_device *pcsphy;
+	struct phylink_pcs *sgmii_pcs;
+	struct phylink_pcs *qsgmii_pcs;
+	struct phylink_pcs *xfi_pcs;
 	bool allmulti_enabled;
 };
 
@@ -487,91 +458,22 @@ static u32 get_mac_addr_hash_code(u64 eth_addr)
 	return xor_val;
 }
 
-static void setup_sgmii_internal_phy(struct fman_mac *memac,
-				     struct fixed_phy_status *fixed_link)
+static void setup_sgmii_internal(struct fman_mac *memac,
+				 struct phylink_pcs *pcs,
+				 struct fixed_phy_status *fixed_link)
 {
-	u16 tmp_reg16;
-
-	if (WARN_ON(!memac->pcsphy))
-		return;
-
-	/* SGMII mode */
-	tmp_reg16 = IF_MODE_SGMII_EN;
-	if (!fixed_link)
-		/* AN enable */
-		tmp_reg16 |= IF_MODE_USE_SGMII_AN;
-	else {
-		switch (fixed_link->speed) {
-		case 10:
-			/* For 10M: IF_MODE[SPEED_10M] = 0 */
-		break;
-		case 100:
-			tmp_reg16 |= IF_MODE_SGMII_SPEED_100M;
-		break;
-		case 1000:
-		default:
-			tmp_reg16 |= IF_MODE_SGMII_SPEED_1G;
-		break;
-		}
-		if (!fixed_link->duplex)
-			tmp_reg16 |= IF_MODE_SGMII_DUPLEX_HALF;
-	}
-	phy_write(memac->pcsphy, MDIO_SGMII_IF_MODE, tmp_reg16);
-
-	/* Device ability according to SGMII specification */
-	tmp_reg16 = MDIO_SGMII_DEV_ABIL_SGMII_MODE;
-	phy_write(memac->pcsphy, MDIO_SGMII_DEV_ABIL_SGMII, tmp_reg16);
-
-	/* Adjust link timer for SGMII  -
-	 * According to Cisco SGMII specification the timer should be 1.6 ms.
-	 * The link_timer register is configured in units of the clock.
-	 * - When running as 1G SGMII, Serdes clock is 125 MHz, so
-	 * unit = 1 / (125*10^6 Hz) = 8 ns.
-	 * 1.6 ms in units of 8 ns = 1.6ms / 8ns = 2*10^5 = 0x30d40
-	 * - When running as 2.5G SGMII, Serdes clock is 312.5 MHz, so
-	 * unit = 1 / (312.5*10^6 Hz) = 3.2 ns.
-	 * 1.6 ms in units of 3.2 ns = 1.6ms / 3.2ns = 5*10^5 = 0x7a120.
-	 * Since link_timer value of 1G SGMII will be too short for 2.5 SGMII,
-	 * we always set up here a value of 2.5 SGMII.
-	 */
-	phy_write(memac->pcsphy, MDIO_SGMII_LINK_TMR_H, LINK_TMR_H);
-	phy_write(memac->pcsphy, MDIO_SGMII_LINK_TMR_L, LINK_TMR_L);
-
-	if (!fixed_link)
-		/* Restart AN */
-		tmp_reg16 = SGMII_CR_DEF_VAL | SGMII_CR_RESTART_AN;
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
+	phy_interface_t iface = memac->basex_if ? PHY_INTERFACE_MODE_1000BASEX :
+				PHY_INTERFACE_MODE_SGMII;
+	unsigned int mode = fixed_link ? MLO_AN_FIXED : MLO_AN_INBAND;
+
+	linkmode_set_pause(advertising, true, true);
+	pcs->ops->pcs_config(pcs, mode, iface, advertising, true);
+	if (fixed_link)
+		pcs->ops->pcs_link_up(pcs, mode, iface, fixed_link->speed,
+				      fixed_link->duplex);
 	else
-		/* AN disabled */
-		tmp_reg16 = SGMII_CR_DEF_VAL & ~SGMII_CR_AN_EN;
-	phy_write(memac->pcsphy, 0x0, tmp_reg16);
-}
-
-static void setup_sgmii_internal_phy_base_x(struct fman_mac *memac)
-{
-	u16 tmp_reg16;
-
-	/* AN Device capability  */
-	tmp_reg16 = MDIO_SGMII_DEV_ABIL_BASEX_MODE;
-	phy_write(memac->pcsphy, MDIO_SGMII_DEV_ABIL_SGMII, tmp_reg16);
-
-	/* Adjust link timer for SGMII  -
-	 * For Serdes 1000BaseX auto-negotiation the timer should be 10 ms.
-	 * The link_timer register is configured in units of the clock.
-	 * - When running as 1G SGMII, Serdes clock is 125 MHz, so
-	 * unit = 1 / (125*10^6 Hz) = 8 ns.
-	 * 10 ms in units of 8 ns = 10ms / 8ns = 1250000 = 0x1312d0
-	 * - When running as 2.5G SGMII, Serdes clock is 312.5 MHz, so
-	 * unit = 1 / (312.5*10^6 Hz) = 3.2 ns.
-	 * 10 ms in units of 3.2 ns = 10ms / 3.2ns = 3125000 = 0x2faf08.
-	 * Since link_timer value of 1G SGMII will be too short for 2.5 SGMII,
-	 * we always set up here a value of 2.5 SGMII.
-	 */
-	phy_write(memac->pcsphy, MDIO_SGMII_LINK_TMR_H, LINK_TMR_H_BASEX);
-	phy_write(memac->pcsphy, MDIO_SGMII_LINK_TMR_L, LINK_TMR_L_BASEX);
-
-	/* Restart AN */
-	tmp_reg16 = SGMII_CR_DEF_VAL | SGMII_CR_RESTART_AN;
-	phy_write(memac->pcsphy, 0x0, tmp_reg16);
+		pcs->ops->pcs_an_restart(pcs);
 }
 
 static int check_init_parameters(struct fman_mac *memac)
@@ -983,7 +885,6 @@ static int memac_set_exception(struct fman_mac *memac,
 static int memac_init(struct fman_mac *memac)
 {
 	struct memac_cfg *memac_drv_param;
-	u8 i;
 	enet_addr_t eth_addr;
 	bool slow_10g_if = false;
 	struct fixed_phy_status *fixed_link = NULL;
@@ -1036,32 +937,10 @@ static int memac_init(struct fman_mac *memac)
 		iowrite32be(reg32, &memac->regs->command_config);
 	}
 
-	if (memac->phy_if == PHY_INTERFACE_MODE_SGMII) {
-		/* Configure internal SGMII PHY */
-		if (memac->basex_if)
-			setup_sgmii_internal_phy_base_x(memac);
-		else
-			setup_sgmii_internal_phy(memac, fixed_link);
-	} else if (memac->phy_if == PHY_INTERFACE_MODE_QSGMII) {
-		/* Configure 4 internal SGMII PHYs */
-		for (i = 0; i < 4; i++) {
-			u8 qsmgii_phy_addr, phy_addr;
-			/* QSGMII PHY address occupies 3 upper bits of 5-bit
-			 * phy_address; the lower 2 bits are used to extend
-			 * register address space and access each one of 4
-			 * ports inside QSGMII.
-			 */
-			phy_addr = memac->pcsphy->mdio.addr;
-			qsmgii_phy_addr = (u8)((phy_addr << 2) | i);
-			memac->pcsphy->mdio.addr = qsmgii_phy_addr;
-			if (memac->basex_if)
-				setup_sgmii_internal_phy_base_x(memac);
-			else
-				setup_sgmii_internal_phy(memac, fixed_link);
-
-			memac->pcsphy->mdio.addr = phy_addr;
-		}
-	}
+	if (memac->phy_if == PHY_INTERFACE_MODE_SGMII)
+		setup_sgmii_internal(memac, memac->sgmii_pcs, fixed_link);
+	else if (memac->phy_if == PHY_INTERFACE_MODE_QSGMII)
+		setup_sgmii_internal(memac, memac->qsgmii_pcs, fixed_link);
 
 	/* Max Frame Length */
 	err = fman_set_mac_max_frame(memac->fm, memac->mac_id,
@@ -1097,12 +976,25 @@ static int memac_init(struct fman_mac *memac)
 	return 0;
 }
 
+static void pcs_put(struct phylink_pcs *pcs)
+{
+	struct mdio_device *mdiodev;
+
+	if (!pcs)
+		return;
+
+	mdiodev = lynx_get_mdio_device(pcs);
+	lynx_pcs_destroy(pcs);
+	mdio_device_free(mdiodev);
+}
+
 static int memac_free(struct fman_mac *memac)
 {
 	free_init_resources(memac);
 
-	if (memac->pcsphy)
-		put_device(&memac->pcsphy->mdio.dev);
+	pcs_put(memac->sgmii_pcs);
+	pcs_put(memac->qsgmii_pcs);
+	pcs_put(memac->xfi_pcs);
 
 	kfree(memac->memac_drv_param);
 	kfree(memac);
@@ -1153,12 +1045,31 @@ static struct fman_mac *memac_config(struct mac_device *mac_dev,
 	return memac;
 }
 
+static struct phylink_pcs *memac_pcs_create(struct device_node *mac_node,
+					    int index)
+{
+	struct device_node *node;
+	struct mdio_device *mdiodev = NULL;
+	struct phylink_pcs *pcs;
+
+	node = of_parse_phandle(mac_node, "pcsphy-handle", index);
+	if (node && of_device_is_available(node))
+		mdiodev = of_mdio_find_device(node);
+	of_node_put(node);
+
+	if (!mdiodev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	pcs = lynx_pcs_create(mdiodev);
+	return pcs;
+}
+
 int memac_initialization(struct mac_device *mac_dev,
 			 struct device_node *mac_node,
 			 struct fman_mac_params *params)
 {
 	int			 err;
-	struct device_node	*phy_node;
+	struct phylink_pcs	*pcs;
 	struct fixed_phy_status *fixed_link;
 	struct fman_mac		*memac;
 
@@ -1188,23 +1099,58 @@ int memac_initialization(struct mac_device *mac_dev,
 	memac = mac_dev->fman_mac;
 	memac->memac_drv_param->max_frame_length = fman_get_max_frm();
 	memac->memac_drv_param->reset_on_init = true;
-	if (memac->phy_if == PHY_INTERFACE_MODE_SGMII ||
-	    memac->phy_if == PHY_INTERFACE_MODE_QSGMII) {
-		phy_node = of_parse_phandle(mac_node, "pcsphy-handle", 0);
-		if (!phy_node) {
-			pr_err("PCS PHY node is not available\n");
-			err = -EINVAL;
+
+	err = of_property_match_string(mac_node, "pcs-names", "xfi");
+	if (err >= 0) {
+		memac->xfi_pcs = memac_pcs_create(mac_node, err);
+		if (IS_ERR(memac->xfi_pcs)) {
+			err = PTR_ERR(memac->xfi_pcs);
+			dev_err_probe(mac_dev->dev, err, "missing xfi pcs\n");
 			goto _return_fm_mac_free;
 		}
+	} else if (err != -EINVAL && err != -ENODATA) {
+		goto _return_fm_mac_free;
+	}
 
-		memac->pcsphy = of_phy_find_device(phy_node);
-		if (!memac->pcsphy) {
-			pr_err("of_phy_find_device (PCS PHY) failed\n");
-			err = -EINVAL;
+	err = of_property_match_string(mac_node, "pcs-names", "qsgmii");
+	if (err >= 0) {
+		memac->qsgmii_pcs = memac_pcs_create(mac_node, err);
+		if (IS_ERR(memac->qsgmii_pcs)) {
+			err = PTR_ERR(memac->qsgmii_pcs);
+			dev_err_probe(mac_dev->dev, err,
+				      "missing qsgmii pcs\n");
 			goto _return_fm_mac_free;
 		}
+	} else if (err != -EINVAL && err != -ENODATA) {
+		goto _return_fm_mac_free;
+	}
+
+	/* For compatibility, if pcs-names is missing, we assume this phy is
+	 * the first one in pcsphy-handle
+	 */
+	err = of_property_match_string(mac_node, "pcs-names", "sgmii");
+	if (err == -EINVAL)
+		pcs = memac_pcs_create(mac_node, 0);
+	else if (err < 0)
+		goto _return_fm_mac_free;
+	else
+		pcs = memac_pcs_create(mac_node, err);
+
+	if (!pcs) {
+		dev_err(mac_dev->dev, "missing pcs\n");
+		err = -ENOENT;
+		goto _return_fm_mac_free;
 	}
 
+	/* If err is set here, it means that pcs-names was missing above (and
+	 * therefore that xfi_pcs cannot be set). If we are defaulting to
+	 * XGMII, assume this is for XFI. Otherwise, assume it is for SGMII.
+	 */
+	if (err && mac_dev->phy_if == PHY_INTERFACE_MODE_XGMII)
+		memac->xfi_pcs = pcs;
+	else
+		memac->sgmii_pcs = pcs;
+
 	memac->serdes = devm_of_phy_get(mac_dev->dev, mac_node, "serdes");
 	err = PTR_ERR(memac->serdes);
 	if (err == -ENODEV || err == -ENOSYS) {
-- 
2.35.1.1320.gc452695387.dirty

