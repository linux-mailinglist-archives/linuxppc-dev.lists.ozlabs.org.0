Return-Path: <linuxppc-dev+bounces-1801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8EF993A10
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 00:18:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMtpf46jCz2xHF;
	Tue,  8 Oct 2024 09:18:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=167.114.26.122
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728314197;
	cv=none; b=NoGlCYAD7WZUJkpejMAaUMnORn9YrE1ew4AtMF9q9eJS5I8iWBe+LXs25gvGV8DenHbhaU4vzVEVXk7U5lTVAhTiwN1LE7/CFLTKi3VqFPrVObzOjsOmxlJpKHHtjPFmI2xTJrixaSz4pl7fqX67Gx07Eu8ZiHzKdqPQVQXs0/1lad4ez070M6v0V0PWALjcU32CAHX58IPQTkUNK0yVNu1dRnqSjixDJN8bWNURHoLqW2NqWLRLJpslqAR8Gr2ndjUQEzpTihJJFTK2cF1ckeX+XjsD+fdOmc9ipfMX/ZVLKk5JvkLltYPv3yDIQQ1K2j28AiXyxEV/3//Mj70Uhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728314197; c=relaxed/relaxed;
	bh=pQ3FwyKt6J0LQ+PLmIfaNIZZMy4SD1WvUIzGVF5/rXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQEWwsVG53hsNybymL3XWl4SmPeE+Ay7pP0ySze8BzUuhapo4iDBAR5DVyp25oCWjkWrgyK5gAVw589436DYnMZuRAdDXM9FzsKiyv4Ls/GSwtCaWciP2sI/+ncJ5m62ZSUJNDIkEv/tg3v4IJ7L97YCd2yr7/tA/WXSP9+hWcEZcRBmu9ou1gMnaODxi1E1aE0YFMJPv0KzZ5Qe3d+VAwBexCvcPxq3XbK4nRqxPlU5UCF3UodmR/MOnKMJ6E8Uehrbl0n2WlZBRQjwiPV7OgJDoRx/7MBNx9swdwj272G3jVpGDO824F3q+uRk+4hvbk5+4zB7i8R4XQk54xWBLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=rWkyGSYF; dkim-atps=neutral; spf=pass (client-ip=167.114.26.122; helo=smtpout.efficios.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=rWkyGSYF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=167.114.26.122; helo=smtpout.efficios.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 564 seconds by postgrey-1.37 at boromir; Tue, 08 Oct 2024 02:16:29 AEDT
Received: from smtpout.efficios.com (smtpout.efficios.com [167.114.26.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMjRK6Fd2z2yj3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 02:16:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1728313619;
	bh=r1rEb4BcGluwlHstvi+nWxFz5xLpAXRmZnsaTQauCkY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rWkyGSYF70MdtnVehW6FBtpNIYFy9k6IVdj66SP1lBOuIi9NBlqdoHQocQgzbC6zO
	 odM4YO9SgTV6A9OilOfrlU20IND6EiyIFW4EZjAujSZLpbGjEVcsOvzxweckFFODFL
	 kmnTFec/qoPH/yia06SSkpKrNEUj+UTuCFfizRRycoYFcRW1Kx2tHCrMupweo6bnQ/
	 mWxnppFiwX+pYJs+vR0HQbnT8DRzVPjGtbQXbjNTZzit6gXlFpBzVcAw66Zlenb/r1
	 jMKOw2k+Dp9BEsLf8ajwfr5eeSST9uFXtQO1i+TT4xTI611VcYFuk+qVoG2qmpLAtZ
	 P4a/D2KjwXnBQ==
Received: from [172.16.0.134] (96-127-217-162.qc.cable.ebox.net [96.127.217.162])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4XMjDL45V4z3rf;
	Mon,  7 Oct 2024 11:06:58 -0400 (EDT)
Message-ID: <f5c749d3-e3ec-4463-9dc2-690b9b719315@efficios.com>
Date: Mon, 7 Oct 2024 11:05:01 -0400
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
Subject: Re: [RFC PATCH v2 4/4] sched+mm: Use hazard pointers to track lazy
 active mm existence
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Nicholas Piggin
 <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>, John Stultz <jstultz@google.com>,
 Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
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
References: <202410072229.18756716-oliver.sang@intel.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <202410072229.18756716-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024-10-07 16:50, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "BUG:using_smp_processor_id()in_preemptible" on:
> 
> commit: efef4da3b19cadf4beb45079a05643a77821de79 ("[RFC PATCH v2 4/4] sched+mm: Use hazard pointers to track lazy active mm existence")
> url: https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/compiler-h-Introduce-ptr_eq-to-preserve-address-dependency/20241005-023027
> base: https://git.kernel.org/cgit/linux/kernel/git/powerpc/linux.git next
> patch link: https://lore.kernel.org/all/20241004182734.1761555-5-mathieu.desnoyers@efficios.com/
> patch subject: [RFC PATCH v2 4/4] sched+mm: Use hazard pointers to track lazy active mm existence
> 

This should do the trick:

-       WRITE_ONCE(this_cpu_ptr(hp_domain_sched_lazy_mm.percpu_slots)->addr, NULL);
+       this_cpu_write(hp_domain_sched_lazy_mm.percpu_slots->addr, NULL);

I'll update the patch for the next round.

Thanks,

Mathieu


> in testcase: boot
> 
> compiler: gcc-12
> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> +--------------------------------------------+------------+------------+
> |                                            | 75b478bf10 | efef4da3b1 |
> +--------------------------------------------+------------+------------+
> | BUG:using_smp_processor_id()in_preemptible | 0          | 12         |
> +--------------------------------------------+------------+------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202410072229.18756716-oliver.sang@intel.com
> 
> 
> [    6.336856][   T48] BUG: using smp_processor_id() in preemptible [00000000] code: kworker/u10:1/48
> [ 6.338102][ T48] caller is debug_smp_processor_id (lib/smp_processor_id.c:61)
> [    6.338809][   T48] CPU: 0 UID: 0 PID: 48 Comm: kworker/u10:1 Not tainted 6.12.0-rc1-00004-gefef4da3b19c #5
> [    6.339929][   T48] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [    6.341119][   T48] Call Trace:
> [ 6.341504][ T48] dump_stack_lvl (lib/dump_stack.c:123)
> [ 6.342057][ T48] dump_stack (lib/dump_stack.c:130)
> [ 6.342065][ T48] check_preemption_disabled (arch/x86/include/asm/preempt.h:84 lib/smp_processor_id.c:53)
> [ 6.342065][ T48] debug_smp_processor_id (lib/smp_processor_id.c:61)
> [ 6.342065][ T48] exec_mmap (include/linux/sched/mm.h:91 fs/exec.c:1017)
> [ 6.342065][ T48] ? would_dump (fs/exec.c:1409)
> [ 6.342065][ T48] begin_new_exec (fs/exec.c:1280)
> [ 6.342065][ T48] ? load_elf_phdrs (fs/binfmt_elf.c:534)
> [ 6.342065][ T48] load_elf_binary (fs/binfmt_elf.c:996)
> [ 6.342065][ T48] ? get_lock_stats (kernel/locking/lockdep.c:339)
> [ 6.342065][ T48] ? search_binary_handler (fs/exec.c:1752)
> [ 6.342065][ T48] search_binary_handler (fs/exec.c:1752)
> [ 6.342065][ T48] exec_binprm (fs/exec.c:1795)
> [ 6.342065][ T48] bprm_execve (fs/exec.c:1846 fs/exec.c:1821)
> [ 6.342065][ T48] kernel_execve (fs/exec.c:2012)
> [ 6.342065][ T48] call_usermodehelper_exec_async (kernel/umh.c:110)
> [ 6.342065][ T48] ? umh_complete (kernel/umh.c:65)
> [ 6.342065][ T48] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 6.342065][ T48] ? umh_complete (kernel/umh.c:65)
> [ 6.342065][ T48] ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
> [ 6.342065][ T48] entry_INT80_32 (arch/x86/entry/entry_32.S:944)
> [    6.352140][    T1] ppdev: user-space parallel port driver
> [    6.353841][    T1] HSI/SSI char device loaded
> [    6.354238][    T1] e1000: Intel(R) PRO/1000 Network Driver
> [    6.354673][    T1] e1000: Copyright (c) 1999-2006 Intel Corporation.
> [    6.650009][    T1] ACPI: _SB_.LNKC: Enabled at IRQ 11
> [    6.968868][    T1] e1000 0000:00:03.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
> [    6.969500][    T1] e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Connection
> [    6.970506][   T49] BUG: using smp_processor_id() in preemptible [00000000] code: kworker/u10:1/49
> [ 6.971191][ T49] caller is debug_smp_processor_id (lib/smp_processor_id.c:61)
> [    6.971650][   T49] CPU: 0 UID: 0 PID: 49 Comm: kworker/u10:1 Not tainted 6.12.0-rc1-00004-gefef4da3b19c #5
> [    6.972365][   T49] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [    6.973115][   T49] Call Trace:
> [ 6.973356][ T49] dump_stack_lvl (lib/dump_stack.c:123)
> [ 6.973686][ T49] dump_stack (lib/dump_stack.c:130)
> [ 6.973983][ T49] check_preemption_disabled (arch/x86/include/asm/preempt.h:84 lib/smp_processor_id.c:53)
> [ 6.974328][ T49] debug_smp_processor_id (lib/smp_processor_id.c:61)
> [ 6.974328][ T49] exec_mmap (include/linux/sched/mm.h:91 fs/exec.c:1017)
> [ 6.974328][ T49] ? would_dump (fs/exec.c:1409)
> [ 6.974328][ T49] begin_new_exec (fs/exec.c:1280)
> [ 6.974328][ T49] ? load_elf_phdrs (fs/binfmt_elf.c:534)
> [ 6.974328][ T49] load_elf_binary (fs/binfmt_elf.c:996)
> [ 6.974328][ T49] ? get_lock_stats (kernel/locking/lockdep.c:339)
> [ 6.974328][ T49] ? search_binary_handler (fs/exec.c:1752)
> [ 6.974328][ T49] search_binary_handler (fs/exec.c:1752)
> [ 6.974328][ T49] exec_binprm (fs/exec.c:1795)
> [ 6.974328][ T49] bprm_execve (fs/exec.c:1846 fs/exec.c:1821)
> [ 6.974328][ T49] kernel_execve (fs/exec.c:2012)
> [ 6.974328][ T49] call_usermodehelper_exec_async (kernel/umh.c:110)
> [ 6.974328][ T49] ? umh_complete (kernel/umh.c:65)
> [ 6.974328][ T49] ret_from_fork (arch/x86/kernel/process.c:153)
> [ 6.974328][ T49] ? umh_complete (kernel/umh.c:65)
> [ 6.974328][ T49] ret_from_fork_asm (arch/x86/entry/entry_32.S:737)
> [ 6.974328][ T49] entry_INT80_32 (arch/x86/entry/entry_32.S:944)
> 
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20241007/202410072229.18756716-oliver.sang@intel.com
> 
> 
> 

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


