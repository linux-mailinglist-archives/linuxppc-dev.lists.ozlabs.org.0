Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A53ED6E1211
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:17:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4VW4rXXz2x9L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:17:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xMv+2SFn;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xMv+2SFn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0d::305; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xMv+2SFn;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xMv+2SFn;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04hn0305.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::305])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4Gh5t7Lz3fS6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:07:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIRYNtxwnPmwttCJbtIJ0LS3IYPNt+kA5KMteidNF7c=;
 b=xMv+2SFnuEWpEAgf01hiZyOltSPxgK36S/p5gWaiIgXldK09MV62dhqkGIQ8v33QfPRoRIzDEkjLt5DNfCsIVmv3+ffvydOHHkkcVq5bm3UuNBfLNBj1l9Lmt+CxUP0XWlFtSZzymAnxZwIRz7u13z0LHVbvajMhvbEGqt8fFq2OB1OUGNIIXwMVFoIeil1Vo64l5Iq7AwqvB+86fiBFNcYIr+W6HJWdOdP1DTDYC8HOwfOrvWNscthMCawFE9qlzaKqcNrmoKFQ3KNAY9RDKquHttkqUPLLCeKoBmVD0dQAV1cFNXCoQLespCcBpf19ikZR18FNA98LmA9zvzk+kQ==
Received: from FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::15)
 by PA4PR03MB7168.eurprd03.prod.outlook.com (2603:10a6:102:109::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:07:06 +0000
Received: from VI1EUR05FT041.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::8e) by FR0P281CA0049.outlook.office365.com
 (2603:10a6:d10:48::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.4 via Frontend
 Transport; Thu, 13 Apr 2023 16:07:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.80)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.80 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.80; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.80) by
 VI1EUR05FT041.mail.protection.outlook.com (10.233.243.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 16:07:05 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id A009E2008026E;
	Thu, 13 Apr 2023 16:07:05 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.171])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 6A70220080073;
	Thu, 13 Apr 2023 16:08:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaKTfZ0QaRXwqmoaCSeelMIBBpmtUEaopJpWyM454ktnpFz+CghPvqsVH+wdmmY/9GQvMEFmKWEWEZ+gr3RekWovZLB4ZVEkHJGkh0bvstG0SxdOjsRn9IOkBfBfaGeeB7HyBPK6y/VKlYcBMbI1Hk+1kur2f5sLhYlTlCD/hyNlAbPj3VowLgjbfTTl0AFZOfLbdWBeRl7YTOBe+73ftJ80CNIHPys3fCZsK8EX5+t5eOEqiM3ZeRSPYFgqSB3aOLG9cu3ULUNgd0yL2Cb4bSL26cHnwi3CWswZeYjQuV0idfdmOv6vwIfA7w/aIRC9KK8v77Q7cotHKD0T3eAvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIRYNtxwnPmwttCJbtIJ0LS3IYPNt+kA5KMteidNF7c=;
 b=d5daXipI/eMWi2jasKMrIlfHILtrHwOH/A7tkviQ9PltrTizEcbnKHkEeRtCDeU7o9PIWlTpBMNquyEw4YJghUjA1E/+d1Bei+/Gf93Vt++orFuY8SUiFbyJemuSMLUigHHNTQnpcilwn3MUzCOpPx1qKwOjRl0OdwV4z/LY6gLcd25fDGdguGZ23eIkvW5B6BHL1zoslrPzGOlOdbwGyz9KuSZj2lErdumsL38BVc3/1HNOOBlfrhT/VIkghjI4Dqkm1M9Fo6KGJi+PdnoeDViTi72D+hF0QE56oprivo5Q/rSwmwlvi5atEfBu6up786Z78jQotvHOWVCirPcwVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIRYNtxwnPmwttCJbtIJ0LS3IYPNt+kA5KMteidNF7c=;
 b=xMv+2SFnuEWpEAgf01hiZyOltSPxgK36S/p5gWaiIgXldK09MV62dhqkGIQ8v33QfPRoRIzDEkjLt5DNfCsIVmv3+ffvydOHHkkcVq5bm3UuNBfLNBj1l9Lmt+CxUP0XWlFtSZzymAnxZwIRz7u13z0LHVbvajMhvbEGqt8fFq2OB1OUGNIIXwMVFoIeil1Vo64l5Iq7AwqvB+86fiBFNcYIr+W6HJWdOdP1DTDYC8HOwfOrvWNscthMCawFE9qlzaKqcNrmoKFQ3KNAY9RDKquHttkqUPLLCeKoBmVD0dQAV1cFNXCoQLespCcBpf19ikZR18FNA98LmA9zvzk+kQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB9PR03MB8325.eurprd03.prod.outlook.com (2603:10a6:10:37d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:06:56 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:06:56 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v14 13/15] arm64: dts: ls1088ardb: Remove aquantia interrupt
