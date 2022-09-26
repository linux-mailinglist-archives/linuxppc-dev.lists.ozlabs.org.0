Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D02A75E9942
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:08:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbXPc3g5gz3cFp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:08:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YZRMWB7i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.92.81; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YZRMWB7i;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbXKC1lwnz3cdq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:04:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9Zzue6fuDipbzCpfvzeZrnf7WgfPfbvJwj2OwTEz5xCNSKq6Co5BMc1eQZrx3epp+oJoWQVzJuXSpQt+5z42nvpoyDMVoh9u4QeuIuBKaECo47IeANznHCikR4jbfFBl1HN6LJk5KgJVhMMvVm6Mkgcjt+s44s7VvZpq+0UZpYeRkPTQ8Xp7jP+mS9whC+Fv5V+NKv0KOajPZTGy+GJX8fXF6BDQLMpwfXlqwaOAGvSopXSHzbDJbpxCruGJAXQ+Rg4v8v4VFwoKWZ0rBBjoDFXKou+J8m5wNZAzFdpN0r+ecVHC8Ukz3DIj8grqg/LKWCeWm07zhvkiWx6n7diYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbQbKA0W/wtOMie6uvz1GHqU00jSixx5Ur+w1U41HtM=;
 b=Ih3xnZ70QhNk5zBoc7ZPvatASevk/oiYxaxQQkvYY2HDMwLy06Umw28vYnnL7ogByUaPtkLFPhTReSGVqsPTmzWcL7wV/mPAcbM4Zo07GjIGFYcrsT666bJ8bl9AVqQaAC/npirvL/d1aJ+Ylq0WxuS90jE7JzIKACjKdZZ4vR5gxsg8qK+q0hhXcYKbcb8kyZYPUUjwachaN6HLOQhj8qcerkicnuSz98TLHn6+8U6rKrHieA4NmoOQqd4JwR9+NF14XX/rEqA1KiDI3AsNZ1txgoluvJyvVk38EIQvHO/M2lUCQ3/RIJGjgcQI5iNmJo6OH1nrnVe4I916Gyaitw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbQbKA0W/wtOMie6uvz1GHqU00jSixx5Ur+w1U41HtM=;
 b=YZRMWB7iW3LcCzecaLuIRHP85rM4mcjht10C/r70JAzZwGixFN/newcSLc0H2NQxnF3p4O1cAO86uGoG3tWKKX2NIW53GmTze15zh1NRDrkNJs+1r50LbiIwJzF9tUnKAtmmu0n1xbgpB+8ym9UeNKUc4GgGd9n4P/26wDQZZfeledzRa4MvmMd6UF0iTP20yI5ejZywqW1N1hF3p6JL2m7udbjrbT97LwQQtPEgzjDqI4Vg+BGt4cRgtUx5R/DTWc/NlEL/Qwn7BRksFwKXwk8nuviHvMxJTXJC5SHuTcxKNoWp1rx0sPrnpHAKnXL3d8KQB+LRA1dTpIgQmjXQDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:219::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 06:04:37 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::ed0:a520:ac8e:9966%6]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 06:04:37 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 5/7] nouveau/dmem: Refactor nouveau_dmem_fault_copy_one()
