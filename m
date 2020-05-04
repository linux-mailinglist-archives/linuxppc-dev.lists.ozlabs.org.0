Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 430EB1C3264
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 07:54:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FsWh2RPvzDqkw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 15:54:56 +1000 (AEST)
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
 header.s=20161025 header.b=OuewZy2f; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FsTh2r8GzDqb0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 15:53:10 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id g14so7927831otg.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 May 2020 22:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ifGtX6ihY0zLRUO60o9E6W0hkSMUJpxcoYuX++zzNVY=;
 b=OuewZy2fCh7HhwW55PhdsKgETzsNz1+BSqaRmd3sIQMVhh8WVKYCo2Z5e2RpvgZkGO
 O2If1tHtiWMsmB7BNJr7KorrRR2Zda5DJZk47xJewzgDzjUVviByocSgvUQ6RS3tm4gt
 mUk8Ro8hPZCS/FwjfCvRpYoUSHqHgHwjJnc22meVF4phMPvQmcJJ6HX8G0sxaY4t8T7t
 MfHcmY5MUHNwSnlPqJd0KYH+hg0zhHmmy+pRSqsJzjkl9wSxzakktnXXmrOrbmntNC8r
 yeQKtutTkcAUQNKTebjMdvy4WNVIK/FeDW67nLZ8qjbrw+Z2IfKITVM9/R0jaY8fCfU8
 7FaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ifGtX6ihY0zLRUO60o9E6W0hkSMUJpxcoYuX++zzNVY=;
 b=oEe2eFSLrHQzNH3TJDpsxaDHbueuQfc9KW41EAozg/4KLkUFh7/rAMspwr3EgSH0Pt
 kM+Hsk1gKCBd0mVzehNABy2Pm8R0B2Ec4MIZ0/tFR8beqXv9vb6Y58vw4Rk26qV/hPuw
 OitciHTSMo3x7lHvyKe/BNurxiHu0avCuSi5yH3GvqeEZ65EBrSZbwCqqj10FT8EMcrL
 gu0IV3E6OGXlArvu1A5Gmg35HD1wgBImzNRqsD31XnF6rL+mOej7UfSmttWjD1DBpDbW
 ywHqAQ0TqECmwlT7ugJhbvnD5pouB13rMMlDSeKyC60v9u852rs6ubWIfs2sZ1OEE+8d
 eo5A==
X-Gm-Message-State: AGi0Pua+Givuq62hrkfs53RFIzC4TTCZgk6zg3ufJgBri3xj1bViY9nb
 0rEEfeREK5mOxwj8lUIJmDX/BFCjMPYTykMlKio=
X-Google-Smtp-Source: APiQypJdIAZi5O1PE+lGMKd373tFd5RwjSJKCG6+N4rEOaq3/IEorZ0T1YB20SptMfE+Gv7XLQdSf3Xb9vUjq7KyXIE=
X-Received: by 2002:a9d:4806:: with SMTP id c6mr12713119otf.51.1588571586883; 
 Sun, 03 May 2020 22:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200501034220.8982-1-jniethe5@gmail.com>
 <20200501034220.8982-3-jniethe5@gmail.com>
 <2060873.nxaIYQu1l1@townsend>
In-Reply-To: <2060873.nxaIYQu1l1@townsend>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 4 May 2020 15:52:55 +1000
Message-ID: <CACzsE9o9zF670T0y7tUsWnuk75ycwFXW+MjA0d050sS3uvZ8-w@mail.gmail.com>
Subject: Re: [PATCH v7 02/28] powerpc/xmon: Move breakpoint instructions to
 own array
