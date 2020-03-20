Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC25618C964
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 09:59:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kHlc1q3kzDrN7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 19:59:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=stgolabs.net (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stgolabs.net
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kHh95fPLzDrYy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 19:56:41 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E7528AB76;
 Fri, 20 Mar 2020 08:56:38 +0000 (UTC)
From: Davidlohr Bueso <dave@stgolabs.net>
To: tglx@linutronix.de
Subject: [PATCH 17/15] rcuwait: Inform rcuwait_wake_up() users if a wakeup was
 attempted
Date: Fri, 20 Mar 2020 01:55:25 -0700
Message-Id: <20200320085527.23861-2-dave@stgolabs.net>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200320085527.23861-1-dave@stgolabs.net>
References: <20200318204302.693307984@linutronix.de>
 <20200320085527.23861-1-dave@stgolabs.net>
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
Cc: rdunlap@infradead.org, peterz@infradead.org, linux-pci@vger.kernel.org,
 bigeasy@linutronix.de, linux-kernel@vger.kernel.org, joel@joelfernandes.org,
 will@kernel.org, mingo@kernel.org, dave@stgolabs.net, arnd@arndb.de,
 Davidlohr Bueso <dbueso@suse.de>, torvalds@linux-foundation.org,
 paulmck@kernel.org, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org,
 bhelgaas@google.com, kurt.schwemmer@microsemi.com, kvalo@codeaurora.org,
 balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, oleg@redhat.com, netdev@vger.kernel.org,
 logang@deltatee.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let the caller know if wake_up_process() was actually called or not;
some users can use this information for ad-hoc. Of course returning
true does not guarantee that wake_up_process() actually woke anything
up.

Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 include/linux/rcuwait.h |  2 +-
 kernel/exit.c           | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/linux/rcuwait.h b/include/linux/rcuwait.h
index 6e8798458091..3f83b9a12ad3 100644
--- a/include/linux/rcuwait.h
+++ b/include/linux/rcuwait.h
@@ -24,7 +24,7 @@ static inline void rcuwait_init(struct rcuwait *w)
 	w->task = NULL;
 }
 
-extern void rcuwait_wake_up(struct rcuwait *w);
+extern bool rcuwait_wake_up(struct rcuwait *w);
 
 /*
  * The caller is responsible for locking around rcuwait_wait_event(),
diff --git a/kernel/exit.c b/kernel/exit.c
index 6cc6cc485d07..b0bb0a8ec4b1 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -234,9 +234,10 @@ void release_task(struct task_struct *p)
 		goto repeat;
 }
 
-void rcuwait_wake_up(struct rcuwait *w)
+bool rcuwait_wake_up(struct rcuwait *w)
 {
 	struct task_struct *task;
+	bool ret = false;
 
 	rcu_read_lock();
 
@@ -254,10 +255,15 @@ void rcuwait_wake_up(struct rcuwait *w)
 	smp_mb(); /* (B) */
 
 	task = rcu_dereference(w->task);
-	if (task)
+	if (task) {
 		wake_up_process(task);
+	        ret = true;
+	}
 	rcu_read_unlock();
+
+	return ret;
 }
+EXPORT_SYMBOL_GPL(rcuwait_wake_up);
 
 /*
  * Determine if a process group is "orphaned", according to the POSIX
-- 
2.16.4

