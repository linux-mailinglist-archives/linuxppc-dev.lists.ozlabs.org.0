Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5636C5E9946
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:10:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbXRJ27SWz3f6j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:10:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AjoY3aFX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.92.66; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AjoY3aFX;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbXKY4LByz3dq1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:05:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N79IaMp/5YqfeJHTlwvj5hqhXNw5jbWt49zEiYAVo6e2BYO6p+c7OgjPvuVY2TAutJpinniAyJUQA54pUEJgtWV+d9Q9UophHEoyMwPw63FyFnzskubLBuYZ4IqyL72dIxDzOEjiBFFyk/iMa12HWZiDtPdhL+Rlt3TUm5TczBAlo4tya7zZ10GlFPc9rffuF3o96pzH+4SCV72LbaNwEi0aznX6LtpM5H5sQj+SFQFhVEJwwru9B7ErXSSsB0nzruJ6dWlr+WRnxOJ6aiUZaoufIzLFAQ01h0TdZTJHMd2NmAqCouwLmXhK5GqLmcjK3RBuy/71ynV7BbRHVoUerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHYA/CXw0YUE97JGCWBIjFBFZ/6GK4DksH8Yc5dW8q8=;
 b=DI8YH9PX5RkJHVGFmb9QzmuHsjDu5oPNI+BlgFdX4AAnUT/XQFtkbKT95ggqDQEuW51EHcor5neM3qZ+P6wu8WqaX0sc8XBNuRL2L3cIN4VUyk6JDodSgcMf5EJWgqJFcFnY4P4yVfTZwaXxy51VcCUus8zbb1dis4L9WZv/5cFx7kCwFsnB5x64V92EDoDgf1+DsXEyGcBWjNHtryBqdBe9J6hxFHlY66gwoHCElLs5jDL43PBXpdgyEO45ooXnmjtcYoh3gYWRhsyTPA9IeYf5jIjAXmYgdnkYx6dAblMTDO4s50qd/9SXcRbUbZXqEEhMDILotyrbvE13o5fDNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHYA/CXw0YUE97JGCWBIjFBFZ/6GK4DksH8Yc5dW8q8=;
 b=AjoY3aFXE+4uvtGIVtcFsBPuKoI1JoqsENPrnQ4puUoxkVAjhxavRJmKRQynZy6dKrhWRf6s3H/ajKXp/rZ2ILXmDqhBDxUkLCuvmkl56gZr/U7SSJG/FuKthkPc6PGB5Bri+JOTeocqD6EdfhpQHdZgABtiGIdMRifxKDf+AxlGo33bYQbr3YExvp4HO1OhXL1mMdeuzPYwqChsuBguNWgAg9AvstnRjlmswoJrnunHPgN6d5d6X0fcKy0i27LnK5ut/UzSiF00d+NLHXgjuGI5VAkUkPhrxlO3gIrrnm7ZNWJ9AtViHO8xjbjTtDkTM510L9La3snYpb5B/85H5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MN0PR12MB6030.namprd12.prod.outlook.com (2603:10b6:208:3ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 26 Sep
 2022 06:04:50 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966%6]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 06:04:50 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 7/7] hmm-tests: Add test for migrate_device_range()
