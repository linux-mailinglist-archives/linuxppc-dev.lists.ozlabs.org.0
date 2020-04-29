Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC901BD28D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 04:46:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BjZV5QqJzDqv4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 12:46:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BfSA+Lmb; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BjXG2LFgzDqsh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 12:44:27 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id s8so328992pgq.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 19:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=o5UZAuKDxaJikGTyV7Mi7kn76hffpC35CNEqcSA6oCU=;
 b=BfSA+LmbgQ1lqohtu9O2HhmUG7Yj/GTiHpJ2Dd6YpAse9CQ7R/kT2O/sf6hFAoSklF
 VdyaS8Huzgahx9OEM+YYZ6X1QjeDeQmRTLGuBMwQdB2uCALW6FmvYEOq9ddcqzTk+qVp
 ojM05oayJWqn7XYnXW7HGbBRrVIf3ib/SDoYEI6/swHrpKjA7trqZCiWXSb7Um8TiA8H
 jijN5p/4FSWsMqMitmMi4OFIz/B8CaPkFjh9msMJfCDjcagYJXd5F7uzVaIwEUhJ5iEV
 Gu0Vy2rV7chQPNjpByQGcVljoU2g2rWiOo/gNctD93zv8RojVx6dF5BdtljoS00PFdUS
 2YVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=o5UZAuKDxaJikGTyV7Mi7kn76hffpC35CNEqcSA6oCU=;
 b=EwQcs9Uex1vRotvXWfZtK1pTsXHhIMPA+i9Jo2OrF+mz46GH4+VHWToJBdDJmKOAJU
 rgH6YT6CFwY2uVYzCTxl9yx/iUPz0Yo+YRvvxsgau6RHAMOpWzL3v7Ep2i/Obb7TnFiO
 /eTm8vqxCyZUOvK6z3YTAxEpbL+g8NFEIlR3eBfI1d7frG/YScNfzeM2mPwyGOq4vRMx
 48Q3tkR+P95HdOx8fOYeriQahWbUSi4DS/6kmjbbqiNnbraioQvqcfjkotICK6bE9G8r
 allZU1R0dEh08Cxmts7gnTDZdABfd+VWoYfaxZ5RXtrG+ezFMCapm+WmS/83CzIl38MY
 PryA==
X-Gm-Message-State: AGi0PuaOXZT0eYSxEZrWSc+CXpZ9g/aVdtKFmr9Ohh7k3tk32hUZWSwc
 tuJjhqsZq0QDqEMUirIuU0s=
X-Google-Smtp-Source: APiQypK1AkLZMdtYzdGUn2CE3gfiW0uNVtZ8CUSWMXerYUZr2koLPKcOL3el/UxXKV394yZiauSSWA==
X-Received: by 2002:a62:75d1:: with SMTP id
 q200mr31917099pfc.238.1588128262052; 
 Tue, 28 Apr 2020 19:44:22 -0700 (PDT)
Received: from localhost ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id j32sm14176145pgb.55.2020.04.28.19.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 19:44:21 -0700 (PDT)
Date: Wed, 29 Apr 2020 12:39:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: New powerpc vdso calling convention
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>, Rich Felker
 <dalias@libc.org>
References: <1587790194.w180xsw5be.astroid@bobo.none>
 <9371cac5-20bb-0552-2609-0d537f41fecd@c-s.fr>
 <1587810370.tg8ym9yjpc.astroid@bobo.none>
 <976551e8-229e-54c1-8fb2-c5df94b979c3@c-s.fr>
 <1587855423.jug0f1n0b8.astroid@bobo.none>
 <20200425231119.GM11469@brightrain.aerifal.cx>
 <1587872025.rtx2ygrmn0.astroid@bobo.none>
 <e8a9d3d9-18a7-2cb9-db70-74f7b107f744@linaro.org>
