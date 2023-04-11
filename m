Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6966DE44E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 20:51:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pww0j0J6Tz3f8g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 04:51:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=k67jmEMd;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=k67jmEMd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe12::328; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=k67jmEMd;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=k67jmEMd;
	dkim-atps=neutral
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02hn20328.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe12::328])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwvt112Myz3cFP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 04:45:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7xV5Io7pBnAgP35FjW3L9tKCIkH6Y1KxJnYWFc56y4=;
 b=k67jmEMdpuXaVuCAbrDbnJ1kiXDmJB/jt9WGNoRgxAlancFxiP/kVsNDrLOrqUY9cwkRSEHw2T1SXK32DsAr//Wh416xn09ub01kddqKTua8EWrThS49D1w66GaXTs2XAw+j2ICjRBI9Vfm81Wc6wgJ+r+K67kWomc1J61U0pOjA99YwmrOxOXWLZmRUrB5ZGSCAL+xJ6eXBLfCAZqPQ4LcyWgIvk/zhH+L9zIa7a4Depq4+emxZ2QxXSL51Jl4tTli/ZwnLRxMttR1apDwQgWXW+Hd8Zp7GWFvgYcNCErx6Jpl9etTaT4zHizg5V2jybhjCcMuYGr8WMU4bzCiQvg==
