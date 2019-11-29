Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A49DC10D9BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 19:49:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Pk7h5wCgzDrF0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 05:49:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Pk5J5ycnzDr9L
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 05:47:16 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id xATIkxwn003148;
 Fri, 29 Nov 2019 12:47:00 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id xATIkw6Y003147;
 Fri, 29 Nov 2019 12:46:58 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 29 Nov 2019 12:46:58 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v4 2/2] powerpc/irq: inline call_do_irq() and
 call_do_softirq()
Message-ID: <20191129184658.GR9491@gate.crashing.org>
References: <f12fb9a6cc52d83ee9ddf15a36ee12ac77e6379f.1570684298.git.christophe.leroy@c-s.fr>
 <5ca6639b7c1c21ee4b4138b7cfb31d6245c4195c.1570684298.git.christophe.leroy@c-s.fr>
 <877e3tbvsa.fsf@mpe.ellerman.id.au>
 <20191121101552.GR16031@gate.crashing.org>
 <87y2w49rgo.fsf@mpe.ellerman.id.au> <20191125142556.GU9491@gate.crashing.org>
 <5fdb1c92-8bf4-01ca-f81c-214870c33be3@c-s.fr>
 <20191127145958.GG9491@gate.crashing.org>
 <2072e066-1ffb-867e-60ec-04a6bb9075c1@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2072e066-1ffb-867e-60ec-04a6bb9075c1@c-s.fr>
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
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Wed, Nov 27, 2019 at 04:15:15PM +0100, Christophe Leroy wrote:
> Le 27/11/2019 à 15:59, Segher Boessenkool a écrit :
> >On Wed, Nov 27, 2019 at 02:50:30PM +0100, Christophe Leroy wrote:
> >>So what do we do ? We just drop the "r2" clobber ?
> >
> >You have to make sure your asm code works for all ABIs.  This is quite
> >involved if you do a call to an external function.  The compiler does
> >*not* see this call, so you will have to make sure that all that the
> >compiler and linker do will work, or prevent some of those things (say,
> >inlining of the function containing the call).
> 
> But the whole purpose of the patch is to inline the call to __do_irq() 
> in order to avoid the trampoline function.

Yes, so you call __do_irq.  You have to make sure that what you tell the
compiler -- and what you *don't tell the compiler -- works with what the
ABIs require, and what the called function expects and provides.

> >That does not fix everything.  The called function requires a specific
> >value in r2 on entry.
> 
> Euh ... but there is nothing like that when using existing 
> call_do_irq().

> How does GCC know that call_do_irq() has same TOC as __do_irq() ?

The existing call_do_irq isn't C code.  It doesn't do anything with r2,
as far as I can see; __do_irq just gets whatever the caller of call_do_irq
has.

So I guess all the callers of call_do_irq have the correct r2 value always
already?  In that case everything Just Works.

> >So all this needs verification.  Hopefully you can get away with just
> >not clobbering r2 (and not adding a nop after the bl), sure.  But this
> >needs to be checked.
> >
> >Changing control flow inside inline assembler always is problematic.
> >Another problem in this case (on all ABIs) is that the compiler does
> >not see you call __do_irq.  Again, you can probably get away with that
> >too, but :-)
> 
> Anyway it sees I reference it, as it is in input arguments. Isn't it 
> enough ?

It is enough for some things, sure.  But not all.


Segher
