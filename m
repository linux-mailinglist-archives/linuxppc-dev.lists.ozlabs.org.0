Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0B0547319
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 11:17:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKsgT2G54z3cf0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 19:17:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKsg24GLvz3cCh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 19:17:32 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LKsfw6mqYz9tNv;
	Sat, 11 Jun 2022 11:17:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dnZW2yyBCjhd; Sat, 11 Jun 2022 11:17:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LKsfw4Cb7z9tK6;
	Sat, 11 Jun 2022 11:17:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 70F2D8B77C;
	Sat, 11 Jun 2022 11:17:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id KFOXx0stcYVC; Sat, 11 Jun 2022 11:17:28 +0200 (CEST)
Received: from [192.168.6.192] (unknown [192.168.6.192])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 122078B768;
	Sat, 11 Jun 2022 11:17:28 +0200 (CEST)
Message-ID: <f6e5a9c4-f39d-749f-d124-884f11a8edfb@csgroup.eu>
Date: Sat, 11 Jun 2022 11:17:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] powerpc/rng: wire up during setup_arch
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20220611081114.449165-1-Jason@zx2c4.com>
 <956d2faa-4dae-fc75-2c03-387c77806f2b@csgroup.eu>
In-Reply-To: <956d2faa-4dae-fc75-2c03-387c77806f2b@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/06/2022 à 11:16, Christophe Leroy a écrit :
> 
> 
> Le 11/06/2022 à 10:11, Jason A. Donenfeld a écrit :
>> The platform's RNG must be available before random_init() in order to be
>> useful for initial seeding, which in turn means that it needs to be
>> called from setup_arch(), rather than from an init call. Fortunately,
>> each platform already has a setup_arch function pointer, which means
>> it's easy to wire this up for each of the three platforms that have an
>> RNG. This commit also removes some noisy log messages that don't add
>> much.
> 
> Can't we use one of the machine initcalls for that ?
> Like machine_early_initcall() or machine_arch_initcall() ?
> 
> Today it is using  machine_subsys_initcall() and you didn't remove it. 
> It means rng_init() will be called twice. Is that ok ?
> 

Also, you copied stable. Should you add a Fixes: tag so that we know 
what it fixes ?

