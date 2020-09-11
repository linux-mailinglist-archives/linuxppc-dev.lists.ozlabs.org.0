Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB17265912
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 08:04:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnlZF3FxqzDqpK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 16:04:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnlW503QkzDqbr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 16:01:20 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0FC8859DA695;
 Fri, 11 Sep 2020 08:01:14 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 11 Sep
 2020 08:01:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005d6e7107c-a020-4394-93b9-adbe5bb2ea45,
 A1694100663AAA22525CBAD2033D2796A0BDBC13) smtp.auth=clg@kaod.org
Subject: Re: [PATCH 2/7] powerpc/prom: Fix W=1 compile warning
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>
References: <20200910210250.1962595-1-clg@kaod.org>
 <20200910210250.1962595-3-clg@kaod.org>
 <ed65bab2-b42c-38f6-d68e-c9924cfca62d@csgroup.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2959d6d7-12d1-391e-ba73-06765a1c4d09@kaod.org>
Date: Fri, 11 Sep 2020 08:01:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ed65bab2-b42c-38f6-d68e-c9924cfca62d@csgroup.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5c9b7560-efdf-4eb6-bca8-79b689bbaa71
X-Ovh-Tracer-Id: 1344887442169564125
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehkedguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuh
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/11/20 7:33 AM, Christophe Leroy wrote:
> 
> 
> Le 10/09/2020 à 23:02, Cédric Le Goater a écrit :
>> arch/powerpc/kernel/prom.c: In function ‘early_reserve_mem’:
>> arch/powerpc/kernel/prom.c:625:10: error: variable ‘reserve_map’ set but not used [-Werror=unused-but-set-variable]
>>    __be64 *reserve_map;
>>            ^~~~~~~~~~~
>> cc1: all warnings being treated as errors
> 
> A small sentence explaining how this is fixes would be welcome, so that you don't need to read the code the know what the commit does to fix the warning. Also the subject should be more explicit.
> 
> 
>>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   arch/powerpc/kernel/prom.c | 51 +++++++++++++++++++-------------------
>>   1 file changed, 26 insertions(+), 25 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index d8a2fb87ba0c..4bae9ebc7d0b 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -622,11 +622,6 @@ static void __init early_reserve_mem_dt(void)
>>     static void __init early_reserve_mem(void)
>>   {
>> -    __be64 *reserve_map;
>> -
>> -    reserve_map = (__be64 *)(((unsigned long)initial_boot_params) +
>> -            fdt_off_mem_rsvmap(initial_boot_params));
>> -
>>       /* Look for the new "reserved-regions" property in the DT */
>>       early_reserve_mem_dt();
>>   @@ -639,28 +634,34 @@ static void __init early_reserve_mem(void)
>>       }
>>   #endif /* CONFIG_BLK_DEV_INITRD */
>>   -#ifdef CONFIG_PPC32
> 
> Instead of such a big change, you could simply do the following in addition to the move of reserve_map allocation after it.
> 
>     if (!IS_ENABLED(CONFIG_PPC32))
>         return;

yes. I will include a change for CONFIG_BLK_DEV_INITRD also.

Thanks,

C.  

> 
>> -    /*
>> -     * Handle the case where we might be booting from an old kexec
>> -     * image that setup the mem_rsvmap as pairs of 32-bit values
>> -     */
>> -    if (be64_to_cpup(reserve_map) > 0xffffffffull) {
>> -        u32 base_32, size_32;
>> -        __be32 *reserve_map_32 = (__be32 *)reserve_map;
>> -
>> -        DBG("Found old 32-bit reserve map\n");
>> -
>> -        while (1) {
>> -            base_32 = be32_to_cpup(reserve_map_32++);
>> -            size_32 = be32_to_cpup(reserve_map_32++);
>> -            if (size_32 == 0)
>> -                break;
>> -            DBG("reserving: %x -> %x\n", base_32, size_32);
>> -            memblock_reserve(base_32, size_32);
>> +    if (IS_ENABLED(CONFIG_PPC32)) {
>> +        __be64 *reserve_map;
>> +
>> +        reserve_map = (__be64 *)(((unsigned long)initial_boot_params) +
>> +                 fdt_off_mem_rsvmap(initial_boot_params));
>> +
>> +        /*
>> +         * Handle the case where we might be booting from an
>> +         * old kexec image that setup the mem_rsvmap as pairs
>> +         * of 32-bit values
>> +         */
>> +        if (be64_to_cpup(reserve_map) > 0xffffffffull) {
>> +            u32 base_32, size_32;
>> +            __be32 *reserve_map_32 = (__be32 *)reserve_map;
>> +
>> +            DBG("Found old 32-bit reserve map\n");
>> +
>> +            while (1) {
>> +                base_32 = be32_to_cpup(reserve_map_32++);
>> +                size_32 = be32_to_cpup(reserve_map_32++);
>> +                if (size_32 == 0)
>> +                    break;
>> +                DBG("reserving: %x -> %x\n", base_32, size_32);
>> +                memblock_reserve(base_32, size_32);
>> +            }
>> +            return;
>>           }
>> -        return;
>>       }
>> -#endif
>>   }
>>     #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>>
> 
> 
> Christophe

