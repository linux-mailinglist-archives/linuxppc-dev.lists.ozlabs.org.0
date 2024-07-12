Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A28D692F891
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 11:59:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=LQmvcmb4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WL6W92xkZz3g9g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 19:59:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=LQmvcmb4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WL6Tb752Gz3fwq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 19:57:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSflWVzChaJIrzMSj75h30sth9WsSZsss88ah1mMUus9KQeScJq6Yg7uluTNNTXmX62Jmm4KC40LNkFc1d3dYK/FZ0TRLJI0isfXfCrpe34GeWkyjwwO3cAZOmqTZXKcl2TEbUyMjpO7QTWNjoZIUWppWk+GgGaeunPdnKCeoANrjt33WcyF/klIiKEd+Rb9lrZHHKq45xS5yn28feZ5VikjYlpOTTZ9egeGZz026Xy492TEluDFhlUSKAij0I48MCqdLhFj63hht9M1omdFBDWUXFjcOwlo4OB4TMTHJnhWLTO4PdqZpND2Y7mx9XsN/hy2r7EzhLv9/6L9rRobow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+IUua9VXwUehUpKMbwuGTuNg1MRc5BSAaD7Lih6WeM=;
 b=Y4XiFiPr5cRzB8JzRfzFp22m4ZAGFsvvJOHbRkw05GcmNuruWQb2daMKRmIyYGqqCGSvyJ0sAeitq3USUuvDRvxJ+QjHcyUpaHkfl0+7SMBvkFWgX+tBhKrS462tsQmgzXK2CMjnupL7pqpU6TvYH0h1hfxBBstKug06+ZWisawdYJ9OYMEDVUuTgWEyD2ujXEnIV+isfok1DOY5CvGmQLwktuCVZnNCPm0YoPwZyn+NKYfkEQzSIgbcaP9i6eJsePBEjJ4wrTY9cU2Chlulns5pnJvc1CVJ/0OE5ys/MJfd6+dLWQBzfYpE1XK3AaW2l+pPwkBqzg6nzJL7IWREjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+IUua9VXwUehUpKMbwuGTuNg1MRc5BSAaD7Lih6WeM=;
 b=LQmvcmb4xhmCb9XkHNwlqvw7969EY8igw7pSwXFpyHS/fIbuIbmNncbvcg0vCaXvEJ64QIhugykseYChH+TTiP7nRc4MpNczxjppYi5txj1ljwN+BaUqaH5X4IE955KJTc4tkvODiu+666qBk1YUgv7vpDViMv+yp6YK2CGTmjo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com (2603:10a6:5:33::26) by
 AM9PR04MB8340.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 09:57:13 +0000
Received: from DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a]) by DB7PR04MB4555.eurprd04.prod.outlook.com
 ([fe80::86ff:def:c14a:a72a%4]) with mapi id 15.20.7741.017; Fri, 12 Jul 2024
 09:57:13 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] soc: fsl: qbman: fix unconditional WARN_ON() on Arm during fsl_qman_probe()
