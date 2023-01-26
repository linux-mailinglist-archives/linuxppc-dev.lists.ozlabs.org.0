Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF11667C4B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 08:12:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2X325dnCz3fBw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 18:12:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2X2T53tRz2xKS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 18:12:00 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4P2X2P6ns3z9sdG;
	Thu, 26 Jan 2023 08:11:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4w64rmqn36fk; Thu, 26 Jan 2023 08:11:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4P2X2G1D81z9sd7;
	Thu, 26 Jan 2023 08:11:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1B2B28B76D;
	Thu, 26 Jan 2023 08:11:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id AphlReuE6EUW; Thu, 26 Jan 2023 08:11:50 +0100 (CET)
Received: from [192.168.5.2] (unknown [192.168.5.2])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CBFF28B763;
	Thu, 26 Jan 2023 08:11:49 +0100 (CET)
Message-ID: <6f15e5fb-e02f-5b2e-86fe-ec271866330f@csgroup.eu>
Date: Thu, 26 Jan 2023 08:11:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] powerpc/kasan/book3s_64: warn when running with hash MMU
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>
References: <20221004223724.38707-1-nathanl@linux.ibm.com>
 <874jwhpp6g.fsf@mpe.ellerman.id.au>
 <9b6eb796-6b40-f61d-b9c6-c2e9ab0ced38@csgroup.eu>
 <87h70for01.fsf@mpe.ellerman.id.au> <8735bvbwgy.fsf@linux.ibm.com>
 <87v8oqn0hy.fsf@mpe.ellerman.id.au>
 <0c46ba45-1fff-d067-159c-1951c5985de0@csgroup.eu>
In-Reply-To: <0c46ba45-1fff-d067-159c-1951c5985de0@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, kasan-dev <kasan-dev@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/10/2022 à 12:25, Christophe Leroy a écrit :
> 
> 
> Le 11/10/2022 à 12:00, Michael Ellerman a écrit :
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>>> + KASAN list
>>>>>
>>>>> Le 06/10/2022 à 06:10, Michael Ellerman a écrit :
>>>>>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>>>>>> kasan is known to crash at boot on book3s_64 with non-radix MMU. As
>>>>>>> noted in commit 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only
>>>>>>> KASAN support"):
>>>>>>>
>>>>>>>      A kernel with CONFIG_KASAN=y will crash during boot on a machine
>>>>>>>      using HPT translation because not all the entry points to the
>>>>>>>      generic KASAN code are protected with a call to kasan_arch_is_ready().
>>>>>>
>>>>>> I guess I thought there was some plan to fix that.
>>>>>
>>>>> I was thinking the same.
>>>>>
>>>>> Do we have a list of the said entry points to the generic code that are
>>>>> lacking a call to kasan_arch_is_ready() ?
>>>>>
>>>>> Typically, the BUG dump below shows that kasan_byte_accessible() is
>>>>> lacking the check. It should be straight forward to add
>>>>> kasan_arch_is_ready() check to kasan_byte_accessible(), shouldn't it ?
>>>>
>>>> Yes :)
>>>>
>>>> And one other spot, but the patch below boots OK for me. I'll leave it
>>>> running for a while just in case there's a path I've missed.
>>>
>>> It works for me too, thanks (p8 pseries qemu).
>>
>> It works but I still see the kasan shadow getting mapped, which we would
>> ideally avoid.
>>
>>   From PTDUMP:
>>
>> ---[ kasan shadow mem start ]---
>> 0xc00f000000000000-0xc00f00000006ffff  0x00000000045e0000       448K         r  w       pte  valid  present        dirty  accessed
>> 0xc00f3ffffffe0000-0xc00f3fffffffffff  0x0000000004d80000       128K         r  w       pte  valid  present        dirty  accessed
>>
>> I haven't worked out how those are getting mapped.
> 
> 

Alternative patch proposed at 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/150768c55722311699fdcf8f5379e8256749f47d.1674716617.git.christophe.leroy@csgroup.eu/

Christophe
