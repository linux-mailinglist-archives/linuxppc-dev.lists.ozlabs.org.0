Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7490E4C28F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 11:12:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K47xf5Z33z3bPS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 21:12:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ow04/WOD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ow04/WOD; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K47x00Dx8z2x9Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 21:11:45 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id bx5so1565434pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 02:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=0UyTq+70vAzCW9qxBkMZP4Hj0BfByktsPwckPsM60AI=;
 b=ow04/WOD/9vA26tvuRs8a/SUfYu7aItaEjNfi4iygMZIR5FXddxaKnY3gJ0eBH3Guu
 cqV0ugd090AB1u5i8FX2N7E7+blbVEQrbvqAyMrlkEDw5zmeV2jJdCy1Dl1wgXW0zTGA
 0T4oS6z1NnAIvyZChnAxM4Y7PjppAB9KRHgJKTYa+UWtDFljA7L4Dz3zk6DlXimr383O
 AH44WiUBbenPHdrng51FdTtBSDPTkY0zHomwMB/ubs30fQz7LLbEoeDM5xjqwRKVUIL0
 y/nivXZG9RZcRHwb22fW/eMI6BmBacDh0mvuTP5TCMF7P86kqXPhYR+PlnbF4JzDKQQW
 dZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=0UyTq+70vAzCW9qxBkMZP4Hj0BfByktsPwckPsM60AI=;
 b=BFofNEcv9Hr7SjwiqOEKLG9Jx/QlXyzNsfnf5QienG8XXjxWeVHWPa/OgyLCBAyxJs
 WEh9Lh2IYonu0cOd7EfvIzP1TdML+aTFh0CqhBxfkLHscUoQQmveRlK3fz6YPTA57wrp
 cxvXF3GGMfN3EbE9NL8A6hBqy5T3VElxwVIvWjkDkW2rWrtyt0qZQ95+bGUx43VeTzc6
 1ucV8Sx4qb8o9aMRBGkFqEbpOdCe9REGweQt8Dpxx0sqaj5V854naHl5UdPzXay4vsqP
 hbne0t6HA6rvciBfSRRTqICTQH1pYKZYveEfRrs8yjWPF0P9FodEDioTrdHEbHOfOK2y
 2uZQ==
X-Gm-Message-State: AOAM531TUB2R1PPRCzP/AuIDhhqqBA1xGHtw8GU5j5G7ozTng5PT5EDk
 DZ+xyEeYrwTG7KcSiq86T44=
X-Google-Smtp-Source: ABdhPJyZU4g6wP2Mo9IwolMMtTJ1GMX0qpiyYVrPEiJ7s77T+aZBM7B4uD6EFV89/doY/JFv8h6DAw==
X-Received: by 2002:a17:902:d892:b0:14e:e074:7ff7 with SMTP id
 b18-20020a170902d89200b0014ee0747ff7mr1944382plz.29.1645697503522; 
 Thu, 24 Feb 2022 02:11:43 -0800 (PST)
Received: from localhost (115-64-212-59.static.tpgi.com.au. [115.64.212.59])
 by smtp.gmail.com with ESMTPSA id h4sm2909028pfv.166.2022.02.24.02.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 02:11:43 -0800 (PST)
Date: Thu, 24 Feb 2022 20:11:37 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
To: Arnd Bergmann <arnd@arndb.de>
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
 <1645670923.t0z533n7uu.astroid@bobo.none>
 <1645678884.dsm10mudmp.astroid@bobo.none>
 <CAK8P3a28XEN7aH-WdR=doBQKGskiTAeNsjbfvaD5YqEZNM=v0g@mail.gmail.com>
In-Reply-To: <CAK8P3a28XEN7aH-WdR=doBQKGskiTAeNsjbfvaD5YqEZNM=v0g@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1645694174.z03tip9set.astroid@bobo.none>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Anders Roxell <anders.roxell@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "# 3.4.x" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Arnd Bergmann's message of February 24, 2022 6:55 pm:
> On Thu, Feb 24, 2022 at 6:05 AM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>> Excerpts from Nicholas Piggin's message of February 24, 2022 12:54 pm:
>> >
>> > Not sure on the outlook for GCC fix. Either way unfortunately we have
>> > toolchains in the wild now that will explode, so we might have to take
>> > your patches for the time being.
>>
>> Perhaps not... Here's a hack that seems to work around the problem.
>>
>> The issue of removing -many from the kernel and replacing it with
>> appropriate architecture versions is an orthogonal one (that we
>> should do). Either way this hack should be able to allow us to do
>> that as well, on these problem toolchains.
>>
>> But for now it just uses -many as the trivial regression fix to get
>> back to previous behaviour.
>=20
> I don't think the previous behavior is what you want to be honest.

-many isn't good but that's what we're using and that is still
what we're using upstream on any other toolchain that doesn't
have these issues. Including the next binutils version that will
ignore the initial .machine directive for 64s.

Neither of these approaches solves that. At least for 64s that
is passing -Wa,-many down already. (Although Anders' series
gets almost there).

So this is the minimal fix that brings the toolchians in to line
with others and behaves how it previously did and fixes immediate
build regressions. Removing -many is somewhat independent of that.

> We had the same thing on Arm a few years ago when binutils
> started enforcing this more strictly, and it does catch actual
> bugs. I think annotating individual inline asm statements is
> the best choice here, as that documents what the intention is.

A few cases where there are differences in privileged instructions
(that won't be compiler generated), that will be done anyway.

For new instructions added to the ISA though? I think it's ugly and
unecesaary. There is no ambiguity about the intention when you see
a lharx instruction is there?

It would delinate instructions that can't be used on all processors
but I don't see  much advantage there, it's not an exhaustive check
because we have other restrictions on instructions in the kernel
environment. And why would inline asm be special but not the rest
of the asm? Would you propose to put these .machine directives
everywhere in thousands of lines of asm code in the kernel? I
don't know that it's an improvement. And inline asm is a small
fraction of instructions.

>=20
> There is one more bug in this series that I looked at with Anders, but
> he did not send a patch for that so far:
>=20
> static void dummy_perf(struct pt_regs *regs)
> {
> #if defined(CONFIG_FSL_EMB_PERFMON)
>         mtpmr(PMRN_PMGC0, mfpmr(PMRN_PMGC0) & ~PMGC0_PMIE);
> #elif defined(CONFIG_PPC64) || defined(CONFIG_PPC_BOOK3S_32)
>         if (cur_cpu_spec->pmc_type =3D=3D PPC_PMC_IBM)
>                 mtspr(SPRN_MMCR0, mfspr(SPRN_MMCR0) & ~(MMCR0_PMXE|MMCR0_=
PMAO));
> #else
>         mtspr(SPRN_MMCR0, mfspr(SPRN_MMCR0) & ~MMCR0_PMXE);
> #endif
> }
>=20
> Here, the assembler correctly flags the mtpmr/mfpmr as an invalid
> instruction for a combined 6xx kernel: As far as I can tell, these are
> only available on e300 but not the others, and instead of the compile-tim=
e
> check for CONFIG_FSL_EMB_PERFMON, there needs to be some
> runtime check to use the first method on 83xx but the #elif one on
> the other 6xx machines.

Right that should be caught if you just pass -m<superset> architecture
to the assembler that does not include the mtpmr. 32-bit is a lot more
complicated than 64s like this though, so it's pssible in some cases
you will want more checking and -m<subset> + some .machine directives
will work better.

Once you add the .machine directive to your inline asm though, you lose
*all* such static checking for the instruction. So it's really not a
panacea and has its own downsides.

Thanks,
Nick
