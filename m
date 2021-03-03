Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A84032B6F7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 11:57:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dr9tx3KkSz3cXc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 21:57:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Tjv/CcZK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Tjv/CcZK; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dr9tT5v6lz30L4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 21:57:02 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id f3so25443012oiw.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Mar 2021 02:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UPxFORIZP1nytPQ278lCW6pZ3qqzRO3EFrmchGypUQ0=;
 b=Tjv/CcZKbo5/n2lLxD/b7NzvhPhAX05xsjCLpS31GqS+XQLYessKmyyuE2HAOpYOrA
 FKmXprWaFzZHhoqr2MTUIXK4OFWgXXZn2CdeYhh9BCYnCxnZgeY+C59++BTv/WOZ+k6s
 Adao2bWPDfrrl9Dee8ZclPGYTF7Q+Nl7Lye/DAmvvoNl+bTobg2sxTkFDFaNG59ZnZGx
 CgJUjRdydEDm3wEqbx60IBJygbe1Sinz6OoayzJ5P3L+/yLYzajJrNGHOBW+6TpenFF7
 WmA8QNFvXHkEcPTsW4szj3mO6N5pbi2ygk2PAubFe+JAGzbFUj9e8+44JyUee2/gnnul
 ulfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UPxFORIZP1nytPQ278lCW6pZ3qqzRO3EFrmchGypUQ0=;
 b=NW/oo871gxTtHpaEMguZwAOJGubH1EP8RU9BjFHz/HJ8ZS8dvYpJfrwozjVutrO3pg
 QpI5oMHozNuy3NWOlBURleUGxMQKpUItJ/fhqK8XcDrd3HtQ2Q/zQEicTiQyjvMoIPa7
 f/xnoWusmlP/31MCGJ2F90T7qkem5m0oc14cf/av+xO4wfODe7IslPax0/FPBy9qMogv
 8Kq3QoFCo23Sw5flQBKMSbFJcoc5rTGeMLNPKl5dmuYGDYRIWJLihbHryDUBwUJsyJxl
 AMjA9Kh+kVaznsEFSTlCijo3zR3zOiFeUA887ikDD9p+mRImE8GMtcSIPcw9RMs9Ab4g
 y5+Q==
X-Gm-Message-State: AOAM530+IC76qmk88vkCScg8ayfobUAzFpspLMWuRERjZ6u06yBSsiDv
 hcqY8cWmsufhcdE7njUF8hM2PpbJanTnF9wI6LP4GA==
X-Google-Smtp-Source: ABdhPJwc+m0Ud2CDSn0I98DxAecLu4vmXS0Hi5CGqRp2ooOp1wNviqaV8AFMAakRRcA0FhxII40WCgVEnHuSoOlmNbk=
X-Received: by 2002:aca:d515:: with SMTP id m21mr6892572oig.172.1614769020623; 
 Wed, 03 Mar 2021 02:57:00 -0800 (PST)
MIME-Version: 1.0
References: <51c397a23631d8bb2e2a6515c63440d88bf74afd.1614674144.git.christophe.leroy@csgroup.eu>
 <CANpmjNPOJfL_qsSZYRbwMUrxnXxtF5L3k9hursZZ7k9H1jLEuA@mail.gmail.com>
 <b9dc8d35-a3b0-261a-b1a4-5f4d33406095@csgroup.eu>
 <CAG_fn=WFffkVzqC9b6pyNuweFhFswZfa8RRio2nL9-Wq10nBbw@mail.gmail.com>
 <f806de26-daf9-9317-fdaa-a0f7a32d8fe0@csgroup.eu>
 <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
 <08a96c5d-4ae7-03b4-208f-956226dee6bb@csgroup.eu>
 <CANpmjNPYEmLtQEu5G=zJLUzOBaGoqNKwLyipDCxvytdKDKb7mg@mail.gmail.com>
 <ad61cb3a-2b4a-3754-5761-832a1dd0c34e@csgroup.eu>
In-Reply-To: <ad61cb3a-2b4a-3754-5761-832a1dd0c34e@csgroup.eu>
From: Marco Elver <elver@google.com>
Date: Wed, 3 Mar 2021 11:56:49 +0100
Message-ID: <CANpmjNOnVzei7frKcMzMHxaDXh5NvTA-Wpa29C2YC1GUxyKfhQ@mail.gmail.com>
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

