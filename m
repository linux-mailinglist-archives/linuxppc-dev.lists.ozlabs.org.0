Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB7D3DE1CB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 23:46:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gds5y4RjJz3cVm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 07:46:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Gds5Y1hcCz302X
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Aug 2021 07:46:24 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 172Lg8IZ011901;
 Mon, 2 Aug 2021 16:42:08 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 172Lg7U0011900;
 Mon, 2 Aug 2021 16:42:07 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 2 Aug 2021 16:42:07 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH 3/3] isystem: delete global -isystem compile option
Message-ID: <20210802214207.GP1583@gate.crashing.org>
References: <20210801201336.2224111-1-adobriyan@gmail.com>
 <20210801201336.2224111-3-adobriyan@gmail.com>
 <20210801213247.GM1583@gate.crashing.org>
 <YQeT5QRXc3CzK9nL@localhost.localdomain>
 <20210802164747.GN1583@gate.crashing.org>
 <YQhVyOdQKUnvz1n5@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQhVyOdQKUnvz1n5@localhost.localdomain>
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, masahiroy@kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 02, 2021 at 11:30:00PM +0300, Alexey Dobriyan wrote:
> On Mon, Aug 02, 2021 at 11:47:47AM -0500, Segher Boessenkool wrote:
> > The kernel *cannot* make up its own types for this.  It has to use the
> > types it is required to use (by C, by the ABIs, etc.)  So why
> > reimplement this?
> 
> Yes, it can. gcc headers have stuff like this:
> 
> 	#define __PTRDIFF_TYPE__ long int
> 	#define __SIZE_TYPE__ long unsigned int
> 
> If gcc can defined standard types, kernel can too.

The kernel *has to* use those exact same types.  So why on earth do you
feel you should reimplement this?

> > > noreturn, alignas newest C standard
> > > are next.
> > 
> > What is wrong with <stdalign.h> and <stdnoreturn.h>?
> 
> These two are actually quite nice.
> 
> Have you seen <stddef.h>? Loads of macrology crap.
> Kernel can ship nicer one.

It is a pretty tame file.  And it works correctly for *all* targets,
including all Linux targets.  Why reimplement this?  No, it takes
virtually no resources to compile this.  And you do not have to maintain
it *at all*, the compiler will take care of it.  It is standard.

> > > They are userspace headers in the sense they are external to the project
> > > just like userspace programs are external to the kernel.
> > 
> > So you are going to rewrite all of the rest of GCC inside the kernel
> > project as well?
> 
> What an argument. "the rest of GCC" is already there except for stdarg.h.

???

That is there as well.  But you want to remove it.

"The rest of GCC" is everything in cc1 (the compiler binary), in libgcc
(not that the kernel wants that either on most targets, although it is
required), etc.  A few GB of binary goodness.

> > > Kernel chose to be self-contained.
> > 
> > That is largely historical, imo.  Nowadays this is less necessary.
> 
> I kind of agree as in kernel should use int8_t and stuff because they
> are standard.

s8 is a much nicer name, heh.  But it could
  #define s8 int8_t
certainly.

What I meant was the kernel wanted to avoid standard headers because
those traditionally have been a bit problematic.  But decades have gone
by, and nowadays the kernel's own headers are at least as bad.

> Also, -isystem removal disables <float.h> and <stdatomic.h> which is
> desireable.

Why?  Do you think  #include <float.h>  will ever make it past code
review?  Do you need to throw up extra barriers so people will have a
harder time changing that policy, if ever they think that a good idea?

> > > It will be used for intrinsics where necessary.
> > 
> > Like, everywhere.
> 
> No, where necessary. Patch demostrates there are only a few places which
> want -isystem back.

Yes, where necessary, that is what I said.  So, potentially everywhere.
An arch can decide to use some builtin in a generic header, for example.

Your patch makes for more work in the future, that is the best it does.


Segher
