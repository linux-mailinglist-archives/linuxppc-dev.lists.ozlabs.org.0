Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 859D15B6748
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 07:23:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRX1G3bm0z3c5q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 15:23:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LaCP8pzb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.94.58; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LaCP8pzb;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRX0W5vq4z2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 15:22:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kcm4yA7gSIvYQ8qnt6lvkCFArykea2H4ZJSbiIOaWYKvHhU3wHUOD5SxbGNO0PSiaOCrqdS4W5/t/qWeskmKy1exZM9/X6kN4R8gJnIg6W0QOOK0SiXFCX6nQesb1WL9dnCWTeXe9y+lbmKUowFYlIM0rcLxVk2T9rGKm2/fkoB6JqcRjAO3sGwMJlp6tuRbqlnvz6imd0q+IhtKnWILaEpFUmfQZPGGv/d1e4ncwZ7oG0tXvFyAMFxs6py7auHtEDNSw08rjObsu/bnGmJ1sbH0Np0F7/4ArtK21ireRmNYVZNK7twel2Y3F6GxneMYtzTl9N+AkvPZ1Se6odcGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfHTZW935LMOfX9i67yxYs7VLahsWGzQSqDdbapo/1A=;
 b=Wscdb7U3mSh7MxoEfUt8YuPDXuJcmgOtUwb10oJJf7vhgoeqprOHbbqs+8He52X4HNt34C5jXXRmN+DuImxYhJMfGb9KWeRqKvxgwipUVZ8UnDU9Z4LRRpuQqSVRC1wlNy+2/cHHEygObUHVSowqxkSpZSEVbq3q54LK1ht0sEA9mjYZNSiGnncHz39IjlICdo7A5NUNIxr2m+STNqwQorRAWU2jlj0cyv60rDCVlVqPupeAcHdpwRr8SnDaFnuOlv6bir5mTXiNgEgKFemjhfIj563UkKIa5OgfSrQiU+lblEcCfAyr2hehfvKb8CGNxdye+Mlr1/qzZu4h5ziNqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfHTZW935LMOfX9i67yxYs7VLahsWGzQSqDdbapo/1A=;
 b=LaCP8pzbZ3yXOYSrD1B2dQY5SskJ7smKf2huxqSj9uBd7gnpr2/1CL97Df2hD65qCIugCb+WINdwAex1msnN22ngwLtn9zZu3ErScKcioBx4j+Cz516hiHHaHBgKd5bETDarfq5qSK2KS0NrYgKnowJ8y4RBcOmYBAcBCJ43YjWgu9Te1WmNGL0l4g22R/JbQFhNfc0m/rQ/brJhtHxV8Mdx/onFMQh7RfZXKdZijCQbvSmTD07mO41/8kgGfE7VQasP1uSgJ0K9ySQch6NS5CegblRKQ1DrS3ezeXGe3D9CCXFivpoBONt4SGWErlCvSKtQ3vQZwhXIjeQZVLeI0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by SN7PR12MB6692.namprd12.prod.outlook.com (2603:10b6:806:270::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 05:22:12 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::243c:a9ba:2442:8974]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::243c:a9ba:2442:8974%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 05:22:12 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH] hmm-tests: Fix migrate_dirty_page test
