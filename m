Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4961475D162
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 20:26:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6ygk1YRRz3dKQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 04:26:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6yfd31Wzz3cZw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 04:25:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9F0161D93;
	Fri, 21 Jul 2023 18:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502ECC433CA;
	Fri, 21 Jul 2023 18:25:39 +0000 (UTC)
Date: Fri, 21 Jul 2023 19:25:38 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 5/5] mmu_notifiers: Rename invalidate_range notifier
Message-ID: <ZLrNotPTZSnmtz7b@arm.com>
References: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
 <3cbd2a644d56d503b47cfc35868d547f924f880e.1689842332.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cbd2a644d56d503b47cfc35868d547f924f880e.1689842332.git-series.apopple@nvidia.com>
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
Cc: zhi.wang.linux@gmail.com, kvm@vger.kernel.org, linux-mm@kvack.org, will@kernel.org, x86@kernel.org, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, robin.murphy@arm.com, npiggin@gmail.com, linux-arm-kernel@lists.infradead.org, sj@kernel.org, seanjc@google.com, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 20, 2023 at 06:39:27PM +1000, Alistair Popple wrote:
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index a99349d..84a05a0 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -253,7 +253,7 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
>  	__tlbi(aside1is, asid);
>  	__tlbi_user(aside1is, asid);
>  	dsb(ish);
> -	mmu_notifier_invalidate_range(mm, 0, -1UL);
> +	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
>  }
>  
>  static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
> @@ -265,7 +265,7 @@ static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>  	addr = __TLBI_VADDR(uaddr, ASID(mm));
>  	__tlbi(vale1is, addr);
>  	__tlbi_user(vale1is, addr);
> -	mmu_notifier_invalidate_range(mm, uaddr & PAGE_MASK,
> +	mmu_notifier_arch_invalidate_secondary_tlbs(mm, uaddr & PAGE_MASK,
>  						(uaddr & PAGE_MASK) + PAGE_SIZE);
>  }
>  
> @@ -400,7 +400,7 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
>  		scale++;
>  	}
>  	dsb(ish);
> -	mmu_notifier_invalidate_range(vma->vm_mm, start, end);
> +	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, start, end);
>  }

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
