Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BE614B74B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 15:13:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486T9X6z1VzDqDp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 01:13:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Wsjw/yEZ; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486T1r3zxMzDqGt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 01:06:40 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id ay11so5138526plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 06:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=itFqQjB6LakehMBxudMwtqd1iOWg7Lj9Fjv/yohO824=;
 b=Wsjw/yEZTKRpqSXL6I+A6J5uvURehBVn6K+Z9K2QXqv1whge78WArZLc6Rqx14Zc0q
 ukrPUCGtotMxOdCeElJ4J5VotTaaftjMCDOafoDkQFhfRwVnnzULL8ngO2pDcM0Sw7vz
 W4nfVqEf4OMX42P+ocsw3+uZNMMYk2XL/0xsOmxubGd/2mEwQRgRImbSmznnOx2sORZl
 r+LLjfwSVUnYjIfiyJpTia/Fy4puUpurKMlpXrtvBdz3Z7sHkpxL5K/MnRmSNqV/GIpO
 EG0Na8fWI3Arxvka6rATAhIzdkfsHYosXnrMtvU3NNw0NVK9fkEzsAvTOCptt/uPDE8C
 vsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=itFqQjB6LakehMBxudMwtqd1iOWg7Lj9Fjv/yohO824=;
 b=k2kj0LKHZ9V2zwUs5t7bzb6J//ssirVGYCkhziX7A8ihxBu4V8Wld8KUkRvbKQZCg0
 9w2MUpoVZzbeE1WXW32MhTNrwq+M1tvF2oqo0NoRZhMLiN7AN1n23uMDtvRiRTspF9e6
 AlhWw/9u4Z40hEvRMKB3kQ8dkkbIZnqTxfY03E5w2Lc/PnKpCsIG2Drl+enLZvzkR1y8
 3NCDZItx6hLm0qr4mhlWu5bZOfUbQRgk/bvHAkb2zw1JH1GmiYVgqRMmEsCb4mANXHDv
 Cr8ZO98EYU6OBQUS8CXCPEFvj4SilMjHEXO/Yy4U4xBsRRVYTSLK7LSXon3OQdkX+mDi
 HujA==
X-Gm-Message-State: APjAAAXlmIOr52MmWhY3TSFiSdAXLREVsKkDFJro4ooc3miPX6ONR6D/
 fkGK+bblkcN2odgDpuh0W+s=
X-Google-Smtp-Source: APXvYqy3KtJWzRDuHM6J8NQPJpkBlb5i1fsAaL8buE2IzePOSkEbI4h9NpLgcLBUdyGf7uwCrRWqEg==
X-Received: by 2002:a17:902:d885:: with SMTP id
 b5mr24022823plz.215.1580220396678; 
 Tue, 28 Jan 2020 06:06:36 -0800 (PST)
Received: from localhost (203-219-188-70.tpgi.com.au. [203.219.188.70])
 by smtp.gmail.com with ESMTPSA id m101sm3129970pje.13.2020.01.28.06.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 06:06:35 -0800 (PST)
Date: Wed, 29 Jan 2020 00:05:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: powerpc Linux scv support and scv system call ABI proposal
To: Florian Weimer <fweimer@redhat.com>
References: <1580207907.c96c1lh9t0.astroid@bobo.none>
 <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87tv4fd8wp.fsf@oldenburg2.str.redhat.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1580218232.2tezmthp1x.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 libc-alpha@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Florian Weimer's on January 28, 2020 11:09 pm:
> * Nicholas Piggin:
>=20
>> * Proposal is for PPC_FEATURE2_SCV to indicate 'scv 0' support, all othe=
r
>>   vectors will return -ENOSYS, and the decision for how to add support f=
or
>>   a new vector deferred until we see the next user.
>=20
> Seems reasonable.  We don't have to decide this today.
>=20
>> * Proposal is for scv 0 to provide the standard Linux system call ABI wi=
th some
>>   differences:
>>
>> - LR is volatile across scv calls. This is necessary for support because=
 the
>>   scv instruction clobbers LR.
>=20
> I think we can express this in the glibc system call assembler wrapper
> generators.  The mcount profiling wrappers already have this property.
>=20
> But I don't think we are so lucky for the inline system calls.  GCC
> recognizes an "lr" clobber with inline asm (even though it is not
> documented), but it generates rather strange assembler output as a
> result:
>=20
> long
> f (long x)
> {
>   long y;
>   asm ("#" : "=3Dr" (y) : "r" (x) : "lr");
>   return y;
> }
>=20
> 	.abiversion 2
> 	.section	".text"
> 	.align 2
> 	.p2align 4,,15
> 	.globl f
> 	.type	f, @function
> f:
> .LFB0:
> 	.cfi_startproc
> 	mflr 0
> 	.cfi_register 65, 0
> #APP
>  # 5 "t.c" 1
> 	#
>  # 0 "" 2
> #NO_APP
> 	std 0,16(1)
> 	.cfi_offset 65, 16
> 	ori 2,2,0
> 	ld 0,16(1)
> 	mtlr 0
> 	.cfi_restore 65
> 	blr
> 	.long 0
> 	.byte 0,0,0,1,0,0,0,0
> 	.cfi_endproc
> .LFE0:
> 	.size	f,.-f
>=20
>=20
> That's with GCC 8.3 at -O2.  I don't understand what the ori is about.

