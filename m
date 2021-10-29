Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB5C43F760
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 08:39:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgXpt1HcVz3c7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 17:39:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EQ3QJrSL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.92.82;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=EQ3QJrSL; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgXp44BD6z2xRn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 17:39:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsM8Wbg4P9fGEuoy9/h9FcLR1nTymtVypuMNtRwGBcc+U0uQZtzuu0nZeMW/UkZ1b4zTB/0QlmzHkq9dCJ1UETSZerccdfmWg1n8BcksZ9Tb1TDC0KjNNDhlESbL1ax8HPlBHyCP4cJLrKBIEaqWSYZK7wOHqWdtF+hAEAqWEGxQxBU5E5kwQbZlC/7vLjNNdQFxKtHrPT1fiI1ke+amJn9xKs/41WrE8eJrxz9GqNTEFSb4kluG79WOoCYlhAIwR+FUFDf7/J78M4MnCPp2bKwDgEGM6SZOm4H1vq60Wu7yrkymy4ToIbWY0hBuKYrhmC4a/g571NYATREFXCPZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/rZWz0XZA2pdAYti2nbhxbp0JbgPFZoo6nk7EdU0Xw=;
 b=HhZXT+/vZMlWovYtW5OzSq4qQcE+baosouSHxtQnLb/5so2S1AcHZA8M2sLHqpYZXPyKcFlHHYL24sm9qBMWSpY0cunP+Ja4SZrASnpRWGYpRKr++GrWRW6XmDcZYtat2CIBBZLNgqQ2pgzCHJz+KZUR9VNnDU2NdCbMjNAox1MU6KYKglxOAY8EjHMmE1Bh8lfuNz9II+9pbEvo6N45EOKcMWXAv65yqOcDkhxF4AGPkY8ELjdsPk2GmCTkZPMZl8jlmvVZQ3+RuyVkHXxX/CKikxdSbld1FtsdyQVhgh2AYV3MvsK51qvFHbV89qux4ujqFQS7LsziovntCmzaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/rZWz0XZA2pdAYti2nbhxbp0JbgPFZoo6nk7EdU0Xw=;
 b=EQ3QJrSLTFA+A0Q6lr+WDgfZ0PP4FeodrbvjcWmh9eB4m6r/Sh+g3HuS4HKnsyULM0IkFfJOrDB1os5uTMXiLGPZF5OwF/wAPwb3zICTErW1Fq9lq/ZRdtIpCSrGXOFFLa80gAJgjkpE9b+BVtP/di5TINjHg/+M2pB3zFyLzYCAutRcbw0l263rd7gTusrlv7k593YOIE0G1FTHcn//PQCDve6tIGSjasrCdUM4VTvtSW1R8zVfYPQB8f40gKbSlyiMdCPK4BHwlXMgDeEHTcB6wnh4hljTgiUFlZclEasCWFxW8eAAk2mLi7wnPmKtwzmJVhpHMxM+etq+xkJlXA==
