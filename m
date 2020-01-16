Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E3913DFF8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 17:23:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z8dQ18rrzDqZp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 03:23:38 +1100 (AEDT)
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
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z8bf5p9fzDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 03:22:05 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00GGLpkC019886;
 Thu, 16 Jan 2020 10:21:51 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 00GGLpYe019885;
 Thu, 16 Jan 2020 10:21:51 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 16 Jan 2020 10:21:51 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: z constraint in powerpc inline assembly ?
Message-ID: <20200116162151.GR3191@gate.crashing.org>
References: <d72263a1-fe17-3192-6930-35ec8394c699@c-s.fr>
 <e9af1690e51a4d89a8a5c0927eb8430a@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9af1690e51a4d89a8a5c0927eb8430a@AcuMS.aculab.com>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, Jan 16, 2020 at 03:54:58PM +0000, David Laight wrote:
> if you are trying to 'loop carry' the 'carry flag' with 'add with carry'
> instructions you'll almost certainly need to write the loop in asm.
> Since the loop itself is simple, this probably doesn't matter.

Agreed.

> However a loop of 'add with carry' instructions may not be the
> fastest code by any means.
> Because the carry flag is needed for every 'adc' you can't do more
> that one adc per clock.
> This limits you to 8 bytes/clock on a 64bit system - even one
> that can schedule multiple memory reads and lots of instructions
> every clock.
> 
> I don't know ppc, but on x86 you don't even get 1 adc per clock
> until very recent (Haswell I think) cpus.
> Sandy/Ivy bridge will do so if you add to alternate registers.

The carry bit is renamed just fine on all modern Power cpus.  On Power9
there is an extra carry bit, precisely so you can do two interleaved
chains.  And you can run lots of these insns at once, every cycle.

On older cpus there were other limitations as well, but those have been
solved essentially.

> For earlier cpu it is actually difficult to beat the 4 bytes/clock
> you get by adding 32bit values to a 64bit register in C code.

Christophe uses a very primitive 32-bit cpu, not even superscalar.  A
loop doing adde is pretty much optimal, probably wants some unrolling
though.

> One possibility is to do a normal add then shift the carry
> into a separate register.
> After 64 words use 'popcnt' to sum the carry bits.
> With 2 accumulators (and carry shifts) you'd need to
> break the loop every 1024 bytes.
> This should beat 8 bytes/clock if you can exeute more than
> 1 memory read, one add and one shift each clock.

Do normal 64-bit adds, and in parallel also accumulate the values shifted
right by 32 bits.  You can add 4G of them this way, and restore the 96-bit
actual sum from these two accumulators, so that you can fold it to a proper
ones' complement sum after the loop.

But you can easily beat 8B/clock using vectors, or doing multiple addition
chains (interleaved) in parallel.  Not that it helps, your limiting factor
is the memory bandwidth anyway, if anything in the memory pipeline stalls
all your optimisations are for nothing.


Segher
