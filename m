Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4790B206F9F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 11:04:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sHJC08wDzDqg8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 19:03:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sHG01kBFzDqdm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 19:02:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Kqwlt0YK5ZzwRKurTo/3Fb5xM4McmM+yZ9C+08e1t40=; b=WSHIdNQc+BAGqmUZoQB+uueZnP
 PLNSBCIqCpGPtuIxCSQmGh1jNAvfsc5iC4X6Ybu9hWXJ1p9pr9gsurxlCtWAAwdzg2MJ5xzJGlXQ0
 7lP36Ehnh04q1D9Z39n1/AVShG43lbLoJMXz9Kq8ZiW5vBFjd8lOE+1KUt3P1cE6mZMRoHkSsNf0Q
 L4NErIZVtVE9xDRBgG0sn4OaVrGUYzdlbogo9opu6RLIt/Zi7yqTHh5fYjsoPtPEJSGy9zGXnPQcu
 QQDHsdh5ZC9u2p994hAJbx9fR0lkHeXMl/ZzeDHTihuFC9furK7038x7cAlOUGCSEC+9ufX0tPMyH
 f4vbX2bA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo1Gm-0001B6-LM; Wed, 24 Jun 2020 09:00:36 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1EEA030377D;
 Wed, 24 Jun 2020 11:00:33 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0B3712031510A; Wed, 24 Jun 2020 11:00:33 +0200 (CEST)
Date: Wed, 24 Jun 2020 11:00:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v4 7/8] lockdep: Change hardirq{s_enabled,_context} to
 per-cpu variables
Message-ID: <20200624090033.GD4800@hirez.programming.kicks-ass.net>
References: <20200623083645.277342609@infradead.org>
 <20200623083721.512673481@infradead.org>
 <20200623150031.GA2986783@debian-buster-darwi.lab.linutronix.de>
 <20200623152450.GM4817@hirez.programming.kicks-ass.net>
 <20200623161320.GA2996373@debian-buster-darwi.lab.linutronix.de>
 <20200623163730.GA4800@hirez.programming.kicks-ass.net>
 <20200623175957.GA106514@elver.google.com>
 <20200623181232.GB4800@hirez.programming.kicks-ass.net>
 <20200623202404.GE2483@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623202404.GE2483@worktop.programming.kicks-ass.net>
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
 bigeasy@linutronix.de, x86@kernel.org, heiko.carstens@de.ibm.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, davem@davemloft.net,
 "Ahmed S. Darwish" <a.darwish@linutronix.de>, sparclinux@vger.kernel.org,
 linux@armlinux.org.uk, tglx@linutronix.de, will@kernel.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 10:24:04PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 23, 2020 at 08:12:32PM +0200, Peter Zijlstra wrote:
> > Fair enough; I'll rip it all up and boot a KCSAN kernel, see what if
> > anything happens.
> 
> OK, so the below patch doesn't seem to have any nasty recursion issues
> here. The only 'problem' is that lockdep now sees report_lock can cause
> deadlocks.
> 
> It is completely right about it too, but I don't suspect there's much we
> can do about it, it's pretty much the standard printk() with scheduler
> locks held report.

So I've been getting tons and tons of this:

[   60.471348] ==================================================================
[   60.479427] BUG: KCSAN: data-race in __rcu_read_lock / __rcu_read_unlock
[   60.486909]
[   60.488572] write (marked) to 0xffff88840fff1cf0 of 4 bytes by interrupt on cpu 1:
[   60.497026]  __rcu_read_lock+0x37/0x60
[   60.501214]  cpuacct_account_field+0x1b/0x170
[   60.506081]  task_group_account_field+0x32/0x160
[   60.511238]  account_system_time+0xe6/0x110
[   60.515912]  update_process_times+0x1d/0xd0
[   60.520585]  tick_sched_timer+0xfc/0x180
[   60.524967]  __hrtimer_run_queues+0x271/0x440
[   60.529832]  hrtimer_interrupt+0x222/0x670
[   60.534409]  __sysvec_apic_timer_interrupt+0xb3/0x1a0
[   60.540052]  asm_call_on_stack+0x12/0x20
[   60.544434]  sysvec_apic_timer_interrupt+0xba/0x130
[   60.549882]  asm_sysvec_apic_timer_interrupt+0x12/0x20
[   60.555621]  delay_tsc+0x7d/0xe0
[   60.559226]  kcsan_setup_watchpoint+0x292/0x4e0
[   60.564284]  __rcu_read_unlock+0x73/0x2c0
[   60.568763]  __unlock_page_memcg+0xda/0xf0
[   60.573338]  unlock_page_memcg+0x32/0x40
[   60.577721]  page_remove_rmap+0x5c/0x200
[   60.582104]  unmap_page_range+0x83c/0xc10
[   60.586582]  unmap_single_vma+0xb0/0x150
[   60.590963]  unmap_vmas+0x81/0xe0
[   60.594663]  exit_mmap+0x135/0x2b0
[   60.598464]  __mmput+0x21/0x150
[   60.601970]  mmput+0x2a/0x30
[   60.605176]  exit_mm+0x2fc/0x350
[   60.608780]  do_exit+0x372/0xff0
[   60.612385]  do_group_exit+0x139/0x140
[   60.616571]  __do_sys_exit_group+0xb/0x10
[   60.621048]  __se_sys_exit_group+0xa/0x10
[   60.625524]  __x64_sys_exit_group+0x1b/0x20
[   60.630189]  do_syscall_64+0x6c/0xe0
[   60.634182]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   60.639820]
[   60.641485] read to 0xffff88840fff1cf0 of 4 bytes by task 2430 on cpu 1:
[   60.648969]  __rcu_read_unlock+0x73/0x2c0
[   60.653446]  __unlock_page_memcg+0xda/0xf0
[   60.658019]  unlock_page_memcg+0x32/0x40
[   60.662400]  page_remove_rmap+0x5c/0x200
[   60.666782]  unmap_page_range+0x83c/0xc10
[   60.671259]  unmap_single_vma+0xb0/0x150
[   60.675641]  unmap_vmas+0x81/0xe0
[   60.679341]  exit_mmap+0x135/0x2b0
[   60.683141]  __mmput+0x21/0x150
[   60.686647]  mmput+0x2a/0x30
[   60.689853]  exit_mm+0x2fc/0x350
[   60.693458]  do_exit+0x372/0xff0
[   60.697062]  do_group_exit+0x139/0x140
[   60.701248]  __do_sys_exit_group+0xb/0x10
[   60.705724]  __se_sys_exit_group+0xa/0x10
[   60.710201]  __x64_sys_exit_group+0x1b/0x20
[   60.714872]  do_syscall_64+0x6c/0xe0
[   60.718864]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   60.724503]
[   60.726156] Reported by Kernel Concurrency Sanitizer on:
[   60.732089] CPU: 1 PID: 2430 Comm: sshd Not tainted 5.8.0-rc2-00186-gb4ee11fe08b3-dirty #303
[   60.741510] Hardware name: Intel Corporation S2600GZ/S2600GZ, BIOS SE5C600.86B.02.02.0002.122320131210 12/23/2013
[   60.752957] ==================================================================

And I figured a quick way to get rid of that would be something like the
below, seeing how volatile gets auto annotated... but that doesn't seem
to actually work.

What am I missing?



diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
index 352223664ebd..b08861118e1a 100644
--- a/kernel/rcu/tree_plugin.h
+++ b/kernel/rcu/tree_plugin.h
@@ -351,17 +351,17 @@ static int rcu_preempt_blocked_readers_cgp(struct rcu_node *rnp)
 
 static void rcu_preempt_read_enter(void)
 {
-	current->rcu_read_lock_nesting++;
+	(*(volatile int *)&current->rcu_read_lock_nesting)++;
 }
 
 static int rcu_preempt_read_exit(void)
 {
-	return --current->rcu_read_lock_nesting;
+	return --(*(volatile int *)&current->rcu_read_lock_nesting);
 }
 
 static void rcu_preempt_depth_set(int val)
 {
-	current->rcu_read_lock_nesting = val;
+	WRITE_ONCE(current->rcu_read_lock_nesting, val);
 }
 
 /*