> 
> 
>>
>> Cc: stable@vger.kernel.org
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>> ---
>>   arch/powerpc/platforms/microwatt/rng.c   |  9 ++-------
>>   arch/powerpc/platforms/microwatt/setup.c |  8 ++++++++
>>   arch/powerpc/platforms/powernv/rng.c     | 17 ++++-------------
>>   arch/powerpc/platforms/powernv/setup.c   |  4 ++++
>>   arch/powerpc/platforms/pseries/rng.c     | 11 ++---------
>>   arch/powerpc/platforms/pseries/setup.c   |  3 +++
>>   6 files changed, 23 insertions(+), 29 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/microwatt/rng.c 
>> b/arch/powerpc/platforms/microwatt/rng.c
>> index 7bc4d1cbfaf0..d13f656910ad 100644
>> --- a/arch/powerpc/platforms/microwatt/rng.c
>> +++ b/arch/powerpc/platforms/microwatt/rng.c
>> @@ -29,7 +29,7 @@ static int microwatt_get_random_darn(unsigned long *v)
>>       return 1;
>>   }
>> -static __init int rng_init(void)
>> +__init void microwatt_rng_init(void)
>>   {
>>       unsigned long val;
>>       int i;
>> @@ -37,12 +37,7 @@ static __init int rng_init(void)
>>       for (i = 0; i < 10; i++) {
>>           if (microwatt_get_random_darn(&val)) {
>>               ppc_md.get_random_seed = microwatt_get_random_darn;
>> -            return 0;
>> +            return;
>>           }
>>       }
>> -
>> -    pr_warn("Unable to use DARN for get_random_seed()\n");
>> -
>> -    return -EIO;
>>   }
>> -machine_subsys_initcall(, rng_init);
>> diff --git a/arch/powerpc/platforms/microwatt/setup.c 
>> b/arch/powerpc/platforms/microwatt/setup.c
>> index 0b02603bdb74..23c996dcc870 100644
>> --- a/arch/powerpc/platforms/microwatt/setup.c
>> +++ b/arch/powerpc/platforms/microwatt/setup.c
>> @@ -32,10 +32,18 @@ static int __init microwatt_populate(void)
>>   }
>>   machine_arch_initcall(microwatt, microwatt_populate);
>> +__init void microwatt_rng_init(void);
>> +
>> +static void __init microwatt_setup_arch(void)
>> +{
>> +    microwatt_rng_init();
>> +}
>> +
>>   define_machine(microwatt) {
>>       .name            = "microwatt",
>>       .probe            = microwatt_probe,
>>       .init_IRQ        = microwatt_init_IRQ,
>> +    .setup_arch        = microwatt_setup_arch,
>>       .progress        = udbg_progress,
>>       .calibrate_decr        = generic_calibrate_decr,
>>   };
>> diff --git a/arch/powerpc/platforms/powernv/rng.c 
>> b/arch/powerpc/platforms/powernv/rng.c
>> index e3d44b36ae98..ef24e72a1b69 100644
>> --- a/arch/powerpc/platforms/powernv/rng.c
>> +++ b/arch/powerpc/platforms/powernv/rng.c
>> @@ -84,24 +84,20 @@ static int powernv_get_random_darn(unsigned long *v)
>>       return 1;
>>   }
>> -static int __init initialise_darn(void)
>> +static void __init initialise_darn(void)
>>   {
>>       unsigned long val;
>>       int i;
>>       if (!cpu_has_feature(CPU_FTR_ARCH_300))
>> -        return -ENODEV;
>> +        return;
>>       for (i = 0; i < 10; i++) {
>>           if (powernv_get_random_darn(&val)) {
>>               ppc_md.get_random_seed = powernv_get_random_darn;
>> -            return 0;
>> +            return;
>>           }
>>       }
>> -
>> -    pr_warn("Unable to use DARN for get_random_seed()\n");
>> -
>> -    return -EIO;
>>   }
>>   int powernv_get_random_long(unsigned long *v)
>> @@ -163,14 +159,12 @@ static __init int rng_create(struct device_node 
>> *dn)
>>       rng_init_per_cpu(rng, dn);
>> -    pr_info_once("Registering arch random hook.\n");
>> -
>>       ppc_md.get_random_seed = powernv_get_random_long;
>>       return 0;
>>   }
>> -static __init int rng_init(void)
>> +__init void powernv_rng_init(void)
>>   {
>>       struct device_node *dn;
>>       int rc;
>> @@ -188,7 +182,4 @@ static __init int rng_init(void)
>>       }
>>       initialise_darn();
>> -
>> -    return 0;
>>   }
>> -machine_subsys_initcall(powernv, rng_init);
>> diff --git a/arch/powerpc/platforms/powernv/setup.c 
>> b/arch/powerpc/platforms/powernv/setup.c
>> index 824c3ad7a0fa..a0c5217bc5c0 100644
>> --- a/arch/powerpc/platforms/powernv/setup.c
>> +++ b/arch/powerpc/platforms/powernv/setup.c
>> @@ -184,6 +184,8 @@ static void __init pnv_check_guarded_cores(void)
>>       }
>>   }
>> +__init void powernv_rng_init(void);
>> +
>>   static void __init pnv_setup_arch(void)
>>   {
>>       set_arch_panic_timeout(10, ARCH_PANIC_TIMEOUT);
>> @@ -203,6 +205,8 @@ static void __init pnv_setup_arch(void)
>>       pnv_check_guarded_cores();
>>       /* XXX PMCS */
>> +
>> +    powernv_rng_init();
>>   }
>>   static void __init pnv_init(void)
>> diff --git a/arch/powerpc/platforms/pseries/rng.c 
>> b/arch/powerpc/platforms/pseries/rng.c
>> index 6268545947b8..d39bfce39aa1 100644
>> --- a/arch/powerpc/platforms/pseries/rng.c
>> +++ b/arch/powerpc/platforms/pseries/rng.c
>> @@ -24,19 +24,12 @@ static int pseries_get_random_long(unsigned long *v)
>>       return 0;
>>   }
>> -static __init int rng_init(void)
>> +__init void pseries_rng_init(void)
>>   {
>>       struct device_node *dn;
>> -
>>       dn = of_find_compatible_node(NULL, NULL, "ibm,random");
>>       if (!dn)
>> -        return -ENODEV;
>> -
>> -    pr_info("Registering arch random hook.\n");
>> -
>> +        return;
>>       ppc_md.get_random_seed = pseries_get_random_long;
>> -
>>       of_node_put(dn);
>> -    return 0;
>>   }
>> -machine_subsys_initcall(pseries, rng_init);
>> diff --git a/arch/powerpc/platforms/pseries/setup.c 
>> b/arch/powerpc/platforms/pseries/setup.c
>> index afb074269b42..7f3ee2658163 100644
>> --- a/arch/powerpc/platforms/pseries/setup.c
>> +++ b/arch/powerpc/platforms/pseries/setup.c
>> @@ -779,6 +779,8 @@ static resource_size_t 
>> pseries_pci_iov_resource_alignment(struct pci_dev *pdev,
>>   }
>>   #endif
>> +__init void pseries_rng_init(void);
>> +
>>   static void __init pSeries_setup_arch(void)
>>   {
>>       set_arch_panic_timeout(10, ARCH_PANIC_TIMEOUT);
>> @@ -839,6 +841,7 @@ static void __init pSeries_setup_arch(void)
>>       }
>>       ppc_md.pcibios_root_bridge_prepare = pseries_root_bridge_prepare;
>> +    pseries_rng_init();
>>   }
>>   static void pseries_panic(char *str)
