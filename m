Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8358919C45
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 02:56:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MKbrl7oA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8gBb1kzCz3g6w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 10:56:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MKbrl7oA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2405::600; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2405::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8g8K5RFMz3clY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 10:54:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ise+SBxARSC6WeEfZY+AMCfhueZMC14HH/5SWS6IEv82/YZhMu/2x9KC835gKUlFzL6lkKvtiTeeZ2ppsoUMBc4emMlKbU34RMFbkWQ6pZK/e61wLeZALeSJWEXgpUlPnLYZlx7fVaar16e0ahcXeimfW0g8iyql6iSJVuhBdRhXlb5ymFuMpfh6SeFapBd45+kCYxb6HVuoYoKJAtcCLNZfDekDO1A4m8MbrjstH/55/RVwLh+pa331j39uYq0sQtnncAYfHmlvMM4iDvGN7oRJky8dl9dMtdj6Z2bThExt/s3SS7R6HXeHsrdCr7WYIh2XDfPx1iS153SlESVn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPINMew12P57zfDMgYtT5iZzwuOu+WVIYwPZgbZaNX4=;
 b=KnMUDCktLAUYRcVcN4FK1gWkMU8+c/6BCGeDNaIXUSrHCT8zdrgTy3TTX3kQdPaLONyqyANlH47NV9GxkTOMhy309ENEbAID37lIhGbjb3irQ23QzO8hK9ibBZx902a5IBKVXa4A88iruLzq1jGLiQz7qTSqeLaoBDlrQ/T2UXI8JInxGmo4qLZrNmFhDzlBMFgEQ1FUj3Yz6yQOO0q0Z7LIQLPfseewNoRak1UOeg9K28iFcywqXqAhFlVKIIVMV+h3bYLshS5p5BNjlLu7CNi29C60fOgfxB1uwAUUAruy1Goe+DURaAtzJtac0lxIwrcqun2lGXgZfVkrvWzPwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPINMew12P57zfDMgYtT5iZzwuOu+WVIYwPZgbZaNX4=;
 b=MKbrl7oAuTukBefV/i0h5Lox/fZzcnZphErp6EzXGQU4P48O1JF5tNblAbRroMtoTf1jIBYwlCEy4XwG4AOD6XUDxsAHWNayrwoVMp4xqWWmtW9F6oKepxDwg6uaoynUumpU+WQJyOacwJsfjtqjQyv/MGLxYkjpNnafqbSwK31fUgKVxlwEfIWtCutpVAJT2m93jIipE6NghjyxZRJjMcOffb2PUuvf9RkrxrC4Is1jtHZB1gqKKdJ0G9SJ6W062ewo+ghzLdYAO48dqq8maoNdzsds1ZjdQ3rzgy3RC0fr4cL7mV7fae98WVENhJsvgHjj4Yadk32g/HH8nkmPdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW6PR12MB7071.namprd12.prod.outlook.com (2603:10b6:303:238::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Thu, 27 Jun 2024 00:54:45 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%6]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 00:54:45 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dan.j.williams@intel.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca
