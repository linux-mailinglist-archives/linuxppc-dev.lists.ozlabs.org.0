Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E9B3A7391
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 04:07:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3sCS51TPz306T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 12:07:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EOWBcdQS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EOWBcdQS; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3sC40qgSz300X
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 12:07:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G3sC30np1z9sWQ;
 Tue, 15 Jun 2021 12:07:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623722831;
 bh=pi1yvK982Zzlc3TRIoYCQt2tVmoXDSZLwAxf+lGnsWI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EOWBcdQSavO5WmtiqG3HMhlg3cog9D+W6Z9tU2cMGI24WVSidQnUkwYK3upojagI1
 XEmnyYNpARJqRe7g01xuvFcz3Bes8AE18i+WRQIG7ayvFlJrbPASZ+QE7SIEV+vXVG
 67uUvJZff5FYwBewbuqUvEry7UK5Aik7cnfU9ov3IWZLXOeW6GXGXMbkH1CNHrk5CM
 cLjLQ9KLNA1JYvyyVvuytgyL5Tho9TntQwUNqmY+ZeAIMeM0oSiH/B8ccPgFNepAis
 ynbauvP/xT9v8Q3mLNOjcDxdfgJhRVlyL19lQ6Y8VbRfNcPlQbfo0xoXLqFds182Ln
 YTlEGV7hp0tbg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/signal64: Copy siginfo before changing regs->nip
In-Reply-To: <1623633868.lnyugcilh9.astroid@bobo.none>
References: <20210608134605.2783677-1-mpe@ellerman.id.au>
 <1623631623.jvh0hlk56m.astroid@bobo.none>
 <1623633868.lnyugcilh9.astroid@bobo.none>
Date: Tue, 15 Jun 2021 12:07:10 +1000
Message-ID: <87tulzubht.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: dja@axtens.net, cmr@codefail.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Nicholas Piggin's message of June 14, 2021 10:47 am:
>> Excerpts from Michael Ellerman's message of June 8, 2021 11:46 pm:
>>> In commit 96d7a4e06fab ("powerpc/signal64: Rewrite handle_rt_signal64()
>>> to minimise uaccess switches") the 64-bit signal code was rearranged to
>>> use user_write_access_begin/end().
>>> 
>>> As part of that change the call to copy_siginfo_to_user() was moved
>>> later in the function, so that it could be done after the
>>> user_write_access_end().
>>> 
>>> In particular it was moved after we modify regs->nip to point to the
>>> signal trampoline. That means if copy_siginfo_to_user() fails we exit
>>> handle_rt_signal64() with an error but with regs->nip modified, whereas
>>> previously we would not modify regs->nip until the copy succeeded.
>>> 
>>> Returning an error from signal delivery but with regs->nip updated
>>> leaves the process in a sort of half-delivered state. We do immediately
>>> force a SEGV in signal_setup_done(), called from do_signal(), so the
>>> process should never run in the half-delivered state.
>>> 
>>> However that SEGV is not delivered until we've gone around to
>>> do_notify_resume() again, so it's possible some tracing could observe
>>> the half-delivered state.
>>> 
>>> There are other cases where we fail signal delivery with regs partly
>>> updated, eg. the write to newsp and SA_SIGINFO, but the latter at least
>>> is very unlikely to fail as it reads back from the frame we just wrote
>>> to.
>>> 
>>> Looking at other arches they seem to be more careful about leaving regs
>>> unchanged until the copy operations have succeeded, and in general that
>>> seems like good hygenie.
>>> 
>>> So although the current behaviour is not cleary buggy, it's also not
>>> clearly correct. So move the call to copy_siginfo_to_user() up prior to
>>> the modification of regs->nip, which is closer to the old behaviour, and
>>> easier to reason about.
>> 
>> Good catch, should it still have a Fixes: tag though? Even if it's not
>> clearly buggy we want it to be patched.
>
> Also...
>
>>> 
>>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>> ---
>>>  arch/powerpc/kernel/signal_64.c | 9 ++++-----
>>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>> 
>>> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
>>> index dca66481d0c2..f9e1f5428b9e 100644
>>> --- a/arch/powerpc/kernel/signal_64.c
>>> +++ b/arch/powerpc/kernel/signal_64.c
>>> @@ -902,6 +902,10 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>>>  	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), badframe_block);
>>>  	user_write_access_end();
>>>  
>>> +	/* Save the siginfo outside of the unsafe block. */
>>> +	if (copy_siginfo_to_user(&frame->info, &ksig->info))
>>> +		goto badframe;
>>> +
>>>  	/* Make sure signal handler doesn't get spurious FP exceptions */
>>>  	tsk->thread.fp_state.fpscr = 0;
>>>  
>>> @@ -915,11 +919,6 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>>>  		regs->nip = (unsigned long) &frame->tramp[0];
>>>  	}
>>>  
>>> -
>>> -	/* Save the siginfo outside of the unsafe block. */
>>> -	if (copy_siginfo_to_user(&frame->info, &ksig->info))
>>> -		goto badframe;
>>> -
>>>  	/* Allocate a dummy caller frame for the signal handler. */
>>>  	newsp = ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
>>>  	err |= put_user(regs->gpr[1], (unsigned long __user *)newsp);
>
> Does the same reasoning apply to this one and the ELF V1 function
> descriptor thing? It seems like you could move all of that block
> up instead. With your other SA_SIGINFO get_user patch, there would
> then be no possibility of error after you start modifying regs.

Yeah I think we should rework it further and eventually get to the point
were we leave regs untouched until we're guaranteed to return success.

It will need a bit more work though because of copy_siginfo_to_user().

cheers
