Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00073162669
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 13:48:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MLHW2NZ4zDqg6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 23:48:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mhiramat@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=aWlnTD3n; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MKyX4C5XzDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 23:33:24 +1100 (AEDT)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5217720836;
 Tue, 18 Feb 2020 12:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582029201;
 bh=p5Cg7dkaOL/TAP7UTqb1VuRqbfVQB0oiZv/kRkrlk/0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aWlnTD3ngHGWit+WUQibOybAWTCa6KrOOwO2IOZComn3onYHL2f3hlybn60pMK2W2
 m1ZtfcTNRjXCTbu7ZTw2SFkydP3x6D+xiRBCwpOxGvIT+YOh8HAtyBQ9KJ4gwMb/RA
 NSbG43ehzUVWqqs7PWxiIRP/d/R42VxcCrQQPEfk=
Date: Tue, 18 Feb 2020 21:33:17 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/kprobes: Fix trap address when trap happened in
 real mode
Message-Id: <20200218213317.533c78753cefb05bd42cc6ad@kernel.org>
In-Reply-To: <2b3f664e-d4ad-edd3-5bed-a4492f4ed213@c-s.fr>
References: <b1451438f7148ad0e03306a1f1409f4ad1d6ec7c.1581684263.git.christophe.leroy@c-s.fr>
 <20200214225434.464ec467ad9094961abb8ddc@kernel.org>
 <e09d3c42-542e-48c1-2f1e-cfe605b05bec@c-s.fr>
 <20200216213411.824295a321d8fa979dedbbbe@kernel.org>
 <baee8186-549a-f6cf-3619-884b6d708185@c-s.fr>
 <20200217192735.5070f0925c4159ccffa4e465@kernel.org>
 <c6257b49-bf02-d30a-1e2e-99abba5955e6@c-s.fr>
 <20200218094421.6d402de389ce23a55a3ec084@kernel.org>
 <c93c5346-d964-9167-c4dd-3123917344cf@c-s.fr>
 <20200218192905.a3ed969e8565901c4f69fa22@kernel.org>
 <2b3f664e-d4ad-edd3-5bed-a4492f4ed213@c-s.fr>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Paul Mackerras <paulus@samba.org>, stable@kernel.vger.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 18 Feb 2020 12:04:41 +0100
Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> >> Nevertheless, if one symbol has been forgotten in the blacklist, I think
> >> it is a problem if it generate Oopses.
> > 
> > There is a long history also on x86 to make a blacklist. Anyway, how did
> > you get this error on PPC32? Somewhere would you like to probe and
> > it is a real mode function? Or, it happened unexpectedly?
> 
> The first Oops I got was triggered by a WARN_ON() kind of trap in real 
> mode. The trap exception handler called kprobe_handler() which tried to 
> read the instruction at the trap address (which was a real-mode address) 
> so it triggered a Bad Access Fault.
> 
> This was initially the purpose of my patch.

OK, then filtering the trap reason in kprobe handler is a bit strange.
It should be done in the previous stage (maybe in trap.c)
Can we filter it by exception flag or only by checking the instruction
which causes the exception, or needs get_kprobe()...?

> After discussion with you, I started looking at what would be the effect 
> of setting a kprobe event in a function which runs in real mode.

If the kprobe single-stepping (or emulation) works in real mode, just
ignore the kprobes pre/post_handlers and increment nmissed count.

If that doesn't work, we have to call a BUG_ON, because we can not
continue the code execution. And also, you have to find a way to make
a blacklist for real mode code.

> >>
> >>> Or, some parts are possble to run under both real mode and kernel mode?
> >>
> >> I don't think so, at least on PPC32
> > 
> > OK, that's a good news. Also, are there any independent section where such
> > real mode functions are stored? (I can see start_real_trampolines in
> > sections.h) If that kind of sections are defined, it is easy to make
> > a blacklist in arch_populate_kprobe_blacklist(). See arch/arm64/kernel/probes/kprobes.c.
> 
> Part of them are in .head.text, and this section is already blacklisted 
> throught function arch_within_kprobe_blacklist()

Then, those are OK.

> 
> But there are several other functions which are not there. For instance, 
> many things within entry_32.S, and also things in hash_low.S
> On PPC64 (ie in entry_64.S) they were explicitely blacklisted with 
> _ASM_NOKPROBE_SYMBOL(). We have to do the same on PPC64

Agreed. Some of such unstable state code must not be probed.

> >>>> So the 'program check' exception handler doesn't find the owner of the
> >>>> trap hence generate an Oops.
> >>>>
> >>>> Even if we don't want kprobe() to proceed with the event entirely
> >>>> (allthough it works at least for simple events), I'd expect it to fail
> >>>> gracefully.
> >>>
> >>> Agreed. I thought it was easy to identify real mode code. But if it is
> >>> hard, we should apply your first patch and also skip user handlers
> >>> if we are in the real mode (and increment missed count).
> >>
> >> user handlers are already skipped.
> > 
> > Yes, if you don't put a kprobes on real mode code. However, if user
> > (accidentally) puts a probe on real mode code, it might call a
> > user handler?
> 
> Are we talking about the same thing ?

Ah, sorry about that. "user handler" here I meant was "kprobe pre/post_handler
function defined by the user of kprobes".

> 
> Only kernel code can run in real mode, so the following code at the 
> beginning of kprobe_handler() does the job ?
> 
> 	if (user_mode(regs))
> 		return 0;

Yes, you're right.

> >> What do you think about my latest proposal below ? If a trap is
> >> encoutered in real mode, if checks if the matching virtual address
> >> corresponds to a valid kprobe. If it is, it skips it. If not, it returns
> >> 0 to tell "it's no me". You are also talking about incrementing the
> >> missed count. Who do we do that ?
> > 
> > I rather like your first patch. If there is a kprobes, we can not skip
> > the instruction, because there is an instruction which must be executed.
> > (or single-skipped, but I'm not sure the emulator works correctly on
> > real mode)
> 
> Oops, yes of course.

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
