Return-Path: <linuxppc-dev+bounces-16674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJenJGb5hWlEIwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:23:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49A3FECD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:23:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6xCR1KtWz30Pr;
	Sat, 07 Feb 2026 01:23:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770387811;
	cv=none; b=abSV5uAwbjzR4WYn18I9138R+ITJ0CJtD9Edmx+iZG5ThrFxDB2MRSQTIlWKF1LqCjtfF7GHVGdVFX55DSjvsABpoXGNC0KHps2ux7pjSB/RSWfWVOUh5UjYIj0ff41GeWvI6jBvehVJG6tNQcHCBIEENhpca0k9v4SfdKIjhgLPrhAVQI0uvh+sOVVsohGh/VjeAj+99ycP0Br21gRPni6vjZotcmr4uIvDWqV5M4TpkFfeq7WVzBkd9XXP0OKgsOKkZGaKmFCFVGo3pqV9M3uErgcXrssC6YdZ+6jQt69pWjZqqpHHlk/7BCL1pjhwq2rjpAaLH0pjOXCsxG1bYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770387811; c=relaxed/relaxed;
	bh=KQDGWHd/nfemyPu2ZwVPkUoWKy/c6hV6vHT4KsyK24A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gB06fuGqE4Vq9r5/9DyHt/s+Bwp8zIdvmx4v5/P8+2SlKFpWCySJEqjbr+UhgS/BqszHYdk2m+I/Fy3azHlWhGZa0pkxJsnfaxjk0JWkEG4FgSokdEeK6smLEkErOkdBj2oHCoTzG+JU+Bm9NXLJGlKAizs41hTVGS/t1BFK9VGIb0Vg9C38XTpUQpcxKC4lQQ8TBF2BkYOId63yAHP1XiF2vd76FAK5sqHb1Ngbew4c/qV8MrayyuEr2oQzIP+OJ13mrTfgJmRmQJPWRIU/56xNF0ilepEinZF0znv8vwJLAVjtMi0Ogg9DxlmTa3a5FcfpZuBAxxBSmZF2q2OPGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=biDG7Lt0; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=biDG7Lt0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6xCQ2RvZz2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 01:23:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFF26441C4;
	Fri,  6 Feb 2026 14:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56251C116C6;
	Fri,  6 Feb 2026 14:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770387808;
	bh=g8tVOSmKODdWDGu0H8GcuoZ/GglJDm/0ZHioXuiWVfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=biDG7Lt0Ev43G9yPf/tgbfgfwOIveTEAb5DEh8dtk+U1XX8gz0Q/dtBZNfgOtMJEl
	 kNfCLFIfPB6t6uP61zZj+shuMOeqZpOC31b4NHcrsKWospmBqyGW9A6Qq3TQJ4oPWp
	 70x4mH4gbM+55OkCaL8A7oEHXbswaRXY+tnV/SzSPKOeUNh4EUFhAowwgCz9W2ycM3
	 qgFsurW+hcFm187yRedu7bgw/O83UsalM4x9AAr3yvdOKALeJ/Det5+MMsFD6sxceg
	 aGycEmOIKs+IR8sy/n14LeKQpTkOc2iVjLeUzbFPrBqK/lSA0Anv/bcODsH4+wsvyN
	 oR5GpdjQzF1XQ==
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
	linuxppc-dev@lists.ozlabs.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH 04/15] powerpc/time: Prepare to stop elapsing in dynticks-idle
Date: Fri,  6 Feb 2026 15:22:34 +0100
Message-ID: <20260206142245.58987-5-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260206142245.58987-1-frederic@kernel.org>
References: <20260206142245.58987-1-frederic@kernel.org>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16674-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:frederic@kernel.org,m:chleroy@kernel.org,m:rafael@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:hca@linux.ibm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:maddy@linux.ibm.com,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:sshegde@linux.ibm.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,vger.kernel.org,lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C49A3FECD3
X-Rspamd-Action: no action

