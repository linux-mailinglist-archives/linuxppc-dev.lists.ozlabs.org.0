Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C94F92E4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 12:28:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZZGj1H3Gz3bYS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 20:28:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org;
 receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZZGD2lNwz2xCB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 20:28:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 667C861F04;
 Fri,  8 Apr 2022 10:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA71C385A1;
 Fri,  8 Apr 2022 10:28:14 +0000 (UTC)
Date: Fri, 8 Apr 2022 11:28:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V4 3/7] arm64/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Message-ID: <YlAOO2H/Ay/y9HOv@arm.com>
References: <20220407103251.1209606-1-anshuman.khandual@arm.com>
 <20220407103251.1209606-4-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407103251.1209606-4-anshuman.khandual@arm.com>
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, sparclinux@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 07, 2022 at 04:02:47PM +0530, Anshuman Khandual wrote:
> diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
> index 77ada00280d9..307534fcec00 100644
> --- a/arch/arm64/mm/mmap.c
> +++ b/arch/arm64/mm/mmap.c
> @@ -55,3 +55,36 @@ static int __init adjust_protection_map(void)
>  	return 0;
>  }
>  arch_initcall(adjust_protection_map);
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
> +	pgprot_t ret = __pgprot(pgprot_val(protection_map[vm_flags &
> +				(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]) |
> +				pgprot_val(arm64_arch_vm_get_page_prot(vm_flags)));
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(vm_get_page_prot);

Could you write all this in a single function? I think I mentioned it in
a previous series (untested):

pgprot_t vm_get_page_prot(unsigned long vm_flags)
{
	pteval_t prot = pgprot_val(protection_map[vm_flags &
				   (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);

	if (vm_flags & VM_ARM64_BTI)
		prot |= PTE_GP;

	/*
	 * There are two conditions required for returning a Normal Tagged
	 * memory type: (1) the user requested it via PROT_MTE passed to
	 * mmap() or mprotect() and (2) the corresponding vma supports MTE. We
	 * register (1) as VM_MTE in the vma->vm_flags and (2) as
	 * VM_MTE_ALLOWED. Note that the latter can only be set during the
	 * mmap() call since mprotect() does not accept MAP_* flags.
	 * Checking for VM_MTE only is sufficient since arch_validate_flags()
	 * does not permit (VM_MTE & !VM_MTE_ALLOWED).
	 */
	if (vm_flags & VM_MTE)
		prot |= PTE_ATTRINDX(MT_NORMAL_TAGGED);

	return __pgprot(prot);
}
EXPORT_SYMBOL(vm_get_page_prot);

With that:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
