Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 914DD3AFFB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 10:57:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8KzY22Ctz3brv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 18:57:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lGTv2SSy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=lGTv2SSy; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Kz74xN5z2xff
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 18:57:22 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G8Kz452DXz9sTD;
 Tue, 22 Jun 2021 18:57:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1624352240;
 bh=4N0iE3BiGzG2H2XRtrdki6NbSg1/FapzS5ImwJS6NkE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lGTv2SSyvogdF75Vfdc5hHqg6AhfPPTZd7i58lZD6cR/P7kK5mIDrgWdUCjuzfZww
 Md3eWj6V4YxgXlj6GdS7RfuJ4W5n++9BQm8Q6SF57Ds61xElpp+Hp6aydqK+icPJvk
 z8FOEcGGRytaj5XYFRUX+qez+roaJK6vAA1Ba2HhW2POJcSkPnZhR8te3FHXT8tqD+
 pQuOuw3QpZhXVBcl8GIammXda+3UyfMxGY4EW1e5p+mJx7Sm0u56TTErXQBP8SY76r
 XvPs9C6VJzUvWd4xzrzctaSrjiRSG5K5k/HttSAeCMSGtwTwfUcCSGcCXjB96b99Q9
 dzIae2EZJ8iLw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/4] powerpc: Enable KFENCE on BOOK3S/64
In-Reply-To: <20210517061658.194708-5-jniethe5@gmail.com>
References: <20210517061658.194708-1-jniethe5@gmail.com>
 <20210517061658.194708-5-jniethe5@gmail.com>
Date: Tue, 22 Jun 2021 18:57:18 +1000
Message-ID: <877dim2s5t.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
>
> This reuses the DEBUG_PAGEALLOC logic.
>
> Tested with CONFIG_KFENCE + CONFIG_KUNIT + CONFIG_KFENCE_KUNIT_TEST on
> radix and hash.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> [jpn: Handle radix]
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/Kconfig                         |  2 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  2 +-
>  arch/powerpc/include/asm/kfence.h            | 19 +++++++++++++++++++
>  arch/powerpc/mm/book3s64/hash_utils.c        | 12 ++++++------
>  arch/powerpc/mm/book3s64/radix_pgtable.c     |  8 +++++---
>  5 files changed, 32 insertions(+), 11 deletions(-)

