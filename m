Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5267832988F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 10:54:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqXXh0QJzz3cmw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 20:54:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=cfWyjvjn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=cfWyjvjn; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqXXF51cNz3cGk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 20:54:03 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id x62so7100891oix.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Mar 2021 01:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tvKwxmRwJCtoKJ49eALPKngOjwRbk6LF76WWu5CWfIo=;
 b=cfWyjvjnY/GgwTK9I628QoCNsEMJaF1aakcSwCm3puMV13BShNtXEpkO6IRgwND9bh
 WRXL5x9gOyHupoJyHYqtzM0+r5wtECpLknb+Ypf3vf6dEKAw8IhX/o0LG5rjmgXaNK6i
 6GhRWYV0OpfZehVjEV99yyNQmgonvWUG2RSiIqldI3i2I2VYYYx/SI8xCBKee915cpPD
 BVtYQ3J/qplBf9KHP1Pz3/J1x/MJd/iytab2Mgm+5ZptJJdtfM3+xPKd1rNFfSNk5/n6
 6L3Ww1zKzI04/PZ4lZiboyNFfSUXB4sTEiVQaM5xXtc7kfM5dFTMKaMaaMzk0RcUFyJz
 nbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tvKwxmRwJCtoKJ49eALPKngOjwRbk6LF76WWu5CWfIo=;
 b=sX1idWfL5+rOaaYwjREqdfEnmVMZlQaDMpzXMWpjYvcNrxMojKceaxf02gRvc0vCEb
 R4JjsWJxbXPf+gmr+DKyhRNmV/MwGdV6vdjv1IH+38PdRkS93kOlw/fJXUFWY8plSFZg
 gq6Z5KNI3B0VzC6TlpZmzYTxmXbbZqTEBbeSTFmjDYjDfzGjzmrkyuQyThCs+m6uoCsJ
 zcNj4CSnpexH+VQDFG9f/u1t+znW/NT+ZJZ0Vo2bn4i936ekB9IPUZw2aby4+SC3wEWz
 qtssDSUnFq5pEKVeRCMG9o0mxUAT6wbL/U5N9sM2sEfPFiW+O5VQ2K/N+9l66idvaU8d
 OnmQ==
X-Gm-Message-State: AOAM531riKTUzH0bm31mP5mz52gek4EmADs7vTXjpBetsqcHbCPU5I9t
 ZcR1j6B+tRe1OeheVXrVptSwQrhPFgRGZaEVd1vZjA==
X-Google-Smtp-Source: ABdhPJyGIeM4ZbK0vTh5R+BgOzxvurYlsDaMjjznIxKN9t59Yh9Owm3sbiTHZbaZM8CpGHf4f3uYXEX/FCPXtGXDEjU=
X-Received: by 2002:aca:d515:: with SMTP id m21mr2637776oig.172.1614678839617; 
 Tue, 02 Mar 2021 01:53:59 -0800 (PST)
MIME-Version: 1.0
References: <51c397a23631d8bb2e2a6515c63440d88bf74afd.1614674144.git.christophe.leroy@csgroup.eu>
 <CANpmjNPOJfL_qsSZYRbwMUrxnXxtF5L3k9hursZZ7k9H1jLEuA@mail.gmail.com>
 <b9dc8d35-a3b0-261a-b1a4-5f4d33406095@csgroup.eu>
 <CAG_fn=WFffkVzqC9b6pyNuweFhFswZfa8RRio2nL9-Wq10nBbw@mail.gmail.com>
 <f806de26-daf9-9317-fdaa-a0f7a32d8fe0@csgroup.eu>
In-Reply-To: <f806de26-daf9-9317-fdaa-a0f7a32d8fe0@csgroup.eu>
From: Marco Elver <elver@google.com>
Date: Tue, 2 Mar 2021 10:53:48 +0100
Message-ID: <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Alexander Potapenko <glider@google.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Mar 2021 at 10:27, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 02/03/2021 =C3=A0 10:21, Alexander Potapenko a =C3=A9crit :
> >> [   14.998426] BUG: KFENCE: invalid read in finish_task_switch.isra.0+=
0x54/0x23c
> >> [   14.998426]
> >> [   15.007061] Invalid read at 0x(ptrval):
> >> [   15.010906]  finish_task_switch.isra.0+0x54/0x23c
> >> [   15.015633]  kunit_try_run_case+0x5c/0xd0
> >> [   15.019682]  kunit_generic_run_threadfn_adapter+0x24/0x30
> >> [   15.025099]  kthread+0x15c/0x174
> >> [   15.028359]  ret_from_kernel_thread+0x14/0x1c
> >> [   15.032747]
> >> [   15.034251] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B
> >> 5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty #4674
> >> [   15.045811] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> [   15.053324]     # test_invalid_access: EXPECTATION FAILED at mm/kfe=
nce/kfence_test.c:636
> >> [   15.053324]     Expected report_matches(&expect) to be true, but is=
 false
