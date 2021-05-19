Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA833894F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 20:03:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlghX297Yz305n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 04:03:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C4pxVUnm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=C4pxVUnm; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Flgh24y5Rz2xvF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 04:02:42 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEC07611BF;
 Wed, 19 May 2021 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621447359;
 bh=4G51wYYLkZ/TW7ndcHnUvtn1v/wSsDBwD5+CCYdOSno=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=C4pxVUnm+TJxhhV0pi9drq2UEVcZmM7yx1F/m/I8kaOl1RBi8h63PlWEkEznXx/nL
 loxelmM0TrkNqVi6nTtzxBdfnurtNs+HXtxcHAj9scMAbqL1N/D7rxKmvtzPCrklDO
 2aCeQ5q8kBWk7QrBVXdOY7L6BgHFoT/xx/tETaRofFCVXo7ffOOyz9HTJpaqDMplzP
 qeGJcD7xI06DFM2ZuF+9cSsJVo78kLLoRA4r6W/4EHuNAI3t0nhM6tOahQYZjnVDHH
 BBl3UVarPvfrK94GQ4ahEHF6t7CxdCV4XwTLAzXakKxyKgn/+Jl6APLTwjFopCigLi
 d6jV53PoFchZg==
Subject: Re: [PATCH v5 3/9] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-4-aneesh.kumar@linux.ibm.com>
 <YKQdxpHVYB9H0M0j@Ryzen-9-3900X.localdomain> <87mtsrqqk0.fsf@linux.ibm.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <4bc25749-9ae8-6591-f4f6-4ef1c209d3a0@kernel.org>
Date: Wed, 19 May 2021 11:02:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <87mtsrqqk0.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: npiggin@gmail.com, linux-mm@kvack.org, kaleshsingh@google.com,
 joel@joelfernandes.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/18/2021 9:46 PM, Aneesh Kumar K.V wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> 
>> Hi Aneesh,
>>
>> On Thu, Apr 22, 2021 at 11:13:17AM +0530, Aneesh Kumar K.V wrote:
>>> pmd/pud_populate is the right interface to be used to set the respective
>>> page table entries. Some architectures like ppc64 do assume that set_pmd/pud_at
>>> can only be used to set a hugepage PTE. Since we are not setting up a hugepage
>>> PTE here, use the pmd/pud_populate interface.
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>   mm/mremap.c | 7 +++----
>>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/mm/mremap.c b/mm/mremap.c
>>> index ec8f840399ed..574287f9bb39 100644
>>> --- a/mm/mremap.c
>>> +++ b/mm/mremap.c
>>> @@ -26,6 +26,7 @@
>>>   
>>>   #include <asm/cacheflush.h>
>>>   #include <asm/tlbflush.h>
>>> +#include <asm/pgalloc.h>
>>>   
>>>   #include "internal.h"
>>>   
>>> @@ -257,9 +258,8 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>>>   	pmd_clear(old_pmd);
>>>   
>>>   	VM_BUG_ON(!pmd_none(*new_pmd));
>>> +	pmd_populate(mm, new_pmd, (pgtable_t)pmd_page_vaddr(pmd));
>>>   
>>> -	/* Set the new pmd */
>>> -	set_pmd_at(mm, new_addr, new_pmd, pmd);
>>>   	flush_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
>>>   	if (new_ptl != old_ptl)
>>>   		spin_unlock(new_ptl);
>>> @@ -306,8 +306,7 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
>>>   
>>>   	VM_BUG_ON(!pud_none(*new_pud));
>>>   
>>> -	/* Set the new pud */
>>> -	set_pud_at(mm, new_addr, new_pud, pud);
>>> +	pud_populate(mm, new_pud, (pmd_t *)pud_page_vaddr(pud));
>>>   	flush_tlb_range(vma, old_addr, old_addr + PUD_SIZE);
>>>   	if (new_ptl != old_ptl)
>>>   		spin_unlock(new_ptl);
>>> -- 
>>> 2.30.2
>>>
>>>
>>
>> This commit causes my WSL2 VM to close when compiling something memory
>> intensive, such as an x86_64_defconfig + CONFIG_LTO_CLANG_FULL=y kernel
>> or LLVM/Clang. Unfortunately, I do not have much further information to
>> provide since I do not see any sort of splat in dmesg right before it
>> closes and I have found zero information about getting the previous
>> kernel message in WSL2 (custom init so no systemd or anything).
>>
>> The config file is the stock one from Microsoft:
>>
>> https://github.com/microsoft/WSL2-Linux-Kernel/blob/a571dc8cedc8e0e56487c0dc93243e0b5db8960a/Microsoft/config-wsl
>>
>> I have attached my .config anyways, which includes CONFIG_DEBUG_VM,
>> which does not appear to show anything out of the ordinary. I have also
>> attached a dmesg just in case anything sticks out. I am happy to provide
>> any additional information or perform additional debugging steps as
>> needed.
>>
> 
> Can you try this change?

Thank you for the quick diff! This resolves my issue.

Tested-by: Nathan Chancellor <nathan@kernel.org>

> modified   mm/mremap.c
> @@ -279,7 +279,7 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>   	pmd_clear(old_pmd);
>   
>   	VM_BUG_ON(!pmd_none(*new_pmd));
> -	pmd_populate(mm, new_pmd, (pgtable_t)pmd_page_vaddr(pmd));
> +	pmd_populate(mm, new_pmd, pmd_pgtable(pmd));
>   
>   	if (new_ptl != old_ptl)
>   		spin_unlock(new_ptl);
> 

