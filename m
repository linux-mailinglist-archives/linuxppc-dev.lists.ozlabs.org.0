Return-Path: <linuxppc-dev+bounces-2286-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9041299EDBC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 15:35:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSZq93QVmz3bk0;
	Wed, 16 Oct 2024 00:35:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=167.114.26.122
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728999333;
	cv=none; b=hyBsKS97G6MGdpEBvg80cDd5U3uozY2hIxWQUiDtjOYKMeGSG0cRsHeHswmb3KLGGjM8kPf+ri4GdRjOHr2Lx6gQezfdmd7NazOFn2YqUuPqJlJauuixLqzqfeh7vg0/IT+0ca61+yG+utDOq0AFLcJfHVhGe1gTY8dcuF+UTk5pnsbdeHxTOygjDBRPlszJ/U/s5cAeWpa+Eq5yN2NH5XTaLtVDChB2eh4FD+y6+0iyfJnleOWg0UyBgW5XB1yKbyx9a11RUYNfU3iEX5TOAHL2mg8ANn6hYMwQ3HOlM/UEdA4YIFYDYy/NeJhd2uTJ1YtftJe8VkzpLmshgA6iKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728999333; c=relaxed/relaxed;
	bh=ZhjIk3jyLbKs2v6V8M7XqbitqXj5N/Z40+19VBaDAZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lx8V3dnzxW/gcGsghYGfUrH7W+wScCVQrDVIOcgmo9k242/yEbDSUQSo0t2Icb8Blg619zeZbnwrgihIux7C/Sf2SPBwfBA1JBma+69kt5bkMTwssv4ZHD2a0+P4xji6yE4E+oJCnPR2mMMJ5ap6+PomSVzV/TZYoBVw2XHIdno5g/kGJs/8aKCyPsGLQ1tS2FUC828kBa7ARma9O3zAaRNdkJH0glE6+Rym68XeFcnnmkmWG4IS49swSzl0XJ2NWOtiiCBPv/6P0es+XR8+HMzjSsa1k4cVwfJ/UaDiWx3m3R1l2OdT00a8CA8gJMRq+hkUQoYUH/r5stekqykF5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=fuV9rSh0; dkim-atps=neutral; spf=pass (client-ip=167.114.26.122; helo=smtpout.efficios.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=fuV9rSh0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=167.114.26.122; helo=smtpout.efficios.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
Received: from smtpout.efficios.com (smtpout.efficios.com [167.114.26.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSZq41yRwz3bfB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 00:35:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1728999321;
	bh=y8iIiPUUP90wqqQFoRBMdZRts0mScrjk70+gYY5Wwxk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fuV9rSh0fT5PPT8HXJ6zlPZylv61kJxHZVsISuma/W6Ssz+XeQMc3WNVb4SXUQ1Ud
	 dzkbOhiWiNi1vSexwlpw+OeBe1NlzP2Pi5obNSjMKcH1ttLcb3Uc6wzr+xPbZ4iORN
	 9cxFuBYukb/7YxmrueqgGTJ+wRXZ9/4+OZ4woHKrfTeHOZDSy2P54//+1OfZlF5qvQ
	 RuwhH5Asc5DF/TZ+M1whvaaftNlXFXXil6w5/1mMjSFKdTdY1GG76Ro5lOclqSv477
	 mKSaZFaYeHMk6gzQQnR+jgM+OcPXvt+rsFGI1ph6DWQSosonE0HYWsCNB5wYp/58Gk
	 l3tNtOBqcvnYQ==
Received: from [172.16.0.134] (96-127-217-162.qc.cable.ebox.net [96.127.217.162])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4XSZpx2Yt7zyWM;
	Tue, 15 Oct 2024 09:35:21 -0400 (EDT)
Message-ID: <bfc0e684-b008-4e20-82a9-a953613087b0@efficios.com>
Date: Tue, 15 Oct 2024 09:33:31 -0400
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 4/4] sched+mm: Use hazard pointers to track lazy
 active mm existence
To: kernel test robot <oliver.sang@intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Nicholas Piggin
 <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
 John Stultz <jstultz@google.com>, Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Mateusz Guzik <mjguzik@gmail.com>,
 Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, maged.michael@gmail.com,
 rcu@vger.kernel.org, lkmm@lists.linux.dev
References: <202410141617.612a0f5b-lkp@intel.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <202410141617.612a0f5b-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024-10-14 04:27, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "WARNING:at_kernel/hazptr.c:#hazptr_scan" on:
> 
> commit: c1508707268498a6fd3ca5853ad65f9482c12374 ("[RFC PATCH v3 4/4] sched+mm: Use hazard pointers to track lazy active mm existence")
> url: https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/compiler-h-Introduce-ptr_eq-to-preserve-address-dependency/20241008-215353
> base: https://git.kernel.org/cgit/linux/kernel/git/powerpc/linux.git next
> patch link: https://lore.kernel.org/all/20241008135034.1982519-5-mathieu.desnoyers@efficios.com/
> patch subject: [RFC PATCH v3 4/4] sched+mm: Use hazard pointers to track lazy active mm existence
> 

This appears to be called from:

static int khugepaged(void *none)
{
         struct khugepaged_mm_slot *mm_slot;

         set_freezable();
         set_user_nice(current, MAX_NICE);
                         
         while (!kthread_should_stop()) {
                 khugepaged_do_scan(&khugepaged_collapse_control);
                 khugepaged_wait_work();
         }
                 
         spin_lock(&khugepaged_mm_lock);
         mm_slot = khugepaged_scan.mm_slot;
         khugepaged_scan.mm_slot = NULL;
         if (mm_slot)
                 collect_mm_slot(mm_slot);   <-------- here
         spin_unlock(&khugepaged_mm_lock);
         return 0;
}

[...]

static void collect_mm_slot(struct khugepaged_mm_slot *mm_slot)
{
         struct mm_slot *slot = &mm_slot->slot;
         struct mm_struct *mm = slot->mm;

         lockdep_assert_held(&khugepaged_mm_lock);

         if (hpage_collapse_test_exit(mm)) {
                 /* free mm_slot */
                 hash_del(&slot->hash);
                 list_del(&slot->mm_node);

                 /*
                  * Not strictly needed because the mm exited already.
                  *
                  * clear_bit(MMF_VM_HUGEPAGE, &mm->flags);
                  */

                 /* khugepaged_mm_lock actually not necessary for the below */
                 mm_slot_free(mm_slot_cache, mm_slot);
                 mmdrop(mm);             <---------- here
         }
}

So technically, before my change, there were two things that differed here:

1) mmdrop possibly did not decrement mm_count to 0 if mm_count was held as a
    lazy mm, which skipped __mmdrop entirely.

2) If it happened that mm_count did decrement to 0, __mmdrop would call
    cleanup_lazy_tlbs().

    With CONFIG_MMU_LAZY_TLB_SHOOTDOWN=n (which is the case here), cleanup_lazy_tlbs()
    returned immediately.

    With CONFIG_MMU_LAZY_TLB_SHOOTDOWN=y (only for powerpc AFAIU), it would do
    on_each_cpu_mask() to send IPIs to other CPUs which are in the mm_cpumask().
    It appears to be OK to call on_each_cpu_mask() from preempt-disabled context.

