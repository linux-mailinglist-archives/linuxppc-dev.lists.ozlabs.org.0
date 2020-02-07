Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C270D154FB3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 01:22:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DGFz2WmHzDqg3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 11:22:15 +1100 (AEDT)
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
 header.s=20161025 header.b=sxvW2tM9; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DGDk5RySzDq9d
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 11:21:10 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id 77so495680oty.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 16:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QMGXO5qC6inWmE7h7X+qhbqXOJHZvv2j77GvBPdc9RQ=;
 b=sxvW2tM9o8SauTgiE61SU+SmyfeJOhbmHcV618LSY3P41d0Koqy+9cZWNK6gh8OIV0
 H2E8M+hDuiH3YtdOWFY0nyVq8DZJnakAa8tYeoCyFeuJ3Ky7/P/D/TgA73VefmPg202K
 MYmQnJWV9RqSMrqu8Am7kbq4mfOcEK9haQkhSwlY719omQlfnrRntUmqsuta/49QR05A
 ATTboMyn7kb2qSJSmbAyS+4pt864grida+BQrHhddM0Ol9JM+TT1HuVy8eZgJzuvWL5q
 eX2CrdP1fAWwT+7lSq3qe6iJUTcY6V8AniwmiQQITYY5OwmuOqNhP9Cr7VsiOr/LKdOI
 4tSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QMGXO5qC6inWmE7h7X+qhbqXOJHZvv2j77GvBPdc9RQ=;
 b=Lf/yprFyijUzHi2do0VuqfkcomoW0dLJdAbbxW5S128xl1EPtsPC8yCNnmHwBkrm3D
 c/bl3nJjzXaiccDcwRbH3aVheI20ZbxvH0Y4vp+DppLmn3c5lazHXMrx6xxA4fBhPBW0
 i4U7Yt0Asn5h3xEpjkvgZpQleln8oIHQL5SmUrS6RzCyPULpjH9yyS/eOfRmxCeWr2jr
 Xlkks6z8Da61LZCM58e/SmqWQmkINYhywELGTq5W0Q+1yl7alMVgnNuJdrXXTgZxRdKt
 IApnc+CdqqeooX3UqdZFX0F8BQyvukiW6OkkSEWpztaYrHYA8IbtPK3nWMrg9s8mypvG
 cnNA==
X-Gm-Message-State: APjAAAXMiM6kSPWBklqvbNq1Rn9mI3TGpi5QoIcFqv861csGyasBTEW0
 8zfATqzRliHsiHn0LtyPJdmNGpOkI8/qj8oQFlQ=
X-Google-Smtp-Source: APXvYqyu312qaB6/Hi/7JL26s1a9fZ0G06g5qxLV/PMBFkwXZFD6FkKHXx6dgtWri+GKsf4qm8uNvaGfhcvfdH2gW+o=
X-Received: by 2002:a05:6830:43:: with SMTP id d3mr612977otp.259.1581034868508; 
 Thu, 06 Feb 2020 16:21:08 -0800 (PST)
MIME-Version: 1.0
References: <20191126052141.28009-1-jniethe5@gmail.com>
 <20191126052141.28009-7-jniethe5@gmail.com>
 <20200110151336.GA22466@localhost.localdomain>
