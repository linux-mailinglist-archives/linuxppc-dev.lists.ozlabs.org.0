Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE76C1A2EBD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 07:16:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yTrs5T3qzDqXf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 15:16:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OHeYxB8J; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yTpx1z18zDqRF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 15:14:48 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id m14so2240058oic.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Apr 2020 22:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=USRTaawcSZMYxLQ5STzI8B+VUl0fx9Vfj7Q6h2YHQZY=;
 b=OHeYxB8JjTf+1d/HAm6FEOdZdY9e0ZvW7YqaW4mM56ukTA8K1BtpJrgqwR+6YZmLz4
 S65Mx4X9T+MfU6BlodAErveSJKz5jIt57NArel3Uq6QPGDddbgAN5SWnJ5NmS5ve09qQ
 wI4za+r3SmR66lBfdLsWaRZaQ+DZrQzCVgU3WWGSLOxXZ6jqsxzQebWAyTdrBytNzrXp
 TqRLudxB3XUGW9pd1WGuJGgZWG9hyvXF83DVjup6ClsQU78w1VGfv9EiwbDZnrQtRLim
 KAB0klfff81BOAPPXM68VHtPNnQ7AcV621/ypKhe4UdfiTTvmcbDIYr64hFLxV5E0yIK
 no4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=USRTaawcSZMYxLQ5STzI8B+VUl0fx9Vfj7Q6h2YHQZY=;
 b=II4WkMzYcMDEOCQJgcv7zk0O0pItiAeMWEypyqrcxWHqhydVgyd7jLSrrzm8cvR1D3
 ZwDxtU9VYjtD2RE2H2E/oeOxeIircX17mObCIcdd639VngnWVQq74gqhMDt73M9g/2If
 rkE9wtS+qtl0z5gne738AGIeUKNnZcOAOcLsyJxGpvSbNp92HJVMOogPptvD/W/sqpd4
 CHS5mUeg6wXcUwfgzizLpraXf3Zw5JlXQg8+VB4YM5fhUIQzft9gjiSpPefwRXK/Cd/w
 T1SAn4C6w2CsOn3+MSMfi5T5KokKZ8N1qpkDmY8yCxFu+UmPSBjTINRzdLq72NgZ8sBc
 LmaQ==
X-Gm-Message-State: AGi0PuavyUhdPICTKWeS3XzTNaUpK9sRzCeOoB1lncYTWKAk0Y3jlS+Z
 /uE2+1K586al1B37u0VUfe3wy2LPN+pAlKiP/fs=
X-Google-Smtp-Source: APiQypLcByctG+3og2rIUGlcJGE/Xd4+HgnZ3+TiUiv44Z3mEhqrTE7dRinewsPuxUKWmYG/AwbUzI34iCOHDBcgcHo=
X-Received: by 2002:aca:d68a:: with SMTP id n132mr5289570oig.40.1586409285323; 
 Wed, 08 Apr 2020 22:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-14-jniethe5@gmail.com>
 <ff7df8a41dc80faaa020754b5eaafe81a6e745b9.camel@linux.ibm.com>
 <CACzsE9r8hAKGwN1reVo00UfO5UiONo2GpUdMsNgqgAJa=LDbSg@mail.gmail.com>
 <1e58ff6f13a8fe730c57a73ac0d7b0548277d17c.camel@linux.ibm.com>
In-Reply-To: <1e58ff6f13a8fe730c57a73ac0d7b0548277d17c.camel@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 9 Apr 2020 15:14:34 +1000
Message-ID: <CACzsE9rRFkmXpt=Z31=i6o4skFZuR5Y95=Ri9x0+pDSSZLTEAg@mail.gmail.com>
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

