Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B125432B6C5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 11:39:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dr9VY3ynsz3d3k
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 21:39:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=YAoB3Pva;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=YAoB3Pva; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dr9Tx5SnVz3d3g
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 21:39:16 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id z126so25420697oiz.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Mar 2021 02:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oa11Uxo3wLTqZSkd+I1gIQsAxvPirjDmAcK7uIr/Uf0=;
 b=YAoB3PvaBP3P1D8xkeIjf9DM8bRWy5EmYc3zBHHPy1n7S575+Au8Kd1DdAjFDmOzTs
 ESDSZSgVR9HoONXkg/CwX0mixSYzHSDbsLgUpt7jSthAV3SIbdoccx8Ssuh6vxtuQ7Qa
 l/1ZoY5V6daCF6Adu7bLFXfG+iwknwgdIqTPTDMlWX7OpOVU33qnnVg33JbzdHYQp3mL
 +Vfquof9wUXWTCrheOjnMlYMvDbTft/UDiNB7cUiqdQe6FelCGbPVJx25OjNw8xrMZoc
 wMaOCFbJwfIplKKfwQEpxMHYBV8vCnsvFJ+5d/LbjzRsCMaerocRgDSDEwpVJhXz72om
 75ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oa11Uxo3wLTqZSkd+I1gIQsAxvPirjDmAcK7uIr/Uf0=;
 b=JeTJmpJzAeRZwbOjjqUux+F+6pYoiB0NeRtXsByYEDHCc7QP7XzWEwww5vrXGmSRJe
 TxB5Ky7u0NGkz7z7K5YylFqMiIl4UADTZ9SbP5bThC1rCyEMhb8UqDM8VdaKBfwOa+MW
 nMF1niEltbuTTWc8eWr3bVIYOJl+dnRP62YcTu8vFS7YpkQqxo7b/Rw6ZFl0HBHgB26z
 XR9PAivySGOt5bCDhx6XKO3nkoxzAY0cijuu1PmwoFyolTxp9FH6+bYIv4JiuGxdBWxY
 QhxaABtQHT318pxbNFLvp5JF/hfeb3rRIFLZ6yFx15VttONpZ36t8szGYkSxhBb6uoTE
 pjdg==
X-Gm-Message-State: AOAM532RwgCumE7+HKs/h2CmUlt/pByyflvWcMoFlgAWlB+Duai+cJmt
 N9PV8s7awZhWaBtjoPfwyvLH8VWVgyJVPovsQ7t8Rg==
X-Google-Smtp-Source: ABdhPJx/7vHBoc7DV6AfgsdcwGEpySLrZUZXVvV18hhdp+y4JR37EnV2ymDjvA1KmYFphz/be0SP5BP/6pm5E2L6aQw=
X-Received: by 2002:a05:6808:10d3:: with SMTP id
 s19mr6860226ois.70.1614767954014; 
 Wed, 03 Mar 2021 02:39:14 -0800 (PST)
MIME-Version: 1.0
References: <51c397a23631d8bb2e2a6515c63440d88bf74afd.1614674144.git.christophe.leroy@csgroup.eu>
 <CANpmjNPOJfL_qsSZYRbwMUrxnXxtF5L3k9hursZZ7k9H1jLEuA@mail.gmail.com>
 <b9dc8d35-a3b0-261a-b1a4-5f4d33406095@csgroup.eu>
 <CAG_fn=WFffkVzqC9b6pyNuweFhFswZfa8RRio2nL9-Wq10nBbw@mail.gmail.com>
 <f806de26-daf9-9317-fdaa-a0f7a32d8fe0@csgroup.eu>
 <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
 <3abbe4c9-16ad-c168-a90f-087978ccd8f7@csgroup.eu>
In-Reply-To: <3abbe4c9-16ad-c168-a90f-087978ccd8f7@csgroup.eu>
From: Marco Elver <elver@google.com>
Date: Wed, 3 Mar 2021 11:39:02 +0100
Message-ID: <CANpmjNMKEObjf=WyfDQB5vPmR5RuyUMBJyfr6P2ykCd67wyMbA@mail.gmail.com>
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

