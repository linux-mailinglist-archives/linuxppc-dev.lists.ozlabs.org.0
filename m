Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A0D14BE86
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 18:28:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486YVM2F66zDqFS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 04:28:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=adhemerval.zanella@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wILsJ/tE; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486YS95PPkzDqCX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 04:26:11 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id 21so14156181qky.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 09:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:references:to:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qrLxCF3gXXjAi7fh2HIPL9O2VyFYvQ93CdijTmizzpM=;
 b=wILsJ/tEg9lAwVBA7GenytKrm38LDn5Wh1Lkw7uUvkG0Tkc5uJlCBg79vuo4flY0An
 xpucQqb3I3z5dNReVHpfp3+ZuK6ujF0q9onm1JlBFoIcpdtwSydr+9uHBQ4uwB8L5F+B
 70JXSDmBdMzFge22CzZXXj/YaBUrLTTU0n4oGBIyPfmadfQa7LnTMOTEWNc5gPtO4O1m
 Ht3DtYnJNIvk6hccKpgs3HERKecB0WD+Ro764RdXEXVeKMfDSNFRGXJ2un7l1RDQkSKk
 GTG0DJ/oavmK0/gyoIr+EspoeJST+oGche0iXmPOdK88zEE+zfYPgHsv2IXxVP0SsEC2
 vGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:references:to:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qrLxCF3gXXjAi7fh2HIPL9O2VyFYvQ93CdijTmizzpM=;
 b=mtLPOOml39pPJDpf6AstWZjGlCtYj1j1HcYu2/LD6kVYgmpWQIWrTbEYstC/YmPCTb
 q54cOlR522xdXFfPSjZ4DPSu7QYadyRoJBPvz91xWsGswpMpOXHb1YKWA98Ja+pHZToj
 roI3Lm5J9wnVy25mlxZ+neFgwLZtn9NGoaCzXmlRUoygK8iuQBf6cDvqCMgUIWSGaK/l
 QHP40D2Ry+6TmTnD+ZAjFkyN0pTFI9PhHRtYiEGyCIUWqNE117fyAtJJ1jxokVCAj6cE
 GxPA6jBcb7/6JceygXV5cIylyuBjLIcPMvWlFWMQgjapKgawjwmYJZ/M1LtNWOuR4Ihb
 Q5/Q==
X-Gm-Message-State: APjAAAVaM/fysB91mf9njdfLlXKSEapNICrfLebnuCHcFx2ZsermdgWC
 3iYo0bGMAXejhaje0/4cQ+DzTA==
X-Google-Smtp-Source: APXvYqzMIfz6+seweZt0KvN9iBd8117/fFdk5bnBjJZQNo1bXbXk1kBjfhKyZBpuQPnH4f7SdHO8hA==
X-Received: by 2002:a37:89c7:: with SMTP id
 l190mr23537566qkd.498.1580232367961; 
 Tue, 28 Jan 2020 09:26:07 -0800 (PST)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id a22sm12597279qtd.48.2020.01.28.09.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 09:26:07 -0800 (PST)
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
References: <1580207907.c96c1lh9t0.astroid@bobo.none>
 <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
 <1580218232.2tezmthp1x.astroid@bobo.none>
To: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <cd9e4b28-d577-8850-7c2b-a488fcb4740d@linaro.org>
Date: Tue, 28 Jan 2020 14:26:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1580218232.2tezmthp1x.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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



On 28/01/2020 11:05, Nicholas Piggin wrote:
> Florian Weimer's on January 28, 2020 11:09 pm:
>> * Nicholas Piggin:
>>
>>> * Proposal is for PPC_FEATURE2_SCV to indicate 'scv 0' support, all other
>>>   vectors will return -ENOSYS, and the decision for how to add support for
>>>   a new vector deferred until we see the next user.
>>
>> Seems reasonable.  We don't have to decide this today.
>>
>>> * Proposal is for scv 0 to provide the standard Linux system call ABI with some
>>>   differences:
>>>
>>> - LR is volatile across scv calls. This is necessary for support because the
>>>   scv instruction clobbers LR.
>>
>> I think we can express this in the glibc system call assembler wrapper
>> generators.  The mcount profiling wrappers already have this property.
>>
>> But I don't think we are so lucky for the inline system calls.  GCC
>> recognizes an "lr" clobber with inline asm (even though it is not
>> documented), but it generates rather strange assembler output as a
>> result:
>>
>> long
>> f (long x)
>> {
>>   long y;
>>   asm ("#" : "=r" (y) : "r" (x) : "lr");
>>   return y;
>> }
>>
>> 	.abiversion 2
>> 	.section	".text"
>> 	.align 2
>> 	.p2align 4,,15
>> 	.globl f
>> 	.type	f, @function
>> f:
>> .LFB0:
>> 	.cfi_startproc
>> 	mflr 0
>> 	.cfi_register 65, 0
>> #APP
>>  # 5 "t.c" 1
>> 	#
>>  # 0 "" 2
>> #NO_APP
>> 	std 0,16(1)
>> 	.cfi_offset 65, 16
>> 	ori 2,2,0
>> 	ld 0,16(1)
>> 	mtlr 0
>> 	.cfi_restore 65
>> 	blr
>> 	.long 0
>> 	.byte 0,0,0,1,0,0,0,0
>> 	.cfi_endproc
>> .LFE0:
>> 	.size	f,.-f
>>
>>
>> That's with GCC 8.3 at -O2.  I don't understand what the ori is about.
> 
> ori 2,2,0 is the group terminating nop hint for POWER8 type cores
> which had dispatch grouping rules.

