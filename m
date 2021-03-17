Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF6B33E930
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 06:44:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0fHF4zRWz3brf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 16:44:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0fGw32CLz30GQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 16:44:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F0fGn0RhXz9vBLr;
 Wed, 17 Mar 2021 06:44:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id pdp03bi22XnA; Wed, 17 Mar 2021 06:44:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F0fGm5lxqz9vBLq;
 Wed, 17 Mar 2021 06:44:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 951938B7F4;
 Wed, 17 Mar 2021 06:44:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wcS-Ghjp3a_F; Wed, 17 Mar 2021 06:44:01 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F4498B768;
 Wed, 17 Mar 2021 06:44:01 +0100 (CET)
Subject: Re: [PATCH v9 5/8] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
To: Jordan Niethe <jniethe5@gmail.com>
References: <20210316031741.1004850-1-jniethe5@gmail.com>
 <20210316031741.1004850-5-jniethe5@gmail.com>
 <1b4d4df4-4553-0f33-631f-5a2e5ae97547@csgroup.eu>
 <CACzsE9r4H7yyRfZ3_jcTsjUSwfbPiRyLn6AjU6r2hPWL=OV8pw@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8f051989-e2fe-070d-b62e-7b1cee7c5dad@csgroup.eu>
Date: Wed, 17 Mar 2021 06:43:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACzsE9r4H7yyRfZ3_jcTsjUSwfbPiRyLn6AjU6r2hPWL=OV8pw@mail.gmail.com>
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
Cc: ajd@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>,
 naveen.n.rao@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/03/2021 à 03:15, Jordan Niethe a écrit :
> On Tue, Mar 16, 2021 at 5:51 PM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>>
>>
>> Le 16/03/2021 à 04:17, Jordan Niethe a écrit :
>>> From: Russell Currey <ruscur@russell.cc>
>>>
>>> To enable strict module RWX on powerpc, set:
>>>
>>>       CONFIG_STRICT_MODULE_RWX=y
>>>
>>> You should also have CONFIG_STRICT_KERNEL_RWX=y set to have any real
>>> security benefit.
>>>
>>> ARCH_HAS_STRICT_MODULE_RWX is set to require ARCH_HAS_STRICT_KERNEL_RWX.
>>> This is due to a quirk in arch/Kconfig and arch/powerpc/Kconfig that
>>> makes STRICT_MODULE_RWX *on by default* in configurations where
>>> STRICT_KERNEL_RWX is *unavailable*.
>>
>> Not that easy on book3s/32. On it, you can't protect memory against execution on a page basis, you
>> can only do it on a segment basis. So in order to do that, when would need to allocate to areas of
>> memory: one in module space for text and one in vmalloc space for data.
>>
>> See https://github.com/linuxppc/linux/commit/6ca05532 and
>> https://github.com/linuxppc/linux/commit/7fbc22ce
> Would it be ok to just make ARCH_HAS_STRICT_MODULE_RWX conditional on 64s?

I think making it conditional on !PPC_BOOK3S_604 should be enough.

>>
>>
>>>
>>> Since this doesn't make much sense, and module RWX without kernel RWX
>>> doesn't make much sense, having the same dependencies as kernel RWX
>>> works around this problem.
>>>
>>> Signed-off-by: Russell Currey <ruscur@russell.cc>
>>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>>> ---
>>>    arch/powerpc/Kconfig | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index 4498a27ac9db..d9cadc4212d0 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -137,6 +137,7 @@ config PPC
>>>        select ARCH_HAS_SCALED_CPUTIME          if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
>>>        select ARCH_HAS_SET_MEMORY
>>>        select ARCH_HAS_STRICT_KERNEL_RWX       if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
>>> +     select ARCH_HAS_STRICT_MODULE_RWX       if ARCH_HAS_STRICT_KERNEL_RWX
>>>        select ARCH_HAS_TICK_BROADCAST          if GENERIC_CLOCKEVENTS_BROADCAST
>>>        select ARCH_HAS_UACCESS_FLUSHCACHE
>>>        select ARCH_HAS_COPY_MC                 if PPC64
>>>
