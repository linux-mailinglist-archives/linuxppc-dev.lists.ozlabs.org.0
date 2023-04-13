Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E07B6E1220
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:21:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4ZT05fPz3g6m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:21:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=njZFBiul;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=njZFBiul;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe02::32e; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=njZFBiul;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=njZFBiul;
	dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01hn032e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::32e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4Gy2pwGz3fCk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:07:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7xV5Io7pBnAgP35FjW3L9tKCIkH6Y1KxJnYWFc56y4=;
 b=njZFBiulvSEJfRhnWwBfSrBJOZicKgQBFxKu7ji3+itBtNuSpoFUvze2wQxA6QG+fGlUOnWNbjmpxVJLUtxt8AI7DbNVr4nE58PaDmoMaOKlcjpesE0Wn+0pQqNwM1N/aizO1O5Oa6ZkqqBQAwDPsVPu8dZBfRg7+6/clyuk4c17WtQ/CkwwqiDu7v286yyqYBOeGF2vPdBUyGdcenSco9XhjINV2THs4Jk1KeFOSesN7A8PU8mqjDnMzr+YDZ1y0JY+LgcxyHGYYeGF88eSqvEdGp1LJwCElr0ONwEtLmqdTsD4woSTIb4oc1Ct3+lfwn9tcsMSYlRg1y9PwljBqQ==
Received: from AM5PR1001CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::33) by AM9PR03MB7899.eurprd03.prod.outlook.com
 (2603:10a6:20b:436::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:07:19 +0000
Received: from AM6EUR05FT062.eop-eur05.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::73) by AM5PR1001CA0056.outlook.office365.com
 (2603:10a6:206:15::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 16:07:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.82)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.82 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.82; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.82) by
 AM6EUR05FT062.mail.protection.outlook.com (10.233.240.254) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.31 via Frontend Transport; Thu, 13 Apr 2023 16:07:17 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id ED39E2008026E;
	Thu, 13 Apr 2023 16:07:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [104.47.18.113])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 5796020080074;
	Thu, 13 Apr 2023 16:08:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvVcbGr85vRbh4TZQSYj3HY3S9LUsJLRt+Sp+JePkAcskP9u88uJzIouoG2/XyUwneV8fz5pjnU1Z/Z4c13B3yAknv9yoTEk6xhYWKS2xD0eudnhYHbpwMfv9VrkIZ3hs9VjQZ6pzbUR9fQmiFPTwsVGM+xG76VRSTEKeAeT6qs1PE/FfrBwPLWStvEfTFeV0s0H7j6GUuSsdi8A8WhJE3Ig8vdxrHb3Abc0iXHblsGKUqHUUsOu0C7RQuweZ2HqB3qlRaPvgR58UeoE8VEXAWgd9dcpYFw6Z2irHiQsrfhkLwHmSxiAIoQwxlcZ1wjcTrAR/GGBio1JlIDjOwShcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7xV5Io7pBnAgP35FjW3L9tKCIkH6Y1KxJnYWFc56y4=;
 b=gUTlWJjoXznurURIh9b4CO328eFd64kroYwe94FAeFGof4ZwlvCszIMqwQ08J+AzhWIH6QKY0aFwrn3ybQvVVkazn44CTyFdHF2pnqyDwBVQTGksVFFwEDG7pm/6z3bZ6deEaGGLwr0E7isZzaWckXaaWS26ebSrkmQHVnHerMojifix1WVUDCn/kx2D0avM0qxmh3IZOQNqOQzYZkQWR4kJDdkp8K0B4fARzTjDQuZJnIuEoq4QXsWrW7Nvs0UZuTjSo8X+ZHVjkxQEKnVlMrZXHk4ruMIPmvt50cI9twKpnYrNoV2nDUl6xqCHU4rd6npGmaF5oAduUmWJ7nnV+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7xV5Io7pBnAgP35FjW3L9tKCIkH6Y1KxJnYWFc56y4=;
 b=njZFBiulvSEJfRhnWwBfSrBJOZicKgQBFxKu7ji3+itBtNuSpoFUvze2wQxA6QG+fGlUOnWNbjmpxVJLUtxt8AI7DbNVr4nE58PaDmoMaOKlcjpesE0Wn+0pQqNwM1N/aizO1O5Oa6ZkqqBQAwDPsVPu8dZBfRg7+6/clyuk4c17WtQ/CkwwqiDu7v286yyqYBOeGF2vPdBUyGdcenSco9XhjINV2THs4Jk1KeFOSesN7A8PU8mqjDnMzr+YDZ1y0JY+LgcxyHGYYeGF88eSqvEdGp1LJwCElr0ONwEtLmqdTsD4woSTIb4oc1Ct3+lfwn9tcsMSYlRg1y9PwljBqQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB9369.eurprd03.prod.outlook.com (2603:10a6:20b:57b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 13 Apr
 2023 16:06:47 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:06:47 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v14 08/15] phy: lynx10g: Enable by default on Layerscape
