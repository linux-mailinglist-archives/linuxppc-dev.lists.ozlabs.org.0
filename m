Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F47E5E993D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:06:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbXLy1g1yz3f3M
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:06:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PMHcNX1A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.94.55; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PMHcNX1A;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbXJm6wjZz2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:04:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oca6pW+6+KtG/XgCOK0VrJvZ6IhDf/Nyfx/5a8Mmk63oyuThRZP1J+mGiuqYAk/5RhG8aUYgwFYjJ376bIKV/2RaLYxMMGYEWTPzSC6qslwWKWR7h0f8cv30ahReMc3jE4pv+G3oP58CGVRJ3rCIylPVkGKAWSp/nyQUuZRiAtjrwTwIhw0g7Xt8dMyKJZLljNgS8KxMV51bgn6aPuG0Kj/bBLVPlUUmGNYBkO9VR/6e65z4Yen8SiOZBRL9sMdAMfryQ//cDjjuSHx+NC4sUcxtk3Q9TmFRFz8AAqqzJEcNclncMirxISFUSx7EMvaFjUj5nBZlUxGSJC7mUpinaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpUR8gcIPaAR7nD1dKeC+83we5Ll0QdDdKicRyU/2VU=;
 b=Fhop26GLvxmPg1GIiy6s7+0gK9ChzQqUbXlK7SR5s2IauiEC666hVU2OP0uDZBpyaVWAHBFoimP/Nv5pet9OUaXm4DDYjXihmmjuXSSNLB213PT6urGg0OTuxNSxHXdAY3ETSEQuUms93krHl4W5FlO6GrURiZ+04Y8VM+l2fA1kLGuVgCb1Q531JoKWQrUzpB9j6YMZhSFpko1EPplTZNP3OoW9QsmqlDxcmLJmMotrCK+FGVPX/Zs+CZQuOZ0xs9/t+heTiHGIN4tA/P7hxhDeAlC1IOIp085qhvnYundWbWPSUt5TL5yre60mjigEPobtaBQS5AQrnzaDJWKCNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpUR8gcIPaAR7nD1dKeC+83we5Ll0QdDdKicRyU/2VU=;
 b=PMHcNX1AcNm68fswb4wqfJoo6IGL+BWzkRMjjMdIa7gj5tXlvdnuBp3XWC1q/p3cvsfuh/l9f4VPo/p2oT3uDedlJ8xugwlEQxBDlanEdSBVw9C4fZZJp9CWAQbmutX53+sg+LmJoHvH2SMSS/qYUBA7aYsZ10kDa+ur0Gr5kFDoxnteawoWHIuIap6SNaJM93GHXoGq+1W3iShdwMXA3WQtxMLA+8NlO5t77uWKM1i6SKlG5plvh2RF/K4txTbw7G11atKzhaTBVPIqdQqYUcXfqEkThG4ASMY/gKvA03kn9ZpqrC0inHhn+AnWhoE0nljFeOW1fZNpIpo9bI3QdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:219::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 06:04:18 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966%6]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 06:04:18 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/7] mm: Free device private pages have zero refcount
