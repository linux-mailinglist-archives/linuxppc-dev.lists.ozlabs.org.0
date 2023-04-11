Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A366DE465
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 20:56:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pww6c1K3cz3fqR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 04:56:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=N8FOede0;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=N8FOede0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1f::331; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=N8FOede0;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=N8FOede0;
	dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01hn0331.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::331])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwvt52kr1z3cKv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 04:45:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQ/IBLJPJKLMGOG98YGFx47EWKkTavnVAvIvbPe66Bw=;
 b=N8FOede0E/IMxWB5nG1O8cJAokgLE6bJDrGVPaMRwPllehxxsCtLmOXsKrtja60NSsdflHoSjiAjv1yXnGrmtKFEK5LdWjRwM34iFvc8JHWCtP6q9zZJqkn6MLh/zP3VzMFhGckhSEWQqIjeavDkd5vqCbbPaCLTJpMPFtuI3qyz4KngSJUaitW57zzPXeY6Px2WJPsq+Wa1hXfu4Vc0hKkYn3Z6WuslfIxJsNQ9i4NH9TfdRUsSEZd/WOAV45V0SYmFPSJncLXc5OrAHuAigkT9JRIjvo62I0BJ7ARFli7kfJ+Me3iHMJZfkZqnH8yCesfHUIKMrwiwhWgdZD+qDw==
