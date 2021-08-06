Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E5D3E221E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 05:17:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgrJT5yMRz3dFr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 13:17:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WhJOF6lE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=sxwjean@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WhJOF6lE; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgrJ34Hplz3bWW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 13:17:23 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id h11so9874910ljo.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Aug 2021 20:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zj33fEFxiHh9L7Od2CChfLnX3PMn/v2vhh53C69leEc=;
 b=WhJOF6lEfMQ7PQ2Dm44rut4BwLCIYnh9rETAXNH5YTGCKRwlkP1XvNoa92JL0ffDms
 NiEFnBw+QmXNL8dXPXTHqiBQcfHOrsE966ffYqT5ty1kGZfzAQV4Al6p0trJzTT+kdgK
 vy4Gk11erETBeoWtOJt4AebhLFddQQiA6tSlEuRNmYfcLawEaT1izurTpwCqy/SLwVmL
 TDamTFmrotMv/2tjzYLxYi3VXu9Jz/YLxhqzObYt+JYVI+7ku7748W8nmQwrWtBgxvI4
 L28kwCjCaRgI/2Jn3wPpaBYWcxjepmUawi3xLktc/5CbJqH6EWMxmiCh3P7lixxjvB5C
 iZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zj33fEFxiHh9L7Od2CChfLnX3PMn/v2vhh53C69leEc=;
 b=EQusTWmIw0rmS5cxff515ABnWpoubvLmkKDdwRSbNGmZWANiLg27/avhDV4BQkKhNi
 8Rcxl268PQOeaTWPlFTM7KQlyeSwiXvZLH+VTQbv8/9gMP1sSzFZmtGq1CGXiibz8EXN
 ZEd6lPKijFL1CQ1hl1Q0sb5+Ad0ORHskAvox0rgj2QGizjK386cFqueiqSreUTk1h4QW
 KT7LWBg+LuTun+7LavOqomBJkiGjIWVKIWfj2nyL1jm/210msUhTJ9F/cbnakvYd1K0E
 EUNhVEv5SyfGdClioFprAKqOIvCU2dV58/jY7gXeFLO1h229BLj071qzzCuN5SFqnsEU
 mh7g==
X-Gm-Message-State: AOAM53328k9jiRDlmDKGurz0V68JNg+4izn3GLxWAihdMlK6a4OaxaFl
 ycb+IyzGL9A6RtEa1s8yemwyX3f+0pl+0iqdai4=
X-Google-Smtp-Source: ABdhPJyuuwxWUKFdUjxHxsIpU5QiCpC61h0PQQO10OgYsJ21Jq7XYltBMp1TAtD21Z5CMnGJqfLkXM41gflbVGwHShg=
X-Received: by 2002:a2e:3312:: with SMTP id d18mr5169021ljc.297.1628219839913; 
 Thu, 05 Aug 2021 20:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210726143053.532839-1-sxwjean@me.com>
 <20210726143053.532839-3-sxwjean@me.com>
 <56d9e3ce-f303-fd41-bd16-5655d9dc5e52@csgroup.eu>
In-Reply-To: <56d9e3ce-f303-fd41-bd16-5655d9dc5e52@csgroup.eu>
From: Xiongwei Song <sxwjean@gmail.com>
Date: Fri, 6 Aug 2021 11:16:53 +0800
Message-ID: <CAEVVKH95gAp-j1JM4TSSGPS1x_B2T7f9DQyryzzvZMcsKCgxWQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] powerpc: Optimize register usage for dear register
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
Cc: ravi.bangoria@linux.ibm.com, Xiongwei Song <sxwjean@me.com>,
 oleg@redhat.com, npiggin@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, efremov@linux.com,
 Paul Mackerras <paulus@samba.org>, aneesh.kumar@linux.ibm.com,
 peterx@redhat.com, PowerPC <linuxppc-dev@lists.ozlabs.org>,
 akpm@linux-foundation.org, sandipan@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 5, 2021 at 6:09 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 26/07/2021 =C3=A0 16:30, sxwjean@me.com a =C3=A9crit :
> > From: Xiongwei Song <sxwjean@gmail.com>
> >
> > Create an anonymous union for dar and dear regsiters, we can reference
> > dear to get the effective address when CONFIG_4xx=3Dy or CONFIG_BOOKE=
=3Dy.
> > Otherwise, reference dar. This makes code more clear.
>
> Same comment here as for patch 1.

Same reply for the patch 1.
Thank you.