On Wed, 3 Mar 2021 at 11:39, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 02/03/2021 =C3=A0 12:39, Marco Elver a =C3=A9crit :
> > On Tue, 2 Mar 2021 at 12:21, Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> > [...]
> >>>> Booting with 'no_hash_pointers" I get the following. Does it helps ?
> >>>>
> >>>> [   16.837198] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>> [   16.848521] BUG: KFENCE: invalid read in finish_task_switch.isra.=
0+0x54/0x23c
> >>>> [   16.848521]
> >>>> [   16.857158] Invalid read at 0xdf98800a:
> >>>> [   16.861004]  finish_task_switch.isra.0+0x54/0x23c
> >>>> [   16.865731]  kunit_try_run_case+0x5c/0xd0
> >>>> [   16.869780]  kunit_generic_run_threadfn_adapter+0x24/0x30
> >>>> [   16.875199]  kthread+0x15c/0x174
> >>>> [   16.878460]  ret_from_kernel_thread+0x14/0x1c
> >>>> [   16.882847]
> >>>> [   16.884351] CPU: 0 PID: 111 Comm: kunit_try_catch Tainted: G    B
> >>>> 5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty #4674
> >>>> [   16.895908] NIP:  c016eb8c LR: c02f50dc CTR: c016eb38
> >>>> [   16.900963] REGS: e2449d90 TRAP: 0301   Tainted: G    B
> >>>> (5.12.0-rc1-s3k-dev-01534-g4f14ae75edf0-dirty)
> >>>> [   16.911386] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 22000004  XER: 0=
0000000
> >>>> [   16.918153] DAR: df98800a DSISR: 20000000
> >>>> [   16.918153] GPR00: c02f50dc e2449e50 c1140d00 e100dd24 c084b13c 0=
0000008 c084b32b c016eb38
> >>>> [   16.918153] GPR08: c0850000 df988000 c0d10000 e2449eb0 22000288
> >>>> [   16.936695] NIP [c016eb8c] test_invalid_access+0x54/0x108
> >>>> [   16.942125] LR [c02f50dc] kunit_try_run_case+0x5c/0xd0
> >>>> [   16.947292] Call Trace:
> >>>> [   16.949746] [e2449e50] [c005a5ec] finish_task_switch.isra.0+0x54/=
0x23c (unreliable)
> >>>
> >>> The "(unreliable)" might be a clue that it's related to ppc32 stack
> >>> unwinding. Any ppc expert know what this is about?
> >>>
> >>>> [   16.957443] [e2449eb0] [c02f50dc] kunit_try_run_case+0x5c/0xd0
> >>>> [   16.963319] [e2449ed0] [c02f63ec] kunit_generic_run_threadfn_adap=
ter+0x24/0x30
> >>>> [   16.970574] [e2449ef0] [c004e710] kthread+0x15c/0x174
> >>>> [   16.975670] [e2449f30] [c001317c] ret_from_kernel_thread+0x14/0x1=
c
> >>>> [   16.981896] Instruction dump:
> >>>> [   16.984879] 8129d608 38e7eb38 81020280 911f004c 39000000 995f0024=
 907f0028 90ff001c
