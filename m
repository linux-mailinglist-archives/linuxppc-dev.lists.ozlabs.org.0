Return-Path: <linuxppc-dev+bounces-15897-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B29D32E16
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 15:52:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt2rZ65kwz3bTf;
	Sat, 17 Jan 2026 01:52:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768575150;
	cv=none; b=RjSJlzqamka+ddlbf0LKI8bzQuBln0vzh35XkrcEtKWliu8O5501LPdxb8I/6s4uosR9TR18zPTeTxTabe8O2nsJ8NzQUc9mU0gZM0eA7BbIs9SUPaJUkeLeKWBTME1IDdDnYGyd9NbadNLCnJGs1MwceXCfLeuG2OtdTsBUMlrvYF6oGy/z6/HZnb43rLiN1eSJRX0RGEMev+xOMx6epc2IxDwwAgRR3Qim7u/XxmT6dTyjBhbP67S72yLHsr1zEQc26qMXzZWXvrQgt0eTJL4ZXU/IOuJqhnw9aQjgIecsKvTzouQUISWC8CyNIHa0t2RdQnD7rxO1zT8NEvi2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768575150; c=relaxed/relaxed;
	bh=q1Y5XhU037hsVljWUPx0ZYD0BzJ5ra+5QOYg/504chE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lym1S3NOrTuWCFyDGTFjn/HTYXSbJi+ImnGJdtsaJdoo5NtWfcbkj1Bsju9ZP6bVdfIi86I/UMFzWMycgnESVpc3EcNzz1F1H+YQArtCcFglNsDDFtWr/cY+Cnnor7vBg9eS+NZge4L3+jB2UKmfAYKDAIyvEsRJZL2Uuz7HXrFP2FhIIjegwSKugUonhDBHFO2/9x6GsNQ1ROjb7apuxNwr2nu0pfoeiGx73oku+nBM2PWewq/KkdqK4TDoFZWyN7xXmeZ00Njs8jKa+YBt0WJ31T4eeSqSxAf9ZD0JsNrN/VHxsQWH84bo39vWRVY40uqRwBEO5KmhePEzz4bq8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BlqCwn2Y; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BlqCwn2Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt2rY6fHjz2xnj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 01:52:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E8AA660160;
	Fri, 16 Jan 2026 14:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FDAC19421;
	Fri, 16 Jan 2026 14:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768575147;
	bh=AunS2qc13yjAkPCRwR4BY8llDOuJfk4lXWa5mN6Z7vE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BlqCwn2YqqsP+baZapFQ2Pk8CvxIq+ZishCZjE6uTpwv+ovsptwhqtsPhBh7V+OIG
	 1urHhwFrOFkMLDXB62n/42kPaa8XEk9xkVQ3StO1dvAoIq7IOsSUJ7Z9gmTmn+A7Oq
	 wOadWfFRYVWv3iyp8oPlNZYOMuOTa1J7Lg7efbMLvA1U1OOlJ2X9jlJF4Tnc6hCio2
	 BL593vlwI8MvVly+7Fx7wUKPtRWsClhbLa5u4jQy6KrBBMM91+cWXJ21NDC/Oq0LH7
	 7Fg/Gdw9RjA7uHoS/moX9agnj3h5E4Lys7jb3GLWmMqLdqnpfkgAbh37OZpnXG4SD7
	 j4qOYkZUJbLPA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ben Segall <bsegall@google.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mel Gorman <mgorman@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Xin Zhao <jackzxcui1989@163.com>,
	linux-pm@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/15] sched/idle: Handle offlining first in idle loop
Date: Fri, 16 Jan 2026 15:51:54 +0100
Message-ID: <20260116145208.87445-2-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260116145208.87445-1-frederic@kernel.org>
References: <20260116145208.87445-1-frederic@kernel.org>
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

Offline handling happens from within the inner idle loop,
after the beginning of dyntick cputime accounting, nohz idle
load balancing and TIF_NEED_RESCHED polling.

This is not necessary and even buggy because:

* There is no dyntick handling to do. And calling tick_nohz_idle_enter()
  messes up with the struct tick_sched reset that was performed on
  tick_sched_timer_dying().

* There is no nohz idle balancing to do.

* Polling on TIF_RESCHED is irrelevant at this stage, there are no more
  tasks allowed to run.

* No need to check if need_resched() before offline handling since
  stop_machine is done and all per-cpu kthread should be done with
  their job.

Therefore move the offline handling at the beginning of the idle loop.
This will also ease the idle cputime unification later by not elapsing
idle time while offline through the call to:

	tick_nohz_idle_enter() -> tick_nohz_start_idle()

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/sched/idle.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index c174afe1dd17..35d79af3286d 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -260,6 +260,12 @@ static void do_idle(void)
 {
 	int cpu = smp_processor_id();
 
+	if (cpu_is_offline(cpu)) {
+		local_irq_disable();
+		cpuhp_report_idle_dead();
+		arch_cpu_idle_dead();
+	}
+
 	/*
 	 * Check if we need to update blocked load
 	 */
@@ -311,11 +317,6 @@ static void do_idle(void)
 		 */
 		local_irq_disable();
 
-		if (cpu_is_offline(cpu)) {
-			cpuhp_report_idle_dead();
-			arch_cpu_idle_dead();
-		}
-
 		arch_cpu_idle_enter();
 		rcu_nocb_flush_deferred_wakeup();
 
-- 
2.51.1


