Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DB664DEB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 17:32:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXySM4B9rz3f3H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 03:32:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXyRn63JWz2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 03:31:49 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2BFGTdir001657;
	Thu, 15 Dec 2022 10:29:39 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 2BFGTcPc001656;
	Thu, 15 Dec 2022 10:29:38 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 15 Dec 2022 10:29:38 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: Implement arch_within_stack_frames
Message-ID: <20221215162938.GT25951@gate.crashing.org>
References: <20221214044252.1910657-1-nicholas@linux.ibm.com> <0dfbaab8-c962-9127-b56d-8f9989c095d8@csgroup.eu> <CP1IFJNCTTZ4.33ROBE5VAFAKM@bobo> <20221215001725.GS25951@gate.crashing.org> <CP1ZAUES4MNI.1TT3NQ1N4VG7Q@bobo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CP1ZAUES4MNI.1TT3NQ1N4VG7Q@bobo>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 15, 2022 at 10:52:35AM +1000, Nicholas Piggin wrote:
> On Thu Dec 15, 2022 at 10:17 AM AEST, Segher Boessenkool wrote:
> > On Wed, Dec 14, 2022 at 09:39:25PM +1000, Nicholas Piggin wrote:
> > > What about just copying x86's implementation including using
> > > __builtin_frame_address(1/2)? Are those builtins reliable for all
> > > our targets and compiler versions?
> >
> > __builtin_frame_address(n) with n > 0 is specifically not supported, not
> > on any architecture; it does not work in all situations on *any* arch,
> > and not in *any* situation on some archs.
> 
> No, but the particular case of powerpc where we have frame pointers and
> calling from a function where we know we have at least n + 1 frames on
> the stack, it would be okay, right? The code is not really different
> than using r1 directly and dereferencing that.

We do not typically have frame pointers; those make quite a bit slower
code.  But we do not *need* frame pointers for most purposes, perhaps
that is what you were getting at?

In simple cases r1 is the address of the current frame, and accessing
the machine word there gets you the previous frame, etc. (until you hit
a zero, there is no parent frame above that).  This is the *machine*
frame, not the C frame.  Often they are the same.  But there are
complications.  As long as you only use it for debug purposes, do not
use it for program logic, and are sure to check any pointer for nil,
things will work fine.  The kernel does not do any of the more
problematic cases I think, but no promises (dynamic stack alignment,
recursive functions, variable size stack allocations, PIC code (the
model of it used for shared libraries that is, not position-independent
code in general, as PowerPC mostly is no matter what), split stack, ...)

So at least do not follow a stack chain past the terminator, and do not
expect there to be exactly one frame per C function (there can be zero,
or more than one).  There also is the complication that there is no
sure-fire way to detect if a new frame has been set up for a function
(yet), of course.


Segher
