Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E525E18F1F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 10:39:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m8Tf6YcBzDqdm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 20:39:02 +1100 (AEDT)
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
 header.s=20161025 header.b=ZFFdc4P4; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m8Pk2g72zDrB5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 20:35:38 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id w2so3079283oic.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xdGr3bgw1Ab5bDc4JlY6XxI90/JB6dJaXTOznBZufB4=;
 b=ZFFdc4P4yqqrz07hwIX0rqQh5H9k6bi7oa5T4gCfv9H7WJjYWM3wxGcSbl0dtBQ0m+
 kpkCSzswKF5ydIWdsbNNP2J8VW3OS5ITt8qGjzlSvPxwHRS4EKU9D3ouuVUMAzThB1+Q
 8WrGKNli6S7TG6BolgEoSJUW/NCPrn++KSwWl4sEnl1pgbje0gf1pJPNz3/RFfXayvgs
 t9antJJh74jy+E7huNTpdrCkhvL/yBruzNYIl7vJcDo4tm4vuebkVqBHf9ZEbLbQCD8O
 x9Gjcu4syB7/yt6G5Gg9/OY6/fx6kwrm9rynNzHhYw1yMhz0Qyz2Fp0Bt+NAJCswXd9A
 UXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xdGr3bgw1Ab5bDc4JlY6XxI90/JB6dJaXTOznBZufB4=;
 b=FiuJSt7s2MfTnlLxugffRyXuNeLbtkoTfyKsWq2bqZrhzijaptB4fNvRhydaYW8zfg
 K5DIJUucxLykTrXRTV9euNKF4RI2uonKlb3avnBJB28G4l+OHxRq0MydII/B/qBzTHyd
 Getzzm4j0hFPL94paZzlZ9Abhq1alHFSmtFPR5wS2iSxjXYrmBtHYlwZjo3oI40gN5nI
 7oJnRDxoauEufbjyDprOSdwwjmxUdZHYk4njWwX3vS8QzeL/nptkNAzpDo163p7GDZfO
 2cnLTLul917iKBN4MpzdJ66kJngOoc6kb50oHSsD+OpFClvE1oTcmem1lQpy48WG9uM+
 w9hg==
X-Gm-Message-State: ANhLgQ3MfE/7rtJhIPf72w9YGh2+h4FLctNh329bTKcROPjXW/vXB4fO
 d2Vota393XJzel3ZpMZ0sbUtm/0aLQPJRTGvOKg=
X-Google-Smtp-Source: ADFU+vvrsKlpSvlBIBrx2jJ8A/Eqyh8MzVvnoPV5sG7eAiSD1pn78EWWLWtf8VVeQ+ryK1aVnoWHjdGCnYEjo1ahreg=
X-Received: by 2002:aca:fd48:: with SMTP id b69mr11332713oii.126.1584956135453; 
 Mon, 23 Mar 2020 02:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-7-jniethe5@gmail.com>
 <250cbed1e5966c5a740e840b9127ed7964e241d6.camel@linux.ibm.com>
In-Reply-To: <250cbed1e5966c5a740e840b9127ed7964e241d6.camel@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 23 Mar 2020 20:35:24 +1100
Message-ID: <CACzsE9oh1x_TRH=5-OJOLC=0YBd3Y+9phoyAHj18RLc3CAH6Mw@mail.gmail.com>
Subject: Re: [PATCH v4 06/16] powerpc: Use a function for getting the
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 5:54 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
>
> On Fri, 2020-03-20 at 16:17 +1100, Jordan Niethe wrote:
> > In preparation for using a data type for instructions that can not be
> > directly used with the '>>' operator use a function for getting the op
> > code of an instruction.
>
> we need to adopt this in sstep.c and vecemu.c
Thank you, I had forgotten about vecemu.c.
>
> -- Bala
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v4: New to series
> > ---
> >  arch/powerpc/kernel/align.c      | 4 ++--
> >  arch/powerpc/lib/code-patching.c | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> > index 38542fffa179..77c49dfdc1b4 100644
> > --- a/arch/powerpc/kernel/align.c
> > +++ b/arch/powerpc/kernel/align.c
> > @@ -313,8 +313,8 @@ int fix_alignment(struct pt_regs *regs)
> >       }
> >
> >  #ifdef CONFIG_SPE
> > -     if ((instr >> 26) == 0x4) {
> > -             int reg = (instr >> 21) & 0x1f;
> > +     if (ppc_inst_opcode(instr) == 0x4) {
> > +             int reg = (ppc_inst_word(instr) >> 21) & 0x1f;
> >               PPC_WARN_ALIGNMENT(spe, regs);
> >               return emulate_spe(regs, reg, instr);
> >       }
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-
> > patching.c
> > index e2ba23fd6f4d..04a303c059e2 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -228,7 +228,7 @@ bool is_offset_in_branch_range(long offset)
> >   */
> >  bool is_conditional_branch(ppc_inst instr)
> >  {
> > -     unsigned int opcode = instr >> 26;
> > +     unsigned int opcode = ppc_inst_opcode(instr);
> >
> >       if (opcode == 16)       /* bc, bca, bcl, bcla */
> >               return true;
> > @@ -286,7 +286,7 @@ unsigned int create_cond_branch(const unsigned int *addr,
> >
> >  static unsigned int branch_opcode(ppc_inst instr)
> >  {
> > -     return (instr >> 26) & 0x3F;
> > +     return ppc_inst_opcode(instr) & 0x3F;
> >  }
> >
> >  static int instr_is_branch_iform(ppc_inst instr)
>
