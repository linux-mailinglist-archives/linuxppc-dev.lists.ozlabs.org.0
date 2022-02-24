Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDEF4C2C2D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 13:53:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4CWq1fZfz3bcB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 23:53:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K4CWN5jKwz2xBV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 23:53:20 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 21OCnCdn002437;
 Thu, 24 Feb 2022 06:49:12 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 21OCnBsZ002436;
 Thu, 24 Feb 2022 06:49:11 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 24 Feb 2022 06:49:11 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Gabriel Paubert <paubert@iram.es>
Subject: Re: [PATCH] powerpc/32: Clear volatile regs on syscall exit
Message-ID: <20220224124911.GL614@gate.crashing.org>
References: <28b040bd2357a1879df0ca1b74094323f778a472.1645636285.git.christophe.leroy@csgroup.eu>
 <YhadiVbwao/p2N7o@lt-gp.iram.es> <20220223232739.GJ614@gate.crashing.org>
 <YhdCAwQ+VfLTslnV@lt-gp.iram.es>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhdCAwQ+VfLTslnV@lt-gp.iram.es>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, Feb 24, 2022 at 09:29:55AM +0100, Gabriel Paubert wrote:
> On Wed, Feb 23, 2022 at 05:27:39PM -0600, Segher Boessenkool wrote:
> > On Wed, Feb 23, 2022 at 09:48:09PM +0100, Gabriel Paubert wrote:
> > > On Wed, Feb 23, 2022 at 06:11:36PM +0100, Christophe Leroy wrote:
> > > > +	/* Zero volatile regs that may contain sensitive kernel data */
> > > > +	li	r0,0
> > > > +	li	r4,0
> > > > +	li	r5,0
> > > > +	li	r6,0
> > > > +	li	r7,0
> > > > +	li	r8,0
> > > > +	li	r9,0
> > > > +	li	r10,0
> > > > +	li	r11,0
> > > > +	li	r12,0
> > > > +	mtctr	r0
> > > > +	mtxer	r0
> > > 
> > > Here, I'm almost sure that on some processors, it would be better to
> > > separate mtctr form mtxer. mtxer is typically very expensive (pipeline
> > > flush) but I don't know what's the best ordering for the average core.
> > 
> > mtxer is cheaper than mtctr on many cores :-)
> 
> We're speaking of 32 bit here I believe;

32-bit userland, yes.  Which runs fine on non-ancient cores, too.

> on my (admittedly old) paper
> copy of PowerPC 604 user's manual, I read in a footnote:
> 
> "The mtspr (XER) instruction causes instructions to be flushed when it
> executes." 

And the 604 has a trivial depth pipeline anyway.

> I know there are probably very few 604 left in the field, but in this
> case mtspr(xer) looks very much like a superset of isync.

It hasn't been like that for decades.  On the 750 mtxer was execution
synchronised only already, for example.

> I also just had a look at the documentation of a more widespread core:
> 
> https://www.nxp.com/docs/en/reference-manual/MPC7450UM.pdf
> 
> and mtspr(xer) is marked as execution and refetch serialized, actually
> it is the only instruction to have both.

This looks like a late addition (it messes up the table, for example,
being put after "mtspr (other)").  It also is different from 7400 and
750 and everything else.  A late bugfix?  Curious :-)

> Maybe there is a subtle difference between "refetch serialization" and
> "pipeline flush", but in this case please educate me.

There is a subtle difference, but it goes the other way: refetch
serialisation doesn't stop fetch / flush everything after it, only when
the instruction completes it rejects everything after it.  So it can
waste a bit more :-)

> Besides that the back to back mtctr/mtspr(xer) may limit instruction
> decoding and issuing bandwidth.

It doesn't limit decode or dispatch (not issue fwiw) bandwidth on any
core I have ever heard of.

> I'd rather move one of them up by a few
> lines since they can only go to one of the execution units on some
> (or even most?) cores. This was my main point initially.

I think it is much more beneficial to *not* do these insns than to
shift them back and forth a cycle.


Segher
