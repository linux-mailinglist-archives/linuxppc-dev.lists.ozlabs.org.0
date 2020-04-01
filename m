Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B393B19ACFD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 15:40:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48snQC51CDzDqVP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:40:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48smMt55NbzDr2K
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 23:53:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48smMs3qCbz9sTW; Wed,  1 Apr 2020 23:53:29 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a2e366832f3f4d5e1b47b7c7f7c41977bd5100f4
In-Reply-To: <20200325104144.158362-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/64: mark emergency stacks valid to unwind
Message-Id: <48smMs3qCbz9sTW@ozlabs.org>
Date: Wed,  1 Apr 2020 23:53:29 +1100 (AEDT)
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

On Wed, 2020-03-25 at 10:41:44 UTC, Nicholas Piggin wrote:
> Before:
> 
>   WARNING: CPU: 0 PID: 494 at arch/powerpc/kernel/irq.c:343
>   CPU: 0 PID: 494 Comm: a Tainted: G        W
>   NIP:  c00000000001ed2c LR: c000000000d13190 CTR: c00000000003f910
>   REGS: c0000001fffd3870 TRAP: 0700   Tainted: G        W
>   MSR:  8000000000021003 <SF,ME,RI,LE>  CR: 28000488  XER: 00000000
>   CFAR: c00000000001ec90 IRQMASK: 0
>   GPR00: c000000000aeb12c c0000001fffd3b00 c0000000012ba300 0000000000000000
>   GPR04: 0000000000000000 0000000000000000 000000010bd207c8 6b00696e74657272
>   GPR08: 0000000000000000 0000000000000000 0000000000000000 efbeadde00000000
>   GPR12: 0000000000000000 c0000000014a0000 0000000000000000 0000000000000000
>   GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR24: 0000000000000000 0000000000000000 0000000000000000 000000010bd207bc
>   GPR28: 0000000000000000 c00000000148a898 0000000000000000 c0000001ffff3f50
>   NIP [c00000000001ed2c] arch_local_irq_restore.part.0+0xac/0x100
>   LR [c000000000d13190] _raw_spin_unlock_irqrestore+0x50/0xc0
>   Call Trace:
>   Instruction dump:
>   60000000 7d2000a6 71298000 41820068 39200002 7d210164 4bffff9c 60000000
>   60000000 7d2000a6 71298000 4c820020 <0fe00000> 4e800020 60000000 60000000
> 
> After:
> 
>   WARNING: CPU: 0 PID: 499 at arch/powerpc/kernel/irq.c:343
>   CPU: 0 PID: 499 Comm: a Not tainted
>   NIP:  c00000000001ed2c LR: c000000000d13210 CTR: c00000000003f980
>   REGS: c0000001fffd3870 TRAP: 0700   Not tainted
>   MSR:  8000000000021003 <SF,ME,RI,LE>  CR: 28000488  XER: 00000000
>   CFAR: c00000000001ec90 IRQMASK: 0
>   GPR00: c000000000aeb1ac c0000001fffd3b00 c0000000012ba300 0000000000000000
>   GPR04: 0000000000000000 0000000000000000 00000001347607c8 6b00696e74657272
>   GPR08: 0000000000000000 0000000000000000 0000000000000000 efbeadde00000000
>   GPR12: 0000000000000000 c0000000014a0000 0000000000000000 0000000000000000
>   GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR24: 0000000000000000 0000000000000000 0000000000000000 00000001347607bc
>   GPR28: 0000000000000000 c00000000148a898 0000000000000000 c0000001ffff3f50
>   NIP [c00000000001ed2c] arch_local_irq_restore.part.0+0xac/0x100
>   LR [c000000000d13210] _raw_spin_unlock_irqrestore+0x50/0xc0
>   Call Trace:
>   [c0000001fffd3b20] [c000000000aeb1ac] of_find_property+0x6c/0x90
>   [c0000001fffd3b70] [c000000000aeb1f0] of_get_property+0x20/0x40
>   [c0000001fffd3b90] [c000000000042cdc] rtas_token+0x3c/0x70
>   [c0000001fffd3bb0] [c0000000000dc318] fwnmi_release_errinfo+0x28/0x70
>   [c0000001fffd3c10] [c0000000000dcd8c] pseries_machine_check_realmode+0x1dc/0x540
>   [c0000001fffd3cd0] [c00000000003fe04] machine_check_early+0x54/0x70
>   [c0000001fffd3d00] [c000000000008384] machine_check_early_common+0x134/0x1f0
>   --- interrupt: 200 at 0x1347607c8
>       LR = 0x7fffafbd8328
>   Instruction dump:
>   60000000 7d2000a6 71298000 41820068 39200002 7d210164 4bffff9c 60000000
>   60000000 7d2000a6 71298000 4c820020 <0fe00000> 4e800020 60000000 60000000
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a2e366832f3f4d5e1b47b7c7f7c41977bd5100f4

cheers
