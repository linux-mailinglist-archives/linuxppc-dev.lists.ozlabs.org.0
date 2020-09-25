Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C3E277FC0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 07:07:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByKfq0rgzzDr0K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 15:07:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+158bd042e2069d5d3a43+6242+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=Crx+C9ZQ; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByKJr5Bl2zDqfc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Sep 2020 14:52:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=daVxxVGwNuqpVtzxj/iEsrKI5X+tJ/AZyhGqHWXLHn0=; b=Crx+C9ZQWL9VDKF2agroxeBfi/
 jDo8KTuhECLVKSYDO3j4y+viiUzvyT+pX5q8zzftPUeI1rk15yurpEhR9u4AEspkehMunXOKgJkGv
 w+unq9LcMoOgonKoksqNVGnTnwZaaAD3+wyWegslmN2iT63CxcEhAXUCbBMTOnM5zB3wYQkSe2Fhg
 V9/PCFpQDxHU1qKc25pg1Cf45i3blzEy3+F1YjsQNTqnNLFiaLXqpa3Rmn0lPC8G7noYiZj4dIeIA
 DWYeK5BG4+aW3eWxld7p7Bz7uUiQIGGlYVqzCTZn1Oh5SjiF6XfD0BRgttRUt9Fdj+uqZZg6Qkw3P
 DLv40HdA==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLfi2-0002pl-4B; Fri, 25 Sep 2020 04:51:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 2/9] iov_iter: move rw_copy_check_uvector() into lib/iov_iter.c
Date: Fri, 25 Sep 2020 06:51:39 +0200
Message-Id: <20200925045146.1283714-3-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925045146.1283714-1-hch@lst.de>
References: <20200925045146.1283714-1-hch@lst.de>
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
Cc: linux-aio@kvack.org, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 David Laight <david.laight@aculab.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Laight <David.Laight@ACULAB.COM>

This lets the compiler inline it into import_iovec() generating
much better code.

Signed-off-by: David Laight <david.laight@aculab.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/read_write.c | 179 ------------------------------------------------
 lib/iov_iter.c  | 176 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 176 insertions(+), 179 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index 5db58b8c78d0dd..e5e891a88442ef 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -752,185 +752,6 @@ static ssize_t do_loop_readv_writev(struct file *filp, struct iov_iter *iter,
 	return ret;
 }
 