Date: Tue, 13 Sep 2022 15:22:03 +1000
Message-Id: <20220913052203.177071-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0008.ausprd01.prod.outlook.com
 (2603:10c6:10:1fa::7) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|SN7PR12MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: cf177e44-39b7-46e1-21b4-08da9547e9af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Qm6vw14QwQq/sc8F9Ty1Z8WLCYyT2xCvEKvUVxBhPmtGMS5jz69FGZVYFVyX46Gdk7oCCNt89cO4qV0Uiq1B7kTGFU1coJ1YxhmNapo9noh3xvTJfYSOph/zRKuuWQMozVfxpAi1UtQALB4rdEjnhJeFKSCbzd/QbIPmppSRgfV7Am9rg1ez4XMiPkAkBIzfboEZKFc9DbucbYPoys1SdxaBJf6o6RcLZxAfrxklFTHYBGNYzPe/V9e0dw+Ik9TRvrqmyVHQ+FHSnakwjPLWXWpTF5tsfkQCuC355C/ruTngq9ceVQDEu0KAKuMqI/rL+0wSw1i5847s1YnAUn8LAgbSjFHBZlYKBg6IZ5uKA9kuhWcLJIZHOfOv2kyh5tvZFu+fpqRKVJOffFIqyFS1g7mYQAQAXSfOayWWkEAB87mwdf4eYfTxk4K4fvJLe+RkTVehNipcMiFg8CG7trlOb+DzMbeKfYgpYCMIYKM3cDKI91d/zNxPIvYYHLmW+CvYE0UEqLnarfu/7AnOIl7+hX2e+wegxTk6ea6CCaWA6rlS9iZnkgtZR/2UqwjmkpXbhXNgy6El4oOdD5BjI5PjxIcAqXLf0m6D8j7CouDe510CHNlTB6QGv1Vhq13q950QJ2VBp2cvNKqEMNv4B/01WgGMjYOXkXv9ZAu+lVNnIXKdv2xLMQbwXSw0ZjByXObxujpwB0OFTYfORTL/O4pBnYVN/9Eqy6Uzq4hLZE9A3On5ZmoHxia89p0X7aDrJ/YZ
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199015)(4326008)(38100700002)(2906002)(1076003)(107886003)(54906003)(186003)(2616005)(66476007)(478600001)(316002)(66556008)(8676002)(66946007)(6486002)(8936002)(6506007)(86362001)(5660300002)(7416002)(26005)(41300700001)(6666004)(6512007)(36756003)(83380400001)(14143004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?paSSUZU3juMov6ffL4dJQMhLAXonIW43taVdUGjTl4J5aPzXEXb3EYAaYnG5?=
 =?us-ascii?Q?QkDkzQR3KrfnSchB36CK83Ksx/gnLNF8J7RNzHlZaDe+tDTwkck9pTDr/0Ww?=
 =?us-ascii?Q?rfBBBL6SUGGNPmfLn4BvYuobovozXaigaHhjfx99B6jXCGap8BaIGKiSV/OJ?=
 =?us-ascii?Q?VWQDA0ZzhLyPXhiJ66Al45B0Kasa6ZnnEYL/q8kNlaaMk7g4TyqrIZzMHHSs?=
 =?us-ascii?Q?G7BK0wYuWiQ3GaZT5P3MUpmEbtUNUxOPQHkXXFc3I2GmtpXh1QZeqDjx0ODI?=
 =?us-ascii?Q?BJk5cUX1g1AenTlLUQL0W1DmYP+LVZMZ7Dyeooti6uIwJPiO/7ACvICWj6c2?=
 =?us-ascii?Q?e8B4i+zdsbCdXW+drxc5IrDMqM4D19oCDrFm6+JAkVyhGMQBP35aLUvow8l6?=
 =?us-ascii?Q?lSIvRTczfRY7Eqg2lCP0QBP4kfcOoG/NUYeuBiV5uk12FGPdiD62L797EbEL?=
 =?us-ascii?Q?cd6wUJXNyvQewGXgjjQc0GIiSRw4n3AC+VLDNkv53kB6jC5UQeu/YsgDyofO?=
 =?us-ascii?Q?jkW8iRQ0YkUHsm5P3IoNU7SB+AHitadpejUnEQ4UnfZJVS3BnQn6knWFkDp8?=
 =?us-ascii?Q?brWH703lhvaV6hj5N7twnRHkDNoS5GdA0Ndn/Q0dPRpoO8S6MAox+meM6PEN?=
 =?us-ascii?Q?G11Gb2MLccqEdz3pOhiajZtko5YQ4b5FSdvLmZmtxHXbHm6Y3ge6BzOhwMTM?=
 =?us-ascii?Q?UGzvIcRr39YHG+kc3I8dczJk15/rVYDmJrrg3SQ4L97O2gkVkQhrmmlLDRD/?=
 =?us-ascii?Q?5C7v5KRWi0gvRVq/8Ez3UnGSwLA3B5xkszo6pkCobjAVx7i+WXclFJj8EIO0?=
 =?us-ascii?Q?B7pJ/QnkCaDlMfgh/XeS54xEeY0T0ArMp9soWbLDyIVlwD984aWczR/NGyCZ?=
 =?us-ascii?Q?2dZKvbJbD90Hi1cmSq0ZrPhn1nX9PHzoBWlIrYfw34N3xMiOVm1947OR/Ig9?=
 =?us-ascii?Q?waou7ritJ8AbCgPPEpsmdbneqdPJwL+1BzORuWtl3mq2zdVFcm0ZbpBEvm+o?=
 =?us-ascii?Q?9RwjlpYKLjMC81rSBSvMJHX8bL/zATNtJpc3M+hJMRyFTqZmEu5QIW7zF4eX?=
 =?us-ascii?Q?ppU6Pmx29fFfTtTSPWIVx0wMBeTNI+nKcI312Ups1CAaxgNZYcjbtZAZbiPY?=
 =?us-ascii?Q?ZgRosGVDhiZQIfBarVJRlJ4XkHTPIOhOjpGrsYRZrVJSl4E5bmDXrARv4tHj?=
 =?us-ascii?Q?qHwQE6pmRVbLeE+IL+mS1eriAHStWboRyP82C65+lM7/ha0MTP7yl0yVtiZZ?=
 =?us-ascii?Q?Lo0Q5YdY+vfr1//UvSIyIZ9NIOY4eWxM/n/GcsLIoIhpG7h7UP/OeZ9emUzz?=
 =?us-ascii?Q?HS9ZajVnm5964iZiAdFNMbMafVVM1rOgM4yykeAkwRB/+dO+C8b+XPh5u21X?=
 =?us-ascii?Q?UMngfaUdxcRwYzEb9g72X4r7wFavrnxAXydKbYbEWsW/ELQYY2BIxt0QcR2v?=
 =?us-ascii?Q?w2O/uOfRaOtOPWuO6Q6Zr8GKhQC22MXWhl04Wwj3ydzZBQwvVYtUjj115sjU?=
 =?us-ascii?Q?aegONuYZ4ys3OGysUFRkmvmZavO3iqVODif4T7UUdWADK7uhzqO3iOYL/1tD?=
 =?us-ascii?Q?jX3MVPQcFWKltYkrW5LT+oRBX0srmcOP522QXt1q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf177e44-39b7-46e1-21b4-08da9547e9af
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 05:22:12.3538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6EKuWki1n+hThDMmqYPn72Q+MBEZ6wqHbMNZANFjU9+/RkzDq7y2kEh7esJFKOeTOzjY4opK7sEMTMGIQu8FRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6692
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Nadav Amit <nadav.amit@gmail.com>, Alistair Popple <apopple@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, Logan Gunthorpe <logang@deltatee.com>, Ralph Campbell <rcampbell@nvidia.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As noted by John Hubbard the original test relied on side effects of the
implementation of migrate_vma_setup() to detect if pages had been
swapped to disk or not. This is subject to change in future so
explicitly check for swap entries via pagemap instead. Fix a spelling
mistake while we're at it.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Fixes: 5cc88e844e87 ("selftests/hmm-tests: add test for dirty bits")
---
 tools/testing/selftests/vm/hmm-tests.c | 50 +++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 70fdb49b59ed..b5f6a7dc1f12 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -1261,9 +1261,47 @@ static int destroy_cgroup(void)
 	return 0;
 }
 
