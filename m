Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E98758BEA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 05:16:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5LYv4HKrz3cDw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 13:16:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 629 seconds by postgrey-1.37 at boromir; Wed, 19 Jul 2023 13:15:34 AEST
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5LYL1vbxz30PQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 13:15:32 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98A182F4;
	Tue, 18 Jul 2023 20:05:11 -0700 (PDT)
Received: from [10.162.40.17] (unknown [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BE363F67D;
	Tue, 18 Jul 2023 20:04:22 -0700 (PDT)
Message-ID: <45fadf89-27ec-07a9-746a-e5d14aba62a3@arm.com>
Date: Wed, 19 Jul 2023 08:34:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/4] Invalidate secondary IOMMU TLB on permission upgrade
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
References: <cover.b4454f7f3d0afbfe1965e8026823cd50a42954b4.1689666760.git-series.apopple@nvidia.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <cover.b4454f7f3d0afbfe1965e8026823cd50a42954b4.1689666760.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: kevin.tian@intel.com, x86@kernel.org, ajd@linux.ibm.com, kvm@vger.kernel.org, linux-mm@kvack.org, catalin.marinas@arm.com, seanjc@google.com, will@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, zhi.wang.linux@gmail.com, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, jhubbard@nvidia.com, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/18/23 13:26, Alistair Popple wrote:
> The main change is to move secondary TLB invalidation mmu notifier
> callbacks into the architecture specific TLB flushing functions. This
> makes secondary TLB invalidation mostly match CPU invalidation while
> still allowing efficient range based invalidations based on the
> existing TLB batching code.
> 
> ==========
> Background
> ==========
> 
> The arm64 architecture specifies TLB permission bits may be cached and
> therefore the TLB must be invalidated during permission upgrades. For
> the CPU this currently occurs in the architecture specific
> ptep_set_access_flags() routine.
> 
> Secondary TLBs such as implemented by the SMMU IOMMU match the CPU
> architecture specification and may also cache permission bits and
> require the same TLB invalidations. This may be achieved in one of two
> ways.
> 
> Some SMMU implementations implement broadcast TLB maintenance
> (BTM). This snoops CPU TLB invalidates and will invalidate any
> secondary TLB at the same time as the CPU. However implementations are
> not required to implement BTM.

So, the implementations with BTM do not even need a MMU notifier callback
for secondary TLB invalidation purpose ? Perhaps mmu_notifier_register()
could also be skipped for such cases i.e with ARM_SMMU_FEAT_BTM enabled ?

BTW, dont see ARM_SMMU_FEAT_BTM being added as a feature any where during
the probe i.e arm_smmu_device_hw_probe().

> 
> Implementations without BTM rely on mmu notifier callbacks to send
> explicit TLB invalidation commands to invalidate SMMU TLB. Therefore
> either generic kernel code or architecture specific code needs to call
> the mmu notifier on permission upgrade.
> 
> Currently that doesn't happen so devices will fault indefinitely when
> writing to a PTE that was previously read-only as nothing invalidates
> the SMMU TLB.

Why does not the current SMMU MMU notifier intercept all invalidation from
generic MM code and do the required secondary TLB invalidation ? Is there
a timing issue involved here ? Secondary TLB invalidation does happen but
after the damage has been done ? Could you please point us to a real world
bug report taking such indefinite faults as mentioned above ?

> 
> ========
> Solution
> ========
> 
> To fix this the series first renames the .invalidate_range() callback
> to .arch_invalidate_secondary_tlbs() as suggested by Jason and Sean to
> make it clear this callback is only used for secondary TLBs. That was
> made possible thanks to Sean's series [1] to remove KVM's incorrect
> usage.
> 
> Based on feedback from Jason [2] the proposed solution to the bug is
> to move the calls to mmu_notifier_arch_invalidate_secondary_tlbs()
> closer to the architecture specific TLB invalidation code. This
> ensures the secondary TLB won't miss invalidations, including the
> existing invalidation in the ARM64 code to deal with permission
> upgrade.

ptep_set_access_flags() is the only problematic place where this issue
is being reported ? If yes, why dont fix that instead of moving these
into platform specific callbacks ? OR there are other problematic areas
I might be missing.

> 
> Currently only ARM64, PowerPC and x86 have IOMMU with secondary TLBs
> requiring SW invalidation so the notifier is only called for those
> architectures. It is also not called for invalidation of kernel
> mappings as no secondary IOMMU implementations can access those and
> hence it is not required.
> 
> [1] - https://lore.kernel.org/all/20230602011518.787006-1-seanjc@google.com/
> [2] - https://lore.kernel.org/linux-mm/ZJMR5bw8l+BbzdJ7@ziepe.ca/
> 
> Alistair Popple (4):
>   mm_notifiers: Rename invalidate_range notifier
>   arm64/smmu: Use TLBI ASID when invalidating entire range
>   mmu_notifiers: Call arch_invalidate_secondary_tlbs() when invalidating TLBs
>   mmu_notifiers: Don't invalidate secondary TLBs as part of mmu_notifier_invalidate_range_end()
> 
>  arch/arm64/include/asm/tlbflush.h               |   5 +-
>  arch/powerpc/include/asm/book3s/64/tlbflush.h   |   1 +-
>  arch/powerpc/mm/book3s64/radix_hugetlbpage.c    |   1 +-
>  arch/powerpc/mm/book3s64/radix_tlb.c            |   6 +-
>  arch/x86/mm/tlb.c                               |   3 +-
>  drivers/iommu/amd/iommu_v2.c                    |  10 +-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c |  29 +++--
>  drivers/iommu/intel/svm.c                       |   8 +-
>  drivers/misc/ocxl/link.c                        |   8 +-
>  include/asm-generic/tlb.h                       |   1 +-
>  include/linux/mmu_notifier.h                    | 104 ++++-------------
>  kernel/events/uprobes.c                         |   2 +-
>  mm/huge_memory.c                                |  29 +----
>  mm/hugetlb.c                                    |   8 +-
>  mm/memory.c                                     |   8 +-
>  mm/migrate_device.c                             |   9 +-
>  mm/mmu_notifier.c                               |  47 +++-----
>  mm/rmap.c                                       |  40 +-------
>  18 files changed, 109 insertions(+), 210 deletions(-)
> 
> base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
