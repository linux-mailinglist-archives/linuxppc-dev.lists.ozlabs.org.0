Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 738F1172DAD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 01:48:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T9rd5k67zDrPT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 11:48:33 +1100 (AEDT)
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
 header.s=20161025 header.b=VkYwwc0J; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T9bh1XfRzDr7b
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 11:37:19 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id j5so133975otn.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 16:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tD5m57hsHbv8JQhy5Tbo5+LacfuMVnk7uYvklG+Wh8Q=;
 b=VkYwwc0J/nVQQtEMIsHSFqHm0i3MkSHAMBIdK9STv3BQBuX7gVf9tmwliEeBwLglHL
 WBprtbW6/j15cMojmSdokKROBPqDDJbuQ5Q2tV4/c5Kef0cVOpac9jGvCl3N3qap3wiC
 s/R0PMW+091Y3a6PAuRxI7p3aGLbZdKkt4v4cKK60Ok2pvabhH0ZVOya3nDCdQP37l3p
 Qon6Cw+GdYlNxXszCZz+5MAh54Mjl2TQldEIio2h9SCRu+zXUIR5IaRfHKzP5ePTEggC
 5XuW6JwVHJW4Z3G3v7CCfcfiLnJzQPxebtTROfMn3e5dVSNvZf27Vmn9x4GUvoJwxlQT
 KkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tD5m57hsHbv8JQhy5Tbo5+LacfuMVnk7uYvklG+Wh8Q=;
 b=GoNn+wrO5x9g+6jytXCIzU7H0623t5U/hUUhHz2bLkFJiSsbVv6WIby79928SJm628
 aIHJPNVL/MbhbtIGUWdGA1puCzcvImvhSz8HYLg2BHwEGds25EV5CVgJL3NUPrVB38Xv
 ZtmCYDxp5qj+NTZUO7WL9zfLHxWidroOmWw2IuKigjhIysbNyMaEGFcnC7tBzC0ONBvP
 nVgd6Rqy19t3tCwUobE3bPoyke81CCK30pB4/YfmlPFLLMcHR1yn0mAtxWiMQ3abvj5D
 nX4vVveRqNnzCUSNJJ6gTXiSsGs/A8tVCKHQ7WudpBvXI6b7grU0w9v6EcfHYn6Wzl5E
 gcQw==
X-Gm-Message-State: APjAAAUacMlK1ApVKA5ZY7mmO6ybpN31zmQJSEaEYa653X0uYZCubSPG
 8s1Z1JNCb+rwYgW+8EJlCyO4ML+S7uoWzNbT+gk=
X-Google-Smtp-Source: APXvYqwWH1Bj3p5G7D7buEdZcVqIFBTymdYwlrKaQr2LZ9XJjvipMbsryurU4rQs4/nc0BWxf3/PnsTtAvJAQhIFMmA=
X-Received: by 2002:a05:6830:1e24:: with SMTP id
 t4mr1336277otr.28.1582850236134; 
 Thu, 27 Feb 2020 16:37:16 -0800 (PST)
MIME-Version: 1.0
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-10-jniethe5@gmail.com>
 <1582700457.bqyiezlzr9.astroid@bobo.none>
 <CACzsE9p4siTRgCnC6GPSn+89SnPr5CTTBk5+LOfS8BX+1OmMZg@mail.gmail.com>
 <f6db0844-bcd0-50af-5699-a89f10538ed0@c-s.fr>
