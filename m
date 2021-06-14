Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC723A5CA2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 07:56:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3LL93NsVz308t
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 15:56:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JsVY8qHr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JsVY8qHr; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3LKf6MNrz2ym5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 15:56:04 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso9398015pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 22:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=YqQScTKzy73dWSc1xhQsawPkMiPYl5WjELJ/RLgLeJY=;
 b=JsVY8qHrv5MoQZAE10oY8cYi9TslxARohybaIUgNCIaRr3AVQGmTs5hie53z8D5JFA
 bRJCQyu0GNlB2d+2nTzTKzXcsUucrHxqwoYGUMjroMM+tPV4znX4kUcp72Z/wL2x3jG2
 PXjQHX/lWY4FijgiJDbnvqczwF4IE2t4LkMJbrHsbj78ofTdMZ/pmGHR2Ox5t3toRMYg
 v6XpRK5DL980gy76Zb6uYtltKvdtYKNQc7NgIf6TTIOVWD8ro0yFoPfpFJdvXCEDFhBw
 IlppCVRPat5oD2ROhpKyf0sNuh5Ea8wqCenXHa5ABsM3qNPN5LgZ/85Gxx2fa5dA4BZ8
 /ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=YqQScTKzy73dWSc1xhQsawPkMiPYl5WjELJ/RLgLeJY=;
 b=DTUYkjhTFX+AzoyiKXEiVg9S1kPpQmZqVBw0KmldplAHdo/B9+icH7/jujiuKO8tZT
 KJEL3x7zdbB/XL1y04O5Dn/gvKAPmTzoY5zKuawwOprGxXWdd2oiojw/TliEow+vHdES
 LGFANDzPMwNBMyjeui/D1OlOB47JijWz6pmuvSrVpp9pllzMYzODU1BTRFAVfTpRt0bN
 xfJw9kmRPje3DEUQ/oy0x6XbAh7ExvNlY+Pnx+j0nxpoQWWiPTmQsx0jsvZSTIcnFdqx
 kVF+CrK4YTyuNDOv5Dyyba7sZQLyd/AN5SZQAxx9BkCrAJRZJ5T8CjSwT7lZzBslrt+9
 Anyw==
X-Gm-Message-State: AOAM531h8y9moRyiivwDZ17nYBTg3cjHt9cP+4nDTfaA+a75Q+H6zycE
 WXSuj0Q4DAG5Ep2djWyvy+c=
X-Google-Smtp-Source: ABdhPJy7qGh8bxXqIPQF5tMRLBwaOjDV0vjit5R1+/xAugQ6+l1YJVXhckr0xq2l3OM1HVHWaTfAGA==
X-Received: by 2002:a17:902:d101:b029:114:286f:7e6 with SMTP id
 w1-20020a170902d101b0290114286f07e6mr15384654plw.19.1623650160681; 
 Sun, 13 Jun 2021 22:56:00 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id q24sm11638067pgk.32.2021.06.13.22.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 22:56:00 -0700 (PDT)
Date: Mon, 14 Jun 2021 15:55:55 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/signal64: Copy siginfo before changing regs->nip
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210608134605.2783677-1-mpe@ellerman.id.au>
 <1623631623.jvh0hlk56m.astroid@bobo.none>
 <1623633868.lnyugcilh9.astroid@bobo.none>
 <759f715b-df1f-847d-d836-2d202c8a7dc4@csgroup.eu>