ori 2,2,0 is the group terminating nop hint for POWER8 type cores
which had dispatch grouping rules.

>=20
> I don't think we can save LR in a regular register around the system
> call, explicitly in the inline asm statement, because we still have to
> generate proper unwinding information using CFI directives, something
> that you cannot do from within the asm statement.
>=20
> Supporting this in GCC should not be impossible, but someone who
> actually knows this stuff needs to look at it.

The generated assembler actually seems okay to me. If we compile
something like a syscall and with -mcpu=3Dpower9:

long
f (long _r3, long _r4, long _r5, long _r6, long _r7, long _r8, long _r0)
{
  register long r0 asm ("r0") =3D _r0;
  register long r3 asm ("r3") =3D _r3;
  register long r4 asm ("r4") =3D _r4;
  register long r5 asm ("r5") =3D _r5;
  register long r6 asm ("r6") =3D _r6;
  register long r7 asm ("r7") =3D _r7;
  register long r8 asm ("r8") =3D _r8;

  asm ("# scv" : "=3Dr"(r3) : "r"(r0), "r"(r4), "r"(r5), "r"(r6), "r"(r7), =
"r"(r8) : "lr", "ctr", "cc", "xer");

  return r3;
}


f:
.LFB0:
        .cfi_startproc
        mflr 0
        std 0,16(1)
        .cfi_offset 65, 16
        mr 0,9
#APP
 # 12 "a.c" 1
        # scv
 # 0 "" 2
#NO_APP
        ld 0,16(1)
        mtlr 0
        .cfi_restore 65
        blr
        .long 0
        .byte 0,0,0,1,0,0,0,0
        .cfi_endproc

That gets the LR save/restore right when we're also using r0.

>=20
>> - CR1 and CR5-CR7 are volatile. This matches the C ABI and would allow t=
he
>>   system call exit to avoid restoring the CR register.
>=20
> This sounds reasonable, but I don't know what kind of knock-on effects
> this has.  The inline system call wrappers can handle this with minor
> tweaks.

Okay, good. In the end we would have to check code trace through the
kernel and libc of course, but I think there's little to no opportunity
to take advantage of current extra non-volatile cr regs.

mtcr has to write 8 independently renamed registers so it's cracked into
2 insns on POWER9 (and likely to always be a bit troublesome). It's not
much in the scheme of a system call, but while we can tweak the ABI...

>=20
>> - Error handling: use of CR0[SO] to indicate error requires a mtcr / mto=
cr
>>   instruction on the kernel side, and it is currently not implemented we=
ll
>>   in glibc, requiring a mfcr (mfocr should be possible and asm goto supp=
ort
>>   would allow a better implementation). Is it worth continuing this styl=
e of
>>   error handling? Or just move to -ve return means error? Using a differ=
ent
>>   bit would allow the kernel to piggy back the CR return code setting wi=
th
>>   a test for the error case exit.
>=20
> GCC does not model the condition registers, so for inline system calls,
> we have to produce a value anyway that the subsequence C code can check.
> The assembler syscall wrappers do not need to do this, of course, but
> I'm not sure which category of interfaces is more important.

Right. asm goto can improve this kind of pattern if it's inlined
into the C code which tests the result, it can branch using the flags
to the C error handling label, rather than move flags into GPR, test
GPR, branch. However...

> But the kernel uses the -errno convention internally, so I think it
> would make sense to pass this to userspace and not convert back and
> forth.  This would align with what most of the architectures do, and
> also avoids the GCC oddity.

Yes I would be interested in opinions for this option. It seems like
matching other architectures is a good idea. Maybe there are some
reasons not to.

>> - Should this be for 64-bit only? 'scv 1' could be reserved for 32-bit
>>   calls if there was interest in developing an ABI for 32-bit programs.
>>   Marginal benefit in avoiding compat syscall selection.
>=20
> We don't have an ELFv2 ABI for 32-bit.  I doubt it makes sense to
> provide an ELFv1 port for this given that it's POWER9-specific.

Okay. There's no reason not to enable this for BE, at least for the
kernel it's no additional work so it probably remains enabled (unless
there is something really good we could do with the ABI if we exclude
ELFv1 but I don't see anything).

But if glibc only builds for ELFv2 support that's probably reasonable.

>=20
> From the glibc perspective, the major question is how we handle run-time
> selection of the system call instruction sequence.  On i386, we use a
> function pointer in the TCB to call an instruction sequence in the vDSO.
> That's problematic from a security perspective.  I expect that on
> POWER9, using a pointer in read-only memory would be equally
> non-attractive due to a similar lack of PC-relative addressing.  We
> could use the HWCAP bit in the TCB, but that would add another (easy to
> predict) conditional branch to every system call.

I would have to defer to glibc devs on this. Conditional branch
should be acceptable I think, scv improves speed as much as several
mispredicted branches (about 90 cycles).

> I don't think it matters whether both system call variants use the same
> error convention because we could have different error code extraction
> code on the two branches.

That's one less difficulty.

Thanks,
Nick
=
