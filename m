Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E043154FB0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 01:20:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DGCq08MfzDqdW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 11:20:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aA34Zxdr; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DGBP6TCtzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 11:19:09 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id q84so328675oic.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 16:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MuLfzJ87RWYlfa0wNjNyoqBQv/NxlxW2txjcsHaBu44=;
 b=aA34Zxdr+SM+8AiwAMHihF95g1LMrNsnDeR24CspOLdKohg8sGmfXgYIpbTmNElKG5
 NcSfxLOVKbv4uCowpqBM1s3HIBaSfnfvudTcqRuZ9zzsGiC4LvYI0ZdN4b4Cgdyjkakv
 1UCgp2slJn3A2+aAefz5KbeQk4/xcbDxXvCrPkaiMHTT50c8UG0x3YwLVyaWOLhEdrBa
 rkC68bCrqplL6CYVBt1CDt0jWqww5S3Smvnr866RCOn3QGNpo1cBNMYQPuCcKIZOcyNe
 sG9AnJMWm7gZSDmwepBpgHnxYTyn7F+FLkFvhoJ+bWF7XK8QRd7UWi9yDzG5vMCFJt2B
 dV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MuLfzJ87RWYlfa0wNjNyoqBQv/NxlxW2txjcsHaBu44=;
 b=O/cMlW3wbYgHpHnoQRHExGQJb794RA/1I28D9CU7sj7T1m0pFF4KFaCqjh047l1klj
 lPsOKSPPmFlpQddV6nbC77zNHnJcEDlq++CthUb8zVzngKbFAFwbkMZmVmW3+JRwgWFw
 fx3R9AzvVJ+kHDg6iBPqo1uNRg3D6SsnyUSIJlww7O4TQ4RNkvF+KItfRnilcJtHSfAI
 u2g4FtnPxok6e+MhJJTmTmFMWW9NIw2sZaBzoIHng+HUjUmOLEBYk5AtCYD8i3Ye0TrX
 wXfdcQpTw6RvJnAuDuFga/qqf5hZyZo6QL0yyMQqulHVpdWI8ymkZMC8KRdxtSe+DCbx
 wixQ==
X-Gm-Message-State: APjAAAWVL3rStn2FUg1sFhC36LtugSjxRqi3D2AoeAD2aHco/lYgCt2m
 BFnABwwZ+FzZh3XfFDjAjmJyffx9wKNtdCRb6CZI5peE
X-Google-Smtp-Source: APXvYqz9O1eTp0TryzNQxwe1ewk2GKCTW+UqCk1Gx2scELJVEzW2rmSlG0rwmrXUKh3gM0gYUexKb8oWT7Fnct8Ixcc=
X-Received: by 2002:aca:d903:: with SMTP id q3mr324567oig.12.1581034744785;
 Thu, 06 Feb 2020 16:19:04 -0800 (PST)
MIME-Version: 1.0
References: <20191126052141.28009-1-jniethe5@gmail.com>
 <20191126052141.28009-7-jniethe5@gmail.com>
 <20200110103849.GA18460@dhcp-9-109-246-161.in.ibm.com>
In-Reply-To: <20200110103849.GA18460@dhcp-9-109-246-161.in.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 7 Feb 2020 11:18:53 +1100
Message-ID: <CACzsE9pC8da63H9Y__ApLUzYWv4oKHnU=3-hVfeBksy=47dHjw@mail.gmail.com>
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

On Fri, Jan 10, 2020 at 9:38 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
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
> For 8 byte and and 1 byte (mentioned below for Type 10 instructions), we
> do not have their respective definitions in `do_signext()`, I am not
> sure whether it is typo/miss.

This was a mistake. pstd/pld should not have been flagged with SIGNEXT.
There still are only algebraic loads for word and halfword lengths so
do_signext()
is fine.

>
> > +                             break;
> > +                     }
> > +                     break;
> > +             case 1: /* Type 01 Modified Register-to-Register */
>
> Type 01 would be Eight-Byte Register-to-Register.
Thanks, you are right.
>
> -- Bala
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
