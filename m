Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8B23EFF13
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 10:22:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqLW12hyhz3dHW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 18:22:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132;
 helo=out30-132.freemail.mail.aliyun.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqLTj5scvz3bSn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 18:21:42 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Ujfv4hx_1629274885; 
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0Ujfv4hx_1629274885) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 18 Aug 2021 16:21:26 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, amit@kernel.org,
 arnd@arndb.de, osandov@fb.com
Subject: [PATCH v8 2/3] tty: hvc: pass DMA capable memory to put_chars()
Date: Wed, 18 Aug 2021 16:21:21 +0800
Message-Id: <20210818082122.166881-3-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818082122.166881-1-xianting.tian@linux.alibaba.com>
References: <20210818082122.166881-1-xianting.tian@linux.alibaba.com>
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
Cc: Xianting Tian <xianting.tian@linux.alibaba.com>,
 shile.zhang@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As well known, hvc backend driver(eg, virtio-console) can register its
operations to hvc framework. The operations can contain put_chars(),
get_chars() and so on.

Some hvc backend may do dma in its operations. eg, put_chars() of
virtio-console. But in the code of hvc framework, it may pass DMA
incapable memory to put_chars() under a specific configuration, which
is explained in commit c4baad5029(virtio-console: avoid DMA from stack):
1, c[] is on stack,
   hvc_console_print():
	char c[N_OUTBUF] __ALIGNED__;
	cons_ops[index]->put_chars(vtermnos[index], c, i);
2, ch is on stack,
   static void hvc_poll_put_char(,,char ch)
   {
	struct tty_struct *tty = driver->ttys[0];
	struct hvc_struct *hp = tty->driver_data;
	int n;

	do {
		n = hp->ops->put_chars(hp->vtermno, &ch, 1);
	} while (n <= 0);
   }

Commit c4baad5029 is just the fix to avoid DMA from stack memory, which
is passed to virtio-console by hvc framework in above code. But I think
the fix is aggressive, it directly uses kmemdup() to alloc new buffer
from kmalloc area and do memcpy no matter the memory is in kmalloc area
or not. But most importantly, it should better be fixed in the hvc
framework, by changing it to never pass stack memory to the put_chars()
function in the first place. Otherwise, we still face the same issue if
a new hvc backend using dma added in the future.

In this patch, we make 'char out_buf[N_OUTBUF]' and 'chat out_ch' part
of 'struct hvc_struct', so both two buf are no longer the stack memory.
we can use it in above two cases separately.

Introduce another array(cons_outbufs[]) for buffer pointers next to
the cons_ops[] and vtermnos[] arrays. With the array, we can easily find
the buffer, instead of traversing hp list.

With the patch, we can remove the fix c4baad5029.

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
Reviewed-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 drivers/tty/hvc/hvc_console.c | 27 ++++++++++++---------------
 drivers/tty/hvc/hvc_console.h | 16 ++++++++++++++--
 2 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index 5bb8c4e44..300e9c037 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -41,16 +41,6 @@
  */
 #define HVC_CLOSE_WAIT (HZ/100) /* 1/10 of a second */
 
-/*
- * These sizes are most efficient for vio, because they are the
- * native transfer size. We could make them selectable in the
- * future to better deal with backends that want other buffer sizes.
- */
-#define N_OUTBUF	16
-#define N_INBUF		16
-
-#define __ALIGNED__ __attribute__((__aligned__(L1_CACHE_BYTES)))
-
 static struct tty_driver *hvc_driver;
 static struct task_struct *hvc_task;
 
@@ -142,6 +132,7 @@ static int hvc_flush(struct hvc_struct *hp)
 static const struct hv_ops *cons_ops[MAX_NR_HVC_CONSOLES];
 static uint32_t vtermnos[MAX_NR_HVC_CONSOLES] =
 	{[0 ... MAX_NR_HVC_CONSOLES - 1] = -1};