Date: Mon, 26 Sep 2022 16:03:09 +1000
Message-Id: <ea208905d853a0fdc277c2b5e74742593e53f767.1664171943.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0213.ausprd01.prod.outlook.com
 (2603:10c6:10:16::33) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 32891b4b-a7a2-40e0-9ab5-08da9f84fe35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kU+lUcVvxCA+ofn9yeVdT0KOZaqMD5p1fc0TzZMiUkmL6GJdkZvNLZn2C92Yr5meoWu37ElYFn0L4vWDo1SwymLJ0UzfL5W1lqpylYmrnngZqm1lUwaKjAuutkDXMkQmRHw/vnSLru+zWPfDPCp2Cni2b+qwq3Y5BQwzyFPI7Go9hyBlIdlVA92BcZbHw2R/yMveXSOoXH1qSWRZJH+UrQOtZ5uYLevThKlw0o3UgiHyJNs8IgRDfG8rvYEzMxaVhY8gQvsh4dfIY66S/cZITge+zsrJqlHe9z7yXBvp/3vIh/HUGmKnJs81x0MG6ROQk6WQoVhhbYt1vhXqsTtdVmTJlWeHPpqE+VpvmAm0yAkRPlYRs5OfsFdQh6QjqLkXEJHGBSmwhaIjSWCu5X0oINlVrZkhqRW4zoadXBT6v/NXAUFWQ4lBdwZ9B9tKJA7euDFYacQAbjm0zmHLnUl7BkwhlsFfKtR828e6MKvBcGEx2NRnoYZ2Il5NOauYxXF+QODurUFKRpz5204Tcnsv0HKci0ELIVIo5ys8AgY/s8q/zq0vzNm4OFa16+iCo4I8NDNIQoMffX0B+xCIL5HTweLEBfpwkg34YcU3eisroVlEF8TlDFhjbQLjA+5IKhk4+TQ7KwDio57OD8BkZX6w02NsKVIA1rYhNrN3BUH7pZd240NoWpHmyjsGjMFQ1Ihh1eRattbbYMrHt/tYNrFkHiSFMN9o8PBZfYNjhhq3gAKNSRZR+HCy/gCaahFZpQi0
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199015)(8936002)(86362001)(7416002)(2906002)(5660300002)(83380400001)(6666004)(41300700001)(6512007)(186003)(107886003)(26005)(6506007)(478600001)(6486002)(2616005)(6916009)(66946007)(4326008)(66556008)(66476007)(8676002)(316002)(38100700002)(54906003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DneXTA/x7aBipup8UqZDGn+osT5MF867amYmUtHe58VRd0e5FiIg0O/ppsUL?=
 =?us-ascii?Q?HHOYnpu8bpie6YiWtjSy15VoNeVSPMXUa1hXdTaLIcDth9JweQWQ1YrhTVqI?=
 =?us-ascii?Q?YZYe6XfIf8ma2DPCWHbRg0gMBv4MLxvf67G4EAkXWKlup6EVz8d8rY2CyM1u?=
 =?us-ascii?Q?GxPH4slSLvc437SBM7wZdAkO5Y/HYDC/BWiyKNs7c4iex9A/DIjL8TkrAVNJ?=
 =?us-ascii?Q?U8TWewZTJcKciotfHGcPeUxOA8kLWNLhmYBq2tq8X8o2IMCMKKvtMxsWK8Yu?=
 =?us-ascii?Q?1LJxKqFJqYbooY2sUigaz8i1G/LwOvXS/MgWpO77W+ddK/eJA1UACidLp6Vx?=
 =?us-ascii?Q?4MqMV/05us4dnb6+YDiwjBb+vyI4zImoc5rTNj26vAak2y8fwusl84fIu8Zt?=
 =?us-ascii?Q?4TTcL0Ca3gV5vxHH/KsSXsw81eBk25AQDRnbsWqXLhnn2RgBFmzfLu6/T7V2?=
 =?us-ascii?Q?dbBNhjLxWoPgjdZGL71XPAiMkOATg0KjD9SnWV68PuAdjivG7tF0wHdNeIQq?=
 =?us-ascii?Q?WTzsLxyWXykqxbMaPeyKlTLCfg9m7ShAONB0eFo8iWFM6S7CUjJc6AEmeP0w?=
 =?us-ascii?Q?6BdmWLsXxN8dOwZFs64Rz2HEGQzSbWBeMpSZvn9xQ4Ym4X220f53Zo5ZzdbL?=
 =?us-ascii?Q?76shPgpv14RlAldqP+2NpIHUyxnQYDpVRaIXamKLeFoJfdQX5u9MmWtBSqFA?=
 =?us-ascii?Q?iJdsojlfNZqZnRjA+wP23YAUvBUK9tN1gRKiq4pIwsJa0slRca/3pOGBGjcI?=
 =?us-ascii?Q?QwPPGRI7gXQQl2V4nn6BlalKhpin+rbZm46Qi5q92pYMGhcuVg7SZlij6ayL?=
 =?us-ascii?Q?2DgWqppl2XSaFJl4lkzNSKolc61tsmXvdDrC5yXf6qcAblsPPrgFV5els2rw?=
 =?us-ascii?Q?zclMcle0aa3wBTzFetjoUj++hygbX/o++lt+AvD0TWV/NlUxplj/71dycR1c?=
 =?us-ascii?Q?7PpvE4oVopa1w/Q3qbHw0BoLjvcU/BK2PId20pcf+DIrGBIyvFdGNDL2HeR1?=
 =?us-ascii?Q?W10p1R9bXwbuQHgmTPosNrGqjPG4fQURMXMPgv6d8v2NqaMv/AOLVEjbHEPC?=
 =?us-ascii?Q?RRk93Pl1Yw0TIKdPpkwlhzdoHDvmZSy49hedrq8cnT2cbR3Rn/tRALl+KOdl?=
 =?us-ascii?Q?q0vy2TMYqOSTG8za97JnpjB/Cxe8sgIG8WWAB6t/UjZdYgdJADW1WS/yBTNP?=
 =?us-ascii?Q?uhFd/ImHitVrwckfGZIe3NdC1Dsw4OxevxdD8O+qzoyfmwTSbbEHCe9RbbMf?=
 =?us-ascii?Q?ltTeBumdllkAWBwYiyFddUWcLPDW9UORFSL+nhLydEWG1biWIcldsORMkl/i?=
 =?us-ascii?Q?2v0XnydQda12NrEqCwoZU2GmPGlGxbN4YiPwdct7hHvCrSEp53D454WtHcKA?=
 =?us-ascii?Q?4MAzYN6cP5o44pzqoUprW0DbUTCZmgao7lJ7wA+++3+LBqZvXsOTguMG9gay?=
 =?us-ascii?Q?p4+CC9qGIaTRTlz6IRNoRA3xjhr/POLoR7DbdCPDE3d/EtygIG8k+paOBhyr?=
 =?us-ascii?Q?nBGZIIefpw7LFljr5ArKnff6hlaaLQLsu2tHpp2iCZe1wqeU/YYq/spoUO4E?=
 =?us-ascii?Q?Qv40fqpBcRYAxJjOFI2shU9xb6cV7mqexh51Fkbb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32891b4b-a7a2-40e0-9ab5-08da9f84fe35
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:04:37.7490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrQonp5f4+KK2a0BpjaBdTX544f82d4XLFcIztTkczIx3dZZbDGJdisnpg3K+Dq/LWQZwCxOqgxz5IWrates/g==
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

nouveau_dmem_fault_copy_one() is used during handling of CPU faults via
the migrate_to_ram() callback and is used to copy data from GPU to CPU
memory. It is currently specific to fault handling, however a future
patch implementing eviction of data during teardown needs similar
functionality.

Refactor out the core functionality so that it is not specific to fault
handling.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 59 +++++++++++++--------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index f9234ed..66ebbd4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -139,44 +139,25 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
 	}
 }
 
