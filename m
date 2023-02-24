Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6546A1F44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 17:03:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNZRm2mJwz3f3H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 03:03:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ADhe5ZmN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1e::601; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ADhe5ZmN;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on0601.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNZNn1BFTz2xtv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Feb 2023 03:00:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kelYe4BkPy00pkjcTlfKzENhuQ9mbUXV/ctzV9/fazSE4fLxbYafD9qGOy+oxQX58Yo6djOTqi6eAa4c1S7halxZvZDVfs1bns+mLEHYVbR18cZZU8umCOKElbFLlxrLLvnrb1TQGZv0LFtWRggmgJvP8dv79srx7eTUulK/BDQz/1/2wdwK6kCeRC5QhB4hRZiloUiMVpUfw5xCj361ehZxsXKe/28yoWFthLUqTSoNqWfbhgaYqfgBGz8vlkUPbSp6VBQXl6G7WItEkrrLXHeVTmoJoTimJBauN/x0ap6v0Bzf4ZWE3crcbRQEaNiRuP3o3k+hQPKxysEAf3u+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIYHdptRHVmWHjgk1ifqAIlt3EsFIrCM1LT+xKdCZgA=;
 b=lllMY3h2n0LfjnllAcB5XNbMXzpNW8UjA4OOHGlx5KhVHHOOo2hEeGZ7PJVkdTX/QrimnM7HTKrNgCAhEEw18NFq6L79ss/Ldx6nalvoOCuF7FLoVsqC23viwNNobCZR8IsjJtJ21+xH1+C0hSH3YFkd3Bl+xs/kX4GxesfMPBCEem6UwXdYNNJXfCoyxFV2YjvmmuQK7QhyX+9p48Xm/7bMf5JpZVFXZUdisk2TgQ8zy+DaXlPIDzVkfSWg/C/FVNqWsPce85YWddN4N/7i/6QOyLYLwmeKyZURq7y4Bdw6OQmh1an8j7pD6woXbxZtGMEQ1/z/7iudFC1AelD4KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIYHdptRHVmWHjgk1ifqAIlt3EsFIrCM1LT+xKdCZgA=;
 b=ADhe5ZmNGjAlMv5aVeqxK2WhvQmyOK4W4YBKafxci5VqSgG1Y0mfBc0+F2WBcHzXGFdF+0jEUJfWjAgHPVMcKnHYaIRXdmn/sx9HpKH78U/whuK3Q5CaH7KoH0EFzKOe8sV1dvucjPQi83Jyzf9El4LD1p82LWv8libhMklfb70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by AM8PR04MB8003.eurprd04.prod.outlook.com (2603:10a6:20b:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 15:59:59 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::29a3:120c:7d42:3ca8]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::29a3:120c:7d42:3ca8%4]) with mapi id 15.20.6134.019; Fri, 24 Feb 2023
 15:59:59 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc: dts: t1040rdb: enable both CPU ports
