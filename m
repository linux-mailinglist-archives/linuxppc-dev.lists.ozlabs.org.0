Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 634D01A19E4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 04:19:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xnym4K31zDqgx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 12:19:12 +1000 (AEST)
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
 header.s=20161025 header.b=oFFuAdjG; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xns55H9RzDqck
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 12:14:17 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id l23so5339779otf.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 19:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qBFwX0Nbzm8F1GfNZTI0Y1b6hUmimlUgE0J2mbRS1Bo=;
 b=oFFuAdjGlSfLX5RHaTjYefTmCFrnq6y3tTUI/SppEWY9DbgPcV3DDamVDe7V9czg30
 T0xvJl0v+pGHVf6bzNcQIESUGbmqbozgmdxJQRQM+fYW3a5WhHI+63KbtpOiHVr+u1xQ
 Tr3VQkGT9tCVAsc9jAfcBfb9bl70PLiJGeavBOHkDfSCi1obHeBFOcookbt+d3NnPEU6
 nhAUWAofiRdsreRw4Y+vx6lln6Hj3i3lZoz0+g5KjbdfJqRiIcXge3+YMsWWjzxq7wPu
 WsTaQWNH+ppFsGG2y99tdY8AoVwmsFOxDoOjLGyfzFdYIeRQv2w8MdTeel5QpJqpo5/t
 Z6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qBFwX0Nbzm8F1GfNZTI0Y1b6hUmimlUgE0J2mbRS1Bo=;
 b=QXflMz6tI+liiofwuqToPHuJMxj9ZYEZad8sq5/ALqWowI0Im//1HabXhdmmSact9T
 FfV57KvMtl5ksiEfbkYbfH+rq4l5ApeqNI9TbFlrXCmpmOZbdOSfn8w3UjMYw8jUm9Aw
 aBAFtUwJnMppHiv0B8zwYA4FIkqWG1NzwUbov2LJb+ts+lW+2q9sieVY/lDkSeruGmro
 fe+NuxmTouXCGu1lHwlU3Iw2tke6C/BNZ0X0gDmKAu/lbjHmDtJv/M1sCM/z2Je8Z6lx
 +2G3bRHScyZckmOz5zXKFbL/YiSl+myJDJ/AQ+nGMadj4JrdTqkAL+pQHZioFMF080qj
 WBAQ==
X-Gm-Message-State: AGi0PuYVSl7z7qjxepDcful1OK91vKAGLxrGUNhDbLwPiQeXSId2GGYc
 iDv71dmO2/RQbEqGyweJ+P+6gaNKIkEKuaMUjEI=
X-Google-Smtp-Source: APiQypJY3K07EbSzR1Y2VZ4iPaHEfppitEEXd+T6uqNaaoHYsW4Jl5ihKPYzR9IuPeszb/HfC1nGITSwtKsWVxXvnHI=
X-Received: by 2002:a9d:62c2:: with SMTP id z2mr4259209otk.155.1586312055737; 
 Tue, 07 Apr 2020 19:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-13-jniethe5@gmail.com>
 <0408a002ecdb4fa453f2632c8d6125152bfd76ed.camel@linux.ibm.com>
In-Reply-To: <0408a002ecdb4fa453f2632c8d6125152bfd76ed.camel@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 8 Apr 2020 12:14:04 +1000
Message-ID: <CACzsE9o8G2hsC-6AyQhka91zCJn7j9ze=2APZbv9EQuxfaBeXg@mail.gmail.com>
Subject: Re: [PATCH v5 12/21] powerpc: Introduce a function for reporting
 instruction length
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

On Tue, Apr 7, 2020 at 9:15 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
>
> On Mon, 2020-04-06 at 18:09 +1000, Jordan Niethe wrote:
> > Currently all instructions have the same length, but in preparation for
> > prefixed instructions introduce a function for returning instruction
> > length.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> >  arch/powerpc/include/asm/inst.h | 5 +++++
> >  arch/powerpc/kernel/kprobes.c   | 6 ++++--
> >  arch/powerpc/kernel/uprobes.c   | 2 +-
> >  3 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/inst.h
> > b/arch/powerpc/include/asm/inst.h
> > index 369b35ce964c..70b37a35a91a 100644
> > --- a/arch/powerpc/include/asm/inst.h
> > +++ b/arch/powerpc/include/asm/inst.h
> > @@ -17,6 +17,11 @@ static inline u32 ppc_inst_val(struct ppc_inst x)
> >       return x.val;
> >  }
> >
> > +static inline bool ppc_inst_len(struct ppc_inst x)
>
>
> return type shouldn't be a bool, `size_t` instead.
Thank you.
>
> -- Bala
>
> > +{
> > +     return sizeof(struct ppc_inst);
> > +}
> > +
> >  static inline int ppc_inst_opcode(struct ppc_inst x)
> >  {
> >       return x.val >> 26;
> > diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> > index ff53e5ef7e40..8d17cfdcdc54 100644
> > --- a/arch/powerpc/kernel/kprobes.c
> > +++ b/arch/powerpc/kernel/kprobes.c
> > @@ -474,14 +474,16 @@ NOKPROBE_SYMBOL(trampoline_probe_handler);
> >   */
> >  int kprobe_post_handler(struct pt_regs *regs)
> >  {
> > +     int len;
> >       struct kprobe *cur = kprobe_running();
> >       struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
> >
> >       if (!cur || user_mode(regs))
> >               return 0;
> >
> > +     len = ppc_inst_len(ppc_inst_read((struct ppc_inst *)cur->ainsn.insn));
> >       /* make sure we got here for instruction we have a kprobe on */
> > -     if (((unsigned long)cur->ainsn.insn + 4) != regs->nip)
> > +     if (((unsigned long)cur->ainsn.insn + len) != regs->nip)
> >               return 0;
> >
> >       if ((kcb->kprobe_status != KPROBE_REENTER) && cur->post_handler) {
> > @@ -490,7 +492,7 @@ int kprobe_post_handler(struct pt_regs *regs)
> >       }
> >
> >       /* Adjust nip to after the single-stepped instruction */
> > -     regs->nip = (unsigned long)cur->addr + 4;
> > +     regs->nip = (unsigned long)cur->addr + len;
> >       regs->msr |= kcb->kprobe_saved_msr;
> >
> >       /*Restore back the original saved kprobes variables and continue. */
> > diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> > index 31c870287f2b..8e63afa012ba 100644
> > --- a/arch/powerpc/kernel/uprobes.c
> > +++ b/arch/powerpc/kernel/uprobes.c
> > @@ -112,7 +112,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe,
> > struct pt_regs *regs)
> >        * support doesn't exist and have to fix-up the next instruction
> >        * to be executed.
> >        */
> > -     regs->nip = utask->vaddr + MAX_UINSN_BYTES;
> > +     regs->nip = utask->vaddr + ppc_inst_len(auprobe->insn);
> >
> >       user_disable_single_step(current);
> >       return 0;
>
