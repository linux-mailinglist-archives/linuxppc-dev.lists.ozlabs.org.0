Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E2C3FFC61
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 10:54:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1BSB1ckrz2ynM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 18:54:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1BRl4n8xz2yHR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 18:54:09 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H1BRb3THfz9sT9;
 Fri,  3 Sep 2021 10:54:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9JmwoyaGwxb; Fri,  3 Sep 2021 10:54:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H1BRY486Bz9sTF;
 Fri,  3 Sep 2021 10:54:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F4348B8D5;
 Fri,  3 Sep 2021 10:54:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Mih_7c73FeuN; Fri,  3 Sep 2021 10:54:01 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 010A58B764;
 Fri,  3 Sep 2021 10:54:00 +0200 (CEST)
Subject: Re: [PATCH v2 5/5] powerpc/signal: Use unsafe_copy_siginfo_to_user()
To: "Eric W. Biederman" <ebiederm@xmission.com>
References: <fd7938d94008711d441551c06b25a033669a0618.1629732940.git.christophe.leroy@csgroup.eu>
 <7d391d915d2bd1c0f601f55f61f8dd4c70066229.1629732940.git.christophe.leroy@csgroup.eu>
 <87y28ex1ov.fsf@disp2133>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <08117c1e-7805-534f-42ca-54a885f272cd@csgroup.eu>
Date: Fri, 3 Sep 2021 10:53:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87y28ex1ov.fsf@disp2133>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/09/2021 à 20:38, Eric W. Biederman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> 
>> Use unsafe_copy_siginfo_to_user() in order to do the copy
>> within the user access block.
>>
>> On an mpc 8321 (book3s/32) the improvment is about 5% on a process
>> sending a signal to itself.
> 
> Nacked-by: "Eric W. Biederman" <ebiederm@xmission.com>
> 
> copy_siginfo_to_user is not the same as copy_siginfo_to_user32.
> 
> As in this patch breaks 32bit userspace on powerpc.

I don't understand your comment. As you can see below, copy_siginfo_to_user32() is used in the 
compat case (ie 32 bit userspace on PPC64) and unsafe_copy_siginfo_to_user() is used on the 
non-compat case (ie 32 bit userspace on PPC32).

So what's the issue really ?

> 
> 
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/kernel/signal_32.c | 13 ++++++-------
>>   arch/powerpc/kernel/signal_64.c |  5 +----
>>   2 files changed, 7 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
>> index ff101e2b3bab..f9e16d108bc8 100644
>> --- a/arch/powerpc/kernel/signal_32.c
>> +++ b/arch/powerpc/kernel/signal_32.c
>> @@ -710,12 +710,6 @@ static long restore_tm_user_regs(struct pt_regs *regs, struct mcontext __user *s
>>   }
>>   #endif
>>   
>> -#ifdef CONFIG_PPC64
>> -
>> -#define copy_siginfo_to_user	copy_siginfo_to_user32
>> -
>> -#endif /* CONFIG_PPC64 */
>> -
>>   /*
>>    * Set up a signal frame for a "real-time" signal handler
>>    * (one which gets siginfo).
>> @@ -779,14 +773,19 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
>>   		asm("dcbst %y0; sync; icbi %y0; sync" :: "Z" (mctx->mc_pad[0]));
>>   	}
>>   	unsafe_put_sigset_t(&frame->uc.uc_sigmask, oldset, failed);
>> +#ifndef CONFIG_COMPAT
>> +	unsafe_copy_siginfo_to_user(&frame->info, &ksig->info, failed);
>> +#endif
>>   
>>   	/* create a stack frame for the caller of the handler */
>>   	unsafe_put_user(regs->gpr[1], newsp, failed);
>>   
>>   	user_access_end();
>>   
>> -	if (copy_siginfo_to_user(&frame->info, &ksig->info))
>> +#ifdef CONFIG_COMPAT
>> +	if (copy_siginfo_to_user32(&frame->info, &ksig->info))
>>   		goto badframe;
>> +#endif
>>   
>>   	regs->link = tramp;
>>   
>> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
>> index 2cca6c8febe1..82b73fbd937d 100644
>> --- a/arch/powerpc/kernel/signal_64.c
>> +++ b/arch/powerpc/kernel/signal_64.c
>> @@ -901,15 +901,12 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>>   	}
>>   
>>   	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), badframe_block);
>> +	unsafe_copy_siginfo_to_user(&frame->info, &ksig->info, badframe_block);
>>   	/* Allocate a dummy caller frame for the signal handler. */
>>   	unsafe_put_user(regs->gpr[1], newsp, badframe_block);
>>   
>>   	user_write_access_end();
>>   
>> -	/* Save the siginfo outside of the unsafe block. */
>> -	if (copy_siginfo_to_user(&frame->info, &ksig->info))
>> -		goto badframe;
>> -
>>   	/* Make sure signal handler doesn't get spurious FP exceptions */
>>   	tsk->thread.fp_state.fpscr = 0;
