Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B87C96C3B87
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:16:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph2v24W00z3fBL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 07:16:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=B6VagWth;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=B6VagWth;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe13::30b; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=B6VagWth;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=B6VagWth;
	dkim-atps=neutral
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02hn2030b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::30b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ph2qw2H9Hz3c72
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 07:14:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iie0Bl1raO6MNQbx9dABBRV7HF/h/2HGK/e4/Sj3ooA=;
 b=B6VagWthWhKF/Ljj7pkBq3jUtXx0oz5yM/ed9/9CpMIdhtSPllxYB6wp5r94Mgtx21edQHPvVf7prKUIFhNUVpVCeFEEFWYtoqLy7gNPvNFQOoPKXTMIxiVdw0YNpjjySbbbChCKX/2ZSDo2+KYDTUHFxTckYI/YWHFB7a9onZr+rSaRDsJp285XnY66UhfJ2ak1fkyKh607o2Qgj1LZRAA/knoaP2t6k1E8mFkf0fsLN9TZHAL3drOKZNrfQTPjp4xylXzBiAUYSffsaI9l9wySjQry/VxMROObYkmCnFerUAdha+tZEBegw6gJmsGAFZVQ5dwE0Ru1LS+vDiAKLw==
Received: from FR0P281CA0176.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:b4::15)
 by PAWPR03MB10135.eurprd03.prod.outlook.com (2603:10a6:102:343::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:42 +0000
Received: from VI1EUR05FT007.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:b4:cafe::a8) by FR0P281CA0176.outlook.office365.com
 (2603:10a6:d10:b4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.17 via Frontend
 Transport; Tue, 21 Mar 2023 20:13:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.87) by
 VI1EUR05FT007.mail.protection.outlook.com (10.233.242.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Tue, 21 Mar 2023 20:13:41 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 312D82008088A;
	Tue, 21 Mar 2023 20:13:41 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.172])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 016122008006F;
	Tue, 21 Mar 2023 20:11:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVsuyelCQEOj7r+fzAODmQlx1KdUGdkD2kPydT3loOgpWIm4GI+bWpsu5UkIBJaEsQmvZXWEZgcqhDXLnvNA13EzD1dkDC6W83nHld1o5WVaL9+ROKwnCg/48Z9MWlXdmWEKXLeeIP4xcQ7StacxqARZKoAL7r4sNKQcH5sAODS53q3XygeRXVNRFOAc9R0SJss5DW+x/N3Dm5jK9NYUfUtHfXNul48eRLtlMu0dVegGWrKjYCYqRsZT1tfkyyvY4kU9hfwVsCx8s9zVtLElyeaaxze8IaUJlRXZdDBQsvaJ4vMvC7pkhd2b20F/whY7sN1BYUDFjeSrNmXFI6iziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iie0Bl1raO6MNQbx9dABBRV7HF/h/2HGK/e4/Sj3ooA=;
 b=jJb8kwSnsLwZmLOcLigdos+2k5nkXT1TNrBKmnESoPP2vc7iBWQPIlkEDIFQQ71MingmGPfNN0SRq7gqEQde3iEYh83nplkBqZDZWnqF4dvAw47iM9G2xdKzgt+d4aGhA2Hoy1ExqdUTwYbbsMri6gIdfsqyA3BXtsr2NN3veaSaaWBwx8ZrsvWBnlX6oqG6D2GeAcCR0lJvfgd2OgdAsIu67Ps+Y1uyR/WSJoIuJH3grXCj2z6XNUoAZHmp0r4EWu4M8RO18qiCnab/yPxKeqgkO3deuIjOSUB69VjZaVvJY338bxF41llfa80PhjnSPO9iMQuLesfbSLiS4jkyQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iie0Bl1raO6MNQbx9dABBRV7HF/h/2HGK/e4/Sj3ooA=;
 b=B6VagWthWhKF/Ljj7pkBq3jUtXx0oz5yM/ed9/9CpMIdhtSPllxYB6wp5r94Mgtx21edQHPvVf7prKUIFhNUVpVCeFEEFWYtoqLy7gNPvNFQOoPKXTMIxiVdw0YNpjjySbbbChCKX/2ZSDo2+KYDTUHFxTckYI/YWHFB7a9onZr+rSaRDsJp285XnY66UhfJ2ak1fkyKh607o2Qgj1LZRAA/knoaP2t6k1E8mFkf0fsLN9TZHAL3drOKZNrfQTPjp4xylXzBiAUYSffsaI9l9wySjQry/VxMROObYkmCnFerUAdha+tZEBegw6gJmsGAFZVQ5dwE0Ru1LS+vDiAKLw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7044.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:36 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 20:13:36 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v12 02/13] dt-bindings: phy: Add Lynx 10G phy binding
