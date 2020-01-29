Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5F014C576
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 06:01:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486rtX0Tb5zDqLl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:01:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LZ2CaKXS; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486rrZ2kVszDqLM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 15:59:55 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id b9so8179579pgk.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 20:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=mJjcnXG+vaTXqKpUmJspKydmIR3qQts31DlUkhJ6Og8=;
 b=LZ2CaKXSMcaSC3CjINQlL7ARpt/SepXi/qKJQdtHifqmZzhuWLaiyBsWSXMZZl9e3M
 IRmb26t5fcDadnbZzxkH6X6bi6e/5LluCxEPTpesrEC/qub8z6M/zWW2aQ4c2O4QJ667
 RjhcVOdDstff+1BKghZdk/qDypBlrqb+9QMQl38jTagUr5trv6ibZdOKV/TotLwl/L6U
 F/CQwsN26cIlWJp0BwRE3hmlbP69WuAkbJzo9+Uh3CouSRY0sf5BMR13KeQQzUDO9AVW
 UTyCqz+cyR7YyMJ+njjHjJGNGR2a7tNFptNyvgysG3W+f7gjr/H2ym8NVSpltfrkn9Tt
 oLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=mJjcnXG+vaTXqKpUmJspKydmIR3qQts31DlUkhJ6Og8=;
 b=NMvCsqdz0Z/lG1wzA1HREbkGHwEYXjd+TXS1byinNcmm012MmqsQS+uKnRsVVvmUjE
 qYA9qISALCGywVuS9T2v0aeC9DdLr5gODpChMNBEYUNYQZsXpCKATCx+AW2TVa41dzwn
 OvfwoKzkJeJH/Ke8czYIGOTzLqAOw+17ocFzpJxHlebEgUaITLwhAtc+yreHN7D4a3bs
 2ySTCsMUeNquapqBijA6PQuHTlttFFIui6mOSUU+kTfCJG/W43TC9TzE+xlmggHBP/3D
 a6ptBeJ6Uov1X7k6+PRPD73gkkwFWoD8ow+4T6QqVoRy8Qaqkwg4aRp3EDSmnAhWfTre
 5/VQ==
X-Gm-Message-State: APjAAAXcXw8gS161RRkbpnnWSFHkAlV8hZFiWaHHBtYA6NjomaHB65a+
 TcC/M7op0YLrAIz6BNmbtkw=
X-Google-Smtp-Source: APXvYqwi2ys4rNhebE4vEmo+s0oPgOp67BKiKtwkoIeZAu9WPyiX0S8+i+lzAKi4WFegQznTqXO48Q==
X-Received: by 2002:aa7:874b:: with SMTP id g11mr7768369pfo.225.1580273991171; 
 Tue, 28 Jan 2020 20:59:51 -0800 (PST)
Received: from localhost (203-219-188-70.tpgi.com.au. [203.219.188.70])
 by smtp.gmail.com with ESMTPSA id b42sm601483pjc.27.2020.01.28.20.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 20:59:50 -0800 (PST)
Date: Wed, 29 Jan 2020 14:58:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 linuxppc-dev@lists.ozlabs.org
References: <1580207907.c96c1lh9t0.astroid@bobo.none>
 <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
 <1580218232.2tezmthp1x.astroid@bobo.none>
 <cd9e4b28-d577-8850-7c2b-a488fcb4740d@linaro.org>
In-Reply-To: <cd9e4b28-d577-8850-7c2b-a488fcb4740d@linaro.org>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1580273424.ea818exa2c.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adhemerval Zanella's on January 29, 2020 3:26 am:
>=20
>=20
> On 28/01/2020 11:05, Nicholas Piggin wrote:
>> Florian Weimer's on January 28, 2020 11:09 pm:
>>> * Nicholas Piggin:
>>>
>>>> * Proposal is for PPC_FEATURE2_SCV to indicate 'scv 0' support, all ot=
her
>>>>   vectors will return -ENOSYS, and the decision for how to add support=
 for