In-Reply-To: <e8a9d3d9-18a7-2cb9-db70-74f7b107f744@linaro.org>
MIME-Version: 1.0
Message-Id: <1588126678.zjwj4d1d90.astroid@bobo.none>
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
Cc: libc-alpha@sourceware.org, musl@lists.openwall.com, binutils@sourceware.org,
 Andy Lutomirski <luto@kernel.org>, libc-dev@lists.llvm.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Adhemerval Zanella's message of April 27, 2020 11:09 pm:
>=20
>=20
> On 26/04/2020 00:41, Nicholas Piggin wrote:
>> Excerpts from Rich Felker's message of April 26, 2020 9:11 am:
>>> On Sun, Apr 26, 2020 at 08:58:19AM +1000, Nicholas Piggin wrote:
>>>> Excerpts from Christophe Leroy's message of April 25, 2020 10:20 pm:
>>>>>
>>>>>
>>>>> Le 25/04/2020 =C3=A0 12:56, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>>>> Excerpts from Christophe Leroy's message of April 25, 2020 5:47 pm:
>>>>>>>
>>>>>>>
>>>>>>> Le 25/04/2020 =C3=A0 07:22, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>>>>>> As noted in the 'scv' thread, powerpc's vdso calling convention do=
es not
>>>>>>>> match the C ELF ABI calling convention (or the proposed scv conven=
tion).
>>>>>>>> I think we could implement a new ABI by basically duplicating func=
tion
>>>>>>>> entry points with different names.
>>>>>>>
>>>>>>> I think doing this is a real good idea.
>>>>>>>
>>>>>>> I've been working at porting powerpc VDSO to the GENERIC C VDSO, an=
d the
>>>>>>> main pitfall has been that our vdso calling convention is not compa=
tible
>>>>>>> with C calling convention, so we have go through an ASM entry/exit.
>>>>>>>
>>>>>>> See https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=
=3D171469
>>>>>>>
>>>>>>> We should kill this error flag return through CR[SO] and get it the
>>>>>>> "modern" way like other architectectures implementing the C VDSO: r=
eturn
>>>>>>> 0 when successfull, return -err when failed.
>>>>>>
>>>>>> Agreed.
>>>>>>
>>>>>>>> The ELF v2 ABI convention would suit it well, because the caller a=
lready
>>>>>>>> requires the function address for ctr, so having it in r12 will
>>>>>>>> eliminate the need for address calculation, which suits the vdso d=
ata
>>>>>>>> page access.
>>>>>>>>
>>>>>>>> Is there a need for ELF v1 specific calls as well, or could those =
just be
>>>>>>>> deprecated and remain on existing functions or required to use the=
 ELF
>>>>>>>> v2 calls using asm wrappers?
>>>>>>>
>>>>>>> What's ELF v1 and ELF v2 ? Is ELF v1 what PPC32 uses ? If so, I'd s=
ay
>>>>>>> yes, it would be good to have it to avoid going through ASM in the =
middle.
>>>>>>
>>>>>> I'm not sure about PPC32. On PPC64, ELFv2 functions must be called w=
ith
>>>>>> their address in r12 if called at their global entry point. ELFv1 ha=
ve a
>>>>>> function descriptor with call address and TOC in it, caller has to l=
oad
>>>>>> the TOC if it's global.
>>>>>>
>>>>>> The vdso doesn't have TOC, it has one global address (the vdso data
>>>>>> page) which it loads by calculating its own address.
>>>>>>
>>>>>> The kernel doesn't change the vdso based on whether it's called by a=
 v1
