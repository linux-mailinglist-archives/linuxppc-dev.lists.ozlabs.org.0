Return-Path: <linuxppc-dev+bounces-13243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D791AC03FF8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 03:11:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ct4bh4B5Xz301K;
	Fri, 24 Oct 2025 12:11:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761267758;
	cv=none; b=mGqVIiFKd40wW+jzMlG5g65dTlv79StAKoWACuwtdCrE+IpueOG/knZ4NLvII+JEqB01Bf0ZHFwnCUxHxlf60W1gYUiuHZicXkFX5USh0N1axfRQgMbgM6F4VDK3va0rqa3FblKnqkT1KAqM4lsanzZnytu0DKEWHuiIpmAvOIeoOURWx6JsK2OoLfOrIVCmfFs5AeBNTCgdPSjnyyXbZKue2a3AWzSgoYsVKeGiZsnOZl9kF8D7mTrUWN9jrdT/uDndaaANbd+mDqbXVvYvemBoHkto0aERpO+YB6+B4K+1EDqKcjI3a/0NKcDlAvACilQgmS8rCL1j9NlwQgha5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761267758; c=relaxed/relaxed;
	bh=IKDbt1wT9yJqALXoBzDuHO4g9TQZ25V02GA6xGAEZGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dFy3Z1VG/gb0ifEcwJPI8zAaBloi995IQMwgShe1iElIoFwdtIlX2LxISbR8dpglpIWnvxPBSqMygzQmwTcu4r7LazAC0dTmzTce4uWmWNRpxv0sKc9cXjy/okMrGYKFp5NA2Hr7IHuX9xnCDUKzb+D4H4A69P5bFXrm5omQ/yltWT1KqdRkHjVVZFI/NijYQyHbUAuN9iJ/74wqu8We/Ym6Ov+Dd3jWrHSPNXMlTaQe2z1GpVRIuqd1ZXE4b5uwlFIsoj0jkB+0KCQXxNO30B5tSB6UFAgvvEm5f65QScufgiuSF/GihNFqtH2DqzHaGI9xBsqw28wSIzFRB43kXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fkwZ4ozs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com; envelope-from=danisjiang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fkwZ4ozs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com; envelope-from=danisjiang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ct4Pm5bfCz2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 12:02:36 +1100 (AEDT)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-93bccd4901aso131218739f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 18:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761267753; x=1761872553; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IKDbt1wT9yJqALXoBzDuHO4g9TQZ25V02GA6xGAEZGQ=;
        b=fkwZ4ozscIsJMhhYHjScR4CQx/0HYHq58cbCwYgd49ePm70tWAwmM3Fg0PyoagHAYv
         V7zgftf9ri7AmXW00EvojzyCC2p44mj0fDxGsnof+7m751IvHiBUWac2Q+r93oddSetv
         dXKrWs2QVQ6qcTgv9C8mGp7M0pihT3uxthlIyLchSGXf777SUkNg5mi3t84vTfE2fFhD
         VBDYtloBXnGU2uv0cxsWGVXb8mzF1OV3ezGEsoAqLOkUWwsW/7v+wkjuZBk3VExKvN7X
         EG+GL9InAPcq66BLR9Q8NTHZ4mIKPe5I6wjuc9khyv21Mk+zRE5BmckMppqJuy2LH8Wg
         FwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761267753; x=1761872553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKDbt1wT9yJqALXoBzDuHO4g9TQZ25V02GA6xGAEZGQ=;
        b=O++35BiNeqdva3rq5wVLTEKCCUCHshzRTOY2pXJLFVYntpWWS+1yWQjwuE6Sc+icZi
         agpmgNkd9yi3aOg4CHbwJ8lyj0w3Zu2FAlkyoAbcPzRLByV1Oow9v6VWS8MtLLvVcjtL
         O7ZnUNgw1ZtQ6eNIvvYB+h8dTmRGUkF4b16wEYwD9dw+e1wb1VRYqUqogAkqsZzMaDpe
         2RLio+BXlF3CVDcAQL8H+W7AFgmKfrM+qtA7g7NdqT9Ilt0ByPt14pTaFbABDm9V2N+s
         bGJQ8qUooHc4jFrH39kcX4gnP9v7jN7drc9gEOfWCnm38YhIItYZdrFRVG4PeAZYuD4n
         Bibg==
