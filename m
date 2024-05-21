Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 921548CA5C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 03:31:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gvnTBX2I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VjxYD13K8z3g5s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 11:24:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gvnTBX2I;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjxXW3QqCz3dBw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 11:23:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716254619;
	bh=t5tgfjaNK6xfUv4SkR4boo1cdkYXEr2RBwAv3X9DNco=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gvnTBX2IfeeGfliduFVJziqoLe/chhGsxYHVV31VP6EjcTFIfIv44mJc7bkrp2MLQ
	 r7Ad/A78Hxon7OX4FSb+mzlQ4KiRJDhRxokRGbbkVsmU4MLsOJYGMTY1RKee8GXjj0
	 dLsB+Z99KkCWT2do6FURntIkRdM6/bLqUe93dk0f2ezr+sqdfAscR5H2smzUqgZOdT
	 nGt+R6LpEHWDHBF8I4JNXDhFYAZzbu7V4DcdO3oGRmo6uEMAsuwdm9Dli/vGEyFsOh
	 2UANR5VONXvldRz1Ufk4xiDT91Vgvadr4iS3yRsgI4SfJTZVxnuX63rKEo0RO3cfHK
	 ZIywnEC44N9aA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VjxXW3MR3z4wjF;
	Tue, 21 May 2024 11:23:39 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Breno Leitao <leitao@debian.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/kernel: Fix potential spectre v1 in syscall
In-Reply-To: <875xxj36ke.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
References: <1534876926-21849-1-git-send-email-leitao@debian.org>
 <baf6af2b-d6e1-4df8-9466-98d19f8c765f@csgroup.eu>
 <ZfAa59Z8njiGUnRW@gmail.com> <874jdb4sj9.fsf@mail.lhotse>
 <875xxj36ke.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Date: Tue, 21 May 2024 11:23:38 +1000
Message-ID: <87wmno2c11.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Breno Leitao <leitao@debian.org> writes:
>>> On Tue, Mar 12, 2024 at 08:17:42AM +0000, Christophe Leroy wrote:
>>>> +Nathan as this is RTAS related.
>
> Thanks!
>
>>>> Le 21/08/2018 =C3=A0 20:42, Breno Leitao a =C3=A9crit=C2=A0:
>>>> > The rtas syscall reads a value from a user-provided structure and us=
es it
>>>> > to index an array, being a possible area for a potential spectre v1 =
attack.
>>>> > This is the code that exposes this problem.
>>>> >=20
>>>> > 	args.rets =3D &args.args[nargs];
>>>> >=20
>>>> > The nargs is an user provided value, and the below code is an exampl=
e where
>>>> > the 'nargs' value would be set to XX.
>>>> >=20
>>>> > 	struct rtas_args ra;
>>>> > 	ra.nargs =3D htobe32(XX);
>>>> > 	syscall(__NR_rtas, &ra);
>>>>=20
>>>>=20
>>>> This patch has been hanging around in patchwork since 2018 and doesn't=
=20
>>>> apply anymore. Is it still relevant ? If so, can you rebase et resubmi=
t ?
>>>
>>> This seems to be important, since nargs is a user-provided value. I can
>>> submit it if the maintainers are willing to accept. I do not want to
>>> spend my time if no one is willing to review it.
>>
>> My memory is that I didn't think it was actually a problem, because all
>> we do is memset args.rets to zero.
>
> This is also my initial reaction to this. I suppose if the memset()
> implementation performs some validation of the destination buffer
> contents (comparing to a known poison value or something) that could
> load the CPU cache then there is a more plausible issue?

Yeah I guess that's possible.

In the past my approach to these was to analyse the exploitability of
each case and only patch those where there was a feasible case to be
made.

But I think that was wrong, doing that analysis is too time consuming at
scale, is easy to get wrong, and is also fragile in the face of the code
changing.

Especially in cases like this where the performance cost of the checks
is going to be dwarfed by other factors like syscall/firmware overhead.

>> Anyway we should probably just fix it to be safe and keep the static
>> checkers happy.
>
> Here is the relevant passage in its current state:
>
>         if (copy_from_user(&args, uargs, 3 * sizeof(u32)) !=3D 0)
>                 return -EFAULT;
>
>         nargs =3D be32_to_cpu(args.nargs);
>         nret  =3D be32_to_cpu(args.nret);
>         token =3D be32_to_cpu(args.token);
>
>         if (nargs >=3D ARRAY_SIZE(args.args)
>             || nret > ARRAY_SIZE(args.args)
>             || nargs + nret > ARRAY_SIZE(args.args))
>                 return -EINVAL;
>
>         /* Copy in args. */
>         if (copy_from_user(args.args, uargs->args,
>                            nargs * sizeof(rtas_arg_t)) !=3D 0)
>                 return -EFAULT;
>
>         /*
>          * If this token doesn't correspond to a function the kernel
>          * understands, you're not allowed to call it.
>          */
>         func =3D rtas_token_to_function_untrusted(token);
>         if (!func)
>                 return -EINVAL;
>
>         args.rets =3D &args.args[nargs];
>         memset(args.rets, 0, nret * sizeof(rtas_arg_t));
>
> Some questions:
>
> 1. The patch sanitizes 'nargs' immediately before the call to memset(),
>    but shouldn't that happen before 'nargs' is used as an input to
>    copy_from_user()?

I think the reasoning is that there's no way to exploit an out of bounds
value using copy_from_user(). But it's much easier to reason about if we
just do the sanitisation up front.

> 2. If 'nargs' needs this treatment, then why wouldn't the user-supplied
>    'nret' and 'token' need them as well? 'nret' is used to index the
>    same array as 'nargs'. And at least conceptually, 'token' is used to
>    index a data structure (xarray) with array-like semantics (to be
>    fair, this is a relatively recent development and was not the case
>    when this change was submitted).
=20=20=20=20
I don't know exactly what smatch looks for when trying to detect these,
but I suspect it's a plain array access. Not sure why it doesn't
complain about nret, but I think it would be good to sanitise it as well.

token is different, at least in the above code, because it's not bounds
checked, so there's no bounds check to bypass. Though maybe there is one
inside the rtas lookup code that should be masked.

cheers
