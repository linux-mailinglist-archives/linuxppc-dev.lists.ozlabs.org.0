Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C1D1A19DE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 04:17:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xnwf67HYzDqyl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 12:17:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ilcvsgBo; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xnrY6gCszDr3b
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 12:13:49 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id z5so5295108oth.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 19:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yFifMASGYyteq1krrqxodTI7Tn1b9P9OoSNG9y9YE5E=;
 b=ilcvsgBoGAzxXlAUXc7Czm/EM7BRjKum5U/o2vYZyk9fZo5QKmBfrlJySNwTXMpgNA
 cFKS03NcA80qnmI1jxvrfir6c8Lc/KEXjqU+322N9qwvTANah5/ZassKXx3TrFgTpcUE
 GAM+wNbfqFNkXs1y/ELgfBSzv7ZeM4hi2LJY3tpB0OlVi1dYLIB3EJRYef9fGyyz7Cgh
 nGJZBSDkBn1suUKae/UPi/uW/FbirgPpypUmrd18w6MqIWZmJnALGjxhsUN4rEo9Qoyz
 K9V4BWyG5xdC4s7+6PEuCvoAPhbKkYO00Flbv3huO4TFPMilnk5a8l2D51sboquuLuwT
 A3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yFifMASGYyteq1krrqxodTI7Tn1b9P9OoSNG9y9YE5E=;
 b=Dm2TcCjoqYSnkOIRanHZq9NcMhydptDd4aXl1fE5oBP5R6KXdkJPMcWxZPQB/UZrYA
 Is8zRUl5VOqH7aqiMQ/sZmibyVfiMxDpfSJiUT6/4NGTRyaR6yEjwKL6uQZ1LMaxrJQ8
 0/jM613FV4yPsMOZzPqHr+qnulqPh9sdUn/Kz3BhFjhsr7ozSOz03DuuBaWQ02FY2IJ1
 BN/MixrU2bnDjES82Y0eXdgibl4IDtjHddpoPQxUJoM/m+VB9EWnBGQ4fVTDrZMlbBLy
 BMEYoJ4I8a5FnraPehS3uRWQdhIR1MWXLqCVgPxCFG74IRrOY0AQyf7bmspMUmTJd8SR
 Jtlw==
X-Gm-Message-State: AGi0PuaDxIGlEmc0XlPetnrsdq8ywsBI6t3Dzs3MSzrfKGICfVwLGgo5
 f9d6A5H/6rahnLtbtakptBuEXxwG5yTV9p1zOnM=
X-Google-Smtp-Source: APiQypKNFgw6f2iA6dhm2I8tgjtpkdnna3ywS/5ljNxk6MHncke1RLMcc2P6k7Guu0+in5J7prLcpgdsLGxlgkf2USU=
X-Received: by 2002:a4a:e9fc:: with SMTP id w28mr4230208ooc.98.1586312027643; 
 Tue, 07 Apr 2020 19:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-12-jniethe5@gmail.com>
 <fa3e7acbe5b691060dc4f9635031733ffc36f92b.camel@linux.ibm.com>
In-Reply-To: <fa3e7acbe5b691060dc4f9635031733ffc36f92b.camel@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 8 Apr 2020 12:13:36 +1000
Message-ID: <CACzsE9r2Mp8MMwN9=sGdtCDSWM+KY7nsv6czw4-iosRtuuJg9g@mail.gmail.com>
Subject: Re: [PATCH v5 11/21] powerpc: Define and use __get_user_instr{,
 inatomic}()
To: Balamuruhan S <bala24@linux.ibm.com>
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
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 7, 2020 at 8:48 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
>
> On Mon, 2020-04-06 at 18:09 +1000, Jordan Niethe wrote:
> > Define specific __get_user_instr() and __get_user_instr_inatomic()
> > macros for reading instructions from user space.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> >  arch/powerpc/include/asm/uaccess.h  | 5 +++++
> >  arch/powerpc/kernel/align.c         | 2 +-
> >  arch/powerpc/kernel/hw_breakpoint.c | 2 +-
> >  arch/powerpc/kernel/vecemu.c        | 2 +-
> >  4 files changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/uaccess.h
> > b/arch/powerpc/include/asm/uaccess.h
> > index 2f500debae21..c0a35e4586a5 100644
> > --- a/arch/powerpc/include/asm/uaccess.h
> > +++ b/arch/powerpc/include/asm/uaccess.h
> > @@ -105,6 +105,11 @@ static inline int __access_ok(unsigned long addr,
> > unsigned long size,
> >  #define __put_user_inatomic(x, ptr) \
> >       __put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
> >
> > +#define __get_user_instr(x, ptr) \
> > +     __get_user_nocheck((x).val, (u32 *)(ptr), sizeof(u32), true)
> > +
> > +#define __get_user_instr_inatomic(x, ptr) \
> > +     __get_user_nosleep((x).val, (u32 *)(ptr), sizeof(u32))
>
>
> should we use ppc_inst_val() ?
The __get_user() macros load a value into the given variable, so we
can not use ppc_inst_val().
>
> -- Bala
>
>
> >  extern long __put_user_bad(void);
> >
> >  /*
> > diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> > index 66a6d1de7799..65cdfd41e3a1 100644
> > --- a/arch/powerpc/kernel/align.c
> > +++ b/arch/powerpc/kernel/align.c
> > @@ -304,7 +304,7 @@ int fix_alignment(struct pt_regs *regs)
> >        */
> >       CHECK_FULL_REGS(regs);
> >
> > -     if (unlikely(__get_user(instr.val, (unsigned int __user *)regs->nip)))
> > +     if (unlikely(__get_user_instr(instr, (void __user *)regs->nip)))
> >               return -EFAULT;
> >       if ((regs->msr & MSR_LE) != (MSR_KERNEL & MSR_LE)) {
> >               /* We don't handle PPC little-endian any more... */
> > diff --git a/arch/powerpc/kernel/hw_breakpoint.c
> > b/arch/powerpc/kernel/hw_breakpoint.c
> > index 542f65ccf68b..cebab14e2788 100644
> > --- a/arch/powerpc/kernel/hw_breakpoint.c
> > +++ b/arch/powerpc/kernel/hw_breakpoint.c
> > @@ -249,7 +249,7 @@ static bool stepping_handler(struct pt_regs *regs, struct
> > perf_event *bp,
> >       struct instruction_op op;
> >       unsigned long addr = info->address;
> >
> > -     if (__get_user_inatomic(instr.val, (unsigned int *)regs->nip))
> > +     if (__get_user_instr_inatomic(instr, (void __user *)regs->nip))
> >               goto fail;
> >
> >       ret = analyse_instr(&op, regs, instr);
> > diff --git a/arch/powerpc/kernel/vecemu.c b/arch/powerpc/kernel/vecemu.c
> > index bbf536e10902..c82ede46d71b 100644
> > --- a/arch/powerpc/kernel/vecemu.c
> > +++ b/arch/powerpc/kernel/vecemu.c
> > @@ -266,7 +266,7 @@ int emulate_altivec(struct pt_regs *regs)
> >       unsigned int va, vb, vc, vd;
> >       vector128 *vrs;
> >
> > -     if (get_user(instr.val, (unsigned int __user *) regs->nip))
> > +     if (__get_user_instr(instr, (void __user *) regs->nip))
> >               return -EFAULT;
> >
> >       word = ppc_inst_val(instr);
>
