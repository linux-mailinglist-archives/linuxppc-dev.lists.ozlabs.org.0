Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 448B36E121C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:20:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4YX1Dy3z3fYN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:20:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=f7ZUPuGn;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=f7ZUPuGn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1a::306; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=f7ZUPuGn;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=f7ZUPuGn;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05hn20306.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::306])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4Gq4Gp9z3fRj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:07:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5T5adR62bBzCG/qwyNRKK+xEuguBVkNspTR8LZaD1Xc=;
 b=f7ZUPuGnb1C3OLIv7W7L0Uh39nF4w7v5E4iIKW9AgvI6jvv9dzBQ3PsVTD7kK8SvuCEL9ze33lfISXuuPRH68jNcAo/q8QfVpiYE2dnD8bIq4bMe4QWV6eKA/M+8iyTz9dM3F4kopsbgv9maIi6jJPsgOa/Q+hYd60oQ8fOoD+kgxC9iFzf6/KduZaEN3WTYXNdv+cr04602Qg73hKBCxLZ7jUKkaGH/JX58flyLw1OXuBfDTJE7Y3gGygwVyRpoyXlPSBIpTadeZsrd4x0G277z6UD9Qik7NH9jmO0ZtR87DuwBHCNCoLhMbZqsWCbTyJcnURU4YBEjcBS/p992yQ==
Received: from AM6PR0202CA0062.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::39) by VI1PR03MB6430.eurprd03.prod.outlook.com
 (2603:10a6:800:194::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:07:12 +0000
Received: from AM6EUR05FT065.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::f8) by AM6PR0202CA0062.outlook.office365.com
 (2603:10a6:20b:3a::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 16:07:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.80)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.80 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.80; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.80) by
 AM6EUR05FT065.mail.protection.outlook.com (10.233.240.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.33 via Frontend Transport; Thu, 13 Apr 2023 16:07:12 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id DA0BA2008026E;
	Thu, 13 Apr 2023 16:07:11 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.171])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id D78C320080073;
	Thu, 13 Apr 2023 16:08:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVsNL9+AX74XNtEO/B9F5Uhq47PS6IqVSkMaDZRCwE6fCcrLxSXbLfUQWf3vV2dY0+NhwKhDFTyczkFFC2KP1HGXEfg69wiKzOov1QAGSAJ5/hVXq4BcLq3Qv+GsESfV4DEMk2NyEuSY+DwTqjLs9/SoNS/fLDjir4G03fUN46KTMPMmYR5k4thyrU5+P/wSyaMAaXfLwg6RnlQ3JmNwMTEUDPMahZM+1CyhLrsL5xeb/rljTxdpYWhVcXkvuOq77iAJtlAFhWgjLYafkiM2lZr9ATQrYDbpujGYrrTHCpiSzhQUEHwvgdgT15dQHp8rx8WiyDphXm5bofJviIFjHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5T5adR62bBzCG/qwyNRKK+xEuguBVkNspTR8LZaD1Xc=;
 b=AHky4Myz2wxjXo9VLoisIaKloIk4VKnlXrnvVNHSOY/y2QjVomzABzyY7SuM0MmuwrdCO5XXDmawfeb4K90cVeCLSDy2Jk+bYNZYpoNlevNXctdUkrpFXMBH5gPZp8J7BfhCTcvet2T5DlEX1fKGWi8jUTvwk2YLn5GH/pmwM057LWroaRYxBotw/OYxX0sebXKh/bNecPf8MCyjEN1n6igdJox9HJfRVUr+Hml/Nu8wOvz54NeEoJ6YiKhwMjAh6RGKkEKOr2gRdfnTq6/ETOUH6pgxDjHZDrpheBHEpVwtdtjtPHyYXot9Hc4g3VHGI3p6IvEcQqW88UYwSnsuOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5T5adR62bBzCG/qwyNRKK+xEuguBVkNspTR8LZaD1Xc=;
 b=f7ZUPuGnb1C3OLIv7W7L0Uh39nF4w7v5E4iIKW9AgvI6jvv9dzBQ3PsVTD7kK8SvuCEL9ze33lfISXuuPRH68jNcAo/q8QfVpiYE2dnD8bIq4bMe4QWV6eKA/M+8iyTz9dM3F4kopsbgv9maIi6jJPsgOa/Q+hYd60oQ8fOoD+kgxC9iFzf6/KduZaEN3WTYXNdv+cr04602Qg73hKBCxLZ7jUKkaGH/JX58flyLw1OXuBfDTJE7Y3gGygwVyRpoyXlPSBIpTadeZsrd4x0G277z6UD9Qik7NH9jmO0ZtR87DuwBHCNCoLhMbZqsWCbTyJcnURU4YBEjcBS/p992yQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB9PR03MB8325.eurprd03.prod.outlook.com (2603:10a6:10:37d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:06:59 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:06:59 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v14 15/15] arm64: dts: ls1088ardb: Add serdes descriptions
