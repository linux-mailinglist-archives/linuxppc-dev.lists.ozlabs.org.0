Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64024245E22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 09:37:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVQqF3SGZzDqN2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 17:37:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+1cabf852a0fb828109f5+6203+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=DipkJ9iW; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVQjm1F50zDqN8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 17:32:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=AV1nnDyoAteGW1xDXxiglssfIjdsAGpHVPepm5P0AyM=; b=DipkJ9iW0iJWxipjU4+E9Ha9y4
 U6PM+vLkZOuCGUnz6zz6ZKCIfHs4r1PRtGQNb9EGge9BoRJ5M2jqM96i86E+xA4PNTxPyPDN1Xbur
 cYkUlnhvGW3mTeNGRU4fu2RfKYvZCSfNWLfYloPxpfKdtFiA0rNA2Xynom0xejk6f+eZUWoyaBMOG
 DzxV4YljSgU/+A+S8DUY3l6WfMjpmuXZH4yuJsqOP7tZznJkTmUSnc9b1VrM8K+nvNG9TL0TBYli6
 i6Xg+ocYC9IHt3ADq/WmGYcqg2/RtJxaszBbfRpA6CHEDu1O/SRdTjQd1FmM2IEkgAMdUiWuBUz1W
 wNej4rsQ==;
Received: from [2001:4bb8:188:3918:4550:cdf7:3d45:afb9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7Zcx-0000vI-AH; Mon, 17 Aug 2020 07:32:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org
Subject: [PATCH 03/11] fs: don't allow splice read/write without explicit ops
Date: Mon, 17 Aug 2020 09:32:04 +0200
Message-Id: <20200817073212.830069-4-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817073212.830069-1-hch@lst.de>
References: <20200817073212.830069-1-hch@lst.de>
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

default_file_splice_write is the last piece of generic code that uses
set_fs to make the uaccess routines operate on kernel pointers.  It
implements a "fallback loop" for splicing from files that do not actually
provide a proper splice_read method.  The usual file systems and other
high bandwith instances all provide a ->splice_read, so this just removes
support for various device drivers and procfs/debugfs files.  If splice
support for any of those turns out to be important it can be added back
by switching them to the iter ops and using generic_file_splice_read.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/read_write.c    |   2 +-
 fs/splice.c        | 130 +++++----------------------------------------
 include/linux/fs.h |   2 -
 3 files changed, 15 insertions(+), 119 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index 702c4301d9eb6b..8c61f67453e3d3 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -1077,7 +1077,7 @@ ssize_t vfs_iter_write(struct file *file, struct iov_iter *iter, loff_t *ppos,
 }
 EXPORT_SYMBOL(vfs_iter_write);
 
-ssize_t vfs_readv(struct file *file, const struct iovec __user *vec,
+static ssize_t vfs_readv(struct file *file, const struct iovec __user *vec,
 		  unsigned long vlen, loff_t *pos, rwf_t flags)
 {
 	struct iovec iovstack[UIO_FASTIOV];
diff --git a/fs/splice.c b/fs/splice.c
index d7c8a7c4db07ff..412df7b48f9eb7 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -342,89 +342,6 @@ const struct pipe_buf_operations nosteal_pipe_buf_ops = {
 };
 EXPORT_SYMBOL(nosteal_pipe_buf_ops);
 
-static ssize_t kernel_readv(struct file *file, const struct kvec *vec,
-			    unsigned long vlen, loff_t offset)
-{
-	mm_segment_t old_fs;
-	loff_t pos = offset;
-	ssize_t res;
-
-	old_fs = get_fs();
-	set_fs(KERNEL_DS);
-	/* The cast to a user pointer is valid due to the set_fs() */
-	res = vfs_readv(file, (const struct iovec __user *)vec, vlen, &pos, 0);
-	set_fs(old_fs);
-
-	return res;
-}
-
-static ssize_t default_file_splice_read(struct file *in, loff_t *ppos,
-				 struct pipe_inode_info *pipe, size_t len,
-				 unsigned int flags)
-{
-	struct kvec *vec, __vec[PIPE_DEF_BUFFERS];
-	struct iov_iter to;
-	struct page **pages;
-	unsigned int nr_pages;
-	unsigned int mask;
-	size_t offset, base, copied = 0;
-	ssize_t res;
-	int i;
-
-	if (pipe_full(pipe->head, pipe->tail, pipe->max_usage))
-		return -EAGAIN;
-
-	/*
-	 * Try to keep page boundaries matching to source pagecache ones -
-	 * it probably won't be much help, but...
-	 */
-	offset = *ppos & ~PAGE_MASK;
-
-	iov_iter_pipe(&to, READ, pipe, len + offset);
-
-	res = iov_iter_get_pages_alloc(&to, &pages, len + offset, &base);
-	if (res <= 0)
-		return -ENOMEM;
-
-	nr_pages = DIV_ROUND_UP(res + base, PAGE_SIZE);
-
-	vec = __vec;
-	if (nr_pages > PIPE_DEF_BUFFERS) {
-		vec = kmalloc_array(nr_pages, sizeof(struct kvec), GFP_KERNEL);
-		if (unlikely(!vec)) {
-			res = -ENOMEM;
-			goto out;
-		}
-	}
-
-	mask = pipe->ring_size - 1;
-	pipe->bufs[to.head & mask].offset = offset;
-	pipe->bufs[to.head & mask].len -= offset;
-
-	for (i = 0; i < nr_pages; i++) {
-		size_t this_len = min_t(size_t, len, PAGE_SIZE - offset);
-		vec[i].iov_base = page_address(pages[i]) + offset;
-		vec[i].iov_len = this_len;
-		len -= this_len;
-		offset = 0;
-	}
-
-	res = kernel_readv(in, vec, nr_pages, *ppos);
-	if (res > 0) {
-		copied = res;
-		*ppos += res;
-	}
-
-	if (vec != __vec)
-		kfree(vec);
-out:
-	for (i = 0; i < nr_pages; i++)
-		put_page(pages[i]);
-	kvfree(pages);
-	iov_iter_advance(&to, copied);	/* truncates and discards */
-	return res;
-}
-
 /*
  * Send 'sd->len' bytes to socket from 'sd->file' at position 'sd->pos'
  * using sendpage(). Return the number of bytes sent.
@@ -788,33 +705,6 @@ iter_file_splice_write(struct pipe_inode_info *pipe, struct file *out,
 
 EXPORT_SYMBOL(iter_file_splice_write);
 
-static int write_pipe_buf(struct pipe_inode_info *pipe, struct pipe_buffer *buf,
-			  struct splice_desc *sd)
-{
-	int ret;
-	void *data;
-	loff_t tmp = sd->pos;
-
-	data = kmap(buf->page);
-	ret = __kernel_write(sd->u.file, data + buf->offset, sd->len, &tmp);
-	kunmap(buf->page);
-
-	return ret;
-}
-
-static ssize_t default_file_splice_write(struct pipe_inode_info *pipe,
-					 struct file *out, loff_t *ppos,
-					 size_t len, unsigned int flags)
-{
-	ssize_t ret;
-
-	ret = splice_from_pipe(pipe, out, ppos, len, flags, write_pipe_buf);
-	if (ret > 0)
-		*ppos += ret;
-
-	return ret;
-}
-
 /**
  * generic_splice_sendpage - splice data from a pipe to a socket
  * @pipe:	pipe to splice from
@@ -836,15 +726,23 @@ ssize_t generic_splice_sendpage(struct pipe_inode_info *pipe, struct file *out,
 
 EXPORT_SYMBOL(generic_splice_sendpage);
 
+static int warn_unsupported(struct file *file, const char *op)
+{
+	pr_debug_ratelimited(
+		"splice %s not supported for file %pD4 (pid: %d comm: %.20s)\n",
+		op, file, current->pid, current->comm);
+	return -EINVAL;
+}
+
 /*
  * Attempt to initiate a splice from pipe to file.
  */
 static long do_splice_from(struct pipe_inode_info *pipe, struct file *out,
 			   loff_t *ppos, size_t len, unsigned int flags)
 {
-	if (out->f_op->splice_write)
-		return out->f_op->splice_write(pipe, out, ppos, len, flags);
-	return default_file_splice_write(pipe, out, ppos, len, flags);
+	if (unlikely(!out->f_op->splice_write))
+		return warn_unsupported(out, "write");
+	return out->f_op->splice_write(pipe, out, ppos, len, flags);
 }
 
 /*
@@ -866,9 +764,9 @@ static long do_splice_to(struct file *in, loff_t *ppos,
 	if (unlikely(len > MAX_RW_COUNT))
 		len = MAX_RW_COUNT;
 
-	if (in->f_op->splice_read)
-		return in->f_op->splice_read(in, ppos, pipe, len, flags);
-	return default_file_splice_read(in, ppos, pipe, len, flags);
+	if (unlikely(!in->f_op->splice_read))
+		return warn_unsupported(in, "read");
+	return in->f_op->splice_read(in, ppos, pipe, len, flags);
 }
 
 /**
diff --git a/include/linux/fs.h b/include/linux/fs.h
index e019ea2f1347e6..d33cc3e8ed410b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1894,8 +1894,6 @@ ssize_t rw_copy_check_uvector(int type, const struct iovec __user * uvector,
 
 extern ssize_t vfs_read(struct file *, char __user *, size_t, loff_t *);
 extern ssize_t vfs_write(struct file *, const char __user *, size_t, loff_t *);
-extern ssize_t vfs_readv(struct file *, const struct iovec __user *,
-		unsigned long, loff_t *, rwf_t);
 extern ssize_t vfs_copy_file_range(struct file *, loff_t , struct file *,
 				   loff_t, size_t, unsigned int);
 extern ssize_t generic_copy_file_range(struct file *file_in, loff_t pos_in,
-- 
2.28.0

