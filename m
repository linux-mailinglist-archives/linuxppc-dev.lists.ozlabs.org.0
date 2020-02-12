Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B367159F61
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 04:02:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HPZw4DBVzDqKZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 14:02:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lwXd6FB3; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HPWx30kgzDq7j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 14:00:12 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id b18so495506otp.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 19:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5X+m3kvG1XHmM/N9TFA5R902kampn9FeAgeHVhQOU1c=;
 b=lwXd6FB3tMycizBUm+aIk4P/LADdXuSndPdxXxMu0RvQ6h0k2aWajZWrm+r/c3rFXO
 QQx1WY1hgXdzRGon1D7dWKVpiJ89MH3R3EottUnwyT+7USzr3QB1QR3ET+rMNlQthNZT
 8ZHxs1zv5izKFoTmiSdvCl4l/H04uY9z3/JRzzIb5t/M5dJqgji4ewO69Y8I11Sy371J
 Kg4+5HuvbA0gIktj2A/s8tbdUhil6Fk09yGLF1JnfBl35LMy8ccSJgG3YQQmSxQ/Lfn5
 wXM0xp/G/7jyPogLe5VouRnkWQl4my124l0U/Hzn5Msp5Lv3sNems/cGQ6p/aqCo6niV
 bxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5X+m3kvG1XHmM/N9TFA5R902kampn9FeAgeHVhQOU1c=;
 b=iRlv9Vc8S9DeO66kNzsBA39EhyecBoxVMb4U1+J/n+sNW3RNFR57wVH5QUaIIwsyaM
 ydp3NE14cZxo/xZ3eFRXu3awcJPwCnNNjBOPRig5co72FhsHGVeAzO9OVM80oIUQyltC
 I+6vIGk0zSBmO4ebRE7ypd9h/6L5dSH2LxSpGdNJuZnzzw9E8MWHw8FWNVvuylVyA9+o
 WcJBaTIhV42IfGh4EOLWQ6KNf3+Xqgm1J5lGMnuaGNSs6QwG/lxST1YMuAgWABWz9BQM
 xOogXxPbyGPK3b/ms4Gy4mAgXCH+XPZYRLROtj10XURjft8WeTvasJtbYoygXCXJzMBp
 5uBw==
X-Gm-Message-State: APjAAAUUw2eQNfkADdBPw0vn8q/jMV1cW3pYH3Fc6htANdb+pblBGkOs
 my1vF4S6VWMUUTA0YhlLtGh10rDrq1vYlFzE2es=
X-Google-Smtp-Source: APXvYqzQ1u0XjWIZo5XjkY8rvWmhMRTgLk5ccBGgTI+gQkW0w7+m/15lgqrG4l13dUs7NZYLzPUveLv43lbooLdLVF4=
X-Received: by 2002:a9d:aea:: with SMTP id 97mr7535560otq.51.1581476410779;
 Tue, 11 Feb 2020 19:00:10 -0800 (PST)
MIME-Version: 1.0
References: <20200211053355.21574-1-jniethe5@gmail.com>
 <20200211053355.21574-5-jniethe5@gmail.com>
 <340b5cda-49e3-854b-fc0d-4c3694dda03d@c-s.fr>