>
>
> >
> > Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
> > ---
> >   arch/powerpc/include/asm/ptrace.h      | 5 ++++-
> >   arch/powerpc/include/uapi/asm/ptrace.h | 5 ++++-
> >   arch/powerpc/kernel/process.c          | 2 +-
> >   arch/powerpc/kernel/ptrace/ptrace.c    | 2 ++
> >   arch/powerpc/kernel/traps.c            | 5 ++++-
> >   arch/powerpc/mm/fault.c                | 2 +-
> >   6 files changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/a=
sm/ptrace.h
> > index c252d04b1206..fa725e3238c2 100644
> > --- a/arch/powerpc/include/asm/ptrace.h
> > +++ b/arch/powerpc/include/asm/ptrace.h
> > @@ -43,7 +43,10 @@ struct pt_regs
> >                       unsigned long mq;
> >   #endif
> >                       unsigned long trap;
> > -                     unsigned long dar;
> > +                     union {
> > +                             unsigned long dar;
> > +                             unsigned long dear;
> > +                     };
> >                       union {
> >                               unsigned long dsisr;
> >                               unsigned long esr;
> > diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/incl=
ude/uapi/asm/ptrace.h
> > index e357288b5f34..9ae150fb4c4b 100644
> > --- a/arch/powerpc/include/uapi/asm/ptrace.h
> > +++ b/arch/powerpc/include/uapi/asm/ptrace.h
> > @@ -52,7 +52,10 @@ struct pt_regs
> >       unsigned long trap;             /* Reason for being here */
> >       /* N.B. for critical exceptions on 4xx, the dar and dsisr
> >          fields are overloaded to hold srr0 and srr1. */
> > -     unsigned long dar;              /* Fault registers */
> > +     union {
> > +             unsigned long dar;              /* Fault registers */
> > +             unsigned long dear;
> > +     };
> >       union {
> >               unsigned long dsisr;            /* on Book-S used for DSI=
SR */
> >               unsigned long esr;              /* on 4xx/Book-E used for=
 ESR */
> > diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/proces=
s.c
> > index f74af8f9133c..50436b52c213 100644
> > --- a/arch/powerpc/kernel/process.c
> > +++ b/arch/powerpc/kernel/process.c
> > @@ -1499,7 +1499,7 @@ static void __show_regs(struct pt_regs *regs)
> >           trap =3D=3D INTERRUPT_DATA_STORAGE ||
> >           trap =3D=3D INTERRUPT_ALIGNMENT) {
> >               if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
> > -                     pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, reg=
s->esr);
> > +                     pr_cont("DEAR: "REG" ESR: "REG" ", regs->dear, re=
gs->esr);
> >               else
> >                       pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, re=
gs->dsisr);
> >       }
> > diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/=
ptrace/ptrace.c
> > index 00789ad2c4a3..969dca8b0718 100644
> > --- a/arch/powerpc/kernel/ptrace/ptrace.c
> > +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> > @@ -373,6 +373,8 @@ void __init pt_regs_check(void)
> >                    offsetof(struct user_pt_regs, trap));
> >       BUILD_BUG_ON(offsetof(struct pt_regs, dar) !=3D
> >                    offsetof(struct user_pt_regs, dar));
> > +     BUILD_BUG_ON(offsetof(struct pt_regs, dear) !=3D
> > +                  offsetof(struct user_pt_regs, dear));
> >       BUILD_BUG_ON(offsetof(struct pt_regs, dsisr) !=3D
> >                    offsetof(struct user_pt_regs, dsisr));
> >       BUILD_BUG_ON(offsetof(struct pt_regs, esr) !=3D
> > diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> > index 2164f5705a0b..0796630d3d23 100644
> > --- a/arch/powerpc/kernel/traps.c
> > +++ b/arch/powerpc/kernel/traps.c
> > @@ -1609,7 +1609,10 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
> >       }
> >   bad:
> >       if (user_mode(regs))
> > -             _exception(sig, regs, code, regs->dar);
> > +             if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
> > +                     _exception(sig, regs, code, regs->dear);
> > +             else
> > +                     _exception(sig, regs, code, regs->dar);
> >       else
> >               bad_page_fault(regs, sig);
> >   }
> > diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> > index 62953d4e7c93..3db6b39a1178 100644
> > --- a/arch/powerpc/mm/fault.c
> > +++ b/arch/powerpc/mm/fault.c
> > @@ -542,7 +542,7 @@ static __always_inline void __do_page_fault(struct =
pt_regs *regs)
> >       long err;
> >
> >       if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
> > -             err =3D ___do_page_fault(regs, regs->dar, regs->esr);
> > +             err =3D ___do_page_fault(regs, regs->dear, regs->esr);
> >       else
> >               err =3D ___do_page_fault(regs, regs->dar, regs->dsisr);
> >
> >
