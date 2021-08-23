Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C80D23F46A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 10:31:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtQS44wNtz2yJn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 18:31:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 572 seconds by postgrey-1.36 at boromir;
 Mon, 23 Aug 2021 18:30:34 AEST
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtQRZ0bQmz2xXh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Aug 2021 18:30:33 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.108])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 54235BA8158A;
 Mon, 23 Aug 2021 10:20:54 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 23 Aug
 2021 10:20:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0015d4601f9-e0fb-4695-8867-0b4476002d43,
 6C3DA580BFD2A03B9CD9C7EDF86CA127720438B1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 83.199.102.86
Subject: Re: [PATCH 1/6] powerpc/prom: Introduce early_reserve_mem_old()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20210819125656.14498-1-clg@kaod.org>
 <20210819125656.14498-2-clg@kaod.org>
 <d79611e0-b42b-e74b-d628-5db718e6ebfa@csgroup.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8c9d3bfa-bf4c-900c-6746-7c0988b57a44@kaod.org>
Date: Mon, 23 Aug 2021 10:20:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d79611e0-b42b-e74b-d628-5db718e6ebfa@csgroup.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d21427e2-007d-4a28-a8e9-bc079d85b400
X-Ovh-Tracer-Id: 6513893914420218848
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedgtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuh
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/19/21 4:42 PM, Christophe Leroy wrote:
> 
> 
> Le 19/08/2021 à 14:56, Cédric Le Goater a écrit :
>> and condition its call with IS_ENABLED(CONFIG_PPC32). This fixes a
>> compile error with W=1.
>>
>> arch/powerpc/kernel/prom.c: In function ‘early_reserve_mem’:
>> arch/powerpc/kernel/prom.c:625:10: error: variable ‘reserve_map’ set but not used [-Werror=unused-but-set-variable]
>>    __be64 *reserve_map;
>>            ^~~~~~~~~~~
>> cc1: all warnings being treated as errors
>>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>   Christophe, I think you had comments on this one ? Yes, I am being a bit lazy.
> 
> 
> Yeah, my comment was to leave thing almost as is, just drop the #ifdef CONFIG_PPC32 and instead put something like:
> 
>     if (!IS_ENABLED(CONFIG_PPC32))
>         return;
> 
>>
>>   arch/powerpc/kernel/prom.c | 37 ++++++++++++++++++++-----------------
>>   1 file changed, 20 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index f620e04dc9bf..52869d12bc1d 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -621,27 +621,14 @@ static void __init early_reserve_mem_dt(void)
>>       }
>>   }
>>   -static void __init early_reserve_mem(void)
>> +static void __init early_reserve_mem_old(void)
> 
> Why old ? Because ppc32 ?

No. because there is message a bit below saying :

		DBG("Found old 32-bit reserve map\n");

> I think that's more changes than needed.

OK. np. I will use your suggestion.

Thanks,

C. 

 
> 
> 
>>   {
>>       __be64 *reserve_map;
>>         reserve_map = (__be64 *)(((unsigned long)initial_boot_params) +
>>               fdt_off_mem_rsvmap(initial_boot_params));
>>   -    /* Look for the new "reserved-regions" property in the DT */
>> -    early_reserve_mem_dt();
>> -
>> -#ifdef CONFIG_BLK_DEV_INITRD
>> -    /* Then reserve the initrd, if any */
>> -    if (initrd_start && (initrd_end > initrd_start)) {
>> -        memblock_reserve(ALIGN_DOWN(__pa(initrd_start), PAGE_SIZE),
>> -            ALIGN(initrd_end, PAGE_SIZE) -
>> -            ALIGN_DOWN(initrd_start, PAGE_SIZE));
>> -    }
>> -#endif /* CONFIG_BLK_DEV_INITRD */
>> -
>> -#ifdef CONFIG_PPC32
>> -    /*
>> +    /*
>>        * Handle the case where we might be booting from an old kexec
>>        * image that setup the mem_rsvmap as pairs of 32-bit values
>>        */
>> @@ -659,9 +646,25 @@ static void __init early_reserve_mem(void)
>>               DBG("reserving: %x -> %x\n", base_32, size_32);
>>               memblock_reserve(base_32, size_32);
>>           }
>> -        return;
>>       }
>> -#endif
>> +}
>> +
>> +static void __init early_reserve_mem(void)
>> +{
>> +    /* Look for the new "reserved-regions" property in the DT */
>> +    early_reserve_mem_dt();
>> +
>> +#ifdef CONFIG_BLK_DEV_INITRD
>> +    /* Then reserve the initrd, if any */
>> +    if (initrd_start && (initrd_end > initrd_start)) {
>> +        memblock_reserve(ALIGN_DOWN(__pa(initrd_start), PAGE_SIZE),
>> +            ALIGN(initrd_end, PAGE_SIZE) -
>> +            ALIGN_DOWN(initrd_start, PAGE_SIZE));
>> +    }
>> +#endif /* CONFIG_BLK_DEV_INITRD */
>> +
>> +    if (IS_ENABLED(CONFIG_PPC32))
>> +        early_reserve_mem_old();
>>   }
>>     #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>>