In-Reply-To: <20200110151336.GA22466@localhost.localdomain>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 7 Feb 2020 11:20:57 +1100
Message-ID: <CACzsE9oqP1AbW8=Vrx+Y0BTp+rtcWiLpNoCZ4sgoiXNhTpUyvg@mail.gmail.com>
Subject: Re: [PATCH 06/18] powerpc sstep: Add support for prefixed integer
 load/stores
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
Cc: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 11, 2020 at 2:13 AM Balamuruhan S <bala24@linux.ibm.com> wrote:
>
> On Tue, Nov 26, 2019 at 04:21:29PM +1100, Jordan Niethe wrote:
> > This adds emulation support for the following prefixed integer
> > load/stores:
> >   * Prefixed Load Byte and Zero (plbz)
> >   * Prefixed Load Halfword and Zero (plhz)
> >   * Prefixed Load Halfword Algebraic (plha)
> >   * Prefixed Load Word and Zero (plwz)
> >   * Prefixed Load Word Algebraic (plwa)
> >   * Prefixed Load Doubleword (pld)
> >   * Prefixed Store Byte (pstb)
> >   * Prefixed Store Halfword (psth)
> >   * Prefixed Store Word (pstw)
> >   * Prefixed Store Doubleword (pstd)
> >   * Prefixed Load Quadword (plq)
> >   * Prefixed Store Quadword (pstq)
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> >  arch/powerpc/lib/sstep.c | 110 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 110 insertions(+)
> >
> > diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> > index ade3f5eba2e5..4f5ad1f602d8 100644
> > --- a/arch/powerpc/lib/sstep.c
> > +++ b/arch/powerpc/lib/sstep.c
> > @@ -187,6 +187,43 @@ static nokprobe_inline unsigned long xform_ea(unsigned int instr,
> >       return ea;
> >  }
> >
> > +/*
> > + * Calculate effective address for a MLS:D-form / 8LS:D-form prefixed instruction
> > + */
> > +static nokprobe_inline unsigned long mlsd_8lsd_ea(unsigned int instr,
> > +                                               unsigned int sufx,
> > +                                               const struct pt_regs *regs)
> > +{
> > +     int ra, prefix_r;
> > +     unsigned int  dd;
> > +     unsigned long ea, d0, d1, d;
> > +
> > +     prefix_r = instr & (1ul << 20);
> > +     ra = (sufx >> 16) & 0x1f;
> > +
> > +     d0 = instr & 0x3ffff;
> > +     d1 = sufx & 0xffff;
> > +     d = (d0 << 16) | d1;
> > +
> > +     /*
> > +      * sign extend a 34 bit number
> > +      */
> > +     dd = (unsigned int) (d >> 2);
> > +     ea = (signed int) dd;
> > +     ea = (ea << 2) | (d & 0x3);
> > +
> > +     if (!prefix_r && ra)
> > +             ea += regs->gpr[ra];
> > +     else if (!prefix_r && !ra)
> > +             ; /* Leave ea as is */
> > +     else if (prefix_r && !ra)
> > +             ea += regs->nip;
> > +     else if (prefix_r && ra)
> > +             ; /* Invalid form. Should already be checked for by caller! */
> > +
> > +     return ea;
> > +}
> > +
> >  /*
> >   * Return the largest power of 2, not greater than sizeof(unsigned long),
> >   * such that x is a multiple of it.
> > @@ -1166,6 +1203,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
> >                 unsigned int instr, unsigned int sufx)
> >  {
> >       unsigned int opcode, ra, rb, rc, rd, spr, u;
> > +     unsigned int sufxopcode, prefixtype, prefix_r;
> >       unsigned long int imm;
> >       unsigned long int val, val2;
> >       unsigned int mb, me, sh;
> > @@ -2652,6 +2690,78 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
> >
> >       }
> >
> > +/*
> > + * Prefixed instructions
> > + */
> > +     switch (opcode) {
> > +     case 1:
> > +             prefix_r = instr & (1ul << 20);
> > +             ra = (sufx >> 16) & 0x1f;
> > +             op->update_reg = ra;
> > +             rd = (sufx >> 21) & 0x1f;
> > +             op->reg = rd;
> > +             op->val = regs->gpr[rd];
> > +
> > +             sufxopcode = sufx >> 26;
> > +             prefixtype = (instr >> 24) & 0x3;
> > +             switch (prefixtype) {
> > +             case 0: /* Type 00  Eight-Byte Load/Store */
> > +                     if (prefix_r && ra)
> > +                             break;
> > +                     op->ea = mlsd_8lsd_ea(instr, sufx, regs);
> > +                     switch (sufxopcode) {
> > +                     case 41:        /* plwa */
> > +                             op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 4);
> > +                             break;
> > +                     case 56:        /* plq */
> > +                             op->type = MKOP(LOAD, PREFIXED, 16);
> > +                             break;
> > +                     case 57:        /* pld */
> > +                             op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 8);
> > +                             break;
> > +                     case 60:        /* stq */
> > +                             op->type = MKOP(STORE, PREFIXED, 16);
> > +                             break;
> > +                     case 61:        /* pstd */
> > +                             op->type = MKOP(STORE, PREFIXED | SIGNEXT, 8);
>
> sorry, we don't do SIGNEXT for 1 byte below in Type 10, so does 8 byte is used
> conscious without definition in `do_signext()` as we don't really need to do
> anything ?
No, it was mistake. Those instructions should not have been marked as SIGNEXT.
>
> -- Bala
>
> > +                             break;
> > +                     }
> > +                     break;
> > +             case 1: /* Type 01 Modified Register-to-Register */
> > +                     break;
> > +             case 2: /* Type 10 Modified Load/Store */
> > +                     if (prefix_r && ra)
> > +                             break;
> > +                     op->ea = mlsd_8lsd_ea(instr, sufx, regs);
> > +                     switch (sufxopcode) {
> > +                     case 32:        /* plwz */
> > +                             op->type = MKOP(LOAD, PREFIXED, 4);
> > +                             break;
> > +                     case 34:        /* plbz */
> > +                             op->type = MKOP(LOAD, PREFIXED, 1);
> > +                             break;
> > +                     case 36:        /* pstw */
> > +                             op->type = MKOP(STORE, PREFIXED, 4);
> > +                             break;
> > +                     case 38:        /* pstb */
> > +                             op->type = MKOP(STORE, PREFIXED, 1);
> > +                             break;
> > +                     case 40:        /* plhz */
> > +                             op->type = MKOP(LOAD, PREFIXED, 2);
> > +                             break;
> > +                     case 42:        /* plha */
> > +                             op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 2);
> > +                             break;
> > +                     case 44:        /* psth */
> > +                             op->type = MKOP(STORE, PREFIXED, 2);
> > +                             break;
> > +                     }
> > +                     break;
> > +             case 3: /* Type 11 Modified Register-to-Register */
> > +                     break;
> > +             }
> > +     }
> > +
> >  #ifdef CONFIG_VSX
> >       if ((GETTYPE(op->type) == LOAD_VSX ||
> >            GETTYPE(op->type) == STORE_VSX) &&
> > --
> > 2.20.1
> >
>
