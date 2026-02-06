Return-Path: <linuxppc-dev+bounces-16670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPN3IEr5hWlEIwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:23:06 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E24FEC40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:23:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6xBs3VhHz309y;
	Sat, 07 Feb 2026 01:23:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770387781;
	cv=none; b=DRvPRJ8JcuzyFx+gCMgMQN1GKOVjaGK4My7zdXWfXnoPZ/9wV9FLhJzhKJM336zzN7UiGkrbYhuNpSo0klWoh6jZexscWCJjG4U2c9IHTyEErt9vVApdm0axT0HKlBHDzZwWl85VfESMETMRLcLRJxzeZnc4zocAUrMuBuspIgWAN8EBfgGGavAW1cAae1XXCQu6tQu8t9fERbyRFq3jw3YsZbDXVfrfXMJA3HsDm6FBJ3S1guZp0Aop5Wnmj0p8HQ2dUBidRz4ZxrZlaxdVCI+9YqvU2lXhE/Y7JZdOBlZOr5PG6wLSJNxB4JQwuVV9f7dBh7aq0kKRAlhHi575/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770387781; c=relaxed/relaxed;
	bh=eA06/bgMGsjzsRVJm+XVy8RQWyEcFnnv4pSzAu4dKo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=od1LLpcMP59bI/JYJAksZfjo3uw8quNGyTZyd5hIYhdfI954+CUTbdyLy4AeZOch9AgsmGygwjsKQdtZMFeyM0Af0xaTfRhUotkuZ5kYT1v9f6ussGzYhzuGANBWVjSJFOf1NcakQFwtfTmJpHHcWM1RcOl+mvJ/QiVr/cFuYn/JscT9yadgN2ZrpNpuOjU7O/g5AT6NqSJRGRSvXGKqFXRPUNyVED4jPthAmREf2zT0juY64Am0Lr5eW5C17fmowTq0fEoWJwOUApti7MBgAt1LooUUYqCYFSfeZbwBVQIjoK+oZI7/n99JVfInVrq+36NbdC96aRT8Hwwz/84+vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gHOkkP+g; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gHOkkP+g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6xBq4n9pz2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 01:22:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F59540944;
	Fri,  6 Feb 2026 14:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00D4C116C6;
	Fri,  6 Feb 2026 14:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770387777;
	bh=5RNRg1BFmFbwFXPge2vBQ/jTNMfqGWngL8N/C51PA/Q=;
	h=From:To:Cc:Subject:Date:From;
	b=gHOkkP+gSugbWlo8bJ3uh+YpAx9mDAXAt1cR8dVvhEzYIgOtVBeZsQp64HqmFTY9i
	 YBBA5G/vgdPOgEYP7STZwjGxeEg/GvrZJ3LFK02feY+CrMC99Kh5eSbysAP37BZYwz
	 ypvjlwZSiruBiiudWtg4RNrxhfrSiT8T8WKOZ85y+nObwyke/zdwbm56GMuw17QM0c
	 98g6uujXQlFBaoB6dgRUer8icV5B5JOP6pGn7iq3h4W1M+A0t8ciXwxHh2ptcH5XZP
	 jTswPP1hbzx0c0qPUOY7y1auZxM+C4s+7fvbqq5GcjikUbtO7fRRUXurwwWg+ix21O
	 wW6HZLFnaK26g==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Kieran Bingham <kbingham@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Xin Zhao <jackzxcui1989@163.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mel Gorman <mgorman@suse.de>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-s390@vger.kernel.org,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-pm@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH 00/15 v2] tick/sched: Refactor idle cputime accounting
Date: Fri,  6 Feb 2026 15:22:30 +0100
Message-ID: <20260206142245.58987-1-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	TAGGED_FROM(0.00)[bounces-16670-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:frederic@kernel.org,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:kbingham@kernel.org,m:mingo@redhat.com,m:jackzxcui1989@163.com,m:joelagnelf@nvidia.com,m:neeraj.upadhyay@kernel.org,m:svens@linux.ibm.com,m:boqun.feng@gmail.com,m:mgorman@suse.de,m:dietmar.eggemann@arm.com,m:bsegall@google.com,m:mpe@ellerman.id.au,m:rafael@kernel.org,m:paulmck@kernel.org,m:anna-maria@linutronix.de,m:agordeev@linux.ibm.com,m:maddy@linux.ibm.com,m:linux-s390@vger.kernel.org,m:jan.kiszka@siemens.com,m:juri.lelli@redhat.com,m:chleroy@kernel.org,m:linux-pm@vger.kernel.org,m:urezki@gmail.com,m:peterz@infradead.org,m:rostedt@goodmis.org,m:tglx@linutronix.de,m:npiggin@gmail.com,m:hca@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:borntraeger@linux.ibm.com,m:vschneid@redhat.com,m:viresh.kumar@linaro.org,m:sshegde@linux.ibm.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,linaro.org,redhat.com,163.com,nvidia.com,gmail.com,suse.de,arm.com,google.com,ellerman.id.au,linutronix.de,vger.kernel.org,siemens.com,infradead.org,goodmis.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 73E24FEC40
X-Rspamd-Action: no action

Hi,

After the issue reported here:

        https://lore.kernel.org/all/20251210083135.3993562-1-jackzxcui1989@163.com/

It occurs that the idle cputime accounting is a big mess that
accumulates within two concurrent statistics, each having their own
shortcomings:

* The accounting for online CPUs which is based on the delta between
  tick_nohz_start_idle() and tick_nohz_stop_idle().

  Pros:
       - Works when the tick is off

       - Has nsecs granularity

  Cons:
       - Account idle steal time but doesn't substract it from idle
         cputime.

       - Assumes CONFIG_IRQ_TIME_ACCOUNTING by not accounting IRQs but
         the IRQ time is simply ignored when
         CONFIG_IRQ_TIME_ACCOUNTING=n

       - The windows between 1) idle task scheduling and the first call
         to tick_nohz_start_idle() and 2) idle task between the last
         tick_nohz_stop_idle() and the rest of the idle time are
         blindspots wrt. cputime accounting (though mostly insignificant
         amount)

       - Relies on private fields outside of kernel stats, with specific
         accessors.

