Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D10F919C97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 03:01:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xc0yL4Ay;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8gJ94Gzdz79Nb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 11:01:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xc0yL4Ay;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::601; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8g8v3S3tz3fqv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 10:55:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9znHzrIrVcZRX9Cy9qS60vejZHSWrIoe4ODUYLP4CNi8DlQPX7dQy4IZ94ylR9OC0zsKdzP0sXwGvXydwNGklpKPbQp6ek/2Q5stuG47QMUs45AuGEQMksnasA2bh1bgGbQS340DeZgoKHdalcLEEjjQE3quByYd2t0QbmUG3aFHNaa7lb3CjXPUYaQIGsmkO+g3OBmtqLN5EVaIPGG0CWZaKL/MN++MSX6JHleYfcczanmj5SnKNMTJDpc36rSzhPXGbL90oYrWaT2b0zfQG2mKixygpP0pSGrb971JuvFqZSMdRXKWlhXGsGTDLRUevCsEVovz97h3GC15iIaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUvlDbp9yw/HTfRk86JXWsNbDjDqapH1fDB3mHrXfeQ=;
 b=Zo91HM0/5BB6543bif4HcxKoba5EzeVEoV19KfL4NTmZLixZDBfUQNgviQVgeGshDQA9IH91K9kakgywxs8jFBUd3J101AcJbAdU4oBoKMQohQ92oMdKAALXadlsdac/voyALJMxYIiFUVZm9HWw7r+QRQ2BEoQkLqB4OMDfcNbx/yCZTws2QN7/EbN7hKLJDUyP/Uq3cfyDRI1IVyOJMpCuUG27NaALaDi2/y5Vg/Rua0F3M2hXaEK9rtiM34+s2z9VtDu0LUxfUj8/7byai3XzoDkO69DBe5mxhT9U78uH5WydIYk/EYkzLt38tx77oyRaPWFP5Rh2DRC+Q58LHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUvlDbp9yw/HTfRk86JXWsNbDjDqapH1fDB3mHrXfeQ=;
 b=Xc0yL4AyGDgFKhpbhti2NS/0zExt1GwEIV+GMSa3CJlry4SNgGmdhKkko6VlI2HdIdF+BNN121sWExq0CzwRuTEZU3Xog2bsMCgCK+K53U5Tn2K9wtjscr8jZOBSGRzAzd89S+AGNpJOB6VtiHQuZ2hBsGGeXvOT2DNQilRY2SCukdjkPRth07w1GtIVYWJAjTbBHN2/HCpz7YHqXHfsQVNp/wBi2IK+Iqz34vdHYKH/UZXUQJrWuhJi1EM3VekiDtSWQpJ/rWbKV3XfFo7+slMU84tVI5XiztOH41JtnUJr2vsZgidyoYO63Lfqhyq9BMSRDCdrrazpitCLK13GUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW6PR12MB7071.namprd12.prod.outlook.com (2603:10b6:303:238::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Thu, 27 Jun 2024 00:55:20 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%6]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 00:55:20 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dan.j.williams@intel.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca
Subject: [PATCH 09/13] gup: Don't allow FOLL_LONGTERM pinning of FS DAX pages
Date: Thu, 27 Jun 2024 10:54:24 +1000
Message-ID: <74a9fc9e018e54d7afbeae166479e2358e0a1225.1719386613.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com>
References: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0158.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::6) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW6PR12MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d6fed7-4bc1-4e3d-6bfc-08dc9643d161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?OXJU+osojJGU+ellVt/DPgE3JDrng528/Qe5D+hlUxvdZs3Uz6HATFIa35wv?=
 =?us-ascii?Q?7NeGVUYNJdlXzl1XL5wrZyEH1NQfvX0sspeai3m7Vyfc0Imk/1ECJR2bSrpo?=
 =?us-ascii?Q?p8Qy0NNBw5D1n7bgYKbYo7difYodGMGqygPnTsAWBDkFMMGyZzOk5hJk3KjU?=
 =?us-ascii?Q?/q5eNkOrp6BhUnDAhzUsTbd6ZOJQ1VqSOROsIxXp319f+b9fwUQL2GntVWM3?=
 =?us-ascii?Q?T/6IASsvsbuuJ7rF3QZA/Vxxm2B8nIKMvaPIoekUFP/btSP//yKYlIQUnYIU?=
 =?us-ascii?Q?KNOy7QDmLKMuNCMYdr6FKw0bAmb45cmmnHmWYzEJig3XZBwIV+peSHqpOy0H?=
 =?us-ascii?Q?ZK4gE6DVn8ZhxPsaBN/4YGcaVMbLv2gmX5LU/Q9fom5NA9xT0l0u3Tt+vle6?=
 =?us-ascii?Q?6keL7tg+o1Sx18uH22yl/P6PqWQFfT/pgdVEzcz9USEJuZtOQh6qiVte+0JP?=
 =?us-ascii?Q?f29nXRAWZvo6sP8nXhXyV23VH4YRMW97CarVpVigHe9IjWVDd3X3dY5o7NEF?=
 =?us-ascii?Q?Rs3NFzcRU7f7WGmDRrFRXzqxDNfgchwEXb532GAKk2OFY07EhthwHZSWDKkQ?=
 =?us-ascii?Q?wVjpQS9lD2reAhnDQVkAhfNYmrtofqUj3sqhxWGz9r8CpbOHfYcL3c6qiK8e?=
 =?us-ascii?Q?eJl0cZSeCrZkkL0yGATYoazX7LpxNXdCMFTzPsrdYhMaUMmMG9NFh/BQRONh?=
 =?us-ascii?Q?KY5Or2OhqiOr09vJT2DwdOjLnR9CU5Re8KpMmuEHT+qaDOC26ovLKcKeIwz0?=
 =?us-ascii?Q?eTMa9D1GriMNKzTxhPc/n47Wf6rbEAjQuV3JFebmNYBq6eR8JEbFEU3iyEBx?=
 =?us-ascii?Q?iLKKZxslZ3aItdI5g4uGsc6nujDHo9Mzhvzs8FBhsKXu69LeGb3fG9s9Y5vS?=
 =?us-ascii?Q?BpHmNICZn+qLJ4zGL8v2U6KQdBcJEicY0dwHw7nHJpkEJtf/ygPsAMl/CJIy?=
 =?us-ascii?Q?3CIyTa7YJYWfEVGT1d/X6aCUdqmma6Lg84D3hSArohyEh6vKf3PbU2Xsc+kU?=
 =?us-ascii?Q?IU2aN/3V58bYWUJTYeTbaEOWnsXQX5u7yNDa/7CIgnHEk4CGrWV04zJ8ypO2?=
 =?us-ascii?Q?C8k+LdPEG7ahZe3TDHqoApEDzC5WJIDQqcypBF8kX6WyoCpvWgfdCa+W0X+h?=
 =?us-ascii?Q?Fo5bQsbsQq2TxFeHIg8ouLx7yKYvemVismu1vQNNZYtF+4MpwGAq4qFZHGfJ?=
 =?us-ascii?Q?TgFFeMuIm5vgukRuYju4nj8h++TO/hg4ohtQ7Z1XmRwCDKxsYU/5LAdcB/4U?=
 =?us-ascii?Q?4StDYhEestsCr6PhsHISwJxFMnicNRcU/UShd2DmxvBOAW22VQYvRSnwL7rI?=
 =?us-ascii?Q?j6eNO6tKRmP7naElRzhHnrxbPbCO+ipmARLzMKhBzKYzCg=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?znM7iM42KAeugS+dw8+xGxPz6IqvPr4WVWxPoxstzqhTkr4emJTOkyfgjA5F?=
 =?us-ascii?Q?JD5by6NsRElM3gQGTCzz15H6XEw9f02ABPeM+wh78JDNBx9SIyjH28uN5iMX?=
 =?us-ascii?Q?T04ITMc9pvfPSBSpUihuolES0ohcAmVIzOok/AwjlZdmdPfTeSoFN9y8ib3g?=
 =?us-ascii?Q?ZF886fVeYlgsuTpwoOLYkB3QUxLBVWa31/QGojkgELhaRy7kbREiAwZPl7JO?=
 =?us-ascii?Q?Kl1M93B1sPRH3teR1xjafB8LA/N5dqHT0E1d+bfPM0HfmgcCgOTBJcmE2+zu?=
 =?us-ascii?Q?nv50CX8XL2yLp0/aLIVJQ5NUQRkm+x6KspgzlJ55p/Hrl9Yer1jP9lB0TqJl?=
 =?us-ascii?Q?NxEy5p0W0M+JmEnhqOJSAVthhRe+Fg2HSVmwCIvem4SBg3QBo3u7Fl0Yd4mU?=
 =?us-ascii?Q?zeOKh1v6gccfbpHN2wfABfLJ+gJKrViZAmWTK/xhMuOAbqX1oDa4aR/s4Yhh?=
 =?us-ascii?Q?BbC6T+ldaeZsKtQ0+zzmkRij60OzjmPY2fKpvgUpMG7E7S2TXPM8zTgrbdxR?=
 =?us-ascii?Q?wvLACtcyb/VgNJOdBWLUzp0Ci2jUbTvi9Qi09o4/8m/sCjfnB1q3sQTQQHBp?=
 =?us-ascii?Q?N6O9wymziwdQ/DbTUwSILya1nPsUsgYSf8Up+/rA1JsO89IGQNszgMPAcWlD?=
 =?us-ascii?Q?TVuoYwE3ung9bKv2LJvdAEV3VerqBI0O4yjUDsnxNTYRq8rCbPpxSbPX1YXk?=
 =?us-ascii?Q?+YSRODwHBZeV9kXxGcFdkYkWAd5wjw7Kyp1JrRypRDCI0NJeX5vx2B2/Xbtd?=
 =?us-ascii?Q?xNMNHgDCE5IHw6ookN46SL4e75Iutls/tO6iLjofv59OSePC5IDTXmD/WJFT?=
 =?us-ascii?Q?yUkUNUbb9F4DNgrlsbcpRUbFo+xuGUIMktThFEhpKt5G2yXrAgj1wBlFTsX6?=
 =?us-ascii?Q?Ejkv+zyXaVoFHaU6U5oK0BzvN5xRMiLiGiTIiH2y0zeskPvOwqCKhMPrZSPE?=
 =?us-ascii?Q?NxOG4uy+Es0EANYMd/g3J/bE1gT1tJ4sjEucIhgGEEYueOyZaCWpdvTFHHwK?=
 =?us-ascii?Q?hL/tFVnEYWPBFsYpB9iFbFI7W6BBkYA0rbSV5JMGNSwUipTkD0yyjPuI2cq8?=
 =?us-ascii?Q?z08GegoAtXVPYTcXSjZbDvnzI5J0+7X+TPAAM3tj04AplILf7fg4oi1ONwiD?=
 =?us-ascii?Q?vT0SMDOyrS1W6Okco8eQHaTf/o1x97pP1lFIOw0Qh0A43yOJm7ARO2LEZ9Tn?=
 =?us-ascii?Q?PujjG9e1KyFixc84yURVRLHmDpLZBaMEBt95b81osNrKkJd8D7ybj79pUlFi?=
 =?us-ascii?Q?SQw/J0K79b/t5n/dumPdXcOqLO/TDKZKuXUcMyybCdRFNgxc239YVFEvZq8B?=
 =?us-ascii?Q?6Vx3ar7+w291OnlXZlqHpenm11wSXsT2mrgmss3tDOK2QwxK9XHH55G86Hla?=
 =?us-ascii?Q?HbR/upKQbLtCyF46viFv4cyN9NyyA4M3RYH23zn8FUWawAlZ0gsLGXY0E+EM?=
 =?us-ascii?Q?kmYakzETiLlUwj9HgsZoujvTSivNCxDWsXowTv+ZmJxmq9aeOsdN10e1jzEK?=
 =?us-ascii?Q?J2fZ02yBobnHG4Y6O+oNUYZqrRPyVZeyK75liv35wgfV1GX5xmpt7y+yfp8U?=
 =?us-ascii?Q?aUEk5XB4MRZ9OZoeXFbmQ8GIkiMQi2moxQq7dujl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d6fed7-4bc1-4e3d-6bfc-08dc9643d161
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 00:55:20.1325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2/4jReSwqt0mSuc1qZ/a4fsV9Nvdo5ZPQoNkqNZV2sGlw+yvnCRKpwMlsvWFV3U2O/K+jjguK3rcCM/MT125Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7071
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
Cc: linmiaohe@huawei.com, nvdimm@lists.linux.dev, Alistair Popple <apopple@nvidia.com>, david@redhat.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, david@fromorbit.com, peterx@redhat.com, linux-mm@kvack.org, will@kernel.org, hch@lst.de, linux-doc@vger.kernel.org, willy@infradead.org, djwong@kernel.org, linux-ext4@vger.kernel.org, ira.weiny@intel.com, jhubbard@nvidia.com, npiggin@gmail.com, linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Longterm pinning of FS DAX pages should already be disallowed by
various pXX_devmap checks. However a future change will cause these
checks to be invalid for FS DAX pages so make
folio_is_longterm_pinnable() return false for FS DAX pages.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 include/linux/memremap.h | 11 +++++++++++
 include/linux/mm.h       |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 6505713..19a448e 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -193,6 +193,17 @@ static inline bool folio_is_device_coherent(const struct folio *folio)
 	return is_device_coherent_page(&folio->page);
 }
 
+static inline bool is_device_dax_page(const struct page *page)
+{
+	return is_zone_device_page(page) &&
+		page_dev_pagemap(page)->type == MEMORY_DEVICE_FS_DAX;
+}
+
+static inline bool folio_is_device_dax(const struct folio *folio)
+{
+	return is_device_dax_page(&folio->page);
+}
+
 #ifdef CONFIG_ZONE_DEVICE
 void zone_device_page_init(struct page *page);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index b84368b..4d1cdea 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2032,6 +2032,10 @@ static inline bool folio_is_longterm_pinnable(struct folio *folio)
 	if (folio_is_device_coherent(folio))
 		return false;
 
+	/* DAX must also always allow eviction. */
+	if (folio_is_device_dax(folio))
+		return false;
+
 	/* Otherwise, non-movable zone folios can be pinned. */
 	return !folio_is_zone_movable(folio);
 
-- 
git-series 0.9.1
