Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B05A53A7393
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 04:11:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3sJM2RNXz30DG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 12:11:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=EsKB9NIp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EsKB9NIp; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3sHv4r44z2yX1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 12:11:22 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id h12so7635714plf.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 19:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=gRq2FYXbBfZE78ZlbIvRRAtOBRqSS2pti8IDQuYyl3A=;
 b=EsKB9NIpiQrIfF1WxV8wV1gLEwR+g77x0P/DLbKyq20cCgSvciV/nytqWyGThuivgT
 9s6YSJQneSDdiyrw0IQggegTL0qz5OuO8jNHEK3w/6Oq+DAVMR80R7vx8efUBpGVGZa3
 e1uB7X3Na68C2sI1USIZM0E1HItUTiRV3grnUHknN+rP3LIHbaSLEOhjKNQA5S+9bkVx
 8p8ysv69n0plt2RQ4+jJHf7GoqNwTy6mmFxErlGsApk7OMcltOj0epWfp2bvR9QweSSa
 KXRNKyBWQ/4erPkFi5iMHNqSfPGM6hYRl58EtYjuZGYT75fsysTRMkpOAuQb2HFKay1e
 L5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=gRq2FYXbBfZE78ZlbIvRRAtOBRqSS2pti8IDQuYyl3A=;
 b=sK7GJrXaPGPAfaG1fQkbwu4TIqAmYJlXaqT/P3G5jQIJAethZH3jcwR4TkT8HK2+Vl
 xLbuSkq9/1s05zfY8hnJj78/uRO04ttKRjdagyX4iE7e+nPY2DIQqBsnvpTq0at4FArk
 qAa50yGkjeBwASHZxbWGJfLuIqiqSsRniyd3a0O7QwOS/vziDfRf3B2+FEOq7ABCliX3
 6tY+tzsIvvnux+at1vKL//H0cwTdOSBwDjSZ1IPO5CrWOqNp+XdoB4Rwq3ipm9PG2t3s
 Us4olRzc7gQ6bkCEjO2CDN/E6RKifyBVTJH1bFOKguZd5WZhjteLKoN7sgBn73C9jT6M
 Wz1Q==
X-Gm-Message-State: AOAM531DTTDn9gl9GVUD8c8B9SICB2btt66DexZ/x58hcccczDn0OKV7
 yX3eGbWC6UukxyfgU7SWs9g=
X-Google-Smtp-Source: ABdhPJzVGinTVmAB0FAEJ5SHYnVSAjLL2JBxIsCsJAbt2lpR4YKXXKU409R2ztZj6ED8rx8W7rh3tg==
X-Received: by 2002:a17:902:b40e:b029:113:fbd6:3fe8 with SMTP id
 x14-20020a170902b40eb0290113fbd63fe8mr1726998plr.22.1623723080126; 
 Mon, 14 Jun 2021 19:11:20 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id d12sm13409896pfo.113.2021.06.14.19.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 19:11:19 -0700 (PDT)
Date: Tue, 15 Jun 2021 12:11:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/signal64: Copy siginfo before changing regs->nip
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210608134605.2783677-1-mpe@ellerman.id.au>
 <1623631623.jvh0hlk56m.astroid@bobo.none>
 <1623633868.lnyugcilh9.astroid@bobo.none>
 <759f715b-df1f-847d-d836-2d202c8a7dc4@csgroup.eu>
 <1623649799.9s42wcnyya.astroid@bobo.none>
 <a7739358-6dd3-2f5d-50c4-f6b908ab2718@csgroup.eu>