Date: Mon, 26 Sep 2022 16:03:11 +1000
Message-Id: <749b224f6a35bcaa733733ab35dd8593bd555546.1664171943.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0110.ausprd01.prod.outlook.com
 (2603:10c6:10:1::26) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|MN0PR12MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b018b42-c47e-42dd-4a9a-08da9f850561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Yg+OKHnIhqV4Vs26gpIVLEc7G8GDWx8wUpxOZK+DMmnN8B5GEQYGQr2gg4qtF2jbQEN7AB5Yhq8gbF0BEJDUGjqVDChQx9CapCgXmGNvkVEhG9vxwBDwFvwOKPTXHrx1b2nYoEMewEkrFsLXQ1kZ3jcfVb4LuXzB72ZlB2yIkXAfOqZqSq711zWzAStYzzMqVR3LiAOpHdcCmE7RB+/dgfNeWkq/pcvJjsy4Wn8pYI6tLJaAM1/ZSjeZoPWMyy0+3GgcFiXuYDKyD0EcsSDR0UZfJomglcn1YKG3TtXh6tiXQ4Y+Qs06fbA96oxLBFBSMERPOczd2ulKHUqKxby10Zl74mXYcfjef7fRY6ztp9Lf6bW80XNwnMeZP2HpeVxW0pddIxgS0CS0isdtDOaOJqyu+fW02i86JCZmbWL+kUTIYJdmBaopf7b8r1ZEiXKEKMnt7PHD4CtCijfUORnSpoT2IUbLS9nwjt7x/OS3WVTE2ju0cOtlmon+ieN+HKmV34JRIyZhlRDmq7teIX7/m53MCiJtl/5W5Hp+yMrDN14LqD12/7oIb0IwpP9N8kjohsjhU0wFxc6SvaziIHT8+sY6Bk3+PMijhLCHFSkAH2urAJWHdCqFlchNyAIOOQ/XyYv9XPG6KUZwHUfzKFZFeCIoOs2Ve7pcUCFGkkYOMlES1MhNaymrvOyNXI5sVvoVD48hydbbn5uBm92TOlePaA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199015)(316002)(54906003)(6916009)(6486002)(66946007)(66556008)(36756003)(8676002)(66476007)(5660300002)(4326008)(38100700002)(6666004)(8936002)(26005)(6506007)(7416002)(478600001)(107886003)(6512007)(2906002)(41300700001)(86362001)(2616005)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?vbGmegRP5P3JT1hk3ZJiMdlRnludFVCC1R5YhEO7Argk0zoYaU3J8SKuR75F?=
 =?us-ascii?Q?NzbBIZEYX/749TbKx9YmBdC7Ll3hUsjOST/7b5KppNIpD/se04JD5VNCa7tH?=
 =?us-ascii?Q?9gQpmy5X9aVgKrfG0prSCS6khNtNSVUx4FiEVwywKbyZrAyG96LQ9lHdLsMg?=
 =?us-ascii?Q?gVMUwjvj+aqz9lgALfeCXlj1L7ofABRp3UfHXHH/hIN0iKdudVwcr93pFHad?=
 =?us-ascii?Q?twmuV93hxsk8Zl9QzSIykD7zO8plcGcaMK4VM9qzDlAhz49J9DcQBtGX6uSa?=
 =?us-ascii?Q?EfaJZj5kXxRLCNQ+HpNCcIU3wrg+quiZfDyf4iyRXmJq8xaTnZYYGdxeKczC?=
 =?us-ascii?Q?u93v2ubieBchTPp+7DYnNUX8OGI/SEk3jNVRZh2izYdIQJcW2t9yNHhKo5YB?=
 =?us-ascii?Q?gGCLMTnDlKsFnzbYbUmGPPqBK+E93XPBTlT9bE0hoCX6RYTtaCTIb5o+Dn7X?=
 =?us-ascii?Q?0KNbHxeJB1a/xkXTtlEg0lqmPvk8J2novGcOJZ0pQ0o4AG8ZcDyczRL/CYWG?=
 =?us-ascii?Q?NNn37PbnkdND+MLZRjIiWF6BUzt/OeTqhP7Hvj8ftGaWoBGj2iH6kn3pcdfL?=
 =?us-ascii?Q?2T+nI1lhM+myywn7paWTiVYd4QZMn3EkexND1dF1TJRUnEwDhXgcq+aRyYZY?=
 =?us-ascii?Q?Jp6JKfUtCRCmxGfckulieFN0PCr8seZV6/sK8fiN8LLKlTXPkCYKh9UmEE2t?=
 =?us-ascii?Q?GFJzVzs1yzyVaDIYzf76HZEw9uZVB7grSO2pn3RNCsv4Bv1jxqEdT0gIn4zO?=
 =?us-ascii?Q?OZdoSzXkzflbFj1ohyTEQF3dDSZT8Nr59q5B+SaP4+D4M1MtT7QLBwpr/gm0?=
 =?us-ascii?Q?QJ3ylCIIhIW1QjDMIMOUXRKjl8OPD+cLBhxp8Nev2PbbATCb2EtaOb5Ee5XI?=
 =?us-ascii?Q?84PNATt5f/phk5XY2uUlBxDDE/M2HU8rcRqABDLb8aySFItOzmNiciA6u8Mj?=
 =?us-ascii?Q?3OFWVflG4uuhaRJe9t8dCObJatJ/4GaJxVx1AvVA+BAfZbacU8k0+5m0TE3d?=
 =?us-ascii?Q?j9oHctEBojVnZlLXQeGQGyWKSI25LM475OMDp3tiaV0irk78D5tnHVXgjS3I?=
 =?us-ascii?Q?SbisInMxZvCzVSBqSGxP/9OabTWIEuCnN95ASgX2GC6eW/Zx/AtZhl/LKBUz?=
 =?us-ascii?Q?zeOK9qxrpJT0u7s7VC6JefC7K9EKo/Y+Z/MGfwJPJl9vey25AfhgvNi5fVj0?=
 =?us-ascii?Q?0/ZNHIcCF4kj4DXIjKI/7jVR45k3abwKrxYdnuBHt4KFw1SH5wg6tZUpdBZu?=
 =?us-ascii?Q?A7YvEF61tffr3nokQRlvUQsJdYVnArlzme09A1QcleXgYwBka8Fu+DqLV/CB?=
 =?us-ascii?Q?3F5OtT8fmutsu9lLD+ct0psu1rxV5mswjC/TRDEDGZKM2NDvG9E5eP9sMpRx?=
 =?us-ascii?Q?78lryZRXSUwjf0oaBkmYNY7kFGvjWZ+3vO5wvi9YprduFYAePdpNI7W33qpJ?=
 =?us-ascii?Q?BS/2bCeP5+sEcL2Xqrv+hhj+3J+BjJvx435le0X/T6z+KuwkE3t/59hxjTRd?=
 =?us-ascii?Q?Ud0vMrlyCkPDgU9jLXGCODuEO96RLR8cKDvxLxKawXHJNYrJ7t2T6o5dBQky?=
 =?us-ascii?Q?BeiciPIM+nKZaHoVLmBitBkgm7NjYdOOX93YRsgU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b018b42-c47e-42dd-4a9a-08da9f850561
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:04:49.9356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brq4MZNIz0qDiJ17ixz/hBuAgVCpTsSkUaXlvdqj2tAezYDOyw+2D26L43shRScH8NW43kibiOb8bsPSuTHTMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 lib/test_hmm.c                         | 119 +++++++++++++++++++++-----
 lib/test_hmm_uapi.h                    |   1 +-
 tools/testing/selftests/vm/hmm-tests.c |  49 +++++++++++-
 3 files changed, 148 insertions(+), 21 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 2bd3a67..d2821dd 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -100,6 +100,7 @@ struct dmirror {
 struct dmirror_chunk {
 	struct dev_pagemap	pagemap;
 	struct dmirror_device	*mdevice;
+	bool remove;
 };
 
 /*
@@ -192,11 +193,15 @@ static int dmirror_fops_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+static struct dmirror_chunk *dmirror_page_to_chunk(struct page *page)
+{
+	return container_of(page->pgmap, struct dmirror_chunk, pagemap);
+}
+
 static struct dmirror_device *dmirror_page_to_device(struct page *page)
 
 {
-	return container_of(page->pgmap, struct dmirror_chunk,
-			    pagemap)->mdevice;
+	return dmirror_page_to_chunk(page)->mdevice;
 }
 
 static int dmirror_do_fault(struct dmirror *dmirror, struct hmm_range *range)
@@ -1219,6 +1224,84 @@ static int dmirror_snapshot(struct dmirror *dmirror,
 	return ret;
 }
 
+static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
+{
+	unsigned long start_pfn = chunk->pagemap.range.start >> PAGE_SHIFT;
+	unsigned long end_pfn = chunk->pagemap.range.end >> PAGE_SHIFT;
+	unsigned long npages = end_pfn - start_pfn + 1;
+	unsigned long i;
+	unsigned long *src_pfns;
+	unsigned long *dst_pfns;
+
+	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
+	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
+
+	migrate_device_range(src_pfns, start_pfn, npages);
+	for (i = 0; i < npages; i++) {
+		struct page *dpage, *spage;
+
+		spage = migrate_pfn_to_page(src_pfns[i]);
+		if (!spage || !(src_pfns[i] & MIGRATE_PFN_MIGRATE))
+			continue;
+
+		if (WARN_ON(!is_device_private_page(spage) &&
+			    !is_device_coherent_page(spage)))
+			continue;
+		spage = BACKING_PAGE(spage);
+		dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+		lock_page(dpage);
+		copy_highpage(dpage, spage);
+		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
+		if (src_pfns[i] & MIGRATE_PFN_WRITE)
+			dst_pfns[i] |= MIGRATE_PFN_WRITE;
+	}
+	migrate_device_pages(src_pfns, dst_pfns, npages);
+	migrate_device_finalize(src_pfns, dst_pfns, npages);
+	kfree(src_pfns);
+	kfree(dst_pfns);
+}
+
+/* Removes free pages from the free list so they can't be re-allocated */
+static void dmirror_remove_free_pages(struct dmirror_chunk *devmem)
+{
+	struct dmirror_device *mdevice = devmem->mdevice;
+	struct page *page;
+
+	for (page = mdevice->free_pages; page; page = page->zone_device_data)
+		if (dmirror_page_to_chunk(page) == devmem)
+			mdevice->free_pages = page->zone_device_data;
+}
+
+static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
+{
+	unsigned int i;
+
+	mutex_lock(&mdevice->devmem_lock);
+	if (mdevice->devmem_chunks) {
+		for (i = 0; i < mdevice->devmem_count; i++) {
+			struct dmirror_chunk *devmem =
+				mdevice->devmem_chunks[i];
+
+			spin_lock(&mdevice->lock);
+			devmem->remove = true;
+			dmirror_remove_free_pages(devmem);
+			spin_unlock(&mdevice->lock);
+
+			dmirror_device_evict_chunk(devmem);
+			memunmap_pages(&devmem->pagemap);
+			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
+				release_mem_region(devmem->pagemap.range.start,
+						   range_len(&devmem->pagemap.range));
+			kfree(devmem);
+		}
+		mdevice->devmem_count = 0;
+		mdevice->devmem_capacity = 0;
+		mdevice->free_pages = NULL;
+		kfree(mdevice->devmem_chunks);
+	}
+	mutex_unlock(&mdevice->devmem_lock);
+}
+
 static long dmirror_fops_unlocked_ioctl(struct file *filp,
 					unsigned int command,
 					unsigned long arg)
@@ -1273,6 +1356,11 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		ret = dmirror_snapshot(dmirror, &cmd);
 		break;
 
+	case HMM_DMIRROR_RELEASE:
+		dmirror_device_remove_chunks(dmirror->mdevice);
+		ret = 0;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -1327,9 +1415,13 @@ static void dmirror_devmem_free(struct page *page)
 
 	mdevice = dmirror_page_to_device(page);
 	spin_lock(&mdevice->lock);
-	mdevice->cfree++;
-	page->zone_device_data = mdevice->free_pages;
-	mdevice->free_pages = page;
+
+	/* Return page to our allocator if not freeing the chunk */
+	if (!dmirror_page_to_chunk(page)->remove) {
+		mdevice->cfree++;
+		page->zone_device_data = mdevice->free_pages;
+		mdevice->free_pages = page;
+	}
 	spin_unlock(&mdevice->lock);
 }
 
