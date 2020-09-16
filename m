Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F5226BC09
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 07:57:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrqBl3H79zDqTT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 15:57:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Brq9016fJzDqKh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 15:56:17 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.108])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id E2C636214734;
 Wed, 16 Sep 2020 07:56:11 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 16 Sep
 2020 07:56:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0036402dd67-790b-4e21-a2fd-bbbd9dbeed35,
 282F6B8BB580550643A9CB45D70726BD5CC915E6) smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 2/7] powerpc/prom: Introduce early_reserve_mem_old()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20200914211007.2285999-1-clg@kaod.org>
 <20200914211007.2285999-3-clg@kaod.org>
 <20200915184607.Horde._j-BRtSmJ6vRGSRwLWoN7Q2@messagerie.si.c-s.fr>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0d130b93-ce57-7efb-f528-f48a5feaf5ec@kaod.org>
Date: Wed, 16 Sep 2020 07:56:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200915184607.Horde._j-BRtSmJ6vRGSRwLWoN7Q2@messagerie.si.c-s.fr>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d605cbd9-b3cb-43ce-899a-5a87df6c0b0a
X-Ovh-Tracer-Id: 12176326018178321376
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrtddugdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghu
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/15/20 6:46 PM, Christophe Leroy wrote:
> Cédric Le Goater <clg@kaod.org> a écrit :
> 
>> and condition its call with IS_ENABLED(CONFIG_PPC32). This fixes a
>> compile error with W=1.
>>
>> arch/powerpc/kernel/prom.c: In function ‘early_reserve_mem’:
>> arch/powerpc/kernel/prom.c:625:10: error: variable ‘reserve_map’ set but not used [-Werror=unused-but-set-variable]
>>   __be64 *reserve_map;
>>           ^~~~~~~~~~~
>> cc1: all warnings being treated as errors
>>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> 
> @csgroup.eu instead of @c-s.fr please
> 
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  arch/powerpc/kernel/prom.c | 37 ++++++++++++++++++++-----------------
>>  1 file changed, 20 insertions(+), 17 deletions(-)
> 
> That's a lot of changes for a tiny warning.
> 
> You could make it easy by just replacing the #ifdef by:
> 
>         if (!IS_ENABLED(CONFIG_PPC32))
>                 return;

It's equivalent and it moves out the reserve_map variable of the main routine
which I think is better.

>>
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index d8a2fb87ba0c..c958b67cf1a5 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -620,27 +620,14 @@ static void __init early_reserve_mem_dt(void)
>>      }
>>  }
>>
>> -static void __init early_reserve_mem(void)
>> +static void __init early_reserve_mem_old(void)
> 
> Why _old ? Do you mean ppc32 are old ? Modern ADSL boxes like for instance the famous French freebox have powerpc32 microcontroller.
> Eventually you could name it _ppc32, but I don't think that's the good way, see above.

I choose old because of the comment ' ... booting from an old kexec ... ', 
but I agree _ppc32 might be a better choice.

Thanks,

C. 

> Christophe
> 
>>  {
>>      __be64 *reserve_map;
>>
>>      reserve_map = (__be64 *)(((unsigned long)initial_boot_params) +
>>              fdt_off_mem_rsvmap(initial_boot_params));
>>
>> -    /* Look for the new "reserved-regions" property in the DT */
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
>>       * Handle the case where we might be booting from an old kexec
>>       * image that setup the mem_rsvmap as pairs of 32-bit values
>>       */
>> @@ -658,9 +645,25 @@ static void __init early_reserve_mem(void)
>>              DBG("reserving: %x -> %x\n", base_32, size_32);
>>              memblock_reserve(base_32, size_32);
>>          }
>> -        return;
>>      }
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
>>  }
>>
>>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>> -- 
>> 2.25.4
> 
> 

