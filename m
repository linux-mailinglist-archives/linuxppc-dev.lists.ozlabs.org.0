Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC68B1A19E6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 04:21:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xp113P9KzDqVH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 12:21:09 +1000 (AEST)
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
 header.s=20161025 header.b=j0+Douj1; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xnxg4VkdzDr3p
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 12:18:14 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id 60so2436719otl.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 19:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ETdyUcdTnnb5V7JN1bFc0UPKiPXEe6HNyeWWy3GV8FI=;
 b=j0+Douj1vS+KnO96sM+EuKhJunx2IzrUHFuOhMPqhbh/tZ/vdXp+aPNg6Ka3m2fldj
 h86zBIUwN+wtO9lY42rL0QNzXgKX0Mw4UuU1bPx2KcZmlWkA2sqTtYIUhhJqHlZK+8Vp
 nxzkK7cg1PV2CDEiJArMo+O8BDyu4/YqhJ2vegICbhe7v/f14c+b2nnYXREpshjzWrY7
 f+Q/9xdsun/rQfkohdS4gu6YTrT2u4blW+1sp81LYCXoetUboaY14LKuEQ7XtoPjclZU
 xj4sWTnPG3Sr2TA2sEjim9AfV5yxCmRstUApumHKCOw1hsqv2a1Uv/bnEM5VONYQo0lr
 W7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ETdyUcdTnnb5V7JN1bFc0UPKiPXEe6HNyeWWy3GV8FI=;
 b=FlEuiLmjyJ1oNev4Ifds5+5x4BAh+v9BaJGPvlfc5VDn+6KGsrAd21IqTI+4QCKY4G
 Hv0VQFIFUBXfYSpHINhCkVSHk1OM6yxuq02ZG8ZQjy0Hc1MNajEjyzO3YRhIu2HzQP7A
 awgw584Z3o2izBcjJNqaMo919W7V3/BJ0ziPxiEz4Hjp8o4P2hiCKDTaNtjDmqEpsOzk
 OQcHh5eM8Tsgm+ldCdNstiTaTTDIwYFeuJl2Sfh5BJ9mTpkWBKjPrzyxK6b3ZFfz/h9r
 uuweaxZFFFq7dJ0XQCpJYHX8bP4kQ7/aMtQgyumDtZznfvPlice78Ttcuc+qtO+tkeR7
 oPLA==
X-Gm-Message-State: AGi0PuZE2y659LSoCFqtwAGlgdRbPmNcbqt6WEQzv+4N6Y3RdoY04GTA
 W4TgYwBOA5sjVzhChn1LNUKJnodU2+IUxZ+8M7o=
X-Google-Smtp-Source: APiQypKHhOYp/5O7bU1kz3JNlVbTj4bdzFwgzKnWcbvFNv5fzg45foyOcQTssMGTqR9h1XsgcRjtutUFLxMk3FhI0wo=
X-Received: by 2002:a9d:62c2:: with SMTP id z2mr4268504otk.155.1586312292505; 
 Tue, 07 Apr 2020 19:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-14-jniethe5@gmail.com>
 <ff7df8a41dc80faaa020754b5eaafe81a6e745b9.camel@linux.ibm.com>
In-Reply-To: <ff7df8a41dc80faaa020754b5eaafe81a6e745b9.camel@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 8 Apr 2020 12:18:00 +1000
Message-ID: <CACzsE9r8hAKGwN1reVo00UfO5UiONo2GpUdMsNgqgAJa=LDbSg@mail.gmail.com>
Subject: Re: [PATCH v5 13/21] powerpc/xmon: Use a function for reading
 instructions
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