X-Forwarded-Encrypted: i=1; AJvYcCUxxqeW3hTAS+dYV1fehhI7By1XoR82VCV36hCA2+MIXaSQvWAjIg0DIwKz9whse+bqGN0UuixPAk9M3NI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxGLZqhTZWpf/H0sfOICP0uBSOskFU6pKomK5dSfamAncPzXWXh
	sRfMWEmTvGYtX3HivwvC15QL0ha1BHT00/+F1afjNkamDJalBoGh44Gb
X-Gm-Gg: ASbGncuXNBGItwbE20+08KVGKevOjeU77JukjiKjatJSkORwGp9+IVhhLzaX4Sbs0td
	uwgoaqwmN5t8vTqAQKPryzw88XVYR9YH8Dv+vCsRKRdiFyGQcs5P4VvEZ3pD16opEnT0DzLC1w9
	1LzbwC3zmN3hPCeDxn1FSFlT1phk7NFwuOx5pU4kahOXpFkOTLqnfVOHlqcex+Jp+xE9T8mRL74
	BEQ36ylyhHC+a/n0JcMnqmAuvrnUHUuqqQbWJPqk8ce0ht+HuMrGUgo0oHC06j3UZLQ8gGL78sj
	HruA4qqjvVrHwyfZWbdaBvrTINR4Q9ha2GVkBBUiG/F4XooOS5THG6dPNAGWK8K6jxjoZSXk3O7
	x75Ghv/i9UECaRr7k7pph42m0kT098mjujp6PKotGLrtgP8200RDO/WUs7WT0DAmn5wsC8b47NR
	eRtKeBwWRtg/BAhPaQerw/BF47seKv66sjtTkWy2xvA0pX9gW+rmeuhZh3jDE4MxEyu+FqwiM41
	kIbD2tOMIou+qbMqCE2a6XKsQ==
X-Google-Smtp-Source: AGHT+IEK9z1XCO0/7ofKXVfCQ/mfQxCmtCOsaVIb6O6vKesfo5b3vwjLT3GVU6VPQlsM67rO3oQbtg==
X-Received: by 2002:a05:6e02:2508:b0:430:a65c:a833 with SMTP id e9e14a558f8ab-431ebf86680mr9062255ab.31.1761267753103;
        Thu, 23 Oct 2025 18:02:33 -0700 (PDT)
Received: from abc-virtual-machine.localdomain (c-76-150-86-52.hsd1.il.comcast.net. [76.150.86.52])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fda03fsm1538669173.35.2025.10.23.18.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 18:02:32 -0700 (PDT)
From: Yuhao Jiang <danisjiang@gmail.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alastair D'Silva <alastair@d-silva.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Yuhao Jiang <danisjiang@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ocxl: Fix race leading to use-after-free in file operations
Date: Thu, 23 Oct 2025 20:02:28 -0500
Message-Id: <20251024010228.1667904-1-danisjiang@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The file operations dereference the context pointer after checking
status under ctx->status_mutex, then drop the lock before using the
context. This allows afu_release() running on another CPU to free
the context, leading to a use-after-free vulnerability.

The race window exists in afu_ioctl(), afu_mmap(), afu_poll() and
afu_read() between the status check and context usage. During device
hot-unplug or rapid open/close cycles, this causes kernel crashes.

Introduce reference counting via kref to prevent premature free.
ocxl_context_get() atomically checks status and acquires a reference
under status_mutex. File operations hold this reference for their
duration, ensuring the context remains valid even if another thread
calls afu_release().

ocxl_context_alloc() initializes refcount to 1 for the file's
lifetime. afu_release() drops this reference, with the context freed
when the last reference goes away. Preserve existing -EBUSY behavior
where the context intentionally leaks on detach timeout.

Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Fixes: 5ef3166e8a32 ("ocxl: Driver code for 'generic' opencapi devices")
Cc: stable@vger.kernel.org
Signed-off-by: Yuhao Jiang <danisjiang@gmail.com>
---
 drivers/misc/ocxl/context.c       |  69 ++++++++++++++----
 drivers/misc/ocxl/file.c          | 113 +++++++++++++++++++++++-------
 drivers/misc/ocxl/ocxl_internal.h |   4 ++
 3 files changed, 144 insertions(+), 42 deletions(-)

