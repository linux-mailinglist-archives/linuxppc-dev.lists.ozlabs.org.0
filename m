Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CAF170D14
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 01:13:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SY711NZYzDqcX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 11:13:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TjZyKbZP; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SY4x6mS7zDqbX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 11:12:01 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id r16so1282298otd.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 16:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GG41VFyljAHzmcXQMPBqwXFLPXUtQme2hcXPLyG9+Lk=;
 b=TjZyKbZPzE7FtFYISK3r+4iNzCNQ2qSZsuF65roiaqst3bfffxV+o/fN9TUQpD4D+1
 /dBzpu6oiIVqEPNAwVu8IjhsIykZKoB26Wg81LeTb49k3r0MMk9VP/dKDkfioFXSCI0u
 18Xv3nbsHUHET1mxPI52KHx2zJw9fEchhe/rwi1ue+gLyKRXVYyz1CWE13zikIaIDSXo
 X/Et98NdQUd3tSraBLelEP/U6+EnhlV9BhRHexBCiQkVmVJ5O4eudNx7/J2owKzZmaBT
 AQQB6hCH5RNEbEpVDgRewheoW7EQHxhKfONTu3XnW7t9eRMaaTgttYewJfSpqzGpwW2f
 0v7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GG41VFyljAHzmcXQMPBqwXFLPXUtQme2hcXPLyG9+Lk=;
 b=eaFuQh5fyK7BhNzMaJoRIISCSdpNNwSoCJ4ZewozN3/lM4KLLzrxl9qczq+DFKMwqm
 z3nUoyXZcca8OWjF/S0jtEimR+bFoxO1+yj5B7sN5seLkULgGsurxAeV7GDr15ayhIEk
 2wsJg2Qfz2IRrPzi/6PjxaGtd2iZ/jdjLcunznqKgfidfO05MFnuTp2PjH1uNMWotoQJ
 RA+NpnECeLEs8NzKginPb0xrITLlTAhz7SQIiMQ73+3EBMYZUy8JejnzQZYhscm05wQ8
 BFOPr3+H9mqD4Y96vaKP3M/df5U+uwGttX3bjIUZ/BGFxmBGAcCQSMva4l94IaTYYHpt
 q5Qw==
X-Gm-Message-State: APjAAAU20XZAZjdg89fpUcWT09wu7qorDECcekDV2hmtruazwsBu9WjY
 31TgRO9THr8/u4OsSojtW2oydjtBS4n32LE7ZSI=
X-Google-Smtp-Source: APXvYqxDzD34LJ4jih2YWeTT8TMRzR7hYvFbY6RoHMuFlAcAJzhQ4pLDGVIs1ehk+kv++ISgonO9SH5PD344YO0MmoI=
X-Received: by 2002:a9d:5e18:: with SMTP id d24mr1194384oti.155.1582762318234; 
 Wed, 26 Feb 2020 16:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-10-jniethe5@gmail.com>
 <1582700457.bqyiezlzr9.astroid@bobo.none>
In-Reply-To: <1582700457.bqyiezlzr9.astroid@bobo.none>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 27 Feb 2020 11:11:47 +1100
Message-ID: <CACzsE9p4siTRgCnC6GPSn+89SnPr5CTTBk5+LOfS8BX+1OmMZg@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] powerpc/xmon: Add initial support for prefixed
 instructions
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
Cc: Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org, Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 26, 2020 at 6:10 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Jordan Niethe's on February 26, 2020 2:07 pm:
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
> > indicates we are at bpt::instr[1] then we have just executed out of line
> > so we can put the NIP back to the instruction after the breakpoint
> > location and continue on.
> >
> > Adding prefixed instructions complicates this as the bpt::instr[1] needs
> > to be used to hold the suffix. To deal with this make bpt::instr[] big
> > enough for three word instructions.  bpt::instr[2] contains the trap,
> > and in the case of word instructions pad bpt::instr[1] with a noop.
> >
> > No support for disassembling prefixed instructions.
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v2: Rename sufx to suffix
> > v3: - Just directly use PPC_INST_NOP
> >     - Typo: plac -> place
> >     - Rename read_inst() to mread_inst(). Do not have it call mread().
> > ---
> >  arch/powerpc/xmon/xmon.c | 90 ++++++++++++++++++++++++++++++++++------
> >  1 file changed, 78 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> > index a673cf55641c..a73a35aa4a75 100644
> > --- a/arch/powerpc/xmon/xmon.c
> > +++ b/arch/powerpc/xmon/xmon.c
> > @@ -97,7 +97,8 @@ static long *xmon_fault_jmp[NR_CPUS];
> >  /* Breakpoint stuff */
> >  struct bpt {
> >       unsigned long   address;
> > -     unsigned int    instr[2];
> > +     /* Prefixed instructions can not cross 64-byte boundaries */
> > +     unsigned int    instr[3] __aligned(64);
>
> This is pretty wild, I didn't realize xmon executes breakpoints out
> of line like this.
>
> IMO the break point entries here should correspond with a range of
> reserved bytes in .text so we patch instructions into normal executable
> pages rather than .data.
Would it make sense to use vmalloc_exec() and use that like we are
going to do in kprobes()?
>
> Anyway that's for patch.
>
> Thanks,
> Nick
