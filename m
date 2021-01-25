Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 777EC30268D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 15:56:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPXxl72pkzDr1q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 01:56:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPXmN4Y81zDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 01:48:16 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DPXm76ZRTz9v0Gl;
 Mon, 25 Jan 2021 15:48:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zG_eQLxfB_tD; Mon, 25 Jan 2021 15:48:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DPXm75L2Vz9v0Gh;
 Mon, 25 Jan 2021 15:48:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4AD6D8B79F;
 Mon, 25 Jan 2021 15:48:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zF5ohHZvB0O4; Mon, 25 Jan 2021 15:48:13 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F3E8A8B79E;
 Mon, 25 Jan 2021 15:48:12 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CC49566AD8; Mon, 25 Jan 2021 14:48:12 +0000 (UTC)
Message-Id: <cover.1611585031.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 00/23] powerpc/32: Implement C syscall entry/exit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon, 25 Jan 2021 14:48:12 +0000 (UTC)
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

This series implements C syscall entry/exit for PPC32. It reuses
the work already done for PPC64.

This series is based on Nick's v6 series "powerpc: interrupt wrappers".

Patch 1 is a bug fix submitted separately but this series depends on it.
Patches 2-4 are an extract from the series "powerpc/32: Reduce head
complexity and re-activate MMU earlier". The changes here are limited
to system calls. That series will be respined to only contain exception
related changes and the syscall changes will remain in this series.
Patches 5-16 are preparatory changes.
Patch 17 is THE patch that changes to C syscall entry/exit
Patches 18-23 are optimisations.

In terms on performance we have the following number of cycles on an
8xx running null_syscall benchmark:
- mainline: 296 cycles
- after patch 4: 283 cycles
- after patch 16: 304 cycles
- after patch 17: 348 cycles
- at the end of the series: 320 cycles

So in summary, we have a degradation of performance of 8% on null_syscall.

I think it is not a big degradation, it is worth it.

v4 is the first mature version.

Christophe Leroy (23):
  powerpc/32s: Add missing call to kuep_lock on syscall entry
  powerpc/32: Always enable data translation on syscall entry
  powerpc/32: On syscall entry, enable instruction translation at the
    same time as data
  powerpc/32: Reorder instructions to avoid using CTR in syscall entry
  powerpc/64s: Make kuap_check_amr() and kuap_get_and_check_amr()
    generic
  powerpc/32s: Create C version of kuap_user/kernel_restore() and
    friends
  powerpc/8xx: Create C version of kuap_user/kernel_restore() and
    friends
  powerpc/irq: Add helper to set regs->softe
  powerpc/irq: Rework helpers that manipulate MSR[EE/RI]
  powerpc/irq: Add stub irq_soft_mask_return() for PPC32
  powerpc/syscall: Rename syscall_64.c into syscall.c
  powerpc/syscall: Make syscall.c buildable on PPC32
  powerpc/syscall: Use is_compat_task()
  powerpc/syscall: Save r3 in regs->orig_r3
  powerpc/syscall: Change condition to check MSR_RI
  powerpc/32: Always save non volatile GPRs at syscall entry
  powerpc/syscall: implement system call entry/exit logic in C for PPC32
  powerpc/32: Remove verification of MSR_PR on syscall in the ASM entry
  powerpc/syscall: Avoid stack frame in likely part of
    system_call_exception()
  powerpc/syscall: Do not check unsupported scv vector on PPC32
  powerpc/syscall: Remove FULL_REGS verification in
    system_call_exception
  powerpc/syscall: Optimise checks in beginning of
    system_call_exception()
  powerpc/syscall: Avoid storing 'current' in another pointer

 arch/powerpc/include/asm/book3s/32/kup.h      |  33 ++
 arch/powerpc/include/asm/book3s/64/kup.h      |  24 +-
 arch/powerpc/include/asm/hw_irq.h             |  91 ++++--
 arch/powerpc/include/asm/kup.h                |   9 +-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |  27 ++
 arch/powerpc/include/asm/reg.h                |   1 +
 arch/powerpc/kernel/Makefile                  |   4 +-
 arch/powerpc/kernel/entry_32.S                | 305 ++----------------
 arch/powerpc/kernel/entry_64.S                |   1 -
 arch/powerpc/kernel/head_32.h                 |  76 +----
 arch/powerpc/kernel/head_booke.h              |  27 +-
 .../kernel/{syscall_64.c => syscall.c}        |  57 ++--
 arch/powerpc/kernel/syscalls/syscall.tbl      |  20 +-
 13 files changed, 225 insertions(+), 450 deletions(-)
 rename arch/powerpc/kernel/{syscall_64.c => syscall.c} (90%)

-- 
2.25.0

