Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0905A8934
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 00:48:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHzqn0x6Fz3c6N
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 08:48:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHzqP0bbGz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 08:48:31 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 27VMjNZ8018075;
	Wed, 31 Aug 2022 17:45:23 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 27VMjMD4018074;
	Wed, 31 Aug 2022 17:45:22 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 31 Aug 2022 17:45:22 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc: Fix irq_soft_mask_set() and irq_soft_mask_return() with sanitizer
Message-ID: <20220831224522.GX25951@gate.crashing.org>
References: <c0b486e782b6695092dcdb2cd340a3d44c8c266d.1661272738.git.christophe.leroy@csgroup.eu> <CMJ3VICKD1CI.SVFJOKYJPKZQ@bobo> <e022754d-b4d3-bc9f-cc79-2cf556180459@csgroup.eu> <CMJ8P06JA9OY.1S8VDV2XRU3W5@bobo> <7c11b659-5b8e-256c-508e-39395041fccb@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c11b659-5b8e-256c-508e-39395041fccb@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Zhouyi Zhou <zhouzhouyi@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Tue, Aug 30, 2022 at 09:10:02AM +0000, Christophe Leroy wrote:
> Le 30/08/2022 à 11:01, Nicholas Piggin a écrit :
> > On Tue Aug 30, 2022 at 3:24 PM AEST, Christophe Leroy wrote:
> >>> This is still slightly concerning to me. Is there any guarantee that the
> >>> compiler would not use a different sequence for the address here?
> >>>
> >>> Maybe explicit r13 is required.
> >>>
> >>
> >> local_paca is defined as:
> >>
> >> 	register struct paca_struct *local_paca asm("r13");

And this is in global scope, making it a global register variable.

> >> Why would the compiler use another register ?
> > 
> > Hopefully it doesn't. Is it guaranteed that it won't?

Yes, this is guaranteed.

For a local register variable this is guaranteed only for operands to an
extended inline asm; any other access to the variable does not have to
put it in the specified register.

But this is a global register variable.  The only thing that would make
this crash and burn is if *any* translation unit did not see this
declaration: it could then use r13 (if that was allowed by the ABI in
effect, heh).

> > I'm sure Segher will be delighted with the creative asm in __do_IRQ
> > and call_do_irq :) *Grabs popcorn*

All that %% is blinding, yes.

Inline tabs are bad taste.

Operand names instead of numbers are great for obfuscation, and nothing
else -- unless you have more than four or five operands, in which case
you have bigger problems already.

Oh, this function is a good example of proper use of local register asm,
btw.

Comments like "// Inputs" are just harmful.  As is the "creative"
indentation here.  Both harm readability and do not help understanding
in any other way either.

The thing about inline asm is the smallest details change meaning of the
whole, it is a very harsh environment, you are programming both in C and
directly assembler code as well, and things have to be valid for both,
although on the other hand there is almost no error checking.  Keeping
it small, simple, readable is paramount.

The rules for using inline asm:

0) Do no use inline asm.
1) Use extended asm, unless you know all differences with basic asm, and
   you know you want that.  And if you answer "yes I do" to the latter,
   you answered wrong to the former.
2) Do not use toplevel asm.
3) Do no use inline asm.
4) Do no use inline asm.
5) Do no use inline asm.

Inline asm is a very powerful escape hatch.  Like all emergency exits,
you should not use them if you do not need them!  :-)

But, you are talking about the function calling and the frame change I
bet :-)  Both of these are only okay because everything is back as it
was when this (single!) asm is done, and the state created is perfectly
fine (this is very dependent on exact ABI used, etc.)

I would have used real assembler code here (in a .s file).  But there
probably are reasons to do things this way, performance probably?


Segher
