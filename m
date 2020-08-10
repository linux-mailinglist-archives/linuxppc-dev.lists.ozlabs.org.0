Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9176A24038B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 10:47:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ8jh5wJDzDqST
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 18:47:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=qHFTFP0d; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ8gn32yYzDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 18:45:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597049149;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Cr+W6j6lnqH75IQeNDbUp2+pmQQAte5y9vhNdM02LI8=;
 b=qHFTFP0dGQc2z5DGNkK+VHH+j3BDTCyPMAretBhx0sUXgPvc6MToeqZeF7erMW6I6K
 rJ8AB2aIzWM4BAd+xf1GlsPo7Z5PME49Jy9U+lEcRpK2sj/4VQYrHfSVi45W/+luNEnn
 A1yYXYPhGCI/69rR6Y3Sj6xG7QEy4dmRfVo5+6IMyLrIVRZdkz6Nn1jexuesFVuQX0Kr
 ezRfyesSW9PEwoM6m8Aa4DrMi9rHa92XIIAJy7MiT/zMFhCVNtsVsjd/k0Vc9R60y9z5
 i2qyWyiAcr3ycif2Ke5AjtTBAQ+dPTiTlXuhDgFYKyyxGO4/Eoj+soGcQ5BUhsTc1BUe
 BHOw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhScjcMpGbpwMjg24lToKxMjG8j"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:1d6a:acb3:bd15:555]
 by smtp.strato.de (RZmta 46.10.5 AUTH)
 with ESMTPSA id 60686ew7A8jdTlj
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 10 Aug 2020 10:45:39 +0200 (CEST)
Subject: Re: [PASEMI] Nemo board doesn't boot anymore after the commit
 "powerpc/book3s64/pkeys: Simplify pkey disable branch"
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <87h7tb4zwp.fsf@linux.ibm.com>
 <E1C071A5-19D1-4493-B04A-4507A70D7848@xenosoft.de>
 <bc1975fb-23df-09c2-540a-c13b39ad56c5@xenosoft.de>
Message-ID: <51482c70-1007-1202-9ed1-2d174c1e923f@xenosoft.de>
Date: Mon, 10 Aug 2020 10:45:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bc1975fb-23df-09c2-540a-c13b39ad56c5@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: Olof Johansson <olof@lixom.net>, Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Aneesh,

I tested the new kernel today and unfortunately it doesn't run very well.

I have only one core (1 physical processor; 1 core; 2 threads) instead 
of two cores (1 physical processor; 2 cores; 2 threads) so the system is 
slower.

Boot log: http://www.xenosoft.de/dmesg_nemo_board_kernel_5.9.txt

Could you please check the updates?

Thanks,
Christian


