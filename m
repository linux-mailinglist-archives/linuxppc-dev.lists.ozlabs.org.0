Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 353F06C3B74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:15:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph2sz0jZ1z3chw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 07:15:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=2UOdy6IO;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=2UOdy6IO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1a::330; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=2UOdy6IO;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=2UOdy6IO;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05hn20330.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::330])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ph2qw0qkWz3c1K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 07:14:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=2UOdy6IOP2FgfalbTRspdS/6BUzYhUE6Jjk/rHm4G3JgaRrx7xz6pS6P8pfUMFc56zRe7hJQa0+BNd3w+B1rLOvaWdBJZwgplE3BjOF1hqnAu2v5szD9GC5Oqt8XwjOmcPj7qPy+5gA46jw41m91AReqJ9RYbBZkYNOhsCXSpUlDqNi3RNnecA64dM2RZoqM9/v2h80n2M4dbQcn0AgC380ouKXVL7nEwdxz0XRae+NdGpsMuT7f6kkKjxZfGmOckz8Y/TIDE124MegeuwfeFEQ8mKUtWhOT30BhIG6tcRUf4S7cIogHSUdPl6pMxaEoK99vsUk5i0E21tdwMwvM1A==
Received: from FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::10)
 by AS8PR03MB7956.eurprd03.prod.outlook.com (2603:10a6:20b:427::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:39 +0000
Received: from VI1EUR05FT047.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::fc) by FR3P281CA0077.outlook.office365.com
 (2603:10a6:d10:1f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.16 via Frontend
 Transport; Tue, 21 Mar 2023 20:13:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.81) by
 VI1EUR05FT047.mail.protection.outlook.com (10.233.243.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Tue, 21 Mar 2023 20:13:39 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id F0E032008026E;
	Tue, 21 Mar 2023 20:13:38 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.176])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id EFE582008006F;
	Tue, 21 Mar 2023 20:11:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpPnHUHJA1B2Iyz+Vr7klsICDFwNHrtyxJRtWEAxsOAaSxjnQFWz/piRzt7dz1gEEAqJ95nDRio6gkEEBo732C4fNaD9dFW6eqVxccvFi0z24zBPzh3MrbqdOI0h8tdH8V4bRj36YIH/bn5qeFXfzD4wGFkyOjhaDZDPwF+s4ZNE4Q0YwMGOANzPub1ZSarAZGpLXxvpKP5u+ZohkmRUx3IzTZcsqVTZ7C2OT19PZWMkhFpqFj8EG/wZMy+eva+BWZhjJCQr5Bvp+xoTpHHBFifsqmlgvZjLOxc3YRMwfFu0KEWFpjPaW5Muo6dfN0atfEZ0l8SrJ3JkmJy+ZPDJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=MzGkrrb3Q6VubueQFPIkgqzRPBS3PEBkP4/uoos03sv+BiM3jFTqcoPjUFJHo6zN6xlyIjhZL+ltGoqickMzGrWCbyZzrPr1qlJOEg3kPrHygFaCFOLfmyDoUqbnt+cWAiiidgbmvIt8WEb5NMscIeTrYY0vxvc8A05f2jsB7iNG3hxV2t9DZbtCn6D78vceUvIKsdk+Io/rUrT8O7TMKzpKPxNz+8znv0miUFqPeO+rSktXjs22tuUnS2D/fGfVejEphYATVnY8BbrYpHmcBLdkyLzXVKM5gstioPp0YXD5j/VeiRtYxGXSofUkLbjtsk8RbOd944nQo4f/j1/CtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV4YSLSWUEa6icuS3ElbSt+yZKjwyRoBMk3Gdh1j9EM=;
 b=2UOdy6IOP2FgfalbTRspdS/6BUzYhUE6Jjk/rHm4G3JgaRrx7xz6pS6P8pfUMFc56zRe7hJQa0+BNd3w+B1rLOvaWdBJZwgplE3BjOF1hqnAu2v5szD9GC5Oqt8XwjOmcPj7qPy+5gA46jw41m91AReqJ9RYbBZkYNOhsCXSpUlDqNi3RNnecA64dM2RZoqM9/v2h80n2M4dbQcn0AgC380ouKXVL7nEwdxz0XRae+NdGpsMuT7f6kkKjxZfGmOckz8Y/TIDE124MegeuwfeFEQ8mKUtWhOT30BhIG6tcRUf4S7cIogHSUdPl6pMxaEoK99vsUk5i0E21tdwMwvM1A==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7044.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:34 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 20:13:34 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v12 01/13] dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