On Wed, 3 Mar 2021 at 11:32, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 02/03/2021 =C3=A0 10:53, Marco Elver a =C3=A9crit :
> > On Tue, 2 Mar 2021 at 10:27, Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >> Le 02/03/2021 =C3=A0 10:21, Alexander Potapenko a =C3=A9crit :
> >>>> [   14.998426] BUG: KFENCE: invalid read in finish_task_switch.isra.=
0+0x54/0x23c
> >>>> [   14.998426]
> >>>> [   15.007061] Invalid read at 0x(ptrval):
> >>>> [   15.010906]  finish_task_switch.isra.0+0x54/0x23c
> >>>> [   15.015633]  kunit_try_run_case+0x5c/0xd0
> >>>> [   15.019682]  kunit_generic_run_threadfn_adapter+0x24/0x30
> >>>> [   15.025099]  kthread+0x15c/0x174
> >>>> [   15.028359]  ret_from_kernel_thread+0x14/0x1c
> >>>> [   15.032747]
> >>>> [   15.034251] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B
> >>>> 5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty #4674
> >>>> [   15.045811] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>> [   15.053324]     # test_invalid_access: EXPECTATION FAILED at mm/k=
fence/kfence_test.c:636
> >>>> [   15.053324]     Expected report_matches(&expect) to be true, but =
is false
> >>>> [   15.068359]     not ok 21 - test_invalid_access
> >>>
> >>> The test expects the function name to be test_invalid_access, i. e.
> >>> the first line should be "BUG: KFENCE: invalid read in
> >>> test_invalid_access".
> >>> The error reporting function unwinds the stack, skips a couple of
> >>> "uninteresting" frames
> >>> (https://elixir.bootlin.com/linux/v5.12-rc1/source/mm/kfence/report.c=
#L43)
> >>> and uses the first "interesting" one frame to print the report header
> >>> (https://elixir.bootlin.com/linux/v5.12-rc1/source/mm/kfence/report.c=
#L226).
> >>>
> >>> It's strange that test_invalid_access is missing altogether from the
> >>> stack trace - is that expected?
> >>> Can you try printing the whole stacktrace without skipping any frames
> >>> to see if that function is there?
> >>>
> >>
> >> Booting with 'no_hash_pointers" I get the following. Does it helps ?
> >>
> >> [   16.837198] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> [   16.848521] BUG: KFENCE: invalid read in finish_task_switch.isra.0+=
0x54/0x23c
> >> [   16.848521]
> >> [   16.857158] Invalid read at 0xdf98800a:
> >> [   16.861004]  finish_task_switch.isra.0+0x54/0x23c
> >> [   16.865731]  kunit_try_run_case+0x5c/0xd0
> >> [   16.869780]  kunit_generic_run_threadfn_adapter+0x24/0x30
> >> [   16.875199]  kthread+0x15c/0x174
> >> [   16.878460]  ret_from_kernel_thread+0x14/0x1c
> >> [   16.882847]
> >> [   16.884351] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B
> >> 5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty #4674
> >> [   16.895908] NIP:  c016eb8c LR: c02f50dc CTR: c016eb38
> >> [   16.900963] REGS: e2449d90 TRAP: 0301   Tainted: G    B
> >> (5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty)
> >> [   16.911386] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 22000004  XER: 000=
00000
> >> [   16.918153] DAR: df98800a DSISR: 20000000
> >> [   16.918153] GPR00: c02f50dc e2449e50 c1140d00 e100dd24 c084b13c 000=
00008 c084b32b c016eb38
> >> [   16.918153] GPR08: c0850000 df988000 c0d10000 e2449eb0 22000288
> >> [   16.936695] NIP [c016eb8c] test_invalid_access+0x54/0x108
> >> [   16.942125] LR [c02f50dc] kunit_try_run_case+0x5c/0xd0
> >> [   16.947292] Call Trace:
> >> [   16.949746] [e2449e50] [c005a5ec] finish_task_switch.isra.0+0x54/0x=
23c (unreliable)
> >
> > The "(unreliable)" might be a clue that it's related to ppc32 stack
> > unwinding. Any ppc expert know what this is about?
> >
> >> [   16.957443] [e2449eb0] [c02f50dc] kunit_try_run_case+0x5c/0xd0
> >> [   16.963319] [e2449ed0] [c02f63ec] kunit_generic_run_threadfn_adapte=
r+0x24/0x30
> >> [   16.970574] [e2449ef0] [c004e710] kthread+0x15c/0x174
> >> [   16.975670] [e2449f30] [c001317c] ret_from_kernel_thread+0x14/0x1c
> >> [   16.981896] Instruction dump:
> >> [   16.984879] 8129d608 38e7eb38 81020280 911f004c 39000000 995f0024 9=
07f0028 90ff001c
> >> [   16.992710] 3949000a 915f0020 3d40c0d1 3d00c085 <8929000a> 3908adb0=
 812a4b98 3d40c02f
> >> [   17.000711] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> [   17.008223]     # test_invalid_access: EXPECTATION FAILED at mm/kfe=
nce/kfence_test.c:636
> >> [   17.008223]     Expected report_matches(&expect) to be true, but is=
 false
> >> [   17.023243]     not ok 21 - test_invalid_access
> >
> > On a fault in test_invalid_access, KFENCE prints the stack trace based
> > on the information in pt_regs. So we do not think there's anything we
> > can do to improve stack printing pe-se.
> >
> > What's confusing is that it's only this test, and none of the others.
> > Given that, it might be code-gen related, which results in some subtle
> > issue with stack unwinding. There are a few things to try, if you feel
> > like it:
> >
> > -- Change the unwinder, if it's possible for ppc32.
> >
> > -- Add code to test_invalid_access(), to get the compiler to emit
> > different code. E.g. add a bunch (unnecessary) function calls, or add
> > barriers, etc.
> >
> > -- Play with compiler options. We already pass
> > -fno-optimize-sibling-calls for kfence_test.o to avoid tail-call
> > optimizations that'd hide stack trace entries. But perhaps there's
> > something ppc-specific we missed?
> >
> > Well, the good thing is that KFENCE detects the bad access just fine.
> > Since, according to the test, everything works from KFENCE's side, I'd
> > be happy to give my Ack:
> >
> >    Acked-by: Marco Elver <elver@google.com>
> >
>
> Thanks.
>
> For you information, I've got a pile of warnings from mm/kfence/report.o =
. Is that expected ?
>
>    CC      mm/kfence/report.o
> In file included from ./include/linux/printk.h:7,
>                   from ./include/linux/kernel.h:16,
>                   from mm/kfence/report.c:10:
> mm/kfence/report.c: In function 'kfence_report_error':
> ./include/linux/kern_levels.h:5:18: warning: format '%zd' expects argumen=
t of type 'signed size_t',
> but argument 6 has type 'ptrdiff_t' {aka 'const long int'} [-Wformat=3D]
>      5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
>        |                  ^~~~~~
> ./include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SO=
H'
>     11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
>        |                  ^~~~~~~~
> ./include/linux/printk.h:343:9: note: in expansion of macro 'KERN_ERR'
>    343 |  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>        |         ^~~~~~~~
> mm/kfence/report.c:207:3: note: in expansion of macro 'pr_err'
>    207 |   pr_err("Out-of-bounds %s at 0x%p (%luB %s of kfence-#%zd):\n",
>        |   ^~~~~~
> ./include/linux/kern_levels.h:5:18: warning: format '%zd' expects argumen=
t of type 'signed size_t',
> but argument 4 has type 'ptrdiff_t' {aka 'const long int'} [-Wformat=3D]
>      5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
>        |                  ^~~~~~
> ./include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SO=
H'
>     11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
>        |                  ^~~~~~~~
> ./include/linux/printk.h:343:9: note: in expansion of macro 'KERN_ERR'
>    343 |  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>        |         ^~~~~~~~
> mm/kfence/report.c:216:3: note: in expansion of macro 'pr_err'
>    216 |   pr_err("Use-after-free %s at 0x%p (in kfence-#%zd):\n",
>        |   ^~~~~~
> ./include/linux/kern_levels.h:5:18: warning: format '%zd' expects argumen=
t of type 'signed size_t',
> but argument 2 has type 'ptrdiff_t' {aka 'const long int'} [-Wformat=3D]
>      5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
>        |                  ^~~~~~
> ./include/linux/kern_levels.h:24:19: note: in expansion of macro 'KERN_SO=
H'
>     24 | #define KERN_CONT KERN_SOH "c"
>        |                   ^~~~~~~~
> ./include/linux/printk.h:385:9: note: in expansion of macro 'KERN_CONT'
>    385 |  printk(KERN_CONT fmt, ##__VA_ARGS__)
>        |         ^~~~~~~~~
> mm/kfence/report.c:223:3: note: in expansion of macro 'pr_cont'
>    223 |   pr_cont(" (in kfence-#%zd):\n", object_index);
>        |   ^~~~~~~
> ./include/linux/kern_levels.h:5:18: warning: format '%zd' expects argumen=
t of type 'signed size_t',
> but argument 3 has type 'ptrdiff_t' {aka 'const long int'} [-Wformat=3D]
>      5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
>        |                  ^~~~~~
> ./include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SO=
H'
>     11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
>        |                  ^~~~~~~~
> ./include/linux/printk.h:343:9: note: in expansion of macro 'KERN_ERR'
>    343 |  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>        |         ^~~~~~~~
> mm/kfence/report.c:233:3: note: in expansion of macro 'pr_err'
>    233 |   pr_err("Invalid free of 0x%p (in kfence-#%zd):\n", (void *)add=
ress,
>        |   ^~~~~~
>
> Christophe

No this is not expected. Is 'signed size_t' !=3D 'long int' on ppc32?