Date: Mon, 26 Sep 2022 16:03:06 +1000
Message-Id: <3d74bb439723c7e46cbe47d1711795308aee4ae3.1664171943.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY0PR01CA0006.ausprd01.prod.outlook.com
 (2603:10c6:10:1bb::22) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 42dc79fb-aca4-4410-816b-08da9f84f2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Sg8pk3ObyJPpGQXkXCrSAZrlI2JfuD7xYLEcvcWnSqNBC5l/zr/eIlMA3v5g6cNqFpPIBZk6le8SP+1o/FzBAL4i298q7XU4Kp9UvfXgJAAazaL5Y0LgRpKIT6vGoMrUJ6k83kfQiAfhQLcFQIZ3fdeKxeX9YB1BtbvXFM5Lm02EmMDaNfd/sWVTogWERr+z3BIjIbdaBtCYJP7TkUY/ejuUd3E9huIAFtn8wqeP5VL0egDMcAThpaErJjkr22/RjMXX0C9W298V96AgEpdLVPSQhHN4J6sAs5tjbO1olnfHB4XS7KLZHzA90D8yqDbkZS0RAwW9M1m8+03MajgeToulqBnox/cdDpW4BKDlRInUqrswG9FkTGJS8KYn+lKcHGpzU5FmLnSMOR+690JQiMJM0XDAe6x/8Il11R+32tILcxb+Ixsx5235bOE5DVZDhEhq1sGsAHejmdLZvVLsNyZzDGt37RBfyI34D0qol+lPRmRUC64DXhPG9thIZglx7UWSbk2kRXXYePRu1B0OEPvF7+a2v0n9VsYg84I48jx6H7oSJ6ahBzRofXCsytfXeDWYF3z1INZJJsLOvVBrlNvOmfzzNKfaP0YoYH/j0tmhBprpZi1PJwxHo3H7G1oF8ssOicZY4CBSYRlzlq/MNDSFawTCgGpnaDv6EwDnyMs/hixWEyIXMpuV0vZY9/X/43jPLnYlfV1eXqgcMT1isUQP8//m/8to+Mwhjhyy22+23EH3Sl1JLVgwrZkP6cio
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199015)(8936002)(86362001)(7416002)(2906002)(5660300002)(83380400001)(6666004)(41300700001)(6512007)(186003)(107886003)(26005)(6506007)(478600001)(6486002)(2616005)(6916009)(66946007)(4326008)(66556008)(66476007)(8676002)(316002)(38100700002)(54906003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?VzBdNO6pyTug0f53OiDET+Rk1JMLTpnAA29eaaVmvQqdoMusNTsQgP71Jb0g?=
 =?us-ascii?Q?K/+grlWM0NnjIFLOFpmEmc0nXC4M/aINMh1iXnNqtZ0fkl/vQJ/CLZNEZGHO?=
 =?us-ascii?Q?cEcy9lJBqmAgQQm0guSUiTuImpDL+dIBBDc8dlGTSWGYE3nDF/Drh0AeTe5Q?=
 =?us-ascii?Q?a6o6zJW6/xatwj20z9g85cAJ2DD3ircz5HkNCT1o3PNRkSUnsan0vWLhQw0O?=
 =?us-ascii?Q?R/lDyzlMOHcPvzmoh2LVozQGRYkvo7POPIa2S3+f6C7ebmDsq1zMtBd1Z4vX?=
 =?us-ascii?Q?ZXm4t3PIU5UFw2Ns6AaLDlWZ2mEaK8aQrJBuumLuMr7PIDNkiYLsYYt76aGT?=
 =?us-ascii?Q?ES3rxfvsd9QXYKBEHieKzlhXReoe6LGcd0Mw/qRqBPS6znuWKhsD05aKvEkj?=
 =?us-ascii?Q?gNtkS9MlN4ESF1xL7gTo3BBx/M+I40r1GKmoR1yQbMcE+PWXYPpVlqdbDLvk?=
 =?us-ascii?Q?pJSHPYq+G+sA78T4ZprIdTMcgxLjXEo9zjPaDt/RWAMg3uJf5bgBgu8Rp9j3?=
 =?us-ascii?Q?DibaOsmWrSGFZHjpwPsX7KLVl/TXTrDXuiPZW4dHEnRTxQaajUj6GjxQQjbi?=
 =?us-ascii?Q?d3LX0j7rFQx9PwaiKf4DGREnvr9R+1DSA1rAwpg7HPdX8Gd+biWDzkKWlKsQ?=
 =?us-ascii?Q?rYFh4/638O2jWI46Z2UzpmNNmeHdJZnTNQuavvjjpmtToPeXRXfVQwJOI2eN?=
 =?us-ascii?Q?zXJiefEn4EmmW/BNPYcGevdhJlV7nYQKQ9lOgXxcdPgEc44rMDdgoHgYbM1P?=
 =?us-ascii?Q?SmDvJTRhTVIZVXzRnY1n1SkamRiVH7jI5ZgmylqCR/cykiucHuidM57GmBDS?=
 =?us-ascii?Q?09O8a+0YM6GTeac8VLW5rbooo3hJ7EI/9au/nZ3FpwU5MPYP1K2Pe9/fMgJx?=
 =?us-ascii?Q?oXWZAphp7GrUgUwqn6kHuh3FfuHqquWQIAGSsZx9NMCyOQr4LlgOZC//c4+g?=
 =?us-ascii?Q?wVhx3Rn9cjs4m8kz2x27JPlXUYY4sQ+BqhboYBA2GQ/vxuqJ9gTIYDzsO/4K?=
 =?us-ascii?Q?YkmdgxwPl8N9Mxbb3elxgMsLayt431bNB8gyE7rbB40co4xGZYItMcSsiG2Y?=
 =?us-ascii?Q?3u30DTGocWl1mdlS793oXhWG1VADdqnljn0j05VoIpIi4OlxUz86sphVVDDe?=
 =?us-ascii?Q?dQml6IyQTILLDJQrpQdEIyASkcRVVkQIhMhbTAC6Og7O9AhV9ICIMLh4cHSU?=
 =?us-ascii?Q?J+GuFxqStPeZjJjmD3cmiTNjXmsKDTxYEeomxSsqwYlueEA1Ps3YO0Q6fzhD?=
 =?us-ascii?Q?2t2MLePgr4PprgH4lNHigstCWuEtH7L3DY8yq4VDEMn/f31wpTiIjTjFG/M3?=
 =?us-ascii?Q?TtpW2wmLKFXlx1BD68gk+s0ihbZhs4xgrskwjxsCPVZgBoD2q+5Hz0Bok9/m?=
 =?us-ascii?Q?JLKLpLsVcXzRGsqJ+LFpqPMd6EApW8sjmOKeFalYPA7RFvDowp2eFK9CvBqV?=
 =?us-ascii?Q?r6L5bY+8sD4+/M6BDFvi8k83r5LoPowU95+td4ia1QdCG1tRUy8zTtVIeUwz?=
 =?us-ascii?Q?yDGuU6yp2Sebi+iAFsld31UWJNhkTdpoLhrKLHKxneFtWKLxbpAO4s7hg6AJ?=
 =?us-ascii?Q?z7V9MJ3DA7Bl8M57P0Zr4gN9onksrqXmZZoAer1F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dc79fb-aca4-4410-816b-08da9f84f2bc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:04:18.5160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSJfaFl+AoP2iXV+KdZPR0OQ/OuPImsGV0AlcHXWV5stObXND6Q/pax0LvM2JKiC8tBfzane1jtZP79gVwCvAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359
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

Since 27674ef6c73f ("mm: remove the extra ZONE_DEVICE struct page
refcount") device private pages have no longer had an extra reference
count when the page is in use. However before handing them back to the
owning device driver we add an extra reference count such that free
pages have a reference count of one.

This makes it difficult to tell if a page is free or not because both
free and in use pages will have a non-zero refcount. Instead we should
return pages to the drivers page allocator with a zero reference count.
Kernel code can then safely use kernel functions such as
get_page_unless_zero().

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c       | 1 +
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 1 +
 drivers/gpu/drm/nouveau/nouveau_dmem.c   | 1 +
 lib/test_hmm.c                           | 1 +
 mm/memremap.c                            | 5 -----
 mm/page_alloc.c                          | 6 ++++++
 6 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index d4eacf4..08d2f7d 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -718,6 +718,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 
 	dpage = pfn_to_page(uvmem_pfn);
 	dpage->zone_device_data = pvt;
+	set_page_count(dpage, 1);
 	lock_page(dpage);
 	return dpage;
 out_clear:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 776448b..05c2f4d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -223,6 +223,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
 	page = pfn_to_page(pfn);
 	svm_range_bo_ref(prange->svm_bo);
 	page->zone_device_data = prange->svm_bo;
+	set_page_count(page, 1);
 	lock_page(page);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 1635661..f9234ed 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -326,6 +326,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
 			return NULL;
 	}
 
+	set_page_count(page, 1);
 	lock_page(page);
 	return page;
 }
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 89463ff..2bd3a67 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -627,6 +627,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 			goto error;
 	}
 
+	set_page_count(dpage, 1);
 	dpage->zone_device_data = rpage;
 	lock_page(dpage);
 	return dpage;
diff --git a/mm/memremap.c b/mm/memremap.c
index 25029a4..e065171 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -501,11 +501,6 @@ void free_zone_device_page(struct page *page)
 	 */
 	page->mapping = NULL;
 	page->pgmap->ops->page_free(page);
-
-	/*
-	 * Reset the page count to 1 to prepare for handing out the page again.
-	 */
-	set_page_count(page, 1);
 }
 
 #ifdef CONFIG_FS_DAX
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 9d49803..67eaab5 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6744,6 +6744,12 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 		set_pageblock_migratetype(page, MIGRATE_MOVABLE);
 		cond_resched();
 	}
+
+	/*
+	 * ZONE_DEVICE pages are released directly to the driver page allocator
+	 * which will set the page count to 1 when allocating the page.
+	 */
+	set_page_count(page, 0);
 }
 
 /*
-- 
git-series 0.9.1
