Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB99D21634D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 03:22:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B14Rc06fgzDqQ3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 11:22:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B14PP6R6wzDqXT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 11:20:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=b1r4GCmk; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B14PP3qqgz9sRK;
 Tue,  7 Jul 2020 11:20:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594084825;
 bh=htLTgyRbtWDb4qK/aFnhp3EA2jkU8TNdwrGJKkifA2o=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=b1r4GCmk22rhJwFCIQVDUg2JUxyjUDZk+mZlIVdkIIks/RREkSayOiAUrrsC+HnjF
 naYLmEB63+qR93Vn2zX8OtlzLMff0y2rEnBFH0l04xc6GEK5YVYqXeXuafdymmGpDa
 4hO83UTCKHgB5Dk2dEe1/KvwqLpWTEUQ784ePne7Xo35VkF9dtSUhDh44j/Bza5TkO
 cDerVm8ytAN2tDZl77sg/QawPvi9j7jfyBBpEBX8ycxIVVUJh6FK3QK9cBVYht3CYI
 CnfgzfXW1BC+9Wxq62i5Px8ySp2tzdvuTrmdhqtfff6Qzi+hMH8ULrva9ZECFraHnU
 iZKRKtJWIdMsg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 19/26] powerpc/book3s64/kuap: Move KUAP related
 function outside radix
In-Reply-To: <d09d0150-860a-1e6a-1d4a-01ae8d7e97b9@linux.ibm.com>
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
 <20200619135850.47155-20-aneesh.kumar@linux.ibm.com>
 <87eepo6cjm.fsf@mpe.ellerman.id.au>
 <d09d0150-860a-1e6a-1d4a-01ae8d7e97b9@linux.ibm.com>
Date: Tue, 07 Jul 2020 11:22:40 +1000
Message-ID: <87tuyk3yqn.fsf@mpe.ellerman.id.au>
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
Cc: linuxram@us.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> On 7/6/20 6:11 PM, Michael Ellerman wrote:
>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>> The next set of patches adds support for kuap with hash translation.
>> 
>> That's no longer true of this series.
>> 
>>> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
>>> index 0d72c0246052..e93b65a0e6e7 100644
>>> --- a/arch/powerpc/mm/book3s64/pkeys.c
>>> +++ b/arch/powerpc/mm/book3s64/pkeys.c
>>> @@ -199,6 +200,24 @@ void __init pkey_early_init_devtree(void)
>>>   	return;
>>>   }
>>>   
>>> +#ifdef CONFIG_PPC_KUAP
>>> +void __init setup_kuap(bool disabled)
>>> +{
>>> +	if (disabled || !early_radix_enabled())
>>> +		return;
>>> +
>>> +	if (smp_processor_id() == boot_cpuid) {
>>> +		pr_info("Activating Kernel Userspace Access Prevention\n");
>>> +		cur_cpu_spec->mmu_features |= MMU_FTR_RADIX_KUAP;
>>> +	}
>>> +
>>> +	/* Make sure userspace can't change the AMR */
>>> +	mtspr(SPRN_UAMOR, 0);
>>> +	mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
>>> +	isync();
>>> +}
>>> +#endif
>> 
>> This makes this code depend on CONFIG_PPC_MEM_KEYS=y, which it didn't
>> used to.
>> 
>> That risks breaking people's existing .configs, if they have
>> PPC_MEM_KEYS=n they will now lose KUAP.
>> 
>> And I'm not convinced the two features should be tied together, at least
>> at the user-visible Kconfig level.
>
> That simplifies the addition of hash kuap a lot. Especially in the 
> exception entry and return paths.  I did try to consider them as 
> independent options. But then the feature fixup in asm code gets 
> unnecessarily complicated. Also the UAMOR handling also get complicated.

Yep. I'm OK if most of the code is enabled for either/both options, but
I think the user-visible options should not depend on each other.

So something like:

config PPC_PKEY
	def_bool y
        depends on PPC_MEM_KEYS || PPC_KUAP

And then the low-level code is guarded by PPC_PKEY.

Or we just say that making MEM_KEYS configurable is not worth the
added complexity and turn it on always.

cheers
