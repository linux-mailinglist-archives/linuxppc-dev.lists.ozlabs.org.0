Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8521AB5D8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 04:26:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492jld16nYzDrCB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 12:26:37 +1000 (AEST)
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
 header.s=20161025 header.b=ryXDFgeZ; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492jjf10SbzDr8V
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 12:24:51 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id h69so917820pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 19:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=zNMrcq76o9GpnHbWe3bpLYR/YccaW2QHDqgbX57Czlg=;
 b=ryXDFgeZRVR0RkbO3gAEM163mTjJvdYRE1gHWzT7LaRXOW7tL6DoPmLhMEk9nrwYOU
 rbMsJcyBU4Yc1U+6DS6GCHeSZIGPp2cb4QvxaWeq8X/E9vX8Zt+lLIawRBgobcJXGDbB
 SeC+8vKqGkb5IzSFckFhEFfJ3uUGjBE2jg5JoWvLguKx/0616kZAFnGTTpU0Qm4vE7eH
 Gzni1ftg9nox7YcMB3KgxCb0hxkAgwKutuoKQHijYfKtEXpkfK3VUkznTJEe58wWMVGQ
 NcKUp//SWpCU8HZFMHliDz45KcR6dvIU7sxvhmmr5HBJ+diQ90asWOAqAxUjY/ktyo2j
 N0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zNMrcq76o9GpnHbWe3bpLYR/YccaW2QHDqgbX57Czlg=;
 b=ZvwvdKHP2S0WL7S5IIjvuiVP/M9jBanvFvUAFKqz/vlPLBb5K+AoQv9zFbkO6GlpO1
 L4rONu2kmt37daUpvnAJbxHsYAX414OAaSBprF6AVR0eP781J4Vu3AC8f0nfuULHgTAm
 gMFOpGL9/eeGP7HgS+Y/iYnD8QhDrZpmWW6vjXSsulckYeilWAt9O3mOUh2y9e/88VB3
 QfDWLs391XjtAeVAbBKNSbP2ZH3sDv3pKUs8Dya8N/yqJ2GAQ5CYNpSaONH1rGkq/KQe
 2gNDlc8uh3tZZCWWCX2pfAaLzjLJosOu1N8OtX5Il7APwP1THm6brBhfqo0hna81U/c/
 HrCw==
X-Gm-Message-State: AGi0PuY/pmnVAiIQGUsqW9qW5XHiEzeDYSXcESXXg8BoVsN1CJIPkuge
 oqtzR6dVCFSDBKqhtIpq1Sc=
X-Google-Smtp-Source: APiQypK8WxLGRWj1nXsx9+7rz3w3digrCZW/t1cyLW8r1+UDVc2ozXohbFJay09Be9ihcoJzcJFi1w==
X-Received: by 2002:a63:2347:: with SMTP id u7mr18527223pgm.183.1587003887709; 
 Wed, 15 Apr 2020 19:24:47 -0700 (PDT)
Received: from localhost ([203.18.28.220])
 by smtp.gmail.com with ESMTPSA id v26sm15144875pfn.51.2020.04.15.19.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 19:24:46 -0700 (PDT)
Date: Thu, 16 Apr 2020 12:24:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
To: Rich Felker <dalias@libc.org>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <1586994952.nnxigedbu2.astroid@bobo.none>
 <20200416004843.GO11469@brightrain.aerifal.cx>