Date: Fri, 12 Jul 2024 12:56:58 +0300
Message-Id: <20240712095658.577186-2-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712095658.577186-1-vladimir.oltean@nxp.com>
References: <20240712095658.577186-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0050.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::39) To DB7PR04MB4555.eurprd04.prod.outlook.com
 (2603:10a6:5:33::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4555:EE_|AM9PR04MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: be498fc7-7886-4726-8cfa-08dca2590142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?QOi7P/W2TZjLrsL7GNL1yjpTDfLX0+p1B//mHTvZNiFP7QpgxvZMokxIxCfG?=
 =?us-ascii?Q?c7eMmioNq2dVp5+2VJMykLLKoLgAIF0DkuQnXnjtCrUvyGJsmpN1XVdRmvUp?=
 =?us-ascii?Q?kAV0Eq5CCgN2TATEkEPmaAUKZSszAlrT5ZUDl1xo9X32SQvLFvcEtm9eRMKT?=
 =?us-ascii?Q?MY0feDytTx9iHdFa/dy6b+NhVrQaN/j2ESI+gXQxl385+V6z4tFyN0qPvyvt?=
 =?us-ascii?Q?cU3jNa88uyl6ClH+ist5pCiVof1HnTZwGIDQtApq7GtVnF4iGt9ArnSjDSvj?=
 =?us-ascii?Q?Ckeuw6XH751EPTuzsU3pCYXj7TTs7cKwW+UxjB8qrvQ9W6buwWr2ervSydil?=
 =?us-ascii?Q?qosMDyFNyc84hpriQzpsb52Livf/Irxlc6fmAJ4he2fwxv7xey5iZh5WE1sc?=
 =?us-ascii?Q?uWv7L6bl9yShPtc/rfNu8ju0KbB+Hn9drB4uybdpTbyjb2dtLS3Rd5ZpKHwj?=
 =?us-ascii?Q?dsyIky7ZkUp/fv8Hg+IncVHiPGeqb2g5dvePRWiAJRkoYY50C6SzS74ezoPg?=
 =?us-ascii?Q?z1HqqFwR4prGkYaqk/7vas7SGDrW3F9dLBe9o7+lo7rzikg3BPu4MH0YaPaS?=
 =?us-ascii?Q?DSimXq/aTm0b0h4LcQAnNPgeFeUT7lQg9lcGa6wcNhWmq3wtbecFm1DU/eQ/?=
 =?us-ascii?Q?BpEyjm0C5sKNGhUtplESn4E3E/++yVd3YjbP7TngOe8XxbEzn7L5o4UjLl0D?=
 =?us-ascii?Q?D+o+E0TRzV+upQY4I29GeTN4jcEQEDgb07f7t6c/GaoVsehlQP8sfiLrDmf+?=
 =?us-ascii?Q?im6CUhZgaJq5oN2C4IsYD+BdOEV/iVwWYmiqs4iVxN3hIaWhte9Q/faLJmWV?=
 =?us-ascii?Q?k7lvUOlKo/C91wE9sNrnnCzVYA2Rzj1VDyf7jKnaOMHzHso9UYOIBI7s8Aia?=
 =?us-ascii?Q?sJcDrzgZRlPilbb8nj/JmKoko4EGcKHEQDe/HLg0nr1/8vZwMq2yuF5Jz1kN?=
 =?us-ascii?Q?ZsMsQSxqrSxOxPc1XoceWcxWWly1Eyx9nhL0Tl+Zxuea0HGQyN9d5uE2xOy1?=
 =?us-ascii?Q?B7Kd7Q16pkHm5afUKOI4YAm6J861SC5T2rissll8ta8F+bn1e3BevbZQ+Veu?=
 =?us-ascii?Q?LONpcMLkPv3/kGqolK6fJ/dsLRfqSOWlHXp7HyCP+5hy/3+6HptiQoaUKXLe?=
 =?us-ascii?Q?Mk2E1uz7QoEzU6NOFZLPOBBm4k2csSUk7OX3cLI7h2csYGTR5ht3J10gQ2o3?=
 =?us-ascii?Q?vz0d8rEh3jG8/3NdKI2VDB7tfClVlSYTxel/S2bVOLMV17RvXL8dFOrYlozS?=
 =?us-ascii?Q?qL5x6vFXxvkipnatY01aUA6eSV3meQhHGty1DyTKfX2nvGcNcyVP+9WIN/9B?=
 =?us-ascii?Q?3Dyb8kAF//1oVf0mildgIutfjCBObiOlhEs0Hgo50jij6lD/o4Rz/jIyXAyq?=
 =?us-ascii?Q?qps7VNVfe/WbIDVb1MKQlDkyWz4cTSZCR3jjz1ngHa3KknU+eg=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4555.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DlcoK6RZGwm6r68etzJ9QamzuTHV/WbRLLoeVM3NoMJHgFxa0XyED+XilQaQ?=
 =?us-ascii?Q?X4T/buWo5KW/q4NGfdPWlXm19zS55IhXKLfk55esRbCkz9LODJDNSSrYvFZ8?=
 =?us-ascii?Q?1Ulmqx8Id9//hOOs1Pikzho8elXzRfDCivhx6SgxauJnfHvYGF1+VmyjfPAe?=
 =?us-ascii?Q?ztsvRGLKCLOwjVoDHeoqUmqL5wBBo+sjSBPudaJ6+AZTJQLRkp3LQiGvwNLv?=
 =?us-ascii?Q?D66MS4EspEF85bJl68tFoJnK45EIBV8Eow05+10GOWUCdcySgt2UrJNfXAH1?=
 =?us-ascii?Q?yQ5wAYmLV4vD3gWBZ0ozefXdWpt6aunivr0pohWPYadNOJLtlH6gysSZDtqG?=
 =?us-ascii?Q?Y6RGuEKtwvS1lgaGebB+vj0GJj9Y89coANz0B3rf8z41XIDfTXigLbGtmbzK?=
 =?us-ascii?Q?T84+tvYKidraD6gPww3xuD7TTIyMxS9FSjay+A7debPuB8DKcZ9n2fW5iCkt?=
 =?us-ascii?Q?PNbUfhvvmlkwjteINs3bKflDkLIL6BDblQT86w8kai63VskqqLqeULLFyyJT?=
 =?us-ascii?Q?6znZYluDYuNBAqg5dH2UlXVyGmHnKMnmNUWx7bb71WW8NP5AvQ4AJpIulFIQ?=
 =?us-ascii?Q?aU8fs3SczfWeuRL09RaL0N9I7bmDucrkMqNHPP2VX9ZG1lhMFln74dtnDZV2?=
 =?us-ascii?Q?LQUJeaqZOefFvN4p0jDiI3r91Zp7vrcI05CArnfTMeljVfHIyPnop4Nml4vl?=
 =?us-ascii?Q?Nd+cQzjWQu/dsqVPtkXqA9p8Pk0D4iWrMeO7rYw2PpfeUwNbAc/AXs+wGQYQ?=
 =?us-ascii?Q?xINfc6kPgM2Ga2/EE7YT7gXRgOhPnB0JuautZr8rRz9lzwK/Q+0sTDnpR5I0?=
 =?us-ascii?Q?CNtBQqtpEdo6mA3z3j5aTM8md9W8ryvxLSSqYeRsTKHt56vPuMsGwbs+Faky?=
 =?us-ascii?Q?gK6+iGTenYqyUwYQ4+7ssYURkAMMAginLODr7C3fZAUpWqyClbI0Bq396cbu?=
 =?us-ascii?Q?y4yez4dsnbGDAbtNHfoIjuRk8AC9qEBiBiUN46ME+r+ZDIMtFXio6+MuEX0A?=
 =?us-ascii?Q?qy50twGoZ4oWVh2DfzPXW+JwqYq1kbE6Sjb66XnxAXyxlMLw2NCzD1pxgqnG?=
 =?us-ascii?Q?lRfPdbmIcA0YV3YeCUyZWbsGda/qNsefaULUjg9pTOMNc6N2BdZBahSlwRVa?=
 =?us-ascii?Q?Z7vfGlyUN7HIVQuPTY0cVTe7Cz7kVp+V8MReKneU3+dKxdWQlUxDAf8jKjew?=
 =?us-ascii?Q?syUA11usK5gBNgZfA8hSP3DNqLnmxEWAmUqqTbR+r5hduzr3TJjRHVZd872y?=
 =?us-ascii?Q?kbJr6olnnTvQx9PRgBl2Iwa0ICIoBfiRDqWzYkYWJMjaqQj9sZzGb6KEhMG0?=
 =?us-ascii?Q?/6mM2Dg//WSleVOgZE+gxatJek6XGxNutcrW8GanNB9Y03XmWSa17aW9aNIv?=
 =?us-ascii?Q?q+eClvI3U9zPhSqnzMmX1iSpjOCOm9A3JdBrSjDIWHKpy3aMrHQ3NX7It7+Q?=
 =?us-ascii?Q?eNpLKPgm1Qrj3czkME0S3KBqrTYtqv51boZ1kAjLnq9BX0HK5zE4C1J5MFV+?=
 =?us-ascii?Q?e45kAn+igBOYhqnn+RobdPCXVyiy7nWUKi0zcxXIEdV/NlM/AgHLiXzNEwsl?=
 =?us-ascii?Q?FKZZbrMZxEx8D6a+VGGPkLFE0Dj7YukePA1cu/flram9TAE6DQ4G8shcT/tr?=
 =?us-ascii?Q?zQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be498fc7-7886-4726-8cfa-08dca2590142
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:57:13.8731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hyUYbxyv4e8vHF9nlUyo1iDsJpO1BeNP//GEWEN7wpAmPfI+GEqnPWBwYEcvEAl1NpHzDG7Lpqd9f0UQwr88sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8340
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
Cc: Rob Herring <robh@kernel.org>, linuxppc-dev@lists.ozlabs.org, Herbert Xu <herbert@gondor.apana.org.au>, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The blamed commit performed a lossy transformation of the original logic.
Due to it, on Arm DPAA1 platforms, we are now faced with this WARN on
each boot:

------------[ cut here ]------------
Unexpected architecture using non shared-dma-mem reservations
WARNING: CPU: 0 PID: 1 at drivers/soc/fsl/qbman/qman_ccsr.c:795 fsl_qman_probe+0x1d0/0x768
pc : fsl_qman_probe+0x1d0/0x768
lr : fsl_qman_probe+0x1b0/0x768
Call trace:
 fsl_qman_probe+0x1d0/0x768
 platform_probe+0xa8/0xd0
 really_probe+0x128/0x2c8

Prior to the refactoring, the logic in fsl_qman_probe() was as follows:

	if (fqd_a) { // previously found using RESERVEDMEM_OF_DECLARE("fsl,qman-fqd") [0]
 #ifdef CONFIG_PPC
		/*
		 * For PPC backward DT compatibility
		 * FQD memory MUST be zero'd by software
		 */
		zero_priv_mem(fqd_a, fqd_sz);
 #else
		WARN(1, "Unexpected architecture using non shared-dma-mem reservations");
 #endif
	} else {
		// Find FQD using new-style device tree bindings [1]
		ret = qbman_init_private_mem(dev, 0, &fqd_a, &fqd_sz);
	}

After the refactoring, the search for the new-style and the old-style
got flipped, and both got absorbed into qbman_init_private_mem().

This creates a problem, because there is no longer a place to put the
"fqd_a != 0" branch within fsl_qman_probe(). The callee,
qbman_init_private_mem(), does not distinguish between FQD, PFDR and
FBPR, and zero_priv_mem() must execute only for FQD.

Split qbman_init_private_mem() into two different functions:
qbman_find_reserved_mem_by_idx() for new-style bindings, and
qbman_find_reserved_mem_by_compatible() for old-style.

Let callers explicitly call both, which permits fsl_qman_probe() to
zero-initialize the FQD memory on PowerPC if it matched on a compatible
string.

[0] Legacy bindings used by PowerPC:

/ {
	reserved-memory {
		qman_fqd: qman-fqd {
			compatible = "fsl,qman-fqd";
			alloc-ranges = <0 0 0x10000 0>;
			size = <0 0x400000>;
			alignment = <0 0x400000>;
		};
	};
};

[1] New bindings:

/ {
	reserved-memory {
		qman_fqd: qman-fqd {
			compatible = "shared-dma-pool";
			size = <0 0x800000>;
			alignment = <0 0x800000>;
			no-map;
		};

		qman_pfdr: qman-pfdr {
			compatible = "shared-dma-pool";
			size = <0 0x2000000>;
			alignment = <0 0x2000000>;
			no-map;
		};
	};

	soc {
		qman: qman@1880000 {
			compatible = "fsl,qman";
			reg = <0x0 0x1880000 0x0 0x10000>;
			memory-region = <&qman_fqd &qman_pfdr>;
		};
	};
};

Fixes: 3e62273ac63a ("soc: fsl: qbman: Remove RESERVEDMEM_OF_DECLARE usage")
Cc: <stable@vger.kernel.org>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/soc/fsl/qbman/bman_ccsr.c | 11 ++++--
 drivers/soc/fsl/qbman/dpaa_sys.c  | 62 ++++++++++++++++++++++---------
 drivers/soc/fsl/qbman/dpaa_sys.h  |  7 ++--
 drivers/soc/fsl/qbman/qman_ccsr.c | 40 +++++++++++++-------
 4 files changed, 82 insertions(+), 38 deletions(-)

diff --git a/drivers/soc/fsl/qbman/bman_ccsr.c b/drivers/soc/fsl/qbman/bman_ccsr.c
index b0f26f6f731e..d8a440a265c5 100644
--- a/drivers/soc/fsl/qbman/bman_ccsr.c
+++ b/drivers/soc/fsl/qbman/bman_ccsr.c
@@ -231,11 +231,14 @@ static int fsl_bman_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ret = qbman_init_private_mem(dev, 0, "fsl,bman-fbpr", &fbpr_a, &fbpr_sz);
+	ret = qbman_find_reserved_mem_by_idx(dev, 0, &fbpr_a, &fbpr_sz);
+	if (ret)
+		ret = qbman_find_reserved_mem_by_compatible(dev, "fsl,bman-fbpr",
+							    &fbpr_a, &fbpr_sz);
 	if (ret) {
-		dev_err(dev, "qbman_init_private_mem() failed 0x%x\n",
-			ret);
-		return -ENODEV;
+		dev_err(dev, "Failed to find FBPR reserved-memory region: %pe\n",
+			ERR_PTR(ret));
+		return ret;
 	}
 
 	dev_dbg(dev, "Allocated FBPR 0x%llx 0x%zx\n", fbpr_a, fbpr_sz);
diff --git a/drivers/soc/fsl/qbman/dpaa_sys.c b/drivers/soc/fsl/qbman/dpaa_sys.c
index b1cee145cbd7..7c775c4c8a21 100644
--- a/drivers/soc/fsl/qbman/dpaa_sys.c
+++ b/drivers/soc/fsl/qbman/dpaa_sys.c
@@ -31,28 +31,14 @@
 #include <linux/dma-mapping.h>
 #include "dpaa_sys.h"
 
-/*
- * Initialize a devices private memory region
- */
-int qbman_init_private_mem(struct device *dev, int idx, const char *compat,
-			   dma_addr_t *addr, size_t *size)
+static int qbman_reserved_mem_lookup(struct device_node *mem_node,
+				     dma_addr_t *addr, size_t *size)
 {
-	struct device_node *mem_node;
 	struct reserved_mem *rmem;
 
-	mem_node = of_parse_phandle(dev->of_node, "memory-region", idx);
-	if (!mem_node) {
-		mem_node = of_find_compatible_node(NULL, NULL, compat);
-		if (!mem_node) {
-			dev_err(dev, "No memory-region found for index %d or compatible '%s'\n",
-				idx, compat);
-			return -ENODEV;
-		}
-	}
-
 	rmem = of_reserved_mem_lookup(mem_node);
 	if (!rmem) {
-		dev_err(dev, "of_reserved_mem_lookup() returned NULL\n");
+		pr_err("of_reserved_mem_lookup(%pOF) returned NULL\n", mem_node);
 		return -ENODEV;
 	}
 	*addr = rmem->base;
@@ -60,3 +46,45 @@ int qbman_init_private_mem(struct device *dev, int idx, const char *compat,
 
 	return 0;
 }
+
+/**
+ * qbman_find_reserved_mem_by_idx() - Find QBMan reserved-memory node
+ * @dev: Pointer to QMan or BMan device structure
+ * @idx: for BMan, pass 0 for the FBPR region.
+ *	 for QMan, pass 0 for the FQD region and 1 for the PFDR region.
+ * @addr: Pointer to storage for the region's base address.
+ * @size: Pointer to storage for the region's size.
+ */
+int qbman_find_reserved_mem_by_idx(struct device *dev, int idx,
+				   dma_addr_t *addr, size_t *size)
+{
+	struct device_node *mem_node;
+
+	mem_node = of_parse_phandle(dev->of_node, "memory-region", idx);
+	if (!mem_node)
+		return -ENODEV;
+
+	return qbman_reserved_mem_lookup(mem_node, addr, size);
+}
+
+/**
+ * qbman_find_reserved_mem_by_compatible() - Find QBMan reserved-memory node (PowerPC)
+ * @dev: Pointer to QMan or BMan device structure
+ * @compat: one of "fsl,bman-fbpr", "fsl,qman-fqd" or "fsl,qman-pfdr"
+ * @addr: Pointer to storage for the region's base address.
+ * @size: Pointer to storage for the region's size.
+ *
+ * This is a legacy variant of qbman_find_reserved_mem_by_idx(), which should
+ * only be used for backwards compatibility with certain PowerPC device trees.
+ */
+int qbman_find_reserved_mem_by_compatible(struct device *dev, const char *compat,
+					  dma_addr_t *addr, size_t *size)
+{
+	struct device_node *mem_node;
+
+	mem_node = of_find_compatible_node(NULL, NULL, compat);
+	if (!mem_node)
+		return -ENODEV;
+
+	return qbman_reserved_mem_lookup(mem_node, addr, size);
+}
diff --git a/drivers/soc/fsl/qbman/dpaa_sys.h b/drivers/soc/fsl/qbman/dpaa_sys.h
index 16485bde9636..1c80244b34d1 100644
--- a/drivers/soc/fsl/qbman/dpaa_sys.h
+++ b/drivers/soc/fsl/qbman/dpaa_sys.h
@@ -100,9 +100,10 @@ static inline u8 dpaa_cyc_diff(u8 ringsize, u8 first, u8 last)
 /* Offset applied to genalloc pools due to zero being an error return */
 #define DPAA_GENALLOC_OFF	0x80000000
 
-/* Initialize the devices private memory region */
-int qbman_init_private_mem(struct device *dev, int idx, const char *compat,
-			   dma_addr_t *addr, size_t *size);
+int qbman_find_reserved_mem_by_idx(struct device *dev, int idx,
+				   dma_addr_t *addr, size_t *size);
+int qbman_find_reserved_mem_by_compatible(struct device *dev, const char *compat,
+					  dma_addr_t *addr, size_t *size);
 
 /* memremap() attributes for different platforms */
 #ifdef CONFIG_PPC
diff --git a/drivers/soc/fsl/qbman/qman_ccsr.c b/drivers/soc/fsl/qbman/qman_ccsr.c
index 392e54f14dbe..4735b450d97e 100644
--- a/drivers/soc/fsl/qbman/qman_ccsr.c
+++ b/drivers/soc/fsl/qbman/qman_ccsr.c
@@ -731,6 +731,7 @@ static int fsl_qman_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
+	bool fqd_found_by_compatible = false;
 	struct resource *res;
 	int ret, err_irq;
 	u16 id;
@@ -779,29 +780,40 @@ static int fsl_qman_probe(struct platform_device *pdev)
 	* in order to ensure allocations from the correct regions the
 	* driver initializes then allocates each piece in order
 	*/
-	ret = qbman_init_private_mem(dev, 0, "fsl,qman-fqd", &fqd_a, &fqd_sz);
+	ret = qbman_find_reserved_mem_by_idx(dev, 0, &fqd_a, &fqd_sz);
 	if (ret) {
-		dev_err(dev, "qbman_init_private_mem() for FQD failed 0x%x\n",
-			ret);
-		return -ENODEV;
+		ret = qbman_find_reserved_mem_by_compatible(dev, "fsl,qman-fqd",
+							    &fqd_a, &fqd_sz);
+		if (ret == 0)
+			fqd_found_by_compatible = true;
 	}
+	if (ret) {
+		dev_err(dev, "Failed to find FQD reserved-memory region: %pe\n",
+			ERR_PTR(ret));
+		return ret;
+	}
+	if (fqd_found_by_compatible) {
 #ifdef CONFIG_PPC
-	/*
-	 * For PPC backward DT compatibility
-	 * FQD memory MUST be zero'd by software
-	 */
-	zero_priv_mem(fqd_a, fqd_sz);
+		/*
+		 * For PPC backward DT compatibility
+		 * FQD memory MUST be zero'd by software
+		 */
+		zero_priv_mem(fqd_a, fqd_sz);
 #else
-	WARN(1, "Unexpected architecture using non shared-dma-mem reservations");
+		WARN(1, "Unexpected architecture using non shared-dma-mem reservations");
 #endif
+	}
 	dev_dbg(dev, "Allocated FQD 0x%llx 0x%zx\n", fqd_a, fqd_sz);
 
 	/* Setup PFDR memory */
-	ret = qbman_init_private_mem(dev, 1, "fsl,qman-pfdr", &pfdr_a, &pfdr_sz);
+	ret = qbman_find_reserved_mem_by_idx(dev, 1, &pfdr_a, &pfdr_sz);
+	if (ret)
+		ret = qbman_find_reserved_mem_by_compatible(dev, "fsl,qman-pfdr",
+							    &pfdr_a, &pfdr_sz);
 	if (ret) {
-		dev_err(dev, "qbman_init_private_mem() for PFDR failed 0x%x\n",
-			ret);
-		return -ENODEV;
+		dev_err(dev, "Failed to find PFDR reserved-memory region: %pe\n",
+			ERR_PTR(ret));
+		return ret;
 	}
 	dev_dbg(dev, "Allocated PFDR 0x%llx 0x%zx\n", pfdr_a, pfdr_sz);
 
-- 
2.34.1

