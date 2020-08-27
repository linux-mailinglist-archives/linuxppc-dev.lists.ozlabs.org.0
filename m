Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD1925484D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 17:04:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcmH50x5yzDqf2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 01:04:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+811462fdb5f870f212f0+6213+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=EAf8Yl6V; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcmBM4pWszDqcv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 01:00:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=WnUT44U564BtTxR+CgxY1D0BXTu5a2MR+R2q2mWaxn8=; b=EAf8Yl6V6A2IAfW5NiN9dXI4lg
 Js5uFIb0IB5xrVtkWEMPRdaJHrj+Wp5ilcm49q0E9wgBciAuotYq8K5OBbCrOtvIL5mamvPEfB89d
 c5z4Cds8cffCjW3gMZvhYLZRZr3Y1JCmIF7X20PINMsSevxFB+6EQmEpc+ueGwbFdmOpF9VJNjDQH
 h2wPlNL+90vSuLdvA8oOW/Snimax50sYs7kj9Nu1xrQ2LfumTpdnB/7COvoRl1EdDVvceu6BQN7F5
 VZ13vdvCaJs8yOT4zxFUy785qCH9MQ/rydGmWfPaT6ACr0TWu8TH1r+u2NWQ5dwXsZriJc39nz+Y9
 0KFYD6+w==;
Received: from [2001:4bb8:18c:45ba:9892:9e86:5202:32f0] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBJOD-00044O-Cf; Thu, 27 Aug 2020 15:00:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org
Subject: [PATCH 01/10] fs: don't allow kernel reads and writes without iter ops
Date: Thu, 27 Aug 2020 17:00:21 +0200
Message-Id: <20200827150030.282762-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827150030.282762-1-hch@lst.de>
References: <20200827150030.282762-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Don't allow calling ->read or ->write with set_fs as a preparation for
killing off set_fs.  All the instances that we use kernel_read/write on
are using the iter ops already.

If a file has both the regular ->read/->write methods and the iter
variants those could have different semantics for messed up enough
drivers.  Also fails the kernel access to them in that case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 fs/read_write.c | 67 +++++++++++++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index 5db58b8c78d0dd..702c4301d9eb6b 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -419,27 +419,41 @@ static ssize_t new_sync_read(struct file *filp, char __user *buf, size_t len, lo
 	return ret;
 }
 
+static int warn_unsupported(struct file *file, const char *op)
+{
+	pr_warn_ratelimited(
+		"kernel %s not supported for file %pD4 (pid: %d comm: %.20s)\n",
+		op, file, current->pid, current->comm);
+	return -EINVAL;
+}
+
 ssize_t __kernel_read(struct file *file, void *buf, size_t count, loff_t *pos)
 {
-	mm_segment_t old_fs = get_fs();
+	struct kvec iov = {
+		.iov_base	= buf,
+		.iov_len	= min_t(size_t, count, MAX_RW_COUNT),
+	};
+	struct kiocb kiocb;
+	struct iov_iter iter;
 	ssize_t ret;
 
 	if (WARN_ON_ONCE(!(file->f_mode & FMODE_READ)))
 		return -EINVAL;
 	if (!(file->f_mode & FMODE_CAN_READ))
 		return -EINVAL;
+	/*
+	 * Also fail if ->read_iter and ->read are both wired up as that
+	 * implies very convoluted semantics.
+	 */
+	if (unlikely(!file->f_op->read_iter || file->f_op->read))
+		return warn_unsupported(file, "read");
 
-	if (count > MAX_RW_COUNT)
-		count =  MAX_RW_COUNT;
-	set_fs(KERNEL_DS);
-	if (file->f_op->read)
-		ret = file->f_op->read(file, (void __user *)buf, count, pos);
-	else if (file->f_op->read_iter)
-		ret = new_sync_read(file, (void __user *)buf, count, pos);
-	else
-		ret = -EINVAL;
-	set_fs(old_fs);
+	init_sync_kiocb(&kiocb, file);
+	kiocb.ki_pos = *pos;
+	iov_iter_kvec(&iter, READ, &iov, 1, iov.iov_len);
+	ret = file->f_op->read_iter(&kiocb, &iter);
 	if (ret > 0) {
+		*pos = kiocb.ki_pos;
 		fsnotify_access(file);
 		add_rchar(current, ret);
 	}
@@ -510,28 +524,31 @@ static ssize_t new_sync_write(struct file *filp, const char __user *buf, size_t
 /* caller is responsible for file_start_write/file_end_write */
 ssize_t __kernel_write(struct file *file, const void *buf, size_t count, loff_t *pos)
 {
-	mm_segment_t old_fs;
-	const char __user *p;
+	struct kvec iov = {
+		.iov_base	= (void *)buf,
+		.iov_len	= min_t(size_t, count, MAX_RW_COUNT),
+	};
+	struct kiocb kiocb;
+	struct iov_iter iter;
 	ssize_t ret;
 
 	if (WARN_ON_ONCE(!(file->f_mode & FMODE_WRITE)))
 		return -EBADF;
 	if (!(file->f_mode & FMODE_CAN_WRITE))
 		return -EINVAL;
+	/*
+	 * Also fail if ->write_iter and ->write are both wired up as that
+	 * implies very convoluted semantics.
+	 */
+	if (unlikely(!file->f_op->write_iter || file->f_op->write))
+		return warn_unsupported(file, "write");
 
-	old_fs = get_fs();
-	set_fs(KERNEL_DS);
-	p = (__force const char __user *)buf;
-	if (count > MAX_RW_COUNT)
-		count =  MAX_RW_COUNT;
-	if (file->f_op->write)
-		ret = file->f_op->write(file, p, count, pos);
-	else if (file->f_op->write_iter)
-		ret = new_sync_write(file, p, count, pos);
-	else
-		ret = -EINVAL;
-	set_fs(old_fs);
+	init_sync_kiocb(&kiocb, file);
+	kiocb.ki_pos = *pos;
+	iov_iter_kvec(&iter, WRITE, &iov, 1, iov.iov_len);
+	ret = file->f_op->write_iter(&kiocb, &iter);
 	if (ret > 0) {
+		*pos = kiocb.ki_pos;
 		fsnotify_modify(file);
 		add_wchar(current, ret);
 	}
-- 
2.28.0

