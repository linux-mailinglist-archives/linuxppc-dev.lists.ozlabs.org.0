Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998F1AFF79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 03:13:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4957x80Xz8zDqkZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 11:13:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uX8WQlvw; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4957vN3FFyzDqhH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 11:11:44 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id v2so3321093plp.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 18:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=pQZ3uDZs8EBlNFwue5B+t0dPkVQ5nnB6ydOO4wkhzeE=;
 b=uX8WQlvwQT3I6lFaA3FPD5ZO/hBom/p3bsnnnqbuGIJZEB3qR6tGznEpPbu6SBgpDH
 nRQDPJLogl3pUH1Fvx7EpGWS6oC2lDDtJWX4ypBaWv9f+I/c1X1zMplTHvicGgb0KGQD
 VU2LOTmFNb3M6iVlYBd57DV/obhRFkHEwptqUbmT3UuseZvDVF2NhAShaTsv87N07o9b
 BwHqsl9RBC/GavivTSsJ5KGoB0ql/BguNS/2OH3n5oLGemG0/FySi72goc6IlCSrlM+8
 PPsaJDjv2wmyrQO75SHXUJ5ho4q/X0ubn/Nyx0yqPI5zIpeMJ1cXD2SLH140u2mVFxX8
 9tlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=pQZ3uDZs8EBlNFwue5B+t0dPkVQ5nnB6ydOO4wkhzeE=;
 b=lxurZngQ9rUQtgNdUxslk29TR1ZPnsqEsPhfHHj4WHGubNPKooZ2yX3Ahkqt92pPVX
 fvyX+F9x0adkEleaXC2oFfuOMTOp1LNCCaZWEOrDBVFv5UpmnYD0HbMgv6pV5r0u+sG5
 MTZduRz0UCOef9OJm7mAWlHrNmnCfzYVyzR2SlRe6LLIvsilsAS4MiKeajd3YkLzb2wY
 1z3HBVfQ8avhnLH3oxnbYgddOp5mR6NvrXYpDDuVW8QtDLpFBZ8UchZzq4m2tP7ETG9R
 MKy3xGfuv7ZR+TRoyWCRCnxVrS5ox9bV9j8ukHQt7Lv5AxhE5xSIdq+79ISmSlKhp2FY
 BldA==
X-Gm-Message-State: AGi0PubIOqOU3op3Pth0LsMn2FJdE0NxMLTyUdsi5HypbbgjfK7sp4eb
 m71IMO+fisvxZZ6aOWM2OnA=
X-Google-Smtp-Source: APiQypL7RXRsNz4GlD0gKfhSghyEZ6n2hWHj7iL0ivA4PK6/ltMTNzDkj8+Bjuj3jYEAXmMPZh6weQ==
X-Received: by 2002:a17:902:9308:: with SMTP id
 bc8mr14826600plb.278.1587345102124; 
 Sun, 19 Apr 2020 18:11:42 -0700 (PDT)
Received: from localhost ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id x10sm9565938pgq.79.2020.04.19.18.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Apr 2020 18:11:41 -0700 (PDT)
Date: Mon, 20 Apr 2020 11:10:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>, Rich Felker
 <dalias@libc.org>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <c2612908-67f7-cceb-d121-700dea096016@linaro.org>
 <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
In-Reply-To: <20200416183151.GA11469@brightrain.aerifal.cx>
MIME-Version: 1.0
Message-Id: <1587344003.daumxvs1kh.astroid@bobo.none>
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

