Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D678532B67F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 11:16:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dr8zS6Dw0z3d9M
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 21:16:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bwFSA/rr;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=b4AIUKig;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=bwFSA/rr; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=b4AIUKig; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dr8yd2G0lz3cQ4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 21:15:37 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614766534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5o9MzMrMVFlLOrKhgcDQAebO+43Y5uWT9SA1yv2Ku+g=;
 b=bwFSA/rrtpSQRBUFgvjdXyepSjJgb+fxucVlBOc+8jJJHB2sj6Ae9JWiYGZ92uSYBYQe51
 3UmPfP0BVxpeFbz9uCkYvzRLNaoKX24SO0aMY8MQhip1AqZAAXAEc82gnyaEOm7x9yjqFO
 cbK55PeRX2htHvbnZZqaaSRHodmFEmlZldRSr/wh7r01k2H1aBuc+a/2xHWOPXIoLoCgbJ
 XZaq60bOHR0tEUrwAwnpU+/ewCewVX6Knj/Mhje4bFAtSYdWQVskamKKBEbvWK4zHw+za1
 AF1ia9QLG0SLgNAsQEFOGdDlXF01GcqVjWPqtzfiHMJOsTh/YNommPga9UXSQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614766534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5o9MzMrMVFlLOrKhgcDQAebO+43Y5uWT9SA1yv2Ku+g=;
 b=b4AIUKighv58GLWloH8f5crxzzmO16h7hplt8+zY51ZxO6SaKEWxthJ+u996O+DdnU+3Wc
 4LdHTBFSjSCqHOBQ==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH next v4 11/15] printk: kmsg_dumper: remove @active field
Date: Wed,  3 Mar 2021 11:15:24 +0100
Message-Id: <20210303101528.29901-12-john.ogness@linutronix.de>
In-Reply-To: <20210303101528.29901-1-john.ogness@linutronix.de>
References: <20210303101528.29901-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, Paul Mackerras <paulus@samba.org>,
 Kees Cook <keescook@chromium.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>,
 Wei Li <liwei391@huawei.com>, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Alistair Popple <alistair@popple.id.au>, Steven Rostedt <rostedt@goodmis.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Nicholas Piggin <npiggin@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All 6 kmsg_dumpers do not benefit from the @active flag:

  (provide their own synchronization)
  - arch/powerpc/kernel/nvram_64.c
  - arch/um/kernel/kmsg_dump.c
  - drivers/mtd/mtdoops.c
  - fs/pstore/platform.c

  (only dump on KMSG_DUMP_PANIC, which does not require
  synchronization)
  - arch/powerpc/platforms/powernv/opal-kmsg.c
  - drivers/hv/vmbus_drv.c

The other 2 kmsg_dump users also do not rely on @active:

  (hard-code @active to always be true)
  - arch/powerpc/xmon/xmon.c
  - kernel/debug/kdb/kdb_main.c

Therefore, @active can be removed.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 arch/powerpc/xmon/xmon.c    |  2 +-
 include/linux/kmsg_dump.h   |  2 --
 kernel/debug/kdb/kdb_main.c |  2 +-
 kernel/printk/printk.c      | 10 +---------
 4 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 3fe37495f63d..80ed3e1becf9 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3001,7 +3001,7 @@ print_address(unsigned long addr)
 static void
 dump_log_buf(void)
 {
-	struct kmsg_dumper dumper = { .active = 1 };
+	struct kmsg_dumper dumper;
 	unsigned char buf[128];
 	size_t len;
 
diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 070c994ff19f..84eaa2090efa 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -36,7 +36,6 @@ enum kmsg_dump_reason {
  * 		through the record iterator
  * @max_reason:	filter for highest reason number that should be dumped
  * @registered:	Flag that specifies if this is already registered
- * @active:	Flag that specifies if this is currently dumping
  * @cur_seq:	Points to the oldest message to dump
  * @next_seq:	Points after the newest message to dump
  */
@@ -44,7 +43,6 @@ struct kmsg_dumper {
 	struct list_head list;
 	void (*dump)(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason);
 	enum kmsg_dump_reason max_reason;
-	bool active;
 	bool registered;
 
 	/* private state of the kmsg iterator */
diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 930ac1b25ec7..315169d5e119 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -2101,7 +2101,7 @@ static int kdb_dmesg(int argc, const char **argv)
 	int adjust = 0;
 	int n = 0;
 	int skip = 0;
-	struct kmsg_dumper dumper = { .active = 1 };
+	struct kmsg_dumper dumper;
 	size_t len;
 	char buf[201];
 
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index e794a08de00f..ce4cc64ba7c9 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3408,8 +3408,6 @@ void kmsg_dump(enum kmsg_dump_reason reason)
 			continue;
 
 		/* initialize iterator with data about the stored records */
-		dumper->active = true;
-
 		logbuf_lock_irqsave(flags);
 		dumper->cur_seq = latched_seq_read_nolock(&clear_seq);
 		dumper->next_seq = prb_next_seq(prb);
@@ -3417,9 +3415,6 @@ void kmsg_dump(enum kmsg_dump_reason reason)
 
 		/* invoke dumper which will iterate over records */
 		dumper->dump(dumper, reason);
-
-		/* reset iterator */
-		dumper->active = false;
 	}
 	rcu_read_unlock();
 }
@@ -3454,9 +3449,6 @@ bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper, bool syslog,
 
 	prb_rec_init_rd(&r, &info, line, size);
 
-	if (!dumper->active)
-		goto out;
-
 	/* Read text or count text lines? */
 	if (line) {
 		if (!prb_read_valid(prb, dumper->cur_seq, &r))
@@ -3542,7 +3534,7 @@ bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
 	bool ret = false;
 	bool time = printk_time;
 
-	if (!dumper->active || !buf || !size)
+	if (!buf || !size)
 		goto out;
 
 	logbuf_lock_irqsave(flags);
-- 
2.20.1

