Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED466C3BAF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:22:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph31h2h7Dz3fSn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 07:22:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YBOZdBrh;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YBOZdBrh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0e::31d; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YBOZdBrh;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YBOZdBrh;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04hn031d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::31d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ph2r83XwBz3cff
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 07:14:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7xV5Io7pBnAgP35FjW3L9tKCIkH6Y1KxJnYWFc56y4=;
 b=YBOZdBrhYn/fyHY1hhUpoY/ewv9RCVDrnqa/CNrdnbIFNQkLe9NBzihNd+i2txS8pLnMsNHjcEPmLE3f97uy5IL4ZyqeliUkoIws8KHow1aJnK28eVqqpvzk+Lk9wsd1pM9f6d4dYRPUXwktDHLCSotpdBUoLxgxa85bFIz4r+etoDX+0nUFoVTX9V7pN1fnIt97Ch4QIPZO1sBIe+yLKCu3moFNtGUqCV0nu24g/JQr8pq69fvKxLlhtGj9ZTyPZ0nfLjHz7VeYwe4+T8gHtI0JV3iR2ZRjoEj2oawX7BQTlsWO54KmjghJ61eyFFYTtvFoIqTX7/fdhY+sJEsJ3g==
Received: from AS9PR05CA0067.eurprd05.prod.outlook.com (2603:10a6:20b:499::23)
 by AS8PR03MB7205.eurprd03.prod.outlook.com (2603:10a6:20b:2b4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:58 +0000
Received: from VI1EUR05FT053.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:499:cafe::7a) by AS9PR05CA0067.outlook.office365.com
 (2603:10a6:20b:499::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 20:13:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.82)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.82 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.82; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.82) by
 VI1EUR05FT053.mail.protection.outlook.com (10.233.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.16 via Frontend Transport; Tue, 21 Mar 2023 20:13:58 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id EA0A52008026E;
	Tue, 21 Mar 2023 20:13:57 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.170])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 8D8172008006F;
	Tue, 21 Mar 2023 20:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InzLWUte4GqtKzLd/moljaB/hX94EnkzWK8I0JWHKg/m4EMCfKHgAvgGZLddyykognTnycv2RJxUVGWLMjKpUpuV4+382TgT2DIR5FqoRLnAV1nhhSNeQu+aCIlxOjXmONAiJc2hZjSK4JPCNk8u02G8Bq6aj9dH8RTHNTXx9IlxynpeYN0tmmaXm99Do+I92+u6wwmovvJXGedTX9GWbEF6mRzjH+T65gB4XPnlVrUzaeOS4bgO9s+WeakqfqXb9luXVx6cjxo1zSRd/yKvfxpk/eocazjL6IO63rOK8bPuVp1F92eKDo4dO9sRglvGjjthsTN4fV8l/dYAeBNkJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7xV5Io7pBnAgP35FjW3L9tKCIkH6Y1KxJnYWFc56y4=;
 b=GEXIjHZ3WZeu2kZhU3E3SU3ampsK94qc42BVeiHBYZ6bQsxgp304AypEdCnoi1lw8QzzrDoPg9O4J1nMs6nJQVLojFmC0HoNbR1ccrf52OB+WXIjIF3DWQ78RtJC6t4lLmTo5///OA7djC5hw2z7APEFIczX8+ofSkZdBB8WytVLfFZzi8gTA6j91N7BI8DoWgSBOEO5AciQlL1XHUxUcZxmwDZU2ZYMK8vxaTnoxqdPU6+/9ASjAWQyWt877yCxICOnLtW4DO5GbEtF1AVU3Pn7gY6WEkuFU5CfKJDej8jTKxmgmeupEiV/5UplhkUiVXkoRU3+uz3FhpcBID+1tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7xV5Io7pBnAgP35FjW3L9tKCIkH6Y1KxJnYWFc56y4=;
 b=YBOZdBrhYn/fyHY1hhUpoY/ewv9RCVDrnqa/CNrdnbIFNQkLe9NBzihNd+i2txS8pLnMsNHjcEPmLE3f97uy5IL4ZyqeliUkoIws8KHow1aJnK28eVqqpvzk+Lk9wsd1pM9f6d4dYRPUXwktDHLCSotpdBUoLxgxa85bFIz4r+etoDX+0nUFoVTX9V7pN1fnIt97Ch4QIPZO1sBIe+yLKCu3moFNtGUqCV0nu24g/JQr8pq69fvKxLlhtGj9ZTyPZ0nfLjHz7VeYwe4+T8gHtI0JV3iR2ZRjoEj2oawX7BQTlsWO54KmjghJ61eyFFYTtvFoIqTX7/fdhY+sJEsJ3g==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7044.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:47 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 20:13:47 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v12 08/13] phy: lynx10g: Enable by default on Layerscape