On 10 August 2020 at 09:56 am, Christian Zigotzky wrote:
> Hello Aneesh,
>
> The Nemo board boots with your patch but unfortunately I don't see any 
> boot messages anymore.
>
> Please find attached the kernel config.
>
> Thanks,
> Christian
>
>
> On 09 August 2020 at 5:49 pm, Christian Zigotzky wrote:
>> Hello Aneesh,
>>
>> Many thanks for your fast response and thanks a lot for your patch!
>> I will patch and compile a new git kernel tomorrow. I am looking 
>> forward to the result.
>>
>> Have a nice day!
>>
>> Cheers,
>> Christian
>>
>>> On 9. Aug 2020, at 17:11, Aneesh Kumar K.V 
>>> <aneesh.kumar@linux.ibm.com> wrote:
>>>
>>> ﻿"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>>
>>>>> On 8/9/20 8:04 PM, Aneesh Kumar K.V wrote:
>>>>> On 8/9/20 7:42 PM, Christian Zigotzky wrote:
>>>>>> Hello,
>>>>>>
>>>>>> The Nemo board (A-EON AmigaOne X1000) [1] doesn't start with the
>>>>>> latest Git kernel anymore after the commit "powerpc/book3s64/pkeys:
>>>>>> Simplify pkey disable branch" [2].
>>>>>>
>>>>>> I bisected today [3].
>>>>>>
>>>>>> Result: powerpc/book3s64/pkeys: Simplify pkey disable branch
>>>>>> (a4678d4b477c3d2901f101986ca01406f3b7eaea) [2] is the first bad 
>>>>>> commit.
>>>>>>
>>>>>> Unfortunately I wasn't able to revert the first bad commit. The 
>>>>>> first
>>>>>> bad commit depends on many other commits, which unfortunately I 
>>>>>> don't
>>>>>> know. I tried to remove the modifications of the files from the 
>>>>>> first
>>>>>> bad commit but without any success. There are just too many 
>>>>>> dependencies.
>>>>>>
>>>>>> Additionally I reverted the commit "selftests/powerpc: Fix pkey
>>>>>> syscall redefinitions" [4] and compiled a new kernel but without any
>>>>>> success.
>>>>>>
>>>>>> Could you please check the first bad commit?
>>>>>>
>>>>>> Thanks,
>>>>>> Christian
>>>>>>
>>>>>
>>>>> Can you share a successful boot log of the system so that i can 
>>>>> double
>>>>> check the cpu_feature and mmu_feature reported ? I am looking for
>>>>> details similar to below.
>>>>>
>>>>> [    0.000000] cpu_features      = 0x0001c07f8f5f91a7
>>>>> [    0.000000]   possible        = 0x0001fbffcf5fb1a7
>>>>> [    0.000000]   always          = 0x00000003800081a1
>>>>> [    0.000000] cpu_user_features = 0xdc0065c2 0xefe00000
>>>>> [    0.000000] mmu_features      = 0x7c006001
>>>>> [    0.000000] firmware_features = 0x0000001fc45bfc57
>>>>> [    0.000000] vmalloc start     = 0xc008000000000000
>>>>> [    0.000000] IO start          = 0xc00a000000000000
>>>>> [    0.000000] vmemmap start     = 0xc00c000000000000
>>>>>
>>>>>
>>>>> IIUC this is P5+? (ISA 2.04). On that pkey should be marked 
>>>>> disabled via
>>>>>
>>>>> static int scan_pkey_feature(void)
>>>>> {
>>>>>      int ret;
>>>>>      int pkeys_total = 0;
>>>>>
>>>>>      ....
>>>>>
>>>>>      /*
>>>>>       * Only P7 and above supports SPRN_AMR update with MSR[PR] = 1
>>>>>       */
>>>>>      if (!early_cpu_has_feature(CPU_FTR_ARCH_206))
>>>>>          return 0;
>>>>>
>>>>>
>>>>> }
>>>>>
>>>>> Can you boot with CONFIG_PPC_MEM_KEYS=n ?
>>>>
>>>> Can you try this change on top of master?
>>>>
>>>>
>>>> modified   arch/powerpc/mm/book3s64/pkeys.c
>>>> @@ -215,10 +215,6 @@ void __init pkey_early_init_devtree(void)
>>>>
>>>>       pr_info("Enabling pkeys with max key count %d\n", num_pkey);
>>>>   out:
>>>> -    /*
>>>> -     * Setup uamor on boot cpu
>>>> -     */
>>>> -    mtspr(SPRN_UAMOR, default_uamor);
>>>>
>>>>       return;
>>>>   }
>>>>
>>> Full patch with better description.
>>>
>>> commit 919a177bcdaf1eaeaeecc0d0f50a688629d7b5df
>>> Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> Date:   Sun Aug 9 20:37:38 2020 +0530
>>>
>>>     powerpc/pkeys: Fix boot failures with Nemo board (A-EON AmigaOne 
>>> X1000)
>>>
>>>     On p6 and before we should avoid updating UAMOR SPRN. This resulted
>>>     in boot failure on Nemo board.
>>>
>>>     Fixes: 269e829f48a0 ("powerpc/book3s64/pkey: Disable pkey on 
>>> POWER6 and before")
>>>     Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>>>     Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>
>>> diff --git a/arch/powerpc/mm/book3s64/pkeys.c 
>>> b/arch/powerpc/mm/book3s64/pkeys.c
>>> index 69a6b87f2bb4..b1d091a97611 100644
>>> --- a/arch/powerpc/mm/book3s64/pkeys.c
>>> +++ b/arch/powerpc/mm/book3s64/pkeys.c
>>> @@ -73,12 +73,6 @@ static int scan_pkey_feature(void)
>>>     if (early_radix_enabled())
>>>         return 0;
>>>
>>> -    /*
>>> -     * Only P7 and above supports SPRN_AMR update with MSR[PR] = 1
>>> -     */
>>> -    if (!early_cpu_has_feature(CPU_FTR_ARCH_206))
>>> -        return 0;
>>> -
>>>     ret = of_scan_flat_dt(dt_scan_storage_keys, &pkeys_total);
>>>     if (ret == 0) {
>>>         /*
>>> @@ -124,6 +118,12 @@ void __init pkey_early_init_devtree(void)
>>>              __builtin_popcountl(ARCH_VM_PKEY_FLAGS >> VM_PKEY_SHIFT)
>>>                 != (sizeof(u64) * BITS_PER_BYTE));
>>>
>>> +    /*
>>> +     * Only P7 and above supports SPRN_AMR update with MSR[PR] = 1
>>> +     */
>>> +    if (!early_cpu_has_feature(CPU_FTR_ARCH_206))
>>> +        return;
>>> +
>>>     /* scan the device tree for pkey feature */
>>>     pkeys_total = scan_pkey_feature();
>>>     if (!pkeys_total)
>