To: Alistair Popple <alistair@popple.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Balamuruhan S <bala24@linux.ibm.com>,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 4, 2020 at 3:41 PM Alistair Popple <alistair@popple.id.au> wrote:
>
> On Friday, 1 May 2020 1:41:54 PM AEST Jordan Niethe wrote:
> > To execute an instruction out of line after a breakpoint, the NIP is set
> > to the address of struct bpt::instr. Here a copy of the instruction that
> > was replaced with a breakpoint is kept, along with a trap so normal flow
> > can be resumed after XOLing. The struct bpt's are located within the
> > data section. This is problematic as the data section may be marked as
> > no execute.
> >
> > Instead of each struct bpt holding the instructions to be XOL'd, make a
> > new array, bpt_table[], with enough space to hold instructions for the
> > number of supported breakpoints. A later patch will move this to the
> > text section.
> > Make struct bpt::instr a pointer to the instructions in bpt_table[]
> > associated with that breakpoint. This association is a simple mapping:
> > bpts[n] -> bpt_table[n * words per breakpoint]. Currently we only need
> > the copied instruction followed by a trap, so 2 words per breakpoint.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v4: New to series
> > v5: - Do not use __section(), use a .space directive in .S file
> >     - Simplify in_breakpoint_table() calculation
> >     - Define BPT_SIZE
> > v6: - Seperate moving to text section
> > ---
> >  arch/powerpc/xmon/xmon.c | 21 ++++++++++++---------
> >  1 file changed, 12 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index f91ae2c9adbe..6ba7f66c1dd0 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -98,7 +98,7 @@ static long *xmon_fault_jmp[NR_CPUS];
> >  /* Breakpoint stuff */
> >  struct bpt {
> >       unsigned long   address;
> > -     unsigned int    instr[2];
> > +     unsigned int    *instr;
> >       atomic_t        ref_count;
> >       int             enabled;
> >       unsigned long   pad;
> > @@ -117,6 +117,10 @@ static unsigned bpinstr = 0x7fe00008;    /* trap */
> >
> >  #define BP_NUM(bp)   ((bp) - bpts + 1)
> >
> > +#define BPT_SIZE       (sizeof(unsigned int) * 2)
> > +#define BPT_WORDS      (BPT_SIZE / sizeof(unsigned int))
>
> Minor nit-pick but IMHO this would be more logical if you defined BPT_WORDS
> first like so:
>
> #define BPT_WORDS      (2)
> #define BPT_SIZE       (sizeof(unsigned int) * BPT_WORDS)
>
> Otherwise this looks good and I think the offset calculations below are correct
> so:
What I was thinking was BPT_SIZE  would later be defined in terms the
instruction type and by doing it this way
 BPT_WORDS  would be correct for the the instruction type if like on
ppc32, it did not include a suffix.
>
> Reviewed-by: Alistair Popple <alistair@popple.id.au>
>
> > +static unsigned int bpt_table[NBPTS * BPT_WORDS];
> > +
> >  /* Prototypes */
> >  static int cmds(struct pt_regs *);
> >  static int mread(unsigned long, void *, int);
> > @@ -854,15 +858,13 @@ static struct bpt *in_breakpoint_table(unsigned long
> > nip, unsigned long *offp) {
> >       unsigned long off;
> >
> > -     off = nip - (unsigned long) bpts;
> > -     if (off >= sizeof(bpts))
> > +     off = nip - (unsigned long) bpt_table;
> > +     if (off >= sizeof(bpt_table))
> >               return NULL;
> > -     off %= sizeof(struct bpt);
> > -     if (off != offsetof(struct bpt, instr[0])
> > -         && off != offsetof(struct bpt, instr[1]))
> > +     *offp = off % BPT_SIZE;
> > +     if (*offp != 0 && *offp != 4)
> >               return NULL;
> > -     *offp = off - offsetof(struct bpt, instr[0]);
> > -     return (struct bpt *) (nip - off);
> > +     return bpts + (off / BPT_SIZE);
> >  }
> >
> >  static struct bpt *new_breakpoint(unsigned long a)
> > @@ -877,7 +879,8 @@ static struct bpt *new_breakpoint(unsigned long a)
> >       for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
> >               if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
> >                       bp->address = a;
> > -                     patch_instruction(&bp->instr[1], bpinstr);
> > +                     bp->instr = bpt_table + ((bp - bpts) * BPT_WORDS);
> > +                     patch_instruction(bp->instr + 1, bpinstr);
> >                       return bp;
> >               }
> >       }
>
>
>
>
