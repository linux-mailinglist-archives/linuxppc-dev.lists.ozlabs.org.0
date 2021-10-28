Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC4A43E4A6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 17:10:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg8Bd4Pk3z3cHC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 02:10:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.54;
 helo=out30-54.freemail.mail.aliyun.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg8B768y2z2xWd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 02:10:04 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0Uu17z-i_1635433796; 
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0Uu17z-i_1635433796) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 28 Oct 2021 23:09:57 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, amit@kernel.org,
 arnd@arndb.de, osandov@fb.com
Subject: [PATCH v12 1/2] tty: hvc: pass DMA capable memory to put_chars()
Date: Thu, 28 Oct 2021 23:09:53 +0800
Message-Id: <20211028150954.1356334-2-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211028150954.1356334-1-xianting.tian@linux.alibaba.com>
References: <20211028150954.1356334-1-xianting.tian@linux.alibaba.com>
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
Cc: sfr@canb.auug.org.au, Xianting Tian <xianting.tian@linux.alibaba.com>,
 shile.zhang@linux.alibaba.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As well known, hvc backend can register its opertions to hvc backend.
the operations contain put_chars(), get_chars() and so on.

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
a new hvc backend using dma added in the furture.

In this patch, add 'char cons_outbuf[]' as part of 'struct hvc_struct',
so hp->cons_outbuf is no longer the stack memory, we can use it in above
cases safely. We also add lock to protect cons_outbuf instead of using
the global lock of hvc.

Introduce array cons_hvcs[] for hvc pointers next to the cons_ops[] and
vtermnos[] arrays. With the array, we can easily find hvc's cons_outbuf
and its lock.

Introduce array cons_early_outbuf[] to ensure the mechanism of early
console still work normally.

With the patch, we can revert the fix c4baad5029.

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
Reviewed-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 drivers/tty/hvc/hvc_console.c | 55 +++++++++++++++++++++++++----------
 drivers/tty/hvc/hvc_console.h | 30 ++++++++++++++++++-
 2 files changed, 69 insertions(+), 16 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index 5957ab728..b9521f0f0 100644
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
 
@@ -142,6 +132,8 @@ static int hvc_flush(struct hvc_struct *hp)
 static const struct hv_ops *cons_ops[MAX_NR_HVC_CONSOLES];
 static uint32_t vtermnos[MAX_NR_HVC_CONSOLES] =
 	{[0 ... MAX_NR_HVC_CONSOLES - 1] = -1};
+static struct hvc_struct *cons_hvcs[MAX_NR_HVC_CONSOLES];
+static struct hvc_early_outbuf *cons_early_outbufs[MAX_NR_HVC_CONSOLES];
 
 /*
  * Console APIs, NOT TTY.  These APIs are available immediately when
@@ -151,9 +143,12 @@ static uint32_t vtermnos[MAX_NR_HVC_CONSOLES] =
 static void hvc_console_print(struct console *co, const char *b,
 			      unsigned count)
 {
-	char c[N_OUTBUF] __ALIGNED__;
+	char *c;
 	unsigned i = 0, n = 0;
 	int r, donecr = 0, index = co->index;
+	unsigned long flags;
+	struct hvc_struct *hp;
+	spinlock_t *lock;
 
 	/* Console access attempt outside of acceptable console range. */
 	if (index >= MAX_NR_HVC_CONSOLES)
@@ -163,6 +158,27 @@ static void hvc_console_print(struct console *co, const char *b,
 	if (vtermnos[index] == -1)
 		return;
 
+	hp = cons_hvcs[index];
+	if (hp) {
+		c = hp->cons_outbuf;
+		lock = &hp->cons_outbuf_lock;
+
+		/*
+		 * To make free early console outbuf locklessly,
+		 * free it here when we start to use hp's outbuf.
+		 * The actual free action is executed only once.
+		 */
+		if (cons_early_outbufs[index]) {
+			kfree(cons_early_outbufs[index]);
+			cons_early_outbufs[index] = NULL;
+		}
+	} else {
+		/* For early console print */
+		c = cons_early_outbufs[index]->outbuf;
+		lock = &cons_early_outbufs[index]->lock;
+	}
+
+	spin_lock_irqsave(lock, flags);
 	while (count > 0 || i > 0) {
 		if (count > 0 && i < sizeof(c)) {
 			if (b[n] == '\n' && !donecr) {
@@ -191,6 +207,7 @@ static void hvc_console_print(struct console *co, const char *b,
 			}
 		}
 	}
+	spin_unlock_irqrestore(lock, flags);
 	hvc_console_flush(cons_ops[index], vtermnos[index]);
 }
 
@@ -299,6 +316,9 @@ int hvc_instantiate(uint32_t vtermno, int index, const struct hv_ops *ops)
 		return -1;
 	}
 
