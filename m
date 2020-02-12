Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F25159DF6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 01:30:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HLCW0GX3zDqLT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 11:30:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=obVA43EK; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HL9R0Yn6zDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 11:28:57 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id j132so312237oih.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mYyV/2pz6mT7R3DN9fPIpssniyZZy55zoFRuDmdee9Y=;
 b=obVA43EK4LsfSMiElzuYIKI/w2uLJjTaeNr5Cjgg00qWkFgD2HB6msfan961rFX0I6
 NrQI5bmDMMywHs8AuQynVbNqWwgvQLf0LRmizHEU7sflGnxe4P3p1W71nJIoOBDmKhEQ
 AAfYkfvEhEceJMsB/cmUu9O0Bm226wtS0CYcd7dDyPqULK5UKNak3vt0M7q5RYaWgfFN
 gYcv2JLH9nDJZbidYrpEVk5lGIS2Ia5binhfVgdaxu3tnbp4GSCuWHbgyoAjVlmIR6XZ
 WV08EzKnnekrgUmmdUT/ePDYMPta3OtcrO51jeYgFNmuI/B0YkeL3bMSavEUKeXgtGPn
 u9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mYyV/2pz6mT7R3DN9fPIpssniyZZy55zoFRuDmdee9Y=;
 b=DvTE1Mzr3DCWPlKZ3BhjZDfSMmk5T/qyVtwPZJdM4x/5HQTRxd880qQ7DwlJTHDcYo
 yZ6731m8dP5XgYmHBqwZNqlW2XWE1rLZpwoHwkIZxiby6y1ARCfTnzpc4NLGS5S6BWrn
 +CkjU7XT7+JXFDLTvW+SgGSRmMHmj1+ofOo+Q7hs27UewgI3dcW53c2Sfw2KhVnu0FrM
 QcYMXP6kBa3ZYrhCCV+013Oko6nbU24ULZisneTYKS9ZYxlhxRI8LidGNyRzfuzdz5d2
 BTnkqVqFhox9A4SuqIK2X9DRPHkXMnKz7XDlayGiUKZYl4VyG4+Jnj44bOvRX3gzJeDS
 yi8w==
X-Gm-Message-State: APjAAAXgowfkbEXLTcoKRzwavQOK1NvJWykdP04LN9SWJ0iAhB0TeK4T
 o4lXuhPi5ncem9lUPQxlCgL5AYH+ZElT1wZDHeU=
X-Google-Smtp-Source: APXvYqylsk9Naqm2vyvBWBR3Wat342DslyBo3i61HraXpCBDTh/mC3Tx2Zh61G+OF3UDxvx3mobqrTXnJLxgXh0Qkus=
X-Received: by 2002:aca:d903:: with SMTP id q3mr4604704oig.12.1581467333559;
 Tue, 11 Feb 2020 16:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20200211053355.21574-1-jniethe5@gmail.com>
 <20200211053355.21574-9-jniethe5@gmail.com>
 <26ce79f5-2003-350d-283a-bfb9ae18b075@c-s.fr>
In-Reply-To: <26ce79f5-2003-350d-283a-bfb9ae18b075@c-s.fr>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 12 Feb 2020 11:28:42 +1100
Message-ID: <CACzsE9o_JoorimVQnfS4ttkAAASnHotd67WvSuJiJ5C-9ENdnA@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] powerpc/xmon: Add initial support for prefixed
 instructions
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

