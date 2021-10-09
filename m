Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FECD42799B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 13:50:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRNfP0RGNz3cZL
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 22:50:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRNcl49RGz3c65
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 22:48:54 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Ur6jeoE_1633780115; 
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0Ur6jeoE_1633780115) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 09 Oct 2021 19:48:36 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org, amit@kernel.org,
 arnd@arndb.de, osandov@fb.com
Subject: [PATCH v10 2/3] tty: hvc: pass DMA capable memory to put_chars()
Date: Sat,  9 Oct 2021 19:48:28 +0800
Message-Id: <20211009114829.1071021-3-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211009114829.1071021-1-xianting.tian@linux.alibaba.com>
References: <20211009114829.1071021-1-xianting.tian@linux.alibaba.com>
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
case 1. Add 'char outchar' as part of 'struct hvc_struct', we can use it
in above case 2. We also add lock for each above buf to protect them
separately instead of using the global lock of hvc.

Introduce another array(cons_hvcs[]) for hvc pointers next to the
cons_ops[] and vtermnos[] arrays. With the array, we can easily find
hvc's cons_outbuf and its lock.

With the patch, we can revert the fix c4baad5029.

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 drivers/tty/hvc/hvc_console.c | 37 +++++++++++++++++++++--------------
 drivers/tty/hvc/hvc_console.h | 24 +++++++++++++++++++++--
 2 files changed, 44 insertions(+), 17 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index 5bb8c4e44..4d8f112f2 100644
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
-#define __ALIGNED__ __attribute__((__aligned__(sizeof(long))))
-
 static struct tty_driver *hvc_driver;
 static struct task_struct *hvc_task;
 
@@ -142,6 +132,7 @@ static int hvc_flush(struct hvc_struct *hp)
 static const struct hv_ops *cons_ops[MAX_NR_HVC_CONSOLES];
 static uint32_t vtermnos[MAX_NR_HVC_CONSOLES] =
 	{[0 ... MAX_NR_HVC_CONSOLES - 1] = -1};
+static struct hvc_struct *cons_hvcs[MAX_NR_HVC_CONSOLES];
 
 /*
  * Console APIs, NOT TTY.  These APIs are available immediately when
@@ -151,9 +142,11 @@ static uint32_t vtermnos[MAX_NR_HVC_CONSOLES] =
 static void hvc_console_print(struct console *co, const char *b,
 			      unsigned count)
 {
-	char c[N_OUTBUF] __ALIGNED__;
+	char *c;
 	unsigned i = 0, n = 0;
 	int r, donecr = 0, index = co->index;
+	unsigned long flags;
+	struct hvc_struct *hp;
 
 	/* Console access attempt outside of acceptable console range. */
 	if (index >= MAX_NR_HVC_CONSOLES)
@@ -163,6 +156,13 @@ static void hvc_console_print(struct console *co, const char *b,
 	if (vtermnos[index] == -1)
 		return;
 
+	hp = cons_hvcs[index];
+	if (!hp)
+		return;
+
+	c = hp->cons_outbuf;
+
+	spin_lock_irqsave(&hp->cons_outbuf_lock, flags);
 	while (count > 0 || i > 0) {
 		if (count > 0 && i < sizeof(c)) {
 			if (b[n] == '\n' && !donecr) {
@@ -191,6 +191,7 @@ static void hvc_console_print(struct console *co, const char *b,
 			}
 		}
 	}
+	spin_unlock_irqrestore(&hp->cons_outbuf_lock, flags);
 	hvc_console_flush(cons_ops[index], vtermnos[index]);
 }
 
@@ -878,9 +879,13 @@ static void hvc_poll_put_char(struct tty_driver *driver, int line, char ch)
 	struct tty_struct *tty = driver->ttys[0];
 	struct hvc_struct *hp = tty->driver_data;
 	int n;
+	unsigned long flags;
 
 	do {
-		n = hp->ops->put_chars(hp->vtermno, &ch, 1);
+		spin_lock_irqsave(&hp->outchar_lock, flags);
+		hp->outchar = ch;
+		n = hp->ops->put_chars(hp->vtermno, hp->outchar, 1);
+		spin_unlock_irqrestore(&hp->outchar_lock, flags);
 	} while (n <= 0);
 }
 #endif
@@ -922,8 +927,7 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int data,
 			return ERR_PTR(err);
 	}
 
-	hp = kzalloc(ALIGN(sizeof(*hp), sizeof(long)) + outbuf_size,
-			GFP_KERNEL);
+	hp = kzalloc(struct_size(hp, outbuf, outbuf_size), GFP_KERNEL);
 	if (!hp)
 		return ERR_PTR(-ENOMEM);
 
@@ -931,13 +935,14 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int data,
 	hp->data = data;
 	hp->ops = ops;
 	hp->outbuf_size = outbuf_size;
-	hp->outbuf = &((char *)hp)[ALIGN(sizeof(*hp), sizeof(long))];
 
 	tty_port_init(&hp->port);
 	hp->port.ops = &hvc_port_ops;
 
 	INIT_WORK(&hp->tty_resize, hvc_set_winsz);
 	spin_lock_init(&hp->lock);
+	spin_lock_init(&hp->outchar_lock);
+	spin_lock_init(&hp->cons_outbuf_lock);
 	mutex_lock(&hvc_structs_mutex);
 
 	/*
@@ -964,6 +969,7 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int data,
 	if (i < MAX_NR_HVC_CONSOLES) {
 		cons_ops[i] = ops;
 		vtermnos[i] = vtermno;
+		cons_hvcs[i] = hp;
 	}
 
 	list_add_tail(&(hp->next), &hvc_structs);
@@ -988,6 +994,7 @@ int hvc_remove(struct hvc_struct *hp)
 	if (hp->index < MAX_NR_HVC_CONSOLES) {
 		vtermnos[hp->index] = -1;
 		cons_ops[hp->index] = NULL;
+		cons_hvcs[hp->index] = NULL;
 	}
 
 	/* Don't whack hp->irq because tty_hangup() will need to free the irq. */
diff --git a/drivers/tty/hvc/hvc_console.h b/drivers/tty/hvc/hvc_console.h
index 18d005814..98f0ced83 100644
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
+#define __ALIGNED__ __attribute__((__aligned__(sizeof(long))))
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
@@ -48,6 +56,18 @@ struct hvc_struct {
 	struct work_struct tty_resize;
 	struct list_head next;
 	unsigned long flags;
+
+	/* the buf is used in hvc console api for putting chars */
+	char cons_outbuf[N_OUTBUF] __ALIGNED__;
+	spinlock_t cons_outbuf_lock;
+
+	/* the buf is for putting single char to tty */
+	char outchar;
+	spinlock_t outchar_lock;
+
+	/* the buf is for putting chars to tty */
+	int outbuf_size;
+	char outbuf[0] __ALIGNED__;
 };
 
 /* implemented by a low level driver */
-- 
2.17.1

