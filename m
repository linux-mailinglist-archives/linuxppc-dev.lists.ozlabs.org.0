Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6AF51A1EA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 16:12:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktf0L6yZtz3brQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 00:12:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Ktdzv0yL8z3bcy
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 00:11:37 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 244E8ToY024218;
 Wed, 4 May 2022 09:08:29 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 244E8Txd024217;
 Wed, 4 May 2022 09:08:29 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 4 May 2022 09:08:29 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/vdso: Fix incorrect CFI in gettimeofday.S
Message-ID: <20220504140829.GY25951@gate.crashing.org>
References: <20220502125010.1319370-1-mpe@ellerman.id.au>
 <20220502142705.GU25951@gate.crashing.org>
 <878rrhv5x1.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rrhv5x1.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, amodra@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Wed, May 04, 2022 at 10:27:54PM +1000, Michael Ellerman wrote:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> > Note that r1 is not the same as the CFA: r1 is the stack pointer, while
> > the CFA is a DWARF concept.  Often (but not always) they point to the
> > same thing, for us.  "When we change the stack pointer we should change
> > the DWARF CFA as well"?
>  
> Thanks, I reworded it a bit:
> 
>     DWARF has a concept called the CFA (Canonical Frame Address), which on
>     powerpc is calculated as an offset from the stack pointer (r1). That
>     means when the stack pointer is changed there must be a corresponding
>     CFI directive to update the calculation of the CFA.

The CFA only uses r1 if it does not have a separate frame pointer, in
which case that is used.  "... is usually calculated ..." maybe?  A bit
of handwaving is better than giving the impression you are stating
something exact, if you don't.

> >>   2) If a function changes LR or any non-volatile register, the save
> >>      location for those regs must be given. The cfi can be at any
> >>      instruction after the saves up to the point that the reg is
> >>      changed. (Exception: LR save should be described before a bl.)
> >
> > That isn't an exception?  bl changes the current LR after all :-)
>  
> As Alan mentioned the exception is the the CFI has to appear before the
> bl not after, I noted that in the change log.

You have a bit of freedom where you place your CFI statements, but you
cannot place them too late (or too early).  This is true for all CFI
statements.  I suppose the final consequence of that can be a bit
surprising here :-)


Segher
