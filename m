Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BEC3A76FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 08:22:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3ysw2y9jz3bvv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 16:22:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3ysX5SxHz2yQw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 16:22:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G3ysN0drbzB8vR;
 Tue, 15 Jun 2021 08:22:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q1PNZKJsNX00; Tue, 15 Jun 2021 08:22:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G3ysM5FRGzB8rS;
 Tue, 15 Jun 2021 08:22:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 750DF8B7A3;
 Tue, 15 Jun 2021 08:22:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PCpz8eCCDujm; Tue, 15 Jun 2021 08:22:15 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0FC088B7A0;
 Tue, 15 Jun 2021 08:22:15 +0200 (CEST)
Subject: Re: [PATCH] powerpc/signal64: Don't read sigaction arguments back
 from user memory
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210610072949.3198522-1-mpe@ellerman.id.au>
 <1623633444.p3rmbd7eti.astroid@bobo.none>
 <c677eab1-0ecd-8630-89c0-6fcc35788356@csgroup.eu>
 <1623649744.mbu8z4p0v5.astroid@bobo.none>
 <e84f44e5-46a2-4076-b565-038057329be5@csgroup.eu>
Message-ID: <e01caafd-e96d-b31b-8983-4c0a9d285fc8@csgroup.eu>
Date: Tue, 15 Jun 2021 08:22:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e84f44e5-46a2-4076-b565-038057329be5@csgroup.eu>
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
Cc: cmr@codefail.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/06/2021 à 13:49, Christophe Leroy a écrit :
> 
> 
> Le 14/06/2021 à 07:49, Nicholas Piggin a écrit :
>> Excerpts from Christophe Leroy's message of June 14, 2021 3:30 pm:
>>>
>>>
>>> Le 14/06/2021 à 03:32, Nicholas Piggin a écrit :
>>>> Excerpts from Michael Ellerman's message of June 10, 2021 5:29 pm:
>>>>> When delivering a signal to a sigaction style handler (SA_SIGINFO), we
>>>>> pass pointers to the siginfo and ucontext via r4 and r5.
>>>>>
>>>>> Currently we populate the values in those registers by reading the
>>>>> pointers out of the sigframe in user memory, even though the values in
>>>>> user memory were written by the kernel just prior:
>>>>>
>>>>>     unsafe_put_user(&frame->info, &frame->pinfo, badframe_block);
>>>>>     unsafe_put_user(&frame->uc, &frame->puc, badframe_block);
>>>>>     ...
>>>>>     if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
>>>>>         err |= get_user(regs->gpr[4], (unsigned long __user *)&frame->pinfo);
>>>>>         err |= get_user(regs->gpr[5], (unsigned long __user *)&frame->puc);
>>>>>
>>>>> ie. we write &frame->info into frame->pinfo, and then read frame->pinfo
>>>>> back into r4, and similarly for &frame->uc.
>>>>>
>>>>> The code has always been like this, since linux-fullhistory commit
>>>>> d4f2d95eca2c ("Forward port of 2.4 ppc64 signal changes.").
>>>>>
>>>>> There's no reason for us to read the values back from user memory,
>>>>> rather than just setting the value in the gpr[4/5] directly. In fact
>>>>> reading the value back from user memory opens up the possibility of
>>>>> another user thread changing the values before we read them back.
>>>>> Although any process doing that would be racing against the kernel
>>>>> delivering the signal, and would risk corrupting the stack, so that
>>>>> would be a userspace bug.
>>>>>
>>>>> Note that this is 64-bit only code, so there's no subtlety with the size
>>>>> of pointers differing between kernel and user. Also the frame variable
>>>>> is not modified to point elsewhere during the function.
>>>>>
>>>>> In the past reading the values back from user memory was not costly, but
>>>>> now that we have KUAP on some CPUs it is, so we'd rather avoid it for
>>>>> that reason too.
>>>>>
>>>>> So change the code to just set the values directly, using the same
>>>>> values we have written to the sigframe previously in the function.
>>>>>
>>>>> Note also that this matches what our 32-bit signal code does.
>>>>>
>>>>> Using a version of will-it-scale's signal1_threads that sets SA_SIGINFO,
>>>>> this results in a ~4% increase in signals per second on a Power9, from
>>>>> 229,777 to 239,766.
>>>>
>>>> Good find, nice improvement. Will make it possible to make the error
>>>> handling much nicer too I think.
>>>>
>>>> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>>>>
>>>> You've moved copy_siginfo_to_user right up to the user access unlock,
>>>> could save 2 more KUAP lock/unlocks if we had an unsafe_clear_user. If
>>>> we can move the other user access stuff up as well, the stack frame
>>>> put_user could use unsafe_put_user as well, saving 1 more. Another few
>>>> percent?
>>>
>>> I'm looking at making an 'unsafe' version of copy_siginfo_to_user().
>>> That's straight forward for 'native' signals, but for compat signals that's more tricky.
>>
>> Ah nice. Native is most important at the moment.
>>
> 
> Finally not so easy. We have a quite efficient clear_user() which uses 'dcbz'. When replacing that 
> by a simplistic unsafe_clear_user() on the same model as unsafe_copy_to_user(), performance are 
> degradated on 32s. Need to implement it more efficiently.
> 

Don't know what I did yesterday. Performance is _not_ degraded, it is improved by 5%. I'll send out 
a series soon.
