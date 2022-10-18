Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38084603691
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 01:16:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsV9F0rvkz3f0r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 10:16:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=czxnYGq1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.8.75; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=czxnYGq1;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsV450b1tz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 10:11:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pfc8iKs6KHHsV2ujZe1lfVF8vnjnMZmmjbMxwmHKyEhDrSRDs4xhnDuFSh35vrJVenUT/Igq7xRoQoFWfKwwKIqgRUNGtiJxeRNFdjdkWrUL3XPsZacsjy9O3zuV6k6kC1pF4Pb2m2UlmIqiKKhUWfsOhEEoInDVtd9+5DJSGs0ZbBgHRyc67ZCoOQi7Fd/LJ3Qj4KuNIGoUSgjcZByc/z1WWjocjdGit2aZ0+8Bis/5OpQMdUo+Z/ggNqfOfDgkRAtowa7eVI1TNQ4v4pnmkc1GEIaSULozURXCWr18d/RbdqZlPrmZYqspLVWLzf46VuuRlxWGsRJn3kj9Ze9I0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nqu94qYNvf9w4pfsAbSJlc3AqtD97kwBepOGm9ixucs=;
 b=c62CEImigKCcmEPSZyWy1fNcyk0XlcwootY9PFpGU6S1x1bWAzXHZJRBvi1eNJUmKEfQCC4q09OBNmW5Rnd8F4WOSQHNK2UhPdzfZRSgaHmB7IfpWe+x/RlPCAwHtREQmdOw1GJz7R42m0FzYkqLzHIUy/EVLG94z3VdS8ZWF81GA3bx0HJPcBm3Gxa9XsSxRzrxMwmy9p9Ydl2UE8T+zqrjzpB3udZo76mYYY9L6PiZbtoOyh19QA/LF11+0RMw2WPtVxPskSrnMlz2OCda6vN1vJzjWxi0rvREt03Fm+ssjmms/uCHhVf6WAbTkcZwYTigaflQN13Yxx3u1bEq4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nqu94qYNvf9w4pfsAbSJlc3AqtD97kwBepOGm9ixucs=;
 b=czxnYGq146n3xir3CkKtPZbUxL97QTCNK4hQrXAsLs8PvfCwXiW3WeO4gPue9DRJgtM1fPQ0yC0+6AsfziM1H/UPtmXUK6SCaxUoyAUPGOgqAhuqxxOhYqphIBo5AEqE3+6AS2tpwE4mpnG+gjDwXB37P2BRIujkdhdSl7ZYYra0Fw+DDI51INsZD76Ldgr7sfi97EZrrGtPo1s006L41H/ERadJ8ke839uFBvmtU5FDU1gXCKwV3R2SdsVQXT9OKW01tbOuYNOzzyN5mvDxkVyEmCA9EX+gRfg8oeZhlCueVGG2cj57siEuFLtZx1E8Qzb6BiWhuhK9ZYXtWtrJsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DBAPR03MB6421.eurprd03.prod.outlook.com (2603:10a6:10:198::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 23:11:32 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Tue, 18 Oct 2022
 23:11:32 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 5/8] arm64: dts: ls1046a: Add serdes bindings