Date: Tue, 21 Mar 2023 16:13:07 -0400
Message-Id: <20230321201313.2507539-9-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230321201313.2507539-1-sean.anderson@seco.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:208:e8::39) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB7044:EE_|VI1EUR05FT053:EE_|AS8PR03MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d0bd021-7e97-4bf2-c6fb-08db2a48cde0
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  DObb6c+yZ1x622r1u6AJelclL7DRphmHl5ZGy08C/LpUXWqsP8/Jni6Jlohe2wJ56voXnFzjQbXtjqnfrhvsGr2YoPjUBmVSRC8KvxVQkuzXnooTapgEib6XfM5K8JzZ7y92h2PhOImEkpAqDB7U/CIiNUASONU8MpydLk8E8wpwbj/y/KpMvs4/jCE30Yx9p6z8UwFq+XoalLN+/Bh8KOyYi6zoGyTg2lRnD8o5iQYKTICc7XZB/k3rNtwqUqduElhFgRG3JRfRO7WBESzNARD0Rd3YsqHBXGvSLl1hWCm0q8DQqx92Uq7qY5OMv/JZ6TAAFgAIPM15zwXulXfeDlICY5BLFc4tDJFucolt4R9wpu7LnD/B8xzWTrx6FrFhV8mMh9DrWeMMBRNdp85dY0IsXSinabDbcTPAzmgsscvvvrlCes79Cy6LhDdHbu6s3sVhRdbReg6zwxuR6mPayr4C+fcfzTjSuuxAMajmvbBHrSUi7qUOQHe4ZimwlLErGqGPUvg+OL9xYouaxH4o5COjxszAXGMuBMUgZz1TyC6zsMdjIBsfv8/U/P6lviMDSe5bgyavJjfzAzCPXgYdrROY0sl4d6i+NTR5wWArDhnLRUB0lPntHHsLN/lmsRe9CC20X9fix+Udsd90FPqjlboUEx3cTPDU3XpnVeyeEhcQexROcf3JLAzWEJ9n88/CfZ0o4TuOIpBa/TvVjvUOqA==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199018)(2616005)(54906003)(6512007)(7416002)(6506007)(6486002)(478600001)(316002)(1076003)(26005)(52116002)(5660300002)(6666004)(186003)(110136005)(86362001)(38350700002)(38100700002)(66946007)(4744005)(41300700001)(44832011)(2906002)(8936002)(66476007)(66556008)(8676002)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7044
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT053.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	e5fca144-6b2b-4418-edf5-08db2a48c710
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rOaIiymIGufzH6it2tI/y2xAI7tl+zBU+YE8/IoP3vdlf+91nNRJASKkJgGUXVcixhMykaUKVK3KU1vvWGWB9m8+MN6B8vr0f5xr9JMsjYp+GWQgA6ZpQsU9LxfflFLEhRZVHoh0qTcSW/eVVZ/Sb9ywaFZ0+f5sWKbq9njoqylHPS6i0AlkKoOyLbjs5RhPVjuLinqr3hG2sbWOv4Za1xeMwhUQzEtBpBmEk9qbY/Nex8JqgpkoC+IsEiH9hJSnXWRupDlrIEB/UxrGnI76ug7CTk0V+S9F6ZF9HLhYHcksoF0ka9+panRpu0kH8Koja0qjOmb8q3CFjs1o/W+7aXCGB88/xiNWUFc/L/QOsd8b3E7YhCG2DCjE2SDg52RhxURbebt+y3ypT9/bOfhQw/br095blEnA1BJhb+ct2vYFmigPIcgHrLVDOI59rbRzeIsJ+c4tPulQLUjMLm7a8X3AQasyAvtzp0vI/K6vei2YYp6etFWgnvyk9sc+e724vNWxdc8fvY6e2VSTv1Z5D+v5732ZODRG/fFZ1IpuDW7aCPiULqa8DDNJ/SPij/THHzSUtOMSDzBXurWi4H6Jvy4zqapt6u9Hk5A75Dhzrny8nojs64FmCasjZG+WHhG/ETFrJSrDcI/MG13LPoVQEToidGyJwjpPGj9diat4iYsJC38kbH7sQuCvTUoh2PpQAJOMCXMsp91WYh39K/17cC8heLQ6JNrhomTAgy9DMeSCCoCUR9p1nRy9QOIzsjcBqU2DzuMxPSJKA4W2hehicw==
X-Forefront-Antispam-Report: 	CIP:20.160.56.82;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(376002)(136003)(39860400002)(346002)(396003)(451199018)(5400799012)(36840700001)(46966006)(40470700004)(2616005)(6506007)(6512007)(186003)(356005)(336012)(6666004)(1076003)(26005)(6486002)(47076005)(44832011)(7636003)(7596003)(2906002)(40460700003)(82740400003)(86362001)(82310400005)(110136005)(54906003)(316002)(40480700001)(478600001)(4744005)(8936002)(4326008)(7416002)(5660300002)(36756003)(41300700001)(8676002)(70206006)(36860700001)(70586007)(34070700002)(12100799024);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 20:13:58.2191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0bd021-7e97-4bf2-c6fb-08db2a48cde0
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.82];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT053.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7205
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