Currently the tick subsystem stores the idle cputime accounting in
private fields, allowing cohabitation with architecture idle vtime
accounting. The former is fetched on online CPUs, the latter on offline
CPUs.

For consolidation purpose, architecture vtime accounting will continue
to account the cputime but will make a break when the idle tick is
stopped. The dyntick cputime accounting will then be relayed by the tick
subsystem so that the idle cputime is still seen advancing coherently
even when the tick isn't there to flush the idle vtime.

Prepare for that and introduce three new APIs which will be used in
subsequent patches:

_ vtime_dynticks_start() is deemed to be called when idle enters in
  dyntick mode. The idle cputime that elapsed so far is accumulated.

- vtime_dynticks_stop() is deemed to be called when idle exits from
  dyntick mode. The vtime entry clocks are fast-forward to current time
  so that idle accounting restarts elapsing from now.

- vtime_reset() is deemed to be called from dynticks idle IRQ entry to
  fast-forward the clock to current time so that the IRQ time is still
  accounted by vtime while nohz cputime is paused.

Also accumulated vtime won't be flushed from dyntick-idle ticks to avoid
accounting twice the idle cputime, along with nohz accounting.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 arch/powerpc/kernel/time.c | 41 ++++++++++++++++++++++++++++++++++++++
 include/linux/vtime.h      |  6 ++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 4bbeb8644d3d..18506740f4a4 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -376,6 +376,47 @@ void vtime_task_switch(struct task_struct *prev)
 		acct->starttime = acct0->starttime;
 	}
 }
+
+#ifdef CONFIG_NO_HZ_COMMON
+/**
+ * vtime_reset - Fast forward vtime entry clocks
+ *
+ * Called from dynticks idle IRQ entry to fast-forward the clocks to current time
+ * so that the IRQ time is still accounted by vtime while nohz cputime is paused.
+ */
+void vtime_reset(void)
+{
+	struct cpu_accounting_data *acct = get_accounting(current);
+
+	acct->starttime = mftb();
+#ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
+	acct->startspurr = read_spurr(acct->starttime);
+#endif
+}
+
+/**
+ * vtime_dyntick_start - Inform vtime about entry to idle-dynticks
+ *
+ * Called when idle enters in dyntick mode. The idle cputime that elapsed so far
+ * is accumulated and the tick subsystem takes over the idle cputime accounting.
+ */
+void vtime_dyntick_start(void)
+{
+	vtime_account_idle(current);
+}
+
+/**
+ * vtime_dyntick_stop - Inform vtime about exit from idle-dynticks
+ *
+ * Called when idle exits from dyntick mode. The vtime entry clocks are
+ * fast-forward to current time so that idle accounting restarts elapsing from
+ * now.
+ */
+void vtime_dyntick_stop(void)
+{
+	vtime_reset();
+}
+#endif /* CONFIG_NO_HZ_COMMON */
 #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
 
 void __no_kcsan __delay(unsigned long loops)
diff --git a/include/linux/vtime.h b/include/linux/vtime.h
index 336875bea767..61b94c12d7dd 100644
--- a/include/linux/vtime.h
+++ b/include/linux/vtime.h
@@ -37,11 +37,17 @@ extern void vtime_account_irq(struct task_struct *tsk, unsigned int offset);
 extern void vtime_account_softirq(struct task_struct *tsk);
 extern void vtime_account_hardirq(struct task_struct *tsk);
 extern void vtime_flush(struct task_struct *tsk);
+extern void vtime_reset(void);
+extern void vtime_dyntick_start(void);
+extern void vtime_dyntick_stop(void);
 #else /* !CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
 static inline void vtime_account_irq(struct task_struct *tsk, unsigned int offset) { }
 static inline void vtime_account_softirq(struct task_struct *tsk) { }
 static inline void vtime_account_hardirq(struct task_struct *tsk) { }
 static inline void vtime_flush(struct task_struct *tsk) { }
+static inline void vtime_reset(void) { }
+static inline void vtime_dyntick_start(void) { }
+extern inline void vtime_dyntick_stop(void) { }
 #endif
 
 /*
-- 
2.51.1


