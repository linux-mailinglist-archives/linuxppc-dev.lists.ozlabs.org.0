Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB79A6ACDE3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:20:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVpLg3vrpz3fSv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:20:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=fMGXo9X0;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=fMGXo9X0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0c::316; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=fMGXo9X0;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=fMGXo9X0;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04hn0316.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::316])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVpGW6tpzz3bgk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:16:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY3VxoAyiXo2Scf45jx887ZDlZVBcL3U87Bk4rRlg2o=;
 b=fMGXo9X0kYL9eMMdVL9vQd0PlEBwCvveVBn16uY1z1atPjPHjFzLiP6A9OYJnvTbNerBTJAtqOlPjl86M9JqK5a1jlzB3/bjfJ5eddDsw/QPCUIOw54xZHPyLtsUu9rVS48PWn0m4/KG8v9SdGcoCHyfOCmahCgH6wStTuZ9/2aLPlotdv8k/cv02duEkNVK8LKZJ6uE05AvjnbXuoDbp6Ik15QYsXvOSUX9F3CVKhUhF6FTa8vl1jNELP/8qxLwxBw1k8WTkWkDSDL4Wh3/xBhOYFBGujOTWILlwla6CNOtRXdZtOXV8C3W312yiCIoBtcfQ6pHkuf/yPCtM7mIEQ==