In-Reply-To: <f6db0844-bcd0-50af-5699-a89f10538ed0@c-s.fr>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 28 Feb 2020 11:37:04 +1100
Message-ID: <CACzsE9r6JGOuTBwaLxDhWb2W4E=Ag0M-QHrxJUCcjP4XNYZxkQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] powerpc/xmon: Add initial support for prefixed
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Balamuruhan S <bala24@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 27, 2020 at 6:14 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
>
> Le 27/02/2020 =C3=A0 01:11, Jordan Niethe a =C3=A9crit :
> > On Wed, Feb 26, 2020 at 6:10 PM Nicholas Piggin <npiggin@gmail.com> wro=
te:
> >>
> >> Jordan Niethe's on February 26, 2020 2:07 pm:
> >>> A prefixed instruction is composed of a word prefix and a word suffix=
.
> >>> It does not make sense to be able to have a breakpoint on the suffix =
of
> >>> a prefixed instruction, so make this impossible.
> >>>
> >>> When leaving xmon_core() we check to see if we are currently at a
> >>> breakpoint. If this is the case, the breakpoint needs to be proceeded
> >>> from. Initially emulate_step() is tried, but if this fails then we ne=
ed
> >>> to execute the saved instruction out of line. The NIP is set to the
> >>> address of bpt::instr[] for the current breakpoint.  bpt::instr[]
> >>> contains the instruction replaced by the breakpoint, followed by a tr=
ap
> >>> instruction.  After bpt::instr[0] is executed and we hit the trap we
> >>> enter back into xmon_bpt(). We know that if we got here and the offse=
t
> >>> indicates we are at bpt::instr[1] then we have just executed out of l=
ine
> >>> so we can put the NIP back to the instruction after the breakpoint
> >>> location and continue on.
> >>>
> >>> Adding prefixed instructions complicates this as the bpt::instr[1] ne=
eds
> >>> to be used to hold the suffix. To deal with this make bpt::instr[] bi=
g
> >>> enough for three word instructions.  bpt::instr[2] contains the trap,
> >>> and in the case of word instructions pad bpt::instr[1] with a noop.
> >>>
> >>> No support for disassembling prefixed instructions.
> >>>
> >>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> >>> ---
> >>> v2: Rename sufx to suffix
> >>> v3: - Just directly use PPC_INST_NOP
> >>>      - Typo: plac -> place
> >>>      - Rename read_inst() to mread_inst(). Do not have it call mread(=
).
> >>> ---
> >>>   arch/powerpc/xmon/xmon.c | 90 ++++++++++++++++++++++++++++++++++---=
---
> >>>   1 file changed, 78 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> >>> index a673cf55641c..a73a35aa4a75 100644
> >>> --- a/arch/powerpc/xmon/xmon.c
> >>> +++ b/arch/powerpc/xmon/xmon.c
> >>> @@ -97,7 +97,8 @@ static long *xmon_fault_jmp[NR_CPUS];
> >>>   /* Breakpoint stuff */
> >>>   struct bpt {
> >>>        unsigned long   address;
> >>> -     unsigned int    instr[2];
> >>> +     /* Prefixed instructions can not cross 64-byte boundaries */
> >>> +     unsigned int    instr[3] __aligned(64);
> >>
> >> This is pretty wild, I didn't realize xmon executes breakpoints out
> >> of line like this.
>
> Neither did I. That's problematic. Kernel data is mapped NX on some
> platforms.
>
> >>
> >> IMO the break point entries here should correspond with a range of
> >> reserved bytes in .text so we patch instructions into normal executabl=
e
> >> pages rather than .data.
> > Would it make sense to use vmalloc_exec() and use that like we are
> > going to do in kprobes()?
>
> As we are (already) doing in kprobes() you mean ?
Sorry for the confusion, I was mainly thinking of the patch that you
pointed out before:
https://patchwork.ozlabs.org/patch/1232619/
>
> In fact kprobes uses module_alloc(), and it works because kprobe depends
> on module. On some platforms (i.e. book3s/32) vmalloc space is marked NX
> in segment registers when CONFIG_MODULES is not set, see
> mmu_mark_initmem_nx().  On other ones the Instruction TLB miss exception
> does not manage misses at kernel addresses when CONFIG_MODULES is not
> selected.
>
> So if we want XMON to work at all time, we need to use some (linear)
> text address and use patch_instruction() to change it.
Thank you for the detailed clarification, I will do it like that.
>
> Christophe
>
> >>
> >> Anyway that's for patch.
> >>
> >> Thanks,
> >> Nick
