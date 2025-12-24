Return-Path: <linuxppc-dev+bounces-14989-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E6DCDBE40
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 11:04:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbnYC2VySz2yFp;
	Wed, 24 Dec 2025 21:04:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766570687;
	cv=none; b=AUsxsIGj7xLPtoQ9vMQ25N7b7bIQhsRwCMMqRInPc3rkLrdAIPnJ0DWMEYe5aNXsvJk9T3YKwmWmNaPfp5nRnHaJnxoBmp2NMx9t48Um5ozaOaTAjtbqr8rbiAbpUWWlCf1c+dHU7UFLjSpzY7hYahKy9vJtOeWDTbP9bOKXW/WnPWzNjcLx0ajbNBnPHKvTChwAejCkRtmP9ybeD3M/5TZng8MUMKYrI/+mLDfFasmCaR981ah6BpC/Ms4uxD5bdthvfZHrv89V09S6RnyTdlhLJhyBqTVQy9lLzh3NADPfR3K6GF39ackkLUAZXQ5Ra4yHVr8zV5zefDfBElhJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766570687; c=relaxed/relaxed;
	bh=aQn9A9EvBEOzPox4m6lc6QOQeNRM8bVdyIRXpAJSIRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xs5SjDhA/jIxlVjkLTDZfaAwkpiuczSiW7/lxPWYXbs5jBe4nk8Z+hjGyaYSul4nsOngh1BtDB/Gi6wjLCAtilfIS1TCdD1s2OuiOkF8vVmXUrz/1Olsh1HE/k9gO9UHN24kUMd4qPAwwpDqSkEYuVssBHQj4GNowmvfhVa0/cD7sFZU1GnSDoPd/xKcatQC0alTZLRDXHIcRQW9zRpulOHIWrTxTNXdjCZ+SXupHRLCWoKo+QZnEpBWXqBhn5tSQT5lIwQ7nZU18QQLXxh7ln8NdzzarUfsDlfQoRYUAWjScF+v+Nihdr1WFxP35HsLG3k03cOm1wMtxasJbCDwag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LhlWzjhQ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LhlWzjhQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbnYB3ZTfz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 21:04:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58BC1401FA;
	Wed, 24 Dec 2025 10:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630E5C4CEFB;
	Wed, 24 Dec 2025 10:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766570684;
	bh=U4dPbSzXMuUzlolxIPxkQSfmCTxcnDq9LgiQXM3Udus=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LhlWzjhQx9ItGpLyluKS6ap7jY8/lJEZm+HCzVd7HNDAQLx8hYJ0+h4GYYcqwGKYV
	 dhs6Nv8eZrEoB9QD72LPxsm3/1x4jgxz7nCDkAKcLsZO4861qSpB6tBVSpoR9hGAzy
	 xV6jpBlu4p20mCU/W/6mg7OngsGgDGltaM920mUzReCTySJkjMz7IFwr+xeGfiwwr3
	 mCu8P/h0FIe21j2iga2v5hw3eCcFC77S2sa50Sc87nw2qFuQNVuh8lyg6c4Ur0OsgG
	 /5sUfox+tjqKg1/sQZUjP1B35mMpkfrIivDwFbgY8MsUKuygiiVcgRMC4BEmN62yzI
	 M1QAt33raorTw==
Message-ID: <cc4e33fd-c568-4cba-9430-b16a3abcf25f@kernel.org>
Date: Wed, 24 Dec 2025 11:04:38 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/32: Restore disabling of interrupts at
 interrupt/syscall exit
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Guenter Roeck <linux@roeck-us.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au,
 Christian Zigotzky <info@xenosoft.de>
References: <585ea521b2be99d293b539bbfae148366cfb3687.1766146895.git.chleroy@kernel.org>
 <0cce7da7-9524-05c6-11bb-2f0f1977ca94@xenosoft.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <0cce7da7-9524-05c6-11bb-2f0f1977ca94@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 20/12/2025 à 12:17, Christian Zigotzky a écrit :
