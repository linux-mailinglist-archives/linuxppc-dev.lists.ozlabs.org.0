Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED04A13DCC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 14:59:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z5RT2trKzDqcK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 00:59:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z5P66rjjzDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 00:57:44 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00GDvUTL011806;
 Thu, 16 Jan 2020 07:57:30 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 00GDvTmR011805;
 Thu, 16 Jan 2020 07:57:29 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 16 Jan 2020 07:57:29 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Gabriel Paubert <paubert@iram.es>
Subject: Re: z constraint in powerpc inline assembly ?
Message-ID: <20200116135729.GP3191@gate.crashing.org>
References: <d72263a1-fe17-3192-6930-35ec8394c699@c-s.fr>
 <20200116080608.GA29711@lt-gp.iram.es>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200116080608.GA29711@lt-gp.iram.es>
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

On Thu, Jan 16, 2020 at 09:06:08AM +0100, Gabriel Paubert wrote:
> On Thu, Jan 16, 2020 at 07:11:36AM +0100, Christophe Leroy wrote:
> > Hi Segher,
> > 
> > I'm trying to see if we could enhance TCP checksum calculations by splitting
> > inline assembly blocks to give GCC the opportunity to mix it with other
> > stuff, but I'm getting difficulties with the carry.
> > 
> > As far as I can read in the documentation, the z constraint represents
> > '‘XER[CA]’ carry bit (part of the XER register)'
> 
> Well, the documentation is very optimisitic. From the GCC source code
> (thanks for switching to git last week-end ;-)), it is clear that the
> carry is not, for the time being, properly modeled. 

What?  It certainly *is*, I spent ages on that back in 2014 and before.
See gcc.gnu.org/PR64180 etc.

You can not put the carry as input or output to an asm, of course: no C
variable can be assigned to it.

We don't do the "flag outputs" thing, either, as it is largely useless
for Power (and using it would often make *worse* code).

If you want to access a carry, write C code that does that operation.
The compiler knows how to optimise it well.

> Right now, in the machine description, all setters and users of the carry
> are in the same block of generated instructions.

No, they are not.  For over five years now.  (Since GCC 5).

> For a start, all single instructions patterns that set the carry (and
> do not use it) as a side effect should mention the they clobber the 
> carry, otherwise inserting one between a setter and a user of the carry 
> would break.

And they do.

All asms that change the carry should mention that, too, but this is
automatically done for all inline asms, because there was a lot of code
in the wild that does not clobber it.

> This includes all arithmetic right shift (sra[wd]{,i}, 
> subfic, addic{,\.} and I may have forgotten some.

{add,subf}{ic,c,e,ze,me} and sra[wd][i] and their dots.  Sure.  And
mcrxr and mcrxrx and mfxer and mtxer.  That's about it.

We don't model the second carry at all yet btw, in GCC.  Not too many
people know it exists even, so no big loss there.

(One nasty was that addi. does not exist, so we used addic. where it was
wanted before, so that had to change.)


Segher
