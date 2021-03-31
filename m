Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E192A34FFE0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 14:04:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Q2l6CnSz3c74
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 23:03:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9Q2Q2nKLz2xxw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 23:03:38 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F9Q2D0smKz9v32D;
 Wed, 31 Mar 2021 14:03:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id g_Nn_xv_uLdm; Wed, 31 Mar 2021 14:03:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F9Q2D04czz9v32B;
 Wed, 31 Mar 2021 14:03:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DB5BA8B7FF;
 Wed, 31 Mar 2021 14:03:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Z-TpVAvpf8s5; Wed, 31 Mar 2021 14:03:32 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4EC668B75B;
 Wed, 31 Mar 2021 14:03:32 +0200 (CEST)
Subject: Re: [PATCH v10 01/10] powerpc/mm: Implement set_memory() routines
To: Michael Ellerman <mpe@ellerman.id.au>, Jordan Niethe
 <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-2-jniethe5@gmail.com>
 <87lfa37euw.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <17c3a18b-9bfb-15e6-fc09-63d6226f1879@csgroup.eu>
Date: Wed, 31 Mar 2021 14:03:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <87lfa37euw.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, cmr@codefail.de,
 naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 31/03/2021 à 13:16, Michael Ellerman a écrit :
> Hi Jordan,
> 
> A few nits below ...
> 
> Jordan Niethe <jniethe5@gmail.com> writes:
>> From: Russell Currey <ruscur@russell.cc>
>>
>> The set_memory_{ro/rw/nx/x}() functions are required for STRICT_MODULE_RWX,
>> and are generally useful primitives to have.  This implementation is
>> designed to be completely generic across powerpc's many MMUs.
>>
>> It's possible that this could be optimised to be faster for specific
>> MMUs, but the focus is on having a generic and safe implementation for
>> now.
>>
>> This implementation does not handle cases where the caller is attempting
>> to change the mapping of the page it is executing from, or if another
>> CPU is concurrently using the page being altered.  These cases likely
>> shouldn't happen, but a more complex implementation with MMU-specific code
>> could safely handle them, so that is left as a TODO for now.
>>
>> On hash the linear mapping is not kept in the linux pagetable, so this
>> will not change the protection if used on that range. Currently these
>> functions are not used on the linear map so just WARN for now.
>>
>> These functions do nothing if STRICT_KERNEL_RWX is not enabled.
>>
>> Reviewed-by: Daniel Axtens <dja@axtens.net>
>> Signed-off-by: Russell Currey <ruscur@russell.cc>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> [jpn: -rebase on next plus "powerpc/mm/64s: Allow STRICT_KERNEL_RWX again"
>>        - WARN on hash linear map]
>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>> ---
>> v10: WARN if trying to change the hash linear map
>> ---

> 
> This ↓ should have a comment explaining what it's doing:
> 
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +	if (WARN_ON_ONCE(!radix_enabled() &&
>> +		     get_region_id(addr) == LINEAR_MAP_REGION_ID)) {
>> +		return -1;
>> +	}
>> +#endif
> 
> Maybe:
> 
> 	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
> 	    WARN_ON_ONCE(!radix_enabled() && get_region_id(addr) == LINEAR_MAP_REGION_ID)) {
> 		return -1;
> 	}

get_region_id() only exists for book3s/64 at the time being, and LINEAR_MAP_REGION_ID as well.


> 
> But then Aneesh pointed out that we should also block VMEMMAP_REGION_ID.
> 
> It might be better to just check for the permitted regions.
> 
> 	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled()) {
>          	int region = get_region_id(addr);
> 
> 	    	if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
>                  	return -1;
> 	}
> 
>> +
>> +	return apply_to_existing_page_range(&init_mm, start, sz,
>> +					    change_page_attr, (void *)action);
>> +}
> 
> 
> cheers
> 