Date: Tue, 18 Oct 2022 19:11:09 -0400
Message-Id: <20221018231112.2142074-6-sean.anderson@seco.com>
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
X-MS-Office365-Filtering-Correlation-Id: 73a5c2ff-95f1-4bcd-548a-08dab15e1868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Kq4jKEmixoB5shxTfuUd3F8VIUegchBvH5roky52ZpUDIsLYQS0AYVisrpFskM3AU4cmhtkbSLEa8YRFTfNGvIkXJ/MwgK9lAb9/dl4WazeETj/RpnwysW3OalFZrvwjwzoeGnXOr/Nubh4ugNUyGSQF/HO0ZCz71sFhLe4Mi9Z8LfJYv/UErtulqjm5TrgHQUan++1WbHvIHKgg5GIXSdCFzxs9QOowbWwmm7xxIPXLWIgGyEtCRviuiBEt2hy76xhcpHwwh6yCydpurgaoJybpeZoSoioiOpNhfB/p5UoPFbBPniAAorggiPLlfAhL2Gqm3Padat50DxkWM8JmFwGEK3RIAK/QY/Q7FlPSLirP612OCzxYd0Ux0CMDrRUpI15GRuI2bBkNYLhPVSNHtg4+tiKa9HlfksBKE7hKaFqQ3IXYGTNoE7MD8BEw9cizr+t7MxpxhJogVdMb2uR48XSQ6l9TV+UUZT6z4zPL8Q/rw8PBBHsEKGAWBbq1X/0BdL9BPIf1QVhOr77jPIb4vWirrOCxSf1uFgyCUPskhad1AnEUlSS4Y+mFU1Mg8mOdyXyLxBMmdTGGbN3jIDwV5U6lbq8JyMKzFe98kXS/dJsfrUI8ZhXqrWArK0lgKk5KfE6EHIXYyPJxRs5cFYzDsOyITcFZUtNotdDpT/z8q3qeGXkl8kjubbOn+y/IRFdTFZ7EBO1mmA0TYEn9te6D74Q6212e4e8rFWbRDRm5VXl3wNn3tbPM5fgVSyHcNGis
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(396003)(366004)(39840400004)(451199015)(6506007)(6512007)(110136005)(26005)(86362001)(66476007)(8676002)(38350700002)(7416002)(5660300002)(36756003)(44832011)(2906002)(8936002)(4326008)(66556008)(38100700002)(41300700001)(66946007)(83380400001)(316002)(1076003)(52116002)(6486002)(2616005)(186003)(478600001)(54906003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/o604zPh2UW7nHPg7AIvuxixHIFmGr8SBXOp1RGDqfN0rhjyUQRIZwZBFxNW?=
 =?us-ascii?Q?PIBoKdoMNV8pORbj5SYQd8Ghg6EhpA6w9lf1EpnxRzNHQAD7fHkNT8eibxir?=
 =?us-ascii?Q?SfEnxi5jAAiCX/W0mWIBw0wilC6woDUgbm79puYe4bdcKf2rN/b796SeLB4x?=
 =?us-ascii?Q?Ao8TzAlnCXpNpikbGQ1EFOGyFEee2m5BKZUxnw+gH+Ij3tCthN2VICSLEVYj?=
 =?us-ascii?Q?RVO1526AfYMClJk/DiA7g3EJ7BrPOOyk4680EHoF1mGo1sNRA4v+6eqNjlU/?=
 =?us-ascii?Q?BPck+kBXZKO8adMvbqC8Xgo3k1sp+SjGAwPRZmH0a1GPn4PjT7zvvz3b5P/Z?=
 =?us-ascii?Q?UPvAqq1rzuppGdNuj59hS42TtGAb20V6iyLiL9P1xnkvJm1E1InEvuRJEzDX?=
 =?us-ascii?Q?4puT2yM6z3/VzaZdpBWxqO5he4YtEgZtc/lDO/1EfQUjSFoobpJt2AayR3Pu?=
 =?us-ascii?Q?lG+sU4nMSPWX+CAwG9x1ltefJXi92HI8EgM5yA0JW/hFsWC7bzbfodp7OmBb?=
 =?us-ascii?Q?P/r8FzFj7/YUIXM+znYTW6TzD0+f64RjwIkVdvZCN83tK7MLAJIQqQXqW9Vg?=
 =?us-ascii?Q?n8ETNlMALbfm6GugCO14DzIICInb9kup8ramyvuy3p1WsjVcv3cpS5PJ7pAa?=
 =?us-ascii?Q?iMJJ0NYxQj3uDDJwq5wZLdve7c0MpHrwQJjqNBIzjhy8aJgc7vVLTdo1T4bD?=
 =?us-ascii?Q?Z8yni9GtH2Ug0RR6f1w0+o4+Gg6ZTu0jtmf3W3dirBNxYlMwcyv21s+cj1Jv?=
 =?us-ascii?Q?QLJm7jIc+SOQ9SfsmPdCLbhOaYDL0Gq88pkO1LDCts8JdAf7gqoVkNw/gc6/?=
 =?us-ascii?Q?RASFWSVulsAX3fZ2AU5KGUa29tdlYMi7+UMs5N8I+JrznkeXr2awwoaf9Rre?=
 =?us-ascii?Q?mjMMuzG77Q9Sqw+7xGB5vfvH7ama2K/gpgjogMmA2Yalo8+wKNMfT50lw2Pk?=
 =?us-ascii?Q?hzHa8rqEm00v/vpbFryL5jS8Hp1+jv1BJXJF4bDEe2G5+UbwhF9yfmCKJ+zF?=
 =?us-ascii?Q?/lE295MDtWsjprAbk4Q7pR5iw+gC9d7LsEFofbL0rOeLhTGZ0jvlsmLtRzSx?=
 =?us-ascii?Q?d/VnOcn5yJCecL9deiyJB26ysOYRl5vswwOFhO1HeTOYrBuljriI8fc3lKIo?=
 =?us-ascii?Q?EX7yJcF+5MMoA0VtAwoCucCUNcNKnwToe9gQHlRbdWF6d5isd39+2zseLojj?=
 =?us-ascii?Q?eRR7hg5IMyw2Hn+wTsieYTP+EY3M5CK/YucdireZ3UMqmeg+4SGp2URBqi4x?=
 =?us-ascii?Q?4gLyaLyEJ9U9q22mVCaawpWgsweAhhfLLPCoaHsKPYX31Q7YYgEVsTeKbI0N?=
 =?us-ascii?Q?l58wCdxE1rtvzhkIsIM9kiOcYXRtTqVTLXKvGcQ/ciA1WM496uWekGODCTcn?=
 =?us-ascii?Q?0wzUjg/A492/oboeOgFGVrdi+QrM1hSZyiQo36vp/h0KzYhbiaLuRsbr9Gxe?=
 =?us-ascii?Q?0+r0dXgAPRSh9fNbMd1HQvCDKpUxOQ+wXxWpbp6ZARIwrDWFg9kLSZmEO2n/?=
 =?us-ascii?Q?pHZa7yrYEvoTCRpMbL19SK/srQsCUZYM5/b80wvfQB9hiimRFU811L5Zjlz+?=
 =?us-ascii?Q?RuPbbt3m9N2nWRJgr85vKYZZExjPQAV3tk79y5QJOiPrtLxiWOZNFvfupF55?=
 =?us-ascii?Q?UA=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a5c2ff-95f1-4bcd-548a-08dab15e1868
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 23:11:32.1972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xI8+X4mJLQ05r2A7yG9GBGA53g9rbI6C1DNI1sxUUdMU1tstKQ+59wrXyLQhbEBzk/Xlpwl47M3q+RlsRZF5aQ==
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds bindings for the SerDes devices. They are disabled by default
to prevent any breakage on existing boards.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

(no changes since v4)

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
index 3d9e29824bb2..8f986b4f5efc 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -423,6 +423,24 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
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