>>>>   a new vector deferred until we see the next user.
>>>
>>> Seems reasonable.  We don't have to decide this today.
>>>
>>>> * Proposal is for scv 0 to provide the standard Linux system call ABI =
with some
>>>>   differences:
>>>>
>>>> - LR is volatile across scv calls. This is necessary for support becau=
se the
>>>>   scv instruction clobbers LR.
>>>
>>> I think we can express this in the glibc system call assembler wrapper
>>> generators.  The mcount profiling wrappers already have this property.
>>>
>>> But I don't think we are so lucky for the inline system calls.  GCC
>>> recognizes an "lr" clobber with inline asm (even though it is not
>>> documented), but it generates rather strange assembler output as a
>>> result:
>>>
>>> long
>>> f (long x)
>>> {
>>>   long y;
>>>   asm ("#" : "=3Dr" (y) : "r" (x) : "lr");
>>>   return y;
>>> }
>>>
>>> 	.abiversion 2
>>> 	.section	".text"
>>> 	.align 2
>>> 	.p2align 4,,15
>>> 	.globl f
>>> 	.type	f, @function
>>> f:
>>> .LFB0:
>>> 	.cfi_startproc
>>> 	mflr 0
>>> 	.cfi_register 65, 0
>>> #APP
>>>  # 5 "t.c" 1
>>> 	#
>>>  # 0 "" 2
>>> #NO_APP
>>> 	std 0,16(1)
>>> 	.cfi_offset 65, 16
>>> 	ori 2,2,0
>>> 	ld 0,16(1)
>>> 	mtlr 0
>>> 	.cfi_restore 65
>>> 	blr
>>> 	.long 0
>>> 	.byte 0,0,0,1,0,0,0,0
>>> 	.cfi_endproc
>>> .LFE0:
>>> 	.size	f,.-f
>>>
>>>
>>> That's with GCC 8.3 at -O2.  I don't understand what the ori is about.
>>=20
>> ori 2,2,0 is the group terminating nop hint for POWER8 type cores
>> which had dispatch grouping rules.
>=20
> It worth to note that it aims to mitigate a load-hit-store cpu stall
> on some powerpc chips.
>=20
>>=20
>>>
>>> I don't think we can save LR in a regular register around the system
>>> call, explicitly in the inline asm statement, because we still have to
>>> generate proper unwinding information using CFI directives, something
>>> that you cannot do from within the asm statement.
>>>
>>> Supporting this in GCC should not be impossible, but someone who
>>> actually knows this stuff needs to look at it.
>>=20
>> The generated assembler actually seems okay to me. If we compile
>> something like a syscall and with -mcpu=3Dpower9:
>>=20
>> long
>> f (long _r3, long _r4, long _r5, long _r6, long _r7, long _r8, long _r0)
>> {
>>   register long r0 asm ("r0") =3D _r0;
>>   register long r3 asm ("r3") =3D _r3;
>>   register long r4 asm ("r4") =3D _r4;
>>   register long r5 asm ("r5") =3D _r5;
>>   register long r6 asm ("r6") =3D _r6;
>>   register long r7 asm ("r7") =3D _r7;
>>   register long r8 asm ("r8") =3D _r8;
>>=20
>>   asm ("# scv" : "=3Dr"(r3) : "r"(r0), "r"(r4), "r"(r5), "r"(r6), "r"(r7=
), "r"(r8) : "lr", "ctr", "cc", "xer");
>>=20
>>   return r3;
>> }
>>=20
>>=20
>> f:
>> .LFB0:
>>         .cfi_startproc
>>         mflr 0
>>         std 0,16(1)
>>         .cfi_offset 65, 16
>>         mr 0,9
>> #APP
>>  # 12 "a.c" 1
>>         # scv
>>  # 0 "" 2
>> #NO_APP
>>         ld 0,16(1)
>>         mtlr 0
>>         .cfi_restore 65
>>         blr
>>         .long 0
>>         .byte 0,0,0,1,0,0,0,0
>>         .cfi_endproc
>>=20
>> That gets the LR save/restore right when we're also using r0.
>>=20
>>>
>>>> - CR1 and CR5-CR7 are volatile. This matches the C ABI and would allow=
 the