-/**
- * rw_copy_check_uvector() - Copy an array of &struct iovec from userspace
- *     into the kernel and check that it is valid.
- *
- * @type: One of %CHECK_IOVEC_ONLY, %READ, or %WRITE.
- * @uvector: Pointer to the userspace array.
- * @nr_segs: Number of elements in userspace array.
- * @fast_segs: Number of elements in @fast_pointer.
- * @fast_pointer: Pointer to (usually small on-stack) kernel array.
- * @ret_pointer: (output parameter) Pointer to a variable that will point to
- *     either @fast_pointer, a newly allocated kernel array, or NULL,
- *     depending on which array was used.
- *
- * This function copies an array of &struct iovec of @nr_segs from
- * userspace into the kernel and checks that each element is valid (e.g.
- * it does not point to a kernel address or cause overflow by being too
- * large, etc.).
- *
- * As an optimization, the caller may provide a pointer to a small
- * on-stack array in @fast_pointer, typically %UIO_FASTIOV elements long
- * (the size of this array, or 0 if unused, should be given in @fast_segs).
- *
- * @ret_pointer will always point to the array that was used, so the
- * caller must take care not to call kfree() on it e.g. in case the
- * @fast_pointer array was used and it was allocated on the stack.
- *
- * Return: The total number of bytes covered by the iovec array on success
- *   or a negative error code on error.
- */
-ssize_t rw_copy_check_uvector(int type, const struct iovec __user * uvector,
-			      unsigned long nr_segs, unsigned long fast_segs,
-			      struct iovec *fast_pointer,
-			      struct iovec **ret_pointer)
-{
-	unsigned long seg;
-	ssize_t ret;
-	struct iovec *iov = fast_pointer;
-
-	/*
-	 * SuS says "The readv() function *may* fail if the iovcnt argument
-	 * was less than or equal to 0, or greater than {IOV_MAX}.  Linux has
-	 * traditionally returned zero for zero segments, so...
-	 */
-	if (nr_segs == 0) {
-		ret = 0;
-		goto out;
-	}
-
-	/*
-	 * First get the "struct iovec" from user memory and
-	 * verify all the pointers
-	 */
-	if (nr_segs > UIO_MAXIOV) {
-		ret = -EINVAL;
-		goto out;
-	}
-	if (nr_segs > fast_segs) {
-		iov = kmalloc_array(nr_segs, sizeof(struct iovec), GFP_KERNEL);
-		if (iov == NULL) {
-			ret = -ENOMEM;
-			goto out;
-		}
-	}
-	if (copy_from_user(iov, uvector, nr_segs*sizeof(*uvector))) {
-		ret = -EFAULT;
-		goto out;
-	}
-
-	/*
-	 * According to the Single Unix Specification we should return EINVAL
-	 * if an element length is < 0 when cast to ssize_t or if the
-	 * total length would overflow the ssize_t return value of the
-	 * system call.
-	 *
-	 * Linux caps all read/write calls to MAX_RW_COUNT, and avoids the
-	 * overflow case.
-	 */
-	ret = 0;
-	for (seg = 0; seg < nr_segs; seg++) {
-		void __user *buf = iov[seg].iov_base;
-		ssize_t len = (ssize_t)iov[seg].iov_len;
-
-		/* see if we we're about to use an invalid len or if
-		 * it's about to overflow ssize_t */
-		if (len < 0) {
-			ret = -EINVAL;
-			goto out;
-		}
-		if (type >= 0
-		    && unlikely(!access_ok(buf, len))) {
-			ret = -EFAULT;
-			goto out;
-		}
-		if (len > MAX_RW_COUNT - ret) {
-			len = MAX_RW_COUNT - ret;
-			iov[seg].iov_len = len;
-		}
-		ret += len;
-	}
-out:
-	*ret_pointer = iov;
-	return ret;
-}
-
-#ifdef CONFIG_COMPAT
-ssize_t compat_rw_copy_check_uvector(int type,
-		const struct compat_iovec __user *uvector, unsigned long nr_segs,
-		unsigned long fast_segs, struct iovec *fast_pointer,
-		struct iovec **ret_pointer)
-{
-	compat_ssize_t tot_len;
-	struct iovec *iov = *ret_pointer = fast_pointer;
-	ssize_t ret = 0;
-	int seg;
-
-	/*
-	 * SuS says "The readv() function *may* fail if the iovcnt argument
-	 * was less than or equal to 0, or greater than {IOV_MAX}.  Linux has
-	 * traditionally returned zero for zero segments, so...
-	 */
-	if (nr_segs == 0)
-		goto out;
-
-	ret = -EINVAL;
-	if (nr_segs > UIO_MAXIOV)
-		goto out;
-	if (nr_segs > fast_segs) {
-		ret = -ENOMEM;
-		iov = kmalloc_array(nr_segs, sizeof(struct iovec), GFP_KERNEL);
-		if (iov == NULL)
-			goto out;
-	}
-	*ret_pointer = iov;
-
-	ret = -EFAULT;
-	if (!access_ok(uvector, nr_segs*sizeof(*uvector)))
-		goto out;
-
-	/*
-	 * Single unix specification:
-	 * We should -EINVAL if an element length is not >= 0 and fitting an
-	 * ssize_t.
-	 *
-	 * In Linux, the total length is limited to MAX_RW_COUNT, there is
-	 * no overflow possibility.
-	 */
-	tot_len = 0;
-	ret = -EINVAL;
-	for (seg = 0; seg < nr_segs; seg++) {
-		compat_uptr_t buf;
-		compat_ssize_t len;
-
-		if (__get_user(len, &uvector->iov_len) ||
-		   __get_user(buf, &uvector->iov_base)) {
-			ret = -EFAULT;
-			goto out;
-		}
-		if (len < 0)	/* size_t not fitting in compat_ssize_t .. */
-			goto out;
-		if (type >= 0 &&
-		    !access_ok(compat_ptr(buf), len)) {
-			ret = -EFAULT;
-			goto out;
-		}
-		if (len > MAX_RW_COUNT - tot_len)
-			len = MAX_RW_COUNT - tot_len;
-		tot_len += len;
-		iov->iov_base = compat_ptr(buf);
-		iov->iov_len = (compat_size_t) len;
-		uvector++;
-		iov++;
-	}
-	ret = tot_len;
-
-out:
-	return ret;
-}
-#endif
-
 static ssize_t do_iter_read(struct file *file, struct iov_iter *iter,
 		loff_t *pos, rwf_t flags)
 {
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 5e40786c8f1232..ccea9db3f72be8 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1650,6 +1650,109 @@ const void *dup_iter(struct iov_iter *new, struct iov_iter *old, gfp_t flags)
 }
 EXPORT_SYMBOL(dup_iter);
 