Date: Thu, 13 Apr 2023 12:06:00 -0400
Message-Id: <20230413160607.4128315-9-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230413160607.4128315-1-sean.anderson@seco.com>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS2PR03MB9369:EE_|AM6EUR05FT062:EE_|AM9PR03MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: a283fb46-756d-4d36-5ad3-08db3c39272b
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  HHpdhUR1KQeJgOomWGMTQKGwqBtLhDmGVx2cI5+5HqgweXuy6M90/nniSIBQ+rRHx0vb5BBX7zaf4yfnyL83cazgcgT+NBbd6gVtPGUwRy4L7bAaQEGt86S5unJ6aNbHe5wzGlSmK6jniA46BAsF4MuOegnQaSrg63Dd8WwJM7RnN0r2XmCt1w1OY2ROJhkBoF7xpSXiEQI1JQ9xp0jxP/BI2FNxldISWiQFy2Fg5HBV0mw/xQcgG4p3QD/ZBBQIV1cVgvGlKpU8TT9mtlae0Cnf/V43aqQXk+A5bzjvRiGLVjUThvMQyP1gsvef5Iahlgs0LXa2h75I18hXGE+vZaVtJCWCPE3++rcrpHmPNDNkhmF1q0vvMH/gtr3Aqg7k3CjG7hzyDWvxFnu2GYB9B6Ospz45xvELE1HWvrQYb9R41N0OhZM/ArrSpn0IZux7rjzAMw/w6/UmsyWFQJZhhp2b45W+j6sa0YMOs6TVmB4EphR3ryzIib2Nr3k8iK7BfDee5Y1aS0XxeB2wkCDI10PdLAFzt8HAPEXNQCcgfVrW0iofC0pecBFrdbO3K3QR71oJOdUCgESqQJZUl7z3menmazOmtEkEgkYgqcJuy8/5RcN3dlAcqTlnZy5V+HkR
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39850400004)(396003)(136003)(451199021)(478600001)(52116002)(6512007)(36756003)(38350700002)(2616005)(86362001)(38100700002)(4744005)(2906002)(316002)(6506007)(26005)(110136005)(186003)(1076003)(54906003)(5660300002)(44832011)(66946007)(6486002)(66476007)(6666004)(8936002)(41300700001)(66556008)(7416002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9369
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT062.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	e9aa2809-233b-4e40-347c-08db3c39158e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Af2JxjVj8eWpCYDTAFm7n3ed/ctRlV/ru+s/Mfq63RwHawLnbS45CZxGQ+E/wyXkJqt/Ufw7ckmyWN+U8y30EGD2jlhCuWDVE01K1BU/eEm2YHfKVaZiCPMLqa21F34kAOCdgDirKpbxR8VW2VQgwkTgt+x+nw2EMEtC7qw/cPFbM5a8vfOXDXBGpyTpzPOgpWGEctPmQEFnAdnhXFZHoyC+YRO1Pvu7JxI3C/ej4NIQ2XwRs8cvIoz+W49CLSnyT+08P9AzHvhGzz+7ntq7Me1JEkqYT0LhNpybs0q9PnLVC02DklTHXxg3GmBshr9k/hf+jxz5rC6y1vbrPGrkxp/fzQwFt3DUzp9kwidFk8IBOoNArbzIrWQRsCu6rCABEX+mQYrl9US9CrLwP6lZ3cR/9wZQoXEa09qunVbwcShNzkN93RP/sIKNNeU3T1aewqaA2W1sGLozV1OXyOPLH6wr1lNGImY3ScvB15drsv9DD+wN7Qd3hvLcglEySmltgXocWZkvHFNUxCzH/EhskEtgeuM7gW492cDEzQ2RXRQjRO0v5qfjyC8zri2kM5AoKORzS2AXf1qkndMSi+wjeDdWvFmaSAZ9VpI727pQOmMZtbOQLTHiZPqnmCLul/f8twN6X8Kfiirx1YwnPfEC5SUWL0tq4OOJSyJpAw98eomcPX2vRgaLc3VNjZYaHk9x6RpzsxF5yJtG6F1RUDNj2Im3KMwbaqiv/f7Cfs59cicQgXSPJp9EpFLO4TpKufXz+qMZXwZki7L8DOvX+hQz8w==
X-Forefront-Antispam-Report: 	CIP:20.160.56.82;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(39850400004)(396003)(5400799015)(451199021)(40470700004)(46966006)(36840700001)(2616005)(36860700001)(316002)(70586007)(70206006)(4326008)(47076005)(336012)(6486002)(478600001)(34070700002)(54906003)(110136005)(8936002)(8676002)(7636003)(7596003)(41300700001)(356005)(6666004)(7416002)(5660300002)(4744005)(2906002)(44832011)(82740400003)(186003)(6512007)(26005)(6506007)(1076003)(86362001)(36756003)(82310400005)(40460700003)(40480700001)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:07:17.0543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a283fb46-756d-4d36-5ad3-08db3c39272b
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.82];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT062.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7899
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

(no changes since v10)

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