In-Reply-To: <20200416004843.GO11469@brightrain.aerifal.cx>
MIME-Version: 1.0
Message-Id: <1587002854.f0slo0111r.astroid@bobo.none>
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
Cc: libc-dev@lists.llvm.org, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Rich Felker's message of April 16, 2020 10:48 am:
> On Thu, Apr 16, 2020 at 10:16:54AM +1000, Nicholas Piggin wrote:
>> Excerpts from Rich Felker's message of April 16, 2020 8:55 am:
>> > On Thu, Apr 16, 2020 at 07:45:09AM +1000, Nicholas Piggin wrote:
>> >> I would like to enable Linux support for the powerpc 'scv' instructio=
n,
>> >> as a faster system call instruction.
>> >>=20
>> >> This requires two things to be defined: Firstly a way to advertise to=
=20
>> >> userspace that kernel supports scv, and a way to allocate and adverti=
se
>> >> support for individual scv vectors. Secondly, a calling convention AB=
I
>> >> for this new instruction.
>> >>=20
>> >> Thanks to those who commented last time, since then I have removed my
>> >> answered questions and unpopular alternatives but you can find them
>> >> here
>> >>=20
>> >> https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-January/203545.h=
tml
>> >>=20
>> >> Let me try one more with a wider cc list, and then we'll get somethin=
g
>> >> merged. Any questions or counter-opinions are welcome.
>> >>=20
>> >> System Call Vectored (scv) ABI
>> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> >>=20
>> >> The scv instruction is introduced with POWER9 / ISA3, it comes with a=
n
>> >> rfscv counter-part. The benefit of these instructions is performance
>> >> (trading slower SRR0/1 with faster LR/CTR registers, and entering the
>> >> kernel with MSR[EE] and MSR[RI] left enabled, which can reduce MSR=20
>> >> updates. The scv instruction has 128 interrupt entry points (not enou=
gh=20
>> >> to cover the Linux system call space).
>> >>=20
>> >> The proposal is to assign scv numbers very conservatively and allocat=
e=20
>> >> them as individual HWCAP features as we add support for more. The zer=
o=20
>> >> vector ('scv 0') will be used for normal system calls, equivalent to =
'sc'.
>> >>=20
>> >> Advertisement
>> >>=20
>> >> Linux has not enabled FSCR[SCV] yet, so the instruction will cause a
>> >> SIGILL in current environments. Linux has defined a HWCAP2 bit=20
>> >> PPC_FEATURE2_SCV for SCV support, but does not set it.
>> >>=20
>> >> When scv instruction support and the scv 0 vector for system calls ar=
e=20
>> >> added, PPC_FEATURE2_SCV will indicate support for these. Other vector=
s=20
>> >> should not be used without future HWCAP bits indicating support, whic=
h is
>> >> how we will allocate them. (Should unallocated ones generate SIGILL, =
or
>> >> return -ENOSYS in r3?)
>> >>=20
>> >> Calling convention
>> >>=20
>> >> The proposal is for scv 0 to provide the standard Linux system call A=
BI=20
>> >> with the following differences from sc convention[1]:
>> >>=20
>> >> - LR is to be volatile across scv calls. This is necessary because th=
e=20
>> >>   scv instruction clobbers LR. From previous discussion, this should =
be=20
>> >>   possible to deal with in GCC clobbers and CFI.
>> >>=20
>> >> - CR1 and CR5-CR7 are volatile. This matches the C ABI and would allo=
w the
>> >>   kernel system call exit to avoid restoring the CR register (althoug=
h=20
>> >>   we probably still would anyway to avoid information leak).
>> >>=20
>> >> - Error handling: I think the consensus has been to move to using neg=
ative
>> >>   return value in r3 rather than CR0[SO]=3D1 to indicate error, which=
 matches
>> >>   most other architectures and is closer to a function call.
>> >>=20
>> >> The number of scratch registers (r9-r12) at kernel entry seems=20
>> >> sufficient that we don't have any costly spilling, patch is here[2]. =
=20
>> >>=20
>> >> [1] https://github.com/torvalds/linux/blob/master/Documentation/power=
pc/syscall64-abi.rst
>> >> [2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-February/204=
840..html
>> >=20
>> > My preference would be that it work just like the i386 AT_SYSINFO
>> > where you just replace "int $128" with "call *%%gs:16" and the kernel
>> > provides a stub in the vdso that performs either scv or the old
>> > mechanism with the same calling convention. Then if the kernel doesn't
>> > provide it (because the kernel is too old) libc would have to provide
>> > its own stub that uses the legacy method and matches the calling
>> > convention of the one the kernel is expected to provide.
>>=20
>> I'm not sure if that's necessary. That's done on x86-32 because they
>> select different sequences to use based on the CPU running and if the ho=
st
>> kernel is 32 or 64 bit. Sure they could in theory have a bunch of HWCAP
>> bits and select the right sequence in libc as well I suppose.
>=20
> It's not just a HWCAP. It's a contract between the kernel and
> userspace to support a particular calling convention that's not
> exposed except as the public entry point the kernel exports via
> AT_SYSINFO.

Right.

>> > Note that any libc that actually makes use of the new functionality is
>> > not going to be able to make clobbers conditional on support for it;
>> > branching around different clobbers is going to defeat any gains vs
>> > always just treating anything clobbered by either method as clobbered.
>>=20
>> Well it would have to test HWCAP and patch in or branch to two=20
>> completely different sequences including register save/restores yes.
>> You could have the same asm and matching clobbers to put the sequence
>> inline and then you could patch the one sc/scv instruction I suppose.
>>=20
>> A bit of logic to select between them doesn't defeat gains though,
>> it's about 90 cycle improvement which is a handful of branch mispredicts=
=20
>> so it really is an improvement. Eventually userspace will stop=20
>> supporting the old variant too.
>=20
> Oh, I didn't mean it would neutralize the benefit of svc. Rather, I
> meant it would be worse to do:
>=20
> 	if (hwcap & X) {
> 		__asm__(... with some clobbers);
> 	} else {
> 		__asm__(... with different clobbers);
> 	}
>=20
> instead of just
>=20
> 	__asm__("indirect call" ... with common clobbers);

Ah okay. Well that's debatable but if you didn't have an indirect call,
rather a runtime-patched sequence, then yes saving the LR clobber or
whatever wouldn't be worth a branch.

> where the indirect call is to an address ideally provided like on
> i386, or otherwise initialized to one of two or more code addresses in
> libc based on hwcap bits.

Right, I'm just skeptical we need the indirect call or need to provide
it in the vdso. The "clever" reason to add it on x86-32 was because of
the bugs and different combinations needed, that doesn't really apply
to scv 0 and was not necessarily a great choice.

>=20
>> > Likewise, it's not useful to have different error return mechanisms
>> > because the caller just has to branch to support both (or the
>> > kernel-provided stub just has to emulate one for it; that could work
>> > if you really want to change the bad existing convention).
>> >=20
>> > Thoughts?
>>=20
>> The existing convention has to change somewhat because of the clobbers,
>> so I thought we could change the error return at the same time. I'm
>> open to not changing it and using CR0[SO], but others liked the idea.
>> Pro: it matches sc and vsyscall. Con: it's different from other common
>> archs. Performnce-wise it would really be a wash -- cost of conditional
>> branch is not the cmp but the mispredict.
>=20
> If you do the branch on hwcap at each syscall, then you significantly
> increase code size of every syscall point, likely turning a bunch of
> trivial functions that didn't need stack frames into ones that do. You
> also potentially make them need a TOC pointer. Making them all just do
> an indirect call unconditionally (with pointer in TLS like i386?) is a
> lot more efficient in code size and at least as good for performance.

I disagree. Doing the long vdso indirect call *necessarily* requires
touching a new icache line, and even a new TLB entry. Indirect branches
also tend to be more costly and/or less accurate to predict than
direct even without spectre (generally fewer indirect predictor entries
than direct, far branches in particular require a lot of bits for=20
target). And with spectre we're flushing the indirect predictors
on context switch or even disabling indirect prediction or flushing
across privilege domains in the same context.

And finally, the HWCAP test can eventually go away in future. A vdso
call can not.

If you really want to select with an indirect branch rather than
direct conditional, you can do that all within the library.

Thanks,
Nick
