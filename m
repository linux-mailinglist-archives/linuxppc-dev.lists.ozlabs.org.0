Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA0660369A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 01:20:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsVFZ6qr0z3cjY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 10:20:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=eUxXP6NC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.8.75; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=eUxXP6NC;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsV492bLcz2xk6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 10:11:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWmWiY6HXWF2Zwgsw8ltXkuH7sK3enJpH4cJkNH+NFHyFAvGCs0p7iIdEd5cgqy6gMHhMagVe8os0Q+APCAh+9jpRuoKTmuaeYvcD2qMwfrHmII0NJhas2br6I0/+zy+67WUVqvTmjb9xn8pmaZ7mIDEAXVdb+KHcqhgDGeq12QrIvCIv1S706l9+iy6kYY6Hwwv5ysRd1AwDirypJ8pdreR9LbJFxBCBQfTS0UBOD5RhDQxllGCF0VgVjoj7ilSp51lIdsQFtvw7PfqCUFUgK2GCD28Lpo6YLTv8uCoDD5ymADd5GT2Hyvh6e2m0OIs0N5aOfhNvDZ3+WZThoxisw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1U/01l0e2dithoMlaIAqdfzbPV9jw2reG9G7wp+CC9g=;
 b=BBrv/7WqO3zybohZg7Gjk6JzIuFLDaI4pofAyI6kztTxeTmiBlpOPtgEToNnWD9m1UI0yno0g5bHK9UyNJQ3asB9yFLsGE0lHepvhBYMVenD9P82nz6q56cd9fG0BIonySLs6vrbvCJFqtsCJxC8UVHqDpl8hVX+etoWL5ToCPDGJHhIndjjZKADZUzRQfUetdanCt+7lSVuf7MKg9xGgWof2puittxHAvpEGuwg6tugv3x4+uCAm45zkJxPd6SGWFhWU+TlIDG2uEu8L+cjghCxjRaFGBvcPX6/M/uWr9gjXj3dl33V9P4ZavVHLuwd3Ng8USUG+4GqDREAOajPww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1U/01l0e2dithoMlaIAqdfzbPV9jw2reG9G7wp+CC9g=;
 b=eUxXP6NC6OOiEy/gDc3IdUDQ8zR549HgIw8AYCCcAr19ZP2sSHaOpmLLbtjJqZsy+FXamEkpLQLlzFgLIR6paiUyIwii/O3SaJBggCQ8I19qNuCWBLfDu+YJ1iDIG/ncWLXLNgUbIz3w+g3fsH7tkxixvCUdF8sm8TDnmelAC/7Qt3ZL76y0KrL8jNU/TdOe/Xt/4c05PaNoOtCoXmq5ygISK8smveLloyHdZW6dZmLz71evzsz85fe6d3cHw5iem4l64LRuLtMaMAVlI+nWu7PZPNKtqt4euuUiTYqy5ScNYOswbnXXoKZ7kr1cQNN7ZJeI6lOD0G35EBPRKH0NYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DBAPR03MB6421.eurprd03.prod.outlook.com (2603:10a6:10:198::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 23:11:27 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Tue, 18 Oct 2022
 23:11:27 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 2/8] dt-bindings: phy: Add Lynx 10G phy binding