On Tue, Apr 7, 2020 at 9:31 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
>
> On Mon, 2020-04-06 at 18:09 +1000, Jordan Niethe wrote:
> > Currently in xmon, mread() is used for reading instructions. In
> > preparation for prefixed instructions, create and use a new function,
> > mread_instr(), especially for reading instructions.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v5: New to series, seperated from "Add prefixed instructions to
> > instruction data type"
> > ---
> >  arch/powerpc/xmon/xmon.c | 24 ++++++++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index 5e3949322a6c..6f4cf01a58c1 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -125,6 +125,7 @@ extern unsigned int bpt_table[NBPTS * BPT_WORDS];
> >  static int cmds(struct pt_regs *);
> >  static int mread(unsigned long, void *, int);
> >  static int mwrite(unsigned long, void *, int);
> > +static int mread_instr(unsigned long, struct ppc_inst *);
> >  static int handle_fault(struct pt_regs *);
> >  static void byterev(unsigned char *, int);
> >  static void memex(void);
> > @@ -899,7 +900,7 @@ static void insert_bpts(void)
> >       for (i = 0; i < NBPTS; ++i, ++bp) {
> >               if ((bp->enabled & (BP_TRAP|BP_CIABR)) == 0)
> >                       continue;
> > -             if (mread(bp->address, &instr, 4) != 4) {
> > +             if (!mread_instr(bp->address, &instr)) {
>
>
> Are these checks made based on whether `ppc_inst_len()` returns bool from
> mread_instr() ?
No, it was meant to be the length itself returned with a length of 0
indicating an error. I will need to fix that.
>
> -- Bala
>
>
> >                       printf("Couldn't read instruction at %lx, "
> >                              "disabling breakpoint there\n", bp->address);
> >                       bp->enabled = 0;
> > @@ -949,7 +950,7 @@ static void remove_bpts(void)
> >       for (i = 0; i < NBPTS; ++i, ++bp) {
> >               if ((bp->enabled & (BP_TRAP|BP_CIABR)) != BP_TRAP)
> >                       continue;
> > -             if (mread(bp->address, &instr, 4) == 4
> > +             if (mread_instr(bp->address, &instr)
> >                   && ppc_inst_equal(instr, ppc_inst(bpinstr))
> >                   && patch_instruction(
> >                       (struct ppc_inst *)bp->address, ppc_inst_read(bp-
> > >instr)) != 0)
> > @@ -1165,7 +1166,7 @@ static int do_step(struct pt_regs *regs)
> >       force_enable_xmon();
> >       /* check we are in 64-bit kernel mode, translation enabled */
> >       if ((regs->msr & (MSR_64BIT|MSR_PR|MSR_IR)) == (MSR_64BIT|MSR_IR)) {
> > -             if (mread(regs->nip, &instr, 4) == 4) {
> > +             if (mread_instr(regs->nip, &instr)) {
> >                       stepped = emulate_step(regs, instr);
> >                       if (stepped < 0) {
> >                               printf("Couldn't single-step %s instruction\n",
> > @@ -1332,7 +1333,7 @@ static long check_bp_loc(unsigned long addr)
> >               printf("Breakpoints may only be placed at kernel addresses\n");
> >               return 0;
> >       }
> > -     if (!mread(addr, &instr, sizeof(instr))) {
> > +     if (!mread_instr(addr, &instr)) {
> >               printf("Can't read instruction at address %lx\n", addr);
> >               return 0;
> >       }
> > @@ -2125,6 +2126,21 @@ mwrite(unsigned long adrs, void *buf, int size)
> >       return n;
> >  }
> >
> > +static int
> > +mread_instr(unsigned long adrs, struct ppc_inst *instr)
> > +{
> > +     if (setjmp(bus_error_jmp) == 0) {
> > +             catch_memory_errors = 1;
> > +             sync();
> > +             *instr = ppc_inst_read((struct ppc_inst *)adrs);
> > +             sync();
> > +             /* wait a little while to see if we get a machine check */
> > +             __delay(200);
> > +     }
> > +     catch_memory_errors = 0;
> > +     return ppc_inst_len(*instr);
> > +}
> > +
> >  static int fault_type;
> >  static int fault_except;
> >  static char *fault_chars[] = { "--", "**", "##" };
>
