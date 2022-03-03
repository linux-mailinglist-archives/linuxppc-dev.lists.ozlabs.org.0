Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C254CC140
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 16:29:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8ZfK24nCz3cfY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 02:29:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=cmarinas@kernel.org;
 receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8Zdr1rXQz3byX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Mar 2022 02:29:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 298DAB8260A;
 Thu,  3 Mar 2022 15:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335A5C340F0;
 Thu,  3 Mar 2022 15:28:54 +0000 (UTC)
Date: Thu, 3 Mar 2022 15:28:50 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V3 05/30] arm64/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Message-ID: <YiDessYDSt060Euc@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-6-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646045273-9343-6-git-send-email-anshuman.khandual@arm.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, geert@linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Anshuman,

On Mon, Feb 28, 2022 at 04:17:28PM +0530, Anshuman Khandual wrote:
> +static inline pgprot_t __vm_get_page_prot(unsigned long vm_flags)
> +{
> +	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
> +	case VM_NONE:
> +		return PAGE_NONE;
> +	case VM_READ:
> +	case VM_WRITE:
> +	case VM_WRITE | VM_READ:
> +		return PAGE_READONLY;
> +	case VM_EXEC:
> +		return PAGE_EXECONLY;
> +	case VM_EXEC | VM_READ:
> +	case VM_EXEC | VM_WRITE:
> +	case VM_EXEC | VM_WRITE | VM_READ:
> +		return PAGE_READONLY_EXEC;
> +	case VM_SHARED:
> +		return PAGE_NONE;
> +	case VM_SHARED | VM_READ:
> +		return PAGE_READONLY;
> +	case VM_SHARED | VM_WRITE:
> +	case VM_SHARED | VM_WRITE | VM_READ:
> +		return PAGE_SHARED;
> +	case VM_SHARED | VM_EXEC:
> +		return PAGE_EXECONLY;
> +	case VM_SHARED | VM_EXEC | VM_READ:
> +		return PAGE_READONLY_EXEC;
> +	case VM_SHARED | VM_EXEC | VM_WRITE:
> +	case VM_SHARED | VM_EXEC | VM_WRITE | VM_READ:
> +		return PAGE_SHARED_EXEC;
> +	default:
> +		BUILD_BUG();
> +	}
> +}

I'd say ack for trying to get of the extra arch_vm_get_page_prot() and
arch_filter_pgprot() but, TBH, I'm not so keen on the outcome. I haven't
built the code to see what's generated but I suspect it's no significant
improvement. As for the code readability, the arm64 parts don't look
much better either. The only advantage with this patch is that all
functions have been moved under arch/arm64.

I'd keep most architectures that don't have own arch_vm_get_page_prot()
or arch_filter_pgprot() unchanged and with a generic protection_map[]
array. For architectures that need fancier stuff, add a
CONFIG_ARCH_HAS_VM_GET_PAGE_PROT (as you do) and allow them to define
vm_get_page_prot() while getting rid of arch_vm_get_page_prot() and
arch_filter_pgprot(). I think you could also duplicate protection_map[]
for architectures with own vm_get_page_prot() (make it static) and
#ifdef it out in mm/mmap.c.

If later you have more complex needs or a switch statement generates
better code, go for it, but for this series I'd keep things simple, only
focus on getting rid of arch_vm_get_page_prot() and
arch_filter_pgprot().

If I grep'ed correctly, there are only 4 architectures that have own
arch_vm_get_page_prot() (arm64, powerpc, sparc, x86) and 2 that have own
arch_filter_pgprot() (arm64, x86). Try to only change these for the time
being, together with the other generic mm cleanups you have in this
series. I think there are a couple more that touch protection_map[]
(arm, m68k). You can leave the generic protection_map[] global if the
arch does not select ARCH_HAS_VM_GET_PAGE_PROT.

> +static pgprot_t arm64_arch_filter_pgprot(pgprot_t prot)
> +{
> +	if (cpus_have_const_cap(ARM64_HAS_EPAN))
> +		return prot;
> +
> +	if (pgprot_val(prot) != pgprot_val(PAGE_EXECONLY))
> +		return prot;
> +
> +	return PAGE_READONLY_EXEC;
> +}
> +
> +static pgprot_t arm64_arch_vm_get_page_prot(unsigned long vm_flags)
> +{
> +	pteval_t prot = 0;
> +
> +	if (vm_flags & VM_ARM64_BTI)
> +		prot |= PTE_GP;
> +
> +	/*
> +	 * There are two conditions required for returning a Normal Tagged
> +	 * memory type: (1) the user requested it via PROT_MTE passed to
> +	 * mmap() or mprotect() and (2) the corresponding vma supports MTE. We
> +	 * register (1) as VM_MTE in the vma->vm_flags and (2) as
> +	 * VM_MTE_ALLOWED. Note that the latter can only be set during the
> +	 * mmap() call since mprotect() does not accept MAP_* flags.
> +	 * Checking for VM_MTE only is sufficient since arch_validate_flags()
> +	 * does not permit (VM_MTE & !VM_MTE_ALLOWED).
> +	 */
> +	if (vm_flags & VM_MTE)
> +		prot |= PTE_ATTRINDX(MT_NORMAL_TAGGED);
> +
> +	return __pgprot(prot);
> +}
> +
> +pgprot_t vm_get_page_prot(unsigned long vm_flags)
> +{
> +	pgprot_t ret = __pgprot(pgprot_val(__vm_get_page_prot(vm_flags)) |
> +			pgprot_val(arm64_arch_vm_get_page_prot(vm_flags)));
> +
> +	return arm64_arch_filter_pgprot(ret);
> +}

If we kept the array, we can have everything in a single function
(untested and with my own comments for future changes):

pgprot_t vm_get_page_prot(unsigned long vm_flags)
{
	pgprot_t prot = __pgprot(pgprot_val(protection_map[vm_flags &
				(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]));

	/*
	 * We could get rid of this test if we updated protection_map[]
	 * to turn exec-only into read-exec during boot.
	 */
	if (!cpus_have_const_cap(ARM64_HAS_EPAN) &&
	    pgprot_val(prot) == pgprot_val(PAGE_EXECONLY))
		prot = PAGE_READONLY_EXEC;

	if (vm_flags & VM_ARM64_BTI)
		prot != PTE_GP;

	/*
	 * We can get rid of the requirement for PROT_NORMAL to be 0
	 * since here we can mask out PTE_ATTRINDX_MASK.
	 */
	if (vm_flags & VM_MTE) {
		prot &= ~PTE_ATTRINDX_MASK;
		prot |= PTE_ATTRINDX(MT_NORMAL_TAGGED);
	}

	return prot;
}

-- 
Catalin