Received: from DB8PR09CA0032.eurprd09.prod.outlook.com (2603:10a6:10:a0::45)
 by DB8PR03MB6187.eurprd03.prod.outlook.com (2603:10a6:10:133::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:16:15 +0000
Received: from DB8EUR05FT004.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::8c) by DB8PR09CA0032.outlook.office365.com
 (2603:10a6:10:a0::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Mon, 6 Mar 2023 19:16:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.85)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.85 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.85; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.85) by
 DB8EUR05FT004.mail.protection.outlook.com (10.233.238.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.15 via Frontend Transport; Mon, 6 Mar 2023 19:16:15 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 37CD32008088D;
	Mon,  6 Mar 2023 19:16:15 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (unknown [104.47.30.106])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 38C5D2008006F;
	Mon,  6 Mar 2023 19:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+czY/cGywuy8fWlUHU2juLxEvRb6STLpcp8z0P64hToGtzW/j9x2Tiv3wHYJHUVF3w8S6+gWnujIhuaWgXs0L8CUq6OUoLOTRF0d9jSQMpGo+AtCq7lhFt9K/5fshDjWB2aFN07ussjZ223/KRlRrcE1lmCOwW3FlqszVVnLmdIQGVfcosZghHBfq/Xr0oYf4XcniKN1GQmSJvCIvR06zc3VH9H4A0h4dHseITpARnnVteiXtZ8LvbRViljtjJMGt4kj+YFswndcoHPPJEK9zgDxDMwtGBkuUo6kzs7OVwft2RKiMrVzA7eDOHbTG39lUjquYBXOmQohZPICovUyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dY3VxoAyiXo2Scf45jx887ZDlZVBcL3U87Bk4rRlg2o=;
 b=nEUzcvoEZk2gUX4uQRhvrIIZMCta1h+v9nBciysuOgunN/t1+NyxPJKK3mgoiJShltsnzIeOUc/5j6UaTyiprKNNNW3apTEgswfomk31ELlznRblPGAlkM8QYP1OxgHfthKFJmLtxpspSYZ0iEmbKg/REQ3qpCpu3k4Y8A5fMVWCm3v9ijr4Sz+X8z72nP/nER/vLNA4kShGjZIRNIEbUjLOErA6JS+Vuibg1QQYyMqXhAjcpNsuSA4lFT3MmxcDBcur/neIArSSIIZX9jRjJp8GqBPrJ+B6DxW95X///QvLFrOZQOcPl5r85YrCHgxIMM2wuRS4HtYo0qwoFQ8dnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY3VxoAyiXo2Scf45jx887ZDlZVBcL3U87Bk4rRlg2o=;
 b=fMGXo9X0kYL9eMMdVL9vQd0PlEBwCvveVBn16uY1z1atPjPHjFzLiP6A9OYJnvTbNerBTJAtqOlPjl86M9JqK5a1jlzB3/bjfJ5eddDsw/QPCUIOw54xZHPyLtsUu9rVS48PWn0m4/KG8v9SdGcoCHyfOCmahCgH6wStTuZ9/2aLPlotdv8k/cv02duEkNVK8LKZJ6uE05AvjnbXuoDbp6Ik15QYsXvOSUX9F3CVKhUhF6FTa8vl1jNELP/8qxLwxBw1k8WTkWkDSDL4Wh3/xBhOYFBGujOTWILlwla6CNOtRXdZtOXV8C3W312yiCIoBtcfQ6pHkuf/yPCtM7mIEQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB8394.eurprd03.prod.outlook.com (2603:10a6:20b:526::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Mon, 6 Mar
 2023 19:15:57 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 19:15:57 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 02/13] dt-bindings: phy: Add Lynx 10G phy binding
Date: Mon,  6 Mar 2023 14:15:24 -0500
Message-Id: <20230306191535.1917656-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230306191535.1917656-1-sean.anderson@seco.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:208:23b::20) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB8394:EE_|DB8EUR05FT004:EE_|DB8PR03MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 8789e5e4-4214-4903-2034-08db1e7741bd
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  ZQ7TSl+ggsnBJx6im2Q7PHtz17waaoPlhe6OpRRYThAhHDSH0RuSROcjv0df2np9Ki6N1QF+EmkoZH6C7wZxp73uJIShIrXZHFEPa3LWzI8SwcBvFbmXwiD0lDZ+4kMpjILTrj9B3nPhzl9yff1ieDHyXz0ryQk1M3MnO6xv9R0SU/Is2Y9t/bgYWVTa0iiglPMxh58JMxQhtttCQ2UYRESkrMPzDX41151PwicpZkRyGHn1RdjWaaFVAi9CWpO5JUQ4tC0rWJNvEWh4lgpP2oTTc5u4QEyWhsLzsXy6p3/SzepKy193DhwrnIcOo2vl512zGuMkcq/PuoQBzIpfyrTirhNYNrOrjUUgk1Wop4q31n2YD8pAMUu4iCPRhkO9Mwjg+KyP84LdxG1mTP+C0/ap5mt4j847rJAWBuqslwd809l/q0nwaNIQxAMziMEDlZs8rrU7/ztT7IiwvYPMJ6FXOC0uHHDDp+jGfjAjLvDTKQxILW1uMsEXpFZ1/jbXdj5ePW/IdTcKfGTXS296MW++M13IlREjn7DLBBAyge3934ZU5Z4nDM9KUvUzfQYvEMtRvCW6uwKQH6mlWbiE2rIwHP1CgqrzF8rfMvJcVPh5WBhlsf1pcNZ9cSXPHNJWbETajAp/aZfStA5bZec3HDPt5mAqFXTVDyLIEjWo0e8uYdtKys7V/bACV5QKO19I
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(376002)(396003)(366004)(39850400004)(451199018)(36756003)(6666004)(110136005)(478600001)(83380400001)(52116002)(1076003)(6486002)(966005)(6506007)(26005)(186003)(6512007)(66556008)(41300700001)(2616005)(8936002)(66476007)(4326008)(8676002)(5660300002)(66946007)(44832011)(7416002)(86362001)(2906002)(54906003)(38100700002)(316002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8394
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT004.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	27fbc34c-92ce-459a-35c9-08db1e773702
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UaiLB5IOmi/00Sh7DNRK7uXqN1g6/ceYrlagE21XuH75QUwn0SZVNHZF369nblglgP1vWK0lA4Nsm4T4+V6MKmw4HHfANuWsSYaBWxDMp9yFX+Of42kvjr+VH8CDPksWB+Us/zv90GxqtkGh6dDEuQUS63Z6RlJSo+rrGv9rEPdMvaNB0BagTr5pj/L2FrXYds9dCvRm5dz4iOU1ULIVlJs6BMpkvYe+GKcg1fzIB09gE44Ww4uZ16UtPAnqMA/jslfWqHmfpLJqf7RHnxriRWoBzjN9obMKFeJmbf0aOeUhejqqi/XJxTkinzkWz8IvzsA3iwAeuSJsbZGyWH548jvJZ4MccbueGeVjXGL16th8vFNaweVuEF61TcEKXqIY2l/BBCyo2UvmStBVdJrFYdI/wzkasRoVYl9PeC5+Xe5CzC1JrfeUMSZ6BJ5+Jpcc3MgSE+kCR11GKpYE1iQEPGy79hruWePb4rXVUDbX7Y66bJkzoftvXP08xgPflPBo8A4o3PowV92gt44+qgrieReIla0XwJWseHiDj9uusjTLPYSwVwYWzzQ8T7xS32dl8gTDRpAAEFrVJ5XA7wmkiau0AUpfwTaKzC7NN36e0Psvlmh9noro8u9dImfRB4HTDjMzb0vV1CQbNBtRybc07uf2aJ76OisEpWO1YadZ44IFqL/peNKwhQesjfe0b2SqzBzTkCGsZXRtQUgtyFE5/uj/jU8RoUBiZD/gJlhKyibueueUpSFJL/RsJtPKnuAh
X-Forefront-Antispam-Report: 	CIP:20.160.56.85;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(346002)(376002)(39850400004)(396003)(136003)(5400799012)(451199018)(36840700001)(40470700004)(46966006)(110136005)(54906003)(6486002)(36756003)(316002)(83380400001)(40480700001)(82310400005)(86362001)(966005)(336012)(6506007)(40460700003)(186003)(2906002)(82740400003)(5660300002)(4326008)(70206006)(70586007)(34020700004)(8936002)(36860700001)(41300700001)(8676002)(478600001)(47076005)(44832011)(26005)(6512007)(1076003)(2616005)(7416002)(6666004)(7596003)(356005)(7636003)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:16:15.4974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8789e5e4-4214-4903-2034-08db1e7741bd
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.85];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT004.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6187
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

