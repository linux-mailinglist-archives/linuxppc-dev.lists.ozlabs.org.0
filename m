Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5284C248CE5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 19:23:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWHmx3vXrzDqbt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 03:23:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhS4n89zDqXq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:17 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhG6lDGz9vCxl;
 Tue, 18 Aug 2020 19:19:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KmAtwbC2ajWH; Tue, 18 Aug 2020 19:19:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhG5hQJz9vCxg;
 Tue, 18 Aug 2020 19:19:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 904248B7EC;
 Tue, 18 Aug 2020 19:19:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id foYwuDOQMRXv; Tue, 18 Aug 2020 19:19:12 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C5D08B7D7;
 Tue, 18 Aug 2020 19:19:12 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0F0C965CF4; Tue, 18 Aug 2020 17:19:11 +0000 (UTC)
Message-Id: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 00/25] powerpc: Switch signal 32 to using unsafe_put_user()
 and friends
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:11 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series leads to a reduction from 2.55s to 1.73s of
the system CPU time with the following microbench app
on an mpc832x with KUAP (approx 32%)

This series replaces copies to users by unsafe_put_user() and friends
with user_write_access_begin() dance in signal32.

The advantages are:
- No KUAP unlock/lock at every copy
- More readable code.
- Better generated code.

Without KUAP, the difference is in the noise.

	void sigusr1(int sig) { }

	int main(int argc, char **argv)
	{
		int i = 100000;

		signal(SIGUSR1, sigusr1);
		for (;i--;)
		    raise(SIGUSR1);
		exit(0);
	}

An additional 0.10s reduction is achieved by removing
CONFIG_PPC_FPU, as the mpc832x has no FPU.

A bit less spectacular on an 8xx as KUAP is less heavy, prior to
the series (with KUAP) it ran in 8.10 ms. Once applies the removal
of FPU regs handling, we get 7.05s. With the full series, we get 6.9s.
If artificially re-activating FPU regs handling with the full series,
we get 7.6s.

So for the 8xx, the removal of the FPU regs copy is what makes the
difference, but the rework of handle_signal also have a benefit.

Same as above, without KUAP the difference is in the noise.

Difference since v1(RFC):
- Almost copies to user are now replaced by unsafe_ alternative.
- Reworked a bit the FPU registers handling following feedback from Michael.
- Fixed a few build failures reported by Mr Robot on the RFC.

Christophe Leroy (25):
  powerpc/signal: Move inline functions in signal.h
  powerpc/ptrace: Move declaration of ptrace_get_reg() and
    ptrace_set_reg()
  powerpc/ptrace: Consolidate reg index calculation
  powerpc/ptrace: Create ptrace_get_fpr() and ptrace_put_fpr()
  powerpc/signal: Don't manage floating point regs when no FPU
  powerpc/32s: Allow deselecting CONFIG_PPC_FPU on mpc832x
  powerpc/signal: Remove BUG_ON() in handler_signal functions
  powerpc/signal: Move access_ok() out of get_sigframe()
  powerpc/signal: Remove get_clean_sp()
  powerpc/signal: Call get_tm_stackpointer() from get_sigframe()
  powerpc/signal: Refactor bad frame logging
  powerpc/signal32: Simplify logging in handle_rt_signal32()
  powerpc/signal32: Move handle_signal32() close to handle_rt_signal32()
  powerpc/signal32: Rename local pointers in handle_rt_signal32()
  powerpc/signal32: Misc changes to make handle_[rt_]_signal32() more
    similar
  powerpc/signal32: Move signal trampoline setup to handle_[rt_]signal32
  powerpc/signal32: Switch handle_signal32() to user_access_begin()
    logic
  powerpc/signal32: Switch handle_rt_signal32() to user_access_begin()
    logic
  powerpc/signal32: Remove ifdefery in middle of if/else
  signal: Add unsafe_put_compat_sigset()
  powerpc/signal32: Add and use unsafe_put_sigset_t()
  powerpc/signal32: Switch swap_context() to user_access_begin() logic
  powerpc/signal: Create 'unsafe' versions of
    copy_[ck][fpr/vsx]_to_user()
  powerpc/signal32: Isolate non-copy actions in save_user_regs() and
    save_tm_user_regs()
  powerpc/signal32: Transform save_user_regs() and save_tm_user_regs()
    in 'unsafe' version

 arch/powerpc/Kconfig                     |   1 +
 arch/powerpc/include/asm/processor.h     |  16 +-
 arch/powerpc/include/asm/ptrace.h        |   6 -
 arch/powerpc/kernel/asm-offsets.c        |   2 +
 arch/powerpc/kernel/head_32.S            |   4 +
 arch/powerpc/kernel/process.c            |   4 +
 arch/powerpc/kernel/ptrace/Makefile      |   3 +-
 arch/powerpc/kernel/ptrace/ptrace-decl.h |  21 +
 arch/powerpc/kernel/ptrace/ptrace-fpu.c  |  40 ++
 arch/powerpc/kernel/ptrace/ptrace-view.c |   2 +
 arch/powerpc/kernel/ptrace/ptrace.c      |  54 +-
 arch/powerpc/kernel/ptrace/ptrace32.c    |   2 +
 arch/powerpc/kernel/signal.c             |  59 +--
 arch/powerpc/kernel/signal.h             | 115 ++++-
 arch/powerpc/kernel/signal_32.c          | 598 +++++++++++------------
 arch/powerpc/kernel/signal_64.c          |  21 +-
 arch/powerpc/kernel/traps.c              |   2 +
 arch/powerpc/platforms/Kconfig.cputype   |  15 +-
 include/linux/compat.h                   |  32 ++
 19 files changed, 566 insertions(+), 431 deletions(-)
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-fpu.c

-- 
2.25.0

