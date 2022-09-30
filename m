Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE785F0206
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 02:57:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdsJX3hwbz3cDk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 10:57:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mpJrQTCq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.96.71; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mpJrQTCq;
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2071.outbound.protection.outlook.com [40.107.96.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdsHm6MGBz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 10:56:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DW0eqn/xcoEM4h43FGVZjZ9h/nHEggtJWo/hvzMdvn2dzZmc4vZwza24wCC20+vjYvKz8hrMUYwhYWWgkc7xtY/W792GZJyb9fZ0sDQv8UIKY8ouzlpZqO8NU0lfCj9HqnEQN0ioQZ8rH8gASeqI990ntYzwzwFUx1FOU53/VkvEmIWHodslEhxQBxidhn/Z61WQZHyCIPRyWyk9/0qs+WvJWyqZM1mH7HYDgdys4Nfo2MYyPSQ31YsL73n6Qn/SpcAI7HuTew5smIe8GgU0D0FKXzVploxnr9zRlLoJGErsS+7gfw4nAvGcF9c29wNODkqV//qtQY8fE6QyYHpgNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhNjOAYdX4AeTNCo/VdGhg15s3rmytOa7Uy22mbkuxQ=;
 b=M7QLtYis+k8fLPZ4iM88MTvU10kvElZiYchkD25QoeadFDm/PrYMwJpEc6dvPnsAuOqBNfYr/81xhY+HlE1LcIOBbaFgTOOVpTHy3s9blxFlZnCeMdW7D9eq7ofrLw+xnFumDZkazGjw0W3UF5ZcEM5ezl8W6SMfvrWJCVmy5ZO91tnBi0/RGteHeCdvlqSXoumABoSK3RAtd46CCpwH+JFWcWh49mnC+7QTCo7xVLIfyEaeZg1p7O133g01GOdQcJpu0dMX14FbpyWVv6Rdj/XI7HEjJEqRUIrW3W2SG0dHNm5fZyboDOm1n/GG7SkeDdIwX1Lual9VSaVC5DhYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhNjOAYdX4AeTNCo/VdGhg15s3rmytOa7Uy22mbkuxQ=;
 b=mpJrQTCq//eE/PtR3IbG3vGuvobRUo/lTIs8l8u5dV186zG6/TZXk4Lsh4yJUUvMVr4du/PW1VXijyRcIW5p/bJZbCN5b7RbfupvtZ8MpojXllSuYw/2qpRlJomjAZyxRS2gAEc3l1QIwAEonWcdY53A51RSy+dh3ITPN3nKg7zOLnk8bA9MOPgko5kQfImXcnXgiicmpNwA71sHUuyJ0hPeaxJ3AXAcGC4M5moDgNazv5513QnjQl05tCU+B3nPJuOAoYvWPF4XSyHbioYPX8JylPMJXAYIHQntAeR6i6BrbFGGrwanxey+xQJhvt7r3QfEJs2R4U1j++vAAvt+1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CH2PR12MB4938.namprd12.prod.outlook.com (2603:10b6:610:34::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 00:56:12 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5676.020; Fri, 30 Sep 2022
 00:56:12 +0000
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <3d74bb439723c7e46cbe47d1711795308aee4ae3.1664171943.git-series.apopple@nvidia.com>
 <YzG42766BJSxro0R@nvidia.com> <877d1plfrm.fsf@nvdebian.thelocal>
 <6335fd87adc7f_f6c9d29474@dwillia2-xfh.jf.intel.com.notmuch>
User-agent: mu4e 1.8.10; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 2/7] mm: Free device private pages have zero refcount
Date: Fri, 30 Sep 2022 10:45:37 +1000
In-reply-to: <6335fd87adc7f_f6c9d29474@dwillia2-xfh.jf.intel.com.notmuch>
Message-ID: <87k05llly0.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0001.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::6) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|CH2PR12MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: 00362699-70b1-495a-f38d-08daa27e91fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	63D1LEEbOv+a9CsY/lNHQ+4sdj+LUTizAJlGvpP+b2pWCp1JYgkDRKQJJ84j9cSUEkuifsiGAks4+vXRmYjUVNHW0acUqGYs2rfrjQnz0attUy8+KZwXtuYvdBSh676IFd4Tt3BldrmJfhRNUZ9L9GMS3zlyYh6cSu4hOjnPpSrzXQdJXiwiw0EY0DrZ8P/1koWCRMkEgCvmy72cmeLZjv52+NJAuVy3HB/3EFUQeJmPM0Vkm0Mctb1QQes1YSlPi3Reb+3N/Na6QJrFa/QJUfTzjFaA6bQK/mtp7lQEItRydg1O/IqqEvX1sQvs99FhO0EKdY/OZIz8166rsiRjcvcmYLanf+OwoPlGjV9nGx4G2vZQ5WyBIjdg6mUJ4SJaBMTrHCVulaxoTKx9MtIJ+Buo4RgIi+VAJYdZ6YjQeis8b3jJDHjh7TW/+8s4LYc+pWRSqgAfkKq7rUjFHYJy9YOgaDOGogSoVOAHeIFK6hQPlw8PH6RjyilF9SlkmWj3O1jknTv4KzfavtFEfFcGEQxT/G8VFO1O3bpSRz2fdqYtn1mziCLyHbL6ar8OVYEE2VerE/hkyezQCeTeLREZzYJumVvZVMlk/RNZZXE6BUMEkKNu6llSFLKd/u+BKaCZnwhxFcG5yDib93L/l7r87FclCcyyl2Utli9tcXwIHSFx53YO7QBEQOc4ljELtZRGBEBzc3kYnoG7ApXm+Jcy87sKp15dqBiuNTcfC9HE/5M6OvYFEfR/QmcKJQKpHP6kARbHspkCAoBPG3r1pjTT+VxU/B526OLLUASBjYvzwAs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199015)(26005)(6512007)(9686003)(6506007)(6666004)(6486002)(966005)(186003)(478600001)(83380400001)(2906002)(5660300002)(8936002)(86362001)(316002)(6916009)(54906003)(4326008)(66946007)(66556008)(66476007)(7416002)(38100700002)(41300700001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Amewa6wbaAupWgnUuOzDjfh6StrlmcdoU2FpIsN3qoTgqnhjwOQHwvqCSfYm?=
 =?us-ascii?Q?TKqyMJFfLqFPkg2MnD5xFXwiCuRsSsFsfGeqbKSXmVr5s/tDSNJ83dg69J65?=
 =?us-ascii?Q?z/Wzz5CbcbC9QFi5wOu0/GJ2bVLAFwGI0lg7e2yIlEk1CFFL4qMF2AONxcn9?=
 =?us-ascii?Q?Zs+9JFTSqybIoMZnuyPKUmb/0OjnQrgY+QDR2HkSBKRS4c8NUnsfvZggF8uT?=
 =?us-ascii?Q?HxSkkVUvFpZIl3LSudfrMnt+l40dMhIT2oEXtAhWtdYazNgRVajCQmVRbcVO?=
 =?us-ascii?Q?cT1/Ya6+nCK056M15jPoxdcYENe1i6NeiLcMWs//VGfLKA7UJy6mBX1CKEOP?=
 =?us-ascii?Q?2xnTl8+WXnC2T7xRx+ie5T43qLw67oKgKn3Q/wimbgXAEuoS10EWo0AhExvg?=
 =?us-ascii?Q?b22LxdP9pfmAaIskpuHwWRSO4F1u8cqHOK0NXr7FiiS+okKVd4/LTfQl25Vc?=
 =?us-ascii?Q?aDI9db9brrzs5HtUyz9hanXzKflt/Czag1p/4ZFFT2Sn/fGUX56hSLD+mv8I?=
 =?us-ascii?Q?pyfgHd0tobyU7qDHFscftceecBnUdSk1TvFReGEVj27ijeiMiZZ8S+UJ42AM?=
 =?us-ascii?Q?DG1QkdovJR7eHVyowqsjt0EiYBMTQgwjWd5riWt62rh725NKWyMuiqlTl3eG?=
 =?us-ascii?Q?o1oPCXml/8aDy60tK/DKSvhOD7M41/b5bzk0DPgeAeBdSLiv+Q+VqAMexfi7?=
 =?us-ascii?Q?ZIG2Z733D5c0XGj8MpNhs30JowfeD9aHaXoNMm6aX7U9YA5OvB9887QPaFgF?=
 =?us-ascii?Q?t01QHys2Duqno2TM3WgjZVdDJTmFtNE9b8wd6h8D1wXzeRe2zVTK/alS98SD?=
 =?us-ascii?Q?QNA8vGZE8FE+q2sXn9bdFxBboq7jQQ8TIcu+y4IBMYPO6WKMTudNrp1tmZxt?=
 =?us-ascii?Q?IkJxYgu70RwLT+yVjj2eOYNMF5IJod0FE81e0cBiEfsaQoCMQFX/LTyS9qtO?=
 =?us-ascii?Q?NMdno9/Z/1AX2I9L8nLbg1jVysge+ILuCcbh7WnksM7TMa5S6PQlFXDkKqXn?=
 =?us-ascii?Q?czJU7c5a8HP+fdvoo2nnfkxDy/Xv/cXYlZ/IH+sUjusUQf+6FiyGb/mlI+Y/?=
 =?us-ascii?Q?bTcqmxvSPKKoxkh7zCLL68qkJKjKnP0WKKKL2+SdEbkVI5J/HcwbZ458tXYh?=
 =?us-ascii?Q?CwQwmsPJrPqOKtA5XPixhy41e1YTbmq3CVeJMxYf0A2g6lqEzJX3yuOXxg4R?=
 =?us-ascii?Q?Afvh/Au86ZotSg7zMPD+JXI3QyyYrfAxyCUSYZOIzBcFYzgp/MMia2a9AhId?=
 =?us-ascii?Q?jYUGmL0ClExgLs4ibBE0eYMuuAPV2WRloy3ZWOxXkidWBmN+ojUUUCT8I4lr?=
 =?us-ascii?Q?3uQfQFLOOKqY1KIt7AsrKDdIcWil9eUTchvIXiV+O8jhs2OFLVPSlMW0ui/u?=
 =?us-ascii?Q?9skJARgowt5CFgCRXWFZZ/OvjCetE016nAo8xxgYw1nlkNX4fWACDLQm8i8K?=
 =?us-ascii?Q?Dc2ibtr1YuWzoPZGYthR6VTu+GNA+umMY2XvKcn8IToEcIlAQU3p56XfRGgP?=
 =?us-ascii?Q?mZhNYX1c6Lq0BNARIz08oCykoOpt2eEO5bPptF0gmJDQRirm8gOo5tKJhfmg?=
 =?us-ascii?Q?QE1Ka+XkgoAS9MMXGFcgCOn2Xo5nIjG9z7s9aX/b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00362699-70b1-495a-f38d-08daa27e91fe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 00:56:12.6736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8apd8G7vOR/Un6WfgAoNiV0znRJzGWd3OapgTDeAHQ4vUhyhuQwUHTMR4kuSEgHZcSA+sxiabPfEO0fS9PleWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4938
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Dan Williams <dan.j.williams@intel.com> writes:

> Alistair Popple wrote:
>>
>> Jason Gunthorpe <jgg@nvidia.com> writes:
>>
>> > On Mon, Sep 26, 2022 at 04:03:06PM +1000, Alistair Popple wrote:
>> >> Since 27674ef6c73f ("mm: remove the extra ZONE_DEVICE struct page
>> >> refcount") device private pages have no longer had an extra reference
>> >> count when the page is in use. However before handing them back to the
>> >> owning device driver we add an extra reference count such that free
>> >> pages have a reference count of one.
>> >>
>> >> This makes it difficult to tell if a page is free or not because both
>> >> free and in use pages will have a non-zero refcount. Instead we should
>> >> return pages to the drivers page allocator with a zero reference count.
>> >> Kernel code can then safely use kernel functions such as
>> >> get_page_unless_zero().
>> >>
>> >> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> >> ---
>> >>  arch/powerpc/kvm/book3s_hv_uvmem.c       | 1 +
>> >>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 1 +
>> >>  drivers/gpu/drm/nouveau/nouveau_dmem.c   | 1 +
>> >>  lib/test_hmm.c                           | 1 +
>> >>  mm/memremap.c                            | 5 -----
>> >>  mm/page_alloc.c                          | 6 ++++++
>> >>  6 files changed, 10 insertions(+), 5 deletions(-)
>> >
>> > I think this is a great idea, but I'm surprised no dax stuff is
>> > touched here?
>>
>> free_zone_device_page() shouldn't be called for pgmap->type ==
>> MEMORY_DEVICE_FS_DAX so I don't think we should have to worry about DAX
>> there. Except that the folio code looks like it might have introduced a
>> bug. AFAICT put_page() always calls
>> put_devmap_managed_page(&folio->page) but folio_put() does not (although
>> folios_put() does!). So it seems folio_put() won't end up calling
>> __put_devmap_managed_page_refs() as I think it should.
>>
>> I think you're right about the change to __init_zone_device_page() - I
>> should limit it to DEVICE_PRIVATE/COHERENT pages only. But I need to
>> look at Dan's patch series more closely as I suspect it might be better
>> to rebase this patch on top of that.
>
> Apologies for the delay I was travelling the past few days. Yes, I think
> this patch slots in nicely to avoid the introduction of an init_mode
> [1]:
>
> https://lore.kernel.org/nvdimm/166329940343.2786261.6047770378829215962.stgit@dwillia2-xfh.jf.intel.com/
>
> Mind if I steal it into my series?

No problem, although I notice Andrew has already merged it into
mm-unstable. If you end up rebasing your series on top of mine I think
all that's needed is a patch somewhere in your series to drop the
various `if (pgmap->type == MEMORY_DEVICE_*)` I added to (hopefully)
avoid breaking DAX. Assuming DAX takes a pagemap reference on struct
page allocation something like below.

---

diff --git a/mm/memremap.c b/mm/memremap.c
index 421bec3a29ee..da1a0e0abb8b 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -507,15 +507,7 @@ void free_zone_device_page(struct page *page)
 	page->mapping = NULL;
 	page->pgmap->ops->page_free(page);

-	if (page->pgmap->type != MEMORY_DEVICE_PRIVATE &&
-	    page->pgmap->type != MEMORY_DEVICE_COHERENT)
-		/*
-		 * Reset the page count to 1 to prepare for handing out the page
-		 * again.
-		 */
-		set_page_count(page, 1);
-	else
-		put_dev_pagemap(page->pgmap);
+	put_dev_pagemap(page->pgmap);
 }

 void zone_device_page_init(struct page *page)
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 014dbdf54d62..3e5ff06700ca 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6816,9 +6816,7 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
 	 * ZONE_DEVICE pages are released directly to the driver page allocator
 	 * which will set the page count to 1 when allocating the page.
 	 */
-	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
-	    pgmap->type == MEMORY_DEVICE_COHERENT)
-		set_page_count(page, 0);
+	set_page_count(page, 0);
 }

 /*