* The accounting for offline CPUs which is based on ticks and the
  jiffies delta during which the tick was stopped.

  Pros:
       - Handles steal time correctly

       - Handle CONFIG_IRQ_TIME_ACCOUNTING=y and
         CONFIG_IRQ_TIME_ACCOUNTING=n correctly.

       - Handles the whole idle task

       - Accounts directly to kernel stats, without midlayer accumulator.

   Cons:
       - Doesn't elapse when the tick is off, which doesn't make it
         suitable for online CPUs.

       - Has TICK_NSEC granularity (jiffies)

       - Needs to track the dyntick-idle ticks that were accounted and
         substract them from the total jiffies time spent while the tick
         was stopped. This is an ugly workaround.

Having two different accounting for a single context is not the only
problem: since those accountings are of different natures, it is
possible to observe the global idle time going backward after a CPU goes
offline, as reported by Xin Zhao.

Clean up the situation with introducing a hybrid approach that stays
coherent, fixes the backward jumps and works for both online and offline
CPUs:

* Tick based or native vtime accounting operate before the tick is
  stopped and resumes once the tick is restarted.

* When the idle loop starts, switch to dynticks-idle accounting as is
  done currently, except that the statistics accumulate directly to the
  relevant kernel stat fields.

* Private dyntick cputime accounting fields are removed.

* Works on both online and offline case.

* Move most of the relevant code to the common sched/cputime subsystem

* Handle CONFIG_IRQ_TIME_ACCOUNTING=n correctly such that the
  dynticks-idle accounting still elapses while on IRQs.

* Correctly substract idle steal cputime from idle time

Changes since v1:

- Fix deadlock involving double seq count lock on idle

- Fix build breakage on powerpc

- Fix build breakage on s390 (Heiko)

- Fix broken sysfs s390 idle time file (Heiko)

- Convert most ktime usage here into u64 (Peterz)

- Add missing (or too implicit) <linux/sched/clock.h> (Peterz)

- Fix whole idle time acccounting breakage due to missing TS_FLAG_ set
  on idle entry (Shrikanth Hegde)

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
	timers/core-v2

HEAD: 21458b98c80a0567d48131240317b7b73ba34c3c
Thanks,
	Frederic
---

Frederic Weisbecker (15):
      sched/idle: Handle offlining first in idle loop
      sched/cputime: Remove superfluous and error prone kcpustat_field() parameter
      sched/cputime: Correctly support generic vtime idle time
      powerpc/time: Prepare to stop elapsing in dynticks-idle
      s390/time: Prepare to stop elapsing in dynticks-idle
      tick/sched: Unify idle cputime accounting
      cpufreq: ondemand: Simplify idle cputime granularity test
      tick/sched: Remove nohz disabled special case in cputime fetch
      tick/sched: Move dyntick-idle cputime accounting to cputime code
      tick/sched: Remove unused fields
      tick/sched: Account tickless idle cputime only when tick is stopped
      tick/sched: Consolidate idle time fetching APIs
      sched/cputime: Provide get_cpu_[idle|iowait]_time_us() off-case
      sched/cputime: Handle idle irqtime gracefully
      sched/cputime: Handle dyntick-idle steal time correctly

 arch/powerpc/kernel/time.c         |  41 +++++
 arch/s390/include/asm/idle.h       |  14 +-
 arch/s390/kernel/idle.c            |  19 ++-
 arch/s390/kernel/vtime.c           |  57 ++++++-
 drivers/cpufreq/cpufreq.c          |  29 +---
 drivers/cpufreq/cpufreq_governor.c |   6 +-
 drivers/cpufreq/cpufreq_ondemand.c |   7 +-
 drivers/macintosh/rack-meter.c     |   2 +-
 fs/proc/stat.c                     |  40 +----
 fs/proc/uptime.c                   |   8 +-
 include/linux/kernel_stat.h        |  76 ++++++++--
 include/linux/tick.h               |   6 +-
 include/linux/vtime.h              |  22 ++-
 kernel/rcu/tree.c                  |   9 +-
 kernel/rcu/tree_stall.h            |   7 +-
 kernel/sched/cputime.c             | 304 +++++++++++++++++++++++++++++++------
 kernel/sched/idle.c                |  13 +-
 kernel/sched/sched.h               |   1 +
 kernel/time/hrtimer.c              |   2 +-
 kernel/time/tick-internal.h        |   2 -
 kernel/time/tick-sched.c           | 210 ++++++-------------------
 kernel/time/tick-sched.h           |  12 --
 kernel/time/timer.c                |   2 +-
 kernel/time/timer_list.c           |   6 +-
 scripts/gdb/linux/timerlist.py     |   4 -
 25 files changed, 525 insertions(+), 374 deletions(-)

