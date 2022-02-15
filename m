Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A6F4B6A31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 12:05:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JydYL5Y5Mz3cP7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 22:05:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SHn+0P0f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JydXg5sWCz2xsb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 22:05:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SHn+0P0f; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JydXd6l0yz4xNq;
 Tue, 15 Feb 2022 22:05:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1644923107;
 bh=LoeNfqeXHZpw22Uq/3imGMD+iHu3vmdMmCYzm8O/0HE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SHn+0P0fQHdthvYLHYFnoJt36LFHdIy60E+1+cApL4Qd3fRJ74pBCS79bFEQcIupt
 vwupGcmCdq48K88sDm5KgEcS5aHkfeTfrotLL9p1pU6yi3vVdwxxeiqjZCp3iOiDSo
 m8DyTQZKgC9cdIptSy7lGlVKcCH1lijaQoTFOZkodTrsxQnjlMF1pA9meNMLieskBv
 24pHnMbAznFtrmC0gnqmVbn7E0ilcKPVgV88T3HxI/wSrVWI6lxav60uqi2mVrDtTZ
 L54uDc4vn4/B/kV9YAv1+nOlse4K36BMU/DPR6ElvtOmkUNDcKrk8529uvKFOoib/W
 gDLYqvVXRIB2A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>, Jiri Kosina <jikos@kernel.org>, Joe
 Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Miroslav Benes <mbenes@suse.cz>, Ingo Molnar <mingo@redhat.com>, Petr
 Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 09/13] powerpc/ftrace: Implement
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
In-Reply-To: <1b28f52a-f8b7-6b5c-e726-feac4123517d@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <5831f711a778fcd6eb51eb5898f1faae4378b35b.1640017960.git.christophe.leroy@csgroup.eu>
 <1644852011.qg7ud9elo2.naveen@linux.ibm.com>
 <1b28f52a-f8b7-6b5c-e726-feac4123517d@csgroup.eu>
Date: Tue, 15 Feb 2022 22:05:04 +1100
Message-ID: <875ypgo0f3.fsf@mpe.ellerman.id.au>
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
Cc: "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 14/02/2022 =C3=A0 16:25, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Christophe Leroy wrote:
>>> Implement CONFIG_DYNAMIC_FTRACE_WITH_ARGS. It accelerates the call
>>> of livepatching.
>>>
>>> Also note that powerpc being the last one to convert to
>>> CONFIG_DYNAMIC_FTRACE_WITH_ARGS, it will now be possible to remove
>>> klp_arch_set_pc() on all architectures.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>> =C2=A0arch/powerpc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0arch/powerpc/include/asm/ftrace.h=C2=A0=C2=A0=C2=A0 | 17 ++++++++=
+++++++++
>>> =C2=A0arch/powerpc/include/asm/livepatch.h |=C2=A0 4 +---
>>> =C2=A03 files changed, 19 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index cdac2115eb00..e2b1792b2aae 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -210,6 +210,7 @@ config PPC
>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_DEBUG_KMEMLEAK
>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_DEBUG_STACKOVERFLOW
>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_DYNAMIC_FTRACE
>>> +=C2=A0=C2=A0=C2=A0 select HAVE_DYNAMIC_FTRACE_WITH_ARGS=C2=A0=C2=A0=C2=
=A0 if MPROFILE_KERNEL || PPC32
>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_DYNAMIC_FTRACE_WITH_REGS=C2=A0=C2=
=A0=C2=A0 if MPROFILE_KERNEL || PPC32
>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_EBPF_JIT
>>> =C2=A0=C2=A0=C2=A0=C2=A0 select HAVE_EFFICIENT_UNALIGNED_ACCESS=C2=A0=
=C2=A0=C2=A0 if !(CPU_LITTLE_ENDIAN=20
>>> && POWER7_CPU)
>>> diff --git a/arch/powerpc/include/asm/ftrace.h=20
>>> b/arch/powerpc/include/asm/ftrace.h
>>> index b3f6184f77ea..45c3d6f11daa 100644
>>> --- a/arch/powerpc/include/asm/ftrace.h
>>> +++ b/arch/powerpc/include/asm/ftrace.h
>>> @@ -22,6 +22,23 @@ static inline unsigned long=20
>>> ftrace_call_adjust(unsigned long addr)
>>> =C2=A0struct dyn_arch_ftrace {
>>> =C2=A0=C2=A0=C2=A0=C2=A0 struct module *mod;
>>> =C2=A0};
>>> +
>>> +#ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
>>> +struct ftrace_regs {
>>> +=C2=A0=C2=A0=C2=A0 struct pt_regs regs;
>>> +};
>>> +
>>> +static __always_inline struct pt_regs *arch_ftrace_get_regs(struct=20
>>> ftrace_regs *fregs)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return &fregs->regs;
>>> +}
>>=20
>> I think this is wrong. We need to differentiate between ftrace_caller()=
=20
>> and ftrace_regs_caller() here, and only return pt_regs if coming in=20
>> through ftrace_regs_caller() (i.e., FL_SAVE_REGS is set).
>
> Not sure I follow you.
>
> This is based on 5740a7c71ab6 ("s390/ftrace: add=20
> HAVE_DYNAMIC_FTRACE_WITH_ARGS support")
>
> It's all the point of HAVE_DYNAMIC_FTRACE_WITH_ARGS, have the regs also=20
> with ftrace_caller().
>
> Sure you only have the params, but that's the same on s390, so what did=20
> I miss ?

I already have this series in next, I can pull it out, but I'd rather
not.

I'll leave it in for now, hopefully you two can agree overnight my time
whether this is a big problem or something we can fix with a fixup
patch.

>>> +static __always_inline void ftrace_instruction_pointer_set(struct=20
>>> ftrace_regs *fregs,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long ip)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 regs_set_return_ip(&fregs->regs, ip);
>>=20
>> Should we use that helper here? regs_set_return_ip() also updates some=20
>> other state related to taking interrupts and I don't think it makes=20
>> sense for use with ftrace.
>
>
> Today we have:
>
> 	static inline void klp_arch_set_pc(struct ftrace_regs *fregs, unsigned=20
> long ip)
> 	{
> 		struct pt_regs *regs =3D ftrace_get_regs(fregs);
>
> 		regs_set_return_ip(regs, ip);
> 	}
>
>
> Which like x86 and s390 becomes:
>
> 	static inline void klp_arch_set_pc(struct ftrace_regs *fregs, unsigned=20
> long ip)
> 	{
> 		ftrace_instruction_pointer_set(fregs, ip);
> 	}
>
>
>
> That's the reason why I've been using regs_set_return_ip(). Do you think=
=20
> it was wrong to use regs_set_return_ip() in klp_arch_set_pc() ?
>
> That was added by 59dc5bfca0cb ("powerpc/64s: avoid reloading (H)SRR=20
> registers if they are still valid")

It's not wrong, but I think it's unnecessary. We need to use
regs_set_return_ip() if we're changing the regs->ip of an interrupt
frame, so that the interrupt return code will reload it.

But AIUI in this case we're not doing that, we're changing the regs->ip
of a pt_regs provided by ftrace, which shouldn't ever be an interrupt
frame.

So it's not a bug to use regs_set_return_ip(), but it is unncessary and
means we'll reload the interrupt state unnecessarily on the next
interrupt return.

cheers