>>>>   system call exit to avoid restoring the CR register.
>>>
>>> This sounds reasonable, but I don't know what kind of knock-on effects
>>> this has.  The inline system call wrappers can handle this with minor
>>> tweaks.
>>=20
>> Okay, good. In the end we would have to check code trace through the
>> kernel and libc of course, but I think there's little to no opportunity
>> to take advantage of current extra non-volatile cr regs.
>>=20
>> mtcr has to write 8 independently renamed registers so it's cracked into
>> 2 insns on POWER9 (and likely to always be a bit troublesome). It's not
>> much in the scheme of a system call, but while we can tweak the ABI...
>=20
> We don't really need a mfcr/mfocr to implement the Linux syscall ABI on
> powerpc, we can use a 'bns+' plus a neg instead as:
>=20
> --
> #define internal_syscall6(name, err, nr, arg1, arg2, arg3, arg4, arg5,  \
>                           arg6)                                         \
>   ({                                                                    \
>     register long int r0  __asm__ ("r0") =3D (long int) (name);          =
 \
>     register long int r3  __asm__ ("r3") =3D (long int) (arg1);          =
 \
>     register long int r4  __asm__ ("r4") =3D (long int) (arg2);          =
 \
>     register long int r5  __asm__ ("r5") =3D (long int) (arg3);          =
 \
>     register long int r6  __asm__ ("r6") =3D (long int) (arg4);          =
 \
>     register long int r7  __asm__ ("r7") =3D (long int) (arg5);          =
 \
>     register long int r8  __asm__ ("r8") =3D (long int) (arg6);          =
 \
>     __asm__ __volatile__                                                \
>       ("sc\n\t"                                                         \
>        "bns+ 1f\n\t"                                                    \
>        "neg %1, %1\n\t"                                                 \
>        "1:\n\t"                                                         \
>        : "+r" (r0), "+r" (r3), "+r" (r4), "+r" (r5), "+r" (r6),         \
>          "+r" (r7), "+r" (r8)                                           \
>        :                                                                \
>        : "r9", "r10", "r11", "r12",                                     \
>          "cr0", "memory");                                              \
>     r3;                                                                 \
>   })

True, but the taken branch would be a 1 cycle bubble in fetch. Could=20
avoid that by branching out of line then back for the error case. But
mfocrf is fine (only sources one register), that's what should be used
here I think.

That probably makes the performance argument for avoiding CR[SO] for
error return indication less significant. Commonality with other
architectures is probably the bigger reason for it.

