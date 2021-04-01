Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2653514C4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 14:22:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB2PW3hwsz3bwN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 23:22:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=gszLMzW8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=gszLMzW8; dkim-atps=neutral
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB2P35Zplz2xdN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 23:21:58 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1617279715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eW8pAnIayldEm1B55Y6sLVe6CRWlvBKHn4flF3zxEZA=;
 b=gszLMzW8RwZal8nPtgjXEa3lBBuovgYMXPDk9fIl09T2HiDxo3bXO1Emk1xlxN1DylqM+p
 fJf880WFv4pCJoBHmxch2VVw8HcMS2foGhH1A7eU1SmcpQA1d02/Ke9uyzdXyLc9xGG9du
 zbe9scOKZCHGMMMBzQyPGFTolRbPaNg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5CD0DB2E5;
 Thu,  1 Apr 2021 12:21:55 +0000 (UTC)
Date: Thu, 1 Apr 2021 14:21:51 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v2 2/5] printk: remove safe buffers
Message-ID: <YGW63/elFr/gYW1u@alley>
References: <20210330153512.1182-1-john.ogness@linutronix.de>
 <20210330153512.1182-3-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330153512.1182-3-john.ogness@linutronix.de>
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
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Paul Mackerras <paulus@samba.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Rafael Aquini <aquini@redhat.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Yue Hu <huyue2@yulong.com>,
 Jordan Niethe <jniethe5@gmail.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Alistair Popple <alistair@popple.id.au>,
 "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2021-03-30 17:35:09, John Ogness wrote:
> With @logbuf_lock removed, the high level printk functions for
> storing messages are lockless. Messages can be stored from any
> context, so there is no need for the NMI and safe buffers anymore.
> Remove the NMI and safe buffers.
> 
> Although the safe buffers are removed, the NMI and safe context
> tracking is still in place. In these contexts, store the message
> immediately but still use irq_work to defer the console printing.
> 
> Since printk recursion tracking is in place, safe context tracking
> for most of printk is not needed. Remove it. Only safe context
> tracking relating to the console lock is left in place. This is
> because the console lock is needed for the actual printing.

> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -1142,24 +1128,37 @@ void __init setup_log_buf(int early)
>  		 new_descs, ilog2(new_descs_count),
>  		 new_infos);
>  
> -	printk_safe_enter_irqsave(flags);
> +	local_irq_save(flags);

IMHO, we actually do not have to disable IRQ here. We already copy
messages that might appear in the small race window in NMI. It would work
the same way also for IRQ context.

