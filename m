Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BF8115863
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 22:02:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47V4ld6HCGzDqQj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 08:02:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47V4jT1B4pzDqdk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2019 08:00:12 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id xB6KxtJD020157;
 Fri, 6 Dec 2019 14:59:55 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id xB6Kxrxp020154;
 Fri, 6 Dec 2019 14:59:53 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 6 Dec 2019 14:59:53 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v4 2/2] powerpc/irq: inline call_do_irq() and
 call_do_softirq()
Message-ID: <20191206205953.GQ3152@gate.crashing.org>
References: <5ca6639b7c1c21ee4b4138b7cfb31d6245c4195c.1570684298.git.christophe.leroy@c-s.fr>
 <877e3tbvsa.fsf@mpe.ellerman.id.au>
 <20191121101552.GR16031@gate.crashing.org>
 <87y2w49rgo.fsf@mpe.ellerman.id.au> <20191125142556.GU9491@gate.crashing.org>
 <5fdb1c92-8bf4-01ca-f81c-214870c33be3@c-s.fr>
 <20191127145958.GG9491@gate.crashing.org>
 <2072e066-1ffb-867e-60ec-04a6bb9075c1@c-s.fr>
 <20191129184658.GR9491@gate.crashing.org>
 <ebc67964-e5a9-acd0-0011-61ba23692f7e@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebc67964-e5a9-acd0-0011-61ba23692f7e@c-s.fr>
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

On Wed, Dec 04, 2019 at 05:32:54AM +0100, Christophe Leroy wrote:
> Le 29/11/2019 à 19:46, Segher Boessenkool a écrit :
> >The existing call_do_irq isn't C code.  It doesn't do anything with r2,
> >as far as I can see; __do_irq just gets whatever the caller of call_do_irq
> >has.
> >
> >So I guess all the callers of call_do_irq have the correct r2 value always
> >already?  In that case everything Just Works.
> 
> Indeed, there is only one caller for call_do_irq() which is do_IRQ().
> And do_IRQ() is also calling __do_irq() directly (when the stack pointer 
> is already set to IRQ stack). do_IRQ() and __do_irq() are both in 
> arch/powerpc/kernel/irq.c
> 
> As far as I can see when replacing the call to call_do_irq() by a call 
> to __do_irq(), the compiler doesn't do anything special with r2, and 
> doesn't add any nop after the bl either, whereas for all calls outside 
> irq.c, there is a nop added. So I guess that's ok ?

If the compiler can see the callee wants the same TOC as the caller has,
it does not arrange to set (and restore) it, no.  If it sees it may be
different, it does arrange for that (and the linker then will check if
it actually needs to do anything, and do that if needed).

In this case, the compiler cannot know the callee wants the same TOC,
which complicates thing a lot -- but it all works out.

> Now that call_do_irq() is inlined, we can even define __do_irq() as static.
> 
> And that's the same for do_softirq_own_stack(), it is only called from 
> do_softirq() which is defined in the same file as __do_softirq() 
> (kernel/softirq.c)

I think things can still go wrong if any of this is inlined into a kernel
module?  Is there anything that prevents this / can this not happen for
some fundamental reason I don't see?


Segher
