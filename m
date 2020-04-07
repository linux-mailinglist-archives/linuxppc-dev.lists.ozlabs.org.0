Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 488771A0966
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 10:34:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xLLP24cCzDqLr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 18:34:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IY7us0dq; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xLJh4csszDqCB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 18:33:06 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id r21so768440oij.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 01:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3NdBZrBchboUzJZX3MgOiG51upDBDaBFf/OswFJt+9I=;
 b=IY7us0dqtEe5Q7gI/6OKXvnIqvK+AGn6vzgaxXkQR5BrtmHNtaSOqFwpCfRoMTCbto
 /+JDN1n3LbCSH8GHqJE1mKfhMHNo0PSEH2LDjFVnYzji1vhjfB+OVKl9dAqa88CWs60y
 Ur5wPannrhdtc8cauFBf8fBcRoslHFuISL1ipDOtkbRUuNTlQGxbrvXNetz1i1ztI5rV
 UXHak74nqCwIYOgwtSIfNGZvJDes+lKKXgI3/nkl8TCHZPT+e7Q1lCFzTsBk7mWLCy99
 RMOsxCNT3y4E4U5mp37ngSfHOPh4oTeJnj8U65D3x6Wtm2z4681vqKHFgs4sGRcKjQ5R
 ndfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3NdBZrBchboUzJZX3MgOiG51upDBDaBFf/OswFJt+9I=;
 b=IfFqCZhHd1cFjw4KfzRC0BdVGbaNXMo65zEfBMPwlWqYgaSZKO2XmESy8kTed/6zv/
 /Qc1udSRp5qoLob0UWSaPu5oB9JH6iJrXuAciL2yRjLuBwFhdIr+4z5Ih3i8Kj32MvvP
 TgOUZUb1imwEqFjYp65jw136q/TgLIcsmQiL4XXeOYDfkvBX2fNhk0PFcv9jQAlArNuF
 QpgVzjE9+aCiuwJnxF0LL/ZAGcxciIUzV6RDbzih6UGcRnKzxYSsb4Xav4eTnSYz/Woj
 paEsLwDbOMbcDGsQnp2fvu02vY9P+avWzbV7jyQKfauu2EXR01s8AONoSum5HtiqPAc+
 N/3A==
X-Gm-Message-State: AGi0PuZBt+xm4oxNmd2sOp8m3WnohqyDllg+wfBh6Rvs6qvpk+a4SXRG
 xyk/Mvi+pxYRbIV4P4BAIsOnIQ0s5oL94XxHNPY/pg==
X-Google-Smtp-Source: APiQypLYakX3a6R9G2T6QsrumV+IDAPTRIb9IS8WHLmlGLBEyJh2LGO1ZMPVPs3gUz5njznnhTYLCQ2ih/sZteUe8zo=
X-Received: by 2002:aca:f254:: with SMTP id q81mr847876oih.12.1586248384401;
 Tue, 07 Apr 2020 01:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-6-jniethe5@gmail.com>
 <1f3f9f12af1f40339045737910e8e63265edb28d.camel@linux.ibm.com>
In-Reply-To: <1f3f9f12af1f40339045737910e8e63265edb28d.camel@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 7 Apr 2020 18:32:52 +1000
Message-ID: <CACzsE9pddO949iaNBaOc37h1a6L9Us9WDGEJ3g3hR=c_xCEi6Q@mail.gmail.com>
Subject: Re: [PATCH v5 05/21] powerpc: Use a function for getting the
 instruction op code
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

On Tue, Apr 7, 2020 at 5:05 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
>
> On Mon, 2020-04-06 at 18:09 +1000, Jordan Niethe wrote:
> > In preparation for using a data type for instructions that can not be
> > directly used with the '>>' operator use a function for getting the op
> > code of an instruction.
>
> vecemu.c and sstep.c will need ppc_inst_opcode().
Sorry, I forget you pointed those files out before. I added other
things to them but then I forgot to add this. Will do for next time.
>
> -- Bala
>
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v4: New to series
> > ---
> >  arch/powerpc/include/asm/inst.h  | 5 +++++
> >  arch/powerpc/kernel/align.c      | 2 +-
> >  arch/powerpc/lib/code-patching.c | 4 ++--
> >  3 files changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/inst.h
> > b/arch/powerpc/include/asm/inst.h
> > index 5298ba33b6e5..93959016fe4b 100644
> > --- a/arch/powerpc/include/asm/inst.h
> > +++ b/arch/powerpc/include/asm/inst.h
> > @@ -8,4 +8,9 @@
> >
> >  #define ppc_inst(x) (x)
> >
> > +static inline int ppc_inst_opcode(u32 x)
> > +{
> > +     return x >> 26;
> > +}
> > +
> >  #endif /* _ASM_INST_H */
> > diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> > index 86e9bf62f18c..691013aa9f3c 100644
> > --- a/arch/powerpc/kernel/align.c
> > +++ b/arch/powerpc/kernel/align.c
> > @@ -314,7 +314,7 @@ int fix_alignment(struct pt_regs *regs)
> >       }
> >
> >  #ifdef CONFIG_SPE
> > -     if ((instr >> 26) == 0x4) {
> > +     if (ppc_inst_opcode(instr) == 0x4) {
> >               int reg = (instr >> 21) & 0x1f;
> >               PPC_WARN_ALIGNMENT(spe, regs);
> >               return emulate_spe(regs, reg, instr);
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-
> > patching.c
> > index fdf0d6ea3575..099a515202aa 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -231,7 +231,7 @@ bool is_offset_in_branch_range(long offset)
> >   */
> >  bool is_conditional_branch(unsigned int instr)
> >  {
> > -     unsigned int opcode = instr >> 26;
> > +     unsigned int opcode = ppc_inst_opcode(instr);
> >
> >       if (opcode == 16)       /* bc, bca, bcl, bcla */
> >               return true;
> > @@ -289,7 +289,7 @@ int create_cond_branch(unsigned int *instr, const
> > unsigned int *addr,
> >
> >  static unsigned int branch_opcode(unsigned int instr)
> >  {
> > -     return (instr >> 26) & 0x3F;
> > +     return ppc_inst_opcode(instr) & 0x3F;
> >  }
> >
> >  static int instr_is_branch_iform(unsigned int instr)
>
