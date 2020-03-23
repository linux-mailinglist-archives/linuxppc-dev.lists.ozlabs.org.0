Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3761318F1D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 10:30:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m8HG0yHZzDqWb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 20:30:02 +1100 (AEDT)
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
 header.s=20161025 header.b=mf49KqT1; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m8Cd4B0mzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 20:26:53 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id k8so14113938oik.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4JifHYSdr7VL0HcioW85Mo+0LatYwQsUG6GwcoO55Bs=;
 b=mf49KqT1oIuAgtQFTq+jJ2zDVsClmofS5eCjUZEw1h7g0sVy4R1q+j0Eaap4uNZz9w
 q4XEnhn1p+IbBagcdqGog8PuVfXIggNpoNfEbIihI3YuCf1EZNlgVhX0l4ItFWnka17O
 RfncfOGWoWGTmRRSa4dPQ05BA11gWUbhqAIQTNsQU07hNGzBEs2AXFJXNXz1YxcxEHRW
 2MulZIezcsPBD2OtXJE78QjrA/Un3ICyiI2QRubXplvPNUpyrADNcWpQnDg9UPZzVZKr
 iI2UoF4bSXwmPu4CzAOFtdcO/bTiptHP+ux/M0VM/iWYU4i+/XLHfV9x0ddCSrpLEw/T
 jeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4JifHYSdr7VL0HcioW85Mo+0LatYwQsUG6GwcoO55Bs=;
 b=t/RCl/xwkiI5q6d1DQISIoGcoYS73LhA73gDiKf8VXbvba/e0YaFXhyUaxH5xKn4Yl
 bOriy/xdTW+jUoCc44QnLefAkwNMtzT2PHoH6jZ1YLNEJvlC2MkrGUoU5o+u8kLZvJtm
 iV2JCfiPmyy8AxRr+aO9Dd6xcPk5fEafBEDQk+klbWHDp3zBTzWcw8AKq6Wpr8SctC/2
 uekv0SzM6mC/8dj5mq/L5L+bMOm2PySGxpwD5pKo1/llqpTgJCppwqk5nrFMkeWXkNTA
 1axLTk7tQT+SWHdJi7MpAGrMcThYCTxwe+OWGv0bQs/nUjDJhIx3afjWlgDeKyyPYfEX
 RxQw==
X-Gm-Message-State: ANhLgQ3XUsoS0QC8tz+qWWTtTXPdUNn24JBfA8afQysxJh/iws6emH/i
 JZU1zCjlAlN/xlmF4ADUWwRjqjxqhejOn+W5ppR96jD2VhI=
X-Google-Smtp-Source: ADFU+vt3brEK88vzxoyahcGD/DXDzlOauk3jQgHiD7DlbFKMh3pzqRTWIZg2CqHNJhPFxPAaQmMJdCKG2yBfjTgwaz8=
X-Received: by 2002:aca:fd48:: with SMTP id b69mr11313213oii.126.1584955608814; 
 Mon, 23 Mar 2020 02:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-3-jniethe5@gmail.com>
 <2e9df48355d592e1fbeeaff1d19d74c72fc4709f.camel@linux.ibm.com>
In-Reply-To: <2e9df48355d592e1fbeeaff1d19d74c72fc4709f.camel@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 23 Mar 2020 20:26:37 +1100
Message-ID: <CACzsE9ogYE43OoA=rnS33K9QCr1REgQ6ekJPvOt9=RdLu4KzOA@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] xmon: Move out-of-line instructions to text
 section
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