diff --git a/drivers/misc/ocxl/context.c b/drivers/misc/ocxl/context.c
index cded7d1caf32..e154adc972a5 100644
--- a/drivers/misc/ocxl/context.c
+++ b/drivers/misc/ocxl/context.c
@@ -28,6 +28,7 @@ int ocxl_context_alloc(struct ocxl_context **context, struct ocxl_afu *afu,
 
 	ctx->pasid = pasid;
 	ctx->status = OPENED;
+	kref_init(&ctx->kref);
 	mutex_init(&ctx->status_mutex);
 	ctx->mapping = mapping;
 	mutex_init(&ctx->mapping_lock);
@@ -47,6 +48,59 @@ int ocxl_context_alloc(struct ocxl_context **context, struct ocxl_afu *afu,
 }
 EXPORT_SYMBOL_GPL(ocxl_context_alloc);
 
+/**
+ * ocxl_context_get() - Get a reference to the context if not closed
+ * @ctx: The context
+ *
+ * Atomically checks if context status is not CLOSED and acquires a reference.
+ * Must be called with ctx->status_mutex held.
+ *
+ * Return: true if reference acquired, false if context is CLOSED
+ */
+bool ocxl_context_get(struct ocxl_context *ctx)
+{
+	lockdep_assert_held(&ctx->status_mutex);
+
+	if (ctx->status == CLOSED)
+		return false;
+
+	kref_get(&ctx->kref);
+	return true;
+}
+EXPORT_SYMBOL_GPL(ocxl_context_get);
+
+/*
+ * kref release callback - called when last reference is dropped
+ */
+static void ocxl_context_release(struct kref *kref)
+{
+	struct ocxl_context *ctx = container_of(kref, struct ocxl_context,
+						 kref);
+
+	mutex_lock(&ctx->afu->contexts_lock);
+	ctx->afu->pasid_count--;
+	idr_remove(&ctx->afu->contexts_idr, ctx->pasid);
+	mutex_unlock(&ctx->afu->contexts_lock);
+
+	ocxl_afu_irq_free_all(ctx);
+	idr_destroy(&ctx->irq_idr);
+	/* reference to the AFU taken in ocxl_context_alloc() */
+	ocxl_afu_put(ctx->afu);
+	kfree(ctx);
+}
+
+/**
+ * ocxl_context_put() - Release a reference to the context
+ * @ctx: The context
+ *
+ * Decrements the reference count. When it reaches zero, the context is freed.
+ */
+void ocxl_context_put(struct ocxl_context *ctx)
+{
+	kref_put(&ctx->kref, ocxl_context_release);
+}
+EXPORT_SYMBOL_GPL(ocxl_context_put);
+
 /*
  * Callback for when a translation fault triggers an error
  * data:	a pointer to the context which triggered the fault
@@ -279,18 +333,3 @@ void ocxl_context_detach_all(struct ocxl_afu *afu)
 	}
 	mutex_unlock(&afu->contexts_lock);
 }
-
-void ocxl_context_free(struct ocxl_context *ctx)
-{
-	mutex_lock(&ctx->afu->contexts_lock);
-	ctx->afu->pasid_count--;
-	idr_remove(&ctx->afu->contexts_idr, ctx->pasid);
-	mutex_unlock(&ctx->afu->contexts_lock);
-
-	ocxl_afu_irq_free_all(ctx);
-	idr_destroy(&ctx->irq_idr);
-	/* reference to the AFU taken in ocxl_context_alloc() */
-	ocxl_afu_put(ctx->afu);
-	kfree(ctx);
-}
-EXPORT_SYMBOL_GPL(ocxl_context_free);
diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
index 7eb74711ac96..c08724e7ff1e 100644
--- a/drivers/misc/ocxl/file.c
+++ b/drivers/misc/ocxl/file.c
@@ -204,17 +204,21 @@ static long afu_ioctl(struct file *file, unsigned int cmd,
 	int irq_id;
 	u64 irq_offset;
 	long rc;
-	bool closed;
-
-	pr_debug("%s for context %d, command %s\n", __func__, ctx->pasid,
-		CMD_STR(cmd));
 
+	/*
+	 * Hold a reference to the context for the duration of this operation.
+	 * We check the status and acquire the reference atomically under the
+	 * status_mutex to ensure the context remains valid.
+	 */
 	mutex_lock(&ctx->status_mutex);
-	closed = (ctx->status == CLOSED);
+	if (!ocxl_context_get(ctx)) {
+		mutex_unlock(&ctx->status_mutex);
+		return -EIO;
+	}
 	mutex_unlock(&ctx->status_mutex);
 
-	if (closed)
-		return -EIO;
+	pr_debug("%s for context %d, command %s\n", __func__, ctx->pasid,
+		CMD_STR(cmd));
 
 	switch (cmd) {
 	case OCXL_IOCTL_ATTACH:
@@ -230,7 +234,7 @@ static long afu_ioctl(struct file *file, unsigned int cmd,
 					sizeof(irq_offset));
 			if (rc) {
 				ocxl_afu_irq_free(ctx, irq_id);
-				return -EFAULT;
+				rc = -EFAULT;
 			}
 		}
 		break;
@@ -238,8 +242,10 @@ static long afu_ioctl(struct file *file, unsigned int cmd,
 	case OCXL_IOCTL_IRQ_FREE:
 		rc = copy_from_user(&irq_offset, (u64 __user *) args,
 				sizeof(irq_offset));
-		if (rc)
-			return -EFAULT;
+		if (rc) {
+			rc = -EFAULT;
+			break;
+		}
 		irq_id = ocxl_irq_offset_to_id(ctx, irq_offset);
 		rc = ocxl_afu_irq_free(ctx, irq_id);
 		break;
@@ -247,14 +253,20 @@ static long afu_ioctl(struct file *file, unsigned int cmd,
 	case OCXL_IOCTL_IRQ_SET_FD:
 		rc = copy_from_user(&irq_fd, (u64 __user *) args,
 				sizeof(irq_fd));
-		if (rc)
-			return -EFAULT;
-		if (irq_fd.reserved)
-			return -EINVAL;
+		if (rc) {
+			rc = -EFAULT;
+			break;
+		}
+		if (irq_fd.reserved) {
+			rc = -EINVAL;
+			break;
+		}
 		irq_id = ocxl_irq_offset_to_id(ctx, irq_fd.irq_offset);
 		ev_ctx = eventfd_ctx_fdget(irq_fd.eventfd);
-		if (IS_ERR(ev_ctx))
-			return PTR_ERR(ev_ctx);
+		if (IS_ERR(ev_ctx)) {
+			rc = PTR_ERR(ev_ctx);
+			break;
+		}
 		rc = ocxl_irq_set_handler(ctx, irq_id, irq_handler, irq_free, ev_ctx);
 		if (rc)
 			eventfd_ctx_put(ev_ctx);
@@ -280,6 +292,8 @@ static long afu_ioctl(struct file *file, unsigned int cmd,
 	default:
 		rc = -EINVAL;
 	}
+
+	ocxl_context_put(ctx);
 	return rc;
 }
 
@@ -292,9 +306,23 @@ static long afu_compat_ioctl(struct file *file, unsigned int cmd,
 static int afu_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct ocxl_context *ctx = file->private_data;
+	int rc;
+
+	/*
+	 * Hold a reference during mmap setup to ensure the context
+	 * remains valid.
+	 */
+	mutex_lock(&ctx->status_mutex);
+	if (!ocxl_context_get(ctx)) {
+		mutex_unlock(&ctx->status_mutex);
+		return -EIO;
+	}
+	mutex_unlock(&ctx->status_mutex);
 
 	pr_debug("%s for context %d\n", __func__, ctx->pasid);
-	return ocxl_context_mmap(ctx, vma);
+	rc = ocxl_context_mmap(ctx, vma);
+	ocxl_context_put(ctx);
+	return rc;
 }
 
 static bool has_xsl_error(struct ocxl_context *ctx)
@@ -324,21 +352,31 @@ static unsigned int afu_poll(struct file *file, struct poll_table_struct *wait)
 {
 	struct ocxl_context *ctx = file->private_data;
 	unsigned int mask = 0;
-	bool closed;
+
+	/*
+	 * Hold a reference to the context while checking for events.
+	 */
+	mutex_lock(&ctx->status_mutex);
+	if (!ocxl_context_get(ctx)) {
+		mutex_unlock(&ctx->status_mutex);
+		return EPOLLERR;
+	}
+	mutex_unlock(&ctx->status_mutex);
 
 	pr_debug("%s for context %d\n", __func__, ctx->pasid);
 
 	poll_wait(file, &ctx->events_wq, wait);
 
-	mutex_lock(&ctx->status_mutex);
-	closed = (ctx->status == CLOSED);
-	mutex_unlock(&ctx->status_mutex);
-
 	if (afu_events_pending(ctx))
 		mask = EPOLLIN | EPOLLRDNORM;
-	else if (closed)
-		mask = EPOLLERR;
+	else {
+		mutex_lock(&ctx->status_mutex);
+		if (ctx->status == CLOSED)
+			mask = EPOLLERR;
+		mutex_unlock(&ctx->status_mutex);
+	}
 
+	ocxl_context_put(ctx);
 	return mask;
 }
 
@@ -410,6 +448,16 @@ static ssize_t afu_read(struct file *file, char __user *buf, size_t count,
 			AFU_EVENT_BODY_MAX_SIZE))
 		return -EINVAL;
 
+	/*
+	 * Hold a reference to the context for the duration of the read operation.
+	 */
+	mutex_lock(&ctx->status_mutex);
+	if (!ocxl_context_get(ctx)) {
+		mutex_unlock(&ctx->status_mutex);
+		return -EIO;
+	}
+	mutex_unlock(&ctx->status_mutex);
+
 	for (;;) {
 		prepare_to_wait(&ctx->events_wq, &event_wait,
 				TASK_INTERRUPTIBLE);
@@ -422,11 +470,13 @@ static ssize_t afu_read(struct file *file, char __user *buf, size_t count,
 
 		if (file->f_flags & O_NONBLOCK) {
 			finish_wait(&ctx->events_wq, &event_wait);
+			ocxl_context_put(ctx);
 			return -EAGAIN;
 		}
 
 		if (signal_pending(current)) {
 			finish_wait(&ctx->events_wq, &event_wait);
+			ocxl_context_put(ctx);
 			return -ERESTARTSYS;
 		}
 
@@ -437,19 +487,24 @@ static ssize_t afu_read(struct file *file, char __user *buf, size_t count,
 
 	if (has_xsl_error(ctx)) {
 		used = append_xsl_error(ctx, &header, buf + sizeof(header));
-		if (used < 0)
+		if (used < 0) {
+			ocxl_context_put(ctx);
 			return used;
+		}
 	}
 
 	if (!afu_events_pending(ctx))
 		header.flags |= OCXL_KERNEL_EVENT_FLAG_LAST;
 
-	if (copy_to_user(buf, &header, sizeof(header)))
+	if (copy_to_user(buf, &header, sizeof(header))) {
+		ocxl_context_put(ctx);
 		return -EFAULT;
+	}
 
 	used += sizeof(header);
 
 	rc = used;
+	ocxl_context_put(ctx);
 	return rc;
 }
 
@@ -464,8 +519,12 @@ static int afu_release(struct inode *inode, struct file *file)
 	ctx->mapping = NULL;
 	mutex_unlock(&ctx->mapping_lock);
 	wake_up_all(&ctx->events_wq);
+	/*
+	 * Drop the initial reference from afu_open(). The context will be
+	 * freed when all references are released.
+	 */
 	if (rc != -EBUSY)
-		ocxl_context_free(ctx);
+		ocxl_context_put(ctx);
 	return 0;
 }
 
diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
index d2028d6c6f08..6eab7806b43d 100644
--- a/drivers/misc/ocxl/ocxl_internal.h
+++ b/drivers/misc/ocxl/ocxl_internal.h
@@ -5,6 +5,7 @@
 
 #include <linux/pci.h>
 #include <linux/cdev.h>
+#include <linux/kref.h>
 #include <linux/list.h>
 #include <misc/ocxl.h>
 
@@ -68,6 +69,7 @@ struct ocxl_xsl_error {
 };
 
 struct ocxl_context {
+	struct kref kref;
 	struct ocxl_afu *afu;
 	int pasid;
 	struct mutex status_mutex;
@@ -140,6 +142,8 @@ int ocxl_link_update_pe(void *link_handle, int pasid, __u16 tid);
 
 int ocxl_context_mmap(struct ocxl_context *ctx,
 			struct vm_area_struct *vma);
+bool ocxl_context_get(struct ocxl_context *ctx);
+void ocxl_context_put(struct ocxl_context *ctx);
 void ocxl_context_detach_all(struct ocxl_afu *afu);
 
 int ocxl_sysfs_register_afu(struct ocxl_file_info *info);
-- 
2.34.1