On Tue, Feb 11, 2020 at 5:32 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
>
> Le 11/02/2020 =C3=A0 06:33, Jordan Niethe a =C3=A9crit :
> > A prefixed instruction is composed of a word prefix and a word suffix.
> > It does not make sense to be able to have a breakpoint on the suffix of
> > a prefixed instruction, so make this impossible.
> >
> > When leaving xmon_core() we check to see if we are currently at a
> > breakpoint. If this is the case, the breakpoint needs to be proceeded
> > from. Initially emulate_step() is tried, but if this fails then we need
> > to execute the saved instruction out of line. The NIP is set to the
> > address of bpt::instr[] for the current breakpoint.  bpt::instr[]
> > contains the instruction replaced by the breakpoint, followed by a trap
> > instruction.  After bpt::instr[0] is executed and we hit the trap we
> > enter back into xmon_bpt(). We know that if we got here and the offset
> > indicates we are at bpt::instr[1] then we have just executed out of lin=
e
> > so we can put the NIP back to the instruction after the breakpoint
> > location and continue on.
> >
> > Adding prefixed instructions complicates this as the bpt::instr[1] need=
s
> > to be used to hold the suffix. To deal with this make bpt::instr[] big
> > enough for three word instructions.  bpt::instr[2] contains the trap,
> > and in the case of word instructions pad bpt::instr[1] with a noop.
> >
> > No support for disassembling prefixed instructions.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v2: Rename sufx to suffix
> > ---
> >   arch/powerpc/xmon/xmon.c | 82 ++++++++++++++++++++++++++++++++++-----=
-
> >   1 file changed, 71 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index 897e512c6379..0b085642bbe7 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -97,7 +97,8 @@ static long *xmon_fault_jmp[NR_CPUS];
> >   /* Breakpoint stuff */
> >   struct bpt {
> >       unsigned long   address;
> > -     unsigned int    instr[2];
> > +     /* Prefixed instructions can not cross 64-byte boundaries */
> > +     unsigned int    instr[3] __aligned(64);
> >       atomic_t        ref_count;
> >       int             enabled;
> >       unsigned long   pad;
> > @@ -113,6 +114,7 @@ static struct bpt bpts[NBPTS];
> >   static struct bpt dabr;
> >   static struct bpt *iabr;
> >   static unsigned bpinstr =3D 0x7fe00008;       /* trap */
> > +static unsigned nopinstr =3D 0x60000000;       /* nop */
>
> Use PPC_INST_NOP instead of 0x60000000
>
> And this nopinstr variable will never change. Why not use directly
> PPC_INST_NOP  in the code ?
True, I will do that.
>
> >
> >   #define BP_NUM(bp)  ((bp) - bpts + 1)
> >
> > @@ -120,6 +122,7 @@ static unsigned bpinstr =3D 0x7fe00008;     /* trap=
 */
> >   static int cmds(struct pt_regs *);
> >   static int mread(unsigned long, void *, int);
> >   static int mwrite(unsigned long, void *, int);
> > +static int read_instr(unsigned long, unsigned int *, unsigned int *);
> >   static int handle_fault(struct pt_regs *);
> >   static void byterev(unsigned char *, int);
> >   static void memex(void);
> > @@ -706,7 +709,7 @@ static int xmon_core(struct pt_regs *regs, int from=
ipi)
> >               bp =3D at_breakpoint(regs->nip);
> >               if (bp !=3D NULL) {
> >                       int stepped =3D emulate_step(regs, bp->instr[0],
> > -                                                PPC_NO_SUFFIX);
> > +                                                bp->instr[1]);
> >                       if (stepped =3D=3D 0) {
> >                               regs->nip =3D (unsigned long) &bp->instr[=
0];
> >                               atomic_inc(&bp->ref_count);
> > @@ -761,8 +764,8 @@ static int xmon_bpt(struct pt_regs *regs)
> >
> >       /* Are we at the trap at bp->instr[1] for some bp? */
> >       bp =3D in_breakpoint_table(regs->nip, &offset);
> > -     if (bp !=3D NULL && offset =3D=3D 4) {
> > -             regs->nip =3D bp->address + 4;
> > +     if (bp !=3D NULL && (offset =3D=3D 4 || offset =3D=3D 8)) {
> > +             regs->nip =3D bp->address + offset;
> >               atomic_dec(&bp->ref_count);
> >               return 1;
> >       }
> > @@ -864,7 +867,8 @@ static struct bpt *in_breakpoint_table(unsigned lon=
g nip, unsigned long *offp)
> >               return NULL;
> >       off %=3D sizeof(struct bpt);
> >       if (off !=3D offsetof(struct bpt, instr[0])
> > -         && off !=3D offsetof(struct bpt, instr[1]))
> > +         && off !=3D offsetof(struct bpt, instr[1])
> > +         && off !=3D offsetof(struct bpt, instr[2]))
> >               return NULL;
> >       *offp =3D off - offsetof(struct bpt, instr[0]);
> >       return (struct bpt *) (nip - off);
> > @@ -881,9 +885,18 @@ static struct bpt *new_breakpoint(unsigned long a)
> >
> >       for (bp =3D bpts; bp < &bpts[NBPTS]; ++bp) {
> >               if (!bp->enabled && atomic_read(&bp->ref_count) =3D=3D 0)=
 {
> > +                     /*
> > +                      * Prefixed instructions are two words, but regul=
ar
> > +                      * instructions are only one. Use a nop to pad ou=
t the
> > +                      * regular instructions so that we can place the =
trap
> > +                      * at the same plac. For prefixed instructions th=
e nop
>
> plac =3D=3D> place
thanks.
>
> > +                      * will get overwritten during insert_bpts().
> > +                      */
> >                       bp->address =3D a;
> > -                     bp->instr[1] =3D bpinstr;
> > +                     bp->instr[1] =3D nopinstr;
> >                       store_inst(&bp->instr[1]);
> > +                     bp->instr[2] =3D bpinstr;
> > +                     store_inst(&bp->instr[2]);
> >                       return bp;
>
> Not directly related to this patch, but shouldn't we use
> patch_instruction() instead ?
It does seem like that. I will try that.
>
> >               }
> >       }
> > @@ -895,13 +908,15 @@ static struct bpt *new_breakpoint(unsigned long a=
)
> >   static void insert_bpts(void)
> >   {
> >       int i;
> > -     struct bpt *bp;
> > +     unsigned int prefix;
> > +     struct bpt *bp, *bp2;
> >
> >       bp =3D bpts;
> >       for (i =3D 0; i < NBPTS; ++i, ++bp) {
> >               if ((bp->enabled & (BP_TRAP|BP_CIABR)) =3D=3D 0)
> >                       continue;
> > -             if (mread(bp->address, &bp->instr[0], 4) !=3D 4) {
> > +             if (!read_instr(bp->address, &bp->instr[0],
> > +                            &bp->instr[1])) {
> >                       printf("Couldn't read instruction at %lx, "
> >                              "disabling breakpoint there\n", bp->addres=
s);
> >                       bp->enabled =3D 0;
> > @@ -913,7 +928,34 @@ static void insert_bpts(void)
> >                       bp->enabled =3D 0;
> >                       continue;
> >               }
> > +             /*
> > +              * Check the address is not a suffix by looking for a pre=
fix in
> > +              * front of it.
> > +              */
> > +             if ((mread(bp->address - 4, &prefix, 4) =3D=3D 4) &&
> > +                 IS_PREFIX(prefix)) {
> > +                     printf("Breakpoint at %lx is on the second word o=
f a "
> > +                            "prefixed instruction, disabling it\n",
> > +                            bp->address);
> > +                     bp->enabled =3D 0;
> > +                     continue;
> > +             }
> > +             /*
> > +              * We might still be a suffix - if the prefix has already=
 been
> > +              * replaced by a breakpoint we won't catch it with the ab=
ove
> > +              * test.
> > +              */
> > +             bp2 =3D at_breakpoint(bp->address - 4);
> > +             if (bp2 && IS_PREFIX(bp2->instr[0])) {
> > +                     printf("Breakpoint at %lx is on the second word o=
f a "
> > +                            "prefixed instruction, disabling it\n",
> > +                            bp->address);
> > +                     bp->enabled =3D 0;
> > +                     continue;
> > +             }
> >               store_inst(&bp->instr[0]);
> > +             if (IS_PREFIX(bp->instr[0]))
> > +                     store_inst(&bp->instr[1]);
> >               if (bp->enabled & BP_CIABR)
> >                       continue;
> >               if (patch_instruction((unsigned int *)bp->address,
> > @@ -1164,14 +1206,14 @@ static int do_step(struct pt_regs *regs)
> >    */
> >   static int do_step(struct pt_regs *regs)
> >   {
> > -     unsigned int instr;
> > +     unsigned int instr, suffix;
> >       int stepped;
> >
> >       force_enable_xmon();
> >       /* check we are in 64-bit kernel mode, translation enabled */
> >       if ((regs->msr & (MSR_64BIT|MSR_PR|MSR_IR)) =3D=3D (MSR_64BIT|MSR=
_IR)) {
> > -             if (mread(regs->nip, &instr, 4) =3D=3D 4) {
> > -                     stepped =3D emulate_step(regs, instr, PPC_NO_SUFF=
IX);
> > +             if (read_instr(regs->nip, &instr, &suffix)) {
> > +                     stepped =3D emulate_step(regs, instr, suffix);
> >                       if (stepped < 0) {
> >                               printf("Couldn't single-step %s instructi=
on\n",
> >                                      (IS_RFID(instr)? "rfid": "mtmsrd")=
);
> > @@ -2130,6 +2172,24 @@ mwrite(unsigned long adrs, void *buf, int size)
> >       return n;
> >   }
> >
> > +static int read_instr(unsigned long addr, unsigned int *instr,
> > +                   unsigned int *suffix)
> > +{
>
> Don't know if it is worth it, but wouldn't it be better to define a
> mread_inst() based on mread() instead of doing something that chain
> calls to mread()
I will give it go.
>
> > +     int r;
> > +
> > +     r =3D mread(addr, instr, 4);
> > +     if (r !=3D 4)
> > +             return 0;
> > +     if (!IS_PREFIX(*instr))
> > +             return 4;
> > +     r =3D mread(addr + 4, suffix, 4);
> > +     if (r !=3D 4)
> > +             return 0;
> > +
> > +     return 8;
> > +}
> > +
> > +
> >   static int fault_type;
> >   static int fault_except;
> >   static char *fault_chars[] =3D { "--", "**", "##" };
> >
>
> Christophe
