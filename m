Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B91B31903C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 04:04:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mbgP3fDHzDqdR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 14:04:01 +1100 (AEDT)
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
 header.s=20161025 header.b=O7ZR7ZDV; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mbZL6YmjzDqSW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 13:59:38 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id w2so6121827oic.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 19:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jg/wuF54R1lMtZbZkXdwLoqb4GPIfWAHIj18g4l1K64=;
 b=O7ZR7ZDVd5oOWY3pcgNw2eNGka+9scQEJIdacBp2BjBbRMDHJbN3bmxvlXH9tbKV0J
 YL/2oLDTxgmQrqXWfNOmSdA1ZiMFVx22gHnbzVKE3LHL7OWLiwUtcCrD7XdDT8PFQboB
 CbAuiso62c90MJjOZF6F1FDycCCdUVb0JnvzhL8IfUxMD36G2NwXFjBP8jdy2vw0Qztv
 bkvF8HUZyYvhDekuPrWCze91TRcXBvwkbx3o0fp6D2hjkd6hCLVCH3nP2tmm3Ezq7lF4
 H62O7U1dULewRItcxR789JXsmrSEPSOAs7YX4471IeX8yARk40n0POdKQyhlgtvdIZgv
 MRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jg/wuF54R1lMtZbZkXdwLoqb4GPIfWAHIj18g4l1K64=;
 b=JtaIW6pHdutL8visVM3IjfE6IphemTnf7p+AAHtBfr0y5XAsXB62mSMDGeFHSzK15o
 lqQW8Q7tFNMjZbnVZOunzqGVrTrTPWSdJRDoJzjCAmfkbSR1Th4ICcPs9ZcFFJOCmQj5
 vA9HhIlrILYkhfwMsIdzK8ioBl8ugp862bPI0J8xUgIbqKSL3bE8jrN99lVa26kB1SXq
 z14/cnSQk31Piu66DEcEwHgZygIb1a1Xj9rbH8xHqwLgeHYe3zTnO6PXsRTeqznqbL90
 Q9tVvWfOhD/56hPfoCzsQJpxT6LDCJp0esdxif31lprojxyPbCoZ4QXLc0GXLuBS7D6t
 X3xA==
X-Gm-Message-State: ANhLgQ14spqrUkpTZgzlzQQHSTWgzj4CI1kh3mqi8wFu/KPXBYK4luHP
 kUhO3f+emwyIdIgl83rfGEV7eR8FaU43nN9+wgk7xKnQn9w=
X-Google-Smtp-Source: ADFU+vuAqyYqgNSTpE2ERuBF6p8qzrt6dq4Zh2a0xcpoHirr/B8XgwItrbse9+bvG5y+toYOamDHG8DsxxI1nluphWY=
X-Received: by 2002:aca:fd48:: with SMTP id b69mr1858105oii.126.1585018773531; 
 Mon, 23 Mar 2020 19:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <1584944279.gvl0lg5dde.astroid@bobo.none>
 <CACzsE9r5uvL-zp34VrCqO_RTEsXPbLrt2iu+MHL-apapydOugA@mail.gmail.com>
 <1584957138.lj5a68bk6x.astroid@bobo.none>
 <CACzsE9qrNpfvoLKfdeXths4rKJ8jQcUic3=dFZ57ntogdeaMug@mail.gmail.com>
In-Reply-To: <CACzsE9qrNpfvoLKfdeXths4rKJ8jQcUic3=dFZ57ntogdeaMug@mail.gmail.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 24 Mar 2020 13:59:22 +1100
Message-ID: <CACzsE9pXyjK6CGUtwMKY8zr93adFRhi8afzVgATLJPhQsZBn4A@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] Initial Prefixed Instruction support
To: Nicholas Piggin <npiggin@gmail.com>
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
 Balamuruhan S <bala24@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 24, 2020 at 1:54 PM Jordan Niethe <jniethe5@gmail.com> wrote:
>
> On Mon, Mar 23, 2020 at 9:21 PM Nicholas Piggin <npiggin@gmail.com> wrote:
> >
> > Jordan Niethe's on March 23, 2020 7:25 pm:
> > > On Mon, Mar 23, 2020 at 5:22 PM Nicholas Piggin <npiggin@gmail.com> wrote:
> > >>
> > >> Jordan Niethe's on March 20, 2020 3:17 pm:
> > >> > A future revision of the ISA will introduce prefixed instructions. A
> > >> > prefixed instruction is composed of a 4-byte prefix followed by a
> > >> > 4-byte suffix.
> > >> >
> > >> > All prefixes have the major opcode 1. A prefix will never be a valid
> > >> > word instruction. A suffix may be an existing word instruction or a
> > >> > new instruction.
> > >> >
> > >> > This series enables prefixed instructions and extends the instruction
> > >> > emulation to support them. Then the places where prefixed instructions
> > >> > might need to be emulated are updated.
> > >> >
> > >> > The series is based on top of:
> > >> > https://patchwork.ozlabs.org/patch/1232619/ as this will effect
> > >> > kprobes.
> > >> >
> > >> > v4 is based on feedback from Nick Piggins, Christophe Leroy and Daniel Axtens.
> > >> > The major changes:
> > >> >     - Move xmon breakpoints from data section to text section
> > >> >     - Introduce a data type for instructions on powerpc
> > >>
> > >> Thanks for doing this, looks like a lot of work, I hope it works out :)
> > >>
> > > Yes it did end up touching a lot of places. I started thinking that
> > > that maybe it would be simpler to just use a u64 instead of the struct
> > > for  instructions.
> > > If we always keep the word instruction / prefix in the lower bytes,
> > > all of the current masking should still work and we can use operators
> > > again instead of ppc_inst_equal(), etc.
> >
> > Yeah.. I think now that you've done it, I prefer it this way.
> Sorry, just to be clear which way do you mean?
> >
> > > It also makes printing easier. We could just #define INST_FMT %llx or
> > > #define INST_FMT %x on powerpc32 and use that for printing out
> > > instructions.
> >
> > Well, not sure about that. Would it make endian concerns more
> > complicated? Print format for prefix might be '%016llx', but we
> > don't want that for all instructions only prefixed ones, and I
> > don't know if that is the way to go either.
> Hm yeah that is true.
> >
> > We'll want to adopt some convention for displaying prefixed
> > instruction bytes, but I don't know what what works best. I wonder
> > if binutils or any userspace tools have a convention.
> binutils-gdb upstream has supports disassembling prefixed instructions.
> Here is what objdump looks like:
>   44:    00 00 00 60     nop
>   48:    00 00 00 07     pnop
>   4c:    00 00 00 00
>   50:    01 00 20 39     li      r9,1
>   54:    00 00 00 06     paddi   r4,r9,3
>   58:    03 00 89 38
>   5c:    00 00 62 3c     addis   r3,r2,0
And this is what it looks like if you use objdump with -w
  44:    00 00 00 60     nop
  48:    00 00 00 07 00 00 00 00     pnop
  50:    01 00 20 39                 li      r9,1
  54:    00 00 00 06 03 00 89 38     paddi   r4,r9,3
  5c:    00 00 62 3c                 addis   r3,r2,0    5c:
R_PPC64_TOC16_HA    .toc+0x10

> >
> > Which reminds me, you might have missed show_instructions()?
> > Although maybe you don't need that until we start using them in
> > the kernel.
> You are right I missed that here.
> >
> > Thanks,
> > Nick
