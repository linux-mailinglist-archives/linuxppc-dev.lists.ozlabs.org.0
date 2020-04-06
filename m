Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D7919F2C2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 11:39:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wlr32B7tzDqlL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 19:39:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tN6RcO20; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wlpR2SmjzDqVm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 19:38:22 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id v2so14635735oto.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 02:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HiVGSDar5y5kwZZSYh4HPmXRiHohl5eZTLCsHNWuX7Q=;
 b=tN6RcO20oISnSoMgkyNDnR8dK3ekClmookPbeZsF2lWJj7pgJGsxxdviICHJHA0nO9
 h2kjtTvZV4fujReIjql18YjOvITEeedSsgbrCLBt5BPpl3IiXD32q4V4g6f/J9zi8avW
 UAh0wzWjThMCjzU4eN3EVPYqiBghcgAWDVQbcEwkQ14ILCAJjYGotK0HhJf2xMlU3hZ5
 56awe/Yyo5QjcZ0iSct291ztt7Eo6rX5KFVqpqqayouECTrLii2IYcTC9gaxVohzb+AO
 /IxsuigjnFMtSt3nFwPaF1xGBkjOJ0GFzGzhcjmk0CL9KmtI0p2UgnA/E9Gdoy80rFqx
 eYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HiVGSDar5y5kwZZSYh4HPmXRiHohl5eZTLCsHNWuX7Q=;
 b=UBu3wDU3AGVyFLxXBlgPFNto9ldUc603nZ9mUTxXMaQQbc8NQmEYCcN2mphXJT61KQ
 dMXbfVV3j9vBDzR2PCwEDren7x63yHVRknN20F/K8yYwswm45l2RTJ8YCrJE7NihQn3C
 nWe8ysx+QaKgoI3WXMoFD5AP2OnwXj2kAizAJY4iJc4m0QMEQjSZPfrPLGmpTTzNUPob
 4nZjYP8hux1bY7Dla4fn/nZ2FEP0BzcVGhCfsZu1ml6ICysUFc9guzIQkCb8m3hNhhkR
 5EqramCLQthV8byUrOQlWZfGdirDtLJVQ4W+00WtMy30h/Kjg/3Qc2O+TPPaaLw3bMIX
 ttiw==
X-Gm-Message-State: AGi0PuaqhFdf2i9SdOQHsf1SGau0V2zoYjmIVXCVskTSHdlK/3MJyZfn
 j7rzNtci7zLbfl5S4qhdjPazyZkAIVpePfNgjjY=
X-Google-Smtp-Source: APiQypKv5iyTU+EzN5UmWnr1Yf/riKjhq8aIL1GhygtECNmhpE8VN5iIfYHLSSA80dhkzI9hrGCCmttATxwOK9JYJRg=
X-Received: by 2002:a4a:db7b:: with SMTP id o27mr16801820ood.25.1586165899996; 
 Mon, 06 Apr 2020 02:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-6-jniethe5@gmail.com>
 <cedd91d6-033a-c503-4b30-9366cac5bc7f@c-s.fr>
In-Reply-To: <cedd91d6-033a-c503-4b30-9366cac5bc7f@c-s.fr>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 6 Apr 2020 19:38:08 +1000
Message-ID: <CACzsE9oJyERKiMWBSOg=8-qzXCpO_WBUAyhhW9X8MQwvz_ur1A@mail.gmail.com>
Subject: Re: [PATCH v5 05/21] powerpc: Use a function for getting the
 instruction op code
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Balamuruhan S <bala24@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 6, 2020 at 6:22 PM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
>
>
>
> Le 06/04/2020 =C3=A0 10:09, Jordan Niethe a =C3=A9crit :
> > In preparation for using a data type for instructions that can not be
> > directly used with the '>>' operator use a function for getting the op
> > code of an instruction.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v4: New to series
> > ---
> >   arch/powerpc/include/asm/inst.h  | 5 +++++
> >   arch/powerpc/kernel/align.c      | 2 +-
> >   arch/powerpc/lib/code-patching.c | 4 ++--
>
> What about store_updates_sp() in mm/fault.c ?
True. An early revision of this series used analyse_instr() there,
which ended up causing issues. But it still can use the instruction
data type. I will change that.
>
> Christophe
>
> >   3 files changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm=
/inst.h
> > index 5298ba33b6e5..93959016fe4b 100644
> > --- a/arch/powerpc/include/asm/inst.h
> > +++ b/arch/powerpc/include/asm/inst.h
> > @@ -8,4 +8,9 @@
> >
> >   #define ppc_inst(x) (x)
> >
> > +static inline int ppc_inst_opcode(u32 x)
> > +{
> > +     return x >> 26;
> > +}
> > +
> >   #endif /* _ASM_INST_H */
> > diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> > index 86e9bf62f18c..691013aa9f3c 100644
> > --- a/arch/powerpc/kernel/align.c
> > +++ b/arch/powerpc/kernel/align.c
> > @@ -314,7 +314,7 @@ int fix_alignment(struct pt_regs *regs)
> >       }
> >
> >   #ifdef CONFIG_SPE
> > -     if ((instr >> 26) =3D=3D 0x4) {
> > +     if (ppc_inst_opcode(instr) =3D=3D 0x4) {
> >               int reg =3D (instr >> 21) & 0x1f;
> >               PPC_WARN_ALIGNMENT(spe, regs);
> >               return emulate_spe(regs, reg, instr);
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index fdf0d6ea3575..099a515202aa 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -231,7 +231,7 @@ bool is_offset_in_branch_range(long offset)
> >    */
> >   bool is_conditional_branch(unsigned int instr)
> >   {
> > -     unsigned int opcode =3D instr >> 26;
> > +     unsigned int opcode =3D ppc_inst_opcode(instr);
> >
> >       if (opcode =3D=3D 16)       /* bc, bca, bcl, bcla */
> >               return true;
> > @@ -289,7 +289,7 @@ int create_cond_branch(unsigned int *instr, const u=
nsigned int *addr,
> >
> >   static unsigned int branch_opcode(unsigned int instr)
> >   {
> > -     return (instr >> 26) & 0x3F;
> > +     return ppc_inst_opcode(instr) & 0x3F;
> >   }
> >
> >   static int instr_is_branch_iform(unsigned int instr)
> >
