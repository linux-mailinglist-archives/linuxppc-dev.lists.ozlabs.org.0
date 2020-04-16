Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E81AB4AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 02:19:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492fwM3TGwzDrCT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 10:18:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VrzWL1OU; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492ftX2rDbzDr8N
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 10:17:23 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id d17so787238pgo.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 17:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=y+BJV5qqgRb7VaqgWi198OzXB7Ja/Atr9zrjQtiZUt8=;
 b=VrzWL1OUAF2ebv9iSydARa4PXImyr0+Ogc15W/pl/d/36kWXCIw5DfVX2Vi2WAf9wH
 +zesKlDaY5bDvEAYiXNmbp9G9DVkqYNqpuLtmzjwjZxMEfG909Vv3/VrnObHPl7+bIbq
 N16TsZIsNNMFpP+km9bV/DuTbC7oYRZ5pEjO+IGZxNJxiq9TOb7+UTQHisngBlexygqU
 OQpDiWW3wFoLENBjQ9+GrQeu3nRkdHBsEU2CxsO+KWtc4vvOJAFA1HAIiCX4bH6J2K5n
 y8aHzfGJNYkSyTdBo7ikGkEcPxXGbMYOP2JT5SDU96gBF1hu11NK1eJ+CYa9MoIPwxwP
 T6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=y+BJV5qqgRb7VaqgWi198OzXB7Ja/Atr9zrjQtiZUt8=;
 b=juliwMIgUaqXaFa2pQwYkpZ6CJDmit6i3xEZgLM2kFi/6T9Xm/P2naWUHCK6Bf1OdA
 asti6YcwyaEXa/SMXIF85f6NmU5yqxMCEuVTXFEmrc5ZVfBZXHbbFbOnScKL9dwc7CTP
 DDSfLby6Ku/3JPu3jHB8JPGawuD/WoKgoD35DeHlDNrHV2rKwWfNXQietmoQ6o3FgTE3
 +I2B6IbLUDfZiklDtKzAb4LzlTccNzv6ifKd4p+/IRhxPnfbejDe5qkYSdLhHqPgKOey
 EBGLYgcM9FBo2Z54lo6WevTYLMtEfyngYharKIvrHFyt35RoBCEXg2vzHmERL5fkw7mN
 NL3Q==
X-Gm-Message-State: AGi0PubARDCkfze2cTJI63kCJxj7nx7EkXUvy7VX/XbnuEhLKXdsLkj1
 WRV5gDNJtnZpUaBhoA2meMQ=
X-Google-Smtp-Source: APiQypJos/oiTEISlrLmmjfEAkwnh+wjbdsgv1Plq5zBTpjVYPc6zgVrBHTLnpEuHT6HypuV+nSQzg==
X-Received: by 2002:a63:6d4a:: with SMTP id i71mr29090931pgc.445.1586996240446; 
 Wed, 15 Apr 2020 17:17:20 -0700 (PDT)
Received: from localhost ([203.18.28.220])
 by smtp.gmail.com with ESMTPSA id c14sm13984038pgi.54.2020.04.15.17.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 17:17:19 -0700 (PDT)
Date: Thu, 16 Apr 2020 10:16:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
To: Rich Felker <dalias@libc.org>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
In-Reply-To: <20200415225539.GL11469@brightrain.aerifal.cx>
MIME-Version: 1.0
Message-Id: <1586994952.nnxigedbu2.astroid@bobo.none>
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

