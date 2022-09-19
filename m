Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 633955BD863
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 01:45:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWhBn1Pp2z3bkP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 09:45:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T4NtOARN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWhBC0Fswz2ywN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 09:45:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T4NtOARN;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MWhB93QDjz4xFs;
	Tue, 20 Sep 2022 09:45:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663631121;
	bh=lqXn0IQBBS97aEpDiFDfFHvZE8hANfuLs9yPWN8CQlI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T4NtOARNVXP8CYbVV8rElobB9z7JHFipD2JW8WVgObr0hMOJSzW4jIEy2EqaIc8zy
	 rUAaKpr56vCTReUMZXkia+8Ni2mCFqAy4pwFY4DVU13S5zh6XZKvBybnV+2shHv9Yd
	 sB2uIWfR3R7jpqHz6O9i5DIOdCHSo7bAPtgVFZyKAdIUHhsF1g7/wLEU1ttYuNiNjw
	 r5CXnfXKfVrR64h1r85hqjpiRbpmuZMCzJvKCu3OZmO18cdVjCYj5cPmg89redq8FI
	 ED4YLkLnbD+9T4eeFlKorvX0AyFKoXWYdYR2mX7hSDL6guZRFQBlsPTXkRCtwVvLug
	 IbJkMaQmmpaVg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras.c@gmail.com>
Subject: Re: [PATCH] Revert "powerpc/rtas: Implement reentrant rtas call"
In-Reply-To: <87illjqxpn.fsf@linux.ibm.com>
References: <20220907220111.223267-1-nathanl@linux.ibm.com>
 <1d76891ee052112ee1547a4027e358d5cbcac23d.camel@gmail.com>
 <871qskve2f.fsf@linux.ibm.com>
 <cf845311ca7fcc0fded8db153499d9394f2add4e.camel@gmail.com>
 <87y1uotlfa.fsf@linux.ibm.com>
 <14e227181543ab45550ddf8e8fa1c53838361d61.camel@gmail.com>
 <CMXFROL4N1OT.4DV7ZOHOP954@bobo> <87h717t24d.fsf@linux.ibm.com>
 <87illjqxpn.fsf@linux.ibm.com>
Date: Tue, 20 Sep 2022 09:45:20 +1000
Message-ID: <87bkrbkjxr.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> "Nicholas Piggin" <npiggin@gmail.com> writes:
>>> On Wed Sep 14, 2022 at 3:39 AM AEST, Leonardo Br=C3=A1s wrote:
>>>> On Mon, 2022-09-12 at 14:58 -0500, Nathan Lynch wrote:
>>>> > Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
>>>> > > On Fri, 2022-09-09 at 09:04 -0500, Nathan Lynch wrote:
>>>> > > > Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
>>>> > > > > On Wed, 2022-09-07 at 17:01 -0500, Nathan Lynch wrote:
>>>> > > > > > At the time this was submitted by Leonardo, I confirmed -- o=
r thought
>>>> > > > > > I had confirmed -- with PowerVM partition firmware developme=
nt that
>>>> > > > > > the following RTAS functions:
>>>> > > > > >=20
>>>> > > > > > - ibm,get-xive
>>>> > > > > > - ibm,int-off
>>>> > > > > > - ibm,int-on
>>>> > > > > > - ibm,set-xive
>>>> > > > > >=20
>>>> > > > > > were safe to call on multiple CPUs simultaneously, not only =
with
>>>> > > > > > respect to themselves as indicated by PAPR, but with arbitra=
ry other
>>>> > > > > > RTAS calls:
>>>> > > > > >=20
>>>> > > > > > https://lore.kernel.org/linuxppc-dev/875zcy2v8o.fsf@linux.ib=
m.com/
>>>> > > > > >=20
>>>> > > > > > Recent discussion with firmware development makes it clear t=
hat this
>>>> > > > > > is not true, and that the code in commit b664db8e3f97 ("powe=
rpc/rtas:
>>>> > > > > > Implement reentrant rtas call") is unsafe, likely explaining=
 several
>>>> > > > > > strange bugs we've seen in internal testing involving DLPAR =
and
>>>> > > > > > LPM. These scenarios use ibm,configure-connector, whose inte=
rnal state
>>>> > > > > > can be corrupted by the concurrent use of the "reentrant" fu=
nctions,
>>>> > > > > > leading to symptoms like endless busy statuses from RTAS.
>>>> > > > >=20
>>>> > > > > Oh, does not it means PowerVM is not compliant to the PAPR spe=
cs?
>>>> > > >=20
>>>> > > > No, it means the premise of commit b664db8e3f97 ("powerpc/rtas:
>>>> > > > Implement reentrant rtas call") change is incorrect. The "reentr=
ant"
>>>> > > > property described in the spec applies only to the individual RT=
AS
>>>> > > > functions. The OS can invoke (for example) ibm,set-xive on multi=
ple CPUs
>>>> > > > simultaneously, but it must adhere to the more general requireme=
nt to
>>>> > > > serialize with other RTAS functions.
>>>> > > >=20
>>>> > >=20
>>>> > > I see. Thanks for explaining that part!
>>>> > > I agree: reentrant calls that way don't look as useful on Linux th=
an I
>>>> > > previously thought.
>>>> > >=20
>>>> > > OTOH, I think that instead of reverting the change, we could make =
use of the
>>>> > > correct information and fix the current implementation. (This coul=
d help when we
>>>> > > do the same rtas call in multiple cpus)
>>>> >=20
>>>> > Hmm I'm happy to be mistaken here, but I doubt we ever really need t=
o do
>>>> > that. I'm not seeing the need.
>>>> >=20
>>>> > > I have an idea of a patch to fix this.=20
>>>> > > Do you think it would be ok if I sent that, to prospect being an a=
lternative to
>>>> > > this reversion?
>>>> >=20
>>>> > It is my preference, and I believe it is more common, to revert to t=
he
>>>> > well-understood prior state, imperfect as it may be. The revert can =
be
>>>> > backported to -stable and distros while development and review of
>>>> > another approach proceeds.
>>>>
>>>> Ok then, as long as you are aware of the kdump bug, I'm good.
>>>>
>>>> FWIW:
>>>> Reviewed-by: Leonardo Bras <leobras.c@gmail.com>
>>>
>>> A shame. I guess a reader/writer lock would not be much help because
>>> the crash is probably more likely to hit longer running rtas calls?
>>>
>>> Alternative is just cheat and do this...?
>
> [...]
>
>>
>> I wonder - would it be worth making the panic path use a separate
>> "emergency" rtas_args buffer as well? If a CPU is actually "stuck" in
>> RTAS at panic time, then leaving rtas.args untouched might make the
>> ibm,int-off, ibm,set-xive, ibm,os-term, and any other RTAS calls we
>> incur on the panic path more likely to succeed.
>
> Regardless, I request that we proceed with the revert while the crash
> path hardening gets sorted out.

It's in next, I just haven't sent out the mails yet because I'm
disorganised :)

> If I understand the motivation behind
> commit b664db8e3f97 ("powerpc/rtas: Implement reentrant rtas call"),
> then it looks like it was incomplete anyway? rtas_os_term() still takes
> the lock when calling ibm,os-term.

The original report was for kdump, which doesn't use rtas_os_term() AFAIK.

cheers