+static uint64_t get_pfn(int fd, uint64_t ptr)
+{
+	uint64_t pfn;
+	int ret;
+
+	ret = pread(fd, &pfn, sizeof(ptr),
+		(uint64_t) ptr / getpagesize() * sizeof(ptr));
+	if (ret != sizeof(ptr))
+		return 0;
+
+	return pfn;
+}
+
+#define PAGEMAP_SWAPPED (1ULL << 62)
+
+/* Returns true if at least one page in the range is on swap */
+static bool pages_swapped(void *ptr, unsigned long pages)
+{
+	uint64_t pfn;
+	int fd = open("/proc/self/pagemap", O_RDONLY);
+	unsigned long i;
+
+	if (fd < 0)
+		return false;
+
+	for (i = 0; i < pages; i++) {
+		pfn = get_pfn(fd, (uint64_t) ptr + i * getpagesize());
+
+		if (pfn & PAGEMAP_SWAPPED) {
+			close(fd);
+			return true;
+		}
+	}
+
+	close(fd);
+	return false;
+}
+
 /*
  * Try and migrate a dirty page that has previously been swapped to disk. This
- * checks that we don't loose dirty bits.
+ * checks that we don't lose dirty bits.
  */
 TEST_F(hmm, migrate_dirty_page)
 {
@@ -1300,6 +1338,10 @@ TEST_F(hmm, migrate_dirty_page)
 
 	ASSERT_FALSE(write_cgroup_param(cgroup, "memory.reclaim", 1UL<<30));
 
+	/* Make sure at least some pages got paged to disk. */
+	if (!pages_swapped(buffer->ptr, npages))
+		SKIP(return, "Pages weren't swapped when they should have been");
+
 	/* Fault pages back in from swap as clean pages */
 	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
 		tmp += ptr[i];
@@ -1309,10 +1351,10 @@ TEST_F(hmm, migrate_dirty_page)
 		ptr[i] = i;
 
 	/*
-	 * Attempt to migrate memory to device, which should fail because
-	 * hopefully some pages are backed by swap storage.
+	 * Attempt to migrate memory to device. This might fail if some pages
+	 * are/were backed by swap but that's ok.
 	 */
-	ASSERT_TRUE(hmm_migrate_sys_to_dev(self->fd, buffer, npages));
+	hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 
 	ASSERT_FALSE(write_cgroup_param(cgroup, "memory.reclaim", 1UL<<30));
 
-- 
2.35.1