Date: Tue, 21 Mar 2023 16:13:01 -0400
Message-Id: <20230321201313.2507539-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230321201313.2507539-1-sean.anderson@seco.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:208:e8::39) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB7044:EE_|VI1EUR05FT007:EE_|PAWPR03MB10135:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c6b4ba-91d4-48aa-0ef1-08db2a48c3ec
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  tJgSZQBaRmm1ACy9S0OfBJh6YezXSZx6IC+IXDH6CFkmf3+lYVOPVzKqP3ar8WzYM7Bpa7H7leE+3e7s1CVpmvI0tcsFdDybamWrGJmewvGymN0lBw/1Yy3ZMjHTaHSQRCJm9mb+01W67RhvapxVy7HFDLs37MGRLlXUVAO5QqM8tiDup2tnXNksoYe0/JqkqVYYc8+5h8k3R2lU0BgDGIwgQQdt7C0UVHvtyvYAUH3fE2A6pcpTpb6CPmrXcCwD4yj7HRf7VE5zgrkYjSLQP8CnHjVzlAKQYA46bJ+tBjjoYvNvq+0EoUFCgPZw2nC7pVq4OwZBDWXevEoVg/tizT7rMOmV4VJMD3ygzfSg4Bm1hhfaHUClnnVOUIWy+ZJjjBRjg8hb3sTITHLOJseZVboD63IPjwmTyFQXOSmNrhM6ELx+xQdA5Vlx+CND0g2iognvxuxcl1RZqNFFvuCuw9SRFQgaFVeTmQK0eK+06PFNPxYIGblUDpgY/Zj4kVYaWjp8H02WKkCyETu2OVpdEZe9/wxOXPckP5fMnTVtFypc4FQAhKlIIAX4WNRsaZ6/EXEtx1iM3dE4VNtZpuXTt3XAC8m1b9xOAb5qs+EsFeDa+4M/kHkdaPXih1kKGzdjYUfdp9OfolWr7yGbi2wTmsYDwMFCAXrGfCr/yVRWysz04/CFPCyCqDE9nkl1z3G9
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199018)(2616005)(54906003)(83380400001)(6512007)(7416002)(6506007)(6486002)(966005)(478600001)(316002)(1076003)(26005)(52116002)(5660300002)(6666004)(186003)(110136005)(86362001)(38350700002)(38100700002)(66946007)(41300700001)(44832011)(2906002)(8936002)(66476007)(66556008)(8676002)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7044
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT007.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	d4956018-5662-4ba5-6362-08db2a48c07d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0uUWaggjxK4WoN7Zj5JNd4dm3jJkLGuX+AE2jmb4nAeJh8Hvptf8daO52rk5OiT5Ve+wFefJv7Xf5KB9N24EGeU5MMC2fCf+5pTI6idVBoZ4B+iTFeNeZiJpEtrKG6BNy6tTMS3E87BseCxvSB8aESvFwI642muI9CUW+hCMLypBaNYwq6jN432k6PXlG0H9Rj/Vavl7KqfiTY+zvQnOEXRpW1CTY2j3pBmNY25ktdT7wTvF4n2iO1vG8IuCdiQNNVJmvwujysVhWJfDembzqwd525NSxUcXJnwFEni0I5VgMgW1bRwUgtzCZL8tSMsfld0QbGMojIFE1S4NCjkOTY0pUCa8kWoWRbHuJCb9W8AgFFJ58JTUkhdmOw9l7dU81OEA8U7BbnowVAbaM/3surlbyGUqiNWkhw+W+usGvwkXc+1u6i/fQ9XzJMuwAgZcOjDu1tdfbauAd+8+tbq3l604oL6h9risHZNZ6c9G9YDf7cWY/BNOTn1QgTwrQrYsI0eL6vbzn8XfjyGGVfn7+SXSd6S5JVQftEtU0Nm9V6e4YHoMgqwYRVY7534Q0bQmpVyDdFd1qrbZHhxx/+Wk6j2Nn0q4FVYCAbQkg30uEMHIpEQq/V30t/hINK9ZC2dvYYPdDz/SoJTkdat/BjcfkibLVX2Kggr2T1hG5kVJjkPSURb9G2zZ5LGmErlYCJqLV+u3iDgefExohiOxIo4mVTW329pGg435Gkdh3cllFesAgMQnledOg5GZwWvimBR6
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(396003)(39860400002)(136003)(376002)(346002)(451199018)(5400799012)(36840700001)(40470700004)(46966006)(7636003)(7596003)(966005)(6486002)(82740400003)(2906002)(83380400001)(6512007)(8936002)(6506007)(44832011)(7416002)(36756003)(1076003)(40480700001)(82310400005)(5660300002)(40460700003)(36860700001)(34070700002)(2616005)(41300700001)(47076005)(356005)(86362001)(26005)(6666004)(186003)(316002)(54906003)(110136005)(478600001)(336012)(70586007)(70206006)(4326008)(8676002)(12100799024);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 20:13:41.5159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c6b4ba-91d4-48aa-0ef1-08db2a48c3ec
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT007.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10135
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
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