>  	log_buf_len = new_log_buf_len;
>  	log_buf = new_log_buf;
>  	new_log_buf_len = 0;
>  
>  	free = __LOG_BUF_LEN;
> -	prb_for_each_record(0, &printk_rb_static, seq, &r)
> -		free -= add_to_rb(&printk_rb_dynamic, &r);
> +	prb_for_each_record(0, &printk_rb_static, seq, &r) {
> +		text_size = add_to_rb(&printk_rb_dynamic, &r);
> +		if (text_size > free)
> +			free = 0;
> +		else
> +			free -= text_size;
> +	}
>  
> -	/*
> -	 * This is early enough that everything is still running on the
> -	 * boot CPU and interrupts are disabled. So no new messages will
> -	 * appear during the transition to the dynamic buffer.
> -	 */
>  	prb = &printk_rb_dynamic;
>  
> -	printk_safe_exit_irqrestore(flags);
> +	local_irq_restore(flags);
> +
> +	/*
> +	 * Copy any remaining messages that might have appeared from
> +	 * NMI context after copying but before switching to the
> +	 * dynamic buffer.

The above comment would need to get updated if we keep also normal
IRQ enabled when copying the log buffers.

> +	 */
> +	prb_for_each_record(seq, &printk_rb_static, seq, &r) {
> +		text_size = add_to_rb(&printk_rb_dynamic, &r);
> +		if (text_size > free)
> +			free = 0;
> +		else
> +			free -= text_size;
> +	}
>  
>  	if (seq != prb_next_seq(&printk_rb_static)) {
>  		pr_err("dropped %llu messages\n",

> --- a/lib/nmi_backtrace.c
> +++ b/lib/nmi_backtrace.c
> @@ -75,12 +75,6 @@ void nmi_trigger_cpumask_backtrace(const cpumask_t *mask,
>  		touch_softlockup_watchdog();
>  	}
>  
> -	/*
> -	 * Force flush any remote buffers that might be stuck in IRQ context
> -	 * and therefore could not run their irq_work.
> -	 */
> -	printk_safe_flush();

Sigh, this reminds me that the nmi_safe buffers serialized backtraces
from all CPUs.

I am afraid that we have to put back the spinlock into
nmi_cpu_backtrace(). It has been repeatedly added and removed depending
on whether the backtrace was printed into the main log buffer
or into the per-CPU buffers. Last time it was removed by
the commit 03fc7f9c99c1e7ae2925d ("printk/nmi: Prevent deadlock
when accessing the main log buffer in NMI").

It should be safe because there should not be any other locks in the
code path. Note that only one backtrace might be triggered at the same
time, see @backtrace_flag in nmi_trigger_cpumask_backtrace().

We _must_ serialize it somehow[*]. The lock in nmi_cpu_backtrace()
looks less evil than the nmi_safe machinery. nmi_safe() shrinks
too long backtraces, lose timestamps, needs to be explicitely
flushed here and there, is a non-trivial code.

[*] Non-serialized bactraces are real mess. Caller-id is visible
    only on consoles or via syslogd interface. And it is not much
    convenient.

    I get this with "echo l >/proc/sysrq-trigger" and this patchset:

[   95.642793] sysrq: Show backtrace of all active CPUs
[   95.645202] NMI backtrace for cpu 3
[   95.646778] CPU: 3 PID: 5095 Comm: bash Kdump: loaded Tainted: G        W         5.11.0-default+ #231
[   95.650397] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba527-rebuilt.opensuse.org 04/01/2014
[   95.656497] Call Trace:
[   95.657937]  dump_stack+0x88/0xab
[   95.659888]  nmi_cpu_backtrace+0xa4/0xc0
[   95.661744]  ? lapic_can_unplug_cpu+0xa0/0xa0
[   95.663658]  nmi_trigger_cpumask_backtrace+0xe6/0x120
[   95.665657]  arch_trigger_cpumask_backtrace+0x19/0x20
[   95.667720]  sysrq_handle_showallcpus+0x17/0x20
[   95.670218]  __handle_sysrq+0xe1/0x240
[   95.672190]  write_sysrq_trigger+0x51/0x60
[   95.673993]  proc_reg_write+0x62/0x90
[   95.675319]  vfs_write+0xed/0x380
[   95.676636]  ksys_write+0xad/0xf0
[   95.677835]  __x64_sys_write+0x1a/0x20
[   95.678722]  do_syscall_64+0x37/0x50
[   95.679525]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   95.680571] RIP: 0033:0x7f3cbc2b3d44
[   95.681380] Code: 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 80 00 00 00 00 8b 05 ea fa 2c 00 48 63 ff 85 c0 75 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 f3 c3 66 90 55 53 48 89 d5 48 89 f3 48 83
[   95.684456] RSP: 002b:00007ffe29f06018 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[   95.686029] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f3cbc2b3d44
[   95.687346] RDX: 0000000000000002 RSI: 000055ad7117b420 RDI: 0000000000000001
[   95.688690] RBP: 000055ad7117b420 R08: 000000000000000a R09: 0000000000000000
[   95.690071] R10: 000000000000000a R11: 0000000000000246 R12: 0000000000000002
[   95.691243] R13: 0000000000000001 R14: 00007f3cbc57f720 R15: 0000000000000002
[   95.692318] Sending NMI from CPU 3 to CPUs 0-2:
[   95.693014] NMI backtrace for cpu 2
[   95.693014] NMI backtrace for cpu 1
[   95.693016] CPU: 2 PID: 0 Comm: swapper/2 Kdump: loaded Tainted: G        W         5.11.0-default+ #231
[   95.693014] NMI backtrace for cpu 0 skipped: idling at native_safe_halt+0x12/0x20
[   95.693016] CPU: 1 PID: 448 Comm: systemd-journal Kdump: loaded Tainted: G        W         5.11.0-default+ #231
[   95.693018] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba527-rebuilt.opensuse.org 04/01/2014
[   95.693019] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba527-rebuilt.opensuse.org 04/01/2014
[   95.693020] RIP: 0010:ttwu_do_wakeup+0x1aa/0x220
[   95.693021] RIP: 0010:inode_permission+0x1d/0x150
[   95.693025] Code: f0 48 39 c1 72 1b 48 89 83 c8 0b 00 00 48 c7 83 c0 0b 00 00 00 00 00 00 5b 41 5c 41 5d 41 5e 5d c3 48 89 8b c8 0b 00 00 eb e3 <48> 8d 7b 18 be ff ff ff ff e8 68 95 c4 00 85 c0 75 80 0f 0b e9 79
[   95.693025] Code: ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 48 89 e5 41 56 41 55 41 89 f5 41 54 53 41 83 e5 02 75 43 f6 47 02 01 <41> 89 f4 48 89 fb 0f 84 80 00 00 00 44 89 e6 48 89 df e8 dc fd ff
[   95.693027] RSP: 0018:ffffbae700120ef8 EFLAGS: 00000002
[   95.693028] RSP: 0018:ffffbae7003ebea0 EFLAGS: 00000202
[   95.693028] RAX: 0000000000000001 RBX: ffff9eb2ffbebec0 RCX: 0000000000000000
[   95.693030] RDX: 0000000000010003 RSI: ffffffffaa6a9860 RDI: ffff9eb2803351d0
[   95.693031] RAX: ffff9eb28229fa80 RBX: 0000000000000001 RCX: 0000000000000000
[   95.693031] RBP: ffffbae700120f18 R08: 0000000000000001 R09: 0000000000000001
[   95.693032] R10: ffff9eb282f00850 R11: 000000000000028d R12: ffff9eb282f00780
[   95.693032] RDX: 0000000000000001 RSI: 0000000000000010 RDI: ffff9eb286df5298
[   95.693033] R13: ffffbae700120f60 R14: ffffbae700120f60 R15: 0000000000000000
[   95.693034] RBP: ffffbae7003ebec0 R08: 0000000000000001 R09: 0000000000000001
[   95.693035] FS:  0000000000000000(0000) GS:ffff9eb2ffa00000(0000) knlGS:0000000000000000
[   95.693036] R10: ffffbae7003ebea8 R11: 0000000000000001 R12: 0000000000000000
[   95.693037] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   95.693037] R13: 0000000000000000 R14: 000055a9f3817900 R15: 0000000000000000
[   95.693038] CR2: 000055e2be208280 CR3: 0000000103838003 CR4: 0000000000370ee0
[   95.693039] FS:  00007f1682ccb1c0(0000) GS:ffff9eb2ff800000(0000) knlGS:0000000000000000
[   95.693041] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   95.693042] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   95.693043] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   95.693043] CR2: 00007f3cbbfb36a8 CR3: 0000000102708005 CR4: 0000000000370ee0
[   95.693044] Call Trace:
[   95.693045]  <IRQ>
[   95.693047] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   95.693047]  ttwu_do_activate+0x90/0x190
[   95.693049] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   95.693050] Call Trace:
[   95.693051]  sched_ttwu_pending+0xe6/0x180
[   95.693054]  do_faccessat+0xbb/0x260
[   95.693055]  flush_smp_call_function_queue+0x117/0x220
[   95.693058]  generic_smp_call_function_single_interrupt+0x13/0x20
[   95.693060]  __x64_sys_access+0x1d/0x20
[   95.693060]  __sysvec_call_function_single+0x47/0x190
[   95.693063]  asm_call_irq_on_stack+0xf/0x20
[   95.693064]  do_syscall_64+0x37/0x50
[   95.693066]  </IRQ>
[   95.693067]  sysvec_call_function_single+0x6d/0xb0
[   95.693068]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   95.693070]  asm_sysvec_call_function_single+0x12/0x20
[   95.693071] RIP: 0033:0x7f1681d6be1a
[   95.693072] RIP: 0010:native_safe_halt+0x12/0x20
[   95.693074] Code: 48 8b 15 81 a0 2c 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 63 f6 b8 15 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 06 f3 c3 0f 1f 40 00 48 8b 15 49 a0 2c 00 f7
[   95.693074] Code: 00 0f 00 2d 92 4f 48 00 f4 5d c3 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 55 48 89 e5 e9 07 00 00 00 0f 00 2d 72 4f 48 00 fb f4 <5d> c3 cc cc cc cc cc cc cc cc cc cc cc cc 0f 1f 44 00 00 55 65 8b
[   95.693076] RSP: 002b:00007fff61a07828 EFLAGS: 00000246
[   95.693078] RSP: 0018:ffffbae7000b7e90 EFLAGS: 00000206
[   95.693080] RAX: ffffffffa8d86240 RBX: 0000000000000002 RCX: 0000000000000000
[   95.693080] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffffa8d865f5
[   95.693078]  ORIG_RAX: 0000000000000015
[   95.693081] RBP: ffffbae7000b7e90 R08: 0000000000000001 R09: 0000000000000001
[   95.693082] R10: 0000000000000000 R11: 0000000000000001 R12: ffffffffaa9bdf60
[   95.693082] RAX: ffffffffffffffda RBX: 00007fff61a0a550 RCX: 00007f1681d6be1a
[   95.693083] R13: 0000000000000000 R14: 0000000000000000 R15: ffff9eb280334400
[   95.693084] RDX: 00007f16827d70e0 RSI: 0000000000000000 RDI: 000055a9f3817900
[   95.693085] RBP: 00007fff61a07870 R08: 0000000000000000 R09: 0000000000000000
[   95.693085]  ? __cpuidle_text_start+0x8/0x8
[   95.693086] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
[   95.693087] R13: 0000000000000000 R14: 00007fff61a07970 R15: 0000000000000000
[   95.693087]  ? default_idle_call+0x45/0x200
[   95.693091]  default_idle+0xe/0x20
[   95.693093]  arch_cpu_idle+0x15/0x20
[   95.693094]  default_idle_call+0x6c/0x200
[   95.693096]  do_idle+0x1fb/0x2e0
[   95.693098]  ? do_idle+0x1d9/0x2e0
[   95.693100]  cpu_startup_entry+0x1d/0x20
[   95.693102]  start_secondary+0x12b/0x160
[   95.693105]  secondary_startup_64_no_verify+0xc2/0xcb


Otherwise, I really love this patch removing a lot of tricky code.

Best Regards,
Petr
