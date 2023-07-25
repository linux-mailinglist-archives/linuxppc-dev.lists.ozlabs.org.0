Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E644C7606D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 05:42:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=C+5P9aFT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R92t15zPyz30Pp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 13:42:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=C+5P9aFT;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R92s570g5z2yVl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 13:42:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1690256521;
	bh=fqZhhu1PD0i+4g0TKatkfYBNa6Ta8n6gN3J4CmEr6Ls=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=C+5P9aFTM3Wjbzg0OpyrP37MMtgmILxrNCL0SBekDUGnLmL2hbYoY/Whcme+sowb+
	 jj0g8pEh3Ja+StlLshqWdLwAovENk3HP9UoEWOZg5dYPNwU82WAsrEYjqFeIQeIe/Q
	 aWyqJDMnour5OZE732UMTJFRgFodBjF+n6U9w/9phMH2/C6BChsF7G9XJJtu0dFlj8
	 hjM9emqPQqJJDDkxyaLgOk1nc8xDUCmEqzoXxwIw86tbWobOCe5SbyOHqATQBKlgxl
	 aXy3n1WqIiGtc2/Z2uFQC5qdhp/sG1INDLRVaLZ5lkrlMPTpl+l8bbtjUNgJ1GbqDQ
	 jqtHWF6biKMbg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R92s426wJz4wxy;
	Tue, 25 Jul 2023 13:42:00 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
Subject: Re: [PATCH v2 3/5] mmu_notifiers: Call invalidate_range() when
 invalidating TLBs
In-Reply-To: <8f293bb51a423afa71ddc3ba46e9f323ee9ffbc7.1689768831.git-series.apopple@nvidia.com>
References: <cover.de78568883814904b78add6317c263bf5bc20234.1689768831.git-series.apopple@nvidia.com>
 <8f293bb51a423afa71ddc3ba46e9f323ee9ffbc7.1689768831.git-series.apopple@nvidia.com>
Date: Tue, 25 Jul 2023 13:41:59 +1000
Message-ID: <87y1j4y7w8.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Alistair Popple <apopple@nvidia.com>, kevin.tian@intel.com, x86@kernel.org, ajd@linux.ibm.com, kvm@vger.kernel.org, linux-mm@kvack.org, catalin.marinas@arm.com, seanjc@google.com, will@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, zhi.wang.linux@gmail.com, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, jhubbard@nvidia.com, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alistair Popple <apopple@nvidia.com> writes:
> The invalidate_range() is going to become an architecture specific mmu
> notifier used to keep the TLB of secondary MMUs such as an IOMMU in
> sync with the CPU page tables. Currently it is called from separate
> code paths to the main CPU TLB invalidations. This can lead to a
> secondary TLB not getting invalidated when required and makes it hard
> to reason about when exactly the secondary TLB is invalidated.
>
> To fix this move the notifier call to the architecture specific TLB
> maintenance functions for architectures that have secondary MMUs
> requiring explicit software invalidations.
>
> This fixes a SMMU bug on ARM64. On ARM64 PTE permission upgrades
> require a TLB invalidation. This invalidation is done by the
> architecutre specific ptep_set_access_flags() which calls
  ^
  architecture
  
> flush_tlb_page() if required. However this doesn't call the notifier
> resulting in infinite faults being generated by devices using the SMMU
> if it has previously cached a read-only PTE in it's TLB.
>
> Moving the invalidations into the TLB invalidation functions ensures
> all invalidations happen at the same time as the CPU invalidation. The
> architecture specific flush_tlb_all() routines do not call the
> notifier as none of the IOMMUs require this.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> 
...

> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
> index 0bd4866..9724b26 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -752,6 +752,8 @@ void radix__local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmadd
>  		return radix__local_flush_hugetlb_page(vma, vmaddr);
>  #endif
>  	radix__local_flush_tlb_page_psize(vma->vm_mm, vmaddr, mmu_virtual_psize);
> +	mmu_notifier_invalidate_range(vma->vm_mm, vmaddr,
> +						vmaddr + mmu_virtual_psize);
>  }
>  EXPORT_SYMBOL(radix__local_flush_tlb_page);

I think we can skip calling the notifier there? It's explicitly a local flush.

cheers
