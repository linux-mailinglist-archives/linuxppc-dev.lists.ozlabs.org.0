Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FE36ACDEB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:24:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVpRx4Vynz3fVj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:24:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=MazKoeBs;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=MazKoeBs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7d00::305; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=MazKoeBs;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=MazKoeBs;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05hn20305.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::305])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVpGb3n3Tz3cC5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:16:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+4DT+77QX1L328n7nwn3k+fYZX2Afa6/enjg3r5K3w=;
 b=MazKoeBsDx6mubD3c3Sn9+8HYEx+Lcu4UG6W5dsKqUHVCAwUlIB17BbtWXNcrA3J6e+CvsvhmR+JKUUSt5rgR+cMkHbQnNbfmaAZESOnglrRkrWLyr/bd54vdGtwt6X/c7sPW09SxnAy3i8di4/goa5A89qYdxq+EDqrvj1K6j9ubC2h/Ooh58iZW9MB20wW02KFg+Ire996/SFk9yGINSaBLc3eO6vXIORaH8gbzjDEFaeg8mC3Kxdwj6AWE62PxvotxnCpApg7bWvdLfdH8rRALVbsh35CmI90r71HFvxLjDW+miwuLvK2dKw3oHruK2nAF4mXSOpTIJLo+1ESoQ==
Received: from AM6P193CA0040.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::17)
 by AS2PR03MB10086.eurprd03.prod.outlook.com (2603:10a6:20b:64c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:16:21 +0000
Received: from AM6EUR05FT014.eop-eur05.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::d0) by AM6P193CA0040.outlook.office365.com
 (2603:10a6:209:8e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Mon, 6 Mar 2023 19:16:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.83) by
 AM6EUR05FT014.mail.protection.outlook.com (10.233.240.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.15 via Frontend Transport; Mon, 6 Mar 2023 19:16:21 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 453FB2008026C;
	Mon,  6 Mar 2023 19:16:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.177])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 67DD02008006F;
	Mon,  6 Mar 2023 19:15:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHI+8Ua7slK/WWNXIavVRhMJrtU44yRvSGvQzO7vTL7iwgVOrjUpwulHwCeh4raG6WV0/BU/jPfZsfEkcSZKc/x6JvvDBVR76eBZd4SdGhLcLfPrNb0YuKTZIrRUDjH9ETAYLt+W1rLQrdWAL6c4G7WwfAFZpVAUCmJtTiDGa7UGDTfxFtzAnfqjdRwmD/LNzwxS6qeOFixCJ4cJeIl8BicLGr92YTa+/IKJEmrtw6bqyQv0EO/7cF+lB2Ps85zq/xgkAXZ+SW6DrLZEDyHooR8syXWXgfjCW9ZY4E8OE5HOofINiimA3aMat+RzmheMTTCWeVyW3JxzhOhqENaDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+4DT+77QX1L328n7nwn3k+fYZX2Afa6/enjg3r5K3w=;
 b=Ronep5L6K+W2Pe4bHxoBqh5xeroWqZCS4TalT2cN3YJe17F8GzGwq5dS0SfdGZSqlDuuiKjgb6ytYrnneSuz/o5SCLaUR0XyUhM+Xn1IlsbBnumfXt54uAOKNSj0RhVFSQSClJQtGP7IIeYgENC2e0bnRIyp7Uoidj25o9NHbLwPwTKxncbMAAmK4SojfGvJUTCuUgkiEhKQRFRClc4jZgV1X1+hM7oKqclQEKWSKcY/dMM/9Jr9SjmmUOJHZdzTlpSm0POn1q6BPrfnHyW5oU2X35St/1ORvtMLZbkRxepiWOOWZfRt0S4zDOtlVjvKimqpgr+SAJqGh0DFH7iGuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+4DT+77QX1L328n7nwn3k+fYZX2Afa6/enjg3r5K3w=;
 b=MazKoeBsDx6mubD3c3Sn9+8HYEx+Lcu4UG6W5dsKqUHVCAwUlIB17BbtWXNcrA3J6e+CvsvhmR+JKUUSt5rgR+cMkHbQnNbfmaAZESOnglrRkrWLyr/bd54vdGtwt6X/c7sPW09SxnAy3i8di4/goa5A89qYdxq+EDqrvj1K6j9ubC2h/Ooh58iZW9MB20wW02KFg+Ire996/SFk9yGINSaBLc3eO6vXIORaH8gbzjDEFaeg8mC3Kxdwj6AWE62PxvotxnCpApg7bWvdLfdH8rRALVbsh35CmI90r71HFvxLjDW+miwuLvK2dKw3oHruK2nAF4mXSOpTIJLo+1ESoQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB9511.eurprd03.prod.outlook.com (2603:10a6:20b:5a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:16:08 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 19:16:08 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 08/13] phy: lynx10g: Enable by default on Layerscape
