Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9765E9943
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:09:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbXQW52g6z3fJm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:09:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VYdjxlsj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.92.66; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VYdjxlsj;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbXKY16zbz3dqX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:05:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jw17skYtiFDCLZycDqF+cbJuvTdLoE63zex6fCsqzX3OMOT2q7qR1Qh5sj+p2CLvpA1FQkjhZVl3/EPJza5t4B/Dy+O4HAXzm5U6wYAFZ1UQ5lNoMH23LxouvAs+H6X8Kj8AUL87L5s8ObPWyk5GUchFUa0qZnc7FMLEoy3GojfYNIWONBFDuXG5TWaMfgZI5wfDAiyl28xERmUO5ZQrqzRTOW649auAuqCBle22YAZccgLHwxQPjtGXGmwZ2TfS1Ot2WwQhahvOMtdkAD6Z7yJRh26qm4vGNrrebKGXcFa63XFy/LisK4gMZVSA2jJQFP3PWSIrrWwr0fdf3SECrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJXLJAmQHeMb/7dTH0Y7fbicwcRe1WcmHt6SvAWONwI=;
 b=iJMVPUkxXKFAXU2+xzMgIEn30GpvQSaWyHLT1mHOnsay9ziCfyXs+uxzt5T/H7BkryToP9lURLlFKPdvVGQ0dDB8Us3+ymY1V/ZdSWPoGhuiQZ6fjSFFuyh46sS0zXO0UBAgIrzbFFuWWbQ/+E1bN4VfgdN/di00UNIMWCC5tWxgy6izVCRdGo4UhQ1Oe/rS2wA75e4AK6pyw8QHuGnshYyPwhB47dSHN+KBJqZyx0Jw+zOBaCGxZwUnI0tR0CWnIMrp5xZq1L7mvRsV71aTHt8G+3qnRrwpCCmxdy/b+UaVT1uEWZfy3AuBrz0/pWnm+AJ0m41+6wjX7wyYRVYaAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJXLJAmQHeMb/7dTH0Y7fbicwcRe1WcmHt6SvAWONwI=;
 b=VYdjxlsjtYnFjUzyigbFfeOTTf4eseosfC9xni/fMwTCWHFcS+1Y0JrX8K5zOkpEkLXiGigdfJyHMWxKFLJT8Gq2uHfNNkHYE+ckNx3UxE4bMgZkYxnGdVuYhtMIsgj8u8ISSttuDlOIIGq50RifBRYh703VomAdro7pFf9VeM9tc1l9vg7dTJbUgTiHRnvzW/DVchz+cTNx/Qfm9jKJptYUQf5J4nJy+fMi8M3iOAWiE/ZXMcGa3lS4IEgvHWUcMCKmqqtdckGBXYms1CNdxgHMocenxubnvcee1+herp+pgU1Mjg+SQVloABHWbYYXAaZUVU6WrHi/k5Gmh65Qxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MN0PR12MB6030.namprd12.prod.outlook.com (2603:10b6:208:3ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 26 Sep
 2022 06:04:44 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966%6]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 06:04:44 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 6/7] nouveau/dmem: Evict device private memory during release