Received: from CO1PR15CA0086.namprd15.prod.outlook.com (2603:10b6:101:20::30)
 by DM6PR12MB3417.namprd12.prod.outlook.com (2603:10b6:5:118::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 29 Oct
 2021 06:38:45 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:20:cafe::98) by CO1PR15CA0086.outlook.office365.com
 (2603:10b6:101:20::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Fri, 29 Oct 2021 06:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 06:38:45 +0000
Received: from nvdebian.localnet (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 29 Oct
 2021 06:38:40 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>, Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH] mm/migrate.c: Remove MIGRATE_PFN_LOCKED
Date: Fri, 29 Oct 2021 17:38:38 +1100
Message-ID: <2040710.b8zS7i3PnK@nvdebian>
In-Reply-To: <130148f1-2676-16e2-b2a5-bf21f2a5481a@amd.com>
References: <20211025041608.289017-1-apopple@nvidia.com>
 <2096706.TdNOD7Y7u4@nvdebian> <130148f1-2676-16e2-b2a5-bf21f2a5481a@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 293cd915-d408-4d65-1bc3-08d99aa6c18b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3417:
X-Microsoft-Antispam-PRVS: <DM6PR12MB34174072F8B90CA9D8427F97DF879@DM6PR12MB3417.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ct/xMQUcbLVm76JCLL2Wk1/0OR+tz88rSlVmWhIewhY2a7RmiHOMJpZm7tjYJqVoXXjVXI0nLb5A5iRIWzUsGQMEKSASvH9Wf+kUrxJKsFgTpFJ7LRDJrv04clok838zq/8SnIgZwfiOg1L/YJ7oE9zpby0TqbDXNIfa1bp35xGqXUe6AaSg+981xf/tIcmVgHhIaLaNvDa7KaNh3tH+AoiDlNsi52TLZQXArkqC8EFl5RWQpcltmVyUjGMUGNltspX3gb3+zWpnEN4LXFLRGCOUP6YOWdE8wLSLtrRi1oLpBg2lZdhUxpZxlNqGdt7U+ZuXIHmkZATL/THBRymQ31F9Q/qZjrnDALnDr0MP88OSVYWBvADE+vRR2IjSMGK5HSwHsEpAYotUNELrlg9ZX1ovA3zqBp6cozHBP2OTv2k3vkFfxAK3Mke9gkc6ESMSAgoLWkSWvsf28Lj1sF63eOvnk+pu0AS6VmhqbslkEmdwjdV9PCzHmfKX1UFSS8zYGG1J0LhR6OIKN0GhlhSWxAXtUveWw54BUptqii9k9A32SBP5A9xaPg2RKsl6/AiKKorSbTwfJ4rPTyW8yI0+0kLwVoCPfFqpWlFGjiBqH00qxS1cXyDazijtxPFE5VHTaLLnKri29ULq8izuEInSxl5FP3EMGf51JSQVYjvW3Ky4oMx7sGjRiKvQA6btJ15Uy03i9Yg9zXBzdIys4oDTMHL86KJ797Cx1BzFHDlUX5M=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(70206006)(70586007)(33716001)(8676002)(16526019)(2906002)(356005)(316002)(7416002)(110136005)(83380400001)(82310400003)(30864003)(426003)(54906003)(4326008)(4001150100001)(7636003)(47076005)(9686003)(36860700001)(508600001)(5660300002)(36906005)(336012)(8936002)(9576002)(186003)(26005)(86362001)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 06:38:45.0904 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 293cd915-d408-4d65-1bc3-08d99aa6c18b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3417
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
Cc: rcampbell@nvidia.com, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, jglisse@redhat.com,
 kvm-ppc@vger.kernel.org, ziy@nvidia.com, jhubbard@nvidia.com,
 alexander.deucher@amd.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 bskeggs@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday, 29 October 2021 2:33:31 AM AEDT Felix Kuehling wrote:
> Am 2021-10-27 um 9:42 p.m. schrieb Alistair Popple:
> > On Wednesday, 27 October 2021 3:09:57 AM AEDT Felix Kuehling wrote:
> >> Am 2021-10-25 um 12:16 a.m. schrieb Alistair Popple:
> >>> MIGRATE_PFN_LOCKED is used to indicate to migrate_vma_prepare() that a
> >>> source page was already locked during migrate_vma_collect(). If it
> >>> wasn't then the a second attempt is made to lock the page. However if
> >>> the first attempt failed it's unlikely a second attempt will succeed,
> >>> and the retry adds complexity. So clean this up by removing the retry
> >>> and MIGRATE_PFN_LOCKED flag.
> >>>
> >>> Destination pages are also meant to have the MIGRATE_PFN_LOCKED flag
> >>> set, but nothing actually checks that.
> >>>
> >>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >> It makes sense to me. Do you have any empirical data on how much more
> >> likely migrations are going to fail with this change due to contested
> >> page locks?
> > Thanks Felix. I do not have any empirical data on this but I've mostly seen
> > migrations fail due to the reference count check failing rather than failure to
> > lock the page. Even then it's mostly been due to thrashing on the same page, so
> > I would be surprised if this change made any noticeable difference.
> 
> We have seen more page locking contention on NUMA systems that disappear
> when we disable NUMA balancing. Probably NUMA balancing migrations
> result in the page lock being more contended, which can cause HMM
> migration of some pages to fail.

Yeah, we've found NUMA balancing in general is pretty unhelpful for HMM based
migrations and mappings so have been looking into ways of disabling it for HMM
ranges.

> Also, for migrations to system memory, multiple threads page faulting
> concurrently can cause contention. I was just helping debug such an
> issue. Having migrations to system memory be only partially successful
> is problematic. We'll probably have to implement some retry logic in the
> driver to handle this.

Sounds similar to the problem I was referring to, except in my case I was
seeing contention on the page reference checks due to lots of threads hitting
__migration_entry_wait() at just the wrong time. I am working on a fix for that
that avoids taking the reference at all, however I think retry logic will still
be needed and suspect a driver is probably the best place to implement that.

> Regards,
>   Felix
> 
> 
> >
> >> Either way, the patch is
> >>
> >> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> >>
> >>
> >>> ---
> >>>  Documentation/vm/hmm.rst                 |   2 +-
> >>>  arch/powerpc/kvm/book3s_hv_uvmem.c       |   4 +-
> >>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   2 -
> >>>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |   4 +-
> >>>  include/linux/migrate.h                  |   1 -
> >>>  lib/test_hmm.c                           |   5 +-
> >>>  mm/migrate.c                             | 145 +++++------------------
> >>>  7 files changed, 35 insertions(+), 128 deletions(-)
> >>>
> >>> diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
> >>> index a14c2938e7af..f2a59ed82ed3 100644
> >>> --- a/Documentation/vm/hmm.rst
> >>> +++ b/Documentation/vm/hmm.rst
> >>> @@ -360,7 +360,7 @@ between device driver specific code and shared common code:
> >>>     system memory page, locks the page with ``lock_page()``, and fills in the
> >>>     ``dst`` array entry with::
> >>>  
> >>> -     dst[i] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> >>> +     dst[i] = migrate_pfn(page_to_pfn(dpage));
> >>>  
> >>>     Now that the driver knows that this page is being migrated, it can
> >>>     invalidate device private MMU mappings and copy device private memory
> >>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> >>> index a7061ee3b157..28c436df9935 100644
> >>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> >>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> >>> @@ -560,7 +560,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
> >>>  				  gpa, 0, page_shift);
> >>>  
> >>>  	if (ret == U_SUCCESS)
> >>> -		*mig.dst = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
> >>> +		*mig.dst = migrate_pfn(pfn);
> >>>  	else {
> >>>  		unlock_page(dpage);
> >>>  		__free_page(dpage);
> >>> @@ -774,7 +774,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
> >>>  		}
> >>>  	}
> >>>  
> >>> -	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> >>> +	*mig.dst = migrate_pfn(page_to_pfn(dpage));
> >>>  	migrate_vma_pages(&mig);
> >>>  out_finalize:
> >>>  	migrate_vma_finalize(&mig);
> >>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> >>> index 4a16e3c257b9..41d9417f182b 100644
> >>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> >>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> >>> @@ -300,7 +300,6 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
> >>>  			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
> >>>  			svm_migrate_get_vram_page(prange, migrate->dst[i]);
> >>>  			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
> >>> -			migrate->dst[i] |= MIGRATE_PFN_LOCKED;
> >>>  			src[i] = dma_map_page(dev, spage, 0, PAGE_SIZE,
> >>>  					      DMA_TO_DEVICE);
> >>>  			r = dma_mapping_error(dev, src[i]);
> >>> @@ -580,7 +579,6 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
> >>>  			      dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
> >>>  
> >>>  		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
> >>> -		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
> >>>  		j++;
> >>>  	}
> >>>  
> >>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> >>> index 92987daa5e17..3828aafd3ac4 100644
> >>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> >>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> >>> @@ -166,7 +166,7 @@ static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
> >>>  		goto error_dma_unmap;
> >>>  	mutex_unlock(&svmm->mutex);
> >>>  
> >>> -	args->dst[0] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> >>> +	args->dst[0] = migrate_pfn(page_to_pfn(dpage));
> >>>  	return 0;
> >>>  
> >>>  error_dma_unmap:
> >>> @@ -602,7 +602,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
> >>>  		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
> >>>  	if (src & MIGRATE_PFN_WRITE)
> >>>  		*pfn |= NVIF_VMM_PFNMAP_V0_W;
> >>> -	return migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> >>> +	return migrate_pfn(page_to_pfn(dpage));
> >>>  
> >>>  out_dma_unmap:
> >>>  	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
> >>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> >>> index c8077e936691..479b861ae490 100644
> >>> --- a/include/linux/migrate.h
> >>> +++ b/include/linux/migrate.h
> >>> @@ -119,7 +119,6 @@ static inline int migrate_misplaced_page(struct page *page,
> >>>   */
> >>>  #define MIGRATE_PFN_VALID	(1UL << 0)
> >>>  #define MIGRATE_PFN_MIGRATE	(1UL << 1)
> >>> -#define MIGRATE_PFN_LOCKED	(1UL << 2)
> >>>  #define MIGRATE_PFN_WRITE	(1UL << 3)
> >>>  #define MIGRATE_PFN_SHIFT	6
> >>>  
> >>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> >>> index c259842f6d44..e2ce8f9b7605 100644
> >>> --- a/lib/test_hmm.c
> >>> +++ b/lib/test_hmm.c
> >>> @@ -613,8 +613,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
> >>>  		 */
> >>>  		rpage->zone_device_data = dmirror;
> >>>  
> >>> -		*dst = migrate_pfn(page_to_pfn(dpage)) |
> >>> -			    MIGRATE_PFN_LOCKED;
> >>> +		*dst = migrate_pfn(page_to_pfn(dpage));
> >>>  		if ((*src & MIGRATE_PFN_WRITE) ||
> >>>  		    (!spage && args->vma->vm_flags & VM_WRITE))
> >>>  			*dst |= MIGRATE_PFN_WRITE;
> >>> @@ -1137,7 +1136,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
> >>>  		lock_page(dpage);
> >>>  		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
> >>>  		copy_highpage(dpage, spage);
> >>> -		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> >>> +		*dst = migrate_pfn(page_to_pfn(dpage));
> >>>  		if (*src & MIGRATE_PFN_WRITE)
> >>>  			*dst |= MIGRATE_PFN_WRITE;
> >>>  	}
> >>> diff --git a/mm/migrate.c b/mm/migrate.c
> >>> index a6a7743ee98f..915e969811d0 100644
> >>> --- a/mm/migrate.c
> >>> +++ b/mm/migrate.c
> >>> @@ -2369,7 +2369,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >>>  		 * can't be dropped from it).
> >>>  		 */
> >>>  		get_page(page);
> >>> -		migrate->cpages++;
> >>>  
> >>>  		/*
> >>>  		 * Optimize for the common case where page is only mapped once
> >>> @@ -2379,7 +2378,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >>>  		if (trylock_page(page)) {
> >>>  			pte_t swp_pte;
> >>>  
> >>> -			mpfn |= MIGRATE_PFN_LOCKED;
> >>> +			migrate->cpages++;
> >>>  			ptep_get_and_clear(mm, addr, ptep);
> >>>  
> >>>  			/* Setup special migration page table entry */
> >>> @@ -2413,6 +2412,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >>>  
> >>>  			if (pte_present(pte))
> >>>  				unmapped++;
> >>> +		} else {
> >>> +			put_page(page);
> >>> +			mpfn = 0;
> >>>  		}
> >>>  
> >>>  next:
> >>> @@ -2517,15 +2519,17 @@ static bool migrate_vma_check_page(struct page *page)
> >>>  }
> >>>  
> >>>  /*
> >>> - * migrate_vma_prepare() - lock pages and isolate them from the lru
> >>> + * migrate_vma_unmap() - replace page mapping with special migration pte entry
> >>>   * @migrate: migrate struct containing all migration information
> >>>   *
> >>> - * This locks pages that have been collected by migrate_vma_collect(). Once each
> >>> - * page is locked it is isolated from the lru (for non-device pages). Finally,
> >>> - * the ref taken by migrate_vma_collect() is dropped, as locked pages cannot be
> >>> - * migrated by concurrent kernel threads.
> >>> + * Isolate pages from the LRU and replace mappings (CPU page table pte) with a
> >>> + * special migration pte entry and check if it has been pinned. Pinned pages are
> >>> + * restored because we cannot migrate them.
> >>> + *
> >>> + * This is the last step before we call the device driver callback to allocate
> >>> + * destination memory and copy contents of original page over to new page.
> >>>   */
> >>> -static void migrate_vma_prepare(struct migrate_vma *migrate)
> >>> +static void migrate_vma_unmap(struct migrate_vma *migrate)
> >>>  {
> >>>  	const unsigned long npages = migrate->npages;
> >>>  	const unsigned long start = migrate->start;
> >>> @@ -2534,32 +2538,12 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
> >>>  
> >>>  	lru_add_drain();
> >>>  
> >>> -	for (i = 0; (i < npages) && migrate->cpages; i++) {
> >>> +	for (i = 0; i < npages; i++) {
> >>>  		struct page *page = migrate_pfn_to_page(migrate->src[i]);
> >>> -		bool remap = true;
> >>>  
> >>>  		if (!page)
> >>>  			continue;
> >>>  
> >>> -		if (!(migrate->src[i] & MIGRATE_PFN_LOCKED)) {
> >>> -			/*
> >>> -			 * Because we are migrating several pages there can be
> >>> -			 * a deadlock between 2 concurrent migration where each
> >>> -			 * are waiting on each other page lock.
> >>> -			 *
> >>> -			 * Make migrate_vma() a best effort thing and backoff
> >>> -			 * for any page we can not lock right away.
> >>> -			 */
> >>> -			if (!trylock_page(page)) {
> >>> -				migrate->src[i] = 0;
> >>> -				migrate->cpages--;
> >>> -				put_page(page);
> >>> -				continue;
> >>> -			}
> >>> -			remap = false;
> >>> -			migrate->src[i] |= MIGRATE_PFN_LOCKED;
> >>> -		}
> >>> -
> >>>  		/* ZONE_DEVICE pages are not on LRU */
> >>>  		if (!is_zone_device_page(page)) {
> >>>  			if (!PageLRU(page) && allow_drain) {
> >>> @@ -2569,16 +2553,9 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
> >>>  			}
> >>>  
> >>>  			if (isolate_lru_page(page)) {
> >>> -				if (remap) {
> >>> -					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> >>> -					migrate->cpages--;
> >>> -					restore++;
> >>> -				} else {
> >>> -					migrate->src[i] = 0;
> >>> -					unlock_page(page);
> >>> -					migrate->cpages--;
> >>> -					put_page(page);
> >>> -				}
> >>> +				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> >>> +				migrate->cpages--;
> >>> +				restore++;
> >>>  				continue;
> >>>  			}
> >>>  
> >>> @@ -2586,80 +2563,20 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
> >>>  			put_page(page);
> >>>  		}
> >>>  
> >>> -		if (!migrate_vma_check_page(page)) {
> >>> -			if (remap) {
> >>> -				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> >>> -				migrate->cpages--;
> >>> -				restore++;
> >>> -
> >>> -				if (!is_zone_device_page(page)) {
> >>> -					get_page(page);
> >>> -					putback_lru_page(page);
> >>> -				}
> >>> -			} else {
> >>> -				migrate->src[i] = 0;
> >>> -				unlock_page(page);
> >>> -				migrate->cpages--;
> >>> +		if (page_mapped(page))
> >>> +			try_to_migrate(page, 0);
> >>>  
> >>> -				if (!is_zone_device_page(page))
> >>> -					putback_lru_page(page);
> >>> -				else
> >>> -					put_page(page);
> >>> +		if (page_mapped(page) || !migrate_vma_check_page(page)) {
> >>> +			if (!is_zone_device_page(page)) {
> >>> +				get_page(page);
> >>> +				putback_lru_page(page);
> >>>  			}
> >>> -		}
> >>> -	}
> >>> -
> >>> -	for (i = 0, addr = start; i < npages && restore; i++, addr += PAGE_SIZE) {
> >>> -		struct page *page = migrate_pfn_to_page(migrate->src[i]);
> >>> -
> >>> -		if (!page || (migrate->src[i] & MIGRATE_PFN_MIGRATE))
> >>> -			continue;
> >>>  
> >>> -		remove_migration_pte(page, migrate->vma, addr, page);
> >>> -
> >>> -		migrate->src[i] = 0;
> >>> -		unlock_page(page);
> >>> -		put_page(page);
> >>> -		restore--;
> >>> -	}
> >>> -}
> >>> -
> >>> -/*
> >>> - * migrate_vma_unmap() - replace page mapping with special migration pte entry
> >>> - * @migrate: migrate struct containing all migration information
> >>> - *
> >>> - * Replace page mapping (CPU page table pte) with a special migration pte entry
> >>> - * and check again if it has been pinned. Pinned pages are restored because we
> >>> - * cannot migrate them.
> >>> - *
> >>> - * This is the last step before we call the device driver callback to allocate
> >>> - * destination memory and copy contents of original page over to new page.
> >>> - */
> >>> -static void migrate_vma_unmap(struct migrate_vma *migrate)
> >>> -{
> >>> -	const unsigned long npages = migrate->npages;
> >>> -	const unsigned long start = migrate->start;
> >>> -	unsigned long addr, i, restore = 0;
> >>> -
> >>> -	for (i = 0; i < npages; i++) {
> >>> -		struct page *page = migrate_pfn_to_page(migrate->src[i]);
> >>> -
> >>> -		if (!page || !(migrate->src[i] & MIGRATE_PFN_MIGRATE))
> >>> +			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> >>> +			migrate->cpages--;
> >>> +			restore++;
> >>>  			continue;
> >>> -
> >>> -		if (page_mapped(page)) {
> >>> -			try_to_migrate(page, 0);
> >>> -			if (page_mapped(page))
> >>> -				goto restore;
> >>>  		}
> >>> -
> >>> -		if (migrate_vma_check_page(page))
> >>> -			continue;
> >>> -
> >>> -restore:
> >>> -		migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
> >>> -		migrate->cpages--;
> >>> -		restore++;
> >>>  	}
> >>>  
> >>>  	for (addr = start, i = 0; i < npages && restore; addr += PAGE_SIZE, i++) {
> >>> @@ -2672,12 +2589,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
> >>>  
> >>>  		migrate->src[i] = 0;
> >>>  		unlock_page(page);
> >>> +		put_page(page);
> >>>  		restore--;
> >>> -
> >>> -		if (is_zone_device_page(page))
> >>> -			put_page(page);
> >>> -		else
> >>> -			putback_lru_page(page);
> >>>  	}
> >>>  }
> >>>  
> >>> @@ -2700,8 +2613,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
> >>>   * it for all those entries (ie with MIGRATE_PFN_VALID and MIGRATE_PFN_MIGRATE
> >>>   * flag set).  Once these are allocated and copied, the caller must update each
> >>>   * corresponding entry in the dst array with the pfn value of the destination
> >>> - * page and with the MIGRATE_PFN_VALID and MIGRATE_PFN_LOCKED flags set
> >>> - * (destination pages must have their struct pages locked, via lock_page()).
> >>> + * page and with MIGRATE_PFN_VALID. Destination pages must be locked via
> >>> + * lock_page().
> >>>   *
> >>>   * Note that the caller does not have to migrate all the pages that are marked
> >>>   * with MIGRATE_PFN_MIGRATE flag in src array unless this is a migration from
> >>> @@ -2770,8 +2683,6 @@ int migrate_vma_setup(struct migrate_vma *args)
> >>>  
> >>>  	migrate_vma_collect(args);
> >>>  
> >>> -	if (args->cpages)
> >>> -		migrate_vma_prepare(args);
> >>>  	if (args->cpages)
> >>>  		migrate_vma_unmap(args);
> >>>  
> >
> >
> 




