Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB16B7D2A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 17:15:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb1w83MXPz3c7X
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 03:15:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=wrFQfRFy;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=wrFQfRFy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1b::31a; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=wrFQfRFy;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=wrFQfRFy;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05hn2031a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::31a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb1s403Cfz3bjW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 03:12:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iie0Bl1raO6MNQbx9dABBRV7HF/h/2HGK/e4/Sj3ooA=;
 b=wrFQfRFyOFtUzK+lEV57Vki0KgPbszS9KeiUKNyUoJGLeYAexb4t8rHFH6jEuGYJgjS/5NQpSqu/meK69aw62vE/+R1Lgr9I01hi82JAY61BcKNYZTOTbwKdX7nNpeUWyYiqWLY1++9ZVoC/BDih6XX9pKtiUrOLiO9ggojgRXeS1AbcremYGWYILnNpCYVTu3JT+vB+d9a/qQuOyetyIXXr2fhqdyRtAiyB/AKfzlft8GvzX3YqR71Q1qfZteDDe70CZegL8xG15s1wLehkIaOSI6vFiotkLmPeb0EJR3cGmlqEeACI8XjWCP/qISnkyAIfLt8VcdPFItU4llXvUQ==
Received: from FR3P281CA0097.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a1::15)
 by GVXPR03MB8330.eurprd03.prod.outlook.com (2603:10a6:150:6f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:19 +0000
Received: from VI1EUR05FT011.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:a1:cafe::7) by FR3P281CA0097.outlook.office365.com
 (2603:10a6:d10:a1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 16:12:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 VI1EUR05FT011.mail.protection.outlook.com (10.233.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.10 via Frontend Transport; Mon, 13 Mar 2023 16:12:16 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 6C87820080270;
	Mon, 13 Mar 2023 16:12:16 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [104.47.14.56])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 0DBFC20080077;
	Mon, 13 Mar 2023 16:10:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUH5QZM6mnIdhAPYEaiR9RCQ/Ubg6DHaMlv615vCTouRKP2ht4TsGJoQpxQoLTGG3W2RHMnUgDWdTi9WlrR1+0CYcNwABuU3J/ASNbMdv4+JVvgtkL1hDgy69G3H0IS9AVF9dzpk5JjtHnJrI5X47x9zHNAGRjoe4/PgO42nTFvTQXymYvvE7VVGZD0KvpCsDKZVxe0pEeRECZyXueyHKPRsmiPWi1GbuQ2h75zLhaOvkKmbeHc2EqhM/ZgQdhYZWUJp3fT0Upy+ukXhJM/KAW7AemhVR84CCUDABub0rRm/DoqaL4rKL2O51/j4c8lcVgpjBXaGBTfjxFv/mMwIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iie0Bl1raO6MNQbx9dABBRV7HF/h/2HGK/e4/Sj3ooA=;
 b=ThGPTGmOtZliXdPbhuTKLArukCZGtmJ8TbI8v/56nOEQH4sPgLwSkBBc7SsH6CSb5MZCiSBrG2Vd1RemWk3vTQFITGLPDzFohFcBnolWE7LHDIsOzuISt3bsa736wHzjFttTwExisAtRtKx/UnZ62HodFQCJi7tAPM5V6mg7EMotlVRC8Zh5E52Xxr+tQFNCnD+koDuhuF7BA6UVquNrdRE1He1/S/wMZWrCZB3lIQhKmHsLS63LzwEgDr/EsXELQjyHMLvXzNoy6YJgVACZ0lWKEEYnt1Y3c0OgtFNaFLv8YmDGFcjYpYrqAwxEULKDQwHZnaWXvrkAKyroPwzghA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iie0Bl1raO6MNQbx9dABBRV7HF/h/2HGK/e4/Sj3ooA=;
 b=wrFQfRFyOFtUzK+lEV57Vki0KgPbszS9KeiUKNyUoJGLeYAexb4t8rHFH6jEuGYJgjS/5NQpSqu/meK69aw62vE/+R1Lgr9I01hi82JAY61BcKNYZTOTbwKdX7nNpeUWyYiqWLY1++9ZVoC/BDih6XX9pKtiUrOLiO9ggojgRXeS1AbcremYGWYILnNpCYVTu3JT+vB+d9a/qQuOyetyIXXr2fhqdyRtAiyB/AKfzlft8GvzX3YqR71Q1qfZteDDe70CZegL8xG15s1wLehkIaOSI6vFiotkLmPeb0EJR3cGmlqEeACI8XjWCP/qISnkyAIfLt8VcdPFItU4llXvUQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB7781.eurprd03.prod.outlook.com (2603:10a6:20b:405::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:09 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:12:09 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v11 02/13] dt-bindings: phy: Add Lynx 10G phy binding
Date: Mon, 13 Mar 2023 12:11:26 -0400
Message-Id: <20230313161138.3598068-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230313161138.3598068-1-sean.anderson@seco.com>
References: <20230313161138.3598068-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::11) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB7781:EE_|VI1EUR05FT011:EE_|GVXPR03MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: e88adec8-54e9-4927-10b1-08db23ddb706
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  2fWJV7+S5FFhNOn5BNLpLqq3aJmm1H1E4YaWdG7CMZcpz36nrtoReGaZDiJwBK1OWseEOPiNVGRghoBPvfR+KcY86KpqZQOExQ6HMONdIMl5VKpfwTVcUGr7WcuFHWMzGyIseT3xVgagbmXFLC3OCGVD3YHdzXamHgMOJHR30lHromuJQn/EN8QN2k5b8xgRckMOefvN+BR3SLOne47LmqQ5eV84+nx4K9VaIW4eLe6dGw5AXK1jhdjowg5iRtEck75EJW2EuZLTx+AgUgt/ZPHWlmTkxAPOLpG8ewWYyYSnS+P2voYPk2BOAcbsDSGGmo4JnkvQqsbT8n9i7nt92t1hM92UtGqibIhwDZlAd4Sjyrj7jRcOn+i98Aulz3rZkcgzmcaP8MCNBaI/t6OmV/KRJxXFkDxSbjh42LCgJvfSzN4iNnq5iGtXsnNKj5hXri4Czo+zhtwZKOECIc3Z7VC5kJXOWDtppp2i+aVcjEUXM9oPBLNGldFvHBkYvwegoq1n9YrE4fODZfPiHEixYPQPX+Rs86I6wCY+3RmCjn/CDwgzz9qvj3v1Kb+WH3b7+fcabf8f0lB/YUnAq04cx01TGTcWHrbY5QgFVuxkkXo95mNtG7odIM1JCC1WGYGWZ4tBHzSYiWrni2QwFUqBznnyM7q+m0lpnt9Idu7wy2uvkZ/csnHh2aYs3RPLHd6L
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39850400004)(346002)(396003)(376002)(136003)(451199018)(110136005)(41300700001)(54906003)(478600001)(8676002)(4326008)(66556008)(66476007)(66946007)(8936002)(36756003)(86362001)(38350700002)(38100700002)(26005)(6512007)(1076003)(966005)(6486002)(6666004)(186003)(52116002)(44832011)(5660300002)(7416002)(2906002)(316002)(6506007)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7781
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT011.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	bc293c93-f4b2-4e3f-61e9-08db23ddb2c1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CL/yuRhzFOVlp+uX1KYPtUOmBX74PYsw9Ff9PyIL9THAgFRIAq1Nxhg1wMZd2o8iNJNQZc5YJyss0aoRKns0FMzmvGHByGPw9fYFq/ljAr5ndcHjki0hZIXXAHoTeC7wlsFkb/j4E/D6wbxKHI3MCLuoz1zFuD0hm9aNqWFQl5+zkw+2zC3D/CrsuEvoucfv0KS3fDzNsXEnyhRzkWTAxpfTDmgsGmb8Ni2bkKT37fi/aeFQ2oWg6a3/Nf+DTT7ubsrcMRVjD1410z8/i3MA+L3Ps4AEfEfQG+HXN606rKJ1aKRAD4AWm1sqkKlH+xPDjw2Au0yZxDRHmNtQJmgEa2EquB1vG90hAZKi6rIYpVoSNsHGS7EW/1BsTiChVhz6x1ZSTVDh9A7kjg53w3lnxH7BWenDrKQ2XOrE5fFKX3poR3+1yDFN2Ou09eyH5+O910vZCgbdLPVxfl16iAaCg8D5wgpGBAKpdFZz4hmEPDq3kHUOxXe9xrW46NyEFSuO7zTwsF2OHmDY/MqQHdFFuvcEW4IzV5bw4yAPlErVPwEEfhT4jvIGS44K9QEct2pOc+Vpr8yAuTbX/GT+MT+JXoTHkNnqv/C4YQzacF/8TLJ29WSGS9s3vGsJ0+qF0P+gjMoW0ny6TPqgMO9hUqJYezDVemKt5J4goBf5iQsK6wUgZRel9vhclVPgWCsT+mgBivhe0a6G3TEhVVALX99AZLFu7RM7Q2o2rKaR0vLlhzNAMgS27gjhUlqXUsFeUbJq
X-Forefront-Antispam-Report: 	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(376002)(136003)(39850400004)(346002)(396003)(451199018)(5400799012)(36840700001)(46966006)(40470700004)(2906002)(82740400003)(7596003)(7636003)(41300700001)(83380400001)(36756003)(44832011)(40460700003)(7416002)(5660300002)(8676002)(70586007)(8936002)(356005)(4326008)(70206006)(316002)(34020700004)(40480700001)(36860700001)(54906003)(86362001)(110136005)(82310400005)(478600001)(47076005)(186003)(336012)(2616005)(26005)(6666004)(6512007)(1076003)(6506007)(966005)(6486002)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:12:16.7336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e88adec8-54e9-4927-10b1-08db23ddb706
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT011.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8330
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds a binding for the SerDes module found on QorIQ processors.
Each phy is a subnode of the top-level device, possibly supporting
multiple lanes and protocols. This "thick" #phy-cells is used due to
allow for better organization of parameters. Note that the particular
parameters necessary to select a protocol-controller/lane combination
vary across different SoCs, and even within different SerDes on the same
SoC.

