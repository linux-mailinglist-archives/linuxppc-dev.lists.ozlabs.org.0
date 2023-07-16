Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51B754F45
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jul 2023 17:12:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R3pc36BzNz3bwb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 01:12:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R3pbW1YBPz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 01:12:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2D3260D2D;
	Sun, 16 Jul 2023 15:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFB8C433C9;
	Sun, 16 Jul 2023 15:11:58 +0000 (UTC)
Date: Sun, 16 Jul 2023 08:11:56 -0700
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Subject: Re: [PATCH v10 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation/migration
Message-ID: <ZLQIvPpKvjWppc59@arm.com>
References: <20230710083914.18336-1-yangyicong@huawei.com>
 <20230710083914.18336-5-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710083914.18336-5-yangyicong@huawei.com>
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
Cc: mark.rutland@arm.com, wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, realmz6@gmail.com, linux-doc@vger.kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, punit.agrawal@bytedance.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, ryan.roberts@arm.com, arnd@arndb.de, anshuman.khandual@arm.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, Jonathan.Cameron@huawei.com, yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org, guojian@oppo.com, xhao@linux.alibaba.com, linux-mips@vger.kernel.org, huzhanyuan@oppo.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 10, 2023 at 04:39:14PM +0800, Yicong Yang wrote:
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 7856c3a3e35a..f0ce8208c57f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -96,6 +96,7 @@ config ARM64
>  	select ARCH_SUPPORTS_NUMA_BALANCING
>  	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
>  	select ARCH_SUPPORTS_PER_VMA_LOCK
> +	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if EXPERT

I don't want EXPERT to turn on a feature that's not selectable by the
user. This would lead to different performance behaviour based on
EXPERT. Just select it unconditionally.

> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 412a3b9a3c25..4bb9cec62e26 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -254,17 +254,23 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
>  	dsb(ish);
>  }
>  
> -static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
> -					 unsigned long uaddr)
> +static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
> +					   unsigned long uaddr)
>  {
>  	unsigned long addr;
>  
>  	dsb(ishst);
> -	addr = __TLBI_VADDR(uaddr, ASID(vma->vm_mm));
> +	addr = __TLBI_VADDR(uaddr, ASID(mm));
>  	__tlbi(vale1is, addr);
>  	__tlbi_user(vale1is, addr);
>  }
>  
> +static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
> +					 unsigned long uaddr)
> +{
> +	return __flush_tlb_page_nosync(vma->vm_mm, uaddr);
> +}
> +
>  static inline void flush_tlb_page(struct vm_area_struct *vma,
>  				  unsigned long uaddr)
>  {
> @@ -272,6 +278,42 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
>  	dsb(ish);
>  }
>  
> +#ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH

If it's selected unconditionally, we won't need this #ifdef here.

> +
> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> +{
> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
> +	/*
> +	 * TLB flush deferral is not required on systems, which are affected with

"affected by" and drop the comma before "which".

-- 
Catalin
