Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0152AA46E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 11:37:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CStwq0wR9zDrSL
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 21:36:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CStv55BDVzDrQk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 21:35:21 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CSttr0p47z9txmP;
 Sat,  7 Nov 2020 11:35:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id efRaid7QQPGU; Sat,  7 Nov 2020 11:35:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CSttq6yJJz9txmM;
 Sat,  7 Nov 2020 11:35:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 23BCA8B776;
 Sat,  7 Nov 2020 11:35:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OeTtJxx8UyyV; Sat,  7 Nov 2020 11:35:17 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A53768B75B;
 Sat,  7 Nov 2020 11:35:16 +0100 (CET)
Subject: Re: [RFC PATCH 0/9] powerpc/64s: fast interrupt exit
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20201106155929.2246055-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <fdde16b8-2bb4-f6a2-3c29-61d0169453cf@csgroup.eu>
Date: Sat, 7 Nov 2020 11:35:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106155929.2246055-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/11/2020 à 16:59, Nicholas Piggin a écrit :
> This series attempts to improve the speed of interrupts and system calls
> in two major ways.
> 
> Firstly, the SRR/HSRR registers do not need to be reloaded if they were
> not used or clobbered fur the duration of the interrupt.
> 
> Secondly, an alternate return location facility is added for soft-masked
> asynchronous interrupts and then that's used to set everything up for
> return without having to disable MSR RI or EE.
> 
> After this series, the entire system call / interrupt handler fast path
> executes no mtsprs and one mtmsrd to enable interrupts initially, and
> the system call vectored path doesn't even need to do that.

Interesting series.

Unfortunately, can't be done on PPC32 (at least on non bookE), because it would mean mapping kernel 
at 0 instead of 0xC0000000. Not sure libc would like it, and anyway it would be an issue for 
catching NULL pointer dereferencing, unless we use page tables instead of BATs to map kernel mem, 
which would be serious performance cut.

Christophe

> 
> Thanks,
> Nick
> 
> Nicholas Piggin (9):
>    powerpc/64s: syscall real mode entry use mtmsrd rather than rfid
>    powerpc/64s: system call avoid setting MSR[RI] until we set MSR[EE]
>    powerpc/64s: introduce different functions to return from SRR vs HSRR
>      interrupts
>    powerpc/64s: avoid reloading (H)SRR registers if they are still valid
>    powerpc/64: move interrupt return asm to interrupt_64.S
>    powerpc/64s: save one more register in the masked interrupt handler
>    powerpc/64s: allow alternate return locations for soft-masked
>      interrupts
>    powerpc/64s: interrupt soft-enable race fix
>    powerpc/64s: use interrupt restart table to speed up return from
>      interrupt
> 
>   arch/powerpc/Kconfig.debug                 |   5 +
>   arch/powerpc/include/asm/asm-prototypes.h  |   4 +-
>   arch/powerpc/include/asm/head-64.h         |   2 +-
>   arch/powerpc/include/asm/interrupt.h       |  18 +
>   arch/powerpc/include/asm/paca.h            |   3 +
>   arch/powerpc/include/asm/ppc_asm.h         |   8 +
>   arch/powerpc/include/asm/ptrace.h          |  28 +-
>   arch/powerpc/kernel/asm-offsets.c          |   5 +
>   arch/powerpc/kernel/entry_64.S             | 508 ---------------
>   arch/powerpc/kernel/exceptions-64s.S       | 180 ++++--
>   arch/powerpc/kernel/fpu.S                  |   2 +
>   arch/powerpc/kernel/head_64.S              |   5 +-
>   arch/powerpc/kernel/interrupt_64.S         | 720 +++++++++++++++++++++
>   arch/powerpc/kernel/irq.c                  |  79 ++-
>   arch/powerpc/kernel/kgdb.c                 |   2 +-
>   arch/powerpc/kernel/kprobes-ftrace.c       |   2 +-
>   arch/powerpc/kernel/kprobes.c              |  10 +-
>   arch/powerpc/kernel/process.c              |  21 +-
>   arch/powerpc/kernel/rtas.c                 |  13 +-
>   arch/powerpc/kernel/signal.c               |   2 +-
>   arch/powerpc/kernel/signal_64.c            |  14 +
>   arch/powerpc/kernel/syscall_64.c           | 242 ++++---
>   arch/powerpc/kernel/syscalls.c             |   2 +
>   arch/powerpc/kernel/traps.c                |  18 +-
>   arch/powerpc/kernel/vector.S               |   6 +-
>   arch/powerpc/kernel/vmlinux.lds.S          |  10 +
>   arch/powerpc/lib/Makefile                  |   2 +-
>   arch/powerpc/lib/restart_table.c           |  26 +
>   arch/powerpc/lib/sstep.c                   |   5 +-
>   arch/powerpc/math-emu/math.c               |   2 +-
>   arch/powerpc/mm/fault.c                    |   2 +-
>   arch/powerpc/perf/core-book3s.c            |  19 +-
>   arch/powerpc/platforms/powernv/opal-call.c |   3 +
>   arch/powerpc/sysdev/fsl_pci.c              |   2 +-
>   34 files changed, 1244 insertions(+), 726 deletions(-)
>   create mode 100644 arch/powerpc/kernel/interrupt_64.S
>   create mode 100644 arch/powerpc/lib/restart_table.c
> 