+	cons_early_outbufs[index] = kzalloc(sizeof(struct hvc_early_outbuf),
+					    GFP_KERNEL);
+	spin_lock_init(&cons_early_outbufs[index]->lock);
 	vtermnos[index] = vtermno;
 	cons_ops[index] = ops;
 
@@ -878,9 +898,13 @@ static void hvc_poll_put_char(struct tty_driver *driver, int line, char ch)
 	struct tty_struct *tty = driver->ttys[0];
 	struct hvc_struct *hp = tty->driver_data;
 	int n;
+	unsigned long flags;
 
 	do {
-		n = hp->ops->put_chars(hp->vtermno, &ch, 1);
+		spin_lock_irqsave(&hp->cons_outbuf_lock, flags);
+		hp->cons_outbuf[0] = ch;
+		n = hp->ops->put_chars(hp->vtermno, &hp->cons_outbuf[0], 1);
+		spin_unlock_irqrestore(&hp->cons_outbuf_lock, flags);
 	} while (n <= 0);
 }
 #endif
@@ -922,8 +946,7 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int data,
 			return ERR_PTR(err);
 	}
 
-	hp = kzalloc(ALIGN(sizeof(*hp), sizeof(long)) + outbuf_size,
-			GFP_KERNEL);
+	hp = kzalloc(struct_size(hp, outbuf, outbuf_size), GFP_KERNEL);
 	if (!hp)
 		return ERR_PTR(-ENOMEM);
 
@@ -931,13 +954,13 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int data,
 	hp->data = data;
 	hp->ops = ops;
 	hp->outbuf_size = outbuf_size;
-	hp->outbuf = &((char *)hp)[ALIGN(sizeof(*hp), sizeof(long))];
 
 	tty_port_init(&hp->port);
 	hp->port.ops = &hvc_port_ops;
 
 	INIT_WORK(&hp->tty_resize, hvc_set_winsz);
 	spin_lock_init(&hp->lock);
+	spin_lock_init(&hp->cons_outbuf_lock);
 	mutex_lock(&hvc_structs_mutex);
 
 	/*
@@ -964,6 +987,7 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int data,
 	if (i < MAX_NR_HVC_CONSOLES) {
 		cons_ops[i] = ops;
 		vtermnos[i] = vtermno;
+		cons_hvcs[i] = hp;
 	}
 
 	list_add_tail(&(hp->next), &hvc_structs);
@@ -988,6 +1012,7 @@ int hvc_remove(struct hvc_struct *hp)
 	if (hp->index < MAX_NR_HVC_CONSOLES) {
 		vtermnos[hp->index] = -1;
 		cons_ops[hp->index] = NULL;
+		cons_hvcs[hp->index] = NULL;
 	}
 
 	/* Don't whack hp->irq because tty_hangup() will need to free the irq. */
diff --git a/drivers/tty/hvc/hvc_console.h b/drivers/tty/hvc/hvc_console.h
index 18d005814..3a9fe9275 100644
--- a/drivers/tty/hvc/hvc_console.h
+++ b/drivers/tty/hvc/hvc_console.h
@@ -32,12 +32,30 @@
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
+/*
+ * This is for early console print when hvc backend calls
+ * hvc_instantiate() to create an early console.
+ */
+struct hvc_early_outbuf {
+	spinlock_t lock;
+	char outbuf[N_OUTBUF] __ALIGNED__;
+};
+
 struct hvc_struct {
 	struct tty_port port;
 	spinlock_t lock;
 	int index;
 	int do_wakeup;
-	char *outbuf;
 	int outbuf_size;
 	int n_outbuf;
 	uint32_t vtermno;
@@ -48,6 +66,16 @@ struct hvc_struct {
 	struct work_struct tty_resize;
 	struct list_head next;
 	unsigned long flags;
+
+	/*
+	 * the buf and its lock are used in hvc console api for putting chars,
+	 * and also used in hvc_poll_put_char() for putting single char.
+	 */
+	spinlock_t cons_outbuf_lock;
+	char cons_outbuf[N_OUTBUF] __ALIGNED__;
+
+	/* the buf is used for putting chars to tty */
+	char outbuf[] __ALIGNED__;
 };
 
 /* implemented by a low level driver */
-- 
2.17.1