The driver is designed to be able to completely reconfigure lanes at
runtime. Generally, the phy consumer can select the appropriate
protocol using set_mode.

There are two PLLs, each of which can be used as the master clock for
each lane. Each PLL has its own reference. For the moment they are
required, because it simplifies the driver implementation. Absent
reference clocks can be modeled by a fixed-clock with a rate of 0.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

(no changes since v9)

Changes in v9:
- Add fsl,unused-lanes-reserved to allow for a gradual transition
  between firmware and Linux control of the SerDes
- Change phy-type back to fsl,type, as I was getting the error
    '#phy-cells' is a dependency of 'phy-type'

Changes in v7:
- Use double quotes everywhere in yaml

Changes in v6:
- fsl,type -> phy-type

Changes in v4:
- Use subnodes to describe lane configuration, instead of describing
  PCCRs. This is the same style used by phy-cadence-sierra et al.

Changes in v3:
- Manually expand yaml references
- Add mode configuration to device tree

Changes in v2:
- Rename to fsl,lynx-10g.yaml
- Refer to the device in the documentation, rather than the binding
- Move compatible first
- Document phy cells in the description
- Allow a value of 1 for phy-cells. This allows for compatibility with
  the similar (but according to Ioana Ciornei different enough) lynx-28g
  binding.