Subject: [PATCH 02/13] pci/p2pdma: Don't initialise page refcount to one
Date: Thu, 27 Jun 2024 10:54:17 +1000
Message-ID: <c66cc5c5142813049ffdf9af75302f5064048241.1719386613.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com>
References: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY8P282CA0027.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:29b::25) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW6PR12MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: a088fd23-3d58-498c-b9df-08dc9643bc69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?2rnjoSObMFwM/09/5eFhgMLvM9L+tP1OpHzVCRUD+b//b3o+zAKbBR6M8Cxs?=
 =?us-ascii?Q?i/1zpANC4vzOcld4Y1SwplXFQyZqGVqnnNzu1TQT94314P7IjxZATsYGrBUr?=
 =?us-ascii?Q?uBKy2pgcQXerLFwu+HmZz8jwgdCd3BL5n5p+k6z37SnB90gWWPY3yRof/eGD?=
 =?us-ascii?Q?PXKVS2+BypI0F3XCl1MVJfbLtAJYuGTvl/rAVXGWKhnLlXCUb/ZR2pmIY92r?=
 =?us-ascii?Q?SoMxDas3giww+mUF9rpPwDjAz9q9svCQ80CF3QwqpdZw96x2DDFlPPR2Nfth?=
 =?us-ascii?Q?YJdby34gv6Ss8pF2CTgOgF0ez3kyeabWD8ZosV5S2KunsFFa3OixLgo7YetB?=
 =?us-ascii?Q?GaNU013R1WcgNhgrGldS4boXubhGyC3MREZO2c30HeIt4q3ywLNRVZvc86sU?=
 =?us-ascii?Q?huhE93EFxDigkeCQ+OERFAb6iTVYnYQCFlS0zcXZN+0wE62ztEpgEb28C35J?=
 =?us-ascii?Q?PzRLch3l0NfJl4pf2FZa9kfnniXKzrzS/tY6TTVn6h+jJCPHnXkZrgVeqyKt?=
 =?us-ascii?Q?2P0INQFaU04iGypW7uqUUdCLuGwbXrzmd+sXem1GJ2lHKE1bTlnFknpquo+n?=
 =?us-ascii?Q?z9hIlqEF5APak7UxpCeyTRiXWLH1dOcKszUz6OjC0Owq0qT7Ns/8t2RvKTUJ?=
 =?us-ascii?Q?GoiSDBsij4QQR/NaMdyzotFKgj7kv4IA6pc3LL9PgI8Xu4BKAv8b/TJoV+rB?=
 =?us-ascii?Q?xuy1wKscpblqkUeBwR1Ox8R+nzQfkrxPRBC+jSAvoN5sDnZbt0GFkOqtZPrp?=
 =?us-ascii?Q?qZqZlO3+2j1SbdeRey6PvE1OBfUe/nOAJ8C4XB2UwBRuVJSRzvU7FrMzHN47?=
 =?us-ascii?Q?LfVfmLNEYSGnC5+//nX7bThXEKUBqRDMLEbRG6UDUshXMEzHuCy2N19WC1x2?=
 =?us-ascii?Q?/B+h9j77iK9Sh3hI/fp5TBNTpvj14SuZlS1UUq3y5VLuZp5Ndh9CcM+dxYOg?=
 =?us-ascii?Q?UkgeLyePWoIJZw9Bj0EKXa+Xlej5myHPvfS2mTXn5YUfXdZiVfAk5fmohYSa?=
 =?us-ascii?Q?rTBWAw4YWGGOx/IXc/BhmzbRodDLig1+WUJ0ceH7D/HT799bHhuszaU0HafB?=
 =?us-ascii?Q?kpdHUmRmhjdLImJ6FbxLMDrEgo8Evxg2E7VU3Ij6dP0zpN36amIjSrVanFpf?=
 =?us-ascii?Q?9/q9b6vNwFRCAKW7EnI4p6WCdtfLI3eR33kk/DjJMkOKdR8dmJi+TVAr/Pxn?=
 =?us-ascii?Q?FmxUkjnId2BHydgeswm5KlsAAMRibFiE/+azmyn7sUQ8fbb7JEkvSUP8Usj6?=
 =?us-ascii?Q?rHike0at9tF5/mzVe5LWnRfCpRNDTxtg2+SPJBayHbdv/Z+parbFb4tt4gKl?=
 =?us-ascii?Q?RSZKsiebLtnmYCsKEOmZ1YzNuyx6dbck4aFmLZSupNoWBA=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?dNGSkOh98qimkmddEaJLkyU01T88pufhRnad9b1L0rEZjeNZgJXMlUkh4pu0?=
 =?us-ascii?Q?ch8AuZa3p/r+dvy35NbnSws6NbpVwdl7FwXGiwpR4ZC+4NGdvyyCSlTcHPL2?=
 =?us-ascii?Q?fW+cuK0ZeRyqIOtdHLBloIqKe9XuW0289A7M+xEBCt3S0OjkqvG4D7aSdtmI?=
 =?us-ascii?Q?alekRZEfq+lSWmWRz0yAiqzQWMgfv49mOPVnMYAC1BM3oV4VrlxY9Y1GdVg7?=
 =?us-ascii?Q?2AkmcXdkMItTdsuKJ+wycVw+Hz5eFADAqzXh1ekvUEFuJKPp0YGvnadXlRmo?=
 =?us-ascii?Q?loWy8pNF0KWequOgsZ8X1D3xyADmIjaJBMNrRA2yMMiD0AE5MWLbl8Z3x8Ug?=
 =?us-ascii?Q?Mk0v+00gb0q5FyX4glLGrhN3Q2Z0ZoanFBT87COJ3kXi89161ntPR9+niLzR?=
 =?us-ascii?Q?0EFwZSLYVNCuPnQ9CYsNylEMHhJkYJz4SznBCYi4TZItUS4CQrcr+NssYaey?=
 =?us-ascii?Q?runipkU5OEGZrogXK1cBOzX01gpU8rTfhr4jKhDlq9CMRCbHTjj7dVj67Oaw?=
 =?us-ascii?Q?fgSefnpEqHOQBQEAxiadrnyZ4YBOo8OWL/IjUKv26Qo1cCfG9R7SPw8suV9Y?=
 =?us-ascii?Q?qGidAeVv1tz8URy1Hjn8cXbbXRzth9gnUuXmbcsB0IrhVshplwwl+Oe/Bbvq?=
 =?us-ascii?Q?+lK6WtTARUSBUuTgEbXK+98kvTn3BohIIa1PJremGGGi0Y9wxVoqqwRV2jbj?=
 =?us-ascii?Q?F7eUAIhs71n4H9fKRgLXRDdUcNhPdg7I3wDp5Zizvv3DmaxnLcCANzuKtdCS?=
 =?us-ascii?Q?IUMaKjEiyruZ7+G2CELx7cGGlUfVa+tN/EIg7uLTRzO9fsvJmaPK4yIc1iOG?=
 =?us-ascii?Q?n78xdhEYMjbzGvjiSH3A0o+Bx7/vWJbhtHox771Lqqr7KoaU6+FQOt4W8QXp?=
 =?us-ascii?Q?TIW0KqMXhm6KVShYoX4BIragyvORWAsmKyWe9OOxyP0S+ZECu54zDbP9TOhv?=
 =?us-ascii?Q?Om/Mosm63VOn5kxbajEdPb+uzYZXRR9keolLJuPafvWJ8ddn3IdM1+tQ0hJL?=
 =?us-ascii?Q?4YKZp7eHkT2DumqDIB4rsuQIo0+0sYAPzmSqObTXQyKv67bASkdLe++/wFMf?=
 =?us-ascii?Q?bK4wzwCs5e6Ql8+r3F0jfgOo8wr4gC44WVtNvHuKD4BFRaS7+vKqGcjJIidm?=
 =?us-ascii?Q?9to143/q53bCZAUP7A3Ihj52A9UNx/OhKNfs5k8VoYmQPd3htfDhRv34QO0T?=
 =?us-ascii?Q?kG7YcLdbh/T31SRuSjR7rz+cSbQRz2+Onpk5i12LQ5dcRGp8gKreipLyByuK?=
 =?us-ascii?Q?2GT9vONNUKCZj1q+CAtprWyhFbfnN//g9sxrTwemlj1mOBYxP+LuJzI14nCp?=
 =?us-ascii?Q?E/QjqYZtkHrhiEvp8fAtcA46VSQxlXCJzHgrtZ9E3L/fM2LA67hcdBHErPy/?=
 =?us-ascii?Q?6ccAXuZWMRJFjvBAPJHbOawWAHl4FJtofKE0kwmAGaNYit1ecXwHndyFj7av?=
 =?us-ascii?Q?sK3pvKbcIjlzb/BFJF13aD8L3O1eiJ+SLWFQodweT2l96gKBTdkb4kzODF0J?=
 =?us-ascii?Q?+V4XZm2cng1VSscvl56QTyKSeJxAzbuu7jN2uoW3Gz0k1BhAcAOsOL52AoCl?=
 =?us-ascii?Q?BqCRj4rjK4TtnMBjNJv+MQuxVC0pVqKBDJGwdDIE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a088fd23-3d58-498c-b9df-08dc9643bc69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 00:54:45.0710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQwjgjMduH9IypZxLKV8hTKTor7kJVJeIzIw5djaLarYMfmJzrqPzmexitrN5JA/pccHPBErrEpxegO3X/nq+w==
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

