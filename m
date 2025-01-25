Return-Path: <linuxppc-dev+bounces-5558-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 976F9A1C309
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2025 13:17:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YgDGV2TjCz2ymg;
	Sat, 25 Jan 2025 23:17:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737807474;
	cv=none; b=l2+r3w+mIezdLSOetllOjK9D5kihrjwsADUxIWzpZZCWI7NTi5hewPOp6BwPpiosG5NFKO1C6GtInXbeAGwEGlOgrFFErdsYsRQs6xn17KP0SF7Bl6fAjq4Tyjdaef/qQHjuSIYHFqFmnVwvz9OXR7npYcHwH2YdxKgblIte7KIh3kXoHjKvTQzRb8Bp3A7xJ7HtKhzlyJyXZJVkvdeyy0DH153EJLBjK5mSY2iDRiJEz23deOQdGuGKxsLQB2Av3qJVmXA6Z/0JQdeQXyqZx6CR/N1bwBa6fBQJjYAPvQpm6wNmzb2sY1g2k3F1fgShtmyTf6X+860eHhNf788V4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737807474; c=relaxed/relaxed;
	bh=8jrMfuGdILhOoKzoKQIpsuvpNfN2oCaFAgeW4oP36tI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hp+eO5RFHR3MTGp6MXFg27DMaxQz5BF/CBq/EcMNd+B/WzEPfAouHXhIBaW49gAIBgkaD7oyTSlSlAsyGVyT2Ud0CLlK2yBHCRM1aH1s7isJPx4cjk04YikZwcjPWN6vxgkO2g7vhcv3pqrPW5qksW1AVhOPKVF+S2gfKIF7iantLMYE6krIkrIJfF9R0G01sY3HOIzgx6UoN1gyee0qe2VWzI/S8z8NcdiJZmnmwjtIqrVvtXd6IeRmNA1tLacg3M8hgzrosl78LSn0woNoJK+4lZBLLslC6+qxyNdHIg4F8e+FDWX+n/v4l1TbwzHIayEuIbQV8RCsSPUUjzu15A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TzVYMUrA; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TzVYMUrA;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YgDGS6XlLz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2025 23:17:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1737807463;
	bh=8jrMfuGdILhOoKzoKQIpsuvpNfN2oCaFAgeW4oP36tI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TzVYMUrArQiqN/RZHTjtabskKvEIgUypVaRNti1ymvpR3KDM2FC0AIWU0bGl7sHHT
	 kFFv/u/Mo8hwG7HletlNlqazr6cHpElDqZpWjf47UpskZQY5UAVHUQaWbqrpNfMz35
	 ncJZD45crjfOZEag+/L6EGf3FFimKIDKXJSq2ZglrWwH+v55znryMpSN3IG2Gxxo8K
	 sVr42vPG8kC8KV8EJngkLM9GkVI1JHbvtpP8zyYo5ZZPjzYinQEAaBOPTu7LpIoJmS
	 ZsdIKVTvubMlmyKUgKoagVWXm2DY/VGxgl0Gqw8OMvDGWyhKMVk4OW78D83UhC7GTq
	 zwZYVpB/Ye3wA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YgDGC4plDz4wj2;
	Sat, 25 Jan 2025 23:17:39 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Dmitry V. Levin" <ldv@strace.io>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Cc: Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eugene Syromyatnikov <evgsyr@gmail.com>, Mike Frysinger
 <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>, Davide Berardi
 <berardi.dav@gmail.com>, strace-devel@lists.strace.io, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao
 <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
In-Reply-To: <20250123182815.GA20994@strace.io>
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250123182815.GA20994@strace.io>
Date: Sat, 25 Jan 2025 23:17:45 +1100
Message-ID: <87lduzjdee.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