Excerpts from Rich Felker's message of April 16, 2020 8:55 am:
> On Thu, Apr 16, 2020 at 07:45:09AM +1000, Nicholas Piggin wrote:
>> I would like to enable Linux support for the powerpc 'scv' instruction,
>> as a faster system call instruction.
>>=20
>> This requires two things to be defined: Firstly a way to advertise to=20
>> userspace that kernel supports scv, and a way to allocate and advertise
>> support for individual scv vectors. Secondly, a calling convention ABI
>> for this new instruction.
>>=20
>> Thanks to those who commented last time, since then I have removed my
>> answered questions and unpopular alternatives but you can find them
>> here
>>=20
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-January/203545.html
>>=20
>> Let me try one more with a wider cc list, and then we'll get something
>> merged. Any questions or counter-opinions are welcome.
>>=20
>> System Call Vectored (scv) ABI
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>>=20
>> The scv instruction is introduced with POWER9 / ISA3, it comes with an
>> rfscv counter-part. The benefit of these instructions is performance
>> (trading slower SRR0/1 with faster LR/CTR registers, and entering the
>> kernel with MSR[EE] and MSR[RI] left enabled, which can reduce MSR=20
>> updates. The scv instruction has 128 interrupt entry points (not enough=20
>> to cover the Linux system call space).
>>=20
>> The proposal is to assign scv numbers very conservatively and allocate=20
>> them as individual HWCAP features as we add support for more. The zero=20
>> vector ('scv 0') will be used for normal system calls, equivalent to 'sc=
'.
>>=20
>> Advertisement
>>=20
>> Linux has not enabled FSCR[SCV] yet, so the instruction will cause a
>> SIGILL in current environments. Linux has defined a HWCAP2 bit=20
>> PPC_FEATURE2_SCV for SCV support, but does not set it.
>>=20
>> When scv instruction support and the scv 0 vector for system calls are=20
>> added, PPC_FEATURE2_SCV will indicate support for these. Other vectors=20
>> should not be used without future HWCAP bits indicating support, which i=
s
>> how we will allocate them. (Should unallocated ones generate SIGILL, or
>> return -ENOSYS in r3?)
>>=20
>> Calling convention
>>=20
>> The proposal is for scv 0 to provide the standard Linux system call ABI=20
>> with the following differences from sc convention[1]:
>>=20
>> - LR is to be volatile across scv calls. This is necessary because the=20
>>   scv instruction clobbers LR. From previous discussion, this should be=20
>>   possible to deal with in GCC clobbers and CFI.
>>=20
>> - CR1 and CR5-CR7 are volatile. This matches the C ABI and would allow t=
he
>>   kernel system call exit to avoid restoring the CR register (although=20
>>   we probably still would anyway to avoid information leak).
>>=20
>> - Error handling: I think the consensus has been to move to using negati=
ve
>>   return value in r3 rather than CR0[SO]=3D1 to indicate error, which ma=
tches
>>   most other architectures and is closer to a function call.
>>=20
>> The number of scratch registers (r9-r12) at kernel entry seems=20
>> sufficient that we don't have any costly spilling, patch is here[2]. =20
>>=20
>> [1] https://github.com/torvalds/linux/blob/master/Documentation/powerpc/=
syscall64-abi.rst
>> [2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-February/204840=
.html
>=20
> My preference would be that it work just like the i386 AT_SYSINFO
> where you just replace "int $128" with "call *%%gs:16" and the kernel
> provides a stub in the vdso that performs either scv or the old
> mechanism with the same calling convention. Then if the kernel doesn't
> provide it (because the kernel is too old) libc would have to provide
> its own stub that uses the legacy method and matches the calling
> convention of the one the kernel is expected to provide.

I'm not sure if that's necessary. That's done on x86-32 because they
select different sequences to use based on the CPU running and if the host
kernel is 32 or 64 bit. Sure they could in theory have a bunch of HWCAP
bits and select the right sequence in libc as well I suppose.

> Note that any libc that actually makes use of the new functionality is
> not going to be able to make clobbers conditional on support for it;
> branching around different clobbers is going to defeat any gains vs
> always just treating anything clobbered by either method as clobbered.

Well it would have to test HWCAP and patch in or branch to two=20
completely different sequences including register save/restores yes.
You could have the same asm and matching clobbers to put the sequence
inline and then you could patch the one sc/scv instruction I suppose.

A bit of logic to select between them doesn't defeat gains though,
it's about 90 cycle improvement which is a handful of branch mispredicts=20
so it really is an improvement. Eventually userspace will stop=20
supporting the old variant too.

> Likewise, it's not useful to have different error return mechanisms
> because the caller just has to branch to support both (or the
> kernel-provided stub just has to emulate one for it; that could work
> if you really want to change the bad existing convention).
>=20
> Thoughts?

The existing convention has to change somewhat because of the clobbers,
so I thought we could change the error return at the same time. I'm
open to not changing it and using CR0[SO], but others liked the idea.
Pro: it matches sc and vsyscall. Con: it's different from other common
archs. Performnce-wise it would really be a wash -- cost of conditional
branch is not the cmp but the mispredict.

Thanks,
Nick