The reference counts for ZONE_DEVICE private pages should be
initialised by the driver when the page is actually allocated by the
driver allocator, not when they are first created. This is currently
the case for MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT pages
but not MEMORY_DEVICE_PCI_P2PDMA pages so fix that up.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/pci/p2pdma.c | 2 ++
 mm/memremap.c        | 8 ++++----
 mm/mm_init.c         | 4 +++-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 4f47a13..1e9ea32 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -128,6 +128,8 @@ static int p2pmem_alloc_mmap(struct file *filp, struct kobject *kobj,
 		goto out;
 	}
 
+	set_page_count(virt_to_page(kaddr), 1);
+
 	/*
 	 * vm_insert_page() can sleep, so a reference is taken to mapping
 	 * such that rcu_read_unlock() can be done before inserting the
diff --git a/mm/memremap.c b/mm/memremap.c
index 40d4547..caccbd8 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -488,15 +488,15 @@ void free_zone_device_folio(struct folio *folio)
 	folio->mapping = NULL;
 	folio->page.pgmap->ops->page_free(folio_page(folio, 0));
 
-	if (folio->page.pgmap->type != MEMORY_DEVICE_PRIVATE &&
-	    folio->page.pgmap->type != MEMORY_DEVICE_COHERENT)
+	if (folio->page.pgmap->type == MEMORY_DEVICE_PRIVATE ||
+	    folio->page.pgmap->type == MEMORY_DEVICE_COHERENT)
+		put_dev_pagemap(folio->page.pgmap);
+	else if (folio->page.pgmap->type != MEMORY_DEVICE_PCI_P2PDMA)
 		/*
 		 * Reset the refcount to 1 to prepare for handing out the page
 		 * again.
 		 */
 		folio_set_count(folio, 1);
-	else
-		put_dev_pagemap(folio->page.pgmap);
 }
 
 void zone_device_page_init(struct page *page)
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 3ec0493..b7e1599 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -6,6 +6,7 @@
  * Author Mel Gorman <mel@csn.ul.ie>
  *
  */
+#include "linux/memremap.h"
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/kobject.h>
@@ -1014,7 +1015,8 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 	 * which will set the page count to 1 when allocating the page.
 	 */
 	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
-	    pgmap->type == MEMORY_DEVICE_COHERENT)
+	    pgmap->type == MEMORY_DEVICE_COHERENT ||
+	    pgmap->type == MEMORY_DEVICE_PCI_P2PDMA)
 		set_page_count(page, 0);
 }
 
-- 
git-series 0.9.1