-static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
-		struct vm_fault *vmf, struct migrate_vma *args,
-		dma_addr_t *dma_addr)
+static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
+				struct page *dpage, dma_addr_t *dma_addr)
 {
 	struct device *dev = drm->dev->dev;
-	struct page *dpage, *spage;
-	struct nouveau_svmm *svmm;
-
-	spage = migrate_pfn_to_page(args->src[0]);
-	if (!spage || !(args->src[0] & MIGRATE_PFN_MIGRATE))
-		return 0;
 
-	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
-	if (!dpage)
-		return VM_FAULT_SIGBUS;
 	lock_page(dpage);
 
 	*dma_addr = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dev, *dma_addr))
-		goto error_free_page;
+		return -EIO;
 
-	svmm = spage->zone_device_data;
-	mutex_lock(&svmm->mutex);
-	nouveau_svmm_invalidate(svmm, args->start, args->end);
 	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
-			NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage)))
-		goto error_dma_unmap;
-	mutex_unlock(&svmm->mutex);
+					 NOUVEAU_APER_VRAM,
+					 nouveau_dmem_page_addr(spage))) {
+		dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+		return -EIO;
+	}
 
-	args->dst[0] = migrate_pfn(page_to_pfn(dpage));
 	return 0;
-
-error_dma_unmap:
-	mutex_unlock(&svmm->mutex);
-	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
-error_free_page:
-	__free_page(dpage);
-	return VM_FAULT_SIGBUS;
 }
 
 static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
@@ -184,9 +165,11 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	struct nouveau_drm *drm = page_to_drm(vmf->page);
 	struct nouveau_dmem *dmem = drm->dmem;
 	struct nouveau_fence *fence;
+	struct nouveau_svmm *svmm;
+	struct page *spage, *dpage;
 	unsigned long src = 0, dst = 0;
 	dma_addr_t dma_addr = 0;
-	vm_fault_t ret;
+	vm_fault_t ret = 0;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
 		.start		= vmf->address,
@@ -207,9 +190,25 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!args.cpages)
 		return 0;
 
-	ret = nouveau_dmem_fault_copy_one(drm, vmf, &args, &dma_addr);
-	if (ret || dst == 0)
+	spage = migrate_pfn_to_page(src);
+	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
+		goto done;
+
+	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
+	if (!dpage)
+		goto done;
+
+	dst = migrate_pfn(page_to_pfn(dpage));
+
+	svmm = spage->zone_device_data;
+	mutex_lock(&svmm->mutex);
+	nouveau_svmm_invalidate(svmm, args.start, args.end);
+	ret = nouveau_dmem_copy_one(drm, spage, dpage, &dma_addr);
+	mutex_unlock(&svmm->mutex);
+	if (ret) {
+		ret = VM_FAULT_SIGBUS;
 		goto done;
+	}
 
 	nouveau_fence_new(dmem->migrate.chan, false, &fence);
 	migrate_vma_pages(&args);
-- 
git-series 0.9.1
