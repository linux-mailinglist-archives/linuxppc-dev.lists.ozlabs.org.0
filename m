Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAB958A317
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 00:10:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzNFS2Zskz3dwg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 08:10:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YZJTHhs9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.13.77; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YZJTHhs9;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130077.outbound.protection.outlook.com [40.107.13.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzN9X5K52z2xGN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Aug 2022 08:06:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKEN8Rdp9cQGFF4HTgTG3ede0OZX+Qn0FT4juVnr0tjEk4WnHIbQstHQp3JFF/NwhUrsvCStO4JEdRz2kd9JxozuWe7agcQai3A03vaGXJzZda18WvbEXxI3alwwxZFaZ4GpEWhDSsS5htSkW2k3ZRInIy6eQkqAhdNJIRp+fGa227wBcLiYf4izrA6GVylWI7bs87NZBrTEn5X2OvD2AYo6YjGrOZeQ8f8DPBWBpV1WdQe+FWTBz0zT16kGSGI+onJU7fYsU91grHZ97IYfVGPGaQCb8Z1fqpQRC/DOIt89YYPXwX8/TO3zilgaYT/imcqDNttURkaMghhuBFmVdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygdPPJqjVp7YWfMMWCkU3Y9BwS2dFd01o+BP+n2pPAI=;
 b=UrLi43/sDdei/ugjIfR093bHVpmSX12SlZv0MqsDFFVWpRfhExzOYmMEdyJaGSGiRj+zjPpWaONUVJDJtrUuyT0R0jeIEQlVCV34D8d44zjnjE4TATv04VUhA74CI9BPTSwe3ObGnbpq3juBrcgJrZ9SAvcOaKn3j2dp1Vq64jRYN+sqwrQyaDXovyYEViITfg/Nwr+RCvuVosqOkzbcgOV/5Y3iDursSZIhWR7obdAGCaQESXA1ijjAJ2weqphRqvcxJNSCwkRoSA2IW8SuUAgpWA62pUCBabyuG+DHit1BpzOxHDCU+Xe9IBBLzLbt2AYdoYl+uv8/Tjl+8kKYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygdPPJqjVp7YWfMMWCkU3Y9BwS2dFd01o+BP+n2pPAI=;
 b=YZJTHhs9KgykRcdiDNqhaLrWfT0YA06cgQPilVA19u0W0aFZc5HWCIZII4duXjHWCAUqTtGYsALDwBn2eCn4vrh8V5FUyOgEwo5yTYlpcHQIajGIoiQoDztdzLwaQyP08rFqHu+zv5lxz2kyFX5By/6xd2j33NXWKdJlSvF51yApBFr3XLAB4OEiluO0Wl4K7UppCddiYiKSkglD/16SxJ102b1qPthyBBoOOegnaLnorJCJ6i6jMEEzyEiKpZqSVwLsOa9BI5lU7y58nEL4sJZK+L5PXyIFF4MomOcXT6UTV9hXBgY7HtKYF46qaVJJagG32cmxLaIiU2VCJa9xpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB8419.eurprd03.prod.outlook.com (2603:10a6:20b:527::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Thu, 4 Aug
 2022 22:06:22 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 22:06:22 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 5/8] arm64: dts: ls1046a: Add serdes bindings
Date: Thu,  4 Aug 2022 18:05:59 -0400
Message-Id: <20220804220602.477589-6-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220804220602.477589-1-sean.anderson@seco.com>
References: <20220804220602.477589-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:208:32a::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d20de826-ffc2-416a-923c-08da766590b8
X-MS-TrafficTypeDiagnostic: AS8PR03MB8419:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	s/xiuEPmZPmd8bUiER4i/71DMXWgrnimCS9Vm1n2ujaoHY+VGMSdsffxKUqusptnjt0DX50qbihSlwga/zjIauR/1xSaxPoAUw+Gsme4KviHIRpkR6NaQdHJb5rnkj+IepQj2Fdfy3Y6NZbXj6Dtfmwbr/WFX3JfOxOkuYV1YIZHcm3nNDNutZLamIHeaAffYr6q37nx1ZJ5FgD7m4TM12lYYKlomwWlka+3L/UusGrWZBHSXfLMAATLdZnnMhT9CIjqSZj5DspOoGIZ41TsxT0uahWxJWno3lVUqXYnUaKiaMm1zboEtlpq9fzFVUJlN89Qg5DSjJLwk6h2SgZiJyuKKsXTn2tyRKQXN8IkCDfveI1RpzoCURTpH2qzUOBtXvj1ct1NHpQPMFhFZZVCWaDFDlKfv9mOJBujF9fTBuzxK/tEi2mzxFIjlr7ulRELRyFy0V0bmK1H/NbYN5J4eogqD323FMzVCkmmLGp1HEIHlumrN4/bwcVIyU6GGPe7jKNWWrWLC1B4EgJ7y994gzgLz4cWBmoRCYSqPArYhAbkqbElSuUdjreuS7cpLTHI4P5KuWM9FvH8F9OuiGtsE1+rb1mZlDd9yp8afwGfRd7XDuidmDiOTVpGoXwG3p1/S1uXSL/mxyu1U/wYbck2NH8O7l/eWkEV0+3gK9wCus1SYtmvcwPPeHRV1JHs1wdTOc7TcpnZalZ/igBOkqYIDuxr8/fh8dQILva8syFzyydruJX79rBjcTL8Xzhpzw4nNczI3Xqa3ZVBkim15cTU34ZV+KRptdtC5Ag4CBcIwLI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(39850400004)(346002)(6486002)(36756003)(110136005)(5660300002)(316002)(66556008)(54906003)(66476007)(4326008)(8676002)(66946007)(38350700002)(1076003)(6512007)(86362001)(2616005)(478600001)(186003)(83380400001)(8936002)(6666004)(38100700002)(41300700001)(7416002)(44832011)(6506007)(52116002)(2906002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Ui1zZpfD6Up2xGkAix4F1DWFzDjd16TdbEk0TLQH8NYKOnlFRwkKdSAA+Bgu?=
 =?us-ascii?Q?znaj84kUzG57vSS9x+4MnyDwLeXqQQHVU2mgA1FL2gkYfuorf7mMi7LK2snr?=
 =?us-ascii?Q?JzMEHg9SsMafRNNhVnQHXgG5/ejrkm3dKjbGVUlY4oHb5eEeSVuYD1J7XWyL?=
 =?us-ascii?Q?2p2kB/gujkgcfTuYHvKRTbopoXHmjwlq2lhhpce2ijr1+Ui+TKBsMynhahsN?=
 =?us-ascii?Q?3PMU3+xeNcqM1ZvcaHKG0M+LpiioLW6Zl2DTZy4+jQdEq5btAmCC6Ik9GST7?=
 =?us-ascii?Q?ukouXfZSE5aWQ9R14z11GGoOmUhVMAovOKcCqYmMyi+vL0tufHAf9/zsWDcU?=
 =?us-ascii?Q?Bn++Iqdr7u0cjBigbmBk7K/yfD8MKHVxmehFcQ5dGx4Rjct2vwkAiUhyRap2?=
 =?us-ascii?Q?XS00OaImEufQw67zfm6vDjxkipG1dcnW5Z4VaQ6Vsv8J5Nist3yBo2H5eLTW?=
 =?us-ascii?Q?xO3jFSTFlWEpiVNkVkDcJ0/UuKlm9QBnD/quHXktKWApe/8GPq53k44wLDkK?=
 =?us-ascii?Q?ugeKcVLuVsPYCtwtdTQtLq23PR1eNos/9VV34/nu4U8YMUWwfqv/uyQ+1qOO?=
 =?us-ascii?Q?qQ+OQOoVrPtcz7GmI3qswCaMGslNZqTbUkkSN4iX2idltKqN+lS8yQqU1M59?=
 =?us-ascii?Q?CKAOkvSoSqDwmemxI7YOwVWvHvbO/DT2Z66CBGW8A0Uku6wxu9XQvj7YDe2y?=
 =?us-ascii?Q?8uzD44PI9fzbimkH82bDsz9QlOcvjcJxn42bsAdWD/Qxy6jO6cHgPkcky9NE?=
 =?us-ascii?Q?LYzoY5qxf/C0odmnj72wcV9dSwB4A959C6E9mm692ocP/QoDfUZnD9vRG52+?=
 =?us-ascii?Q?n++p9QRg6x8irwpPYRQxK1P6iTF/OORPA1c0h5vcuH6QnRI0TSUuIo16y/7s?=
 =?us-ascii?Q?ghlYHVcoDE5l/5zScbqoMUQCco4D+HFGBnQvkL5HAByCkx1b0HWYQopQ2f+1?=
 =?us-ascii?Q?xV/9rQdsSN/BqUcrk88JbT7TuizAl3Hz+SUlAjYe8M1P5OaEHLwDwwEdspou?=
 =?us-ascii?Q?y57RCVF8lOLyqOWvzkT13a7xH/xutyABpIvqNS1C6smmrpnV8d0VAwEHgIaL?=
 =?us-ascii?Q?BX8F9n3SbB7Jv0WoZ+MFYEZRE1ulkmoyuwR8q6L/DthDT55ucY6IXX812MnV?=
 =?us-ascii?Q?NxYULKDmETNz6pyX95scb1UxttVvbFfMB3nq0vtB3zvMQy0rQVZW9Vg/SJDn?=
 =?us-ascii?Q?g5MctRX7wvqdzulCH60L1ouwykln0wLVQZUiXPUjJZMhGleNNK/vc2jbs3oo?=
 =?us-ascii?Q?e2uSfc8fVEJ3uT10CsK8V0tX6pXwhjmtxT5MfUYTzoAYM9g37YDKjIr2TH2W?=
 =?us-ascii?Q?6lCG2rqUIxHVgd1+6LQ5EsiFyVFlRcvoYuhdaiaorPj4sB5J6CLoPGPq6TBh?=
 =?us-ascii?Q?KDxpWedqyaw8bSB4gZymr3snRmEsnLNueI1Qu0ztczSq02x4LV6pb2ru5vtd?=
 =?us-ascii?Q?WJ4yR1HoXkLEtJ8q+Fj9+KdvRg8FhjqLXPHWsaaHEGEeVQmUQVLXEdZcmQ/f?=
 =?us-ascii?Q?0Tz3fHDTwj7zXRPEvgyHyXSYEZyj2U4ikZ2D7pFJjqm7q/CaxqcZdDnlCXcg?=
 =?us-ascii?Q?Y50L+fmvDtjSH1h29iAuqaBol8XFeqEXra0v3RYqGDStcIC1V4U17Vinpsqm?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d20de826-ffc2-416a-923c-08da766590b8
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 22:06:22.0792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RC0SNify/YH+BhmECVicKaAQf7u/BNX/C2qJihgFU0raWhS3+F7Lzup+c+9n12TVtcp6HnSnw5lsGw6rteb5WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8419
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds bindings for the SerDes devices. They are disabled by default
to prevent any breakage on existing boards.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v4:
- Convert to new bindings

Changes in v3:
- Describe modes in device tree

Changes in v2:
- Use one phy cell for SerDes1, since no lanes can be grouped
- Disable SerDes by default to prevent breaking boards inadvertently.

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 0085e83adf65..d6e7b378e128 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -413,6 +413,24 @@ bportals: bman-portals@508000000 {
 			ranges = <0x0 0x5 0x08000000 0x8000000>;
 		};
 
+		serdes1: serdes@1ea0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1ea0000 0x0 0x2000>;
+			status = "disabled";
+		};
+
+		serdes2: serdes@1eb0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1eb0000 0x0 0x2000>;
+			status = "disabled";
+		};
+
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1046a-dcfg", "syscon";
 			reg = <0x0 0x1ee0000 0x0 0x1000>;
-- 
2.35.1.1320.gc452695387.dirty