Date: Thu, 13 Apr 2023 12:06:07 -0400
Message-Id: <20230413160607.4128315-16-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230413160607.4128315-1-sean.anderson@seco.com>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB9PR03MB8325:EE_|AM6EUR05FT065:EE_|VI1PR03MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: a43605ff-2560-4469-5a0a-08db3c39243b
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  cJmAarFb023qgeAOKoy34MGY8ynoZZVzvJ7fjkRDy9RwjeAbxIV7xSkV/YjyG86WTjbNRArqyfnNZCaO3F/s6/lrxKvUgveFIoJ2VsyLHlAgDqOCVSej7Cciw2/eA7W9tU167cR03eZiBQWlHQY4JBI6bhdoc7FV/TZPyK9ZWqJlpC3IA3YvIvt+ZdxYCV+RAELa8OGEz7VEOTEFg+JVOV9u8+Y7UaQdUDldJwxqKeoTY9IFZz9f88LhImdbUbrKK7Uw1jqPeVkwKoS20dh/FJ/N67SnxsIjpN7tYH2rL9HEiP6oDqt4QmZ7lHFqu/vKkIGTMKOBZjn9r2qYdxb0eFWFcoG1YJHfen4n3MtNNA3mNeCDPB5qRfEjQooYLAqU7QMS+XoObpCph3Me61LacjIN/W3rZ5S2wFVZHSDiPZF0euOrfAPZuAUKMV+Z0JWT0aG/Tug4P1gr1ulrPgG77dukHsEoMtTqt1Bp7wPP81R8Ux0ksp/35DQaG/P3VqQCmHna8OVVDv+DROZWk2GJKKdYpKdHAn4cdH4WwuqiaaHtTso4kUq9HHORsDGoOAnEw8EN+apDc9X7PLTKdvkkjqBXzT69C5g1JiZs4KGoCfkfFu6hGM8y/SSE9w6K8UBk
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(376002)(39850400004)(366004)(451199021)(6666004)(52116002)(6486002)(66476007)(66556008)(66946007)(4326008)(36756003)(110136005)(2906002)(7416002)(44832011)(86362001)(41300700001)(5660300002)(8676002)(8936002)(316002)(38100700002)(38350700002)(478600001)(54906003)(6512007)(6506007)(1076003)(26005)(2616005)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8325
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT065.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	341b1742-8993-45b1-22be-08db3c391ca5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RY5Fl+nI83RaT9OAgNgif6anv1aAQoEqFQzFu4JoX7p7Ugbx68Pan87gJhPYWF9S36OM0RxjY55pKhUX9Gsw5iv+AD7+Cd8RqCubHkPU0PY+lOB9rneTz9q3Xp4nc4Xu1eic+dxdPKoeivyfvDPJQiQVwlIMU8zANOJS1F8mkZvbwgiR4sUorLfkVRu1aDF4OA++6qHXPXQM5WErMjLEfn5e6HjSUh4Sw+f7NxMiXKq8tUMOVW/fhjmTgHr6pPVOYHqGqB+QljfF9YQ+l8PyhznHGymcVEzMlGCNXAEtpJGFr2RHSuxrX8WpEzImbCIANOt6LS/XzZnIcnQXKxl8prrzCZHRn9gXyYHOYHDlyirQusFDqv6LbIHlvmewIm3dXVXNPpgv/rTBx0UOPrtlJCcMwmgjIoTNDJb5RWGZNzTmtxSCagpXZvbv+9ofoCp1VpVZc2iAHF0bwXYeIRXmoXnC05f/mrOct/dE8+wbNjMln6BbSZNrbymzMjltvitj89RLBs/LJqTsQDqLNnuC1FJzJfw/CLoyi3Jn3Vn8Xb5hJNATl3vKQCioXHxbq8bbF8tceCM51QPoRQjpJ8RVXktCsLUhYryWSMPrscAOaABwwpqAlT4Hxop892t3+xGoHiC5SggFtcRv4YARf0nypnnI0/H1qOqU/wrO6Y+RAlThKHxj0UWjFJwHM7G1ldy7y9JLisMwxHXunQkWhWzACb1YMjuhDDqKVajP71oorME=
X-Forefront-Antispam-Report: 	CIP:20.160.56.80;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(376002)(39850400004)(5400799015)(451199021)(36840700001)(46966006)(6666004)(6486002)(70206006)(70586007)(4326008)(36756003)(110136005)(2906002)(7416002)(44832011)(86362001)(7596003)(82740400003)(356005)(41300700001)(7636003)(5660300002)(82310400005)(8676002)(8936002)(316002)(34070700002)(478600001)(40480700001)(54906003)(6512007)(6506007)(1076003)(26005)(336012)(36860700001)(2616005)(186003)(47076005)(83380400001)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:07:12.0947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a43605ff-2560-4469-5a0a-08db3c39243b
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.80];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT065.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6430
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