This makes lockdep very unhappy :(

  [   24.016750][    C0] ================================
  [   24.017145][    C0] WARNING: inconsistent lock state
  [   24.017600][    C0] 5.13.0-rc2-00196-g8bf29f9c76e2 #1 Not tainted
  [   24.018222][    C0] --------------------------------
  [   24.018612][    C0] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
  [   24.019146][    C0] S55runtest/104 [HC0[0]:SC1[1]:HE1:SE0] takes:
  [   24.019695][    C0] c00000000278bf50 (init_mm.page_table_lock){+.?.}-{2:2}, at: change_page_attr+0x54/0x290
  [   24.021847][    C0] {SOFTIRQ-ON-W} state was registered at:
  [   24.022353][    C0]   lock_acquire+0x128/0x600
  [   24.022941][    C0]   _raw_spin_lock+0x54/0x80
  [   24.023301][    C0]   change_page_attr+0x54/0x290
  [   24.023667][    C0]   __apply_to_page_range+0x550/0xa70
  [   24.024070][    C0]   change_memory_attr+0x7c/0x140
  [   24.024445][    C0]   bpf_prog_select_runtime+0x230/0x2a0
  [   24.024911][    C0]   bpf_migrate_filter+0x18c/0x1e0
  [   24.025310][    C0]   bpf_prog_create+0x178/0x1d0
  [   24.025681][    C0]   ptp_classifier_init+0x4c/0x80
  [   24.026090][    C0]   sock_init+0xe0/0x100
  [   24.026422][    C0]   do_one_initcall+0x88/0x4b0
  [   24.026790][    C0]   kernel_init_freeable+0x364/0x40c
  [   24.027196][    C0]   kernel_init+0x24/0x188
  [   24.027539][    C0]   ret_from_kernel_thread+0x5c/0x70
  [   24.027987][    C0] irq event stamp: 1322
  [   24.028315][    C0] hardirqs last  enabled at (1322): [<c0000000010996f4>] _raw_spin_unlock_irqrestore+0x94/0xd0
  [   24.029084][    C0] hardirqs last disabled at (1321): [<c000000001099268>] _raw_spin_lock_irqsave+0xa8/0xc0
  [   24.029813][    C0] softirqs last  enabled at (738): [<c00000000109a9b8>] __do_softirq+0x5f8/0x668
  [   24.030531][    C0] softirqs last disabled at (1271): [<c000000000159b84>] __irq_exit_rcu+0x1c4/0x1d0
  [   24.031271][    C0]
  [   24.031271][    C0] other info that might help us debug this:
  [   24.031917][    C0]  Possible unsafe locking scenario:
  [   24.031917][    C0]
  [   24.032460][    C0]        CPU0
  [   24.032720][    C0]        ----
  [   24.032980][    C0]   lock(init_mm.page_table_lock);
  [   24.033400][    C0]   <Interrupt>
  [   24.033668][    C0]     lock(init_mm.page_table_lock);
  [   24.034102][    C0]
  [   24.034102][    C0]  *** DEADLOCK ***
  [   24.034102][    C0]
  [   24.034735][    C0] 5 locks held by S55runtest/104:
  [   24.035162][    C0]  #0: c00000000a9ef098 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x3c/0xa0
  [   24.035998][    C0]  #1: c00000000a9ef130 (&tty->atomic_write_lock){+.+.}-{3:3}, at: file_tty_write.constprop.0+0xd8/0x3b0
  [   24.036849][    C0]  #2: c00000000a9ef2e8 (&tty->termios_rwsem){++++}-{3:3}, at: n_tty_write+0xd0/0x6b0
  [   24.037591][    C0]  #3: c0080000001d2378 (&ldata->output_lock){+.+.}-{3:3}, at: n_tty_write+0x248/0x6b0
  [   24.038342][    C0]  #4: c000000002618448 (rcu_callback){....}-{0:0}, at: rcu_core+0x450/0x1360
  [   24.039093][    C0]
  [   24.039093][    C0] stack backtrace:
  [   24.039727][    C0] CPU: 0 PID: 104 Comm: S55runtest Not tainted 5.13.0-rc2-00196-g8bf29f9c76e2 #1
  [   24.040790][    C0] Call Trace:
  [   24.041120][    C0] [c00000000adc2be0] [c000000000940868] dump_stack+0xec/0x144 (unreliable)
  [   24.041925][    C0] [c00000000adc2c30] [c0000000001f1b38] print_usage_bug.part.0+0x24c/0x278
  [   24.042611][    C0] [c00000000adc2cd0] [c0000000001eb0c0] mark_lock+0x950/0xc00
  [   24.043186][    C0] [c00000000adc2df0] [c0000000001ebb74] __lock_acquire+0x494/0x28b0
  [   24.043794][    C0] [c00000000adc2f20] [c0000000001eeba8] lock_acquire+0x128/0x600
  [   24.044384][    C0] [c00000000adc3020] [c000000001098f64] _raw_spin_lock+0x54/0x80
  [   24.044976][    C0] [c00000000adc3050] [c00000000008aa14] change_page_attr+0x54/0x290
  [   24.045586][    C0] [c00000000adc30b0] [c0000000004347e0] __apply_to_page_range+0x550/0xa70
  [   24.046238][    C0] [c00000000adc31a0] [c00000000008accc] change_memory_attr+0x7c/0x140
  [   24.046857][    C0] [c00000000adc31e0] [c000000000099f78] radix__kernel_map_pages+0x68/0x80
  [   24.047501][    C0] [c00000000adc3200] [c0000000004a8028] kfence_protect+0x48/0x80
  [   24.048091][    C0] [c00000000adc3230] [c0000000004a84a8] kfence_guarded_free+0x448/0x590
  [   24.048718][    C0] [c00000000adc3290] [c00000000049e1b0] __slab_free+0x400/0x6c0
  [   24.049307][    C0] [c00000000adc3390] [c0000000004a471c] kmem_cache_free+0x1ac/0x4e0
  [   24.049917][    C0] [c00000000adc3450] [c000000000147a10] free_task+0x70/0xe0
  [   24.050491][    C0] [c00000000adc3480] [c000000000154084] delayed_put_task_struct+0x134/0x250
  [   24.051149][    C0] [c00000000adc34c0] [c00000000022bb94] rcu_core+0x4b4/0x1360
  [   24.051727][    C0] [c00000000adc3580] [c00000000109a5cc] __do_softirq+0x20c/0x668
  [   24.052331][    C0] [c00000000adc3680] [c000000000159b84] __irq_exit_rcu+0x1c4/0x1d0
  [   24.052937][    C0] [c00000000adc36b0] [c000000000159dd0] irq_exit+0x20/0x50
  [   24.053496][    C0] [c00000000adc36d0] [c000000000028478] timer_interrupt+0x1a8/0x520
  [   24.054111][    C0] [c00000000adc3730] [c0000000000098c4] decrementer_common_virt+0x1a4/0x1b0
  [   24.054790][    C0] --- interrupt: 900 at arch_local_irq_restore+0x118/0x180
  [   24.055373][    C0] NIP:  c0000000000164b8 LR: c000000001099700 CTR: 0000000000000000
  [   24.055991][    C0] REGS: c00000000adc37a0 TRAP: 0900   Not tainted  (5.13.0-rc2-00196-g8bf29f9c76e2)
  [   24.056678][    C0] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 28004202  XER: 20040000
  [   24.057665][    C0] CFAR: c0000000000163c4 IRQMASK: 0
  [   24.057665][    C0] GPR00: c0000000010996f4 c00000000adc3a40 c0000000027dce00 0000000000000000
  [   24.057665][    C0] GPR04: c00000000ae26dc0 0000000000000006 c00000000adc39f4 0000000000000001
  [   24.057665][    C0] GPR08: 0000000079ce0000 0000000000008002 0000000000000001 9000000000001033
  [   24.057665][    C0] GPR12: 0000000000004000 c0000000034c0000 0000000000000000 0000000000000000
  [   24.057665][    C0] GPR16: 0000000000000000 0000000000000013 c0080000001d0000 c0080000001d2310
  [   24.057665][    C0] GPR20: c00000000a9ef000 7fffffffffffffff c00000000a9ef510 c00000000ae26300
  [   24.057665][    C0] GPR24: 0000000000000000 c00000000a75d410 0000000000000010 c00000000a683b80
  [   24.057665][    C0] GPR28: 0000000000000000 0000000000000000 c00000000a683b80 0000000000000000
  [   24.063433][    C0] NIP [c0000000000164b8] arch_local_irq_restore+0x118/0x180
  [   24.063978][    C0] LR [c000000001099700] _raw_spin_unlock_irqrestore+0xa0/0xd0
  [   24.064546][    C0] --- interrupt: 900
  [   24.064854][    C0] [c00000000adc3a40] [c0000000010996f4] _raw_spin_unlock_irqrestore+0x94/0xd0 (unreliable)
  [   24.065595][    C0] [c00000000adc3a70] [c000000000a1a944] hvc_write+0xb4/0x230
  [   24.066165][    C0] [c00000000adc3ad0] [c0000000009eeb20] n_tty_write+0x1a0/0x6b0
  [   24.066744][    C0] [c00000000adc3ba0] [c0000000009e64e0] file_tty_write.constprop.0+0x190/0x3b0
  [   24.067405][    C0] [c00000000adc3c60] [c0000000004e087c] new_sync_write+0x12c/0x1d0
  [   24.067997][    C0] [c00000000adc3d00] [c0000000004e3fa0] vfs_write+0x2a0/0x4b0
  [   24.068567][    C0] [c00000000adc3d60] [c0000000004e44b4] ksys_write+0x84/0x140
  [   24.069141][    C0] [c00000000adc3db0] [c0000000000300a4] system_call_exception+0x174/0x2e0
  [   24.069785][    C0] [c00000000adc3e10] [c00000000000cb5c] system_call_common+0xec/0x278
  [   24.070404][    C0] --- interrupt: c00 at 0x7fffa8f9067c
  [   24.071243][    C0] NIP:  00007fffa8f9067c LR: 00007fffa8f8218c CTR: 0000000000000000
  [   24.071834][    C0] REGS: c00000000adc3e80 TRAP: 0c00   Not tainted  (5.13.0-rc2-00196-g8bf29f9c76e2)
  [   24.072510][    C0] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 20002202  XER: 00000000
  [   24.073428][    C0] IRQMASK: 0
  [   24.073428][    C0] GPR00: 0000000000000004 00007fffee2147b0 00007fffa8fd7c00 0000000000000001
  [   24.073428][    C0] GPR04: 00007fffa8fd6860 0000000000000013 0000000000000000 0000000000000000
  [   24.073428][    C0] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  [   24.073428][    C0] GPR12: 0000000000000000 00007fffa8fd9960 0000000000000000 0000000000000000
  [   24.073428][    C0] GPR16: 0000000000000000 0000000000000000 0000000000000000 00000000100a3c28
  [   24.073428][    C0] GPR20: 00007fffee21ff98 00000000100a3be8 0000000000000000 00000000100e0d60
  [   24.073428][    C0] GPR24: 0000000000000000 00007fffa8fd6468 0000000000000020 0000000000000013
  [   24.073428][    C0] GPR28: 00007fffa8fd6860 0000000000000001 00007fffa8fd9960 0000000000000004
  [   24.079055][    C0] NIP [00007fffa8f9067c] 0x7fffa8f9067c
  [   24.079482][    C0] LR [00007fffa8f8218c] 0x7fffa8f8218c
  [   24.079901][    C0] --- interrupt: c00


AFAICS caused by kfence calling into change_page_attr() from softirq
context, and taking init_mm.page_table_lock. But elsewhere we take
init_mm.page_table_lock with interrupts enabled.

To fix it I guess we either need to make change_page_attr() safe to call
from anywhere, or do something kfence specific.

cheers
