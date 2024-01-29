Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6E383FE4B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 07:27:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FKTiWUxr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNddV1Znvz3cGS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 17:27:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FKTiWUxr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNdcj2PnPz2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 17:27:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF545CE0FA7;
	Mon, 29 Jan 2024 06:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6125DC433C7;
	Mon, 29 Jan 2024 06:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706509615;
	bh=ozH9tUKz+Ib/lG38+cYJ5t0IlrhQYRHwhVjs+83kvFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FKTiWUxrb7cFzx2xDm6e3IzeVPaq5sNNy6AMJU7zMTl8d9pQodtlZGlm0+YzLT30x
	 w2C28C85p/J0bMimYFQG8ggI6bJDczw3OUCepptA1R7inKsJE5/S4r7FebEyfoTys4
	 cVEnjCc20pcWmhq3Ev0x1OG4mSnyZNip0Hv77m2xxdRbMyiN3kslrFGe4cOA6LXhAM
	 jCybeoSeJpUVB5DQGWuxkNMDfx9C5eRQrGo9IA8AcVQPyz2Rk4PyuHUtnUoUbTC2NK
	 yFRW0AO/ZfTYtTc2zXMeg9MCCcV81dqaFOQR0ZOr5g5bq4BENSR2ZQNIZShjH4YSB5
	 gExtduADKB/4A==
Message-ID: <504f70be-deca-4f7f-b28c-d1ec2cf5a348@kernel.org>
Date: Mon, 29 Jan 2024 11:56:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/debug_vm_pgtable: Fix BUG_ON with pud advanced test
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20240129060022.68044-1-aneesh.kumar@kernel.org>
 <1b3c1513-826d-4908-93c3-212a6f1b2d74@arm.com>
Content-Language: en-US
From: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
In-Reply-To: <1b3c1513-826d-4908-93c3-212a6f1b2d74@arm.com>
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

On 1/29/24 11:52 AM, Anshuman Khandual wrote:
> 
> 
> On 1/29/24 11:30, Aneesh Kumar K.V (IBM) wrote:
>> Architectures like powerpc add debug checks to ensure we find only devmap
>> PUD pte entries. These debug checks are only done with CONFIG_DEBUG_VM.
>> This patch marks the ptes used for PUD advanced test devmap pte entries
>> so that we don't hit on debug checks on architecture like ppc64 as
>> below.
>>
>> WARNING: CPU: 2 PID: 1 at arch/powerpc/mm/book3s64/radix_pgtable.c:1382 radix__pud_hugepage_update+0x38/0x138
>> ....
>> NIP [c0000000000a7004] radix__pud_hugepage_update+0x38/0x138
>> LR [c0000000000a77a8] radix__pudp_huge_get_and_clear+0x28/0x60
>> Call Trace:
>> [c000000004a2f950] [c000000004a2f9a0] 0xc000000004a2f9a0 (unreliable)
>> [c000000004a2f980] [000d34c100000000] 0xd34c100000000
>> [c000000004a2f9a0] [c00000000206ba98] pud_advanced_tests+0x118/0x334
>> [c000000004a2fa40] [c00000000206db34] debug_vm_pgtable+0xcbc/0x1c48
>> [c000000004a2fc10] [c00000000000fd28] do_one_initcall+0x60/0x388
>>
>> Also
>>
>>  kernel BUG at arch/powerpc/mm/book3s64/pgtable.c:202!
>>  ....
>>
>>  NIP [c000000000096510] pudp_huge_get_and_clear_full+0x98/0x174
>>  LR [c00000000206bb34] pud_advanced_tests+0x1b4/0x334
>>  Call Trace:
>>  [c000000004a2f950] [000d34c100000000] 0xd34c100000000 (unreliable)
>>  [c000000004a2f9a0] [c00000000206bb34] pud_advanced_tests+0x1b4/0x334
>>  [c000000004a2fa40] [c00000000206db34] debug_vm_pgtable+0xcbc/0x1c48
>>  [c000000004a2fc10] [c00000000000fd28] do_one_initcall+0x60/0x388
>>
>> Fixes: 27af67f35631 ("powerpc/book3s64/mm: enable transparent pud hugepage")
>> Signed-off-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
>> ---
>>  mm/debug_vm_pgtable.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 5662e29fe253..65c19025da3d 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -362,6 +362,12 @@ static void __init pud_advanced_tests(struct pgtable_debug_args *args)
>>  	vaddr &= HPAGE_PUD_MASK;
>>  
>>  	pud = pfn_pud(args->pud_pfn, args->page_prot);
>> +	/*
>> +	 * Some architectures have debug checks to make sure
>> +	 * huge pud mapping are only found with devmap entries
>> +	 * For now test with only devmap entries.
>> +	 */
> Do you see this behaviour to be changed in powerpc anytime soon ? Otherwise
> these pud_mkdevmap() based work arounds, might be required to stick around
> for longer just to prevent powerpc specific triggers. Given PUD transparent
> huge pages i.e HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD are just supported on x86
> and powerpc platforms, could not this problem be solved in a more uniform
> manner.
> 


IIUC pud level transparent hugepages are only supported with devmap entries even
on x86. We don't do anonymous pud hugepage.

>> +	pud = pud_mkdevmap(pud);
>>  	set_pud_at(args->mm, vaddr, args->pudp, pud);
>>  	flush_dcache_page(page);
>>  	pudp_set_wrprotect(args->mm, vaddr, args->pudp);
>> @@ -374,6 +380,7 @@ static void __init pud_advanced_tests(struct pgtable_debug_args *args)
>>  	WARN_ON(!pud_none(pud));
>>  #endif /* __PAGETABLE_PMD_FOLDED */
>>  	pud = pfn_pud(args->pud_pfn, args->page_prot);
>> +	pud = pud_mkdevmap(pud);
>>  	pud = pud_wrprotect(pud);
>>  	pud = pud_mkclean(pud);
>>  	set_pud_at(args->mm, vaddr, args->pudp, pud);
>> @@ -391,6 +398,7 @@ static void __init pud_advanced_tests(struct pgtable_debug_args *args)
>>  #endif /* __PAGETABLE_PMD_FOLDED */
>>  
>>  	pud = pfn_pud(args->pud_pfn, args->page_prot);
>> +	pud = pud_mkdevmap(pud);
>>  	pud = pud_mkyoung(pud);
>>  	set_pud_at(args->mm, vaddr, args->pudp, pud);
>>  	flush_dcache_page(page);


-aneesh
