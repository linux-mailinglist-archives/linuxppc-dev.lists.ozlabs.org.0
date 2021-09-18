Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4CC41053C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 10:47:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HBPbK2nYnz2yxP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 18:47:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HBPZt4nflz2xYS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Sep 2021 18:47:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HBPZq2GbFz9sTp;
 Sat, 18 Sep 2021 10:47:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yf6k13u2YIhg; Sat, 18 Sep 2021 10:47:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HBPZq18Bgz9sTK;
 Sat, 18 Sep 2021 10:47:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B3C08B768;
 Sat, 18 Sep 2021 10:47:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YWRbRl4cy6C5; Sat, 18 Sep 2021 10:47:14 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.70])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6AE278B764;
 Sat, 18 Sep 2021 10:47:14 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/32: Don't use a struct based type for pte_t
To: David Laight <David.Laight@ACULAB.COM>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <c904599f33aaf6bb7ee2836a9ff8368509e0d78d.1631887042.git.christophe.leroy@csgroup.eu>
 <505920070e5f4bf8ad7ccaa12f346469@AcuMS.aculab.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <07fea205-ffb2-dc32-a56d-1cce51d5f931@csgroup.eu>
Date: Sat, 18 Sep 2021 10:47:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <505920070e5f4bf8ad7ccaa12f346469@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/09/2021 à 16:32, David Laight a écrit :
> From: Christophe Leroy
>> Sent: 17 September 2021 14:58
>>
>> Long time ago we had a config item called STRICT_MM_TYPECHECKS
>> to build the kernel with pte_t defined as a structure in order
>> to perform additional build checks or build it with pte_t
>> defined as a simple type in order to get simpler generated code.
>>
> ...
>> diff --git a/arch/powerpc/include/asm/pgtable-types.h b/arch/powerpc/include/asm/pgtable-types.h
>> index d11b4c61d686..c60199fc6fa6 100644
>> --- a/arch/powerpc/include/asm/pgtable-types.h
>> +++ b/arch/powerpc/include/asm/pgtable-types.h
>> @@ -5,14 +5,26 @@
>>   /* PTE level */
>>   #if defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES)
>>   typedef struct { pte_basic_t pte, pte1, pte2, pte3; } pte_t;
>> -#else
>> +#elif defined(__CHECKER__) || !defined(CONFIG_PPC32)
>>   typedef struct { pte_basic_t pte; } pte_t;
>> +#else
>> +typedef pte_basic_t pte_t;
>>   #endif
>> +
>> +#if defined(__CHECKER__) || !defined(CONFIG_PPC32) || \
>> +    (defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES))
>>   #define __pte(x)	((pte_t) { (x) })
>>   static inline pte_basic_t pte_val(pte_t x)
>>   {
>>   	return x.pte;
>>   }
>> +#else
>> +#define __pte(x)	((pte_t)(x))
>> +static inline pte_basic_t pte_val(pte_t x)
>> +{
>> +	return x;
>> +}
>> +#endif
> 
> Would it be better to define:
> static inline pte_basic_*pte_basic(pte_t *x)
> {
> #if xxx
> 	return x;
> #else
> 	return &x->pte;
> #endif
> }
> 
> Then pte_val(x) is always *pt_basic(x)
> and the casts like:
> 
>> -	pte_basic_t *entry = &ptep->pte;
>> +	pte_basic_t *entry = (pte_basic_t *)ptep;
> 
> can go away.
> 


I don't like that idea too much, because it means going through a 
pointer of something which is not in memory at the begining. Doing that 
forces GCC to put the pte_t object on stack. And that's exactly the 
purpose of this patch: avoid having to go via memory. Allthough recent 
versions of GCC optimise it away at the end, I don't like it in principle.

And the only two places (pte_update() and set_huge_pte_at() where this 
cast is required are really two places very special which deal with real 
page tables. So IMHO it makes sense to explicitely show that what we use 
is the address of the entry in the page table.

Christophe