> >> [   15.068359]     not ok 21 - test_invalid_access
> >
> > The test expects the function name to be test_invalid_access, i. e.
> > the first line should be "BUG: KFENCE: invalid read in
> > test_invalid_access".
> > The error reporting function unwinds the stack, skips a couple of
> > "uninteresting" frames
> > (https://elixir.bootlin.com/linux/v5.12-rc1/source/mm/kfence/report.c#L=
43)
> > and uses the first "interesting" one frame to print the report header
> > (https://elixir.bootlin.com/linux/v5.12-rc1/source/mm/kfence/report.c#L=
226).
> >
> > It's strange that test_invalid_access is missing altogether from the
> > stack trace - is that expected?
> > Can you try printing the whole stacktrace without skipping any frames
> > to see if that function is there?
> >
>
> Booting with 'no_hash_pointers" I get the following. Does it helps ?
>
> [   16.837198] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   16.848521] BUG: KFENCE: invalid read in finish_task_switch.isra.0+0x5=
4/0x23c
> [   16.848521]
> [   16.857158] Invalid read at 0xdf98800a:
> [   16.861004]  finish_task_switch.isra.0+0x54/0x23c
> [   16.865731]  kunit_try_run_case+0x5c/0xd0
> [   16.869780]  kunit_generic_run_threadfn_adapter+0x24/0x30
> [   16.875199]  kthread+0x15c/0x174
> [   16.878460]  ret_from_kernel_thread+0x14/0x1c
> [   16.882847]
> [   16.884351] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B
> 5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty #4674
> [   16.895908] NIP:  c016eb8c LR: c02f50dc CTR: c016eb38
> [   16.900963] REGS: e2449d90 TRAP: 0301   Tainted: G    B
> (5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty)
> [   16.911386] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 22000004  XER: 000000=
00
> [   16.918153] DAR: df98800a DSISR: 20000000
> [   16.918153] GPR00: c02f50dc e2449e50 c1140d00 e100dd24 c084b13c 000000=
08 c084b32b c016eb38
> [   16.918153] GPR08: c0850000 df988000 c0d10000 e2449eb0 22000288
> [   16.936695] NIP [c016eb8c] test_invalid_access+0x54/0x108
> [   16.942125] LR [c02f50dc] kunit_try_run_case+0x5c/0xd0
> [   16.947292] Call Trace:
> [   16.949746] [e2449e50] [c005a5ec] finish_task_switch.isra.0+0x54/0x23c=
 (unreliable)

The "(unreliable)" might be a clue that it's related to ppc32 stack
unwinding. Any ppc expert know what this is about?

> [   16.957443] [e2449eb0] [c02f50dc] kunit_try_run_case+0x5c/0xd0
> [   16.963319] [e2449ed0] [c02f63ec] kunit_generic_run_threadfn_adapter+0=
x24/0x30
> [   16.970574] [e2449ef0] [c004e710] kthread+0x15c/0x174
> [   16.975670] [e2449f30] [c001317c] ret_from_kernel_thread+0x14/0x1c
> [   16.981896] Instruction dump:
> [   16.984879] 8129d608 38e7eb38 81020280 911f004c 39000000 995f0024 907f=
0028 90ff001c
> [   16.992710] 3949000a 915f0020 3d40c0d1 3d00c085 <8929000a> 3908adb0 81=
2a4b98 3d40c02f
> [   17.000711] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   17.008223]     # test_invalid_access: EXPECTATION FAILED at mm/kfence=
/kfence_test.c:636
> [   17.008223]     Expected report_matches(&expect) to be true, but is fa=
lse
> [   17.023243]     not ok 21 - test_invalid_access

On a fault in test_invalid_access, KFENCE prints the stack trace based
on the information in pt_regs. So we do not think there's anything we
can do to improve stack printing pe-se.

What's confusing is that it's only this test, and none of the others.
Given that, it might be code-gen related, which results in some subtle
issue with stack unwinding. There are a few things to try, if you feel
like it:

-- Change the unwinder, if it's possible for ppc32.

-- Add code to test_invalid_access(), to get the compiler to emit
different code. E.g. add a bunch (unnecessary) function calls, or add
barriers, etc.

-- Play with compiler options. We already pass
-fno-optimize-sibling-calls for kfence_test.o to avoid tail-call
optimizations that'd hide stack trace entries. But perhaps there's
something ppc-specific we missed?

Well, the good thing is that KFENCE detects the bad access just fine.
Since, according to the test, everything works from KFENCE's side, I'd
be happy to give my Ack:

  Acked-by: Marco Elver <elver@google.com>

Thanks,
-- Marco
