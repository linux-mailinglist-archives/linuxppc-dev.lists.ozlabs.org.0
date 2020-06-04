Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 792ED1EEE1D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 01:08:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dLzW5tvyzDqxf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 09:08:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 49dLxv0k75zDqvt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 09:06:42 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 054N6ebR016208;
 Thu, 4 Jun 2020 18:06:40 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 054N6dBe016207;
 Thu, 4 Jun 2020 18:06:39 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 4 Jun 2020 18:06:39 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Phil Blundell <pb@pbcl.net>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200604230639.GL31009@gate.crashing.org>
References: <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
 <alpine.DEB.2.21.2006021334170.24059@digraph.polyomino.org.uk>
 <20200602142337.GS25173@kitsune.suse.cz>
 <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
 <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
 <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
 <20200604215511.GB28641@pbcl.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604215511.GB28641@pbcl.net>
User-Agent: Mutt/1.4.2.3i
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es,
 Daniel Kolesa <daniel@octaforge.org>,
 Will Springer <skirmisher@protonmail.com>,
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, Jun 04, 2020 at 11:55:11PM +0200, Phil Blundell wrote:
> 1a. Define your own subset of ELFv2 which is interworkable with the full 
> ABI at the function call interface but doesn't make all the same 
> guarantees about binary compatibility.  That would mean that a binary 
> built with your toolchain and conforming to the subset ABI would run on 
> any system that implements the full ELFv2 ABI, but the opposite is not 
> necessarily true.  There should be no impediment to getting support for 
> such an ABI upstream in any part of the GNU toolchain where it's 
> required if you can demonstrate that there's a non-trivial userbase for 
> it.  The hardest part may be thinking of a name.

And you can only use shared objects also built for that subset ABI.  If
you use some binary distribution, then it will also have to be built for
that subset, practically anyway.

This is very similar to soft-float targets.  There are "standard" ways
to deal with this.  Distros usually balk at having to maintain multiple
variants of a target, and users do not usually want to be restricted to
the lowest common denominator.  There always is that tension.

> 1b. Or, if the missing instructions are severe enough that it simply 
> isn't possible to have an interworkable implementation, you just need to 
> define your own ABI that fits your needs.  You can still borrow as much 
> as necessary from ELFv2 but you definitely need to call it something 
> else at that point.  All the other comments from 1a above still apply.

A different name is handy in casual conversation then, yes; but also in
case 1a, it should be clear what is what somehow.

> 2. Implement kernel emulation for the missing instructions.  If they
> are seldom used in practice then this might be adequate.  Of course,
> binaries that use them intensively will be slow; you'd have to judge
> whether this is better or worse than having them not run at all.  If
> you do this then you can implement the full ELFv2 ABI; your own
> toolchain might still choose not to use the instructions that it knows
> are going to be emulated, but at least other binaries will still run
> and you can call yourself compatible.

But not just instructions, there are actual new registers!  This might
be way too much work in the case of VSX.

But it is possible that implementing QP float (binary128) this way is
a feasible way forward, _if_ you have AltiVec enabled.

> 3. Persuade whoever controls the ELFv2 ABI to relax their requirements.
> But I assume they didn't make the original decision capriciously so
> this might be hard/impossible.  ABI definitions from hardware vendors
> are always slightly political and we just have to accept this.

There is more process involved than most open source people are
comfortable with :-/

> FWIW, we faced a similar situation about 20 years ago when the then-new 
> ARM EABI was defined.  This essentially required implementations to 
> support the ARMv5T instruction set; the committee that defined the ABI 
> took the view that requiring implementations to cater for older 
> architectures would be too onerous.  It was entirely possible to 
> implement 99% of the EABI on older processors; such implementations 
> weren't strictly conforming but they were interworkable enough to be 
> useful in practice, and the "almost-EABI" was still significantly
> better than what had gone before.

Yeah, this situation is quite similar in some ways :-)

The compilers should be able to adjust to what you need pretty easily.
Since you seem to have a distribution on-board already, the biggest
hurdle left is getting glibc to accept the new port, I think.  I don't
know if it will be easy to them, or a lot of work instead.

Thanks,


Segher