Received: from FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a9::9) by
 AS8PR03MB7014.eurprd03.prod.outlook.com (2603:10a6:20b:297::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:45:15 +0000
Received: from VI1EUR05FT021.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:a9:cafe::21) by FR0P281CA0096.outlook.office365.com
 (2603:10a6:d10:a9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.29 via Frontend
 Transport; Tue, 11 Apr 2023 18:45:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.87) by
 VI1EUR05FT021.mail.protection.outlook.com (10.233.243.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 18:45:14 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 33BC52008026F;
	Tue, 11 Apr 2023 18:45:14 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (unknown [104.47.51.239])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 4A6AA2008006F;
	Tue, 11 Apr 2023 18:46:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cme9tir0HQYnRBTfDrF1S1KDsic9bGNfIiSQsrza8cSSvoQzqN/z9/qJrqul6BDoUlkytEK56b1RpuD67g4iUpVeYQQiijnec6hsdhwLi93oQLGWgl0xye8bMpuCwxAMKHXFpeDOUcUufMHkiryGw+uMcneWjMcft9nzCFhuRUwLESBoaIcXTYdOZOPhRlXB3qveSIEnC1k8h5TGdIS/DtP2JR7zKeDvrPLPJUsH4WOzPPyxZ2N3EbCxOX/mbVi8Ekx8iauhx4eFeN8SJci02ooyBLYOdC+3CvBMpyEZbTtWJXVo3nTN8gVgKOusdlipm2plyuMrL4eiSyCQ8Ifedw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQ/IBLJPJKLMGOG98YGFx47EWKkTavnVAvIvbPe66Bw=;
 b=aX8G5YS1mcTJL7MNyi/SQY2XGQBf5Bl2tBOJaixpYwes1m455O4qMf/jqL6mkdBe2is+Gfj8BVQhgOYJyI7QChpCIYYUrDinwH9oAvVg/8/SI2d69BVy4OVWyelsgjeKCILAWkt5VDpfQmjvFa7Oyen0QbBtHx1Y+M4w5LxDA7G1vhALiBtwuLtww1143Bztv6RRPlrqtct1zZfobWr2MgJbWr5MRfF1Lu43ICTG/w9F+4SFB2B0p/SdTVEs1WIDFHCWn+qCIY7lrWh4UYkzoJJpMyiSGfSUGNIGuE5LyD8uPHxKnXMd+291iOYJ0R4kqX4paZ022HcLbSqyHB7ylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQ/IBLJPJKLMGOG98YGFx47EWKkTavnVAvIvbPe66Bw=;
 b=N8FOede0E/IMxWB5nG1O8cJAokgLE6bJDrGVPaMRwPllehxxsCtLmOXsKrtja60NSsdflHoSjiAjv1yXnGrmtKFEK5LdWjRwM34iFvc8JHWCtP6q9zZJqkn6MLh/zP3VzMFhGckhSEWQqIjeavDkd5vqCbbPaCLTJpMPFtuI3qyz4KngSJUaitW57zzPXeY6Px2WJPsq+Wa1hXfu4Vc0hKkYn3Z6WuslfIxJsNQ9i4NH9TfdRUsSEZd/WOAV45V0SYmFPSJncLXc5OrAHuAigkT9JRIjvo62I0BJ7ARFli7kfJ+Me3iHMJZfkZqnH8yCesfHUIKMrwiwhWgdZD+qDw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB4PR03MB9433.eurprd03.prod.outlook.com (2603:10a6:10:3fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:45:02 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 18:45:02 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v13 13/15] arm64: dts: ls1088ardb: Remove aquantia interrupt
Date: Tue, 11 Apr 2023 14:43:10 -0400
Message-Id: <20230411184313.3679145-14-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230411184313.3679145-1-sean.anderson@seco.com>
References: <20230411184313.3679145-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0350.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::25) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB4PR03MB9433:EE_|VI1EUR05FT021:EE_|AS8PR03MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: 2801f42b-2c99-447a-2128-08db3abce358
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  TnB9mALrca7KWBVK7QgrMlSQnkWQ7MdB8BBkIWpZWdX47cvj56rvY/n0B2/W1smuCDiH95Q5TrY163+LOBV5lHKKnFBf4qWMq2heWNiKIFZYRg9tycTShU37XIOKn+1bzOcUwEZJXi0Y7VpDeBRDMAYv4yQ//pJsdaeeiE7++nnOPOLRdmcQWVBI+F43RWXYi9flp3vUYLtlD/+ID3wfDznfzHO7hdwUBECV1k9dXxOxlmNJoX6/HSootlU/Vt6EKYkwqkubuRayusb0YVx0A7K2K3LJ7KnEg50qAHziVekRwkPMDoStejL1krKeXWZLUMyHFFr67fo9QPuYn4OJkH3wIvaXgWPgo9rw0Be36jBzQPexB9UQSbyqpjUV6a57thO1FcG4/VDLHsMXkTyd7wH1oM8W4GB49uyneANROS4o70qfOtFozZrfEBzNLx/2fB/kf6BtTJRohzUj+Rmcl/A7AkvDt+4mO7NTiBDPkXznu/swE0925aqv8Z49fUvyHf1hIK34A4FDJKD5NZSa43m5/zF+twbfUyrrpkIYeA/PVxtGAxVdXZUE5OIthRfX61EwOFn0FPudPIc7qIajLJADDyB3rSA2VzSl+XdszhizTQDRqQFFMdVWQFn4Z8YL
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(396003)(136003)(376002)(346002)(451199021)(316002)(110136005)(38350700002)(38100700002)(54906003)(66556008)(66476007)(8676002)(66946007)(4326008)(86362001)(478600001)(186003)(2616005)(26005)(41300700001)(36756003)(6506007)(1076003)(6512007)(2906002)(83380400001)(44832011)(8936002)(6666004)(52116002)(5660300002)(7416002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT021.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	6dac54d4-3adc-455a-d653-08db3abcdc10
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	X71qISD0xGgyPgaq5xLCDIhzvlhF4F/kdDTFrI53bwvjDekYQZ1pQoFbnQ/IA9FOnyMJudpdTINuGn1TRMCWXBkBuWzkk8dXokykuIN7XeLMULqok7bCriVaoBhVs52X/ojqMSzQHDgcL2uAopUChYtUGa/j3l1/60wjsc95lOlfPzMOJZfRCxYnEhfz/Hjte3D4KlcyxNAqCPOls4RNsMjfJuUWeoV2CL3Wp7lyruCbTRdCbuVFaou83LfigOhv5V5DTA+0WY/k/GL56a7H+iALe4qG76vDhYE04cxnobxSZ7/x356Alg2d5xIbLFcBnLdQr60DtwaCfbkdUGlqWoptRhgvIDtKH1vh8Y5scG6nUHhWiyghGb38Rik3HbE/oczuNXHmuoC+i13EiE2ENyrUv9SCI6sZ5cWOwlGrM6BiPiyk6/WtOvoGk7XrCEDLHvWKs5YC05ZRUHAtHRzMX4MOik32xMSKXWKFTYJzyBkjrf7I3nHoHDTZ7bkscmYm3wHyc5XH2Bp6lS9IzOyXArtckicKJLI+NsmgXv8c4cOaen3s+4GDbwHHOaGcVWHTWznAr+kYGQ8IGUrqdtbPtoXzhR97Jjqk/2iFirNiceVP5578NvwGYCKSW7q2wx9B677q637abt6RQr5Ay+xSwC4KDL2kxV9RstvrymuVxXfmNeeytYNd8MxgfAc2QqPRP2fVHXC7CRiygkePaQ0YXLSNkWWe7+AKDCOw/qH+e6wGSFYvbN+AU/0G9WGDc4pqmdeZltfJ9wxRtZQlRvTEpg==
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(376002)(396003)(39850400004)(136003)(346002)(5400799015)(451199021)(46966006)(40470700004)(36840700001)(478600001)(83380400001)(86362001)(40460700003)(40480700001)(36756003)(82740400003)(7636003)(7596003)(356005)(47076005)(6512007)(36860700001)(336012)(2616005)(34070700002)(2906002)(1076003)(26005)(316002)(110136005)(54906003)(6506007)(186003)(44832011)(5660300002)(82310400005)(6486002)(8676002)(6666004)(7416002)(8936002)(41300700001)(4326008)(70586007)(70206006)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:45:14.4742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2801f42b-2c99-447a-2128-08db3abce358
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT021.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7014
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

On my board I have never been able to get this interrupt to work. As
such, the link does not come up. To fix this, remove the interrupt,
forcing polling mode. It has been reported that this interrupt works on
other boards. However, switching to polling will only result in a modest
decrease in link up/down delay (.5s on average).

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v13:
- Split interrupt changes off from serdes support

 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index ee8e932628d1..391c2b8afa81 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -128,7 +128,6 @@ &emdio2 {
 
 	mdio2_aquantia_phy: ethernet-phy@0 {
 		compatible = "ethernet-phy-ieee802.3-c45";
-		interrupts-extended = <&extirq 2 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x0>;
 	};
 };
-- 
2.35.1.1320.gc452695387.dirty

