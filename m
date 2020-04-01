Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4491519AD37
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 15:57:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48snns3QFlzDr1P
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:57:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48smN815HqzDr22
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 23:53:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 48smN56xCzz9sTZ; Wed,  1 Apr 2020 23:53:41 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48smN53KSzz9sTX; Wed,  1 Apr 2020 23:53:40 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c7def7fbdeaa25feaa19caf4a27c5d10bd8789e4
In-Reply-To: <20200401023836.3286664-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64/tm: Don't let userspace set regs->trap via
 sigreturn
Message-Id: <48smN53KSzz9sTX@ozlabs.org>
Date: Wed,  1 Apr 2020 23:53:40 +1100 (AEDT)
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
Cc: mikey@neuling.org, npiggin@gmail.com, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-04-01 at 02:38:36 UTC, Michael Ellerman wrote:
> In restore_tm_sigcontexts() we take the trap value directly from the
> user sigcontext with no checking:
> 
> 	err |= __get_user(regs->trap, &sc->gp_regs[PT_TRAP]);
> 
> This means we can be in the kernel with an arbitrary regs->trap value.
> 
> Although that's not immediately problematic, there is a risk we could
> trigger one of the uses of CHECK_FULL_REGS():
> 
> 	#define CHECK_FULL_REGS(regs)	BUG_ON(regs->trap & 1)
> 
> It can also cause us to unnecessarily save non-volatile GPRs again in
> save_nvgprs(), which shouldn't be problematic but is still wrong.
> 
> It's also possible it could trick the syscall restart machinery, which
> relies on regs->trap not being == 0xc00 (see 9a81c16b5275 ("powerpc:
> fix double syscall restarts")), though I haven't been able to make
> that happen.
> 
> Finally it doesn't match the behaviour of the non-TM case, in
> restore_sigcontext() which zeroes regs->trap.
> 
> So change restore_tm_sigcontexts() to zero regs->trap.
> 
> This was discovered while testing Nick's upcoming rewrite of the
> syscall entry path. In that series the call to save_nvgprs() prior to
> signal handling (do_notify_resume()) is removed, which leaves the
> low-bit of regs->trap uncleared which can then trigger the FULL_REGS()
> WARNs in setup_tm_sigcontexts().
> 
> Fixes: 2b0a576d15e0 ("powerpc: Add new transactional memory state to the signal context")
> Cc: stable@vger.kernel.org # v3.9+
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/c7def7fbdeaa25feaa19caf4a27c5d10bd8789e4

cheers