Date: Fri, 24 Feb 2023 17:59:40 +0200
Message-Id: <20230224155941.514638-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224155941.514638-1-vladimir.oltean@nxp.com>
References: <20230224155941.514638-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::6) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|AM8PR04MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 596ce244-5209-4f9b-5ddb-08db16802e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	XfriU+vATHuv62hGHnGhvmOFcoqoBjx3cvH/v+szycf14vDvd35wkBXiWUObg8FaMiJ3nwb2+0NgY8TYwJWuU/mSrn7PK3DW9cM2SCNVkJsYQhaFAO5swbBdnLpcFBw/4kLF1yCjE441AtFJLhHwq9L6E3wufzLPVklyUpEN1NY4ViVUbQLnNOYUUWA++FxhNkcLetCLw3qPx1nrKH1hPScWQnypYiEynknEMML+zJkWtfn54Gywk2kcBFgFJ+kBC4E/P0Mdm42hMczrqvAbwcR9U2/4qLNoZ/QpuIBpqmHnMfVTVv/VUDPgUBG3vHje+TFaF+SXWbkz3E7cLon1hmWuL7yd2V4uS2J/j0Xv7uIc9loJ2Yukzkl4KmEC4+y2a0Fw2YIYJVV0rdDJDcolfHBDEtsu35ONfsgGYlyNA0oF8jiD5Q+O5pR4BOF69dLci9ScDyp4vjII6C+2BdCizbvto9sTKbbfZthbzsycGX4ILy03ytqdYgXhK147WhkrIfKIiGCiDkcRliLv0EW5lWFtfZiOWml2K+CM6oqw8JpSp4wRjQeO1pnI4AVq9MeKR5GtubYUz4qorfukeZinUToF5qfCy/keWqc9xsWxHRO/1tU3TFbeyGb89LtVgixk7un40JIhb/zsmtL9UPxLTlbu5KV8csw0dbelGPoQsEf02G5zVGXEV9rA2GVDaa6mIORCyZaXA31HAo+hM+J8MQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199018)(66476007)(6666004)(36756003)(8676002)(54906003)(478600001)(316002)(38100700002)(38350700002)(86362001)(7416002)(2906002)(44832011)(66946007)(4326008)(66556008)(5660300002)(83380400001)(2616005)(52116002)(6486002)(8936002)(1076003)(41300700001)(26005)(6512007)(186003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Gxb/AyoRxXN5cKVg4JzCofoXtQwj0RHpks+mOM0LViMuvpe3POSpuhF4X4WY?=
 =?us-ascii?Q?uUghDdM7O3McDrhqFCJwCXevgMvbp5gCGtS0V1FQkUoYe4zmIE+nHGdnwz5X?=
 =?us-ascii?Q?v9+Gvdt7FOrHPH+Af153ugW2KFORsmm8BTibN2eVtVWhkiCQKeRQ4VrtA9Nd?=
 =?us-ascii?Q?vxgdBRU4FKN2yzLxgPq2C2giEXYdLFYNVmbHgzG1dwxyA9KgtwMlqY1LGthM?=
 =?us-ascii?Q?xYSbm4Ix58qZp4zgD0LyIcDPvG7BU8GfboMOXWVhdztH404F2JG3LID20loE?=
 =?us-ascii?Q?ZR9SU3NIhVyg8w8GJrXnGm/BcrR33/SLoRkZi1EcNxfGKuExNVQcEOwbfPbO?=
 =?us-ascii?Q?DOFMjJxP8uHQKGWyKPoS7OpwNpa6H+ds/P0xeq5YFQ+11pUuNCtIvHXdr1SZ?=
 =?us-ascii?Q?xl5fsQSeWPjk7CN+xzfQQCMBsSkwkJyi/mhHQVvR+D/7RR2OaQMWPUWV7+hr?=
 =?us-ascii?Q?rf/DhhZRUcD/cEpQm5By0WkdVgB5hvlB1P4E3zW7i3q9luUNcQ1OuFC9EwW/?=
 =?us-ascii?Q?I4c5wYwrOj+oFV+lvTsdtayi6Re/Xudjp9AN9O1bo44aPCZunshHJ0Yoog3A?=
 =?us-ascii?Q?c17oryXw/u+GSpvZuG8pbWvl8HVSCqCkHJFMeX5IQBg4/xIo63XVQ3obsC4r?=
 =?us-ascii?Q?U1WVJny+WhbW+DA9Nr8j3rBAclNJQDrkpe7RpH2Z4mJIqHy/vAUaZopjSp4+?=
 =?us-ascii?Q?iBRN/u2NZkLxHAPh6bZ4wLIUQnj3+quDDt67FeakQB3+Gd13nYG56MRDavzI?=
 =?us-ascii?Q?Mr60hYdSz0wtdqHDkqkrV8COsa8v/bBCQmPGEuziNRpBsKHnSZZIKS/W4tCs?=
 =?us-ascii?Q?fHgStxbY38zBK53y5pb18jIQHNcRge3rKcpsvGiOd/vy6Fa7xTn6JVc0zUvF?=
 =?us-ascii?Q?Pk84QH3vMIS/C1KAn2Rb2NmodRLoLJGBMmxwTNuT+7LmgVqVPEWtzGW7VNOG?=
 =?us-ascii?Q?/1Zw/hAjocKh50QeoFK/QjrTS3CyEuudDtW/5+oKiBrkd7D5nTMK+PxX9yUq?=
 =?us-ascii?Q?oE14RuW+/AKBdeii488u3obJrUPF4aac9p3yh4OpvP3l9HiduUcXlsrEmhDL?=
 =?us-ascii?Q?Jatly7aRjcrm18/IXZhlRAy0qPRCWf0LrVEu8MzyuuYJ0/YOheP+BT5KaxH7?=
 =?us-ascii?Q?PIzNmDrY+jS9rKHFq49Cpm3qow7E8Cnr8IASt9V+SZN8HE4WpQ4RGDf+xmjj?=
 =?us-ascii?Q?NUdGLixra4FFsldNYmX8X9k+3uQwu13TIjoZk6ZLbSZQ/a1l/32qiMX5mWIR?=
 =?us-ascii?Q?BO/FHr0oOE3/HLHMNGnpf1T7UW5wlzDg9/drgL3PfLmJcYhFzyzuksZKinTL?=
 =?us-ascii?Q?ZR4jqqQkd6qVX98Fw4govbUsovbD7d6T2/EGZItpZgPISRt/hbm6nWX83s+A?=
 =?us-ascii?Q?fp/febidr6XhDXMt3EUFeIQE6lAPLtx6CxS7m6uk45TV0keG5C3KUIy+Ezvl?=
 =?us-ascii?Q?sgXZgfKYTvCPMdAEiFFHqeJq8+42KTOX7D5nsyhSyxQJfCRAWrMMEbpmwXvP?=
 =?us-ascii?Q?k0Wiczc6s07GH7wBoS1TX9YlRayLQ4jsR7ewSZJdp2d+uNaje908Rx9d2pMU?=
 =?us-ascii?Q?okvR8/XVyRT0tDiVbvZ8MtzNtp4wSBEZmq63sAZU0PMcn73jVdiKa8yfumP6?=
 =?us-ascii?Q?bg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596ce244-5209-4f9b-5ddb-08db16802e9e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 15:59:59.8531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roWyg8Scf939uM/C1LFamgfEWGtcsyGcFfKoWQ6sl0/0MWW16U5VpB/PGTKFaKCLDs3farSe/t1/gE7zUFwdKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8003
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Maxim Kochetkov <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxim Kiselev <bigunclemax@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit eca70102cfb1 ("net: dsa: felix: add support for changing
DSA master") included in kernel v6.1, the driver supports 2 CPU ports,
and they can be put in a LAG, for example (see
Documentation/networking/dsa/configuration.rst for more details).

Defining the second CPU port in the device tree should not cause any
compatibility issue, because the default CPU port was &seville_port8
before this change, and still is &seville_port8 now (the numerically
first CPU port is used by default).

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 arch/powerpc/boot/dts/fsl/t1040rdb.dts      | 5 ++++-
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb.dts b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
index b6733e7e6580..dd3aab81e9de 100644
--- a/arch/powerpc/boot/dts/fsl/t1040rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
@@ -180,6 +180,9 @@ &seville_port7 {
 };
 
 &seville_port8 {
-	ethernet = <&enet0>;
+	status = "okay";
+};
+
+&seville_port9 {
 	status = "okay";
 };
diff --git a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
index f58eb820eb5e..ad0ab33336b8 100644
--- a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
@@ -686,6 +686,7 @@ seville_port7: port@7 {
 			seville_port8: port@8 {
 				reg = <8>;
 				phy-mode = "internal";
+				ethernet = <&enet0>;
 				status = "disabled";
 
 				fixed-link {
@@ -697,6 +698,7 @@ fixed-link {
 			seville_port9: port@9 {
 				reg = <9>;
 				phy-mode = "internal";
+				ethernet = <&enet1>;
 				status = "disabled";
 
 				fixed-link {
-- 
2.34.1