Date: Tue, 18 Oct 2022 19:11:06 -0400
Message-Id: <20221018231112.2142074-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221018231112.2142074-1-sean.anderson@seco.com>
References: <20221018231112.2142074-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0007.namprd18.prod.outlook.com
 (2603:10b6:208:23c::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DBAPR03MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9789f2-3774-4528-c2a0-08dab15e153d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	shblc5wFqWz/1XNMPNU7pBMozChKoJzvcH8QoPjL2093sIDkESU0pWe+TJo0e0t0/mJXe8KynS83jOv/aX9Rp8xjBaNjfORg194uPACMV16D5ysTjRiUTsTr50YX0hJ/GWIOCYcSOxKeGxQ+K8KYy7UYtv0ufqAuwP+l//n4/70Cv6A169xhOadPvoSCczr3eWmx9EyiiGpqM6gpMDmVGqoApwWxbUhh4c3x4XwQ75dBTrMZ3KMUOG+CAie9MhTbR3DCzGC6OTHf3OR97UgtCX/xM5Q3moHZAM8QyLo75OAH1PgguCADUwgxrPqUW+x84OCNo7FNlN02rQ4vlz7sWbUZuaywx7Euvwl+GEJfFPlD1cc1M4V/YeYRACc3Ca9Mk0fMPjSblM4imdfUzzVdR6eFRP9K/a1A6UI7gW5n4sQtbJgm3Ak5JsaxsXJTcgk5M/S8bjFf8gBiNChQC6HpIVLRfcgralU08oIpOX++YNaAebcBCM+nqABDNWz6dZe4AWyYPXinAD57mYLgkRNRhoEkRKVACzIwGLJhmZkYB/LLYV2oeJflGzpFr+8lrmPrMVw3nSnaqa3198p/gETXSLkUA+A/yYcT2ekgcU0fIlGlyDR3WLCyOrc/ichU47Jp3jsQgISR2fxQJF4YkCxatU5SB6rURarcOvhBUxsWKrD8BVJ7SnDKmPgzQou6JPmPcMiNnO1cmy2FLlisOwxUllwL1V/uYi/Cpml+Rg/+IklyjL3luhVMpEX/H/mFOg/RQp2tGV02pkyMqQ2aRnZrGS3ABfz0YGJwodjQ21mXwN8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(396003)(366004)(39840400004)(451199015)(6506007)(6512007)(110136005)(26005)(86362001)(66476007)(8676002)(38350700002)(7416002)(5660300002)(36756003)(44832011)(2906002)(8936002)(4326008)(66556008)(38100700002)(41300700001)(66946007)(83380400001)(316002)(1076003)(52116002)(6486002)(966005)(2616005)(186003)(478600001)(54906003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Mi8nTfNaIIAcxz0FYiiYTmGkkcZVfzUVi/qcEVhoqz9XeVNTJ+lw8fTFHve0?=
 =?us-ascii?Q?7mHxYPR+hPUVqGRes8JHHUGfJ9y5mBenY4R0lmg0lq2gBEBtqEOctpCfmVYP?=
 =?us-ascii?Q?Du5iH7YR3edMS8X/dAam3N5fxyVPrKMmz3dZuzAPadJ3GrvzwTQNvUBWdDDv?=
 =?us-ascii?Q?b7ZHcDVznoLT2Y0yIMlSYhzjWogl5knu3UXH3sRSj36bOIZOwzFxDL1ZO7+O?=
 =?us-ascii?Q?qxntSytSlfXC8xRPH96OwH+4AEXuVhK050sahpLGqUj0/XwTIWDfq/1R3D3w?=
 =?us-ascii?Q?n/lz9s+Q63py7G73RqVee6KR6jIAkR3VYFhtvnCKAGG4AASLpmd34zBlykgV?=
 =?us-ascii?Q?mHpPaZyH2Eml5IrLdFlNeslytmbIExAt4sWtUzODhJ+wnJ9R4E1hFTUo4XXM?=
 =?us-ascii?Q?VTt7OOSdRGAFaNg/fyan53cRb8U8Z5W1kifdsCCLTSUfMg6OKDjPW9+ZzwFp?=
 =?us-ascii?Q?nEurWsggVzIYiu1G9Srmu0655zFGR2v588YivZwksZg/Pqk5Ph//ulZep1s1?=
 =?us-ascii?Q?aVc0Njybi87ldjchDteVfwTS6sNICMuW4uHXRwmm+I5mvg98BTeRFZHA7n3C?=
 =?us-ascii?Q?C0FklW2cf2TvRjyxR4TEueWLSPqTmURdweBRw2nVaKU854FxkgGXKamLaOKn?=
 =?us-ascii?Q?Aq6JUbAgK/3fQMEsh+cvlogbd4q4+eCTry6A80NRMD8Qedjym2qA+83Pj1io?=
 =?us-ascii?Q?cGMSTNoZPVGuVKnegNfB/JSY9OVwESuUhyfT8czySfGvd9bKjzcvRNKwVy19?=
 =?us-ascii?Q?0NdwI/hP1+OGvHtr5peeF9DcQKyxo/YjShH+SilvL6LWzceP44OpnQLMhiJT?=
 =?us-ascii?Q?cT4lFD92CiZ13DHQSIQTkhC0LSdOhnMQODASoG9jhUKx/2UZCKa5OUkEZhp4?=
 =?us-ascii?Q?LFvjlVADdlqs0pBUokngrCFruprpgznwHrq/fhot8mXAzO6O4fVpNNItYz4F?=
 =?us-ascii?Q?MGnLLf9lHV2lzTQnVFNgWTTM6U9ewZtlBtydSX5+uZf2dV6x4i9+jA+S4fDe?=
 =?us-ascii?Q?vSitRHbZwAoiAR8xbRW2EpwH3b+g0g6KwbGqRCE8mMlpd9ZVD7GIZeyXmpla?=
 =?us-ascii?Q?kAFKj/ZeM2jedMuwu7+jYxat3MvZix21MwkJ5y114WG0v4FGZAXhr/Cizp3v?=
 =?us-ascii?Q?rh/eeWzzomDACh4sQZCgv2TOyxW/+RJLIoKliv6eXkvJ/TDKKgYPxb5q4+MM?=
 =?us-ascii?Q?pXRP8A0gFtAKWKwkFow1dPY2XEOBrqke5qNX4HUaov5meD3bPAEc9L7aorwM?=
 =?us-ascii?Q?iIH0XFuAyXQ+uHNFJaPszcKRupsnDP6Za6qlyiJqDqnigpbYRo8Co+OkItQd?=
 =?us-ascii?Q?A5Ue17xOBZLmhWWIxXGFrVA5cG6ejBbIiWfYvrhgfDc8E+/tN4gaZcG89OYY?=
 =?us-ascii?Q?u7ANU1h/5S7VqhcFT7F2qIaS4Qszjsrw1btzMmjzGBwwfujHWmR8g7B6LPq5?=
 =?us-ascii?Q?2HU1dPoJXfuxdBUQQbewb//kI+pbNrioSFgpBXBOLHraQ6e3bRGZ0UvBDKwF?=
 =?us-ascii?Q?3iaG7FWMA1Co6ufxrdOqlzXKzCu3y1sBUm2wCGf++WF2XR9GwzGZGLs2tPEh?=
 =?us-ascii?Q?zwQc2iY9Mv4obChrbtHogoiuMkTnib9TwgqqBSrBlndtXbqmHPlmF8sOn6oq?=
 =?us-ascii?Q?ww=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9789f2-3774-4528-c2a0-08dab15e153d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 23:11:26.9476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0LYwhg1Q+2vJrTCPMdlxeMqcR0Qt8bAKrwBdifz2J8ZyzGMfL6FWdcLyFuK8UINECEMw7/bc49jdEKiAo0f5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6421
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

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

 .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 236 ++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
new file mode 100644
index 000000000000..f326fdc159c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
@@ -0,0 +1,236 @@
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
+          phy-type:
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
+          - phy-type
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
+          phy-type = <PHY_TYPE_SGMII>;
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
+          phy-type = <PHY_TYPE_2500BASEX>;
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
+          phy-type = <PHY_TYPE_2500BASEX>;
+        };
+
+        /* XFI.10 */
+        xfi-0 {
+          fsl,pccr = <0xb>;
+          fsl,index = <0>;
+          fsl,cfg = <0x2>;
+          phy-type = <PHY_TYPE_10GBASER>;
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
+          phy-type = <PHY_TYPE_2500BASEX>;
+        };
+
+        /* XFI.9 */
+        xfi-9 {
+          fsl,pccr = <0xb>;
+          fsl,index = <1>;
+          fsl,cfg = <0x1>;
+          phy-type = <PHY_TYPE_10GBASER>;
+        };
+      };
+    };
+...
-- 
2.35.1.1320.gc452695387.dirty