On Thu, Apr 9, 2020 at 3:04 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
>
> On Wed, 2020-04-08 at 12:18 +1000, Jordan Niethe wrote:
> > On Tue, Apr 7, 2020 at 9:31 PM Balamuruhan S <bala24@linux.ibm.com> wrote:
> > > On Mon, 2020-04-06 at 18:09 +1000, Jordan Niethe wrote:
> > > > Currently in xmon, mread() is used for reading instructions. In
> > > > preparation for prefixed instructions, create and use a new function,
> > > > mread_instr(), especially for reading instructions.
> > > >
> > > > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > > > ---
> > > > v5: New to series, seperated from "Add prefixed instructions to
> > > > instruction data type"
> > > > ---
> > > >  arch/powerpc/xmon/xmon.c | 24 ++++++++++++++++++++----
> > > >  1 file changed, 20 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > > > index 5e3949322a6c..6f4cf01a58c1 100644
> > > > --- a/arch/powerpc/xmon/xmon.c
> > > > +++ b/arch/powerpc/xmon/xmon.c
> > > > @@ -125,6 +125,7 @@ extern unsigned int bpt_table[NBPTS * BPT_WORDS];
> > > >  static int cmds(struct pt_regs *);
> > > >  static int mread(unsigned long, void *, int);
> > > >  static int mwrite(unsigned long, void *, int);
> > > > +static int mread_instr(unsigned long, struct ppc_inst *);
> > > >  static int handle_fault(struct pt_regs *);
> > > >  static void byterev(unsigned char *, int);
> > > >  static void memex(void);
> > > > @@ -899,7 +900,7 @@ static void insert_bpts(void)
> > > >       for (i = 0; i < NBPTS; ++i, ++bp) {
> > > >               if ((bp->enabled & (BP_TRAP|BP_CIABR)) == 0)
> > > >                       continue;
> > > > -             if (mread(bp->address, &instr, 4) != 4) {
> > > > +             if (!mread_instr(bp->address, &instr)) {
> > >
> > > Are these checks made based on whether `ppc_inst_len()` returns bool from
> > > mread_instr() ?
> > No, it was meant to be the length itself returned with a length of 0
> > indicating an error. I will need to fix that.
>
>
> I doubt it would return 0, whether we read instruction or not ppc_inst_len()
> would always return sizeof(struct ppc_inst).
Yes, sorry I meant I would have to change the function so that it
would return 0.
>
> can we do something like,
>
> static int
> mread_instr(unsigned long adrs, struct ppc_inst *instr)
> {
>         int size = 0;
>         if (setjmp(bus_error_jmp) == 0) {
>                 catch_memory_errors = 1;
>                 sync();
>                 *instr = ppc_inst_read((struct ppc_inst *)adrs);
>                 sync();
>                 /* wait a little while to see if we get a machine check */
>                 __delay(200);
>                 size = ppc_inst_len(instr);
>         }
>         catch_memory_errors = 0;
>         return size;
> }
Yeah that looks right.
>
> -- Bala
> > > -- Bala
> > >
> > >
> > > >                       printf("Couldn't read instruction at %lx, "
> > > >                              "disabling breakpoint there\n", bp-
> > > > >address);
> > > >                       bp->enabled = 0;
> > > > @@ -949,7 +950,7 @@ static void remove_bpts(void)
> > > >       for (i = 0; i < NBPTS; ++i, ++bp) {
> > > >               if ((bp->enabled & (BP_TRAP|BP_CIABR)) != BP_TRAP)
> > > >                       continue;
> > > > -             if (mread(bp->address, &instr, 4) == 4
> > > > +             if (mread_instr(bp->address, &instr)
> > > >                   && ppc_inst_equal(instr, ppc_inst(bpinstr))
> > > >                   && patch_instruction(
> > > >                       (struct ppc_inst *)bp->address, ppc_inst_read(bp-
> > > > > instr)) != 0)
> > > > @@ -1165,7 +1166,7 @@ static int do_step(struct pt_regs *regs)
> > > >       force_enable_xmon();
> > > >       /* check we are in 64-bit kernel mode, translation enabled */
> > > >       if ((regs->msr & (MSR_64BIT|MSR_PR|MSR_IR)) == (MSR_64BIT|MSR_IR))
> > > > {
> > > > -             if (mread(regs->nip, &instr, 4) == 4) {
> > > > +             if (mread_instr(regs->nip, &instr)) {
> > > >                       stepped = emulate_step(regs, instr);
> > > >                       if (stepped < 0) {
> > > >                               printf("Couldn't single-step %s
> > > > instruction\n",
> > > > @@ -1332,7 +1333,7 @@ static long check_bp_loc(unsigned long addr)
> > > >               printf("Breakpoints may only be placed at kernel
> > > > addresses\n");
> > > >               return 0;
> > > >       }
> > > > -     if (!mread(addr, &instr, sizeof(instr))) {
> > > > +     if (!mread_instr(addr, &instr)) {
> > > >               printf("Can't read instruction at address %lx\n", addr);
> > > >               return 0;
> > > >       }
> > > > @@ -2125,6 +2126,21 @@ mwrite(unsigned long adrs, void *buf, int size)
> > > >       return n;
> > > >  }
> > > >
> > > > +static int
> > > > +mread_instr(unsigned long adrs, struct ppc_inst *instr)
> > > > +{
> > > > +     if (setjmp(bus_error_jmp) == 0) {
> > > > +             catch_memory_errors = 1;
> > > > +             sync();
> > > > +             *instr = ppc_inst_read((struct ppc_inst *)adrs);
> > > > +             sync();
> > > > +             /* wait a little while to see if we get a machine check */
> > > > +             __delay(200);
> > > > +     }
> > > > +     catch_memory_errors = 0;
> > > > +     return ppc_inst_len(*instr);
> > > > +}
> > > > +
> > > >  static int fault_type;
> > > >  static int fault_except;
> > > >  static char *fault_chars[] = { "--", "**", "##" };
>
