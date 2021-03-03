Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAA532B681
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 11:16:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dr8zz37Txz3dH2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 21:16:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jptMt/lC;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EUpeJ9EX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=jptMt/lC; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=EUpeJ9EX; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dr8yf6CLFz3cXt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 21:15:38 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614766536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8h6yZzQL8ZfWHLvEs3QAIVV1g9tQwJ5TiQ/YxHavlw=;
 b=jptMt/lCurssOvVO7r4XOpmMX3yvoEvhYlxqNQ2oDOuliPMqszhh7NPzy6MW9huUbAynA3
 p3gA+SBhpgnysAbLWOnRMe3UjYt3vc3GHgcmQo850eMeVsU0l/DArr4PEUIurGPuTySCLa
 seb5sV/saOiAR6J+uvljNbSqEFhvgcnQnFAdAImILJAXezEjguCKRGkG229c5LxQVq2VIH
 8qwXryTr9bynnAQiBx2b4Lw+Hh0FD7kYLvn8ToyAGOAP12ekpF10iXAfopTRIA7h7/7Xl6
 ++4X/JmdaaJ7UuySMo/frYK8wgOb0fOrTh7BkyemdVttnWA3AfFxvX8BPBQEfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614766536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8h6yZzQL8ZfWHLvEs3QAIVV1g9tQwJ5TiQ/YxHavlw=;
 b=EUpeJ9EXIltwzNOFI1QL82PS0Fqehccz1OGv20ytOLGysj/50hWuh05HY7sP6T0fOc1ZtH
 KNYu4MrbKwLjfZAA==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH next v4 12/15] printk: introduce a kmsg_dump iterator
Date: Wed,  3 Mar 2021 11:15:25 +0100
Message-Id: <20210303101528.29901-13-john.ogness@linutronix.de>
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
Cc: linux-hyperv@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Meyer <thomas@m3y3r.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, Wei Liu <wei.liu@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Anton Vorontsov <anton@enomsg.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Wei Li <liwei391@huawei.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 Alistair Popple <alistair@popple.id.au>, Jeff Dike <jdike@addtoit.com>,
 Colin Cross <ccross@android.com>, linux-um@lists.infradead.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Nicholas Piggin <npiggin@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jordan Niethe <jniethe5@gmail.com>, Michael Kelley <mikelley@microsoft.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Richard Weinberger <richard@nod.at>, kgdb-bugreport@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than storing the iterator information in the registered
kmsg_dumper structure, create a separate iterator structure. The
kmsg_dump_iter structure can reside on the stack of the caller, thus
allowing lockless use of the kmsg_dump functions.

Update code that accesses the kernel logs using the kmsg_dumper
structure to use the new kmsg_dump_iter structure. For kmsg_dumpers,
this also means adding a call to kmsg_dump_rewind() to initialize
the iterator.

All this is in preparation for removal of @logbuf_lock.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
Reviewed-by: Kees Cook <keescook@chromium.org> # pstore
---
 arch/powerpc/kernel/nvram_64.c |  8 +++--
 arch/powerpc/xmon/xmon.c       |  6 ++--
 arch/um/kernel/kmsg_dump.c     |  5 ++-
 drivers/hv/vmbus_drv.c         |  4 ++-
 drivers/mtd/mtdoops.c          |  5 ++-
 fs/pstore/platform.c           |  5 ++-
 include/linux/kmsg_dump.h      | 36 ++++++++++---------
 kernel/debug/kdb/kdb_main.c    | 10 +++---
 kernel/printk/printk.c         | 63 +++++++++++++++++-----------------
 9 files changed, 80 insertions(+), 62 deletions(-)

diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index 532f22637783..3c8d9bbb51cf 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -647,6 +647,7 @@ static void oops_to_nvram(struct kmsg_dumper *dumper,
 {
 	struct oops_log_info *oops_hdr = (struct oops_log_info *)oops_buf;
 	static unsigned int oops_count = 0;
+	static struct kmsg_dump_iter iter;
 	static bool panicking = false;
 	static DEFINE_SPINLOCK(lock);
 	unsigned long flags;
@@ -681,13 +682,14 @@ static void oops_to_nvram(struct kmsg_dumper *dumper,
 		return;
 
 	if (big_oops_buf) {
-		kmsg_dump_get_buffer(dumper, false,
+		kmsg_dump_rewind(&iter);
+		kmsg_dump_get_buffer(&iter, false,
 				     big_oops_buf, big_oops_buf_sz, &text_len);
 		rc = zip_oops(text_len);
 	}
 	if (rc != 0) {
-		kmsg_dump_rewind(dumper);
-		kmsg_dump_get_buffer(dumper, false,
+		kmsg_dump_rewind(&iter);
+		kmsg_dump_get_buffer(&iter, false,
 				     oops_data, oops_data_sz, &text_len);
 		err_type = ERR_TYPE_KERNEL_PANIC;
 		oops_hdr->version = cpu_to_be16(OOPS_HDR_VERSION);
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 80ed3e1becf9..5978b90a885f 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3001,7 +3001,7 @@ print_address(unsigned long addr)
 static void
 dump_log_buf(void)
 {
-	struct kmsg_dumper dumper;
+	struct kmsg_dump_iter iter;
 	unsigned char buf[128];
 	size_t len;
 
@@ -3013,9 +3013,9 @@ dump_log_buf(void)
 	catch_memory_errors = 1;
 	sync();
 
-	kmsg_dump_rewind_nolock(&dumper);
+	kmsg_dump_rewind_nolock(&iter);
 	xmon_start_pagination();
-	while (kmsg_dump_get_line_nolock(&dumper, false, buf, sizeof(buf), &len)) {
+	while (kmsg_dump_get_line_nolock(&iter, false, buf, sizeof(buf), &len)) {
 		buf[len] = '\0';
 		printf("%s", buf);
 	}
diff --git a/arch/um/kernel/kmsg_dump.c b/arch/um/kernel/kmsg_dump.c
index a765d235e50e..0224fcb36e22 100644
--- a/arch/um/kernel/kmsg_dump.c
+++ b/arch/um/kernel/kmsg_dump.c
@@ -10,6 +10,7 @@
 static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
 				enum kmsg_dump_reason reason)
 {
+	static struct kmsg_dump_iter iter;
 	static DEFINE_SPINLOCK(lock);
 	static char line[1024];
 	struct console *con;
@@ -35,8 +36,10 @@ static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
 	if (!spin_trylock_irqsave(&lock, flags))
 		return;
 
+	kmsg_dump_rewind(&iter);
+
 	printf("kmsg_dump:\n");
-	while (kmsg_dump_get_line(dumper, true, line, sizeof(line), &len)) {
+	while (kmsg_dump_get_line(&iter, true, line, sizeof(line), &len)) {
 		line[len] = '\0';
 		printf("%s", line);
 	}
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 10dce9f91216..b341b144bde8 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -1391,6 +1391,7 @@ static void vmbus_isr(void)
 static void hv_kmsg_dump(struct kmsg_dumper *dumper,
 			 enum kmsg_dump_reason reason)
 {
+	struct kmsg_dump_iter iter;
 	size_t bytes_written;
 	phys_addr_t panic_pa;
 
@@ -1404,7 +1405,8 @@ static void hv_kmsg_dump(struct kmsg_dumper *dumper,
 	 * Write dump contents to the page. No need to synchronize; panic should
 	 * be single-threaded.
 	 */
-	kmsg_dump_get_buffer(dumper, false, hv_panic_page, HV_HYP_PAGE_SIZE,
+	kmsg_dump_rewind(&iter);
+	kmsg_dump_get_buffer(&iter, false, hv_panic_page, HV_HYP_PAGE_SIZE,
 			     &bytes_written);
 	if (bytes_written)
 		hyperv_report_panic_msg(panic_pa, bytes_written);
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 8bbfba40a554..862c4a889234 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -277,14 +277,17 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumper,
 {
 	struct mtdoops_context *cxt = container_of(dumper,
 			struct mtdoops_context, dump);
+	struct kmsg_dump_iter iter;
 
 	/* Only dump oopses if dump_oops is set */
 	if (reason == KMSG_DUMP_OOPS && !dump_oops)
 		return;
 
+	kmsg_dump_rewind(&iter);
+
 	if (test_and_set_bit(0, &cxt->oops_buf_busy))
 		return;
-	kmsg_dump_get_buffer(dumper, true, cxt->oops_buf + MTDOOPS_HEADER_SIZE,
+	kmsg_dump_get_buffer(&iter, true, cxt->oops_buf + MTDOOPS_HEADER_SIZE,
 			     record_size - MTDOOPS_HEADER_SIZE, NULL);
 	clear_bit(0, &cxt->oops_buf_busy);
 
diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index d963ae7902f9..b9614db48b1d 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -385,6 +385,7 @@ void pstore_record_init(struct pstore_record *record,
 static void pstore_dump(struct kmsg_dumper *dumper,
 			enum kmsg_dump_reason reason)
 {
+	struct kmsg_dump_iter iter;
 	unsigned long	total = 0;
 	const char	*why;
 	unsigned int	part = 1;
@@ -405,6 +406,8 @@ static void pstore_dump(struct kmsg_dumper *dumper,
 		}
 	}
 
+	kmsg_dump_rewind(&iter);
+
 	oopscount++;
 	while (total < kmsg_bytes) {
 		char *dst;
@@ -435,7 +438,7 @@ static void pstore_dump(struct kmsg_dumper *dumper,
 		dst_size -= header_size;
 
 		/* Write dump contents. */
-		if (!kmsg_dump_get_buffer(dumper, true, dst + header_size,
+		if (!kmsg_dump_get_buffer(&iter, true, dst + header_size,
 					  dst_size, &dump_size))
 			break;
 
diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 84eaa2090efa..36c8c57e1051 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -29,6 +29,16 @@ enum kmsg_dump_reason {
 	KMSG_DUMP_MAX
 };
 
+/**
+ * struct kmsg_dump_iter - iterator for retrieving kernel messages
+ * @cur_seq:	Points to the oldest message to dump
+ * @next_seq:	Points after the newest message to dump
+ */
+struct kmsg_dump_iter {
+	u64	cur_seq;
+	u64	next_seq;
+};
+
 /**
  * struct kmsg_dumper - kernel crash message dumper structure
  * @list:	Entry in the dumper list (private)
@@ -36,35 +46,29 @@ enum kmsg_dump_reason {
  * 		through the record iterator
  * @max_reason:	filter for highest reason number that should be dumped
  * @registered:	Flag that specifies if this is already registered
- * @cur_seq:	Points to the oldest message to dump
- * @next_seq:	Points after the newest message to dump
  */
 struct kmsg_dumper {
 	struct list_head list;
 	void (*dump)(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason);
 	enum kmsg_dump_reason max_reason;
 	bool registered;
-
-	/* private state of the kmsg iterator */
-	u64 cur_seq;
-	u64 next_seq;
 };
 
 #ifdef CONFIG_PRINTK
 void kmsg_dump(enum kmsg_dump_reason reason);
 
-bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper, bool syslog,
+bool kmsg_dump_get_line_nolock(struct kmsg_dump_iter *iter, bool syslog,
 			       char *line, size_t size, size_t *len);
 
-bool kmsg_dump_get_line(struct kmsg_dumper *dumper, bool syslog,
+bool kmsg_dump_get_line(struct kmsg_dump_iter *iter, bool syslog,
 			char *line, size_t size, size_t *len);
 
-bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
+bool kmsg_dump_get_buffer(struct kmsg_dump_iter *iter, bool syslog,
 			  char *buf, size_t size, size_t *len_out);
 
-void kmsg_dump_rewind_nolock(struct kmsg_dumper *dumper);
+void kmsg_dump_rewind_nolock(struct kmsg_dump_iter *iter);
 
-void kmsg_dump_rewind(struct kmsg_dumper *dumper);
+void kmsg_dump_rewind(struct kmsg_dump_iter *iter);
 
 int kmsg_dump_register(struct kmsg_dumper *dumper);
 
@@ -76,30 +80,30 @@ static inline void kmsg_dump(enum kmsg_dump_reason reason)
 {
 }
 
-static inline bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper,
+static inline bool kmsg_dump_get_line_nolock(struct kmsg_dump_iter *iter,
 					     bool syslog, const char *line,
 					     size_t size, size_t *len)
 {
 	return false;
 }
 
-static inline bool kmsg_dump_get_line(struct kmsg_dumper *dumper, bool syslog,
+static inline bool kmsg_dump_get_line(struct kmsg_dump_iter *iter, bool syslog,
 				const char *line, size_t size, size_t *len)
 {
 	return false;
 }
 
-static inline bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
+static inline bool kmsg_dump_get_buffer(struct kmsg_dump_iter *iter, bool syslog,
 					char *buf, size_t size, size_t *len)
 {
 	return false;
 }
 
-static inline void kmsg_dump_rewind_nolock(struct kmsg_dumper *dumper)
+static inline void kmsg_dump_rewind_nolock(struct kmsg_dump_iter *iter)
 {
 }
 
-static inline void kmsg_dump_rewind(struct kmsg_dumper *dumper)
+static inline void kmsg_dump_rewind(struct kmsg_dump_iter *iter)
 {
 }
 
diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 315169d5e119..8544d7a55a57 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -2101,7 +2101,7 @@ static int kdb_dmesg(int argc, const char **argv)
 	int adjust = 0;
 	int n = 0;
 	int skip = 0;
-	struct kmsg_dumper dumper;
+	struct kmsg_dump_iter iter;
 	size_t len;
 	char buf[201];
 
@@ -2126,8 +2126,8 @@ static int kdb_dmesg(int argc, const char **argv)
 		kdb_set(2, setargs);
 	}
 
-	kmsg_dump_rewind_nolock(&dumper);
-	while (kmsg_dump_get_line_nolock(&dumper, 1, NULL, 0, NULL))
+	kmsg_dump_rewind_nolock(&iter);
+	while (kmsg_dump_get_line_nolock(&iter, 1, NULL, 0, NULL))
 		n++;
 
 	if (lines < 0) {
@@ -2159,8 +2159,8 @@ static int kdb_dmesg(int argc, const char **argv)
 	if (skip >= n || skip < 0)
 		return 0;
 
-	kmsg_dump_rewind_nolock(&dumper);
-	while (kmsg_dump_get_line_nolock(&dumper, 1, buf, sizeof(buf), &len)) {
+	kmsg_dump_rewind_nolock(&iter);
+	while (kmsg_dump_get_line_nolock(&iter, 1, buf, sizeof(buf), &len)) {
 		if (skip) {
 			skip--;
 			continue;
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index ce4cc64ba7c9..b49dee256947 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3390,7 +3390,6 @@ EXPORT_SYMBOL_GPL(kmsg_dump_reason_str);
 void kmsg_dump(enum kmsg_dump_reason reason)
 {
 	struct kmsg_dumper *dumper;
-	unsigned long flags;
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(dumper, &dump_list, list) {
@@ -3407,12 +3406,6 @@ void kmsg_dump(enum kmsg_dump_reason reason)
 		if (reason > max_reason)
 			continue;
 
-		/* initialize iterator with data about the stored records */
-		logbuf_lock_irqsave(flags);
-		dumper->cur_seq = latched_seq_read_nolock(&clear_seq);
-		dumper->next_seq = prb_next_seq(prb);
-		logbuf_unlock_irqrestore(flags);
-
 		/* invoke dumper which will iterate over records */
 		dumper->dump(dumper, reason);
 	}
@@ -3421,7 +3414,7 @@ void kmsg_dump(enum kmsg_dump_reason reason)
 
 /**
  * kmsg_dump_get_line_nolock - retrieve one kmsg log line (unlocked version)
- * @dumper: registered kmsg dumper
+ * @iter: kmsg dump iterator
  * @syslog: include the "<4>" prefixes
  * @line: buffer to copy the line to
  * @size: maximum size of the buffer
@@ -3438,24 +3431,28 @@ void kmsg_dump(enum kmsg_dump_reason reason)
  *
  * The function is similar to kmsg_dump_get_line(), but grabs no locks.
  */
-bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper, bool syslog,
+bool kmsg_dump_get_line_nolock(struct kmsg_dump_iter *iter, bool syslog,
 			       char *line, size_t size, size_t *len)
 {
+	u64 min_seq = latched_seq_read_nolock(&clear_seq);
 	struct printk_info info;
 	unsigned int line_count;
 	struct printk_record r;
 	size_t l = 0;
 	bool ret = false;
 
+	if (iter->cur_seq < min_seq)
+		iter->cur_seq = min_seq;
+
 	prb_rec_init_rd(&r, &info, line, size);
 
 	/* Read text or count text lines? */
 	if (line) {
-		if (!prb_read_valid(prb, dumper->cur_seq, &r))
+		if (!prb_read_valid(prb, iter->cur_seq, &r))
 			goto out;
 		l = record_print_text(&r, syslog, printk_time);
 	} else {
-		if (!prb_read_valid_info(prb, dumper->cur_seq,
+		if (!prb_read_valid_info(prb, iter->cur_seq,
 					 &info, &line_count)) {
 			goto out;
 		}
@@ -3464,7 +3461,7 @@ bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper, bool syslog,
 
 	}
 
-	dumper->cur_seq = r.info->seq + 1;
+	iter->cur_seq = r.info->seq + 1;
 	ret = true;
 out:
 	if (len)
@@ -3474,7 +3471,7 @@ bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper, bool syslog,
 
 /**
  * kmsg_dump_get_line - retrieve one kmsg log line
- * @dumper: registered kmsg dumper
+ * @iter: kmsg dump iterator
  * @syslog: include the "<4>" prefixes
  * @line: buffer to copy the line to
  * @size: maximum size of the buffer
@@ -3489,14 +3486,14 @@ bool kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper, bool syslog,
  * A return value of FALSE indicates that there are no more records to
  * read.
  */
-bool kmsg_dump_get_line(struct kmsg_dumper *dumper, bool syslog,
+bool kmsg_dump_get_line(struct kmsg_dump_iter *iter, bool syslog,
 			char *line, size_t size, size_t *len)
 {
 	unsigned long flags;
 	bool ret;
 
 	logbuf_lock_irqsave(flags);
-	ret = kmsg_dump_get_line_nolock(dumper, syslog, line, size, len);
+	ret = kmsg_dump_get_line_nolock(iter, syslog, line, size, len);
 	logbuf_unlock_irqrestore(flags);
 
 	return ret;
@@ -3505,7 +3502,7 @@ EXPORT_SYMBOL_GPL(kmsg_dump_get_line);
 
 /**
  * kmsg_dump_get_buffer - copy kmsg log lines
- * @dumper: registered kmsg dumper
+ * @iter: kmsg dump iterator
  * @syslog: include the "<4>" prefixes
  * @buf: buffer to copy the line to
  * @size: maximum size of the buffer
@@ -3522,9 +3519,10 @@ EXPORT_SYMBOL_GPL(kmsg_dump_get_line);
  * A return value of FALSE indicates that there are no more records to
  * read.
  */
-bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
+bool kmsg_dump_get_buffer(struct kmsg_dump_iter *iter, bool syslog,
 			  char *buf, size_t size, size_t *len_out)
 {
+	u64 min_seq = latched_seq_read_nolock(&clear_seq);
 	struct printk_info info;
 	struct printk_record r;
 	unsigned long flags;
@@ -3537,16 +3535,19 @@ bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
 	if (!buf || !size)
 		goto out;
 
+	if (iter->cur_seq < min_seq)
+		iter->cur_seq = min_seq;
+
 	logbuf_lock_irqsave(flags);
-	if (prb_read_valid_info(prb, dumper->cur_seq, &info, NULL)) {
-		if (info.seq != dumper->cur_seq) {
+	if (prb_read_valid_info(prb, iter->cur_seq, &info, NULL)) {
+		if (info.seq != iter->cur_seq) {
 			/* messages are gone, move to first available one */
-			dumper->cur_seq = info.seq;
+			iter->cur_seq = info.seq;
 		}
 	}
 
 	/* last entry */
-	if (dumper->cur_seq >= dumper->next_seq) {
+	if (iter->cur_seq >= iter->next_seq) {
 		logbuf_unlock_irqrestore(flags);
 		goto out;
 	}
@@ -3557,7 +3558,7 @@ bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
 	 * because this function (by way of record_print_text()) will
 	 * not write more than size-1 bytes of text into @buf.
 	 */
-	seq = find_first_fitting_seq(dumper->cur_seq, dumper->next_seq,
+	seq = find_first_fitting_seq(iter->cur_seq, iter->next_seq,
 				     size - 1, syslog, time);
 
 	/*
@@ -3570,7 +3571,7 @@ bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
 
 	len = 0;
 	prb_for_each_record(seq, prb, seq, &r) {
-		if (r.info->seq >= dumper->next_seq)
+		if (r.info->seq >= iter->next_seq)
 			break;
 
 		len += record_print_text(&r, syslog, time);
@@ -3579,7 +3580,7 @@ bool kmsg_dump_get_buffer(struct kmsg_dumper *dumper, bool syslog,
 		prb_rec_init_rd(&r, &info, buf + len, size - len);
 	}
 
-	dumper->next_seq = next_seq;
+	iter->next_seq = next_seq;
 	ret = true;
 	logbuf_unlock_irqrestore(flags);
 out:
@@ -3591,7 +3592,7 @@ EXPORT_SYMBOL_GPL(kmsg_dump_get_buffer);
 
 /**
  * kmsg_dump_rewind_nolock - reset the iterator (unlocked version)
- * @dumper: registered kmsg dumper
+ * @iter: kmsg dump iterator
  *
  * Reset the dumper's iterator so that kmsg_dump_get_line() and
  * kmsg_dump_get_buffer() can be called again and used multiple
@@ -3599,26 +3600,26 @@ EXPORT_SYMBOL_GPL(kmsg_dump_get_buffer);
  *
  * The function is similar to kmsg_dump_rewind(), but grabs no locks.
  */
-void kmsg_dump_rewind_nolock(struct kmsg_dumper *dumper)
+void kmsg_dump_rewind_nolock(struct kmsg_dump_iter *iter)
 {
-	dumper->cur_seq = latched_seq_read_nolock(&clear_seq);
-	dumper->next_seq = prb_next_seq(prb);
+	iter->cur_seq = latched_seq_read_nolock(&clear_seq);
+	iter->next_seq = prb_next_seq(prb);
 }
 
 /**
  * kmsg_dump_rewind - reset the iterator
- * @dumper: registered kmsg dumper
+ * @iter: kmsg dump iterator
  *
  * Reset the dumper's iterator so that kmsg_dump_get_line() and
  * kmsg_dump_get_buffer() can be called again and used multiple
  * times within the same dumper.dump() callback.
  */
-void kmsg_dump_rewind(struct kmsg_dumper *dumper)
+void kmsg_dump_rewind(struct kmsg_dump_iter *iter)
 {
 	unsigned long flags;
 
 	logbuf_lock_irqsave(flags);
-	kmsg_dump_rewind_nolock(dumper);
+	kmsg_dump_rewind_nolock(iter);
 	logbuf_unlock_irqrestore(flags);
 }
 EXPORT_SYMBOL_GPL(kmsg_dump_rewind);
-- 
2.20.1