+/**
+ * rw_copy_check_uvector() - Copy an array of &struct iovec from userspace
+ *     into the kernel and check that it is valid.
+ *
+ * @type: One of %CHECK_IOVEC_ONLY, %READ, or %WRITE.
+ * @uvector: Pointer to the userspace array.
+ * @nr_segs: Number of elements in userspace array.
+ * @fast_segs: Number of elements in @fast_pointer.
+ * @fast_pointer: Pointer to (usually small on-stack) kernel array.
+ * @ret_pointer: (output parameter) Pointer to a variable that will point to
+ *     either @fast_pointer, a newly allocated kernel array, or NULL,
+ *     depending on which array was used.
+ *
+ * This function copies an array of &struct iovec of @nr_segs from
+ * userspace into the kernel and checks that each element is valid (e.g.
+ * it does not point to a kernel address or cause overflow by being too
+ * large, etc.).
+ *
+ * As an optimization, the caller may provide a pointer to a small
+ * on-stack array in @fast_pointer, typically %UIO_FASTIOV elements long
+ * (the size of this array, or 0 if unused, should be given in @fast_segs).
+ *
+ * @ret_pointer will always point to the array that was used, so the
+ * caller must take care not to call kfree() on it e.g. in case the
+ * @fast_pointer array was used and it was allocated on the stack.
+ *
+ * Return: The total number of bytes covered by the iovec array on success
+ *   or a negative error code on error.
+ */
+ssize_t rw_copy_check_uvector(int type, const struct iovec __user *uvector,
+		unsigned long nr_segs, unsigned long fast_segs,
+		struct iovec *fast_pointer, struct iovec **ret_pointer)
+{
+	unsigned long seg;
+	ssize_t ret;
+	struct iovec *iov = fast_pointer;
+
+	/*
+	 * SuS says "The readv() function *may* fail if the iovcnt argument
+	 * was less than or equal to 0, or greater than {IOV_MAX}.  Linux has
+	 * traditionally returned zero for zero segments, so...
+	 */
+	if (nr_segs == 0) {
+		ret = 0;
+		goto out;
+	}
+
+	/*
+	 * First get the "struct iovec" from user memory and
+	 * verify all the pointers
+	 */
+	if (nr_segs > UIO_MAXIOV) {
+		ret = -EINVAL;
+		goto out;
+	}
+	if (nr_segs > fast_segs) {
+		iov = kmalloc_array(nr_segs, sizeof(struct iovec), GFP_KERNEL);
+		if (iov == NULL) {
+			ret = -ENOMEM;
+			goto out;
+		}
+	}
+	if (copy_from_user(iov, uvector, nr_segs*sizeof(*uvector))) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+	/*
+	 * According to the Single Unix Specification we should return EINVAL
+	 * if an element length is < 0 when cast to ssize_t or if the
+	 * total length would overflow the ssize_t return value of the
+	 * system call.
+	 *
+	 * Linux caps all read/write calls to MAX_RW_COUNT, and avoids the
+	 * overflow case.
+	 */
+	ret = 0;
+	for (seg = 0; seg < nr_segs; seg++) {
+		void __user *buf = iov[seg].iov_base;
+		ssize_t len = (ssize_t)iov[seg].iov_len;
+
+		/* see if we we're about to use an invalid len or if
+		 * it's about to overflow ssize_t */
+		if (len < 0) {
+			ret = -EINVAL;
+			goto out;
+		}
+		if (type >= 0
+		    && unlikely(!access_ok(buf, len))) {
+			ret = -EFAULT;
+			goto out;
+		}
+		if (len > MAX_RW_COUNT - ret) {
+			len = MAX_RW_COUNT - ret;
+			iov[seg].iov_len = len;
+		}
+		ret += len;
+	}
+out:
+	*ret_pointer = iov;
+	return ret;
+}
+
 /**
  * import_iovec() - Copy an array of &struct iovec from userspace
  *     into the kernel, check that it is valid, and initialize a new
@@ -1695,6 +1798,79 @@ EXPORT_SYMBOL(import_iovec);
 #ifdef CONFIG_COMPAT
 #include <linux/compat.h>
 
+ssize_t compat_rw_copy_check_uvector(int type,
+		const struct compat_iovec __user *uvector,
+		unsigned long nr_segs, unsigned long fast_segs,
+		struct iovec *fast_pointer, struct iovec **ret_pointer)
+{
+	compat_ssize_t tot_len;
+	struct iovec *iov = *ret_pointer = fast_pointer;
+	ssize_t ret = 0;
+	int seg;
+
+	/*
+	 * SuS says "The readv() function *may* fail if the iovcnt argument
+	 * was less than or equal to 0, or greater than {IOV_MAX}.  Linux has
+	 * traditionally returned zero for zero segments, so...
+	 */
+	if (nr_segs == 0)
+		goto out;
+
+	ret = -EINVAL;
+	if (nr_segs > UIO_MAXIOV)
+		goto out;
+	if (nr_segs > fast_segs) {
+		ret = -ENOMEM;
+		iov = kmalloc_array(nr_segs, sizeof(struct iovec), GFP_KERNEL);
+		if (iov == NULL)
+			goto out;
+	}
+	*ret_pointer = iov;
+
+	ret = -EFAULT;
+	if (!access_ok(uvector, nr_segs*sizeof(*uvector)))
+		goto out;
+
+	/*
+	 * Single unix specification:
+	 * We should -EINVAL if an element length is not >= 0 and fitting an
+	 * ssize_t.
+	 *
+	 * In Linux, the total length is limited to MAX_RW_COUNT, there is
+	 * no overflow possibility.
+	 */
+	tot_len = 0;
+	ret = -EINVAL;
+	for (seg = 0; seg < nr_segs; seg++) {
+		compat_uptr_t buf;
+		compat_ssize_t len;
+
+		if (__get_user(len, &uvector->iov_len) ||
+		   __get_user(buf, &uvector->iov_base)) {
+			ret = -EFAULT;
+			goto out;
+		}
+		if (len < 0)	/* size_t not fitting in compat_ssize_t .. */
+			goto out;
+		if (type >= 0 &&
+		    !access_ok(compat_ptr(buf), len)) {
+			ret = -EFAULT;
+			goto out;
+		}
+		if (len > MAX_RW_COUNT - tot_len)
+			len = MAX_RW_COUNT - tot_len;
+		tot_len += len;
+		iov->iov_base = compat_ptr(buf);
+		iov->iov_len = (compat_size_t) len;
+		uvector++;
+		iov++;
+	}
+	ret = tot_len;
+
+out:
+	return ret;
+}
+
 ssize_t compat_import_iovec(int type,
 		const struct compat_iovec __user * uvector,
 		unsigned nr_segs, unsigned fast_segs,
-- 
2.28.0

