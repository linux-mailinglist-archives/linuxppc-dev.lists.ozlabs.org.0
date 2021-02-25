Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B65AD3257C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 21:35:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dml10581vz3d3h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 07:35:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lulIOwnu;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kJjC2HdF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=lulIOwnu; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=kJjC2HdF; 
 dkim-atps=neutral
X-Greylist: delayed 606 seconds by postgrey-1.36 at boromir;
 Fri, 26 Feb 2021 07:34:57 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dml012T3Zz3cY8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 07:34:57 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614284687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Gfs86MRR/HIf8qjS9ZT5ZBnpaj1z3IcrEotyUzGR2E=;
 b=lulIOwnuyU3hd/34KyMUx7ZFGNNdseWIGnmk9oyARB+psVa+gwZ1G9Xq6W1/sETRB0Y0cT
 76f/S43QXtg23OwOevaSwfLS9mKZy/VjTO3zsAMrM02VxLZDByEP7jPv5x57ePIKaGQ5kE
 fqygiDs8QaBDHz9ZmEiTZBBpkDrqZWLviyZDsxNAOBtzCD4TGTUjVLBU4hTAhBzHBJlUqS
 M2ZMEF50ojDbTEN2iN+JqWDOmeR7DFEL3JpvuXmmObWw7lLWDyiHWO1PB5UWstma0kJBJ7
 9cU7tZNaVjcSLJpfZmkFAMES+5hOTrDBAFzM4HvE1PDACj0QVUvnZT7w724Faw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614284687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Gfs86MRR/HIf8qjS9ZT5ZBnpaj1z3IcrEotyUzGR2E=;
 b=kJjC2HdFMTtlJGouQmxH7HQD/YDJ7f3i2SUg/u42twc7gzOZhHLeKKxgP3jL+zaTHIv7Cw
 daPYXYV4xAlealBw==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH next v3 14/15] printk: kmsg_dump: remove _nolock() variants
Date: Thu, 25 Feb 2021 21:24:37 +0100
Message-Id: <20210225202438.28985-15-john.ogness@linutronix.de>
In-Reply-To: <20210225202438.28985-1-john.ogness@linutronix.de>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
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
 Thomas Gleixner <tglx@linutronix.de>, Sumit Garg <sumit.garg@linaro.org>,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kmsg_dump_rewind() and kmsg_dump_get_line() are lockless, so there is
no need for _nolock() variants. Remove these functions and switch all
callers of the _nolock() variants.

The functions without _nolock() were chosen because they are already
exported to kernel modules.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
 arch/powerpc/xmon/xmon.c    |  4 +--
 include/linux/kmsg_dump.h   | 16 ----------
 kernel/debug/kdb/kdb_main.c |  8 ++---
 kernel/printk/printk.c      | 60 +++++--------------------------------
 4 files changed, 14 insertions(+), 74 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 5978b90a885f..bf7d69625a2e 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3013,9 +3013,9 @@ dump_log_buf(void)
 	catch_memory_errors = 1;
 	sync();
 
-	kmsg_dump_rewind_nolock(&iter);
+	kmsg_dump_rewind(&iter);
 	xmon_start_pagination();