Date: Tue, 21 Mar 2023 16:13:00 -0400
Message-Id: <20230321201313.2507539-2-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230321201313.2507539-1-sean.anderson@seco.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:208:e8::39) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB7044:EE_|VI1EUR05FT047:EE_|AS8PR03MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 12257c99-6966-40ea-556b-08db2a48c29a
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  4nFn8dpquRAf0iVnYDPApN5nO8x2F9YFKCLgqSYAjK/h2NouvAcJyhVmkJKKWqaW53/VO9OUyzID986j90FRi9CkAujv+Yfxg0aZwQWsmWf406GP6d9mB0Q3zEwxdXwQjYj1N6SL+DBjUeEq8G5UnXATJb/epGi+9zbXdTL8n+QN/4oxURtaDkqBCCANdfs2619slIukK/9bZNmRLt5KRSKmBVqbu9/ABYPFZXr5okq+teCNZivT7aJ6fxw9nEEtt3vzCJZ1tfDoGd0bNotbLawwgiYrjzOmSZzWVtinvU0/mSw2eVwepEv+eT7PbazQ1zJOcooDITzPBbT5zk4VIqNa3NFxUQ5cuPZ7PEJCoDIFvKxONlTXzX/ycNa7LkNk3dQ7H8ZzGYsEVFkT6C7SLt5bX30XXuE+60VLiYr8cuifabXYNEj5PPVdx6HoFLXeKuqWoVW/CDZv0aNEDdELHl1nCbatOFdqkmw9XKTzy49aINF/kHRLfb+CZcdiJXUQGRzwxM+QUmYvlFrntDpCeEbtYL2pQRfXesw9/zli8R6xyzDKP2vL8EhaEKje8EZNpAu+lagpCODvqSyXqyui6k8BoACkSkeU+kPHtD3fSs8oXf6vVqMRmqEGNM3UtYAd3y5DcfnfzcGTg/Y0q1bd9tqWZGriMs3GQf6JCEzifzex3WhQaPvRVDWTQ5feiemc
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199018)(2616005)(54906003)(83380400001)(6512007)(7416002)(6506007)(6486002)(966005)(478600001)(316002)(1076003)(26005)(52116002)(5660300002)(6666004)(186003)(110136005)(86362001)(38350700002)(38100700002)(66946007)(41300700001)(44832011)(2906002)(8936002)(66476007)(66556008)(8676002)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7044
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT047.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	499bb582-e9b5-485f-f4ee-08db2a48bf5e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gICLEhQnMGpnLT7So+TpFmZRsCYoWSuCfBZoXHOVYB9Ctbtz6mMFI+eHXSwcQJdiJ17Ak15cWZRszq1vlxTrw8qkAFjvqv2DjZEE0GG36AV81BMG+tSztDGUK6cEOLUedbI1urXlTwxFDOn+Nj1YtAlM9VaDjD8X1aAoMpPQ1oIv30yIYwSd2sR5c62f9zZmwu8ye2pwsoVhKXqisc8r7byeiM/QIcaNOMmUBCbY+HXL5MbDAvg4MODm34i5Ls3KuIXrTOSpD44SDoq0LBN4xFU12zt6cFfSILyVMNHXh4bvkb2f0p4HADqTutcUg4Gmd29pUrKv5X4Q9E5DC1r7du/zEtzOIQ/SaEHkNvIwlj/BQ33yFlFnL9NfIeTmXiFURBKLyWA/HxV2a2TJWqF7OgR3iXO51KlvHAVXYrff0yW65EpNGBdtn6ilbj1qQ+UgcfarKN4kjzhiIOjJcsEGonWuDxxDVZRa/SmKDg3N1z8ZsODPRsjLKUzHnMbZM93nINXAigctFS2O7Dycf+i/GhIoyqDxQovjbwzt+fklR4/Y0iEmwtPmXF4ZFJNOE2p6GdrcNS7rEAS2CfY/WOnj+9ZzpFj3/vxIDBsb5VFdjBUPsLwBsnIziAMs4pV7xEOxqfEUpB5FhmAHIyKBrMGSwcuDT8qLivY6UORf9RCToqzlIg67zw8yGprNooGZAQRF6Iw5mqvXt3KKKs4J+IPKYidhvL1YG5hyRK2XKoWmBfLOlzEYsRlCdoC41uE/CT+y
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(39860400002)(346002)(136003)(376002)(396003)(5400799012)(451199018)(36840700001)(46966006)(40470700004)(2616005)(6666004)(336012)(6512007)(54906003)(26005)(6506007)(83380400001)(47076005)(966005)(6486002)(4326008)(316002)(1076003)(478600001)(70206006)(186003)(70586007)(110136005)(8676002)(44832011)(34070700002)(7416002)(5660300002)(41300700001)(7596003)(7636003)(82740400003)(8936002)(2906002)(36860700001)(356005)(40460700003)(86362001)(82310400005)(40480700001)(36756003)(12100799024);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 20:13:39.3182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12257c99-6966-40ea-556b-08db2a48c29a
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT047.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7956
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds some modes necessary for Lynx 10G support. 2500BASE-X, also
known as 2.5G SGMII, is 1000BASE-X/SGMII overclocked to 3.125 GHz, with
autonegotiation disabled. 10GBASE-R, also known as XFI, is the protocol
spoken between the PMA and PMD ethernet layers for 10GBASE-T and
10GBASE-S/L/E. It is typically used to communicate directly with SFP+
modules, or with 10GBASE-T phys.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
---
PR increasing phy-type maximum [1].

If this commit could be applied sooner rather than later, I'd appreciate
it. This should help avoid another respin if someone else adds another
phy type.

[1] https://github.com/devicetree-org/dt-schema/pull/85

(no changes since v6)

Changes in v6:
- Bump PHY_TYPE_2500BASEX to 13, since PHY_TYPE_USXGMII was added in the
  meantime

Changes in v4:
- New

 include/dt-bindings/phy/phy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 6b901b342348..5b2b674d8d25 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -23,5 +23,7 @@
 #define PHY_TYPE_DPHY		10
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
+#define PHY_TYPE_2500BASEX	13
+#define PHY_TYPE_10GBASER	14
 
 #endif /* _DT_BINDINGS_PHY */
-- 
2.35.1.1320.gc452695387.dirty

