Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D2B6E11CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4HD0R5Lz3fRk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:07:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=SHaGty8D;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=SHaGty8D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1f::329; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=SHaGty8D;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=SHaGty8D;
	dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01hn0329.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::329])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4GK4Db1z3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:07:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iie0Bl1raO6MNQbx9dABBRV7HF/h/2HGK/e4/Sj3ooA=;
 b=SHaGty8Dw93kOt4UlQwURXnHkx+d4fr2lC8X4DWP5Rs+hrjwy1QKV3aqBTDolYGEZzUp1ufpl2RgE7XMlzKHQnGH1OBYgLsvE1HbouUk9mhAZ3Pv8UQxYLDZbPL/FBvmMkRkUlXJCgsoSzTvnnqrfzqkB3lMKS9O3owfWLg2vhNms/kyMEcsF/KPYn9Sk3OKE58Qbf9Hwprcz0F7i6rimhFk8YF+jtkhs2YRG9lZoqJ+9jvmVdoLazxc7nOsK9S519FnJqJCJ9cTWb6QDGUFtIpt/Y7pHmrbMknrxDWbKOxXvFkh9Oz1hToKnQXAv+HLJF2tlSHSvJu8Lcfy0D34XA==
Received: from DB9PR06CA0020.eurprd06.prod.outlook.com (2603:10a6:10:1db::25)
 by DU0PR03MB9256.eurprd03.prod.outlook.com (2603:10a6:10:474::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 16:06:43 +0000
Received: from DB8EUR05FT054.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::5e) by DB9PR06CA0020.outlook.office365.com
 (2603:10a6:10:1db::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 16:06:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 DB8EUR05FT054.mail.protection.outlook.com (10.233.238.111) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.33 via Frontend Transport; Thu, 13 Apr 2023 16:06:42 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 9CD262008026E;
	Thu, 13 Apr 2023 16:06:42 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [104.47.18.109])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 2F30720080074;
	Thu, 13 Apr 2023 16:07:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTBrs9dKpxpRivW0SdZSKHy6AfhRjBJvywj5Ga67bO3AnHwcvVLCzIJnCYcjPANVmM9y89SpVwjb9IVyBVmkKKl8avw2D8yHL1kmZLBjqAYTfSfd7okQlQqJrsZeOu6u2rJ1OSlxuDszXLjR5XPjD55UzKhMkFB5sJmNgsfM68jXb2DfeNQQK839dil8VCqPC4ebJpb6uSq0VLqdAvWElpxfUK7z+jzcxY/WVfbfcsbh4oxImPd+YldvWEk+bM7FHBG+6f1UYhsihmrSsGoxRVLi1f71JNoKIuMq2gf2zAqUTGOLREs/x2RVOafxTZjKojWMLvm7FvtZsaxoMZyhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iie0Bl1raO6MNQbx9dABBRV7HF/h/2HGK/e4/Sj3ooA=;
 b=myNywdWrTBgYtjEGBsxv7bmn7KnMuHf7Vz/TBmfim7DJNHczWodMEya5eAlmxOFX1C/8LiMHLZTEnzHTH0XZ8cG2mARc1YqZihETBsgng8W9C0MxrVnw/xE1xec5zWUzwcJ7maCl5xTwOGXe1kIT8t5kFcsLFZH5iXn3AftsFGJ73qEhCZpNQGOolzRtI6jSvzaEDjmUEz1E8k/WuSzaUAlNYmcLLcxBnpZ8WUaqrS7Z5ccJAuVlraOjPtblDjp0XCsuCOhzCxtDm45W7fST5LRaXqNMHKuByKV0zpgidhdBGRjmoWrG9p1tWhtrOLCR0gNcOEYpeVLrxiBA9XXiFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iie0Bl1raO6MNQbx9dABBRV7HF/h/2HGK/e4/Sj3ooA=;
 b=SHaGty8Dw93kOt4UlQwURXnHkx+d4fr2lC8X4DWP5Rs+hrjwy1QKV3aqBTDolYGEZzUp1ufpl2RgE7XMlzKHQnGH1OBYgLsvE1HbouUk9mhAZ3Pv8UQxYLDZbPL/FBvmMkRkUlXJCgsoSzTvnnqrfzqkB3lMKS9O3owfWLg2vhNms/kyMEcsF/KPYn9Sk3OKE58Qbf9Hwprcz0F7i6rimhFk8YF+jtkhs2YRG9lZoqJ+9jvmVdoLazxc7nOsK9S519FnJqJCJ9cTWb6QDGUFtIpt/Y7pHmrbMknrxDWbKOxXvFkh9Oz1hToKnQXAv+HLJF2tlSHSvJu8Lcfy0D34XA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB9369.eurprd03.prod.outlook.com (2603:10a6:20b:57b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 13 Apr
 2023 16:06:37 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:06:37 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v14 02/15] dt-bindings: phy: Add Lynx 10G phy binding