- Remove minItems
- Use list for clock-names
- Fix example binding having too many cells in regs
- Add #clock-cells. This will allow using assigned-clocks* to configure
  the PLLs.
- Document the structure of the compatible strings

 .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 248 ++++++++++++++++++
 1 file changed, 248 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
new file mode 100644
index 000000000000..7c364f7de85c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
@@ -0,0 +1,248 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Lynx 10G SerDes
+
+maintainers:
+  - Sean Anderson <sean.anderson@seco.com>
+
+description: |
+  These Lynx "SerDes" devices are found in NXP's QorIQ line of processors. The
+  SerDes provides up to eight lanes. Each lane may be configured individually,
+  or may be combined with adjacent lanes for a multi-lane protocol. The SerDes
+  supports a variety of protocols, including up to 10G Ethernet, PCIe, SATA, and
+  others. The specific protocols supported for each lane depend on the
+  particular SoC.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,ls1046a-serdes
+          - fsl,ls1088a-serdes
+      - const: fsl,lynx-10g
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  "#clock-cells":
+    const: 1
+    description: |
+      The cell contains an ID as described in dt-bindings/clock/fsl,lynx-10g.h.
+      Note that when assigning a rate to a PLL, the PLL's rate is divided by
+      1000 to avoid overflow. A rate of 5000000 corresponds to 5GHz.
+
+  clocks:
+    maxItems: 2
+    description: |
+      Clock for each PLL reference clock input.
+
+  clock-names:
+    minItems: 2
+    maxItems: 2
+    items:
+      enum:
+        - ref0
+        - ref1
+
+  fsl,unused-lanes-reserved:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Unused lanes are reserved for firmware use, and should not be disabled.
+      Normally, groups containing unused lanes may be reconfigured or disabled
+      to save power. However, when this property is present, unused lanes will
+      not be touched until they are used by another driver. This allows
+      migrating from firmware control of lanes to driver control.
+
+      Lanes not present in any group will never be modified, regardless of the
+      presence of this property.
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^phy@":
+    type: object
+
+    description: |
+      A contiguous group of lanes which will be configured together. Each group
+      corresponds to one phy device. Lanes not described by any group will be
+      left as-is.
+
+    properties:
+      "#phy-cells":
+        const: 0
+
+      reg:
+        minItems: 1
+        maxItems: 8
+        description:
+          The lanes in the group. These must be listed in order. The first lane
+          will have the FIRST_LANE bit set in GCR0. The order of lanes also
+          determines the reset order (TRSTDIR).
+
+    patternProperties:
+      "^(q?sgmii|xfi)":
+        type: object
+
+        description: |
+          A protocol controller which may control the group of lanes. Each
+          controller is selected through the PCCRs. In addition to protocols
+          desired for use by the OS, protocols which may have been configured
+          by the bootloader must also be described. This ensures that only one
+          protocol controller is attached to a group of lanes at once.
+
+        properties:
+          fsl,pccr:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: |
+              The index of the PCCR which configures this protocol controller.
+              This is the same as the register name suffix. For example, PCCR8
+              would use a value of 8 for an offset of 0x220 (0x200 + 4 * 8).
+
+          fsl,index:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: |
+              The index of the protocol controller. This corresponds to the
+              suffix in the documentation. For example, PEXa would be 0, PEXb
+              1, etc. Generally, higher fields occupy lower bits.
+
+          fsl,cfg:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 1
+            description: |
+              The configuration value to program into the protocol controller
+              field.
+
+          fsl,type:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum:
+              - 8 # PHY_TYPE_SGMII
+              - 9 # PHY_TYPE_QSGMII
+              - 13 # PHY_TYPE_2500BASEX
+              - 14 # PHY_TYPE_10GBASER
+            description: |
+              The category of protocols supported by this controller. See
+              "dt-bindings/phy/phy.h" for the relevant definitions. Individual
+              protocols are selected by the phy consumer. The availability of
+              1000BASE-KX and 10GBASE-KR depends on the SoC.
+
+              - PHY_TYPE_SGMII: 1000BASE-X, SGMII, and 1000BASE-KX
+              - PHY_TYPE_2500BASEX: 2500BASE-X, 1000BASE-X, SGMII, and
+                                    1000BASE-KX
+              - PHY_TYPE_QSGMII: QSGMII
+              - PHY_TYPE_10GBASER: 10GBASE-R and 10GBASE-KR
+
+        required:
+          - fsl,pccr
+          - fsl,index
+          - fsl,cfg
+          - fsl,type
+
+        additionalProperties: false
+
+    required:
+      - "#phy-cells"
+      - reg
+
+    additionalProperties: false
+
+required:
+  - "#address-cells"
+  - "#clock-cells"
+  - "#size-cells"
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    serdes1: serdes@1ea0000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      #clock-cells = <1>;
+      compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
+      reg = <0x1ea0000 0x2000>;
+      clocks = <&clk_100mhz>, <&clk_156mhz>;
+      clock-names = "ref0", "ref1";
+
+      serdes1_0: phy@0 {
+        #phy-cells = <0>;
+        reg = <0>;
+
+        /* SGMII.6 */
+        sgmii-0 {
+          fsl,pccr = <0x8>;
+          fsl,index = <0>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_SGMII>;
+        };
+      };
+
+      serdes1_1: phy@1 {
+        #phy-cells = <0>;
+        reg = <1>;
+
+        /* SGMII.5 */
+        sgmii-1 {
+          fsl,pccr = <0x8>;
+          fsl,index = <1>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_2500BASEX>;
+        };
+      };
+
+      serdes1_2: phy@2 {
+        #phy-cells = <0>;
+        reg = <2>;
+
+        /* SGMII.10 */
+        sgmii-2 {
+          fsl,pccr = <0x8>;
+          fsl,index = <2>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_2500BASEX>;
+        };
+
+        /* XFI.10 */
+        xfi-0 {
+          fsl,pccr = <0xb>;
+          fsl,index = <0>;
+          fsl,cfg = <0x2>;
+          fsl,type = <PHY_TYPE_10GBASER>;
+        };
+      };
+
+      serdes1_3: phy@3 {
+        #phy-cells = <0>;
+        reg = <3>;
+
+        /* SGMII.9 */
+        sgmii-3 {
+          fsl,pccr = <0x8>;
+          fsl,index = <3>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_2500BASEX>;
+        };
+
+        /* XFI.9 */
+        xfi-1 {
+          fsl,pccr = <0xb>;
+          fsl,index = <1>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_10GBASER>;
+        };
+      };
+    };
+...
-- 
2.35.1.1320.gc452695387.dirty