+static char *cons_outbufs[MAX_NR_HVC_CONSOLES];
 
 /*
  * Console APIs, NOT TTY.  These APIs are available immediately when
@@ -151,7 +142,7 @@ static uint32_t vtermnos[MAX_NR_HVC_CONSOLES] =
 static void hvc_console_print(struct console *co, const char *b,
 			      unsigned count)
 {
-	char c[N_OUTBUF] __ALIGNED__;
+	char *c;
 	unsigned i = 0, n = 0;
 	int r, donecr = 0, index = co->index;
 
@@ -163,6 +154,10 @@ static void hvc_console_print(struct console *co, const char *b,
 	if (vtermnos[index] == -1)
 		return;
 
+	c = cons_outbufs[index];
+	if (!c)
+		return;
+
 	while (count > 0 || i > 0) {
 		if (count > 0 && i < sizeof(c)) {
 			if (b[n] == '\n' && !donecr) {
@@ -879,8 +874,10 @@ static void hvc_poll_put_char(struct tty_driver *driver, int line, char ch)
 	struct hvc_struct *hp = tty->driver_data;
 	int n;
 
+	hp->out_ch = ch;
+
 	do {
-		n = hp->ops->put_chars(hp->vtermno, &ch, 1);
+		n = hp->ops->put_chars(hp->vtermno, hp->out_ch, 1);
 	} while (n <= 0);
 }
 #endif
@@ -922,8 +919,7 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int data,
 			return ERR_PTR(err);
 	}
 
-	hp = kzalloc(ALIGN(sizeof(*hp), sizeof(long)) + outbuf_size,
-			GFP_KERNEL);
+	hp = kzalloc(struct_size(hp, outbuf, outbuf_size), GFP_KERNEL);
 	if (!hp)
 		return ERR_PTR(-ENOMEM);
 
@@ -931,7 +927,6 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int data,
 	hp->data = data;
 	hp->ops = ops;
 	hp->outbuf_size = outbuf_size;
-	hp->outbuf = &((char *)hp)[ALIGN(sizeof(*hp), sizeof(long))];
 
 	tty_port_init(&hp->port);
 	hp->port.ops = &hvc_port_ops;
@@ -964,6 +959,7 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int data,
 	if (i < MAX_NR_HVC_CONSOLES) {
 		cons_ops[i] = ops;
 		vtermnos[i] = vtermno;
+		cons_outbufs[i] = hp->out_buf;
 	}
 
 	list_add_tail(&(hp->next), &hvc_structs);
@@ -988,6 +984,7 @@ int hvc_remove(struct hvc_struct *hp)
 	if (hp->index < MAX_NR_HVC_CONSOLES) {
 		vtermnos[hp->index] = -1;
 		cons_ops[hp->index] = NULL;
+		cons_outbufs[hp->index] = NULL;
 	}
 
 	/* Don't whack hp->irq because tty_hangup() will need to free the irq. */
diff --git a/drivers/tty/hvc/hvc_console.h b/drivers/tty/hvc/hvc_console.h
index 18d005814..b94576d55 100644
--- a/drivers/tty/hvc/hvc_console.h
+++ b/drivers/tty/hvc/hvc_console.h
@@ -32,13 +32,21 @@
  */
 #define HVC_ALLOC_TTY_ADAPTERS	8
 
+/*
+ * These sizes are most efficient for vio, because they are the
+ * native transfer size. We could make them selectable in the
+ * future to better deal with backends that want other buffer sizes.
+ */
+#define N_OUTBUF	16
+#define N_INBUF		16
+
+#define __ALIGNED__ __attribute__((__aligned__(L1_CACHE_BYTES)))
+
 struct hvc_struct {
 	struct tty_port port;
 	spinlock_t lock;
 	int index;
 	int do_wakeup;
-	char *outbuf;
-	int outbuf_size;
 	int n_outbuf;
 	uint32_t vtermno;
 	const struct hv_ops *ops;
@@ -48,6 +56,10 @@ struct hvc_struct {
 	struct work_struct tty_resize;
 	struct list_head next;
 	unsigned long flags;
+	char out_ch;
+	char out_buf[N_OUTBUF] __ALIGNED__;
+	int outbuf_size;
+	char outbuf[0] __ALIGNED__;
 };
 
 /* implemented by a low level driver */
-- 
2.17.1