> >>>> [   16.992710] 3949000a 915f0020 3d40c0d1 3d00c085 <8929000a> 3908ad=
b0 812a4b98 3d40c02f
> >>>> [   17.000711] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>> [   17.008223]     # test_invalid_access: EXPECTATION FAILED at mm/k=
fence/kfence_test.c:636
> >>>> [   17.008223]     Expected report_matches(&expect) to be true, but =
is false
> >>>> [   17.023243]     not ok 21 - test_invalid_access
> >>>
> >>> On a fault in test_invalid_access, KFENCE prints the stack trace base=
d
> >>> on the information in pt_regs. So we do not think there's anything we
> >>> can do to improve stack printing pe-se.
> >>
> >> stack printing, probably not. Would be good anyway to mark the last le=
vel [unreliable] as the ppc does.
> >
> > We use stack_trace_save_regs() + stack_trace_print().
> >
> >> IIUC, on ppc the address in the stack frame of the caller is written b=
y the caller. In most tests,
> >> there is some function call being done before the fault, for instance
> >> test_kmalloc_aligned_oob_read() does a call to kunit_do_assertion whic=
h populates the address of the
> >> call in the stack. However this is fragile.
> >
> > Interesting, this might explain it.
> >
> >> This works for function calls because in order to call a subfunction, =
a function has to set up a
> >> stack frame in order to same the value in the Link Register, which con=
tains the address of the
> >> function's parent and that will be clobbered by the sub-function call.
> >>
> >> However, it cannot be done by exceptions, because exceptions can happe=
n in a function that has no
> >> stack frame (because that function has no need to call a subfunction a=
nd doesn't need to same
> >> anything on the stack). If the exception handler was writting the call=
er's address in the stack
> >> frame, it would in fact write it in the parent's frame, leading to a m=
ess.
> >>
> >> But in fact the information is in pt_regs, it is in regs->nip so KFENC=
E should be able to use that
> >> instead of the stack.
> >
> > Perhaps stack_trace_save_regs() needs fixing for ppc32? Although that
> > seems to use arch_stack_walk().
> >
> >>> What's confusing is that it's only this test, and none of the others.
> >>> Given that, it might be code-gen related, which results in some subtl=
e
> >>> issue with stack unwinding. There are a few things to try, if you fee=
l
> >>> like it:
> >>>
> >>> -- Change the unwinder, if it's possible for ppc32.
> >>
> >> I don't think it is possible.
> >>
> >>>
> >>> -- Add code to test_invalid_access(), to get the compiler to emit
> >>> different code. E.g. add a bunch (unnecessary) function calls, or add
> >>> barriers, etc.
> >>
> >> The following does the trick
> >>
> >> diff --git a/mm/kfence/kfence_test.c b/mm/kfence/kfence_test.c
> >> index 4acf4251ee04..22550676cd1f 100644
> >> --- a/mm/kfence/kfence_test.c
> >> +++ b/mm/kfence/kfence_test.c
> >> @@ -631,8 +631,11 @@ static void test_invalid_access(struct kunit *tes=
t)
> >>                  .addr =3D &__kfence_pool[10],
> >>                  .is_write =3D false,
> >>          };
> >> +       char *buf;
> >>
> >> +       buf =3D test_alloc(test, 4, GFP_KERNEL, ALLOCATE_RIGHT);
> >>          READ_ONCE(__kfence_pool[10]);
> >> +       test_free(buf);
> >>          KUNIT_EXPECT_TRUE(test, report_matches(&expect));
> >>    }
> >>
> >>
> >> But as I said above, this is fragile. If for some reason one day test_=
alloc() gets inlined, it may
> >> not work anymore.
> >
> > Yeah, obviously that's hack, but interesting nevertheless.
> >
> > Based on what you say above, however, it seems that
> > stack_trace_save_regs()/arch_stack_walk() don't exactly do what they
> > should? Can they be fixed for ppc32?
>
> Can we really consider they don't do what they should ?
>
> I have the feeling that excepting entry[0] of the stack trace to match th=
e instruction pointer is
> not a valid expectation. That's probably correct on architectures that al=
ways have a stack frame for
> any function, but for powerpc who can have frameless functions, we can't =
expect that I think.
>
> I have proposed a change to KFENCE in another response to this mail threa=
d, could it be the solution ?

You're going to have to change all users of stack_trace_print/save
across the kernel, because the assumption is that the current frame is
included.

It is just bad design if we add special code to all users of the
<linux/stacktrace.h> API just so we can print the current frame at the
top of the trace. Therefore, I'm afraid your proposed patch to KFENCE
is not acceptable.

Instead, we have to either extend the <linux/stacktrace.h> API, or
simply accept that all current users of the API expect the current
frame to be included. If you do not want to include the current frame,
that API even provides a way to skip it already (just pass +1 as
skipnr).

<linux/stacktrace.h> writes this about arch_stack_walk():

   * task         NULL    Stack trace from task (can be current)
   * current      regs    Stack trace starting on regs->stackpointer

This is a bit vague, and unfortunately seems outdated, but I'd assume
that when it says "Stack trace from task" would be the stack trace
including the current function (at IP) being executed.

Somewhat tangentially, I also note that e.g. show_regs(regs) (which
was printed along the KFENCE report above) didn't include the top
frame in the "Call Trace", so this assumption is definitely not
isolated to KFENCE.

Thanks,
-- Marco