"Dmitry V. Levin" <ldv@strace.io> writes:
> On Mon, Jan 20, 2025 at 02:51:38PM +0100, Christophe Leroy wrote:
>> Le 14/01/2025 =C3=A0 18:04, Dmitry V. Levin a =C3=A9crit=C2=A0:
>> > On Mon, Jan 13, 2025 at 06:34:44PM +0100, Christophe Leroy wrote:
>> >> Le 13/01/2025 =C3=A0 18:10, Dmitry V. Levin a =C3=A9crit=C2=A0:
>> >>> Bring syscall_set_return_value() in sync with syscall_get_error(),
>> >>> and let upcoming ptrace/set_syscall_info selftest pass on powerpc.
>> >>>
>> >>> This reverts commit 1b1a3702a65c ("powerpc: Don't negate error in
>> >>> syscall_set_return_value()").
>> >>
>> >> There is a clear detailed explanation in that commit of why it needs =
to
>> >> be done.
>> >>
>> >> If you think that commit is wrong you have to explain why with at lea=
st
>> >> the same level of details.
>> >=20
>> > OK, please have a look whether this explanation is clear and detailed =
enough:
>> >=20
>> > =3D=3D=3D=3D=3D=3D=3D
>> > powerpc: properly negate error in syscall_set_return_value()
>> >=20
>> > When syscall_set_return_value() is used to set an error code, the call=
er
>> > specifies it as a negative value in -ERRORCODE form.
>> >=20
>> > In !trap_is_scv case the error code is traditionally stored as follows:
>> > gpr[3] contains a positive ERRORCODE, and ccr has 0x10000000 flag set.
>> > Here are a few examples to illustrate this convention.  The first one
>> > is from syscall_get_error():
>> >          /*
>> >           * If the system call failed,
>> >           * regs->gpr[3] contains a positive ERRORCODE.
>> >           */
>> >          return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;
>> >=20
>> > The second example is from regs_return_value():
>> >          if (is_syscall_success(regs))
>> >                  return regs->gpr[3];
>> >          else
>> >                  return -regs->gpr[3];
>> >=20
>> > The third example is from check_syscall_restart():
>> >          regs->result =3D -EINTR;
>> >          regs->gpr[3] =3D EINTR;
>> >          regs->ccr |=3D 0x10000000;
>> >=20
>> > Compared with these examples, the failure of syscall_set_return_value()
>> > to assign a positive ERRORCODE into regs->gpr[3] is clearly visible:
>> > 	/*
>> > 	 * In the general case it's not obvious that we must deal with
>> > 	 * CCR here, as the syscall exit path will also do that for us.
>> > 	 * However there are some places, eg. the signal code, which
>> > 	 * check ccr to decide if the value in r3 is actually an error.
>> > 	 */
>> > 	if (error) {
>> > 		regs->ccr |=3D 0x10000000L;
>> > 		regs->gpr[3] =3D error;
>> > 	} else {
>> > 		regs->ccr &=3D ~0x10000000L;
>> > 		regs->gpr[3] =3D val;
>> > 	}
>> >=20
>> > This fix brings syscall_set_return_value() in sync with syscall_get_er=
ror()
>> > and lets upcoming ptrace/set_syscall_info selftest pass on powerpc.
>> >=20
>> > Fixes: 1b1a3702a65c ("powerpc: Don't negate error in syscall_set_retur=
n_value()").
>> > =3D=3D=3D=3D=3D=3D=3D
>>=20
>> I think there is still something going wrong.
>>=20
>> do_seccomp() sets regs->gpr[3] =3D -ENOSYS; by default.
>>=20
>> Then it calls __secure_computing() which returns what __seccomp_filter()=
=20
>> returns.
>>=20
>> In case of error, __seccomp_filter() calls syscall_set_return_value()=20
>> with a negative value then returns -1
>>=20
>> do_seccomp() is called by do_syscall_trace_enter() which returns -1 when=
=20
>> do_seccomp() doesn't return 0.
>>=20
>> do_syscall_trace_enter() is called by system_call_exception() and=20
>> returns -1, so syscall_exception() returns regs->gpr[3]
>>=20
>> In entry_32.S, transfer_to_syscall, syscall_exit_prepare() is then=20
>> called with the return of syscall_exception() as first parameter, which=
=20
>> leads to:
>>=20
>> 	if (unlikely(r3 >=3D (unsigned long)-MAX_ERRNO) && is_not_scv) {
>> 		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
>> 			r3 =3D -r3;
>> 			regs->ccr |=3D 0x10000000; /* Set SO bit in CR */
>> 		}
>> 	}
>>=20
>> By chance, because you have already changed the sign of gpr[3], the=20
>> above test fails and nothing is done to r3, and because you have also=20
>> already set regs->ccr it works.
>>=20
>> But all this looks inconsistent with the fact that do_seccomp sets=20
>> -ENOSYS as default value
>>=20
>> Also, when do_seccomp() returns 0, do_syscall_trace_enter() check the=20
>> syscall number and when it is wrong it goes to skip: which sets=20
>> regs->gpr[3] =3D -ENOSYS;
>>=20
>> So really I think it is not in line with your changes to set positive=20
>> value in gpr[3].
>>=20
>> Maybe your change is still correct but it needs to be handled completely=
=20
>> in that case.
>
> Indeed, there is an inconsistency in !trap_is_scv case.
>
> In some places such as syscall_get_error() and regs_return_value() the
> semantics is as I described earlier: gpr[3] contains a positive ERRORCODE
> and ccr has 0x10000000 flag set.  This semantics is a part of the ABI and
> therefore cannot be changed.
>
> In some other places like do_seccomp() and do_syscall_trace_enter() the
> semantics is similar to the trap_is_scv case: gpr[3] contains a negative
> ERRORCODE and ccr is unchanged.  In addition, system_call_exception()
> returns the system call function return value when it is executed, and
> gpr[3] otherwise.  The value returned by system_call_exception() is passed
> on to syscall_exit_prepare() which performs the conversion you mentioned.
>
> What's remarkable is that in those places that are a part of the ABI the
> traditional semantics is kept, while in other places the implementation
> follows the trap_is_scv-like semantics, while traditional semantics is
> also supported there.

scv didn't exist when the seccomp code was written so that's not really
the right way to look at it.

The distinction was between the in-kernel semantic of negative
ERRORCODE, which is used everywhere, vs the original (non-scv) syscall
ABI which uses positive ERRORCODE and CCR.SO.

The way I wrote it at the time was to try and maintain the negative
ERRORCODE semantic in the kernel, and only flip to positive ERRORCODE
when we actually exit to userspace.

But even back then syscall_set_return_value() needed to set CCR.SO to
make some cases work, so it was probably the wrong design.

> The only case where I see some intersection is do_seccomp() where the
> tracer would be able to see -ENOSYS in gpr[3].  However, the seccomp stop
> is not the place where the tracer *reads* the system call exit status,
> so whatever was written in gpr[3] before __secure_computing() is not
> really relevant, consequently, selftests/seccomp/seccomp_bpf passes with
> this patch applied as well as without it.
=20
IIRC it is important for a tracer that blocks the syscall but doesn't
explicitly set the return value. But it's only important that the
default return value is syscall failure (ie. ENOSYS/-ENOSYS), the actual
sign of the r3 value should be irrelevant to the tracer.

If the selftest still passes then that's probably sufficient.

cheers