Received: from AS9PR06CA0340.eurprd06.prod.outlook.com (2603:10a6:20b:466::35)
 by DB3PR0302MB9111.eurprd03.prod.outlook.com (2603:10a6:10:42b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Tue, 11 Apr
 2023 18:45:10 +0000
Received: from AM6EUR05FT041.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::ca) by AS9PR06CA0340.outlook.office365.com
 (2603:10a6:20b:466::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 18:45:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.86) by
 AM6EUR05FT041.mail.protection.outlook.com (10.233.241.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 18:45:10 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 340BC20080270;
	Tue, 11 Apr 2023 18:45:10 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (unknown [104.47.51.239])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 57C5220080073;
	Tue, 11 Apr 2023 18:46:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0uc3B+APWxQoDjroL+wf8GUYW1g7bb8rOhw4nkDwIgZaedptFabKH8O/QIA0BA0YsdTIlbc0czIl5XYTUuKi1+Rl9kwwOkEMeyuBj8zBZB0ca+T9o4Q3dgYeemobEw4W/Hwuz3Az66Nd+jpZ1CiAgnWDh1E3IwxUB4lF59FWH0zKqCB0q36jeYjeqK+6aVHWrAyxhtP6nlAX42HveKywMBBLkDp7Gb85BEwgr3I2KkfmLYfLLFU3JhXx1X/vY7RGo986fzvMru+U9VeQe44di4gILSvEmUqrQG7tKqjAdriGCd6GGthvfowy2GR9Sj09AsIHzf6hDzHaTDnDaYPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7xV5Io7pBnAgP35FjW3L9tKCIkH6Y1KxJnYWFc56y4=;
 b=il11RWUbMxZq6rngUvUi3m3S2rlW0BUovrYGVZJUG2LcCTfpqvpkvF2JLQUU+iQHZCATstGx5DiR8b3ZWzf+o1kCcWDI3IzjvJnGZyI9O80U2CV44/g6sGTYjUWb+EA/eBSek69PG7sfkwzPYcsK0eTST/0bDldwzvSXAEOCKQY5piv9Ul2XfyTTSb7Gnj3sRXjPJfR2SPE6HhgTo/UkSw99DrMM9v+Q9GblNln5nyysRsvULxeFg87RgHX2J7geqAq1UO5YlUsU94PnKFSmcG/zYsWnuTD96Q3+hKfoCvrh6ZUOVSUMvUCjEJ42tDgOOmIIfwjomnUZ6aS01OIQpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7xV5Io7pBnAgP35FjW3L9tKCIkH6Y1KxJnYWFc56y4=;
 b=k67jmEMdpuXaVuCAbrDbnJ1kiXDmJB/jt9WGNoRgxAlancFxiP/kVsNDrLOrqUY9cwkRSEHw2T1SXK32DsAr//Wh416xn09ub01kddqKTua8EWrThS49D1w66GaXTs2XAw+j2ICjRBI9Vfm81Wc6wgJ+r+K67kWomc1J61U0pOjA99YwmrOxOXWLZmRUrB5ZGSCAL+xJ6eXBLfCAZqPQ4LcyWgIvk/zhH+L9zIa7a4Depq4+emxZ2QxXSL51Jl4tTli/ZwnLRxMttR1apDwQgWXW+Hd8Zp7GWFvgYcNCErx6Jpl9etTaT4zHizg5V2jybhjCcMuYGr8WMU4bzCiQvg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB4PR03MB9433.eurprd03.prod.outlook.com (2603:10a6:10:3fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:44:53 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 18:44:53 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v13 08/15] phy: lynx10g: Enable by default on Layerscape
Date: Tue, 11 Apr 2023 14:43:05 -0400
Message-Id: <20230411184313.3679145-9-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230411184313.3679145-1-sean.anderson@seco.com>
References: <20230411184313.3679145-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0350.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::25) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB4PR03MB9433:EE_|AM6EUR05FT041:EE_|DB3PR0302MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 9698368a-258b-483d-98fd-08db3abce0e3
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  vyKJwuqhd7nEpN/WnP7duhlZtrh+N03T7U6ZXhW5HWoJMaZqGaf0ttQcIS1SZDXXjH8szvjbdPZSmhgVhi6ReRHHk6abwF+YHKZBnOPt7UtDclSf9cGuhbySdWs67EvQCrlIlYxl/rr9QpO1PwVXImnhK54TkTeCNWxrzxsYLooW0I7gl6Zr+YRSw3omkluQkwVVCG8pSVohAX7znzq3CLTbCWWwxClVXX497e2nk4pi9XOkGsgBSdhItKD3b+tEyBSoFBzk3K6/w0w4UmrsA6K8fw+zXcjHSfP3x+bmi9kKWmwhIdNDvjLE6fSCD+Zhyn4IQI66Wv5Uerk7Zv3HWMpBLgvhq0BU7ABJDtZ2v+L4ctPdYzCxBTNbzA5tTm8+zIJLY+aqWYOq2LSRazsv4ML2cNoPt5gP1nh8UHcWhPj23JkDbwpHysYqSEkNuygTtXXIajUVK1Jj4m47rxkQzdHrh1VUKUJEg2u7CXdXXAReGBxQwIFOMMYkwsRWUVYSOrtpwJSbf/tqjVFkl8/qI9RhtYzim3DZOoiD+JvPCvJ7TIktFtMPOIi8zEhLbvqmXK1kwmDGlER60UHMhd4D2p8FIn1vRChDF6wG3u04DBFfh3V5thO5z6T+RfYuR0Rx
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(396003)(136003)(376002)(346002)(451199021)(316002)(110136005)(38350700002)(38100700002)(54906003)(66556008)(66476007)(8676002)(66946007)(4326008)(86362001)(478600001)(186003)(2616005)(26005)(41300700001)(36756003)(6506007)(1076003)(6512007)(2906002)(4744005)(44832011)(8936002)(6666004)(52116002)(5660300002)(7416002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT041.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	b0ec23a1-562d-423a-560d-08db3abcd6c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	a0WE5Z3MzvOdtA4dBK7/d/nW9yUXDFjXOM5wEeZ/ABkZfo1LoeroRoKvEzHo9aVeeMCihfKur0kzWfJDqnhNe93ZA/qX2inqfHdXAdTT4TxN7Cunk9rxlU50QuLrH/uS6pTF9DZTXHZPH6RKm3KtH6IbE7i9gukF0E35VVAKeSiSYI4Jyhj4Q1HQDyGSImYJn0eH4Ksepl/MLbgl44QuSKL1y8fTwteKsoY463Gm7bBenpKopGufjisMzBnXEnIuUafJPykLm9NaY6s4xF/GZFJvxfsk1Xg/AOAhr3E6bZZxUJBg1gX/kbLuLNXkNN9frKIM7NbHTMaZV/o0qAmSnqrO88M4SnnQXqv4r/vHtfrOAJaZzPf6M8AQC/UOEzddkIix3zX8ypP45EXLSJLTF74FGp1BiSk0VmGYZz91kiwH5rlGqY0VlN0oOU0q/3kWwu6sbdSyCBsxRPvx9mXok1ZZ6jKcyrAT2AK/eY7nphCCnrIlQhncXIIaZQnjG0nOH0wgBLta/0On7mJFvaJs3+DKZZmHKsjKuBLOx2C6TL6GOIyxobdVPL6pQNlfmLGcO35rznuSUSXRswxKklcHh9yRUP+57TXH11IL2lmrnmmVcUBMh4qkKQWWxkLWeb9uYp2yoo8X/IHq7WYf8b9Xf7ewqZYqfE1AbPYBFnn6Tgt86pUynQiiAcestxlqo3iSy8tHPr2WgnNxT099IyL8+wXMl97cWtmRVLqlHyREEAM=
X-Forefront-Antispam-Report: 	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(376002)(39850400004)(396003)(346002)(136003)(451199021)(5400799015)(46966006)(36840700001)(54906003)(70586007)(110136005)(316002)(7416002)(4326008)(8676002)(70206006)(6486002)(8936002)(41300700001)(4744005)(5660300002)(44832011)(47076005)(6666004)(336012)(6512007)(1076003)(6506007)(186003)(26005)(478600001)(82310400005)(2906002)(2616005)(36860700001)(34070700002)(7596003)(82740400003)(7636003)(356005)(36756003)(86362001)(40480700001)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:45:10.4019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9698368a-258b-483d-98fd-08db3abce0e3
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT041.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9111
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

