Return-Path: <linuxppc-dev+bounces-15896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A33D32E13
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 15:52:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt2rS3fvGz2xm3;
	Sat, 17 Jan 2026 01:52:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768575144;
	cv=none; b=OSU/GQAUdpwM1HmEh69p8WGqi9+qhxWh1zNR3dXCs2k//O986x2jWMFzCtmhPiuBW+xLaBWPysyD6l2lCR29+gHQ9/tI4uJE4rd8qzn1EElxu9eBR8kL16R4Llj5qxxkdDFYE7aUe69uUFVx9RDbggesL95U0a31jFk7+6V9Rfx4nDHOOAZIGLbqW0XCZucYCO3+HSyc3cgYPMk1v1tEGC/zqW82yGms8sohZLMpQ8N2YWpB/JZYq47UjdSi0GuAYNoFsT7oytXg8qMVrYdESrtj1EG0KnP6o5z58twAWpo1Q/rI3uN5kZ1epNDyU9A1WOQGr0P1JFi7DmbePpRGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768575144; c=relaxed/relaxed;
	bh=4jS2e4My5UHDJ70Bn6LaLfJsqnr0dlhgHVQcAHEowjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hO4DiZ7KCjLdhwNxYjoZGhSiAmHathpxDYALsmGOmGYRW7GzmmR+bnSaiDOr9vQ0acX/wNKdSToEu8nAENvDv94M5ifkU+07kSsRbG1j/F1q6VwdDbkW0QTGW7l9YAWyT2E1nfsnSAINi+A9DUmKGpxgTDj+aFgzjRyB3CnvzMoF217iW0OGbNFhGxSFyjuWA+fqX6MH33j9R2Wxn7B5B+mhrDQpuL754flTM8xeNPE1rMcD6fq9OW/dwMVPOWureTd2db3W+Vh8qZwfLJaZinhRaVsSXHrE494kK0TLNkVYWxqfbV1bIaqpGgUtcxezQ8cJBXW7V9VGxa8+H+T7xA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i2BL6MXw; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i2BL6MXw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt2rR2XTNz2xnj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 01:52:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7BAB6016F;
	Fri, 16 Jan 2026 14:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D47C116C6;
	Fri, 16 Jan 2026 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768575140;
	bh=gbLwhTlTxKSDHU4mEFy0F6J11rxQq3aj/1R8qTJjzyc=;
	h=From:To:Cc:Subject:Date:From;
	b=i2BL6MXwnFLjT2RhaNjQkDJ02sMztAuNhOvwFzUbF3otqJF3SfbbgB9eMibM19xq2
	 bl1V6lTECCDYQTxih6izshj472Xyceb6C1+4TOOjIJxAqlpbuCjr5t+V2+cGKaEatc
	 Wj07CvKvNHrmovrX/+GyuwbAGSFHzoZSbCANmgbmsXkWMCLPNffc6mDP9obUn0+xDl
	 hZNSDhaNT06745nzkKGJVPIsNwvEnYCF1DzQul/MFByYC+7wYZNnvoLWW7PD1gxx9D
	 ECWqfjSk3kBoXmsMgIw5RcnD+dTsl1/2cAZcYe/+AeP4owg9GDKzlQmthVBS0V0MRF
	 fb5r5qUkbrROA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Kieran Bingham <kbingham@kernel.org>,
	Ben Segall <bsegall@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Xin Zhao <jackzxcui1989@163.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	linuxppc-dev@lists.ozlabs.org,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	linux-pm@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	linux-s390@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 00/15] tick/sched: Refactor idle cputime accounting
Date: Fri, 16 Jan 2026 15:51:53 +0100
Message-ID: <20260116145208.87445-1-frederic@kernel.org>
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

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
	timers/core

HEAD: 6a3d814ef2f6142714bef862be36def5ca4c9d96
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
      sched/cputime: Consolidate get_cpu_[idle|iowait]_time_us()
      sched/cputime: Handle idle irqtime gracefully
      sched/cputime: Handle dyntick-idle steal time correctly

 arch/powerpc/kernel/time.c         |  41 +++++
 arch/s390/include/asm/idle.h       |  11 +-
 arch/s390/kernel/idle.c            |  13 +-
 arch/s390/kernel/vtime.c           |  57 ++++++-
 drivers/cpufreq/cpufreq.c          |  29 +---
 drivers/cpufreq/cpufreq_governor.c |   6 +-
 drivers/cpufreq/cpufreq_ondemand.c |   7 +-
 drivers/macintosh/rack-meter.c     |   2 +-
 fs/proc/stat.c                     |  40 +----
 fs/proc/uptime.c                   |   8 +-
 include/linux/kernel_stat.h        |  76 ++++++++--
 include/linux/tick.h               |   4 -
 include/linux/vtime.h              |  20 ++-
 kernel/rcu/tree.c                  |   9 +-
 kernel/rcu/tree_stall.h            |   7 +-
 kernel/sched/cputime.c             | 302 +++++++++++++++++++++++++++++++------
 kernel/sched/idle.c                |  11 +-
 kernel/sched/sched.h               |   1 +
 kernel/time/tick-sched.c           | 203 +++++--------------------
 kernel/time/tick-sched.h           |  12 --
 kernel/time/timer_list.c           |   6 +-
 scripts/gdb/linux/timerlist.py     |   4 -
 22 files changed, 505 insertions(+), 364 deletions(-)

