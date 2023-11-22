Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9551C7F4D6B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 17:52:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fcF4pxKR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb6jq6vHKz3vns
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 03:52:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fcF4pxKR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb1LC0Bsfz3cb6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 23:50:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3FAD61DBA;
	Wed, 22 Nov 2023 12:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467BDC433CB;
	Wed, 22 Nov 2023 12:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700657408;
	bh=aU2J72Xp3JKGs0IOk/3BX7BmnbVjjSktFzc5W0fL98s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fcF4pxKRziGSAF2FOqxImPOzC2PEVz+iXrlHdDaPyM6/v6o+f16jjdAN+lC2pUX0Z
	 c6Vj4pEReJ7qSGBsgd/Etcb/Bx/NFbs8vsXFZDe0htqh1OD5+o81eDXmshIPtuoyBK
	 lUfl8SFejNcIDe347vDzewRE22FCt1MWsk2CM4stuQE/3LK9tJj9skrI0zg5sl10Ot
	 aC+S7ghlxwZ2rYR03/mACnTcLYZ3VnGDGFga1iJsrVdoW+9CIorT0HYAGwO2anWZen
	 uIJ0oJqCh8DfwGg5lQlRhQShmsIUNUkRjdY2uwh1ov0dsfb3jgNLqtI1PY54/gVbLF
	 del/29joBTz5A==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 22 Nov 2023 13:48:25 +0100
Subject: [PATCH v2 4/4] eventfd: make eventfd_signal{_mask}() void
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-vfs-eventfd-signal-v2-4-bd549b14ce0c@kernel.org>
References: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
In-Reply-To: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
To: linux-fsdevel@vger.kernel.org
X-Mailer: b4 0.13-dev-26615
X-Developer-Signature: v=1; a=openpgp-sha256; l=3854; i=brauner@kernel.org;
 h=from:subject:message-id; bh=aU2J72Xp3JKGs0IOk/3BX7BmnbVjjSktFzc5W0fL98s=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaTG/lj73/5dRNiNYIfwQ9VnNb8kSHjtMQlc94/11mwNB
 qlLZUUiHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABP5zcjwh+t1UN76vf945tSW
 T/rxjCHQpq4w94r2Zqm/ATIn/7GqSjMyvH01XYi3/rDPbk7Hf182bChuXbCzsfD2+Wr+47+PXN/
 CxAMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Mailman-Approved-At: Thu, 23 Nov 2023 03:46:57 +1100
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
Cc: linux-aio@kvack.org, linux-usb@vger.kernel.org, Jan Kara <jack@suse.cz>, Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>, Paolo Bonzini <pbonzini@redhat.com>, Jens Axboe <axboe@kernel.dk>, Vineeth Vijayan <vneethv@linux.ibm.com>, Diana Craciun <diana.craciun@oss.nxp.com>, netdev@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Christoph Hellwig <hch@lst.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shakeel Butt <shakeelb@google.com>, Vasily Gorbik <gor@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>, Harald Freudenberger <freude@linux.ibm.com>, Fei Li <fei1.li@intel.com>, x86@kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe
  <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, intel-gfx@lists.freedesktop.org, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org, Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org, Zhenyu Wang <zhenyuw@linux.intel.com>, Eric Auger <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, Moritz Fischer <mdf@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, kvm@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org, io-uring@vger.kernel.org, Tony Krowiak <akrowiak@linux.ibm
 .com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Christian Brauner <brauner@kernel.org>, Pavel Begunkov <asml.silence@gmail.com>, Sean Christopherson <seanjc@google.com>, Oded Gabbay <ogabbay@kernel.org>, Muchun Song <muchun.song@linux.dev>, Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>, "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>, Daniel Vetter <daniel@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frederic Barrat <fbarrat@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No caller care about the return value.

Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 fs/eventfd.c            | 40 +++++++++++++++-------------------------
 include/linux/eventfd.h | 16 +++++++---------
 2 files changed, 22 insertions(+), 34 deletions(-)

diff --git a/fs/eventfd.c b/fs/eventfd.c
index a9a6de920fb4..13be2fb7fc96 100644
--- a/fs/eventfd.c
+++ b/fs/eventfd.c
@@ -43,10 +43,19 @@ struct eventfd_ctx {
 	int id;
 };
 