So changing all this to send IPIs for CPUs which have the mm in their hazard pointer
slot is technically not so different from what CONFIG_MMU_LAZY_TLB_SHOOTDOWN=y
does.

So AFAIU we have the choice between three ways forward here:

1) Modify hazptr_scan() so it only check for lockdep_assert_preemption_enabled()
    when the on_match_cb() is NULL (busy-wait behavior). This would allow being
    called from preempt-disabled context when a specific on-match callback is
    provided.

2) Modify mm/khugepaged.c:collect_mm_slot() so it releases the khugepaged_mm_lock
    spinlock around:

                 /* khugepaged_mm_lock actually not necessary for the below */
                 mm_slot_free(mm_slot_cache, mm_slot);
                 mmdrop(mm);

   So it does not call mmdrop() from preempt-off context.

3) Approaches (1)+(2).

Thoughts ?

Thanks,

Mathieu



> in testcase: boot
> 
> config: i386-randconfig-013-20241011
> compiler: gcc-12
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> +-----------------------------------------+------------+------------+
> |                                         | b62696cacd | c150870726 |
> +-----------------------------------------+------------+------------+
> | WARNING:at_kernel/hazptr.c:#hazptr_scan | 0          | 5          |
> | EIP:hazptr_scan                         | 0          | 5          |
> +-----------------------------------------+------------+------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202410141617.612a0f5b-lkp@intel.com
> 
> 
> [    6.951355][   T22] ------------[ cut here ]------------
> [ 6.951920][ T22] WARNING: CPU: 0 PID: 22 at kernel/hazptr.c:28 hazptr_scan (kernel/hazptr.c:28)
> [    6.952580][   T22] Modules linked in:
> [    6.952880][   T22] CPU: 0 UID: 0 PID: 22 Comm: khugepaged Not tainted 6.12.0-rc1-00004-gc15087072684 #10
> [ 6.953685][ T22] EIP: hazptr_scan (kernel/hazptr.c:28)
> [ 6.954087][ T22] Code: c0 74 0a 85 db 8b 0a 74 45 39 c8 74 21 5b 5e 5d 31 c0 31 d2 31 c9 c3 8d b4 26 00 00 00 00 f7 05 a4 18 34 c3 ff ff ff 7f 74 14 <0f> 0b eb d1 89 c1 31 c0 ff d3 5b 5e 5d 31 c0 31 d2 31 c9 c3 8b 0d
> All code
> ========
>     0:	c0 74 0a 85 db       	shlb   $0xdb,-0x7b(%rdx,%rcx,1)
>     5:	8b 0a                	mov    (%rdx),%ecx
>     7:	74 45                	je     0x4e
>     9:	39 c8                	cmp    %ecx,%eax
>     b:	74 21                	je     0x2e
>     d:	5b                   	pop    %rbx
>     e:	5e                   	pop    %rsi
>     f:	5d                   	pop    %rbp
>    10:	31 c0                	xor    %eax,%eax
>    12:	31 d2                	xor    %edx,%edx
>    14:	31 c9                	xor    %ecx,%ecx
>    16:	c3                   	ret
>    17:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
>    1e:	f7 05 a4 18 34 c3 ff 	testl  $0x7fffffff,-0x3ccbe75c(%rip)        # 0xffffffffc33418cc
>    25:	ff ff 7f
>    28:	74 14                	je     0x3e
>    2a:*	0f 0b                	ud2		<-- trapping instruction
>    2c:	eb d1                	jmp    0xffffffffffffffff
>    2e:	89 c1                	mov    %eax,%ecx
>    30:	31 c0                	xor    %eax,%eax
>    32:	ff d3                	call   *%rbx
>    34:	5b                   	pop    %rbx
>    35:	5e                   	pop    %rsi
>    36:	5d                   	pop    %rbp
>    37:	31 c0                	xor    %eax,%eax
>    39:	31 d2                	xor    %edx,%edx
>    3b:	31 c9                	xor    %ecx,%ecx
>    3d:	c3                   	ret
>    3e:	8b                   	.byte 0x8b
>    3f:	0d                   	.byte 0xd
> 
> Code starting with the faulting instruction
> ===========================================
>     0:	0f 0b                	ud2
>     2:	eb d1                	jmp    0xffffffffffffffd5
>     4:	89 c1                	mov    %eax,%ecx
>     6:	31 c0                	xor    %eax,%eax
>     8:	ff d3                	call   *%rbx
>     a:	5b                   	pop    %rbx
>     b:	5e                   	pop    %rsi
>     c:	5d                   	pop    %rbp
>     d:	31 c0                	xor    %eax,%eax
>     f:	31 d2                	xor    %edx,%edx
>    11:	31 c9                	xor    %ecx,%ecx
>    13:	c3                   	ret
>    14:	8b                   	.byte 0x8b
>    15:	0d                   	.byte 0xd
> [    6.955564][   T22] EAX: c6087680 EBX: c1061470 ECX: 00000000 EDX: c2e104e8
> [    6.956135][   T22] ESI: c2e104e4 EDI: 00000001 EBP: c42ade88 ESP: c42ade80
> [    6.956665][   T22] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010202
> [    6.957266][   T22] CR0: 80050033 CR2: 0819cd10 CR3: 04033d80 CR4: 000406b0
> [    6.957807][   T22] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [    6.958380][   T22] DR6: fffe0ff0 DR7: 00000400
> [    6.958747][   T22] Call Trace:
> [ 6.959005][ T22] ? show_regs (arch/x86/kernel/dumpstack.c:479)
> [ 6.959362][ T22] ? hazptr_scan (kernel/hazptr.c:28)
> [ 6.959694][ T22] ? __warn (kernel/panic.c:748)
> [ 6.959974][ T22] ? hazptr_scan (kernel/hazptr.c:28)
> [ 6.960361][ T22] ? hazptr_scan (kernel/hazptr.c:28)
> [ 6.960695][ T22] ? report_bug (lib/bug.c:180 lib/bug.c:219)
> [ 6.961083][ T22] ? hazptr_scan (kernel/hazptr.c:28)
> [ 6.961427][ T22] ? exc_overflow (arch/x86/kernel/traps.c:301)
> [ 6.961778][ T22] ? handle_bug (arch/x86/kernel/traps.c:260)
> [ 6.962157][ T22] ? exc_invalid_op (arch/x86/kernel/traps.c:309 (discriminator 1))
> [ 6.962549][ T22] ? thread_stack_free_rcu (kernel/fork.c:867)
> [ 6.962955][ T22] ? handle_exception (arch/x86/entry/entry_32.S:1047)
> [ 6.963399][ T22] ? thread_stack_free_rcu (kernel/fork.c:867)
> [ 6.963801][ T22] ? exc_overflow (arch/x86/kernel/traps.c:301)
> [ 6.964203][ T22] ? hazptr_scan (kernel/hazptr.c:28)
> [ 6.964544][ T22] ? exc_overflow (arch/x86/kernel/traps.c:301)
> [ 6.964895][ T22] ? hazptr_scan (kernel/hazptr.c:28)
> [ 6.965279][ T22] __mmdrop (kernel/fork.c:895 (discriminator 3))
> [ 6.965599][ T22] collect_mm_slot (mm/khugepaged.c:1455)
> [ 6.965952][ T22] khugepaged_scan_mm_slot+0x210/0x60c
> [ 6.966493][ T22] ? khugepaged (mm/khugepaged.c:2511 mm/khugepaged.c:2571)
> [ 6.966865][ T22] khugepaged (mm/khugepaged.c:2515 mm/khugepaged.c:2571)
> [ 6.967239][ T22] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:97 arch/x86/include/asm/irqflags.h:155 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194)
> [ 6.967684][ T22] ? __kthread_parkme (arch/x86/include/asm/bitops.h:206 arch/x86/include/asm/bitops.h:238 include/asm-generic/bitops/instrumented-non-atomic.h:142 kernel/kthread.c:280)
> [ 6.968102][ T22] kthread (kernel/kthread.c:389)
> [ 6.968400][ T22] ? khugepaged_scan_mm_slot+0x60c/0x60c
> [ 6.968896][ T22] ? kthread_park (kernel/kthread.c:342)
> [ 6.969286][ T22] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 6.969628][ T22] ? kthread_park (kernel/kthread.c:342)
> [ 6.969961][ T22] ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
> [ 6.970383][ T22] entry_INT80_32 (arch/x86/entry/entry_32.S:944)
> [    6.970758][   T22] irq event stamp: 4719
> [ 6.971117][ T22] hardirqs last enabled at (4729): __up_console_sem (arch/x86/include/asm/irqflags.h:42 (discriminator 1) arch/x86/include/asm/irqflags.h:97 (discriminator 1) arch/x86/include/asm/irqflags.h:155 (discriminator 1) kernel/printk/printk.c:344 (discriminator 1))
> [ 6.971790][ T22] hardirqs last disabled at (4736): __up_console_sem (kernel/printk/printk.c:342 (discriminator 1))
> [ 6.972475][ T22] softirqs last enabled at (4708): handle_softirqs (kernel/softirq.c:401 kernel/softirq.c:582)
> [ 6.973162][ T22] softirqs last disabled at (4695): __do_softirq (kernel/softirq.c:589)
> [    6.973771][   T22] ---[ end trace 0000000000000000 ]---
> 
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20241014/202410141617.612a0f5b-lkp@intel.com
> 
> 
> 

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