-	while (kmsg_dump_get_line_nolock(&iter, false, buf, sizeof(buf), &len)) {
+	while (kmsg_dump_get_line(&iter, false, buf, sizeof(buf), &len)) {
 		buf[len] = '\0';
 		printf("%s", buf);
 	}
diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 5d3bf20f9f0a..532673b6570a 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -57,17 +57,12 @@ struct kmsg_dumper {
 #ifdef CONFIG_PRINTK
 void kmsg_dump(enum kmsg_dump_reason reason);
 
-bool kmsg_dump_get_line_nolock(struct kmsg_dump_iter *iter, bool syslog,
-			       char *line, size_t size, size_t *len);
-
 bool kmsg_dump_get_line(struct kmsg_dump_iter *iter, bool syslog,
 			char *line, size_t size, size_t *len);
 
 bool kmsg_dump_get_buffer(struct kmsg_dump_iter *iter, bool syslog,
 			  char *buf, size_t size, size_t *len_out);
 
-void kmsg_dump_rewind_nolock(struct kmsg_dump_iter *iter);
-
 void kmsg_dump_rewind(struct kmsg_dump_iter *iter);
 
 int kmsg_dump_register(struct kmsg_dumper *dumper);
@@ -80,13 +75,6 @@ static inline void kmsg_dump(enum kmsg_dump_reason reason)
 {
 }
 
-static inline bool kmsg_dump_get_line_nolock(struct kmsg_dump_iter *iter,
-					     bool syslog, const char *line,
-					     size_t size, size_t *len)
-{
-	return false;
-}
-
 static inline bool kmsg_dump_get_line(struct kmsg_dump_iter *iter, bool syslog,
 				const char *line, size_t size, size_t *len)
 {
@@ -99,10 +87,6 @@ static inline bool kmsg_dump_get_buffer(struct kmsg_dump_iter *iter, bool syslog
 	return false;
 }
 
-static inline void kmsg_dump_rewind_nolock(struct kmsg_dump_iter *iter)
-{
-}
-
 static inline void kmsg_dump_rewind(struct kmsg_dump_iter *iter)
 {
 }
diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 8544d7a55a57..67d9f2403b52 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -2126,8 +2126,8 @@ static int kdb_dmesg(int argc, const char **argv)
 		kdb_set(2, setargs);
 	}
 
-	kmsg_dump_rewind_nolock(&iter);
-	while (kmsg_dump_get_line_nolock(&iter, 1, NULL, 0, NULL))
+	kmsg_dump_rewind(&iter);
+	while (kmsg_dump_get_line(&iter, 1, NULL, 0, NULL))
 		n++;
 
 	if (lines < 0) {
@@ -2159,8 +2159,8 @@ static int kdb_dmesg(int argc, const char **argv)
 	if (skip >= n || skip < 0)
 		return 0;
 
-	kmsg_dump_rewind_nolock(&iter);
-	while (kmsg_dump_get_line_nolock(&iter, 1, buf, sizeof(buf), &len)) {
+	kmsg_dump_rewind(&iter);
+	while (kmsg_dump_get_line(&iter, 1, buf, sizeof(buf), &len)) {
 		if (skip) {
 			skip--;
 			continue;
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 01385ea92e7c..15a9bc409e0a 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3373,7 +3373,7 @@ void kmsg_dump(enum kmsg_dump_reason reason)
 }
 
 /**
- * kmsg_dump_get_line_nolock - retrieve one kmsg log line (unlocked version)
+ * kmsg_dump_get_line - retrieve one kmsg log line
  * @iter: kmsg dump iterator
  * @syslog: include the "<4>" prefixes
  * @line: buffer to copy the line to
@@ -3388,18 +3388,18 @@ void kmsg_dump(enum kmsg_dump_reason reason)
  *
  * A return value of FALSE indicates that there are no more records to
  * read.
- *
- * The function is similar to kmsg_dump_get_line(), but grabs no locks.
  */
-bool kmsg_dump_get_line_nolock(struct kmsg_dump_iter *iter, bool syslog,
-			       char *line, size_t size, size_t *len)
+bool kmsg_dump_get_line(struct kmsg_dump_iter *iter, bool syslog,
+			char *line, size_t size, size_t *len)
 {
 	struct printk_info info;
 	unsigned int line_count;
 	struct printk_record r;
+	unsigned long flags;
 	size_t l = 0;
 	bool ret = false;
 
+	printk_safe_enter_irqsave(flags);
 	prb_rec_init_rd(&r, &info, line, size);
 
 	/* Read text or count text lines? */
@@ -3420,40 +3420,11 @@ bool kmsg_dump_get_line_nolock(struct kmsg_dump_iter *iter, bool syslog,
 	iter->cur_seq = r.info->seq + 1;
 	ret = true;
 out:
+	printk_safe_exit_irqrestore(flags);
 	if (len)
 		*len = l;
 	return ret;
 }
-
-/**
- * kmsg_dump_get_line - retrieve one kmsg log line
- * @iter: kmsg dump iterator
- * @syslog: include the "<4>" prefixes
- * @line: buffer to copy the line to
- * @size: maximum size of the buffer
- * @len: length of line placed into buffer
- *
- * Start at the beginning of the kmsg buffer, with the oldest kmsg
- * record, and copy one record into the provided buffer.
- *
- * Consecutive calls will return the next available record moving
- * towards the end of the buffer with the youngest messages.
- *
- * A return value of FALSE indicates that there are no more records to
- * read.
- */
-bool kmsg_dump_get_line(struct kmsg_dump_iter *iter, bool syslog,
-			char *line, size_t size, size_t *len)
-{
-	unsigned long flags;
-	bool ret;
-
-	printk_safe_enter_irqsave(flags);
-	ret = kmsg_dump_get_line_nolock(iter, syslog, line, size, len);
-	printk_safe_exit_irqrestore(flags);
-
-	return ret;
-}
 EXPORT_SYMBOL_GPL(kmsg_dump_get_line);
 
 /**
@@ -3542,22 +3513,6 @@ bool kmsg_dump_get_buffer(struct kmsg_dump_iter *iter, bool syslog,
 }
 EXPORT_SYMBOL_GPL(kmsg_dump_get_buffer);
 
-/**
- * kmsg_dump_rewind_nolock - reset the iterator (unlocked version)
- * @iter: kmsg dump iterator
- *
- * Reset the dumper's iterator so that kmsg_dump_get_line() and
- * kmsg_dump_get_buffer() can be called again and used multiple
- * times within the same dumper.dump() callback.
- *
- * The function is similar to kmsg_dump_rewind(), but grabs no locks.
- */
-void kmsg_dump_rewind_nolock(struct kmsg_dump_iter *iter)
-{
-	iter->cur_seq = latched_seq_read_nolock(&clear_seq);
-	iter->next_seq = prb_next_seq(prb);
-}
-
 /**
  * kmsg_dump_rewind - reset the iterator
  * @iter: kmsg dump iterator
@@ -3571,7 +3526,8 @@ void kmsg_dump_rewind(struct kmsg_dump_iter *iter)
 	unsigned long flags;
 
 	printk_safe_enter_irqsave(flags);
-	kmsg_dump_rewind_nolock(iter);
+	iter->cur_seq = latched_seq_read_nolock(&clear_seq);
+	iter->next_seq = prb_next_seq(prb);
 	printk_safe_exit_irqrestore(flags);
 }
 EXPORT_SYMBOL_GPL(kmsg_dump_rewind);
-- 
2.20.1