Date: Thu, 13 Apr 2023 12:06:05 -0400
Message-Id: <20230413160607.4128315-14-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230413160607.4128315-1-sean.anderson@seco.com>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB9PR03MB8325:EE_|VI1EUR05FT041:EE_|PA4PR03MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: a741f2a9-deeb-4d33-b4df-08db3c39209b
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  NccCOcfopo1mbEN7wtTo0wdUsbkRB+uizLj6i3dJnx82buW+X8ioshxLoHg3wL69l7Am72qN18nR8qVjrFUdZKSC0i6Isfa+YepY5UuWOlcRfvp6HeNvp/p05nLHSHIuBdaa9F78++0PKrlmvFx3oCJAC9lJQKbE02S084GITlyWIVt9ztGlNmSTwvJOKqSQOlTEd11ORDZmCzLwnM2Rf7I3JciRRgJ41Vw+/qLQIR7fQNLgTN9bDd9GLalKQ1DRUJN0sKl8B3FUsYMWBh1gvMsEEHo5QJojfYh4Q+tBzwMEmSSJKGb1JKDp672koo0NHZZcxtsXanLUzf2LnRyChLPmNpVUqQlPFu2j+5kj+GkCF1JROG0ab47JUKJfc1VG22/VL8R7Ums2/g3mtvCezj4WzNDZ8jFWmQBnzneyhGlhkrQOF95Eabs50EVszCjK20fJash7s0iWrSvUO3DrNJ6l1Ml4Ed92Ep14HpNodKH/uAFdDAz/rwpgyWs/InC+SJmtnHo8PNyqQfvsUJ+9atd3fFjf0/RnErTVpH2/ocfBh5NIxx6bgLN8FBGWt8vG7D/hwgPBEkpXxBQiqYm/2a9bhTpgW+k/IM6vb7pD8SQ/EqnWjTnM+xhXqlSBaE1r
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(376002)(39850400004)(366004)(451199021)(6666004)(52116002)(6486002)(66476007)(66556008)(66946007)(4326008)(36756003)(110136005)(2906002)(7416002)(44832011)(86362001)(41300700001)(5660300002)(8676002)(8936002)(316002)(38100700002)(38350700002)(478600001)(54906003)(6512007)(6506007)(1076003)(26005)(2616005)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8325
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT041.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	ca302561-3870-417f-11ae-08db3c391aa7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HVOSAUdELfy1yd3ShNBL3pjp0JqBf5lKbRQrnziFU5AmtWfpOIy5ZrxkPmhOE2qKjGlegDCJrbICnKaCR7tparhQC/EWfX4T3CNe9ipHxSEsjHaT4htyyYUj+dnmM7fsTSDE6Lwhr1hpwKgPDkmYmnXLdQ0w2Y0fGI5V3HxEJwxPyEsfQ7x0YCet9K0aIrb6qvgckPBIX+ShoHLI0o54CIfmnhgsHqIjmu2RKOecbLxuNka9lymIRnSKIOziu0962e8nY7Wz8qvfmoadohZDr7YrVquLXfNEAbFv0fx0zB6ISXw09cEq/n0/2OMNBHwRexIxqT8SY3zTLSri5O1q9dH74h1oZVgmRgH/I9OUxF7oQHFN5q5QdEfd7YbB8mRv/J5w5PJcSTxdxQ6MEqYDICOl7DTc2xuWz3B9+tw5D6VfwODVesKZqgftZIp4+HmgPzQumtPL3aoIuGVimLkJ+QxfMagr6QDkyqG+57eOqqcepqxUuu5uAdU4c7L4ecbaPceUcQ3aFJ8luvRBRGxoLp0Bfb6aJi4F3ho17pty3K0Q26Dnhg2QZk2SyI94wgajNxLB4CFvOnDynP+rGkcOtd3jGemDFBeFzqLwrw3F9zKBRoFl6AotL4sku9VKtSP+dZ069c4qQv9B4pQCNaoFZsLI5s/bAN5YQ8m6anmyX7C0txYC1cslRhSLSPrVJIqOTFJJ11mhDh1kHuFDjDfP0Sx+ZwMws0RERmBItMv5a3PdicaTBCobsHkx1/Wl2p2OG4PRrijUk9iK5y5twkTclQ==
X-Forefront-Antispam-Report: 	CIP:20.160.56.80;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(396003)(39850400004)(346002)(376002)(451199021)(5400799015)(46966006)(40470700004)(36840700001)(36860700001)(5660300002)(41300700001)(82740400003)(40460700003)(36756003)(7416002)(2906002)(7636003)(8676002)(86362001)(40480700001)(356005)(4326008)(8936002)(44832011)(70586007)(70206006)(82310400005)(7596003)(316002)(1076003)(2616005)(83380400001)(336012)(34070700002)(47076005)(6506007)(54906003)(6512007)(110136005)(26005)(186003)(478600001)(6486002)(6666004)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:07:05.9997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a741f2a9-deeb-4d33-b4df-08db3c39209b
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.80];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT041.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7168
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

(no changes since v13)

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

