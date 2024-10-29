Return-Path: <linuxppc-dev+bounces-2684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCB59B4FA5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 17:43:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdGKx5jJfz2yVD;
	Wed, 30 Oct 2024 03:43:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730220229;
	cv=pass; b=W7jyQlIfVnpxuv0I9k4yzbqnpO3qirvgEVLTG1KxYjAXbLd65XJRoqnWVIXKs1ySEAkkRTpFOeNp3bTL11EmvDyuvBlBuE5ftr9xAuYrGJg1fKW/XAhuzKrsnuaHg/srqRMMKVcLmFiRvl3HWkdrantA1Ed6guqQgMnvAHOyCEWgTzAsuHdbvCwLYPk+oWdtfk0tFmcWyMCQW7vUZRQaQpzhRgNk3LjAPYqXpjw2fu6ZyNAq68mqEA3GCGeIckP4uTVFvp6lQSlR2G88Yss/wP+WkmIDUaX/FXvxeDACyh29SxOyGzQlgyhpWVhv+xXxGlzkHLj4F63zDJcyeF6jkA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730220229; c=relaxed/relaxed;
	bh=fSSkmTixLl3/1Fh7+SC+f8nV2tdqZiSqUtEUT7pDEEI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=M/Qotib21wrhusfgpb/QkNexjj4G4rQEbISJ7UTW0JdGNkw/kc7oaSC5qDVC1rnk/7S37HeHq+K5YPL2aJ+JU2UKbNr81u0HdIM5a6mu5lq5uNgljH0/OMJFHeScJ4SMMZeiE8dp6dFGDJRMAN86dvGON04UHrZhHvzQD7k2anzmnJIrHHkus9V3S2wAua8pAWOUKx/o2oOh914ybNfCZ8JCrdOJHQmjWzvu9E6WTNuTTgeIG27ErLbNpKqet2E7JFKMYt3+RaFZsxw9TcI8uNoT0Emb7laGfvedM9z5tHfcHg6IvUM2xK+ijjgQWia848f/D7I1dNh+VGcwHhofeA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=cBliRqaM; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::609; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=cBliRqaM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::609; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdGKw5F1nz2yT0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 03:43:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHrVQXfAPzIFPknqhClatYrR7cJVIe58fo5eKnQSLoqNd7X2gLCfLNlIy6VODLZDBzN7Z0g9aecZj6uEbVqRigznInmlIObs0lxV2z5IIE6X2ZXYAuKxMFiy8GFv/LGbOLIo9pSSwS3Kwy9GPrylOcD6xr9QMRoDrvNoMGNGH5m9jrC3mBAgNarbeUs+cz5nGk4Snw10GlG2YyZnReOpbHE+y82tOz/cFTb/l49k5+XpwiCFNCJYDmeH/xpOPLIAH12KpDz5cNvQvtHSjJb+SKaX6jTKZokSj3XDi2fvMU7zZBpm8SjDjaCvmqDNILF+WOQc3N5flEJMMSuOK/JKjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSSkmTixLl3/1Fh7+SC+f8nV2tdqZiSqUtEUT7pDEEI=;
 b=ykLF35NvcChjKB8KB7K8oGmEZDmsgRWOlxvMXj50IMPs5ResC4A5p2X/BVZea0L0yTqGWqx/QazDyXclWX+EAkeRwQwEMmC+xDreiNv+qf/0tZpUwvGm5Rv+Ok1KQ/4t3a2wyCjyNdyVUdnBOIUYfnqK6LDdnOsR7ScahmM2PxYtWOL4FxljIdGlB68V0tSn7NCVRVj7sbCImVjZCMEPbLHkJxjvEzpN0Ovt+6F/bb65AJkG8STWZ1WwvMfcxo0wjVv10m6/XNwBRAbmh49V2Q5F5owSZliYY0x09nwtCZp4gTAIGRF01FfxpUasM9B71o5xWFoWb4Bwg3YZ99WM8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSSkmTixLl3/1Fh7+SC+f8nV2tdqZiSqUtEUT7pDEEI=;
 b=cBliRqaMvci24455Vk3MsKdd2Z1ZMFQd2O++E+0l6rOEBM+JOV8fKOb8BuNM9S9iPeOlYCaUilMKiN4/5+P9Bs2BL9jczvr58kz2G0ONh5Bh9tIB0uh9pst7zrCAGIM/+T5V4d7YsnvXrRr7ESvCsA2vPOBGXvRBAE74esVlNWY6gg6rtOnHa2GEzBkkFUhjdhsgGjTHZdJA21koSiM9AmJ+6HgJRC0sCiOqJwwUfHSeuIRcTz80D44d9p49jxKseRkkx2fP+wxpazZSwqjbaFVjkuTQoj+R2AoQPWm3jlP+ozUe0sM4Oalr6Z6/6ymlzdK0HzVSKbn+dpyvx4QLJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DUZPR04MB9871.eurprd04.prod.outlook.com (2603:10a6:10:4b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 16:43:29 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%3]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 16:43:28 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Radu Bulie <radu-andrei.bulie@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sean Anderson <sean.anderson@linux.dev>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 0/3] Fix sparse warnings in dpaa_eth driver