Date: Mon,  6 Mar 2023 14:15:30 -0500
Message-Id: <20230306191535.1917656-9-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230306191535.1917656-1-sean.anderson@seco.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:208:23b::20) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB9511:EE_|AM6EUR05FT014:EE_|AS2PR03MB10086:EE_
X-MS-Office365-Filtering-Correlation-Id: 162cec68-62f5-47af-ee3e-08db1e774533
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  U+UJztSU6dnfmo/ZljjHA1vi1hH1hAmhGuWtWAP9IDluNZFbDLqblJKsC+UdOKa7N2aVUH/GRFHmnebXvnuhK0MClB8Si0LrSPvr5r9USO8YdCxd4Fph6J+vkU4pqX24CnKXhUZC6H6zM+LkwS1O9+JjtEK85MKBGwpSMLrx7JggMupP4zpjPxLtnkpYhvvy81LwzUhX+sGqgWkUVfh+ejPZKlgv56msukW3Hc579fjJXboaUqTXf/8ge0c6DoRWHRQHPOTswXfn71XIaJPlFesBjtImhzU45ujt4tP7lt6VDG3sBUSvWoJEqthLv/g6grgNdiGGxbJRE2mvGskyWYnxyHNM0Mq9xJiwJxrh89+Di5jvxiP8Lh/cGNU5eFpg1AkmMlQauLPQkMR+f1sugK72eomUicbZ7YHfiLnygMjHH7UZTiONfcEuc/54Ezi6tg9SpJ0XADB+dGsSMvRO/mxrz3xWMDnrULaYkDm4FEDbFNIyt87LrTwgW6Aa5Wv8IJq1nHZLPsWc2KSRp/UlXzlUuVt+L2ZLDGf+yJuly0UTZW/lyKYRwZsVwmJnLhPD5yhHwUCL/ea5/P161lUWaZrJ6NUqdOykK9Od86XkD41qYcHuWwoVbpwDiAI9FDu89U/f6nlyzDaPkrAigV7L+EeQt3eFtmqLYALKS2pKKCBWj3HO6lyJ1LgqbUFQZyAJ9uCwWXrUvEKE/9s3s0asWQ==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(39850400004)(396003)(136003)(366004)(451199018)(110136005)(54906003)(36756003)(316002)(86362001)(6486002)(6506007)(186003)(2906002)(5660300002)(4744005)(66476007)(4326008)(8936002)(66946007)(41300700001)(8676002)(478600001)(44832011)(26005)(6512007)(1076003)(2616005)(7416002)(52116002)(66556008)(6666004)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9511
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT014.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	8f2f7b48-5d13-4135-8fd9-08db1e773d3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5b92Wq9WKBngqVOE1Vv42j0bHdgJt5fCCNqbA2RD/0FouFlydW20UCMSjJOkJIS3WbGdzAjrqnzMdvUp7Tu2ZAO1wxVwDkpU6e5MSHvdKccof3aaRlqAXwlY9VxOLws9gUmOTBqYPbeiMZqIHNpy93LeoWMc1LglYWDl6ctTqw2TUkFn2SmCeagCpPjaIzKJZCjQxFwKaFXc9SWaVeMYEshyZwv3IuOee1p2i2z1gt8UFwxEhRCU+KNrJ7G3sRs/LYkc5lNdW1jvAaXS07ja13Y2Cgg5fsDcPu/aqE3Wwkk20NwGNRianGskipROWhGTy85HLQx71Kae1y4kKEohXSLfUcxhLHNiL8ITsBxJd806T7n6wcfPVog9qzm8+fYiMF0I2PaNv0nW+kbQePaI7+peDNnW0loUV+OhqdZg6XwMDgBW4EzCRKTUC9L9jLsiJSbobY9VYsjcofQ7gVZgeckEKAWT8+Y5W2WsgiUt4g7bIe7oGK5axUVS8ggCFmGrmRmU3VBgj7x5rdSq2zLVp6uGjbHLljGn7TXdacbo+8CkxZalfoStNjHLUSv/vVdMQUuyl4N3dSMNZHCAxQ69gsrmWa1l4pgSpSsl1bgWPKErgZ86ib6EYrWJQ/N933x2B71v7aLPA6jRaENW7gLsk5zC9yaes5gioh7it7rMCCcL+DGeAqctboJfjt98dLATaGt+xT2X7IDhK/22qSpIg6D3u/FD+lwRNq7buApZV+lhqytsDKeS+GkUQPlDhbO7UonEjWUOQlXEVyQDHkSbPg==
X-Forefront-Antispam-Report: 	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(396003)(376002)(136003)(346002)(39850400004)(5400799012)(451199018)(40470700004)(46966006)(36840700001)(36756003)(4326008)(70586007)(70206006)(40480700001)(7416002)(41300700001)(8676002)(8936002)(44832011)(4744005)(2906002)(5660300002)(82740400003)(7636003)(7596003)(356005)(36860700001)(34020700004)(86362001)(6666004)(1076003)(6486002)(478600001)(110136005)(54906003)(316002)(82310400005)(47076005)(6512007)(40460700003)(6506007)(2616005)(336012)(186003)(26005)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:16:21.3561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 162cec68-62f5-47af-ee3e-08db1e774533
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT014.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10086
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

The next few patches will break ethernet if the serdes is not enabled,
so enable the serdes driver by default on Layerscape.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v10:
- New

 drivers/phy/freescale/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 6bebe00f5889..b396162dc859 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -54,6 +54,7 @@ config PHY_FSL_LYNX_10G
 	depends on ARCH_LAYERSCAPE || PPC || COMPILE_TEST
 	select GENERIC_PHY
 	select REGMAP_MMIO
+	default y if ARCH_LAYERSCAPE
 	help
 	  This adds support for the Lynx "SerDes" devices found on various QorIQ
 	  SoCs. There may be up to four SerDes devices on each SoC, and each
-- 
2.35.1.1320.gc452695387.dirty