It worth to note that it aims to mitigate a load-hit-store cpu stall
on some powerpc chips.

> 
>>
>> I don't think we can save LR in a regular register around the system
>> call, explicitly in the inline asm statement, because we still have to
>> generate proper unwinding information using CFI directives, something
>> that you cannot do from within the asm statement.
>>
>> Supporting this in GCC should not be impossible, but someone who
>> actually knows this stuff needs to look at it.
> 
> The generated assembler actually seems okay to me. If we compile
> something like a syscall and with -mcpu=power9:
> 
> long
> f (long _r3, long _r4, long _r5, long _r6, long _r7, long _r8, long _r0)
> {
>   register long r0 asm ("r0") = _r0;
>   register long r3 asm ("r3") = _r3;
>   register long r4 asm ("r4") = _r4;
>   register long r5 asm ("r5") = _r5;
>   register long r6 asm ("r6") = _r6;
>   register long r7 asm ("r7") = _r7;
>   register long r8 asm ("r8") = _r8;
> 
>   asm ("# scv" : "=r"(r3) : "r"(r0), "r"(r4), "r"(r5), "r"(r6), "r"(r7), "r"(r8) : "lr", "ctr", "cc", "xer");
> 
>   return r3;
> }
> 
> 
> f:
> .LFB0:
>         .cfi_startproc
>         mflr 0
>         std 0,16(1)
>         .cfi_offset 65, 16
>         mr 0,9
> #APP
>  # 12 "a.c" 1
>         # scv
>  # 0 "" 2
> #NO_APP
>         ld 0,16(1)
>         mtlr 0
>         .cfi_restore 65
>         blr
>         .long 0
>         .byte 0,0,0,1,0,0,0,0
>         .cfi_endproc
> 
> That gets the LR save/restore right when we're also using r0.
> 
>>
>>> - CR1 and CR5-CR7 are volatile. This matches the C ABI and would allow the
>>>   system call exit to avoid restoring the CR register.
>>
>> This sounds reasonable, but I don't know what kind of knock-on effects
>> this has.  The inline system call wrappers can handle this with minor
>> tweaks.
> 
> Okay, good. In the end we would have to check code trace through the
> kernel and libc of course, but I think there's little to no opportunity
> to take advantage of current extra non-volatile cr regs.
> 
> mtcr has to write 8 independently renamed registers so it's cracked into
> 2 insns on POWER9 (and likely to always be a bit troublesome). It's not
> much in the scheme of a system call, but while we can tweak the ABI...

We don't really need a mfcr/mfocr to implement the Linux syscall ABI on
powerpc, we can use a 'bns+' plus a neg instead as:

--
#define internal_syscall6(name, err, nr, arg1, arg2, arg3, arg4, arg5,  \
                          arg6)                                         \
  ({                                                                    \
    register long int r0  __asm__ ("r0") = (long int) (name);           \
    register long int r3  __asm__ ("r3") = (long int) (arg1);           \
    register long int r4  __asm__ ("r4") = (long int) (arg2);           \
    register long int r5  __asm__ ("r5") = (long int) (arg3);           \
    register long int r6  __asm__ ("r6") = (long int) (arg4);           \
    register long int r7  __asm__ ("r7") = (long int) (arg5);           \
    register long int r8  __asm__ ("r8") = (long int) (arg6);           \
    __asm__ __volatile__                                                \
      ("sc\n\t"                                                         \
       "bns+ 1f\n\t"                                                    \
       "neg %1, %1\n\t"                                                 \
       "1:\n\t"                                                         \
       : "+r" (r0), "+r" (r3), "+r" (r4), "+r" (r5), "+r" (r6),         \
         "+r" (r7), "+r" (r8)                                           \
       :                                                                \
       : "r9", "r10", "r11", "r12",                                     \
         "cr0", "memory");                                              \
    r3;                                                                 \
  })
