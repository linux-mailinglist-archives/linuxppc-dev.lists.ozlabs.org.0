Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A66903A5B56
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 03:30:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3DQp2L3lz308d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 11:30:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SMiaoz8t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SMiaoz8t; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3DQF2y6xz2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 11:29:40 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id p13so9391911pfw.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 18:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=01hwRoadoUzpmlaxAnZby89dgKi8cJoUaVXam7Jl9x8=;
 b=SMiaoz8tqiNprIK/NsT8jKuMNxVxlipd4c1TwtZ5V7HfzJs7+P3JgUXZ1+7qmshMiN
 /da7AEwUoxSPn2uHUeDlDlCF5HfX7tTdbzN85fyIBhueFT51DZIucgNILwoMwBW7DAWp
 PiXArsZVGL5pP/c6bxJaM2eU02ZFOv60/BY3M3//gpi4wBTYmppSGhcvhd3We8WvOLNN
 rQUe/2BakQvtBiM9duy0hPO5REyiy8H+6UxQvpk35IlNQlzBVqrQsEfytG6NUGLq9g0x
 1ND1/oRauCx5FfjQ15JrDeQeG4IKENdVVBfdPRf1ktdMIm/akGSjjkXFV8uyPsvUr9Z8
 WIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=01hwRoadoUzpmlaxAnZby89dgKi8cJoUaVXam7Jl9x8=;
 b=ueQdFMkQ1HFsKAMg18yq9BpcY1zRkwyqPQxwBYKiJ18unVYaxowOSTPfy4rB2FBpgs
 swJjuW2PQrxpSS07xNYlQ3GFjpWlDA8dHrEVMhgP9jaFr8Cpq7ajb98wdnYOFZaAgJhO
 F5Nn8Mf0bsct9v/i8O488FxnAtKoWvEdEIHinkMWoMfDZWKDygtnM0v8/4SZxUQ8jRI/
 Sioy5iK0NrY4L0WjkHsX0YUVGRNFTX+vMDPM9Tl6eUH2tGoNv0XfVF/nhrYVsHOE42Sf
 WF8ctQFcMod+FJbFTEmRtVfS6Ks32VvXCrxWYGHAG1vXnH0sn86EeURnMbL+V8mXvGpI
 Yx6w==
X-Gm-Message-State: AOAM532p4mDId7Kls4pt9QJbuQYQ4uN7OdK8b0K/kndcIjMI9iIDvnnx
 UviPgrZtyLjCzcibBUx09FHfp1QjhLc=
X-Google-Smtp-Source: ABdhPJxQnFJlmrlMfwqBsCtRg2q3C72iD2cNRXaNaOVetl8yOfQEtji//VXEK/OrCiHnrMYNq3YGfQ==
X-Received: by 2002:a63:3543:: with SMTP id c64mr14640727pga.403.1623634176466; 
 Sun, 13 Jun 2021 18:29:36 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id y128sm5136975pgy.49.2021.06.13.18.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 18:29:36 -0700 (PDT)
Date: Mon, 14 Jun 2021 11:29:31 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/signal64: Copy siginfo before changing regs->nip
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210608134605.2783677-1-mpe@ellerman.id.au>
 <1623631623.jvh0hlk56m.astroid@bobo.none>
In-Reply-To: <1623631623.jvh0hlk56m.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1623633868.lnyugcilh9.astroid@bobo.none>
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

Excerpts from Nicholas Piggin's message of June 14, 2021 10:47 am:
> Excerpts from Michael Ellerman's message of June 8, 2021 11:46 pm:
>> In commit 96d7a4e06fab ("powerpc/signal64: Rewrite handle_rt_signal64()
>> to minimise uaccess switches") the 64-bit signal code was rearranged to
>> use user_write_access_begin/end().
>>=20
>> As part of that change the call to copy_siginfo_to_user() was moved
>> later in the function, so that it could be done after the
>> user_write_access_end().
>>=20
>> In particular it was moved after we modify regs->nip to point to the
>> signal trampoline. That means if copy_siginfo_to_user() fails we exit
>> handle_rt_signal64() with an error but with regs->nip modified, whereas
>> previously we would not modify regs->nip until the copy succeeded.
>>=20
>> Returning an error from signal delivery but with regs->nip updated
>> leaves the process in a sort of half-delivered state. We do immediately
>> force a SEGV in signal_setup_done(), called from do_signal(), so the
>> process should never run in the half-delivered state.
>>=20
>> However that SEGV is not delivered until we've gone around to
>> do_notify_resume() again, so it's possible some tracing could observe
>> the half-delivered state.
>>=20
>> There are other cases where we fail signal delivery with regs partly
>> updated, eg. the write to newsp and SA_SIGINFO, but the latter at least
>> is very unlikely to fail as it reads back from the frame we just wrote
>> to.
>>=20
>> Looking at other arches they seem to be more careful about leaving regs
>> unchanged until the copy operations have succeeded, and in general that
>> seems like good hygenie.
>>=20
>> So although the current behaviour is not cleary buggy, it's also not
>> clearly correct. So move the call to copy_siginfo_to_user() up prior to
>> the modification of regs->nip, which is closer to the old behaviour, and
>> easier to reason about.
>=20
> Good catch, should it still have a Fixes: tag though? Even if it's not
> clearly buggy we want it to be patched.

Also...

>>=20
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  arch/powerpc/kernel/signal_64.c | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signa=
l_64.c
>> index dca66481d0c2..f9e1f5428b9e 100644
>> --- a/arch/powerpc/kernel/signal_64.c
>> +++ b/arch/powerpc/kernel/signal_64.c
>> @@ -902,6 +902,10 @@ int handle_rt_signal64(struct ksignal *ksig, sigset=
_t *set,
>>  	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), badframe=
_block);
>>  	user_write_access_end();
>> =20
>> +	/* Save the siginfo outside of the unsafe block. */
>> +	if (copy_siginfo_to_user(&frame->info, &ksig->info))
>> +		goto badframe;
>> +
>>  	/* Make sure signal handler doesn't get spurious FP exceptions */
>>  	tsk->thread.fp_state.fpscr =3D 0;
>> =20
>> @@ -915,11 +919,6 @@ int handle_rt_signal64(struct ksignal *ksig, sigset=
_t *set,
>>  		regs->nip =3D (unsigned long) &frame->tramp[0];
>>  	}
>> =20
>> -
>> -	/* Save the siginfo outside of the unsafe block. */
>> -	if (copy_siginfo_to_user(&frame->info, &ksig->info))
>> -		goto badframe;
>> -
>>  	/* Allocate a dummy caller frame for the signal handler. */
>>  	newsp =3D ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
>>  	err |=3D put_user(regs->gpr[1], (unsigned long __user *)newsp);

Does the same reasoning apply to this one and the ELF V1 function
descriptor thing? It seems like you could move all of that block
up instead. With your other SA_SIGINFO get_user patch, there would
then be no possibility of error after you start modifying regs.

Thanks,
Nick