In-Reply-To: <340b5cda-49e3-854b-fc0d-4c3694dda03d@c-s.fr>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 12 Feb 2020 13:59:59 +1100
Message-ID: <CACzsE9qrez36ymaoRN8Q3szEo8d42L3pcC_x=YwQFjigi3QQKA@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] powerpc sstep: Add support for prefixed
 load/stores
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: Balamuruhan S <bala24@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 11, 2020 at 5:05 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
>
> Le 11/02/2020 =C3=A0 06:33, Jordan Niethe a =C3=A9crit :
> > This adds emulation support for the following prefixed integer
> > load/stores:
> >    * Prefixed Load Byte and Zero (plbz)
> >    * Prefixed Load Halfword and Zero (plhz)
> >    * Prefixed Load Halfword Algebraic (plha)
> >    * Prefixed Load Word and Zero (plwz)
> >    * Prefixed Load Word Algebraic (plwa)
> >    * Prefixed Load Doubleword (pld)
> >    * Prefixed Store Byte (pstb)
> >    * Prefixed Store Halfword (psth)
> >    * Prefixed Store Word (pstw)
> >    * Prefixed Store Doubleword (pstd)
> >    * Prefixed Load Quadword (plq)
> >    * Prefixed Store Quadword (pstq)
> >
> > the follow prefixed floating-point load/stores:
> >    * Prefixed Load Floating-Point Single (plfs)
> >    * Prefixed Load Floating-Point Double (plfd)
> >    * Prefixed Store Floating-Point Single (pstfs)
> >    * Prefixed Store Floating-Point Double (pstfd)
> >
> > and for the following prefixed VSX load/stores:
> >    * Prefixed Load VSX Scalar Doubleword (plxsd)
> >    * Prefixed Load VSX Scalar Single-Precision (plxssp)
> >    * Prefixed Load VSX Vector [0|1]  (plxv, plxv0, plxv1)
> >    * Prefixed Store VSX Scalar Doubleword (pstxsd)
> >    * Prefixed Store VSX Scalar Single-Precision (pstxssp)
> >    * Prefixed Store VSX Vector [0|1] (pstxv, pstxv0, pstxv1)
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v2: - Combine all load/store patches
> >      - Fix the name of Type 01 instructions
> >      - Remove sign extension flag from pstd/pld
> >      - Rename sufx -> suffix
> > ---
> >   arch/powerpc/lib/sstep.c | 165 ++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 165 insertions(+)
> >
> > diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> > index 65143ab1bf64..0e21c21ff2be 100644
> > --- a/arch/powerpc/lib/sstep.c
> > +++ b/arch/powerpc/lib/sstep.c
> > @@ -187,6 +187,44 @@ static nokprobe_inline unsigned long xform_ea(unsi=
gned int instr,
> >       return ea;
> >   }
> >
> > +/*
> > + * Calculate effective address for a MLS:D-form / 8LS:D-form
> > + * prefixed instruction
> > + */
> > +static nokprobe_inline unsigned long mlsd_8lsd_ea(unsigned int instr,
> > +                                               unsigned int suffix,
> > +                                               const struct pt_regs *r=
egs)
> > +{
> > +     int ra, prefix_r;
> > +     unsigned int  dd;
> > +     unsigned long ea, d0, d1, d;
> > +
> > +     prefix_r =3D instr & (1ul << 20);
> > +     ra =3D (suffix >> 16) & 0x1f;
> > +
> > +     d0 =3D instr & 0x3ffff;
> > +     d1 =3D suffix & 0xffff;
> > +     d =3D (d0 << 16) | d1;
> > +
> > +     /*
> > +      * sign extend a 34 bit number
> > +      */
> > +     dd =3D (unsigned int) (d >> 2);
> > +     ea =3D (signed int) dd;
> > +     ea =3D (ea << 2) | (d & 0x3);
> > +
> > +     if (!prefix_r && ra)
> > +             ea +=3D regs->gpr[ra];
> > +     else if (!prefix_r && !ra)
> > +             ; /* Leave ea as is */
> > +     else if (prefix_r && !ra)
> > +             ea +=3D regs->nip;
> > +     else if (prefix_r && ra)
> > +             ; /* Invalid form. Should already be checked for by calle=
r! */
> > +
> > +     return ea;
> > +}
> > +
> >   /*
> >    * Return the largest power of 2, not greater than sizeof(unsigned lo=
ng),
> >    * such that x is a multiple of it.
> > @@ -1166,6 +1204,7 @@ int analyse_instr(struct instruction_op *op, cons=
t struct pt_regs *regs,
> >                 unsigned int instr, unsigned int suffix)
> >   {
> >       unsigned int opcode, ra, rb, rc, rd, spr, u;
> > +     unsigned int suffixopcode, prefixtype, prefix_r;
> >       unsigned long int imm;
> >       unsigned long int val, val2;
> >       unsigned int mb, me, sh;
> > @@ -2652,6 +2691,132 @@ int analyse_instr(struct instruction_op *op, co=
nst struct pt_regs *regs,
> >
> >       }
> >
> > +/*
> > + * Prefixed instructions
> > + */
> > +     switch (opcode) {
> > +     case 1:
>
> Why not include it in the above switch () ?
I was wanting to keep all the prefixed instructions together, but you
are right, these are all load/stores so it would be clearer for them
to go in the Load and Stores switch.
>
> Should it be enclosed by #ifdef __powerpc64__, or will this new ISA also
> apply to 32 bits processors ?
No at this time it will not affect 32bit processors. I will #ifdef it.
>
> > +             prefix_r =3D instr & (1ul << 20);
> > +             ra =3D (suffix >> 16) & 0x1f;
> > +             op->update_reg =3D ra;
> > +             rd =3D (suffix >> 21) & 0x1f;
> > +             op->reg =3D rd;
> > +             op->val =3D regs->gpr[rd];
> > +
> > +             suffixopcode =3D suffix >> 26;
> > +             prefixtype =3D (instr >> 24) & 0x3;
> > +             switch (prefixtype) {
> > +             case 0: /* Type 00  Eight-Byte Load/Store */
> > +                     if (prefix_r && ra)
> > +                             break;
> > +                     op->ea =3D mlsd_8lsd_ea(instr, suffix, regs);
> > +                     switch (suffixopcode) {
> > +                     case 41:        /* plwa */
> > +                             op->type =3D MKOP(LOAD, PREFIXED | SIGNEX=
T, 4);
> > +                             break;
> > +                     case 42:        /* plxsd */
> > +                             op->reg =3D rd + 32;
> > +                             op->type =3D MKOP(LOAD_VSX, PREFIXED, 8);
> > +                             op->element_size =3D 8;
> > +                             op->vsx_flags =3D VSX_CHECK_VEC;
> > +                             break;
> > +                     case 43:        /* plxssp */
> > +                             op->reg =3D rd + 32;
> > +                             op->type =3D MKOP(LOAD_VSX, PREFIXED, 4);
> > +                             op->element_size =3D 8;
> > +                             op->vsx_flags =3D VSX_FPCONV | VSX_CHECK_=
VEC;
> > +                             break;
> > +                     case 46:        /* pstxsd */
> > +                             op->reg =3D rd + 32;
> > +                             op->type =3D MKOP(STORE_VSX, PREFIXED, 8)=
;
> > +                             op->element_size =3D 8;
> > +                             op->vsx_flags =3D VSX_CHECK_VEC;
> > +                             break;
> > +                     case 47:        /* pstxssp */
> > +                             op->reg =3D rd + 32;
> > +                             op->type =3D MKOP(STORE_VSX, PREFIXED, 4)=
;
> > +                             op->element_size =3D 8;
> > +                             op->vsx_flags =3D VSX_FPCONV | VSX_CHECK_=
VEC;
> > +                             break;
> > +                     case 51:        /* plxv1 */
> > +                             op->reg +=3D 32;
> > +
> > +                             /* fallthru */
> > +                     case 50:        /* plxv0 */
> > +                             op->type =3D MKOP(LOAD_VSX, PREFIXED, 16)=
;
> > +                             op->element_size =3D 16;
> > +                             op->vsx_flags =3D VSX_CHECK_VEC;
> > +                             break;
> > +                     case 55:        /* pstxv1 */
> > +                             op->reg =3D rd + 32;
> > +
> > +                             /* fallthru */
> > +                     case 54:        /* pstxv0 */
> > +                             op->type =3D MKOP(STORE_VSX, PREFIXED, 16=
);
> > +                             op->element_size =3D 16;
> > +                             op->vsx_flags =3D VSX_CHECK_VEC;
> > +                             break;
> > +                     case 56:        /* plq */
> > +                             op->type =3D MKOP(LOAD, PREFIXED, 16);
> > +                             break;
> > +                     case 57:        /* pld */
> > +                             op->type =3D MKOP(LOAD, PREFIXED, 8);
> > +                             break;
> > +                     case 60:        /* stq */
> > +                             op->type =3D MKOP(STORE, PREFIXED, 16);
> > +                             break;
> > +                     case 61:        /* pstd */
> > +                             op->type =3D MKOP(STORE, PREFIXED, 8);
> > +                             break;
> > +                     }
> > +                     break;
> > +             case 1: /* Type 01 Eight-Byte Register-to-Register */
> > +                     break;
> > +             case 2: /* Type 10 Modified Load/Store */
> > +                     if (prefix_r && ra)
> > +                             break;
> > +                     op->ea =3D mlsd_8lsd_ea(instr, suffix, regs);
> > +                     switch (suffixopcode) {
> > +                     case 32:        /* plwz */
> > +                             op->type =3D MKOP(LOAD, PREFIXED, 4);
> > +                             break;
> > +                     case 34:        /* plbz */
> > +                             op->type =3D MKOP(LOAD, PREFIXED, 1);
> > +                             break;
> > +                     case 36:        /* pstw */
> > +                             op->type =3D MKOP(STORE, PREFIXED, 4);
> > +                             break;
> > +                     case 38:        /* pstb */
> > +                             op->type =3D MKOP(STORE, PREFIXED, 1);
> > +                             break;
> > +                     case 40:        /* plhz */
> > +                             op->type =3D MKOP(LOAD, PREFIXED, 2);
> > +                             break;
> > +                     case 42:        /* plha */
> > +                             op->type =3D MKOP(LOAD, PREFIXED | SIGNEX=
T, 2);
> > +                             break;
> > +                     case 44:        /* psth */
> > +                             op->type =3D MKOP(STORE, PREFIXED, 2);
> > +                             break;
> > +                     case 48:        /* plfs */
> > +                             op->type =3D MKOP(LOAD_FP, PREFIXED | FPC=
ONV, 4);
> > +                             break;
> > +                     case 50:        /* plfd */
> > +                             op->type =3D MKOP(LOAD_FP, PREFIXED, 8);
> > +                             break;
> > +                     case 52:        /* pstfs */
> > +                             op->type =3D MKOP(STORE_FP, PREFIXED | FP=
CONV, 4);
> > +                             break;
> > +                     case 54:        /* pstfd */
> > +                             op->type =3D MKOP(STORE_FP, PREFIXED, 8);
> > +                             break;
> > +                     }
> > +                     break;
> > +             case 3: /* Type 11 Modified Register-to-Register */
> > +                     break;
> > +             }
> > +     }
> > +
> >   #ifdef CONFIG_VSX
> >       if ((GETTYPE(op->type) =3D=3D LOAD_VSX ||
> >            GETTYPE(op->type) =3D=3D STORE_VSX) &&
> >
>
> Christophe