> --
>=20
> And change INTERNAL_SYSCALL_ERROR_P to check for the expected invalid
> range (((unsigned long) (val) >=3D (unsigned long) -4095)) and=20
> INTERNAL_SYSCALL_ERRNO to return a negative value (since the value will
> be negated by INTERNAL_SYSCALL_ERROR_P).
>=20
> The powerpc kernel ABI to use a different constraint to signal error
> also requires glibc to reimplement the vDSO symbol call to be arch
> specific instead a straight function call (since it might fallbacks
> to a syscall).
>=20
> Even for POWER-specific system call that uses all result bits, either
> it should not fail or it would require a arch-specific implementation
> to setup the expected error value (since the information would require
> another source or a pre-defined value).=20
>=20
> In fact I think we make the assumption that INTERNAL_SYSCALL returns
> a negative errno value in case or an error and make all the handling
> to check for a syscall failure and errno setting generic. This will
> required change ia64, mips, nios2, and sparc though.
>=20
>>=20
>>>
>>>> - Error handling: use of CR0[SO] to indicate error requires a mtcr / m=
tocr
>>>>   instruction on the kernel side, and it is currently not implemented =
well
>>>>   in glibc, requiring a mfcr (mfocr should be possible and asm goto su=
pport
>>>>   would allow a better implementation). Is it worth continuing this st=
yle of
>>>>   error handling? Or just move to -ve return means error? Using a diff=
erent
>>>>   bit would allow the kernel to piggy back the CR return code setting =
with
>>>>   a test for the error case exit.
>>>
>>> GCC does not model the condition registers, so for inline system calls,
>>> we have to produce a value anyway that the subsequence C code can check=
.
>>> The assembler syscall wrappers do not need to do this, of course, but
>>> I'm not sure which category of interfaces is more important.
>>=20
>> Right. asm goto can improve this kind of pattern if it's inlined
>> into the C code which tests the result, it can branch using the flags
>> to the C error handling label, rather than move flags into GPR, test
>> GPR, branch. However...
>>=20
>>> But the kernel uses the -errno convention internally, so I think it
>>> would make sense to pass this to userspace and not convert back and
>>> forth.  This would align with what most of the architectures do, and
>>> also avoids the GCC oddity.
>>=20
>> Yes I would be interested in opinions for this option. It seems like
>> matching other architectures is a good idea. Maybe there are some
>> reasons not to.
>>=20
>>>> - Should this be for 64-bit only? 'scv 1' could be reserved for 32-bit
>>>>   calls if there was interest in developing an ABI for 32-bit programs=
.
>>>>   Marginal benefit in avoiding compat syscall selection.
>>>
>>> We don't have an ELFv2 ABI for 32-bit.  I doubt it makes sense to
>>> provide an ELFv1 port for this given that it's POWER9-specific.
>>=20
>> Okay. There's no reason not to enable this for BE, at least for the
>> kernel it's no additional work so it probably remains enabled (unless
>> there is something really good we could do with the ABI if we exclude
>> ELFv1 but I don't see anything).
>>=20
>> But if glibc only builds for ELFv2 support that's probably reasonable.
>>=20
>>>
>>> From the glibc perspective, the major question is how we handle run-tim=
e
>>> selection of the system call instruction sequence.  On i386, we use a
>>> function pointer in the TCB to call an instruction sequence in the vDSO=
.
>>> That's problematic from a security perspective.  I expect that on
>>> POWER9, using a pointer in read-only memory would be equally
>>> non-attractive due to a similar lack of PC-relative addressing.  We
>>> could use the HWCAP bit in the TCB, but that would add another (easy to
>>> predict) conditional branch to every system call.
>>=20
>> I would have to defer to glibc devs on this. Conditional branch
>> should be acceptable I think, scv improves speed as much as several
>> mispredicted branches (about 90 cycles).
>>=20
>>> I don't think it matters whether both system call variants use the same
>>> error convention because we could have different error code extraction
>>> code on the two branches.
>>=20
>> That's one less difficulty.
>=20
> We already had to push a similar hack where glibc used to abort transacti=
ons
> prior syscalls to avoid some side-effects on kernel (commit 56cf2763819d2=
f).
> It was eventually removed from syscall handling by f0458cf4f9ff3d870, whe=
re
> we only enable TLE if kernel suppors PPC_FEATURE2_HTM_NOSC.
>=20
> The transaction syscall abort used to read a variable directly from TCB,
> so this could be an option. I would expect that we could optimize it wher=
e
> if glibc is building against a recent kernel and compiler is building
> for a ISA 3.0+ cpu we could remove the 'sc' code.
>=20

We would just have to be careful of running on ISA 3.0 CPUs on older
kernels which do not support scv.

I don't think this is such a big deal, yes we'll have a switch for a
time and it will be slightly slower, but we can eventually remove it.

Thanks,
Nick
=