Date: Thu, 13 Apr 2023 12:05:54 -0400
Message-Id: <20230413160607.4128315-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230413160607.4128315-1-sean.anderson@seco.com>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS2PR03MB9369:EE_|DB8EUR05FT054:EE_|DU0PR03MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f651e51-5340-4057-e9bf-08db3c3912cf
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  gu1313MhXkCYiTycdnLHnHAMoLN9r/V8eJTEI6BgMwRc0EQwposyTsPLUZp8tr3+d+4cOkmz1p8P6kXB50+IVFq27vAPr02+yoQnpMoSALG6fr9zOM4garz7yijlHHLOJjGyvFP6viTYmuuCAwZY3S4HGGn+O/NX/wBzt+yVf+AOHb8F4RSF0LWKfabZcuVHZjITFM9ddAmSXWmRqrw7zdFWEVkohHx/VnnjwVgFUJAhkfynLM0FwYI3GulMmkA29bEuIHwhAhgIOPsTZ35yKLUuB3WTbPMDPxGF6Fnr+1UsZ+Dy4HMwtW7utGw4UCkKWB0p/xwLQJwY0siRGqzDoS9JGNUs6gvOlW3ycQ3OyyfEMuWqX5v64s135fymg4E33eILYcotVtkXo4Qr/o7sevFiIAw3Zmyjl1M+G2aYqKgH+yX0dmzLDjw+S4IotIJW4+kHf8NOH2iuvAUw+uaI2jWrzI5+6XjSPzpf4fOj4INueMhvcwfQWYzsVllvaTIPWTF1ZDm193QUss6ldZTrk213dOQB7vMPcFHSugBaCFQFRUpk3O3XSTopB0m/xTJUmP1JG22MPEeL0l0q+AyxJZeRkJHpFVMr22Ggrd7DW68=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39850400004)(396003)(136003)(451199021)(478600001)(52116002)(6512007)(83380400001)(36756003)(38350700002)(2616005)(86362001)(38100700002)(966005)(2906002)(316002)(6506007)(26005)(110136005)(186003)(1076003)(54906003)(5660300002)(44832011)(66946007)(6486002)(66476007)(6666004)(8936002)(41300700001)(66556008)(7416002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9369
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT054.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	c3e00170-c233-48c5-9460-08db3c390f25
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MzhJAaMkHNS9MgtOgZaJIZiW9qbfe8sI7sJz3qHzALw5qs+vYCuTPio4p/Mb2i7GafVuT3E+5foovslipe947v+20hQIiFMYGd8jF9LwzImem1yJL4WcEBzPJawNiKPPHmp5Nyp0IZGv+mYGIQ+2iqEQJtRdKRTK+yL9iXRgi8q68DWuqEQH2vR4DMGb3PSyimyBt7y/KdM1BTDL+rYXRm8tapezIXH8b+kEiNzwD6n5n1nGMzqqe1oQ61MKxtyzahr5oiYcuzAKx7+F0w8v6K71tQJW3P2I2BEjKyUn2DoXs4kqh2W9m7kb/m8S0SW+y5P/I9ClKjzhkYiOEXhBT2+RlukxEuf+ysmcGPZidWS/X7EdEtZqDgS+Ff0FOzlmX/DiIJVsPfK+j9120qM0bmxI1GTY7DoQuLswdBRxhpwqvxkarVt6xgeVwsP6otf+0RO6m0h2qi1v/8hRoZ31/jYERxew3R/rXhB/5jplNd7Nka+IHVHCjh7vHav8NFl6R0Fdfj2M5OoGQjK/tb5TRpYnc7T00j6CoHCI4VcyYuE5AS8uUy/Clh6HVL+rdjbmC6bU3xTD9PoOO0PTAoStRtPdlqBefNEslf0GzPWUIhIVnm0tBDVW/BRQTLyKcsZkn0OqvAck4ZZPCubr3A5txXfQfgsdSab3DSKVr5fkXqRa+wKahWQK+nUaxYKQY27BM8g/v/F8MgFZQeSBKfIYShaqy7DLpAHdPwJjfoZ0xNO+vwiyHezv2p+t7hNO+dsb
X-Forefront-Antispam-Report: 	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(39850400004)(136003)(5400799015)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(47076005)(36756003)(6486002)(4326008)(41300700001)(54906003)(478600001)(8676002)(70206006)(966005)(70586007)(110136005)(316002)(86362001)(336012)(2616005)(6506007)(6512007)(1076003)(83380400001)(6666004)(26005)(44832011)(2906002)(7416002)(7636003)(5660300002)(40480700001)(36860700001)(82310400005)(8936002)(7596003)(82740400003)(186003)(356005)(34070700002)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:06:42.8537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f651e51-5340-4057-e9bf-08db3c3912cf
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT054.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9256
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