Date: Mon, 26 Sep 2022 16:03:10 +1000
Message-Id: <072e1ce590fe101a4cdbd5e91b1702efebb6d0fd.1664171943.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0127.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::16) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|MN0PR12MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 549a2cae-c846-4f52-9793-08da9f8501f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3OnXLR+0P7sMoIM3V+E+8u5wcWkai+R+ZZBCmG2h8RUQt9F5pKny9/rEuFrc2ikYEMZ3tDfZY/LLpq+WrqBY9JPzO+oiTmyomexCi12u5XBBsCr8L57QMdXe7VLP4kOpAEoq64EpTzH3opgQv534XEEzR7bcqq+muKY1wWUfdN0bFzcb1eBerSgcgePokb6g3OfN7bDrdttkasNFQ5mkYVkWXqGsVDKJD9YVyScV5Uuxk2L4vyfwVQAfXg03/X+Ejo6YAglHOzVsWEc6W2ug0XO2dzEEwJEeNnqIAHKxp5U23ewIglWklccMnDKPvrXaFAPYPa93tAI1ew/vwAimhotcQzVxfhEcsoEKvvh+Gk1NLncg01tg9fmwtC1mCRFm54B9rjCH6GjXHFqm3DEYNZ7vZHutjZm6peXYz6hFGZR92OoNSqH4iS/wIFUB1FMvs6UILBcyAmFhmoealWT/BmtyptHU0bjA1SLVzWICBXnBm/Y9ZpsRI/1tNmwFKk9SDS4ycD8q/mypbEVFLXMXdNp9eXR+FsF6C6HeiknWbvVtebcz6dTfIcZtrzB4NTMtgvcN76NiS8KSu0N62vsjef/cOgXard/42HBxkwPNrZSr5veQ/+T0ZsmUeo4i4zTqiDS444oXwfBJTN8lwHGhTLUtgrejW3UYHe5QEzH+4yPygYW/9997nd8eR5Wx3XSZjOwYNVuR4+j/i4jv/jf3pw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199015)(316002)(54906003)(6916009)(6486002)(66946007)(66556008)(36756003)(8676002)(66476007)(5660300002)(4326008)(38100700002)(6666004)(8936002)(26005)(6506007)(7416002)(478600001)(107886003)(6512007)(2906002)(41300700001)(86362001)(2616005)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?bzHQYHLx9JQ8xfi4ziYBBPbyK96nBccNfZ7OL9aqnECylcXChC7GLd5N4lYb?=
 =?us-ascii?Q?UB3DeNpBeuken+pjaNVys7yqflBJkhe4ahlcWBNedXg100LZhvnGHuCWtPDR?=
 =?us-ascii?Q?fRx0sNSYXS9qEJk3X/kZ0EE0M0Se/sTBOLMeXjN+xMSNNTZR7x9l7zdNjU0p?=
 =?us-ascii?Q?Zj6+Ofqsl+P0tpp53GHTP7Wl4MPmhjL+atUxRKOA5AMOZEklOdI48Ozn6lg/?=
 =?us-ascii?Q?ykCXmHJvw1Hs0jEq2bHlXIFsw9UgF0q1ilz0JiiyTGyN8vAFRvJm1lmniUtM?=
 =?us-ascii?Q?KpScblHJiqlkMcvfBfDpQoh7dZZD3SY9gNfa4TF29UaM93lj/hDUcMf0Jzsb?=
 =?us-ascii?Q?Kt7XcbaQncFGgJT1u3QyIvJaoMevtLJzAfQI+/BgZcMKv8j1dxDJhLs5nxKy?=
 =?us-ascii?Q?Qkyuyln7Qby3C3FxDpbmRmbqznR4KmNIKi/nxtUUWC+kLxYjTPsMmiMD8q/B?=
 =?us-ascii?Q?OgQtdA6VInknLMlJeG3PjeNWcMa8TKO2tvgmwny8Hnn28lupr+8542vEdZKz?=
 =?us-ascii?Q?H/b0BDaDBkxvw1jxV2hdF+HFKzRumJ6FgY3Wl/5j/I/cD0u7Ovz2nAWFar2M?=
 =?us-ascii?Q?sGzZNrw6rS+XogNRuyqebZPXBSZHJXKdLXxgN9nopzuo2l2QFmbIwI+jxM+T?=
 =?us-ascii?Q?eHpyYFNlGC7jxxTcboUKfoRq7KlQITQlUonjabRpf1SW1t+hozzn7GSwh43w?=
 =?us-ascii?Q?6R1dM72Xfc3K7l6bhFGNXU/JGplSLTf56AP/QhMkB/KFlMrVYjOAo6btmcVQ?=
 =?us-ascii?Q?tZqbZWbH69584cnGhCce0eUjXOpaH40OKlUY5WDqtlLB3t4iy7GvqlesX2ae?=
 =?us-ascii?Q?a0fHSRaKTWWUdv+2j3SughZMUNxOqBpw19zK2qbM3fdPh9GZkh9dnZQPmUXv?=
 =?us-ascii?Q?Ky/vTzCyBKFb0ffJkmC2NOJSbd9PGQhBIf/zT7sQIqRnBb5jSof7YBgnywr4?=
 =?us-ascii?Q?EmTAQn6io6dvJWYgq1yMAg4GIadn15dLorYbFcVcDs252hcbbC6/u48lppm0?=
 =?us-ascii?Q?mDeGDNYmlqnvw8k7RAiA55kZXkfH0CQyu1LqgVvH+bIzf7ErsLU8ZGc9VoyC?=
 =?us-ascii?Q?/ZyOICZZ1NI3ISR0K5ZgwbbfXAx59jYbemoYlGvBXZ/zJy4pHH95yhQBgw7y?=
 =?us-ascii?Q?tbrx+4q8jFYbjg330ennJzk6Qkpb7TyqdskJZXXFJboFQs5BxH7tWt7Q0zos?=
 =?us-ascii?Q?0um9Eaa0JQGAzOoLeiebvez/hR+36/mkKG8gX/geKF2bnCsnKibeews95dQt?=
 =?us-ascii?Q?1y6gdQhTzt+wETR2Qw3Ww9fJUhQbM1TRZYlw9WeRqWU00Mvx2rSj6T3SWj/f?=
 =?us-ascii?Q?zarUgqRrNcXzc2Za1UD9WlZe3T56WGSJzCtfJTYXxuTGoqVdlweH2G+fqyHo?=
 =?us-ascii?Q?4oQqNRm+JOHHHoKwZ3QEIlwYaZd+jqOJzkFibS4yFdEcS7R+yM7nEEUEuh29?=
 =?us-ascii?Q?ztWx8/vkOYZcRMqVHe84hvxmyxkSoI/rQcCBBaIK2FxUABQ+EpxFkEkxqSEG?=
 =?us-ascii?Q?enqadXUZkzH1sdrLKPS76f895y8qQAgVNIs6gq9DIJMx/LKMW2T4NVg+j/oH?=
 =?us-ascii?Q?RMc+zZv1vzqAuZbCVPQykRqz3aAi13duTvGt+z7c?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 549a2cae-c846-4f52-9793-08da9f8501f1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:04:43.9985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6770XvgGRZ1/LoDm7lsaEhMkFUvkNv84XmDzKydNSGyiO87ewGnGSDJkkVsS3K7EpWoHWR/KDNMQICdyoPTkQ==
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

