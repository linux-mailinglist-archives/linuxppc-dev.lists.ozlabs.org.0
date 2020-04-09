Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A203C1A3005
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 09:29:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yXpr3hDXzDqNf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 17:29:56 +1000 (AEST)
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
 header.s=20161025 header.b=MkhkHGDd; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yXkv0cyGzDqSy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 17:26:30 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id k9so2406088oia.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Apr 2020 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yS8aeiWPVsHNKO86n3nvrzOW10hdRvdcA3GVUjF3jPE=;
 b=MkhkHGDdRo8HmnVkpY6DnTH2C9yaHke85pCN7XrWg9MBa+apzlvUO1SyLB0lEGwH+a
 zJMdKAoBPy/c05e65nDQw8OFhNgOsKjkwTTYEGdyzQAQ1jS/8PhIuetA/ILFxflibEUT
 WqyMvLW8QhZ9Jvitvki0LrGcnYZRmIpy5jjnlhO82IQWc1fYAsiPVZPDzODrdavIiXPI
 qrTEQpXm66ghTye6vrx8JUGfOcvLEc5CpI41r+26YYkPDFfXIlj7Kh1ZqPcI6QN+DEvs
 KmMeFYlaTj1+MbeAK3m1dsguHop8GaH1ijzFU69YLqjb24Cs/cL57l9idQ6CMG3IxGX7
 cqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yS8aeiWPVsHNKO86n3nvrzOW10hdRvdcA3GVUjF3jPE=;
 b=VgWtssveWqmsx5sXFJJ8WCtGnkWhrVZB0X7tXSPWxgdAYSP1kBQ93ke7LtmdVR9m/6
 XtJqnY7dfdefGhubjI30aVuurmPPlb24Je1K3KNV6XpLbAQRHN3z9bnlI6Q7pZj26LZD
 xtXnR6uSD3GFVTHp1qff7qSxpyLPDAwMv+GwBlX2dO6q5PJHrE6hMCFPvws9cklr9CrO
 Ci2QkWo17jHkVCfi6Duig/LyKNokNCxDyDk8pGoYIlqTycJ4Zi2/Xcj+6gN0kOzSpc5R
 KuMeMk28268Sv3iJ4xDB433zIcRUvolL0Jk4CQmjI/0r1m/KjaT/jSxD0az67/0l8quY
 mkIw==
X-Gm-Message-State: AGi0PuYB1PpJZxrMBVLLw8lY6Cika7/6TD7YYZlakTe2Jp38HZ58vMLi
 Dt0XPIJpVOZyljMVO8070xrzbFf1+mC3XSIgPXo=
X-Google-Smtp-Source: APiQypKfQcQC4Y6PvLnai1KT2mOYUeuaowAg/umNba6X0HeUBBfGgoTpmEE1ueE7dkva7pHq9s5zdQ9HkPVY8fh0GGo=
X-Received: by 2002:aca:fd48:: with SMTP id b69mr5201358oii.126.1586417185987; 
 Thu, 09 Apr 2020 00:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-3-jniethe5@gmail.com>
 <a6adbfc6-a715-99aa-25ac-7a36b3804b82@c-s.fr>
In-Reply-To: <a6adbfc6-a715-99aa-25ac-7a36b3804b82@c-s.fr>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 9 Apr 2020 17:26:13 +1000
Message-ID: <CACzsE9pRkDSm5nKPN=5rdnp2s+zdpqtaZhip1OGsgKbHrxD5GQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/21] powerpc/xmon: Move out-of-line instructions to
 text section
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