> On 19/12/25 13:23, Christophe Leroy (CS GROUP) wrote:
>> Commit 2997876c4a1a ("powerpc/32: Restore clearing of MSR[RI] at
>> interrupt/syscall exit") delayed clearing of MSR[RI], but missed that
>> both MSR[RI] and MSR[EE] are cleared at the same time, so the commit
>> also delayed the disabling of interrupts, leading to unexpected
>> behaviour.
>>
>> To fix that, mostly revert the blamed commit and restore the clearing
>> of MSR[RI] in interrupt_exit_kernel_prepare() instead. For 8xx it
>> implies adding a synchronising instruction after the mtspr in order to
>> make sure no instruction counter interrupt (used for perf events) will
>> fire just after clearing MSR[RI].
>>
>> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>> Closes: https://eur01.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Flore.kernel.org%2Fall%2F4d0bd05d-6158-1323-3509-744d3fbe8fc7%40xenosoft.de%2F&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C04147486078f4487431908de3fb987ff%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639018263263978487%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=oNkrme1a69HcSK3wzCMc%2BJhc6GnkS2VHoGfQFM242%2BA%3D&reserved=0
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Closes: https://eur01.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Flore.kernel.org%2Fall%2F6b05eb1c- 
>> fdef-44e0-91a7-8286825e68f1%40roeck- 
>> us.net%2F&data=05%7C02%7Cchristophe.leroy2%40cs- 
>> soprasteria.com%7C04147486078f4487431908de3fb987ff%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639018263263994543%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=q8cMycJtK%2B2nZLB2nx4Ho8SuDD7ZjEbGNb67IULrOCQ%3D&reserved=0
>> Fixes: 2997876c4a1a ("powerpc/32: Restore clearing of MSR[RI] at 
>> interrupt/syscall exit")
>> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> ---
>>   arch/powerpc/include/asm/hw_irq.h |  2 +-
>>   arch/powerpc/include/asm/reg.h    |  1 +
>>   arch/powerpc/kernel/entry_32.S    | 15 ---------------
>>   arch/powerpc/kernel/interrupt.c   |  5 ++++-
>>   4 files changed, 6 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/ 
>> asm/hw_irq.h
>> index 1078ba88efaf..9cd945f2acaf 100644
>> --- a/arch/powerpc/include/asm/hw_irq.h
>> +++ b/arch/powerpc/include/asm/hw_irq.h
>> @@ -90,7 +90,7 @@ static inline void __hard_EE_RI_disable(void)
>>       if (IS_ENABLED(CONFIG_BOOKE))
>>           wrtee(0);
>>       else if (IS_ENABLED(CONFIG_PPC_8xx))
>> -        wrtspr(SPRN_NRI);
>> +        wrtspr_sync(SPRN_NRI);
>>       else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
>>           __mtmsrd(0, 1);
>>       else
>> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/ 
>> asm/reg.h
>> index 3fe186635432..3449dd2b577d 100644
>> --- a/arch/powerpc/include/asm/reg.h
>> +++ b/arch/powerpc/include/asm/reg.h
>> @@ -1400,6 +1400,7 @@ static inline void mtmsr_isync(unsigned long val)
>>                        : "r" ((unsigned long)(v)) \
>>                        : "memory")
>>   #define wrtspr(rn)    asm volatile("mtspr " __stringify(rn) 
>> ",2" : : : "memory")
>> +#define wrtspr_sync(rn)    asm volatile("mtspr " __stringify(rn) ",2; 
>> sync" : : : "memory")
>>   static inline void wrtee(unsigned long val)
>>   {
>> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/ 
>> entry_32.S
>> index 16f8ee6cb2cd..d8426251b1cd 100644
>> --- a/arch/powerpc/kernel/entry_32.S
>> +++ b/arch/powerpc/kernel/entry_32.S
>> @@ -101,17 +101,6 @@ SYM_FUNC_END(__kuep_unlock)
>>   .endm
>>   #endif
>> -.macro    clr_ri trash
>> -#ifndef CONFIG_BOOKE
>> -#ifdef CONFIG_PPC_8xx
>> -    mtspr   SPRN_NRI, \trash
>> -#else
>> -    li    \trash, MSR_KERNEL & ~MSR_RI
>> -    mtmsr    \trash
>> -#endif
>> -#endif
>> -.endm
>> -
>>       .globl    transfer_to_syscall
>>   transfer_to_syscall:
>>       stw    r3, ORIG_GPR3(r1)
>> @@ -160,7 +149,6 @@ ret_from_syscall:
>>       cmpwi    r3,0
>>       REST_GPR(3, r1)
>>   syscall_exit_finish:
>> -    clr_ri    r4
>>       mtspr    SPRN_SRR0,r7
>>       mtspr    SPRN_SRR1,r8
>> @@ -237,7 +225,6 @@ fast_exception_return:
>>       /* Clear the exception marker on the stack to avoid confusing 
>> stacktrace */
>>       li    r10, 0
>>       stw    r10, 8(r11)
>> -    clr_ri    r10
>>       mtspr    SPRN_SRR1,r9
>>       mtspr    SPRN_SRR0,r12
>>       REST_GPR(9, r11)
>> @@ -270,7 +257,6 @@ interrupt_return:
>>   .Lfast_user_interrupt_return:
>>       lwz    r11,_NIP(r1)
>>       lwz    r12,_MSR(r1)
>> -    clr_ri    r4
>>       mtspr    SPRN_SRR0,r11
>>       mtspr    SPRN_SRR1,r12
>> @@ -313,7 +299,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
>>       cmpwi    cr1,r3,0
>>       lwz    r11,_NIP(r1)
>>       lwz    r12,_MSR(r1)
>> -    clr_ri    r4
>>       mtspr    SPRN_SRR0,r11
>>       mtspr    SPRN_SRR1,r12
>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/ 
>> interrupt.c
>> index aea6f7e8e9c6..e63bfde13e03 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -38,7 +38,7 @@ static inline bool exit_must_hard_disable(void)
>>   #else
>>   static inline bool exit_must_hard_disable(void)
>>   {
>> -    return false;
>> +    return true;
>>   }
>>   #endif
>> @@ -443,6 +443,9 @@ notrace unsigned long 
>> interrupt_exit_kernel_prepare(struct pt_regs *regs)
>>           if (unlikely(stack_store))
>>               __hard_EE_RI_disable();
>> +#else
>> +    } else {
>> +        __hard_EE_RI_disable();
>>   #endif /* CONFIG_PPC64 */
>>       }
> 
> The patched kernel 6.19.0-rc1 boots without any problems. Thank you.
> 
> Tested-by Christian Zigotzky <chzigotzky@xenosoft.de>
> 

Thanks

b4/patchwork missed your tested-by which lacks the colon.

Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>

