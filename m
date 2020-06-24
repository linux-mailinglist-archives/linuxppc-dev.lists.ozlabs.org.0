Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0FA2070FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 12:19:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sJzl3tMwzDqfN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 20:19:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=PTp4jBmr; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sJxv2yzrzDqdp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 20:18:10 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id s13so1395948otd.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 03:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4EH3Ayzk56MpDLOyZMi6Qg/VpTeqgjGr2SzN8cMmYoc=;
 b=PTp4jBmr409uWPW5Vt6YrFOGDI30bKkNf7AC3vJo8Zwx4VR1rbjpgadDaEIZaiNFVL
 VBJTF4XPT50EzLlvQiw8k4f2W0kd7aQGIMmlpeve9yrSDO078p6j5Vr2Ri837Rhm4jfv
 u1+mRP5qAmpO/O+bu41SiNy9tUQ79STVe38DFeFeNP9499lp6tYg2B/9LdPxLqSViv/A
 aEpznoyQ9vt5hdRMbFbNXOt8J3TRaPZVbdEX7KyF7CUmhSh1dbmdFYj9dqvPQj4ajKRS
 cF2lIRn2VYT9yr1bRN5NevIgJSIw+t8chreAMLUflL4yfhZAHloKAxOl7LxOqTVI1NyJ
 3/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4EH3Ayzk56MpDLOyZMi6Qg/VpTeqgjGr2SzN8cMmYoc=;
 b=ETOT+fBQf2DjVioTtXlg5UsfFVWYWcT3TzkSjQEzX3e66W82cWSWRh6dUjMB6vQK3e
 i2M67RRTgQgEHKlr3xtxRkLI0M+y8rsZzKSE/a5R9PHuQy57j9tctGmO5G8FdaElaGAl
 iBdii1Csq1NqPmu0mWxOLkmqL8F4EDZm6kluvQ0I0YmhIqMxwDmSBMLJSRJhm259OGg9
 lXku1GA88UG6VDuTOwsI88AOIoZdjjDCBigs4xZxAgSRYf34WYXtWFQffYkhQj3Yl8Zg
 xbHSYPci6OVjheAU8ctvUnkYkXVgtSFM2skVtBGQm1fYxJgN952yoz+wGZiOOX3hmsA+
 YA9A==
X-Gm-Message-State: AOAM531Kt9oLjZDcOnEG9/ES5SC0FefhKiOGbMFVQ6yHD8Y1EOYYWiW0
 Zb+ZZC8o1zxgUKDAGeu6jf/GpLeZWDp1rlmKZrGuJQ==
X-Google-Smtp-Source: ABdhPJw+WsW4dQOdXlVaB0Camas9/CrD9Jx9TYR5aNuPASM2glwnAa/P+LokVbvtPCFjZhr2vBM7U5l7wiUgv2imktE=
X-Received: by 2002:a9d:638c:: with SMTP id w12mr18833226otk.251.1592993888296; 
 Wed, 24 Jun 2020 03:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
 <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
 <20200623152450.GM4817@hirez.programming.kicks-ass.net>
 <20200623161320.GA2996373@debian-buster-darwi.lab.linutronix.de>
 <20200623163730.GA4800@hirez.programming.kicks-ass.net>
 <20200623175957.GA106514@elver.google.com>
 <20200623181232.GB4800@hirez.programming.kicks-ass.net>
 <20200623202404.GE2483@worktop.programming.kicks-ass.net>
 <20200624090033.GD4800@hirez.programming.kicks-ass.net>
In-Reply-To: <20200624090033.GD4800@hirez.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Wed, 24 Jun 2020 12:17:56 +0200
Message-ID: <CANpmjNMj8FZuBrZsH62V3bZEhFvT2zXwLusVOLwNuH_-kLhp2g@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "Paul E. McKenney" <paulmck@kernel.org>, bigeasy@linutronix.de,
 the arch/x86 maintainers <x86@kernel.org>, heiko.carstens@de.ibm.com,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 "David S. Miller" <davem@davemloft.net>,
 "Ahmed S. Darwish" <a.darwish@linutronix.de>, sparclinux@vger.kernel.org,
 linux@armlinux.org.uk, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 24 Jun 2020 at 11:01, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Jun 23, 2020 at 10:24:04PM +0200, Peter Zijlstra wrote:
> > On Tue, Jun 23, 2020 at 08:12:32PM +0200, Peter Zijlstra wrote:
> > > Fair enough; I'll rip it all up and boot a KCSAN kernel, see what if
> > > anything happens.
> >
> > OK, so the below patch doesn't seem to have any nasty recursion issues
> > here. The only 'problem' is that lockdep now sees report_lock can cause
> > deadlocks.
> >
> > It is completely right about it too, but I don't suspect there's much we
> > can do about it, it's pretty much the standard printk() with scheduler
> > locks held report.
>
> So I've been getting tons and tons of this:
>
> [   60.471348] ==================================================================
> [   60.479427] BUG: KCSAN: data-race in __rcu_read_lock / __rcu_read_unlock
> [   60.486909]
> [   60.488572] write (marked) to 0xffff88840fff1cf0 of 4 bytes by interrupt on cpu 1:
> [   60.497026]  __rcu_read_lock+0x37/0x60
> [   60.501214]  cpuacct_account_field+0x1b/0x170
> [   60.506081]  task_group_account_field+0x32/0x160
> [   60.511238]  account_system_time+0xe6/0x110
> [   60.515912]  update_process_times+0x1d/0xd0
> [   60.520585]  tick_sched_timer+0xfc/0x180
> [   60.524967]  __hrtimer_run_queues+0x271/0x440
> [   60.529832]  hrtimer_interrupt+0x222/0x670
> [   60.534409]  __sysvec_apic_timer_interrupt+0xb3/0x1a0
> [   60.540052]  asm_call_on_stack+0x12/0x20
> [   60.544434]  sysvec_apic_timer_interrupt+0xba/0x130
> [   60.549882]  asm_sysvec_apic_timer_interrupt+0x12/0x20
> [   60.555621]  delay_tsc+0x7d/0xe0
> [   60.559226]  kcsan_setup_watchpoint+0x292/0x4e0
> [   60.564284]  __rcu_read_unlock+0x73/0x2c0
> [   60.568763]  __unlock_page_memcg+0xda/0xf0
> [   60.573338]  unlock_page_memcg+0x32/0x40
> [   60.577721]  page_remove_rmap+0x5c/0x200
> [   60.582104]  unmap_page_range+0x83c/0xc10
> [   60.586582]  unmap_single_vma+0xb0/0x150
> [   60.590963]  unmap_vmas+0x81/0xe0
> [   60.594663]  exit_mmap+0x135/0x2b0
> [   60.598464]  __mmput+0x21/0x150
> [   60.601970]  mmput+0x2a/0x30
> [   60.605176]  exit_mm+0x2fc/0x350
> [   60.608780]  do_exit+0x372/0xff0
> [   60.612385]  do_group_exit+0x139/0x140
> [   60.616571]  __do_sys_exit_group+0xb/0x10
> [   60.621048]  __se_sys_exit_group+0xa/0x10
> [   60.625524]  __x64_sys_exit_group+0x1b/0x20
> [   60.630189]  do_syscall_64+0x6c/0xe0
> [   60.634182]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   60.639820]
> [   60.641485] read to 0xffff88840fff1cf0 of 4 bytes by task 2430 on cpu 1:
> [   60.648969]  __rcu_read_unlock+0x73/0x2c0
> [   60.653446]  __unlock_page_memcg+0xda/0xf0
> [   60.658019]  unlock_page_memcg+0x32/0x40
> [   60.662400]  page_remove_rmap+0x5c/0x200
> [   60.666782]  unmap_page_range+0x83c/0xc10
> [   60.671259]  unmap_single_vma+0xb0/0x150
> [   60.675641]  unmap_vmas+0x81/0xe0
> [   60.679341]  exit_mmap+0x135/0x2b0
> [   60.683141]  __mmput+0x21/0x150
> [   60.686647]  mmput+0x2a/0x30
> [   60.689853]  exit_mm+0x2fc/0x350
> [   60.693458]  do_exit+0x372/0xff0
> [   60.697062]  do_group_exit+0x139/0x140
> [   60.701248]  __do_sys_exit_group+0xb/0x10
> [   60.705724]  __se_sys_exit_group+0xa/0x10
> [   60.710201]  __x64_sys_exit_group+0x1b/0x20
> [   60.714872]  do_syscall_64+0x6c/0xe0
> [   60.718864]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   60.724503]
> [   60.726156] Reported by Kernel Concurrency Sanitizer on:
> [   60.732089] CPU: 1 PID: 2430 Comm: sshd Not tainted 5.8.0-rc2-00186-gb4ee11fe08b3-dirty #303
> [   60.741510] Hardware name: Intel Corporation S2600GZ/S2600GZ, BIOS SE5C600.86B.02.02.0002.122320131210 12/23/2013
> [   60.752957] ==================================================================
>
> And I figured a quick way to get rid of that would be something like the
> below, seeing how volatile gets auto annotated... but that doesn't seem
> to actually work.
>
> What am I missing?

There's one more in include/linux/rcupdate.h. I suggested this at some point:

    https://lore.kernel.org/lkml/20200220213317.GA35033@google.com/

To avoid volatiles as I don't think they are needed here.

[ Still testing your other patches for KCSAN, will send another reply there. ]

Thanks,
-- Marco
