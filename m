Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A00A24292B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 14:14:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRTCg4vhWzDqLD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 22:14:39 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRT1g5GFbzDqZR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 22:05:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BRT1V4tXSzB09ZR;
 Wed, 12 Aug 2020 14:05:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Il1RUyWvlQLG; Wed, 12 Aug 2020 14:05:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BRT1V3xygzB09ZQ;
 Wed, 12 Aug 2020 14:05:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E5BB58B826;
 Wed, 12 Aug 2020 14:05:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id m3Yep6ZUFDWt; Wed, 12 Aug 2020 14:05:51 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B06B18B7FC;
 Wed, 12 Aug 2020 14:05:51 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 74A6A65C34; Wed, 12 Aug 2020 12:05:51 +0000 (UTC)
Message-Id: <cover.1597233555.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 00/19] powerpc: Switch signal 32 to using
 user_access_begin() and friends
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ldv@altlinux.org, viro@zeniv.linux.org.uk
Date: Wed, 12 Aug 2020 12:05:51 +0000 (UTC)
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

This series replaces copies to users by unsafe_put_user() and friends
with user_write_access_begin() dance in signal32.

The advantages are:
- No KUAP unlock/lock at every copy
- More readable code.
- Better generated code.

Copying Al Viro who did it on x86 and may have suggestions,
and Dmitry V. Levin who introduced put_compat_sigset()

Christophe Leroy (19):
  powerpc/signal: Move inline functions in signal.h
  powerpc/ptrace: Move declaration of ptrace_get_reg() and
    ptrace_set_reg()
  powerpc/ptrace: Consolidate reg index calculation
  powerpc/ptrace: Create ptrace_get_fpr() and ptrace_put_fpr()
  powerpc/signal: Don't manage floating point regs when no FPU
  powerpc/32s: Allow deselecting CONFIG_PPC_FPU on mpc832x
  powerpc/signal: Move access_ok() out of get_sigframe()
  powerpc/signal: Remove get_clean_sp()
  powerpc/signal: Call get_tm_stackpointer() from get_sigframe()
  powerpc/signal: Refactor bad frame logging
  powerpc/signal32: Simplify logging in handle_rt_signal32()
  powerpc/signal32: Regroup copies in save_user_regs() and
    save_tm_user_regs()
  powerpc/signal32: Create 'unsafe' versions of
    copy_[ck][fpr/vsx]_to_user()
  powerpc/signal32: Switch save_user_regs() and save_tm_user_regs() to
    user_access_begin() logic
  powerpc/signal32: Switch handle_signal32() to user_access_begin()
    logic
  powerpc/signal32: Switch handle_rt_signal32() to user_access_begin()
    logic
  signal: Add unsafe_put_compat_sigset()
  powerpc/signal32: Add and use unsafe_put_sigset_t()
  powerpc/signal32: Switch swap_context() to user_access_begin() logic

 arch/powerpc/Kconfig                     |   1 +
 arch/powerpc/include/asm/processor.h     |  16 +-
 arch/powerpc/include/asm/ptrace.h        |   6 -
 arch/powerpc/kernel/asm-offsets.c        |   2 +
 arch/powerpc/kernel/process.c            |   4 +
 arch/powerpc/kernel/ptrace/Makefile      |   3 +-
 arch/powerpc/kernel/ptrace/ptrace-decl.h |  21 ++
 arch/powerpc/kernel/ptrace/ptrace-fpu.c  |  40 +++
 arch/powerpc/kernel/ptrace/ptrace-view.c |   2 +
 arch/powerpc/kernel/ptrace/ptrace.c      |  54 +---
 arch/powerpc/kernel/signal.c             |  59 ++--
 arch/powerpc/kernel/signal.h             | 109 ++++++-
 arch/powerpc/kernel/signal_32.c          | 386 ++++++++++++-----------
 arch/powerpc/kernel/signal_64.c          |  19 +-
 arch/powerpc/kernel/traps.c              |   2 +
 arch/powerpc/platforms/Kconfig.cputype   |  15 +-
 include/linux/compat.h                   |  32 ++
 17 files changed, 462 insertions(+), 309 deletions(-)
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-fpu.c

-- 
2.25.0