On Thu, Apr 9, 2020 at 4:11 PM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
>
>
>
> Le 06/04/2020 =C3=A0 10:09, Jordan Niethe a =C3=A9crit :
> > To execute an instruction out of line after a breakpoint, the NIP is se=
t
> > to the address of struct bpt::instr. Here a copy of the instruction tha=
t
> > was replaced with a breakpoint is kept, along with a trap so normal flo=
w
> > can be resumed after XOLing. The struct bpt's are located within the
> > data section. This is problematic as the data section may be marked as
> > no execute.
> >
> > Instead of each struct bpt holding the instructions to be XOL'd, make a
> > new array, bpt_table[], with enough space to hold instructions for the
> > number of supported breakpoints. Place this array in the text section.
> > Make struct bpt::instr a pointer to the instructions in bpt_table[]
> > associated with that breakpoint. This association is a simple mapping:
> > bpts[n] -> bpt_table[n * words per breakpoint]. Currently we only need
> > the copied instruction followed by a trap, so 2 words per breakpoint.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v4: New to series
> > v5: - Do not use __section(), use a .space directive in .S file
>
> I was going to comment to use __section() instead of creating a
> dedicated .S file.
>
> Why did you change that in v5 ?
I noticed with some toolchains I was getting this message:
Warning: setting incorrect section attributes for .text.xmon_bpts
I was talking with mpe about it and he said that the usual way for
doing things like this was with .space in a .S file so I changed to
that way.
>
> >      - Simplify in_breakpoint_table() calculation
> >      - Define BPT_SIZE
> > ---
> >   arch/powerpc/xmon/Makefile    |  2 +-
> >   arch/powerpc/xmon/xmon.c      | 23 +++++++++++++----------
> >   arch/powerpc/xmon/xmon_bpts.S |  8 ++++++++
> >   arch/powerpc/xmon/xmon_bpts.h |  8 ++++++++
> >   4 files changed, 30 insertions(+), 11 deletions(-)
> >   create mode 100644 arch/powerpc/xmon/xmon_bpts.S
> >   create mode 100644 arch/powerpc/xmon/xmon_bpts.h
> >
> > diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> > index c3842dbeb1b7..515a13ea6f28 100644
> > --- a/arch/powerpc/xmon/Makefile
> > +++ b/arch/powerpc/xmon/Makefile
> > @@ -21,7 +21,7 @@ endif
> >
> >   ccflags-$(CONFIG_PPC64) :=3D $(NO_MINIMAL_TOC)
> >
> > -obj-y                        +=3D xmon.o nonstdio.o spr_access.o
> > +obj-y                        +=3D xmon.o nonstdio.o spr_access.o xmon_=
bpts.o
> >
> >   ifdef CONFIG_XMON_DISASSEMBLY
> >   obj-y                       +=3D ppc-dis.o ppc-opc.o
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index 02e3bd62cab4..049375206510 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -62,6 +62,7 @@
> >
> >   #include "nonstdio.h"
> >   #include "dis-asm.h"
> > +#include "xmon_bpts.h"
> >
> >   #ifdef CONFIG_SMP
> >   static cpumask_t cpus_in_xmon =3D CPU_MASK_NONE;
> > @@ -97,7 +98,7 @@ static long *xmon_fault_jmp[NR_CPUS];
> >   /* Breakpoint stuff */
> >   struct bpt {
> >       unsigned long   address;
> > -     unsigned int    instr[2];
> > +     unsigned int    *instr;
> >       atomic_t        ref_count;
> >       int             enabled;
> >       unsigned long   pad;
> > @@ -108,7 +109,6 @@ struct bpt {
> >   #define BP_TRAP             2
> >   #define BP_DABR             4
> >
> > -#define NBPTS        256
> >   static struct bpt bpts[NBPTS];
> >   static struct bpt dabr;
> >   static struct bpt *iabr;
> > @@ -116,6 +116,10 @@ static unsigned bpinstr =3D 0x7fe00008;    /* trap=
 */
> >
> >   #define BP_NUM(bp)  ((bp) - bpts + 1)
> >
> > +#define BPT_SIZE     (sizeof(unsigned int) * 2)
> > +#define BPT_WORDS    (BPT_SIZE / sizeof(unsigned int))
>
> Wouldn't it make more sense to do the following ? :
>
> #define BPT_WORDS       2
> #define BPT_SIZE        (BPT_WORDS * sizeof(unsigned int))
I defined it like that so when we changed unsigned int -> struct
ppc_inst it would be the correct size whether or not the struct
included a suffix.
Otherwise it would be more straightforward to do it like that.
>
> > +extern unsigned int bpt_table[NBPTS * BPT_WORDS];
>
> Should go in xmon_bpts.h if we keep the definition in xmon_bpts.S
Right.
>
> > +
> >   /* Prototypes */
> >   static int cmds(struct pt_regs *);
> >   static int mread(unsigned long, void *, int);
> > @@ -853,15 +857,13 @@ static struct bpt *in_breakpoint_table(unsigned l=
ong nip, unsigned long *offp)
> >   {
> >       unsigned long off;
> >
> > -     off =3D nip - (unsigned long) bpts;
> > -     if (off >=3D sizeof(bpts))
> > +     off =3D nip - (unsigned long) bpt_table;
> > +     if (off >=3D sizeof(bpt_table))
> >               return NULL;
> > -     off %=3D sizeof(struct bpt);
> > -     if (off !=3D offsetof(struct bpt, instr[0])
> > -         && off !=3D offsetof(struct bpt, instr[1]))
> > +     *offp =3D off % BPT_SIZE;
>
> Can we use logical operation instead ?
Sure, I was just adapting how it was already but that would probably be cle=
arer.
>
>         *offp =3D off & (BPT_SIZE - 1);
>
> > +     if (*offp !=3D 0 && *offp !=3D 4)
>
> Could be:
>         if (off & 3)
>
> >               return NULL;
> > -     *offp =3D off - offsetof(struct bpt, instr[0]);
> > -     return (struct bpt *) (nip - off);
> > +     return bpts + (off / BPT_SIZE);
> >   }
> >
> >   static struct bpt *new_breakpoint(unsigned long a)
> > @@ -876,7 +878,8 @@ static struct bpt *new_breakpoint(unsigned long a)
> >       for (bp =3D bpts; bp < &bpts[NBPTS]; ++bp) {
> >               if (!bp->enabled && atomic_read(&bp->ref_count) =3D=3D 0)=
 {
> >                       bp->address =3D a;
> > -                     patch_instruction(&bp->instr[1], bpinstr);
> > +                     bp->instr =3D bpt_table + ((bp - bpts) * BPT_WORD=
S);
> > +                     patch_instruction(bp->instr + 1, bpinstr);
> >                       return bp;
> >               }
> >       }
> > diff --git a/arch/powerpc/xmon/xmon_bpts.S b/arch/powerpc/xmon/xmon_bpt=
s.S
> > new file mode 100644
> > index 000000000000..ebb2dbc70ca8
> > --- /dev/null
> > +++ b/arch/powerpc/xmon/xmon_bpts.S
> > @@ -0,0 +1,8 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#include <asm/ppc_asm.h>
> > +#include <asm/asm-compat.h>
> > +#include "xmon_bpts.h"
> > +
> > +.global bpt_table
> > +bpt_table:
> > +     .space NBPTS * 8
>
> Should use BPT_SIZE instead of raw coding 8.
Right.
>
> > diff --git a/arch/powerpc/xmon/xmon_bpts.h b/arch/powerpc/xmon/xmon_bpt=
s.h
> > new file mode 100644
> > index 000000000000..840e70be7945
> > --- /dev/null
> > +++ b/arch/powerpc/xmon/xmon_bpts.h
> > @@ -0,0 +1,8 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef XMON_BPTS_H
> > +#define XMON_BPTS_H
> > +
> > +#define NBPTS        256
> > +
> > +#endif /* XMON_BPTS_H */
> > +
> >
>
> I think it would be better to split this patch in two patches:
> 1/ First patch to move breakpoints out of struct bpt into a bpt_table.
> 2/ Second patch to move bpt_table into .text section.
Bala suggested so too, I will separate them next time.
>
> Christophe
