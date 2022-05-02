Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB14517197
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 16:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsQVp1RFkz3bs4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 00:30:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KsQVN5FBBz2xCB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 00:30:19 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 242ER7iQ010609;
 Mon, 2 May 2022 09:27:07 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 242ER5hm010608;
 Mon, 2 May 2022 09:27:05 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 2 May 2022 09:27:05 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/vdso: Fix incorrect CFI in gettimeofday.S
Message-ID: <20220502142705.GU25951@gate.crashing.org>
References: <20220502125010.1319370-1-mpe@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502125010.1319370-1-mpe@ellerman.id.au>
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

On Mon, May 02, 2022 at 10:50:10PM +1000, Michael Ellerman wrote:
> As reported by Alan, the CFI (Call Frame Information) in the VDSO time
> routines is incorrect since commit ce7d8056e38b ("powerpc/vdso: Prepare
> for switching VDSO to generic C implementation.").
> 
> In particular the changes to the frame address register (r1) are not
> properly described, which prevents gdb from being able to generate a
> backtrace from inside VDSO functions, eg:

Note that r1 is not the same as the CFA: r1 is the stack pointer, while
the CFA is a DWARF concept.  Often (but not always) they point to the
same thing, for us.  "When we change the stack pointer we should change
the DWARF CFA as well"?

> Alan helpfully describes some rules for correctly maintaining the CFI information:
> 
>   1) Every adjustment to the current frame address reg (ie. r1) must be
>      described, and exactly at the instruction where r1 changes. Why?
>      Because stack unwinding might want to access previous frames.
>   2) If a function changes LR or any non-volatile register, the save
>      location for those regs must be given. The cfi can be at any
>      instruction after the saves up to the point that the reg is
>      changed. (Exception: LR save should be described before a bl.)

That isn't an exception?  bl changes the current LR after all :-)

>   3) If asychronous unwind info is needed then restores of LR and
>      non-volatile regs must also be described. The cfi can be at any
>      instruction after the reg is restored up to the point where the
>      save location is (potentially) trashed.

The general rule is that your CFI must enable a debugger to reconstruct
the state at function entry (or it can explicitly say something has been
clobbered), using only data available at any point in the program we are
at now.  If something is available in multiple places (in some
registers, somewhere in memory) either place can be used; only one such
place is described in the CFI.  A store or even a restore does not have
to be described at the exact spot it happens (but that is by far the
most readable / least confusing way to do it).

> --- a/arch/powerpc/kernel/vdso/gettimeofday.S
> +++ b/arch/powerpc/kernel/vdso/gettimeofday.S
> @@ -22,12 +22,15 @@
>  .macro cvdso_call funct call_time=0
>    .cfi_startproc
>  	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
>  	mflr		r0
> -  .cfi_register lr, r0
>  	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
>  	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> +  .cfi_rel_offset lr, PPC_MIN_STKFRM + PPC_LR_STKOFF

So you don't need to describe lr being saved in r0, because at all times
it is available elsewhere, namely in the lr reg still, or on the stack.
If lr could be clobbered before r0 is saved to the stack slot you would
still need to describe r0 containing the value of lr at function entry,
because that value then isn't available elsewhere.

The patch looks good to me :-)

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
