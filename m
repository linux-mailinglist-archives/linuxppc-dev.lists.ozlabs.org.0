Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D82F273969
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 05:54:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwS9M4cwBzDqyn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 13:54:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LUOZvtyY; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwS7c6Y03zDqq5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 13:52:41 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id v20so19561808oiv.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 20:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ToM+kALjifaR31Wiy19sKnzA5cwERMurYOGT9ZOtdY=;
 b=LUOZvtyYMQ2U4bfJborKaGgbqHtN0bms2STeHA3mR3P+mWFvNURoJLaDBpMMqAWx1m
 LPciZl6q7My2NZ6mBUDPWqUTsnD5JbuTG854q+yMH4U+Le2AWEB5bj1nag04k0iWBUaz
 LmHgTKZY7OsoKNTSUHhaD5a7d3AUxbiXTXmKbzNFufWGWegVTibqZMR8NXN2KgYxJVQV
 Y1J74WOuBo2s77BW94+NjT1J5qthjvF0RMxTlG7sMQDl6zGeJr4/n5ojYRNSXSB95Y9v
 aAMyCuKjaKilPSKVtYJe22PqyZEWbygRnR9MyU+QS/GuWM/z3ZPAjWPTzxMLZcijNCtO
 gAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ToM+kALjifaR31Wiy19sKnzA5cwERMurYOGT9ZOtdY=;
 b=mekjbqY0I7DsoKzvV1b/LYikgQ+jrVKYBNCibsEA3iL2KZQc2jpQkYgxBJqLh7YS1l
 NU2e1thMmBBdCeAFncNVQgo/KqwCKcNJPy13dHnf33L3lVdVoh0HWxZnWbZ/v11AKnCo
 qoAtIcn/62ftMlxKq9GaeTIIKQR2i8qWD+BYgiPsfS8eE/Y7FbnFkJEJRfiQX/5HYO4o
 ZPNUz0ilSuR2ju/HAZ5y819yG6vo9CEJmBhZiDItUt8EuC9qzwHgHWmS72sUUtvXBTrK
 ld8uoBnbu+C9abGLSQb9NYiDZqTOsgfHv4IjVu1S3DwRQlv3VMehjQUnF0oNxT8gUU79
 gPGQ==
X-Gm-Message-State: AOAM531PWD2jU8h6RZatT6ofko8rF9K29mWeEUYq2UplpA6gHVxh+ijb
 PI15b8MvZa3j5W2DcZFhsNUmzjQLkrT47IAE4lw=
X-Google-Smtp-Source: ABdhPJzG5I4S7pJRBXZmF8vBOhV3MMw+OApqPCmDtc4bckiWS416Gr/gAD2igx/Gq78r6Y9xaGD5r4b4UC0WcMgGLIs=
X-Received: by 2002:aca:c44b:: with SMTP id u72mr1586217oif.12.1600746758515; 
 Mon, 21 Sep 2020 20:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200917091716.4631-1-jniethe5@gmail.com>
 <877dsro8iy.fsf@mpe.ellerman.id.au>
In-Reply-To: <877dsro8iy.fsf@mpe.ellerman.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 22 Sep 2020 13:52:27 +1000
Message-ID: <CACzsE9oMiMm8pQKPhHoKy8XUTAJryeB0T=7y7SOGrB9p656sOA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc/64: Set up a kernel stack for secondaries
 before cpu_restore()
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 18, 2020 at 5:21 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Hi Jordan,
>
> Jordan Niethe <jniethe5@gmail.com> writes:
> > Currently in generic_secondary_smp_init(), cur_cpu_spec->cpu_restore()
> > is called before a stack has been set up in r1. This was previously fine
> > as the cpu_restore() functions were implemented in assembly and did not
> > use a stack. However commit 5a61ef74f269 ("powerpc/64s: Support new
> > device tree binding for discovering CPU features") used
> > __restore_cpu_cpufeatures() as the cpu_restore() function for a
> > device-tree features based cputable entry. This is a C function and
> > hence uses a stack in r1.
> >
> > generic_secondary_smp_init() is entered on the secondary cpus via the
> > primary cpu using the OPAL call opal_start_cpu(). In OPAL, each hardware
> > thread has its own stack. The OPAL call is ran in the primary's hardware
> > thread. During the call, a job is scheduled on a secondary cpu that will
> > start executing at the address of generic_secondary_smp_init().  Hence
> > the value that will be left in r1 when the secondary cpu enters the
> > kernel is part of that secondary cpu's individual OPAL stack. This means
> > that __restore_cpu_cpufeatures() will write to that OPAL stack. This is
> > not horribly bad as each hardware thread has its own stack and the call
> > that enters the kernel from OPAL never returns, but it is still wrong
> > and should be corrected.
> >
> > Create the temp kernel stack before calling cpu_restore().
> >
> > Fixes: 5a61ef74f269 ("powerpc/64s: Support new device tree binding for discovering CPU features")
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v2: Add more detail to the commit message
> > ---
> >  arch/powerpc/kernel/head_64.S | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> Unfortunately this breaks booting via kexec.
>
> In that case the secondaries come in to 0x60 and spin until they're
> released by smp_release_cpus(), which is before emergency_stack_init()
> has run. That means they pick up a bad r1 value and crash/get stuck.
>
> I'm not sure what the best solution is.
Would it be simplest to just call smp_release_cpus() after setting up the stack?
>
> I've thought in the past that it would be nicer if the CPU setup didn't
> run until the secondary is told to start (via PACAPROCSTART), ie. more
> the CPU setup call below there.
>
> But that opens the possibility that we run threads with different
> settings of some SPRs until SMP bringup, and if the user has said not to
> start secondaries then possibly for ever. And I haven't though hard
> enough about whether that's actually problematic (running with different
> SPR values).
>
> cheers
>
>
> > diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
> > index 0e05a9a47a4b..4b7f4c6c2600 100644
> > --- a/arch/powerpc/kernel/head_64.S
> > +++ b/arch/powerpc/kernel/head_64.S
> > @@ -420,6 +420,10 @@ generic_secondary_common_init:
> >       /* From now on, r24 is expected to be logical cpuid */
> >       mr      r24,r5
> >
> > +     /* Create a temp kernel stack for use before relocation is on.  */
> > +     ld      r1,PACAEMERGSP(r13)
> > +     subi    r1,r1,STACK_FRAME_OVERHEAD
> > +
> >       /* See if we need to call a cpu state restore handler */
> >       LOAD_REG_ADDR(r23, cur_cpu_spec)
> >       ld      r23,0(r23)
> > @@ -448,10 +452,6 @@ generic_secondary_common_init:
> >       sync                            /* order paca.run and cur_cpu_spec */
> >       isync                           /* In case code patching happened */
> >
> > -     /* Create a temp kernel stack for use before relocation is on.  */
> > -     ld      r1,PACAEMERGSP(r13)
> > -     subi    r1,r1,STACK_FRAME_OVERHEAD
> > -
> >       b       __secondary_start
> >  #endif /* SMP */
> >
> > --
> > 2.17.1