--

And change INTERNAL_SYSCALL_ERROR_P to check for the expected invalid
range (((unsigned long) (val) >= (unsigned long) -4095)) and 
INTERNAL_SYSCALL_ERRNO to return a negative value (since the value will
be negated by INTERNAL_SYSCALL_ERROR_P).

The powerpc kernel ABI to use a different constraint to signal error
also requires glibc to reimplement the vDSO symbol call to be arch
specific instead a straight function call (since it might fallbacks
to a syscall).

Even for POWER-specific system call that uses all result bits, either
it should not fail or it would require a arch-specific implementation
to setup the expected error value (since the information would require
another source or a pre-defined value). 

In fact I think we make the assumption that INTERNAL_SYSCALL returns
a negative errno value in case or an error and make all the handling
to check for a syscall failure and errno setting generic. This will
required change ia64, mips, nios2, and sparc though.

> 
>>
>>> - Error handling: use of CR0[SO] to indicate error requires a mtcr / mtocr
>>>   instruction on the kernel side, and it is currently not implemented well
>>>   in glibc, requiring a mfcr (mfocr should be possible and asm goto support
>>>   would allow a better implementation). Is it worth continuing this style of
>>>   error handling? Or just move to -ve return means error? Using a different
>>>   bit would allow the kernel to piggy back the CR return code setting with
>>>   a test for the error case exit.
>>
>> GCC does not model the condition registers, so for inline system calls,
>> we have to produce a value anyway that the subsequence C code can check.
>> The assembler syscall wrappers do not need to do this, of course, but
>> I'm not sure which category of interfaces is more important.
> 
> Right. asm goto can improve this kind of pattern if it's inlined
> into the C code which tests the result, it can branch using the flags
> to the C error handling label, rather than move flags into GPR, test
> GPR, branch. However...
> 
>> But the kernel uses the -errno convention internally, so I think it
>> would make sense to pass this to userspace and not convert back and
>> forth.  This would align with what most of the architectures do, and
>> also avoids the GCC oddity.
> 
> Yes I would be interested in opinions for this option. It seems like
> matching other architectures is a good idea. Maybe there are some
> reasons not to.
> 
>>> - Should this be for 64-bit only? 'scv 1' could be reserved for 32-bit
>>>   calls if there was interest in developing an ABI for 32-bit programs.
>>>   Marginal benefit in avoiding compat syscall selection.
>>
>> We don't have an ELFv2 ABI for 32-bit.  I doubt it makes sense to
>> provide an ELFv1 port for this given that it's POWER9-specific.
> 
> Okay. There's no reason not to enable this for BE, at least for the
> kernel it's no additional work so it probably remains enabled (unless
> there is something really good we could do with the ABI if we exclude
> ELFv1 but I don't see anything).
> 
> But if glibc only builds for ELFv2 support that's probably reasonable.
> 
>>
>> From the glibc perspective, the major question is how we handle run-time
>> selection of the system call instruction sequence.  On i386, we use a
>> function pointer in the TCB to call an instruction sequence in the vDSO.
>> That's problematic from a security perspective.  I expect that on
>> POWER9, using a pointer in read-only memory would be equally
>> non-attractive due to a similar lack of PC-relative addressing.  We
>> could use the HWCAP bit in the TCB, but that would add another (easy to
>> predict) conditional branch to every system call.
> 
> I would have to defer to glibc devs on this. Conditional branch
> should be acceptable I think, scv improves speed as much as several
> mispredicted branches (about 90 cycles).
> 
>> I don't think it matters whether both system call variants use the same
>> error convention because we could have different error code extraction
>> code on the two branches.
> 
> That's one less difficulty.

We already had to push a similar hack where glibc used to abort transactions
prior syscalls to avoid some side-effects on kernel (commit 56cf2763819d2f).
It was eventually removed from syscall handling by f0458cf4f9ff3d870, where
we only enable TLE if kernel suppors PPC_FEATURE2_HTM_NOSC.

The transaction syscall abort used to read a variable directly from TCB,
so this could be an option. I would expect that we could optimize it where
if glibc is building against a recent kernel and compiler is building
for a ISA 3.0+ cpu we could remove the 'sc' code.
