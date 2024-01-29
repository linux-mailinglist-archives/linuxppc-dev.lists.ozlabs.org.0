Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D00483FFC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 09:14:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gr9+9juM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNh0j2cwYz3bZ3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 19:14:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gr9+9juM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNgzx6rWtz30fm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 19:13:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AC490CE0E9C;
	Mon, 29 Jan 2024 08:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FD1C433F1;
	Mon, 29 Jan 2024 08:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706516024;
	bh=3CilwIK4j/wFSL2uSzw3xr9vTHBcUkUwkdpfoGIQbes=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gr9+9juMaC4yBKHu3TlC785iHTeskDfBKwt4tl5GFw6pNheVAt5mcGODyKL39f1Vw
	 iu48ERRPf3g7ynMKx3u+/TGGgaEy6YyezXlLYRgwEGJEgN45WV0QJrYT/lGl8/PzQ3
	 3dJC/Y7N9tFkDZrST/LHgaiZhqc2Bbpf2wxeiEWmPY0dtvQC4CtMaWhFZTa9o7HJEB
	 SPKAd/CdofoKcwC9mj+iQMuW/pTkGi3crrRQB/ojfC5pkXO69obg4pgHQCWQ/+Q/wn
	 YO4+m+4QwH24386w+ez2g5LgUw18MdjXEDRJ3YcqxxjAd4cBycPpbOaRBK0z97dA2T
	 PW7s4xGb8VSUw==
Message-ID: <105963ed-b489-4b82-973a-9024d74c6e87@kernel.org>
Date: Mon, 29 Jan 2024 13:43:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/debug_vm_pgtable: Fix BUG_ON with pud advanced test
Content-Language: en-US
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20240129060022.68044-1-aneesh.kumar@kernel.org>
 <1b3c1513-826d-4908-93c3-212a6f1b2d74@arm.com>
 <504f70be-deca-4f7f-b28c-d1ec2cf5a348@kernel.org>
 <cfb64ca7-e754-4671-b1d5-e9c3bee5f091@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
In-Reply-To: <cfb64ca7-e754-4671-b1d5-e9c3bee5f091@arm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/29/24 12:23 PM, Anshuman Khandual wrote:
> 
> 
> On 1/29/24 11:56, Aneesh Kumar K.V wrote:
>> On 1/29/24 11:52 AM, Anshuman Khandual wrote:
>>>
>>>
>>> On 1/29/24 11:30, Aneesh Kumar K.V (IBM) wrote:
>>>> Architectures like powerpc add debug checks to ensure we find only devmap
>>>> PUD pte entries. These debug checks are only done with CONFIG_DEBUG_VM.
>>>> This patch marks the ptes used for PUD advanced test devmap pte entries
>>>> so that we don't hit on debug checks on architecture like ppc64 as
>>>> below.
>>>>
>>>> WARNING: CPU: 2 PID: 1 at arch/powerpc/mm/book3s64/radix_pgtable.c:1382 radix__pud_hugepage_update+0x38/0x138
>>>> ....
>>>> NIP [c0000000000a7004] radix__pud_hugepage_update+0x38/0x138
>>>> LR [c0000000000a77a8] radix__pudp_huge_get_and_clear+0x28/0x60
>>>> Call Trace:
>>>> [c000000004a2f950] [c000000004a2f9a0] 0xc000000004a2f9a0 (unreliable)
>>>> [c000000004a2f980] [000d34c100000000] 0xd34c100000000
>>>> [c000000004a2f9a0] [c00000000206ba98] pud_advanced_tests+0x118/0x334
>>>> [c000000004a2fa40] [c00000000206db34] debug_vm_pgtable+0xcbc/0x1c48
>>>> [c000000004a2fc10] [c00000000000fd28] do_one_initcall+0x60/0x388
>>>>
>>>> Also
>>>>
>>>>  kernel BUG at arch/powerpc/mm/book3s64/pgtable.c:202!
>>>>  ....
>>>>
>>>>  NIP [c000000000096510] pudp_huge_get_and_clear_full+0x98/0x174
>>>>  LR [c00000000206bb34] pud_advanced_tests+0x1b4/0x334
>>>>  Call Trace:
>>>>  [c000000004a2f950] [000d34c100000000] 0xd34c100000000 (unreliable)
>>>>  [c000000004a2f9a0] [c00000000206bb34] pud_advanced_tests+0x1b4/0x334
>>>>  [c000000004a2fa40] [c00000000206db34] debug_vm_pgtable+0xcbc/0x1c48
>>>>  [c000000004a2fc10] [c00000000000fd28] do_one_initcall+0x60/0x388
>>>>
>>>> Fixes: 27af67f35631 ("powerpc/book3s64/mm: enable transparent pud hugepage")
>>>> Signed-off-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
>>>> ---
>>>>  mm/debug_vm_pgtable.c | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>>>> index 5662e29fe253..65c19025da3d 100644
>>>> --- a/mm/debug_vm_pgtable.c
>>>> +++ b/mm/debug_vm_pgtable.c
>>>> @@ -362,6 +362,12 @@ static void __init pud_advanced_tests(struct pgtable_debug_args *args)
>>>>  	vaddr &= HPAGE_PUD_MASK;
>>>>  
>>>>  	pud = pfn_pud(args->pud_pfn, args->page_prot);
>>>> +	/*
>>>> +	 * Some architectures have debug checks to make sure
>>>> +	 * huge pud mapping are only found with devmap entries
>>>> +	 * For now test with only devmap entries.
>>>> +	 */
>>> Do you see this behaviour to be changed in powerpc anytime soon ? Otherwise
>>> these pud_mkdevmap() based work arounds, might be required to stick around
>>> for longer just to prevent powerpc specific triggers. Given PUD transparent
>>> huge pages i.e HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD are just supported on x86
>>> and powerpc platforms, could not this problem be solved in a more uniform
>>> manner.
>>>
>>
>>
>> IIUC pud level transparent hugepages are only supported with devmap entries even
>> on x86. We don't do anonymous pud hugepage.
> 
> There are some 'pud_trans_huge(orig_pud) || pud_devmap(orig_pud)' checks in
> core paths i.e in mm/memory.c which might suggest pud_trans_huge() to exist
> without also being a devmap. I might be missing something here, but on x86
> platform following helpers suggest pud_trans_huge() to exist without being
> a devmap as well.
> 
> #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> static inline int pud_trans_huge(pud_t pud)
> {
>         return (pud_val(pud) & (_PAGE_PSE|_PAGE_DEVMAP)) == _PAGE_PSE;
> }
> #endif
> 
> #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> static inline int pud_devmap(pud_t pud)
> {
>         return !!(pud_val(pud) & _PAGE_DEVMAP);
> }
> #else
> static inline int pud_devmap(pud_t pud)
> {
>         return 0;
> }
> #endif
> 
> We might need some more clarity on this regarding x86 platform's pud huge
> page implementation.
> 

static vm_fault_t create_huge_pud(struct vm_fault *vmf)
{
#if defined(CONFIG_TRANSPARENT_HUGEPAGE) &&			\
	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
	struct vm_area_struct *vma = vmf->vma;
	/* No support for anonymous transparent PUD pages yet */
	if (vma_is_anonymous(vma))
		return VM_FAULT_FALLBACK;
	if (vma->vm_ops->huge_fault)
		return vma->vm_ops->huge_fault(vmf, PUD_ORDER);
#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
	return VM_FAULT_FALLBACK;
}



-aneesh
