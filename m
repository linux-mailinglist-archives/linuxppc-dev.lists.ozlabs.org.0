Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F34AE3FF9D9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 07:05:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H15Mt6kxkz2yyQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 15:05:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H15MR4WVgz2xnf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 15:05:03 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H15MG6r0mz9sT1;
 Fri,  3 Sep 2021 07:04:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aKafY1p_Mhvd; Fri,  3 Sep 2021 07:04:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H15MG5gtfz9sSx;
 Fri,  3 Sep 2021 07:04:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A53798B8B1;
 Fri,  3 Sep 2021 07:04:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MvFhAuvcaVQx; Fri,  3 Sep 2021 07:04:58 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 45E9F8B764;
 Fri,  3 Sep 2021 07:04:58 +0200 (CEST)
Subject: Re: [PATCH v2 1/2] powerpc/64s: system call scv tabort fix for
 corrupt irq soft-mask state
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20210901165418.1412891-1-npiggin@gmail.com>
 <65ed1ac8-f4af-742a-1d2a-e5db7e71a920@csgroup.eu>
 <1630553233.5hjr91skvz.astroid@bobo.none>
 <20210902215203.GM1583@gate.crashing.org>
 <20210902222002.GN1583@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <02971218-d669-8ab5-bf65-12c4227bd740@csgroup.eu>
Date: Fri, 3 Sep 2021 07:04:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902222002.GN1583@gate.crashing.org>
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
Cc: Eirik Fuller <efuller@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/09/2021 à 00:20, Segher Boessenkool a écrit :
> On Thu, Sep 02, 2021 at 04:52:03PM -0500, Segher Boessenkool wrote:
>> On Thu, Sep 02, 2021 at 01:33:10PM +1000, Nicholas Piggin wrote:
>>> Excerpts from Christophe Leroy's message of September 2, 2021 3:21 am:
>>>>> -	/* Firstly we need to enable TM in the kernel */
>>>>> +	/* We need to enable TM in the kernel, and disable EE (for scv) */
>>>>>    	mfmsr	r10
>>>>>    	li	r9, 1
>>>>>    	rldimi	r10, r9, MSR_TM_LG, 63-MSR_TM_LG
>>>>> +	LOAD_REG_IMMEDIATE(r9, MSR_EE)
>>>>> +	andc	r10, r10, r9
>>>>
>>>> Why not use 'rlwinm' to mask out MSR_EE ?
>>>>
>>>> Something like
>>>>
>>>> 	rlwinm	r10, r10, 0, ~MSR_EE
>>>
>>> Mainly because I'm bad at powerpc assembly. Why do you think I'm trying
>>> to change as much as possible to C?
>>
>> The actual bit (bit 31, i.e. with value 1UL << 32) cannot be cleared
>> with rlwinm (only the low 32 bits can).  There are many ways to do it
>> using two insns of course.
> 
> Wow I misread that, you want to clear MSR[EE] really, not MSR[TM].
> 
> You cannot use rlwinm and keep the high 32 bits of the target register
> intact.  You either clear all to 0 or set them to a copy of the rotated
> value in the low 32 bits.
> 

Oops, my mistake. When I tested it in C to see what was generated by GCC I forgot the ~ so I got 
rlwinm r3,r3,0,16,16 and didn't realise it was different from rlwinm r3,r3,0,~(1<<15)

By the way it would be more explicit if objdump could display the mask instead of the mask 
boundaries. Is there a way to do that ?

Christophe
