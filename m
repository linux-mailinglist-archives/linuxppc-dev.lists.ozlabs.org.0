Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E4B18C978
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 10:04:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kHrd23wtzDrQH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 20:04:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kHhQ3hyBzDrZD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 19:56:54 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 18286AE9A;
 Fri, 20 Mar 2020 08:56:49 +0000 (UTC)
From: Davidlohr Bueso <dave@stgolabs.net>
To: tglx@linutronix.de
Subject: [PATCH 19/15] sched/swait: Reword some of the main description
Date: Fri, 20 Mar 2020 01:55:27 -0700
Message-Id: <20200320085527.23861-4-dave@stgolabs.net>
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

With both the increased use of swait and kvm no longer using
it, we can reword some of the comments. While removing Linus'
valid rant, I've also cared to explicitly mention that swait
is very different than regular wait. In addition it is
mentioned against using swait in favor of the regular flavor.

Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 include/linux/swait.h | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/include/linux/swait.h b/include/linux/swait.h
index 73e06e9986d4..6e5b5d0e64fd 100644
--- a/include/linux/swait.h
+++ b/include/linux/swait.h
@@ -9,23 +9,10 @@
 #include <asm/current.h>
 
 /*
- * BROKEN wait-queues.
- *
- * These "simple" wait-queues are broken garbage, and should never be
- * used. The comments below claim that they are "similar" to regular
- * wait-queues, but the semantics are actually completely different, and
- * every single user we have ever had has been buggy (or pointless).
- *
- * A "swake_up_one()" only wakes up _one_ waiter, which is not at all what
- * "wake_up()" does, and has led to problems. In other cases, it has
- * been fine, because there's only ever one waiter (kvm), but in that
- * case gthe whole "simple" wait-queue is just pointless to begin with,
- * since there is no "queue". Use "wake_up_process()" with a direct
- * pointer instead.
- *
- * While these are very similar to regular wait queues (wait.h) the most
- * important difference is that the simple waitqueue allows for deterministic
- * behaviour -- IOW it has strictly bounded IRQ and lock hold times.
+ * Simple waitqueues are semantically very different to regular wait queues
+ * (wait.h). The most important difference is that the simple waitqueue allows
+ * for deterministic behaviour -- IOW it has strictly bounded IRQ and lock hold
+ * times.
  *
  * Mainly, this is accomplished by two things. Firstly not allowing swake_up_all
  * from IRQ disabled, and dropping the lock upon every wakeup, giving a higher
@@ -39,7 +26,7 @@
  *    sleeper state.
  *
  *  - the !exclusive mode; because that leads to O(n) wakeups, everything is
- *    exclusive.
+ *    exclusive. As such swait_wake_up_one will only ever awake _one_ waiter.
  *
  *  - custom wake callback functions; because you cannot give any guarantees
  *    about random code. This also allows swait to be used in RT, such that
-- 
2.16.4

