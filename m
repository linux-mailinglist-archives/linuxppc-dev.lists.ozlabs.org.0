Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6236A1F3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 17:02:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNZQk5zYHz3f4D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 03:02:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ZtvwknL+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1e::601; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ZtvwknL+;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on0601.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNZNm3NQSz2xtv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Feb 2023 03:00:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLKRr/YFREF/uALQLnv9nnaAueH3ACZn+p4XyG/eAN9Q6YRNLvI5CiVzIXiJAhrf18lHDPUuJfplHzosXOZWg+2UEqmmNbMLiaj9LGBaGRUxAAsVhLuKCiCjOgG6T5NbmNyoqjcRLZMBo9CCASN0TNzJN6mfCbokfXV4GAnKkdzTAF94CnXO0QvXktOj8PkFePmCyqJtZr40l6IvMg1GMBExQF5fgp5g/QbnxZ0gYgdXTSvUJ14MRySyxu8pyC/ZD8j1JWP01x+2d6q8mXdP5S3a6kKuruPVaeTCBsFDWh7eeyWqPjgIJ0KSv3iKVPZ+3PkMD0Y4EvNKuAsWGrewGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dY0a+YIHmq1lIMioBTT0wVqJGvMFNfYFG5XetFVe62M=;
 b=bNQESzrUYMG5VKeUr0iQnTQq+3zrz3ze3HY6y1XrbR5EhOEbsleo51TrruzuFE5q61/JA0smUqLVYuKLyTAIiB5Ua0SqNNuv0l0FSV+SogolzulqPoWXOYxPwjDo2HTNjOnVmd0/OlMRV+4gxuPHVcrhHDgbOiKQzlC5oLupJTIe/CVvlQm68X38sioTuCmGAH0MgfaeY7VSpcpUNjXpaApF6JZxk2gyyY49+r1zBrwR5fDo6g98VvEku8v76+d8FI5azJMZNC69TDNAc6KWQZjbkvbF4qhHjugIPOM71m/Jfi+cYgLqToitVEdGuAL1isW+FSzoKNa2/wbvKUL8aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY0a+YIHmq1lIMioBTT0wVqJGvMFNfYFG5XetFVe62M=;
 b=ZtvwknL+bumXaITfeB47o4XoIpxkv0DN9hBKvkQvIzICaw++vmKVk7r3rwenAQ4Zb3R4KdlcmpKvsB5d3txTV1QEo0ZVdfVzxS9ZiIc/v4mD0npkDpD85yzpDvJYyGIpuq0Ws8w437uSLrKHoHyRgqYlSXrPQwiV1+J4dqBJS4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by AM8PR04MB8003.eurprd04.prod.outlook.com (2603:10a6:20b:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 15:59:58 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::29a3:120c:7d42:3ca8]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::29a3:120c:7d42:3ca8%4]) with mapi id 15.20.6134.019; Fri, 24 Feb 2023
 15:59:58 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc: dts: t1040rdb: fix compatible string for Rev A boards
