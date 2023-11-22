Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5D57F4D47
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 17:51:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sH8Tm1wP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb6hv66Jkz3vjs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 03:51:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sH8Tm1wP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb1Ks5cF1z3cYj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 23:49:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0ADFE61D62;
	Wed, 22 Nov 2023 12:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917EAC433D9;
	Wed, 22 Nov 2023 12:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700657391;
	bh=hkU4HuuqkNDsQyioSQIrRKs3Tgv1T8STkBb7WyDQZe8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sH8Tm1wP4EJijR7jWPvNmVl3mBtGkN3wNNGbSdSvEFuMdvkY1E+QcVQvJITT2RIsW
	 PEZ3zcrNhYwSEpVPHfg4a4zhavH8mDv02NXVgiIbz8f69fdg4BB2d9Zli1lRzYSb6z
	 EhsClQyaa8F9yvudTBUtM4my+Rx0dMR0LAc+gsTxCigYWjUsjR3qlZZqilJVkyWppo
	 yGn3YPu1G4hIzrWGGgQSL4WErzUbY4QLyvvdHlzbxEk04+A1PVD2meTrRkiqNGZrYf
	 zKCJTM3AbkjVz3eM9Q0Xi3c64W42/3N1VaWB+hvIpTkCgb37ZYi4HaREDHPLbxjZgc
	 W9uhC2VfgcM3w==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 22 Nov 2023 13:48:24 +0100
Subject: [PATCH v2 3/4] eventfd: simplify eventfd_signal_mask()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-vfs-eventfd-signal-v2-3-bd549b14ce0c@kernel.org>
References: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
In-Reply-To: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
To: linux-fsdevel@vger.kernel.org
X-Mailer: b4 0.13-dev-26615
X-Developer-Signature: v=1; a=openpgp-sha256; l=3315; i=brauner@kernel.org;
 h=from:subject:message-id; bh=hkU4HuuqkNDsQyioSQIrRKs3Tgv1T8STkBb7WyDQZe8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaTG/liTnx+1a0vsCaGMN23r18xIsnV/pBwn1ZPp37Mqs
 7FRsi+uo5SFQYyLQVZMkcWh3SRcbjlPxWajTA2YOaxMIEMYuDgFYCLd4YwMmxu+PXlzuflnQNcx
 jdSWzQFP5u+/ce54mkHTWs4J/1MYfRgZVub+qv3K3/m32t58z12JNyZxGoI5uyT1mLNNT0rt0T7
 KCQA=
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

The eventfd_signal_mask() helper was introduced for io_uring and similar
to eventfd_signal() it always passed 1 for @n. So don't bother with that
argument at all.

Signed-off-by: Christian Brauner <brauner@kernel.org>
---
 fs/eventfd.c            | 7 ++++---
 include/linux/eventfd.h | 5 ++---
 io_uring/io_uring.c     | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/eventfd.c b/fs/eventfd.c
index dc9e01053235..a9a6de920fb4 100644
--- a/fs/eventfd.c
+++ b/fs/eventfd.c
@@ -43,9 +43,10 @@ struct eventfd_ctx {
 	int id;
 };
 
-__u64 eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n, __poll_t mask)
+__u64 eventfd_signal_mask(struct eventfd_ctx *ctx, __poll_t mask)
 {
 	unsigned long flags;
+	__u64 n = 1;
 
 	/*
 	 * Deadlock or stack overflow issues can happen if we recurse here
@@ -68,7 +69,7 @@ __u64 eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n, __poll_t mask)
 	current->in_eventfd = 0;
 	spin_unlock_irqrestore(&ctx->wqh.lock, flags);
 
-	return n;
+	return n == 1;
 }
 
 /**
@@ -84,7 +85,7 @@ __u64 eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n, __poll_t mask)
  */
 __u64 eventfd_signal(struct eventfd_ctx *ctx)
 {
-	return eventfd_signal_mask(ctx, 1, 0);
+	return eventfd_signal_mask(ctx, 0);
 }
 EXPORT_SYMBOL_GPL(eventfd_signal);
 
diff --git a/include/linux/eventfd.h b/include/linux/eventfd.h
index 562089431551..4f8aac7eb62a 100644
--- a/include/linux/eventfd.h
+++ b/include/linux/eventfd.h
@@ -36,7 +36,7 @@ struct file *eventfd_fget(int fd);
 struct eventfd_ctx *eventfd_ctx_fdget(int fd);
 struct eventfd_ctx *eventfd_ctx_fileget(struct file *file);
 __u64 eventfd_signal(struct eventfd_ctx *ctx);
-__u64 eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n, __poll_t mask);
+__u64 eventfd_signal_mask(struct eventfd_ctx *ctx, __poll_t mask);
 int eventfd_ctx_remove_wait_queue(struct eventfd_ctx *ctx, wait_queue_entry_t *wait,
 				  __u64 *cnt);
 void eventfd_ctx_do_read(struct eventfd_ctx *ctx, __u64 *cnt);
@@ -63,8 +63,7 @@ static inline int eventfd_signal(struct eventfd_ctx *ctx)
 	return -ENOSYS;
 }
 
-static inline int eventfd_signal_mask(struct eventfd_ctx *ctx, __u64 n,
-				      unsigned mask)
+static inline int eventfd_signal_mask(struct eventfd_ctx *ctx, unsigned mask)
 {
 	return -ENOSYS;
 }
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index ed254076c723..70170a41eac4 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -558,7 +558,7 @@ static void io_eventfd_ops(struct rcu_head *rcu)
 	int ops = atomic_xchg(&ev_fd->ops, 0);
 
 	if (ops & BIT(IO_EVENTFD_OP_SIGNAL_BIT))
-		eventfd_signal_mask(ev_fd->cq_ev_fd, 1, EPOLL_URING_WAKE);
+		eventfd_signal_mask(ev_fd->cq_ev_fd, EPOLL_URING_WAKE);
 
 	/* IO_EVENTFD_OP_FREE_BIT may not be set here depending on callback
 	 * ordering in a race but if references are 0 we know we have to free
@@ -594,7 +594,7 @@ static void io_eventfd_signal(struct io_ring_ctx *ctx)
 		goto out;
 
 	if (likely(eventfd_signal_allowed())) {
-		eventfd_signal_mask(ev_fd->cq_ev_fd, 1, EPOLL_URING_WAKE);
+		eventfd_signal_mask(ev_fd->cq_ev_fd, EPOLL_URING_WAKE);
 	} else {
 		atomic_inc(&ev_fd->refs);
 		if (!atomic_fetch_or(BIT(IO_EVENTFD_OP_SIGNAL_BIT), &ev_fd->ops))

-- 
2.42.0

