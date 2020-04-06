Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7648619F735
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 15:51:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wsQD63h2zDrHp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 23:51:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wrQ72KqszDqbt
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 23:06:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48wrQ63WhXz9sSy; Mon,  6 Apr 2020 23:06:05 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d16a58f8854b194c964a4bbe8156ec624ebfdbd2
In-Reply-To: <20200403131006.123243-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc: improve ppc_save_regs
Message-Id: <48wrQ63WhXz9sSy@ozlabs.org>
Date: Mon,  6 Apr 2020 23:06:05 +1000 (AEST)
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-04-03 at 13:10:05 UTC, Nicholas Piggin wrote:
> Make ppc_save_regs a bit more useful:
> - Set NIP to our caller rather rather than the caller's caller (which is
>   what we save to LR in the stack frame).
> - Set SOFTE to the current irq soft-mask state rather than
>   uninitialised.
> - Zero CFAR rather than leave it uninitialised.
> 
> In qemu, injecting a nmi to an idle CPU gives a nicer stack trace (note
> NIP, IRQMASK, CFAR).
> 
>   Oops: System Reset, sig: 6 [#1]
>   LE PAGE_SIZE=64K MMU=Hash PREEMPT SMP NR_CPUS=2048 NUMA PowerNV
>   Modules linked in:
>   CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.6.0-rc2-00429-ga76e38fd80bf #1277
>   NIP:  c0000000000b6e5c LR: c0000000000b6e5c CTR: c000000000b06270
>   REGS: c00000000173fb08 TRAP: 0100   Not tainted
>   MSR:  9000000000001033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28000224  XER: 00000000
>   CFAR: c0000000016a2128 IRQMASK: c00000000173fc80
>   GPR00: c0000000000b6e5c c00000000173fc80 c000000001743400 c00000000173fb08
>   GPR04: 0000000000000000 0000000000000000 0000000000000008 0000000000000001
>   GPR08: 00000001fea80000 0000000000000000 0000000000000000 ffffffffffffffff
>   GPR12: c000000000b06270 c000000001930000 00000000300026c0 0000000000000000
>   GPR16: 0000000000000000 0000000000000000 0000000000000003 c0000000016a2128
>   GPR20: c0000001ffc97148 0000000000000001 c000000000f289a8 0000000000080000
>   GPR24: c0000000016e1480 000000011dc870ba 0000000000000000 0000000000000003
>   GPR28: c0000000016a2128 c0000001ffc97148 c0000000016a2260 0000000000000003
>   NIP [c0000000000b6e5c] power9_idle_type+0x5c/0x70
>   LR [c0000000000b6e5c] power9_idle_type+0x5c/0x70
>   Call Trace:
>   [c00000000173fc80] [c0000000000b6e5c] power9_idle_type+0x5c/0x70 (unreliable)
>   [c00000000173fcb0] [c000000000b062b0] stop_loop+0x40/0x60
>   [c00000000173fce0] [c000000000b022d8] cpuidle_enter_state+0xa8/0x660
>   [c00000000173fd60] [c000000000b0292c] cpuidle_enter+0x4c/0x70
>   [c00000000173fda0] [c00000000017624c] call_cpuidle+0x4c/0x90
>   [c00000000173fdc0] [c000000000176768] do_idle+0x338/0x460
>   [c00000000173fe60] [c000000000176b3c] cpu_startup_entry+0x3c/0x40
>   [c00000000173fe90] [c0000000000126b4] rest_init+0x124/0x140
>   [c00000000173fed0] [c0000000010948d4] start_kernel+0x938/0x988
>   [c00000000173ff90] [c00000000000cdcc] start_here_common+0x1c/0x20
> 
>   Oops: System Reset, sig: 6 [#1]
>   LE PAGE_SIZE=64K MMU=Hash PREEMPT SMP NR_CPUS=2048 NUMA PowerNV
>   Modules linked in:
>   CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.6.0-rc2-00430-gddce91b8712f #1278
>   NIP:  c00000000001d150 LR: c0000000000b6e5c CTR: c000000000b06270
>   REGS: c00000000173fb08 TRAP: 0100   Not tainted
>   MSR:  9000000000001033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28000224  XER: 00000000
>   CFAR: 0000000000000000 IRQMASK: 1
>   GPR00: c0000000000b6e5c c00000000173fc80 c000000001743400 c00000000173fb08
>   GPR04: 0000000000000000 0000000000000000 0000000000000008 0000000000000001
>   GPR08: 00000001fea80000 0000000000000000 0000000000000000 ffffffffffffffff
>   GPR12: c000000000b06270 c000000001930000 00000000300026c0 0000000000000000
>   GPR16: 0000000000000000 0000000000000000 0000000000000003 c0000000016a2128
>   GPR20: c0000001ffc97148 0000000000000001 c000000000f289a8 0000000000080000
>   GPR24: c0000000016e1480 00000000b68db8ce 0000000000000000 0000000000000003
>   GPR28: c0000000016a2128 c0000001ffc97148 c0000000016a2260 0000000000000003
>   NIP [c00000000001d150] replay_system_reset+0x30/0xa0
>   LR [c0000000000b6e5c] power9_idle_type+0x5c/0x70
>   Call Trace:
>   [c00000000173fc80] [c0000000000b6e5c] power9_idle_type+0x5c/0x70 (unreliable)
>   [c00000000173fcb0] [c000000000b062b0] stop_loop+0x40/0x60
>   [c00000000173fce0] [c000000000b022d8] cpuidle_enter_state+0xa8/0x660
>   [c00000000173fd60] [c000000000b0292c] cpuidle_enter+0x4c/0x70
>   [c00000000173fda0] [c00000000017624c] call_cpuidle+0x4c/0x90
>   [c00000000173fdc0] [c000000000176768] do_idle+0x338/0x460
>   [c00000000173fe60] [c000000000176b38] cpu_startup_entry+0x38/0x40
>   [c00000000173fe90] [c0000000000126b4] rest_init+0x124/0x140
>   [c00000000173fed0] [c0000000010948d4] start_kernel+0x938/0x988
>   [c00000000173ff90] [c00000000000cdcc] start_here_common+0x1c/0x20
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d16a58f8854b194c964a4bbe8156ec624ebfdbd2

cheers