>>>>>> or v2 userspace (it doesn't really know itself and would have to exp=
ort
>>>>>> different functions). glibc has a hack to create something:
>>>>>>
>>>>>> # define VDSO_IFUNC_RET(value)                           \
>>>>>>    ({                                                     \
>>>>>>      static Elf64_FuncDesc vdso_opd =3D { .fd_toc =3D ~0x0 }; \
>>>>>>      vdso_opd.fd_func =3D (Elf64_Addr)value;                \
>>>>>>      &vdso_opd;                                           \
>>>>>>    })
>>>>>>
>>>>>> If we could make something which links more like any other dso with
>>>>>> ELFv1, that would be good. Otherwise I think v2 is preferable so it
>>>>>> doesn't have to calculate its own address.
>>>>>
>>>>> I see the following in glibc. So looks like PPC32 is like PPC64 elfv1=
.=20
>>>>> By the way, they are talking about something not completely finished =
in=20
>>>>> the kernel. Can we finish it ?
>>>>
>>>> Possibly can. It seems like a good idea to fix all loose ends if we ar=
e=20
>>>> going to add new versions. Will have to check with the toolchain peopl=
e=20
>>>> to make sure we're doing the right thing.
>>>
>>> "ELFv1" and "ELFv2" are PPC64-specific names for the old and new
>>> version of the ELF psABI for PPC64. They have nothing at all to do
>>> with PPC32 which is a completely different ABI from either.
>>=20
>> Right, I'm just talking about those comments -- it seems like the kernel=
=20
>> vdso should contain an .opd section with function descriptors in it for
>> elfv1 calls, rather than the hack it has now of creating one in the=20
>> caller's .data section.
>>=20
>> But all that function descriptor code is gated by
>>=20
>> #if (defined(__PPC64__) || defined(__powerpc64__)) && _CALL_ELF !=3D 2
>>=20
>> So it seems PPC32 does not use function descriptors but a direct pointer=
=20
>> to the entry point like PPC64 with ELFv2.
>=20
> Yes, this hack is only for ELFv1.  The missing ODP has not been an issue=20
> or glibc because it has been using the inline assembly to emulate the=20
> functions call since initial vDSO support (INTERNAL_VSYSCALL_CALL_TYPE).
> It just has become an issue when I added a ifunc optimization to=20
> gettimeofday so it can bypass the libc.so and make plt branch to vDSO=20
> directly.

I can't understand if it's actually a problem for you or not.

Regardless if you can hack around it, it seems to me that if we're going=20
to add sane calling conventions to the vdso, then we should also just=20
have a .opd section for it as well, whether or not a particular libc=20
requires it.

> Recently on some y2038 refactoring it was suggested to get rid of this=20
> and make gettimeofday call clock_gettime regardless.  But some felt that=20
> the performance degradation was not worth for a symbol that is still used
> extensibility, so we stuck with the hack.
>=20
> And I think having this synthetic opd entry is not an issue, since for=20
> full relro the program's will be used and correctly set as read-only.

I'm not quite sure what this means, I don't really know how glibc ifunc=20
works. How do you set r2 if you have no opd?

> The issue is more for glibc itself, and I wouldn't mind to just remove th=
e
> gettimeofday and time optimizations and use the default vDSO support
> (which might increase in function latency though).
>=20
> As Rich has put, it would be simpler to just have powerpc vDSO symbols
> to have a default function call semantic so we could issue a function
> call directly.  But for powerpc64, we glibc will need to continue to=20
> support this non-standard call on older kernels and I am not sure if
> adding new symbols with a different semantic will help much.

Yeah, we will add entry points with default function call semantics.
At which point we make the things look like any other dso unless there=20
is good reason otherwise.

> GLibc already hides this powerpc semantic on INTERNAL_VSYSCALL_CALL_TYPE,
> so internally all syscalls are assumed to have the new semantic (-errno
> on error, 0 on success). Adding another ELFv1 would require to add
> more logic to handle multiple symbol version for vDSO setup
> (sysdeps/unix/sysv/linux/dl-vdso-setup.h), which would mostly likely to
> require an arch-specific implementation to handle it.

Is it not a build-time choice? The arch can set its own vdso symbol=20
names AFAIKS.

Thanks,
Nick