Date: Fri, 24 Feb 2023 17:59:39 +0200
Message-Id: <20230224155941.514638-2-vladimir.oltean@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 21e0dbc3-ad5a-46f8-c936-08db16802e05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	WnuIulcFwYA7rWMk265hAUGxSZ7fBqym7w52Rgeb/3wcITpwpbn+OOPB21zwL7xayV2Ig0BRrzqsoXQM0jX/292m2ueH6IhRJbbVu0D6tv/DsMREoZJRZwamvEmx3IRl//PQ2L1nkha0YEBvMbNjUcfV4mA1gfi0uHLNyF18RqMMgp0WrEtM91muq9Ldv0+jmcokADZmpdHryHItc+8rUE9pYSEusIX/PsE0rOtjAbq+I6/DTCN7T44RLcXczWCOBIFF8dqCgPPpgGfyhb9UTHd5h97nWHo5Olh0lu0EoZW+x8XehIvLAeT86uoJU0cQ1wqL0JsUUCAuHOuiTqP+v4I/uFzZExCnUQsiv2GcK1HI2AxIL8f/0+8bb9xt5Ir3LAXqEdACeebVfBTkDi4dPDs4LcyrCf+HduQnA0FrZHoZTNxyxDlOTNLl61FyTxLoUFprhxcmsakvKgFde1zSK0vXoRiodjsGjJdswXYyTFgHXZ/7UnGESouD7zyVUOFz6hWU3Y86Jnajm0b1r5imMs3jEc6MIXn3IWfS3JY7PExdcggbMKa9FPKxPkXMgSginDeEFTS/AEOyrwYOqJULccNBxsOHL/1gBCXBl/ifShTXHOPu1uf2Xkiz7bi9zPdsDBkjsNlfc2VI9R0SuHNhYdvjJ8oiF7aFXvcpZ1kBiPbEvSyUsdzdD/BCQdmR4GeAy32ZRz68+090eKWEsxJJhw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6452.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199018)(66476007)(6666004)(36756003)(8676002)(54906003)(478600001)(316002)(38100700002)(38350700002)(4744005)(86362001)(7416002)(2906002)(44832011)(66946007)(4326008)(66556008)(5660300002)(83380400001)(2616005)(52116002)(6486002)(8936002)(1076003)(41300700001)(26005)(6512007)(186003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?oc8c6y/bv23Lt5SdV4bL64oj8Q0nmPjftDQdLipWhxnKGBRPHCKe//58kKpL?=
 =?us-ascii?Q?SfEg2wf6C10WgUcTMExn7dQ2LxrMVviOZI0JenEhnFEaYtmPv8tJN3hnnuZj?=
 =?us-ascii?Q?XehMLdBjRY4dvQx3792ibhZMfYds4oqobMwnen+dcAaZgkhmqRg4U1ge603Q?=
 =?us-ascii?Q?B4T5Uky0Kd8Z/S46gOdu6p/LA/ZSaI4dgSZf3LLFdaOyYo9hSZk+ckeABElZ?=
 =?us-ascii?Q?Ma3D4d7BaT8fRMr6FSG3XYDona+iJPx5F8NnvL3kONgSp6Zd91fs3t+RGsY8?=
 =?us-ascii?Q?p06dZ1LPeja5JBMJ0TMVteh9T+ggUy9N6uNRK7atBL46myoYBG/dle8v04Pw?=
 =?us-ascii?Q?+mbiIQ1QnrAc7iBnk5eXUAvr18ieuFauN2NbEJIptHGv1l7GVIQTNHsSPItF?=
 =?us-ascii?Q?m1qGsW13lAUg8EO0RTl61BFQrMCKz+TKOCjGoOW38Bds7hJudAdFJU+MwjHv?=
 =?us-ascii?Q?LCCOwlx4IJodav3EBMpfmF8SxmWKPuEt9LUCwPZAV8mVMPoShyiM3GFvzJM1?=
 =?us-ascii?Q?uCF5/io+FtThcPx/0Sl3g6I+YAbh4KAqGYAo+JPj4hVrLHKiZahqY+IY33e6?=
 =?us-ascii?Q?bl/gLImA8GZdHoE2C7wRFRpWzbdw2Tw+UbwkpW2St3sQnKxTtqKej0K8zM+s?=
 =?us-ascii?Q?62sFNq0lhamYACWcNIHZCdxf6nYdvB3k5qWf4/UlNZQ+TKx5n8y5HBfLxH/Y?=
 =?us-ascii?Q?0vtv8Qtk+5aXlAxqfy/Yfti2omNLuyqOTjFf4gNsx3YY4c8TZ/hUY4RBKWV3?=
 =?us-ascii?Q?stuGwQVEPdnEDlqW/x/+d/x4Y3tAmEhC0Szt/NC9VDqBIV14AdyCLkmiHXHZ?=
 =?us-ascii?Q?JOTvoHBOc8g/8XsTgJ2MFk1NAozEUCPjUgTEuWttaS2Xz7twjlL7oTG3B7F3?=
 =?us-ascii?Q?2rjqlMvHok0/JBdnjngQ+0zoRn/VC8NoaqLvIh8gFbSn509/WeCYwS9uk0n4?=
 =?us-ascii?Q?JqHM7sCI3o0t4oUbLF+a1r/ey6Eey0fQtQqVIdD7xMDlRS/k0anL4OHY2xZo?=
 =?us-ascii?Q?OTltus+que6vkhPzto5DTQ90Y0oVZZR/Bn+1vEnNKwqrcAN2R20/DQABg4fy?=
 =?us-ascii?Q?gR45kPd2WBH0tZys5vaRScc3zoIB9ENRfYp92dO5obUs0BrgEJcu33r3uIXB?=
 =?us-ascii?Q?WbfY2A1ur0OG5m2GV7pwUSlP6yQoqFbiHdvMhTpIo+1AaD1Pi/jI4pzfL0hS?=
 =?us-ascii?Q?J4HbqZ/B+5KxhZ5gfiLgPlZrxTtQkk/hxm/TdMvDPrELi2o4NNGqn9INmwUR?=
 =?us-ascii?Q?rxXkl/nAcyKYn206/l2sgKBPk3vkh/8pcDYPQvltLaytmD6fbCyvOYErSaO+?=
 =?us-ascii?Q?6cvSqByB7c+qgSVxrjksQN5XLtnxZpF6xM5hJ99/4JXaTHaeBf8XAdAFCS20?=
 =?us-ascii?Q?HD5GYvaE+mNDwPVTbXI5/wZKHsa2TFo2AXU3OqWxdvy+rAXzOnWhT5K2Azob?=
 =?us-ascii?Q?FE6wcfubqb6KOflphTFlmCYD3eOQLo1wJyccxTAdMppwzcfEvcOmzsOLBOt8?=
 =?us-ascii?Q?4qTEIaJvCk+llJOy2zF9rFpr9+1gJO0G9u3TiLhmvfYWdpEZ7c20NdSoBWTp?=
 =?us-ascii?Q?9LFL9B0uCHKiA/kQ4Dt4i7QxC/zxObQ6mhMZV8cI/5O90bSEQgS1vHTYsZrI?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e0dbc3-ad5a-46f8-c936-08db16802e05
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 15:59:58.8844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPvjL0po3jwWvCElimLxrvbow8ylnXdee5kOeQhGbIl1wI+Oe/RJw04HvZuFnX9x+zOMDw+nIJRMkKGc+2BibQ==
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

It looks like U-Boot fails to start the kernel properly when the
compatible string of the board isn't fsl,T1040RDB, so stop overriding it
from the rev-a.dts.

Fixes: 5ebb74749202 ("powerpc: dts: t1040rdb: fix ports names for Seville Ethernet switch")
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts b/arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts
index 73f8c998c64d..d4f5f159d6f2 100644
--- a/arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts
@@ -10,7 +10,6 @@
 
 / {
 	model = "fsl,T1040RDB-REV-A";
-	compatible = "fsl,T1040RDB-REV-A";
 };
 
 &seville_port0 {
-- 
2.34.1