Date: Tue, 29 Oct 2024 18:43:14 +0200
Message-Id: <20241029164317.50182-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::14) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DUZPR04MB9871:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a66453-f870-4bbe-f97d-08dcf838d0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?byFZ4bowTiYNIp/VwOuNgJThE7n2swgG4AgsMrOVwaRLc3Bo6yCmGgT2ag3A?=
 =?us-ascii?Q?wTxDsh9Iyirv94jiC+ab4zgwcwuLr7XGehYMTvpMKyAun9vgh2WINLQNjB5n?=
 =?us-ascii?Q?FyAUvtAoh2mN58a8R/Z2NAgE50Os97oshC9XpVj/hV9d1aoPGBEyGxvyH1LW?=
 =?us-ascii?Q?PEQGpk8c7ntMsGpZRRSkolYF+Vu0tVvXGnSotWLoIIzcLQOnINM0LHQC2vLh?=
 =?us-ascii?Q?A/B53XfNxqnnz3ZqlQe+LofawMviU7+SLGeTaVlLHTJacKZM06jfUl9+rTtz?=
 =?us-ascii?Q?gXX5PjBdq8erXUgp0v7r6RpdSDCuhiGYvyRukzergqGmx3HjwDGg3yuzlsbn?=
 =?us-ascii?Q?yQ5C7inRCav/UHa0J4An/dI55mexFHjvNw2DmY66sumeqQFOLopGV+9k88uu?=
 =?us-ascii?Q?fHqFFgWTFKqChFMWGg8WZuPj4MGT9kpNMJ2GOHC9waVjSaw3qysS9yhCdCZY?=
 =?us-ascii?Q?ACsToSLaEZp4ktfpHTFgah8EFmc+EKEG+Cln1HsxkfKiXlaS4mBTo5K+z62U?=
 =?us-ascii?Q?MKyMnImCG9xUCnQ+EageRIgbsSk2BjEF5vStkDBvZ5dQFCjopHRGLjdvR/CH?=
 =?us-ascii?Q?iwULvV+3Hr29Mfcw6FqruEFS+7R9p51a2DoeDYSY9eEahxpcaOcnOLArZ5yQ?=
 =?us-ascii?Q?ac7zI6q7y6T49qqbqB5IkRDjJpAUit/OrFM9406MrDhAQxwKWzSFtXF29r2+?=
 =?us-ascii?Q?HHHISDWkGEBArX9+qST8i1aTtS4Cmn+c9LJXPhTxRHkvaFDSJN2t2pwT+KpK?=
 =?us-ascii?Q?jlX2rylkZttcpjvnnI5vN9djWGZbQOcot8OWCT6UsKyRPDTGIA2Ro0V1L/JV?=
 =?us-ascii?Q?qGfvorepuSerPIn+SyM6c/QVMDHFccKwoz6C4JPXzSXRkqBBA5l4CalnUX4W?=
 =?us-ascii?Q?h5ITFkPlkL0N81/fsBUJOkppONcpRU5taIsWCAddkwhDLM7OXO1bYdhNRnY3?=
 =?us-ascii?Q?530eiw/Xli50VT84r+QkbJv6sqwu29o3qHoLdsS5AwkVgmFk+86AqL71azAz?=
 =?us-ascii?Q?htFMX1zbA87wQFDf4s86wTHsTStAetOmkXqjsXk6u1wCVieMEHoaPt7Xcy55?=
 =?us-ascii?Q?e3/0FIIl8RL+SMOO9NF26c8mV+sZgxyd2sQZpyhzY0GQxr6ghuXTYUKCfb4M?=
 =?us-ascii?Q?noraAQY6iJwm2K0yHRqCJgooa2xGdsM27TFQtPhIhqSUBDfcOfXv6E1XRf/L?=
 =?us-ascii?Q?0nZnl+pHTp2FK4yIjrtWe6CZR8wV8Z1aPMnoU3EcQR4NaKkaIEvBSv3LeJ/r?=
 =?us-ascii?Q?U/HYFSpeA4zxMn9vBbrTWuedKAlLx1MCNHQY1l6I4KPFteNoBF40y5EZ/xUO?=
 =?us-ascii?Q?kDUTAyDBiWv6ITQDEWhF4k+fPM6V52ZYDyWJF/47n9PJFUofxeZIFNHFrKTG?=
 =?us-ascii?Q?W+PiDtToOv+QhAotRmZhA6mFkTpF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CaSBwqtzLonywbCn3zTWyqZkQBh5hFv5AHb9pPRWFYzIeSO3JJw+2tbpS2Rm?=
 =?us-ascii?Q?DfOL/oQE1c7dq0TOkc1QWI+PPgF2XXCfi7neLNnCqz8jZSo0XQTya7be8zze?=
 =?us-ascii?Q?Arkis+0u7NFg1YHUgW9R19zpUfTXKI1PC4ZGwFmWGrqKA3Y8SbBY15LZG68k?=
 =?us-ascii?Q?rZ2NcT8bjQM3YHk8Ug4vPpL+4l4gdxhJdjggbO/VKb2/piQjIcPjCtKa96gp?=
 =?us-ascii?Q?H8yzaBR1vGDW9o4IIb7ThI5n7XkkIY2wpVdKjpfSOf7095OGKRqbS4F3N/bn?=
 =?us-ascii?Q?NeWvUuB6Uq4F/XtCzlg33jdvCgq3JqiD/ONwrOb3NzscAk5GeKh+ZLV9Q6ms?=
 =?us-ascii?Q?QVeU8ziIdHq1DFKaAaxM8W9VPYcyVWa2Fq0B9yv2/W5eDb880Xr2IqAtw7qS?=
 =?us-ascii?Q?ueBN5jTMR6hTc9v21IKB5Jb6XArbeslTIIreXfn5XV3gyOkLA6YYwH9p1ppb?=
 =?us-ascii?Q?7vMVVpH3vY2y7+N5LFAauitnauzcAYbVmJ9o41lBSI66YdcPMMmCMSEeVvVz?=
 =?us-ascii?Q?9M+6cUUaODAB0ZO4MOSY8qp5zYlOdhXsdFad/+EU6+KOfeKZ6F/8VcUOsCwq?=
 =?us-ascii?Q?9vhdai1KZcbi4NVStzk5Pt7Y+AFwVqiCXd5FioY94lS83kZwjTJtlniYm3x9?=
 =?us-ascii?Q?Kaz6W7jK0N8AknyVvIFOVC/8YGr6nx/lPrJ+ljrQxzx5jHa834kqQdlpaqTV?=
 =?us-ascii?Q?T8VOm3JIC3ooh0JbKn3S3LVvifU+qMJeL4RLe5WMgRiKyvLv05Bs7hk1CGMv?=
 =?us-ascii?Q?k/QWoQyWo4n/cbUreyYBW7rtH+ee2AWetBTyYxMi5S4E6P7TXneWHEbMkDsV?=
 =?us-ascii?Q?Gq3sPVpp1Cwi33dQENKgOAH6Oj0OJqFifnKyEvpE2ninGX+d7abnfnykgoGM?=
 =?us-ascii?Q?A6qET2kWmbh9fMOy/NhD048QLjVFGsQzdhLigRMTVlP5bIHElBaMpwbyepV1?=
 =?us-ascii?Q?M6srHQL4TR+tWwu71GO6wEiaC9SsiiM3C3MJxvqE1ZM+3QNHVxLzsi6hhpRy?=
 =?us-ascii?Q?GNvls+o24cfJz+it08B4sx4Uy0nXNCo0A+WJ6YrrTmH1aK4MPyLeM870rKhA?=
 =?us-ascii?Q?UIDpZ+OXFpe0GPXykbayWt28d0vbBDm3ANIfMAmxCMOivGSvaME8VAPQZzQ0?=
 =?us-ascii?Q?x7UiF3oJlD9XIITFu9muZjPutfLPRESvU7U0ck/4h56e7AwvsoPw5C1I0M92?=
 =?us-ascii?Q?r4FzF9kn1/NYI9K4rd/OQn/03zHlOlWqBFanM9jDuEDUfBqC8m1Cqb8EVf1h?=
 =?us-ascii?Q?YgMCJ8P4HDRTvrCGlG5A5OLldyO/QPc2L7KjgBP8DF9cMXUbP8JZoKKDsV7v?=
 =?us-ascii?Q?El8UI+gWjeuVq36vFi07PybMszZGzceHGaBjvBUu4cgShESdqtkD8AYLRcsG?=
 =?us-ascii?Q?gk2Hndd88jxYLt/gIW0YKm3TLHgZcHWzg5embTFjcDjUoVh9UNmwqZklvb9Z?=
 =?us-ascii?Q?e3u2mr4WZMWPrvooaVIYzjH8YqoiphC0xRfzNt9egX6wryB1F2YtR4gPpB3D?=
 =?us-ascii?Q?M7QsDMbn++XfuE85BpdyVMorYRERl0MULSXXuvwoPEdZnO6EVfDfWMiNNSiH?=
 =?us-ascii?Q?3jgBFySloOyT4/1sWKyYbWyhIlFNLwsx+ZUs+mPq76td9G+aQ3M/dKA70Fa1?=
 =?us-ascii?Q?mQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a66453-f870-4bbe-f97d-08dcf838d0ed
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:43:28.8973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLcAJ0tdR05NNLeH/O4Y773M9sCBHH5F4Dp7+PKMxN+Q3pppVgEr9nTTXOI+i9TRJ3ffbnBwKJsQU/x+T3b4ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9871
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This is a follow-up of the discussion at:
https://lore.kernel.org/oe-kbuild-all/20241028-sticky-refined-lionfish-b06c0c@leitao/
where I said I would take care of the sparse warnings uncovered by
Breno's COMPILE_TEST change for the dpaa_eth driver.

There was one warning that I decided to treat as an actual bug:
https://lore.kernel.org/netdev/20241029163105.44135-1-vladimir.oltean@nxp.com/
and what remains here are those warnings which I consider harmless.

I would like Christophe to ack the entire series to be taken through
netdev. I find it weird that the qbman driver, whose major API consumer
is netdev, is maintained by a different group. In this case, the buggy
qm_sg_entry_get_off() function is defined in qbman but exclusively
called in netdev.

Vladimir Oltean (3):
  soc: fsl_qbman: use be16_to_cpu() in qm_sg_entry_get_off()
  net: dpaa_eth: add assertions about SGT entry offsets in
    sg_fd_to_skb()
  net: dpaa_eth: extract hash using __be32 pointer in rx_default_dqrr()

 .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 26 ++++++++++++-------
 include/soc/fsl/qman.h                        |  2 +-
 2 files changed, 17 insertions(+), 11 deletions(-)

-- 
2.34.1