In-Reply-To: <a7739358-6dd3-2f5d-50c4-f6b908ab2718@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1623722824.bpyc873xto.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Excerpts from Christophe Leroy's message of June 14, 2021 5:22 pm:
>=20
>=20
> Le 14/06/2021 =C3=A0 07:55, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of June 14, 2021 3:31 pm:
>>>
>>>
>>> Le 14/06/2021 =C3=A0 03:29, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> Excerpts from Nicholas Piggin's message of June 14, 2021 10:47 am:
>>>>> Excerpts from Michael Ellerman's message of June 8, 2021 11:46 pm:
>>>>>> In commit 96d7a4e06fab ("powerpc/signal64: Rewrite handle_rt_signal6=
4()
>>>>>> to minimise uaccess switches") the 64-bit signal code was rearranged=
 to
>>>>>> use user_write_access_begin/end().
>>>>>>
>>>>>> As part of that change the call to copy_siginfo_to_user() was moved
>>>>>> later in the function, so that it could be done after the
>>>>>> user_write_access_end().
>>>>>>
>>>>>> In particular it was moved after we modify regs->nip to point to the
>>>>>> signal trampoline. That means if copy_siginfo_to_user() fails we exi=
t
>>>>>> handle_rt_signal64() with an error but with regs->nip modified, wher=
eas
>>>>>> previously we would not modify regs->nip until the copy succeeded.
>>>>>>
>>>>>> Returning an error from signal delivery but with regs->nip updated
>>>>>> leaves the process in a sort of half-delivered state. We do immediat=
ely
>>>>>> force a SEGV in signal_setup_done(), called from do_signal(), so the
>>>>>> process should never run in the half-delivered state.
>>>>>>
>>>>>> However that SEGV is not delivered until we've gone around to
>>>>>> do_notify_resume() again, so it's possible some tracing could observ=
e
>>>>>> the half-delivered state.
>>>>>>
>>>>>> There are other cases where we fail signal delivery with regs partly
>>>>>> updated, eg. the write to newsp and SA_SIGINFO, but the latter at le=
ast
>>>>>> is very unlikely to fail as it reads back from the frame we just wro=
te
>>>>>> to.
>>>>>>
>>>>>> Looking at other arches they seem to be more careful about leaving r=
egs
>>>>>> unchanged until the copy operations have succeeded, and in general t=
hat
>>>>>> seems like good hygenie.
>>>>>>
>>>>>> So although the current behaviour is not cleary buggy, it's also not
>>>>>> clearly correct. So move the call to copy_siginfo_to_user() up prior=
 to
>>>>>> the modification of regs->nip, which is closer to the old behaviour,=
 and
>>>>>> easier to reason about.
>>>>>
>>>>> Good catch, should it still have a Fixes: tag though? Even if it's no=
t
>>>>> clearly buggy we want it to be patched.
>>>>
>>>> Also...
>>>>
>>>>>>
>>>>>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>>>>> ---
>>>>>>    arch/powerpc/kernel/signal_64.c | 9 ++++-----
>>>>>>    1 file changed, 4 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/s=
ignal_64.c
>>>>>> index dca66481d0c2..f9e1f5428b9e 100644
>>>>>> --- a/arch/powerpc/kernel/signal_64.c
>>>>>> +++ b/arch/powerpc/kernel/signal_64.c
>>>>>> @@ -902,6 +902,10 @@ int handle_rt_signal64(struct ksignal *ksig, si=
gset_t *set,
>>>>>>    	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), ba=
dframe_block);
>>>>>>    	user_write_access_end();
>>>>>>   =20
>>>>>> +	/* Save the siginfo outside of the unsafe block. */
>>>>>> +	if (copy_siginfo_to_user(&frame->info, &ksig->info))
>>>>>> +		goto badframe;
>>>>>> +
>>>>>>    	/* Make sure signal handler doesn't get spurious FP exceptions *=
/
>>>>>>    	tsk->thread.fp_state.fpscr =3D 0;
>>>>>>   =20
>>>>>> @@ -915,11 +919,6 @@ int handle_rt_signal64(struct ksignal *ksig, si=
gset_t *set,
>>>>>>    		regs->nip =3D (unsigned long) &frame->tramp[0];
>>>>>>    	}
>>>>>>   =20
>>>>>> -
>>>>>> -	/* Save the siginfo outside of the unsafe block. */
>>>>>> -	if (copy_siginfo_to_user(&frame->info, &ksig->info))
>>>>>> -		goto badframe;
>>>>>> -
>>>>>>    	/* Allocate a dummy caller frame for the signal handler. */
>>>>>>    	newsp =3D ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
>>>>>>    	err |=3D put_user(regs->gpr[1], (unsigned long __user *)newsp);
>>>>
>>>> Does the same reasoning apply to this one and the ELF V1 function
>>>> descriptor thing? It seems like you could move all of that block
>>>> up instead. With your other SA_SIGINFO get_user patch, there would
>>>> then be no possibility of error after you start modifying regs.
>>>>
>>>
>>> To move the above in the user access block, we need to open a larger wi=
ndow. At the time being the
>>> window opened only contains the 'frame'. 'newsp' points before the 'fra=
me'.
>>>
>>=20
>> Only by 64/128 bytes though. Is that a problem? Not for 64s. Could it
>> cause more overhead than it saves on other platforms?
>=20
> No it is not a problem at all, just need to not be forgotten, on ppc64 it=
 may go unnoticed, on 32s=20
> it will blew up if we forget to enlarge the access window and the access =
involves a different 256M=20
> segment (Very unlikely for sure but ...)

Okay, and it's a good point. Would be nice if there was some sanitizer=20
that could check this to byte granularity.

Thanks,
Nick

>> For protection, it looks like all the important control data is in the
>> signal frame anyway, this frame is just for stack unwinding?
>=20
> That's my understanding as well.