Excerpts from Rich Felker's message of April 17, 2020 4:31 am:
> On Thu, Apr 16, 2020 at 03:18:42PM -0300, Adhemerval Zanella wrote:
>>=20
>>=20
>> On 16/04/2020 14:59, Rich Felker wrote:
>> > On Thu, Apr 16, 2020 at 02:50:18PM -0300, Adhemerval Zanella wrote:
>> >>
>> >>
>> >> On 16/04/2020 12:37, Rich Felker wrote:
>> >>> On Thu, Apr 16, 2020 at 11:16:04AM -0300, Adhemerval Zanella wrote:
>> >>>>> My preference would be that it work just like the i386 AT_SYSINFO
>> >>>>> where you just replace "int $128" with "call *%%gs:16" and the ker=
nel
>> >>>>> provides a stub in the vdso that performs either scv or the old
>> >>>>> mechanism with the same calling convention. Then if the kernel doe=
sn't
>> >>>>> provide it (because the kernel is too old) libc would have to prov=
ide
>> >>>>> its own stub that uses the legacy method and matches the calling
>> >>>>> convention of the one the kernel is expected to provide.
>> >>>>
>> >>>> What about pthread cancellation and the requirement of checking the
>> >>>> cancellable syscall anchors in asynchronous cancellation? My plan i=
s
>> >>>> still to use musl strategy on glibc (BZ#12683) and for i686 it=20
>> >>>> requires to always use old int$128 for program that uses cancellati=
on
>> >>>> (static case) or just threads (dynamic mode, which should be more
>> >>>> common on glibc).
>> >>>>
>> >>>> Using the i686 strategy of a vDSO bridge symbol would require to al=
ways
>> >>>> fallback to 'sc' to still use the same cancellation strategy (and
>> >>>> thus defeating this optimization in such cases).
>> >>>
>> >>> Yes, I assumed it would be the same, ignoring the new syscall
>> >>> mechanism for cancellable syscalls. While there are some exceptions,
>> >>> cancellable syscalls are generally not hot paths but things that are
>> >>> expected to block and to have significant amounts of work to do in
>> >>> kernelspace, so saving a few tens of cycles is rather pointless.
>> >>>
>> >>> It's possible to do a branch/multiple versions of the syscall asm fo=
r
>> >>> cancellation but would require extending the cancellation handler to
>> >>> support checking against multiple independent address ranges or usin=
g
>> >>> some alternate markup of them.
>> >>
>> >> The main issue is at least for glibc dynamic linking is way more comm=
on
>> >> than static linking and once the program become multithread the fallb=
ack
>> >> will be always used.
>> >=20
>> > I'm not relying on static linking optimizing out the cancellable
>> > version. I'm talking about how cancellable syscalls are pretty much
>> > all "heavy" operations to begin with where a few tens of cycles are in
>> > the realm of "measurement noise" relative to the dominating time
>> > costs.
>>=20
>> Yes I am aware, but at same time I am not sure how it plays on real worl=
d.
>> For instance, some workloads might issue kernel query syscalls, such as
>> recv, where buffer copying might not be dominant factor. So I see that i=
f
>> the idea is optimizing syscall mechanism, we should try to leverage it
>> as whole in libc.
>=20
> Have you timed a minimal recv? I'm not assuming buffer copying is the
> dominant factor. I'm assuming the overhead of all the kernel layers
> involved is dominant.
>=20
>> >> And besides the cancellation performance issue, a new bridge vDSO mec=
hanism
>> >> will still require to setup some extra bridge for the case of the old=
er
>> >> kernel.  In the scheme you suggested:
>> >>
>> >>   __asm__("indirect call" ... with common clobbers);
>> >>
>> >> The indirect call will be either the vDSO bridge or an libc provided =
that
>> >> fallback to 'sc' for !PPC_FEATURE2_SCV. I am not this is really a gai=
n
>> >> against:
>> >>
>> >>    if (hwcap & PPC_FEATURE2_SCV) {
>> >>      __asm__(... with some clobbers);
>> >>    } else {
>> >>      __asm__(... with different clobbers);
>> >>    }
>> >=20
>> > If the indirect call can be made roughly as efficiently as the sc
>> > sequence now (which already have some cost due to handling the nasty
>> > error return convention, making the indirect call likely just as small
>> > or smaller), it's O(1) additional code size (and thus icache usage)
>> > rather than O(n) where n is number of syscall points.
>> >=20
>> > Of course it would work just as well (for avoiding O(n) growth) to
>> > have a direct call to out-of-line branch like you suggested.
>>=20
>> Yes, but does it really matter to optimize this specific usage case
>> for size? glibc, for instance, tries to leverage the syscall mechanism=20
>> by adding some complex pre-processor asm directives.  It optimizes
>> the syscall code size in most cases.  For instance, kill in static case=20
>> generates on x86_64:
>>=20
>> 0000000000000000 <__kill>:
>>    0:   b8 3e 00 00 00          mov    $0x3e,%eax
>>    5:   0f 05                   syscall=20
>>    7:   48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax
>>    d:   0f 83 00 00 00 00       jae    13 <__kill+0x13>
>>   13:   c3                      retq  =20
>>=20
>> While on musl:
>>=20
>> 0000000000000000 <kill>:
>>    0:	48 83 ec 08          	sub    $0x8,%rsp
>>    4:	48 63 ff             	movslq %edi,%rdi
>>    7:	48 63 f6             	movslq %esi,%rsi
>>    a:	b8 3e 00 00 00       	mov    $0x3e,%eax
>>    f:	0f 05                	syscall=20
>>   11:	48 89 c7             	mov    %rax,%rdi
>>   14:	e8 00 00 00 00       	callq  19 <kill+0x19>
>>   19:	5a                   	pop    %rdx
>>   1a:	c3                   	retq  =20
>=20
> Wow that's some extraordinarily bad codegen going on by gcc... The
> sign-extension is semantically needed and I don't see a good way
> around it (glibc's asm is kinda a hack taking advantage of kernel not
> looking at high bits, I think), but the gratuitous stack adjustment
> and refusal to generate a tail call isn't. I'll see if we can track
> down what's going on and get it fixed.
>=20
>> But I hardly think it pays off the required code complexity.  Some
>> for providing a O(1) bridge: this will require additional complexity
>> to write it and setup correctly.
>=20
> In some sense I agree, but inline instructions are a lot more
> expensive on ppc (being 32-bit each), and it might take out-of-lining
> anyway to get rid of stack frame setups if that ends up being a
> problem.
>=20
>> >> Specially if 'hwcap & PPC_FEATURE2_SCV' could be optimized with a=20
>> >> TCB member (as we do on glibc) and if we could make the asm clever
>> >> enough to not require different clobbers (although not sure if
>> >> it would be possible).
>> >=20
>> > The easy way not to require different clobbers is just using the union
>> > of the clobbers, no? Does the proposed new method clobber any
>> > call-saved registers that would make it painful (requiring new call
>> > frames to save them in)?
>>=20
>> As far I can tell, it should be ok.
>=20
> Note that because lr is clobbered we need at least once normally
> call-clobbered register that's not syscall clobbered to save lr in.
> Otherwise stack frame setup is required to spill it.

The kernel would like to use r9-r12 for itself. We could do with fewer=20
registers, but we have some delay establishing the stack (depends on a
load which depends on a mfspr), and entry code tends to be quite store
heavy whereas on the caller side you have r1 set up (modulo stack=20
updates), and the system call is a long delay during which time the=20
store queue has significant time to drain.

My feeling is it would be better for kernel to have these scratch=20
registers.

Thanks,
Nick