@@ -1402,22 +1494,7 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
 
 static void dmirror_device_remove(struct dmirror_device *mdevice)
 {
-	unsigned int i;
-
-	if (mdevice->devmem_chunks) {
-		for (i = 0; i < mdevice->devmem_count; i++) {
-			struct dmirror_chunk *devmem =
-				mdevice->devmem_chunks[i];
-
-			memunmap_pages(&devmem->pagemap);
-			if (devmem->pagemap.type == MEMORY_DEVICE_PRIVATE)
-				release_mem_region(devmem->pagemap.range.start,
-						   range_len(&devmem->pagemap.range));
-			kfree(devmem);
-		}
-		kfree(mdevice->devmem_chunks);
-	}
-
+	dmirror_device_remove_chunks(mdevice);
 	cdev_del(&mdevice->cdevice);
 }
 
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index e31d58c..8c818a2 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -36,6 +36,7 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x04, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_RELEASE		_IOWR('H', 0x07, struct hmm_dmirror_cmd)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index f2c2c97..28232ad 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1054,6 +1054,55 @@ TEST_F(hmm, migrate_fault)
 	hmm_buffer_free(buffer);
 }
 
+TEST_F(hmm, migrate_release)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Release device memory. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_RELEASE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / (2 * sizeof(*ptr)); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
 /*
  * Migrate anonymous shared memory to device private memory.
  */
-- 
git-series 0.9.1