This adds serdes support to the LS1088ARDB. I have tested the QSGMII
ports as well as the two 10G ports. Linux hangs around when the serdes
is initialized if the si5341 is enabled with the in-tree driver, so I
have modeled it as a two fixed clocks instead.

To enable serdes support, the DPC needs to set the macs to
MAC_LINK_TYPE_BACKPLANE. All MACs using the same QSGMII should be
converted at once. Additionally, in order to change interface types, the
MC firmware must support DPAA2_MAC_FEATURE_PROTOCOL_CHANGE.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

(no changes since v13)

Changes in v13:
- Split off interrupt and SFP changes into separate commits

Changes in v10:
- Move serdes bindings to SoC dtsi
- Use "descriptions" instead of "bindings"
- Don't use /clocks
- Add missing gpio-controller properties

Changes in v9:
- Add fsl,unused-lanes-reserved to allow a gradual transition, depending
  on the mac link type.
- Remove unused clocks
- Fix some phy mode node names
- phy-type -> fsl,phy

Changes in v8:
- Rename serdes phy handles like the LS1046A
- Add SFP slot binding
- Fix incorrect lane ordering (it's backwards on the LS1088A just like it is in
  the LS1046A).
- Fix duplicated lane 2 (it should have been lane 3).
- Fix incorrectly-documented value for XFI1.
- Remove interrupt for aquantia phy. It never fired for whatever reason,
  preventing the link from coming up.
- Add GPIOs for QIXIS FPGA.
- Enable MAC1 PCS
- Remove si5341 binding

Changes in v4:
- Convert to new bindings

 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 9fb1960f1258..ede537b644e8 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -18,6 +18,18 @@ / {
 	model = "LS1088A RDB Board";
 	compatible = "fsl,ls1088a-rdb", "fsl,ls1088a";
 
+	clk_100mhz: clock-100mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	clk_156mhz: clock-156mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <156250000>;
+	};
+
 	sfp_slot: sfp {
 		compatible = "sff,sfp";
 		i2c-bus = <&sfp_i2c>;
@@ -27,16 +39,26 @@ sfp_slot: sfp {
 	};
 };
 
+&serdes1 {
+	clocks = <&clk_100mhz>, <&clk_156mhz>;
+	clock-names = "ref0", "ref1";
+	fsl,unused-lanes-reserved;
+	status = "okay";
+};
+
 &dpmac1 {
 	managed = "in-band-status";
 	pcs-handle = <&pcs1>;
+	phys = <&serdes1_C>;
 	sfp = <&sfp_slot>;
 };
 
 &dpmac2 {
 	phy-handle = <&mdio2_aquantia_phy>;
 	phy-connection-type = "10gbase-r";
+	managed = "in-band-status";
 	pcs-handle = <&pcs2>;
+	phys = <&serdes1_D>;
 };
 
 &dpmac3 {
@@ -44,6 +66,7 @@ &dpmac3 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_0>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac4 {
@@ -51,6 +74,7 @@ &dpmac4 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_1>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac5 {
@@ -58,6 +82,7 @@ &dpmac5 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_2>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac6 {
@@ -65,6 +90,7 @@ &dpmac6 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_3>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac7 {
@@ -72,6 +98,7 @@ &dpmac7 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_0>;
+	phys = <&serdes1_B>;
 };
 
 &dpmac8 {
@@ -79,6 +106,7 @@ &dpmac8 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_1>;
+	phys = <&serdes1_B>;
 };
 
 &dpmac9 {
@@ -86,6 +114,7 @@ &dpmac9 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_2>;
+	phys = <&serdes1_B>;
 };
 
 &dpmac10 {
@@ -93,6 +122,7 @@ &dpmac10 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_3>;
+	phys = <&serdes1_B>;
 };
 
 &emdio1 {
-- 
2.35.1.1320.gc452695387.dirty