When the module is unloaded or a GPU is unbound from the module it is
possible for device private pages to be left mapped in currently running
processes. This leads to a kernel crash when the pages are either freed
or accessed from the CPU because the GPU and associated data structures
and callbacks have all been freed.

Fix this by migrating any mappings back to normal CPU memory prior to
freeing the GPU memory chunks and associated device private pages.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

I assume the AMD driver might have a similar issue. However I can't see
where device private (or coherent) pages actually get unmapped/freed
during teardown as I couldn't find any relevant calls to
devm_memunmap(), memunmap(), devm_release_mem_region() or
release_mem_region(). So it appears that ZONE_DEVICE pages are not being
properly freed during module unload, unless I'm missing something?
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 48 +++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 66ebbd4..3b247b8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -369,6 +369,52 @@ nouveau_dmem_suspend(struct nouveau_drm *drm)
 	mutex_unlock(&drm->dmem->mutex);
 }
 
+/*
+ * Evict all pages mapping a chunk.
+ */
+void
+nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
+{
+	unsigned long i, npages = range_len(&chunk->pagemap.range) >> PAGE_SHIFT;
+	unsigned long *src_pfns, *dst_pfns;
+	dma_addr_t *dma_addrs;
+	struct nouveau_fence *fence;
+
+	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
+	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
+	dma_addrs = kcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL);
+
+	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
+			npages);
+
+	for (i = 0; i < npages; i++) {
+		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
+			struct page *dpage;
+
+			/*
+			 * _GFP_NOFAIL because the GPU is going away and there
+			 * is nothing sensible we can do if we can't copy the
+			 * data back.
+			 */
+			dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
+			dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
+			nouveau_dmem_copy_one(chunk->drm,
+					migrate_pfn_to_page(src_pfns[i]), dpage,
+					&dma_addrs[i]);
+		}
+	}
+
+	nouveau_fence_new(chunk->drm->dmem->migrate.chan, false, &fence);
+	migrate_device_pages(src_pfns, dst_pfns, npages);
+	nouveau_dmem_fence_done(&fence);
+	migrate_device_finalize(src_pfns, dst_pfns, npages);
+	kfree(src_pfns);
+	kfree(dst_pfns);
+	for (i = 0; i < npages; i++)
+		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BIDIRECTIONAL);
+	kfree(dma_addrs);
+}
+
 void
 nouveau_dmem_fini(struct nouveau_drm *drm)
 {
@@ -380,8 +426,10 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
 	mutex_lock(&drm->dmem->mutex);
 
 	list_for_each_entry_safe(chunk, tmp, &drm->dmem->chunks, list) {
+		nouveau_dmem_evict_chunk(chunk);
 		nouveau_bo_unpin(chunk->bo);
 		nouveau_bo_ref(NULL, &chunk->bo);
+		WARN_ON(chunk->callocated);
 		list_del(&chunk->list);
 		memunmap_pages(&chunk->pagemap);
 		release_mem_region(chunk->pagemap.range.start,
-- 
git-series 0.9.1