On Mon, Mar 23, 2020 at 5:05 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
>
> On Fri, 2020-03-20 at 16:17 +1100, Jordan Niethe wrote:
> > To execute an instruction out of line after a breakpoint, the NIP is
> > set
> > to the address of struct bpt::instr. Here a copy of the instruction
> > that
> > was replaced with a breakpoint is kept, along with a trap so normal
> > flow
> > can be resumed after XOLing. The struct bpt's are located within the
> > data section. This is problematic as the data section may be marked
> > as
> > no execute.
> >
> > Instead of each struct bpt holding the instructions to be XOL'd, make
> > a
> > new array, bpt_table[], with enough space to hold instructions for
> > the
> > number of supported breakpoints. Place this array in the text
> > section.
> > Make struct bpt::instr a pointer to the instructions in bpt_table[]
> > associated with that breakpoint. This association is a simple
> > mapping:
> > bpts[n] -> bpt_table[n * words per breakpoint].
>
> Can we have it in separate commits ?
>         * introduce the array bpt_table[] and make struct bpt::instr a
>                 pointer to the instructions in bpt_table[].
>         * place the array in text section.
Yeah I can split it if that would be clearer.
>
> > Currently we only need
> > the copied instruction followed by a trap, so 2 words per breakpoint.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v4: New to series
> > ---
> >  arch/powerpc/kernel/vmlinux.lds.S |  2 +-
> >  arch/powerpc/xmon/xmon.c          | 22 +++++++++++++---------
> >  2 files changed, 14 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/vmlinux.lds.S
> > b/arch/powerpc/kernel/vmlinux.lds.S
> > index b4c89a1acebb..e90845b8c300 100644
> > --- a/arch/powerpc/kernel/vmlinux.lds.S
> > +++ b/arch/powerpc/kernel/vmlinux.lds.S
> > @@ -86,7 +86,7 @@ SECTIONS
> >               ALIGN_FUNCTION();
> >  #endif
> >               /* careful! __ftr_alt_* sections need to be close to
> > .text */
> > -             *(.text.hot TEXT_MAIN .text.fixup .text.unlikely .fixup
> > __ftr_alt_* .ref.text);
> > +             *(.text.hot TEXT_MAIN .text.fixup .text.unlikely .fixup
> > __ftr_alt_* .ref.text .text.xmon_bpts);
> >  #ifdef CONFIG_PPC64
> >               *(.tramp.ftrace.text);
> >  #endif
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index 02e3bd62cab4..7875d1a37770 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -97,7 +97,7 @@ static long *xmon_fault_jmp[NR_CPUS];
> >  /* Breakpoint stuff */
> >  struct bpt {
> >       unsigned long   address;
> > -     unsigned int    instr[2];
> > +     unsigned int    *instr;
> >       atomic_t        ref_count;
> >       int             enabled;
> >       unsigned long   pad;
> > @@ -109,6 +109,7 @@ struct bpt {
> >  #define BP_DABR              4
> >
> >  #define NBPTS        256
> > +#define BPT_WORDS    2
> >  static struct bpt bpts[NBPTS];
> >  static struct bpt dabr;
> >  static struct bpt *iabr;
> > @@ -116,6 +117,8 @@ static unsigned bpinstr = 0x7fe00008;     /* trap
> > */
> >
> >  #define BP_NUM(bp)   ((bp) - bpts + 1)
> >
> > +static unsigned int __section(.text.xmon_bpts) bpt_table[NBPTS *
> > BPT_WORDS];
> > +
> >  /* Prototypes */
> >  static int cmds(struct pt_regs *);
> >  static int mread(unsigned long, void *, int);
> > @@ -852,16 +855,16 @@ static struct bpt *at_breakpoint(unsigned long
> > pc)
> >  static struct bpt *in_breakpoint_table(unsigned long nip, unsigned
> > long *offp)
> >  {
> >       unsigned long off;
> > +     unsigned long bp_off;
> >
> > -     off = nip - (unsigned long) bpts;
> > -     if (off >= sizeof(bpts))
> > +     off = nip - (unsigned long) bpt_table;
> > +     if (off >= sizeof(bpt_table))
> >               return NULL;
> > -     off %= sizeof(struct bpt);
> > -     if (off != offsetof(struct bpt, instr[0])
> > -         && off != offsetof(struct bpt, instr[1]))
> > +     bp_off = off % (sizeof(unsigned int) * BPT_WORDS);
> > +     if (bp_off != 0 && bp_off != 4)
> >               return NULL;
> > -     *offp = off - offsetof(struct bpt, instr[0]);
> > -     return (struct bpt *) (nip - off);
> > +     *offp = bp_off;
> > +     return bpts + ((off - bp_off) / (sizeof(unsigned int) *
> > BPT_WORDS));
>
> `(off - bp_off) / (sizeof(unsigned int) * BPT_WORDS)` seems to be the
> actual breakpoint offset. Can we have something like,
>
> #define NBPTS  256
> #define BPT_WORDS      2
> #define BPT_WORDS_SIZE (sizeof(unsigned int) * BPT_WORDS)
> #define BPT_OFFSET(off, bp_word_off) ((off - bp_word_off) / \                                   BPT_WORDS_SIZE)
> ;
> :::
> :::
> :::
> bp_word_off = off % BPT_WORDS_SIZE;
> if (bp_word_off != 0 && bp_word_off != 4)
>         return NULL;
> *offp = bp_word_off;
> return bpts + BPT_OFFSET(off, bp_word_off);
I do agree this is not very clear int terms of the calculations I
don't really want to introduce some macros to be used just once. I
will try to think of a way to make the calculations look more clear.
>
> -- Bala
>