-__u64 eventfd_signal_mask(struct eventfd_ctx *ctx, __poll_t mask)
+/**
+ * eventfd_signal - Adds @n to the eventfd counter.
+ * @ctx: [in] Pointer to the eventfd context.
+ * @mask: [in] poll mask
+ *
+ * This function is supposed to be called by the kernel in paths that do not
+ * allow sleeping. In this function we allow the counter to reach the ULLONG_MAX
+ * value, and we signal this as overflow condition by returning a EPOLLERR
+ * to poll(2).
+ */
+void eventfd_signal_mask(struct eventfd_ctx *ctx, __poll_t mask)
 {
 	unsigned long flags;
-	__u64 n = 1;
 
 	/*
 	 * Deadlock or stack overflow issues can happen if we recurse here
@@ -57,37 +66,18 @@ __u64 eventfd_signal_mask(struct eventfd_ctx *ctx, __poll_t mask)
 	 * safe context.
 	 */
 	if (WARN_ON_ONCE(current->in_eventfd))
-		return 0;
+		return;
 
 	spin_lock_irqsave(&ctx->wqh.lock, flags);
 	current->in_eventfd = 1;
-	if (ULLONG_MAX - ctx->count < n)
-		n = ULLONG_MAX - ctx->count;
-	ctx->count += n;
+	if (ctx->count < ULLONG_MAX)
+		ctx->count++;
 	if (waitqueue_active(&ctx->wqh))
 		wake_up_locked_poll(&ctx->wqh, EPOLLIN | mask);
 	current->in_eventfd = 0;
 	spin_unlock_irqrestore(&ctx->wqh.lock, flags);
-
-	return n == 1;
-}
-
-/**
- * eventfd_signal - Adds @n to the eventfd counter.
- * @ctx: [in] Pointer to the eventfd context.
- *
- * This function is supposed to be called by the kernel in paths that do not
- * allow sleeping. In this function we allow the counter to reach the ULLONG_MAX
- * value, and we signal this as overflow condition by returning a EPOLLERR
- * to poll(2).
- *
- * Returns the amount by which the counter was incremented.
- */
-__u64 eventfd_signal(struct eventfd_ctx *ctx)
-{
-	return eventfd_signal_mask(ctx, 0);
 }
-EXPORT_SYMBOL_GPL(eventfd_signal);
+EXPORT_SYMBOL_GPL(eventfd_signal_mask);
 
 static void eventfd_free_ctx(struct eventfd_ctx *ctx)
 {
diff --git a/include/linux/eventfd.h b/include/linux/eventfd.h
index 4f8aac7eb62a..fea7c4eb01d6 100644
--- a/include/linux/eventfd.h
+++ b/include/linux/eventfd.h
@@ -35,8 +35,7 @@ void eventfd_ctx_put(struct eventfd_ctx *ctx);
 struct file *eventfd_fget(int fd);
 struct eventfd_ctx *eventfd_ctx_fdget(int fd);
 struct eventfd_ctx *eventfd_ctx_fileget(struct file *file);
-__u64 eventfd_signal(struct eventfd_ctx *ctx);
-__u64 eventfd_signal_mask(struct eventfd_ctx *ctx, __poll_t mask);
+void eventfd_signal_mask(struct eventfd_ctx *ctx, __poll_t mask);
 int eventfd_ctx_remove_wait_queue(struct eventfd_ctx *ctx, wait_queue_entry_t *wait,
 				  __u64 *cnt);
 void eventfd_ctx_do_read(struct eventfd_ctx *ctx, __u64 *cnt);
@@ -58,14 +57,8 @@ static inline struct eventfd_ctx *eventfd_ctx_fdget(int fd)
 	return ERR_PTR(-ENOSYS);
 }
 
-static inline int eventfd_signal(struct eventfd_ctx *ctx)
+static inline void eventfd_signal_mask(struct eventfd_ctx *ctx, unsigned mask)
 {
-	return -ENOSYS;
-}
-
-static inline int eventfd_signal_mask(struct eventfd_ctx *ctx, unsigned mask)
-{
-	return -ENOSYS;
 }
 
 static inline void eventfd_ctx_put(struct eventfd_ctx *ctx)
@@ -91,5 +84,10 @@ static inline void eventfd_ctx_do_read(struct eventfd_ctx *ctx, __u64 *cnt)
 
 #endif
 
+static inline void eventfd_signal(struct eventfd_ctx *ctx)
+{
+	eventfd_signal_mask(ctx, 0);
+}
+
 #endif /* _LINUX_EVENTFD_H */
 

-- 
2.42.0