In-Reply-To: <759f715b-df1f-847d-d836-2d202c8a7dc4@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1623649799.9s42wcnyya.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of June 14, 2021 3:31 pm:
>=20
>=20
> Le 14/06/2021 =C3=A0 03:29, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Nicholas Piggin's message of June 14, 2021 10:47 am:
>>> Excerpts from Michael Ellerman's message of June 8, 2021 11:46 pm:
>>>> In commit 96d7a4e06fab ("powerpc/signal64: Rewrite handle_rt_signal64(=
)
>>>> to minimise uaccess switches") the 64-bit signal code was rearranged t=
o
>>>> use user_write_access_begin/end().
>>>>
>>>> As part of that change the call to copy_siginfo_to_user() was moved
>>>> later in the function, so that it could be done after the
>>>> user_write_access_end().
>>>>
>>>> In particular it was moved after we modify regs->nip to point to the
>>>> signal trampoline. That means if copy_siginfo_to_user() fails we exit
>>>> handle_rt_signal64() with an error but with regs->nip modified, wherea=
s
>>>> previously we would not modify regs->nip until the copy succeeded.
>>>>
>>>> Returning an error from signal delivery but with regs->nip updated
>>>> leaves the process in a sort of half-delivered state. We do immediatel=
y
>>>> force a SEGV in signal_setup_done(), called from do_signal(), so the
>>>> process should never run in the half-delivered state.
>>>>
>>>> However that SEGV is not delivered until we've gone around to
>>>> do_notify_resume() again, so it's possible some tracing could observe
>>>> the half-delivered state.
>>>>
>>>> There are other cases where we fail signal delivery with regs partly
>>>> updated, eg. the write to newsp and SA_SIGINFO, but the latter at leas=
t
>>>> is very unlikely to fail as it reads back from the frame we just wrote
>>>> to.
>>>>
>>>> Looking at other arches they seem to be more careful about leaving reg=
s
>>>> unchanged until the copy operations have succeeded, and in general tha=
t
>>>> seems like good hygenie.
>>>>
>>>> So although the current behaviour is not cleary buggy, it's also not
>>>> clearly correct. So move the call to copy_siginfo_to_user() up prior t=
o
>>>> the modification of regs->nip, which is closer to the old behaviour, a=
nd
>>>> easier to reason about.
>>>
>>> Good catch, should it still have a Fixes: tag though? Even if it's not
>>> clearly buggy we want it to be patched.
>>=20
>> Also...
>>=20
>>>>
>>>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>>> ---
>>>>   arch/powerpc/kernel/signal_64.c | 9 ++++-----
>>>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/sig=
nal_64.c
>>>> index dca66481d0c2..f9e1f5428b9e 100644
>>>> --- a/arch/powerpc/kernel/signal_64.c
>>>> +++ b/arch/powerpc/kernel/signal_64.c
>>>> @@ -902,6 +902,10 @@ int handle_rt_signal64(struct ksignal *ksig, sigs=
et_t *set,
>>>>   	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), badfr=
ame_block);
>>>>   	user_write_access_end();
>>>>  =20
>>>> +	/* Save the siginfo outside of the unsafe block. */
>>>> +	if (copy_siginfo_to_user(&frame->info, &ksig->info))
>>>> +		goto badframe;
>>>> +
>>>>   	/* Make sure signal handler doesn't get spurious FP exceptions */
>>>>   	tsk->thread.fp_state.fpscr =3D 0;
>>>>  =20
>>>> @@ -915,11 +919,6 @@ int handle_rt_signal64(struct ksignal *ksig, sigs=
et_t *set,
>>>>   		regs->nip =3D (unsigned long) &frame->tramp[0];
>>>>   	}
>>>>  =20
>>>> -
>>>> -	/* Save the siginfo outside of the unsafe block. */
>>>> -	if (copy_siginfo_to_user(&frame->info, &ksig->info))
>>>> -		goto badframe;
>>>> -
>>>>   	/* Allocate a dummy caller frame for the signal handler. */
>>>>   	newsp =3D ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
>>>>   	err |=3D put_user(regs->gpr[1], (unsigned long __user *)newsp);
>>=20
>> Does the same reasoning apply to this one and the ELF V1 function
>> descriptor thing? It seems like you could move all of that block
>> up instead. With your other SA_SIGINFO get_user patch, there would
>> then be no possibility of error after you start modifying regs.
>>=20
>=20
> To move the above in the user access block, we need to open a larger wind=
ow. At the time being the=20
> window opened only contains the 'frame'. 'newsp' points before the 'frame=
'.
>=20

Only by 64/128 bytes though. Is that a problem? Not for 64s. Could it=20
cause more overhead than it saves on other platforms?

For protection, it looks like all the important control data is in the=20
signal frame anyway, this frame is just for stack unwinding?

Thanks,
Nick
