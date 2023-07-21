Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8964A75D15E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 20:26:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6ygC3W8Bz3dG8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jul 2023 04:26:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6yfP0z1Zz3cnZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jul 2023 04:25:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 67A2561D7E;
	Fri, 21 Jul 2023 18:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C769C433C9;
	Fri, 21 Jul 2023 18:25:27 +0000 (UTC)
Date: Fri, 21 Jul 2023 19:25:26 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 3/5] mmu_notifiers: Call invalidate_range() when
 invalidating TLBs
Message-ID: <ZLrNlgLZvtubFTiy@arm.com>
References: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
 <86a0bf86394f1765fcbf9890bbabb154ba8dd980.1689842332.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86a0bf86394f1765fcbf9890bbabb154ba8dd980.1689842332.git-series.apopple@nvidia.com>
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
Cc: kevin.tian@intel.com, x86@kernel.org, ajd@linux.ibm.com, kvm@vger.kernel.org, linux-mm@kvack.org, jhubbard@nvidia.com, seanjc@google.com, will@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, zhi.wang.linux@gmail.com, jgg@ziepe.ca, iommu@lists.linux.dev, sj@kernel.org, nicolinc@nvidia.com, fbarrat@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 20, 2023 at 06:39:25PM +1000, Alistair Popple wrote:
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 3456866..a99349d 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -13,6 +13,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/mm_types.h>
>  #include <linux/sched.h>
> +#include <linux/mmu_notifier.h>
>  #include <asm/cputype.h>
>  #include <asm/mmu.h>
>  
> @@ -252,6 +253,7 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
>  	__tlbi(aside1is, asid);
>  	__tlbi_user(aside1is, asid);
>  	dsb(ish);
> +	mmu_notifier_invalidate_range(mm, 0, -1UL);
>  }
>  
>  static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
> @@ -263,6 +265,8 @@ static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>  	addr = __TLBI_VADDR(uaddr, ASID(mm));
>  	__tlbi(vale1is, addr);
>  	__tlbi_user(vale1is, addr);
> +	mmu_notifier_invalidate_range(mm, uaddr & PAGE_MASK,
> +						(uaddr & PAGE_MASK) + PAGE_SIZE);

Nitpick: we have PAGE_ALIGN() for this.

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
