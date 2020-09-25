Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E217D277FB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 06:59:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByKTG449RzDqmT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 14:59:30 +1000 (AEST)
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
 header.s=casper.20170209 header.b=ltDau4pr; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByKJs0mvfzDqfk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Sep 2020 14:52:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=XLI4wWnTND6XjkdS+V7znPEFtJ3sYq4EUOFrFZbEOM4=; b=ltDau4prtIYwpMEhyb+cdqxWTK
 GQAYP8faWYGCeQ5y9rXhu4VrSOuWAm8vpUTAaftV7VWf+gl59R8pGUhMazJ6EwpoQ++j9Ib+x6ibK
 S6A7SODjHRYDevm7+f3DVFp2RheB04CY4/1cAtKGPpyqv8WK+Kgxef40BUZwoQwL5r7/pIT1j9rou
 AOawdNyXcs7aXV/ZSST8iyc7ZCAA4+Ogm3x1GnUgJhgy9bAcFVkJ0cMiOO7TyZJwAo94yS2SU3UeL
 AobxOj3YCPWJwKilFg5y8sTwcEZ8UObu76Bj3XdaY9tnU/TNtGH5YipPXhrIj7eTT7jQnIkdj0D6J
 vVvtSS7Q==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLfi6-0002qp-CZ; Fri, 25 Sep 2020 04:51:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 5/9] fs: remove various compat readv/writev helpers
Date: Fri, 25 Sep 2020 06:51:42 +0200
Message-Id: <20200925045146.1283714-6-hch@lst.de>
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
 David Laight <David.Laight@aculab.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that import_iovec handles compat iovecs as well, all the duplicated
code in the compat readv/writev helpers is not needed.  Remove them
and switch the compat syscall handlers to use the native helpers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/read_write.c        | 179 +++++++----------------------------------
 include/linux/compat.h |  20 ++---
 2 files changed, 40 insertions(+), 159 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index 0a68037580b455..eab427b7cc0a3f 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -1068,226 +1068,107 @@ SYSCALL_DEFINE6(pwritev2, unsigned long, fd, const struct iovec __user *, vec,
 	return do_pwritev(fd, vec, vlen, pos, flags);
 }
 
+/*
+ * Various compat syscalls.  Note that they all pretend to take a native
+ * iovec - import_iovec will properly treat those as compat_iovecs based on
+ * in_compat_syscall().
+ */
 #ifdef CONFIG_COMPAT
-static size_t compat_readv(struct file *file,
-			   const struct compat_iovec __user *vec,
-			   unsigned long vlen, loff_t *pos, rwf_t flags)
-{
-	struct iovec iovstack[UIO_FASTIOV];
-	struct iovec *iov = iovstack;
-	struct iov_iter iter;
-	ssize_t ret;
-
-	ret = import_iovec(READ, (const struct iovec __user *)vec, vlen,
-			   UIO_FASTIOV, &iov, &iter);
-	if (ret >= 0) {
-		ret = do_iter_read(file, &iter, pos, flags);
-		kfree(iov);
-	}
-	if (ret > 0)
-		add_rchar(current, ret);
-	inc_syscr(current);
-	return ret;
-}
-
-static size_t do_compat_readv(compat_ulong_t fd,
-				 const struct compat_iovec __user *vec,
-				 compat_ulong_t vlen, rwf_t flags)
-{
-	struct fd f = fdget_pos(fd);
-	ssize_t ret;
-	loff_t pos;
-
-	if (!f.file)
-		return -EBADF;
-	pos = f.file->f_pos;
-	ret = compat_readv(f.file, vec, vlen, &pos, flags);
-	if (ret >= 0)
-		f.file->f_pos = pos;
-	fdput_pos(f);
-	return ret;
-
-}
-
 COMPAT_SYSCALL_DEFINE3(readv, compat_ulong_t, fd,
-		const struct compat_iovec __user *,vec,
+		const struct iovec __user *, vec,
 		compat_ulong_t, vlen)
 {
-	return do_compat_readv(fd, vec, vlen, 0);
-}
-
-static long do_compat_preadv64(unsigned long fd,
-				  const struct compat_iovec __user *vec,
-				  unsigned long vlen, loff_t pos, rwf_t flags)
-{
-	struct fd f;
-	ssize_t ret;
-
-	if (pos < 0)
-		return -EINVAL;
-	f = fdget(fd);
-	if (!f.file)
-		return -EBADF;
-	ret = -ESPIPE;
-	if (f.file->f_mode & FMODE_PREAD)
-		ret = compat_readv(f.file, vec, vlen, &pos, flags);
-	fdput(f);
-	return ret;
+	return do_readv(fd, vec, vlen, 0);
 }
 
 #ifdef __ARCH_WANT_COMPAT_SYS_PREADV64
 COMPAT_SYSCALL_DEFINE4(preadv64, unsigned long, fd,
-		const struct compat_iovec __user *,vec,
+		const struct iovec __user *, vec,
 		unsigned long, vlen, loff_t, pos)
 {
-	return do_compat_preadv64(fd, vec, vlen, pos, 0);
+	return do_preadv(fd, vec, vlen, pos, 0);
 }
 #endif
 
 COMPAT_SYSCALL_DEFINE5(preadv, compat_ulong_t, fd,
-		const struct compat_iovec __user *,vec,
+		const struct iovec __user *, vec,
 		compat_ulong_t, vlen, u32, pos_low, u32, pos_high)
 {
 	loff_t pos = ((loff_t)pos_high << 32) | pos_low;
 
-	return do_compat_preadv64(fd, vec, vlen, pos, 0);
+	return do_preadv(fd, vec, vlen, pos, 0);
 }
 
 #ifdef __ARCH_WANT_COMPAT_SYS_PREADV64V2
 COMPAT_SYSCALL_DEFINE5(preadv64v2, unsigned long, fd,
-		const struct compat_iovec __user *,vec,
+		const struct iovec __user *, vec,
 		unsigned long, vlen, loff_t, pos, rwf_t, flags)
 {
 	if (pos == -1)
-		return do_compat_readv(fd, vec, vlen, flags);
-
-	return do_compat_preadv64(fd, vec, vlen, pos, flags);
+		return do_readv(fd, vec, vlen, flags);
+	return do_preadv(fd, vec, vlen, pos, flags);
 }
 #endif
 
 COMPAT_SYSCALL_DEFINE6(preadv2, compat_ulong_t, fd,
-		const struct compat_iovec __user *,vec,
+		const struct iovec __user *, vec,
 		compat_ulong_t, vlen, u32, pos_low, u32, pos_high,
 		rwf_t, flags)
 {
 	loff_t pos = ((loff_t)pos_high << 32) | pos_low;
 
 	if (pos == -1)
-		return do_compat_readv(fd, vec, vlen, flags);
-
-	return do_compat_preadv64(fd, vec, vlen, pos, flags);
-}
-
-static size_t compat_writev(struct file *file,
-			    const struct compat_iovec __user *vec,
-			    unsigned long vlen, loff_t *pos, rwf_t flags)
-{
-	struct iovec iovstack[UIO_FASTIOV];
-	struct iovec *iov = iovstack;
-	struct iov_iter iter;
-	ssize_t ret;
-
-	ret = import_iovec(WRITE, (const struct iovec __user *)vec, vlen,
-			   UIO_FASTIOV, &iov, &iter);
-	if (ret >= 0) {
-		file_start_write(file);
-		ret = do_iter_write(file, &iter, pos, flags);
-		file_end_write(file);
-		kfree(iov);
-	}
-	if (ret > 0)
-		add_wchar(current, ret);
-	inc_syscw(current);
-	return ret;
-}
-
-static size_t do_compat_writev(compat_ulong_t fd,
-				  const struct compat_iovec __user* vec,
-				  compat_ulong_t vlen, rwf_t flags)
-{
-	struct fd f = fdget_pos(fd);
-	ssize_t ret;
-	loff_t pos;
-
-	if (!f.file)
-		return -EBADF;
-	pos = f.file->f_pos;
-	ret = compat_writev(f.file, vec, vlen, &pos, flags);
-	if (ret >= 0)
-		f.file->f_pos = pos;
-	fdput_pos(f);
-	return ret;
+		return do_readv(fd, vec, vlen, flags);
+	return do_preadv(fd, vec, vlen, pos, flags);
 }
 
 COMPAT_SYSCALL_DEFINE3(writev, compat_ulong_t, fd,
-		const struct compat_iovec __user *, vec,
+		const struct iovec __user *, vec,
 		compat_ulong_t, vlen)
 {
-	return do_compat_writev(fd, vec, vlen, 0);
-}
-
-static long do_compat_pwritev64(unsigned long fd,
-				   const struct compat_iovec __user *vec,
-				   unsigned long vlen, loff_t pos, rwf_t flags)
-{
-	struct fd f;
-	ssize_t ret;
-
-	if (pos < 0)
-		return -EINVAL;
-	f = fdget(fd);
-	if (!f.file)
-		return -EBADF;
-	ret = -ESPIPE;
-	if (f.file->f_mode & FMODE_PWRITE)
-		ret = compat_writev(f.file, vec, vlen, &pos, flags);
-	fdput(f);
-	return ret;
+	return do_writev(fd, vec, vlen, 0);
 }
 
 #ifdef __ARCH_WANT_COMPAT_SYS_PWRITEV64
 COMPAT_SYSCALL_DEFINE4(pwritev64, unsigned long, fd,
-		const struct compat_iovec __user *,vec,
+		const struct iovec __user *, vec,
 		unsigned long, vlen, loff_t, pos)
 {
-	return do_compat_pwritev64(fd, vec, vlen, pos, 0);
+	return do_pwritev(fd, vec, vlen, pos, 0);
 }
 #endif
 
 COMPAT_SYSCALL_DEFINE5(pwritev, compat_ulong_t, fd,
-		const struct compat_iovec __user *,vec,
+		const struct iovec __user *,vec,
 		compat_ulong_t, vlen, u32, pos_low, u32, pos_high)
 {
 	loff_t pos = ((loff_t)pos_high << 32) | pos_low;
 
-	return do_compat_pwritev64(fd, vec, vlen, pos, 0);
+	return do_pwritev(fd, vec, vlen, pos, 0);
 }
 
 #ifdef __ARCH_WANT_COMPAT_SYS_PWRITEV64V2
 COMPAT_SYSCALL_DEFINE5(pwritev64v2, unsigned long, fd,
-		const struct compat_iovec __user *,vec,
+		const struct iovec __user *, vec,
 		unsigned long, vlen, loff_t, pos, rwf_t, flags)
 {
 	if (pos == -1)
-		return do_compat_writev(fd, vec, vlen, flags);
-
-	return do_compat_pwritev64(fd, vec, vlen, pos, flags);
+		return do_writev(fd, vec, vlen, flags);
+	return do_pwritev(fd, vec, vlen, pos, flags);
 }
 #endif
 
 COMPAT_SYSCALL_DEFINE6(pwritev2, compat_ulong_t, fd,
-		const struct compat_iovec __user *,vec,
+		const struct iovec __user *,vec,
 		compat_ulong_t, vlen, u32, pos_low, u32, pos_high, rwf_t, flags)
 {
 	loff_t pos = ((loff_t)pos_high << 32) | pos_low;
 
 	if (pos == -1)
-		return do_compat_writev(fd, vec, vlen, flags);
-
-	return do_compat_pwritev64(fd, vec, vlen, pos, flags);
+		return do_writev(fd, vec, vlen, flags);
+	return do_pwritev(fd, vec, vlen, pos, flags);
 }
-
-#endif
+#endif /* CONFIG_COMPAT */
 
 static ssize_t do_sendfile(int out_fd, int in_fd, loff_t *ppos,
 		  	   size_t count, loff_t max)
diff --git a/include/linux/compat.h b/include/linux/compat.h
index b930de791ff16b..306ea7e1172d8d 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -546,25 +546,25 @@ asmlinkage long compat_sys_getdents(unsigned int fd,
 /* fs/read_write.c */
 asmlinkage long compat_sys_lseek(unsigned int, compat_off_t, unsigned int);
 asmlinkage ssize_t compat_sys_readv(compat_ulong_t fd,
-		const struct compat_iovec __user *vec, compat_ulong_t vlen);
+		const struct iovec __user *vec, compat_ulong_t vlen);
 asmlinkage ssize_t compat_sys_writev(compat_ulong_t fd,
-		const struct compat_iovec __user *vec, compat_ulong_t vlen);
+		const struct iovec __user *vec, compat_ulong_t vlen);
 /* No generic prototype for pread64 and pwrite64 */
 asmlinkage ssize_t compat_sys_preadv(compat_ulong_t fd,
-		const struct compat_iovec __user *vec,
+		const struct iovec __user *vec,
 		compat_ulong_t vlen, u32 pos_low, u32 pos_high);
 asmlinkage ssize_t compat_sys_pwritev(compat_ulong_t fd,
-		const struct compat_iovec __user *vec,
+		const struct iovec __user *vec,
 		compat_ulong_t vlen, u32 pos_low, u32 pos_high);
 #ifdef __ARCH_WANT_COMPAT_SYS_PREADV64
 asmlinkage long compat_sys_preadv64(unsigned long fd,
-		const struct compat_iovec __user *vec,
+		const struct iovec __user *vec,
 		unsigned long vlen, loff_t pos);
 #endif
 
 #ifdef __ARCH_WANT_COMPAT_SYS_PWRITEV64
 asmlinkage long compat_sys_pwritev64(unsigned long fd,
-		const struct compat_iovec __user *vec,
+		const struct iovec __user *vec,
 		unsigned long vlen, loff_t pos);
 #endif
 
@@ -800,20 +800,20 @@ asmlinkage long compat_sys_execveat(int dfd, const char __user *filename,
 		     const compat_uptr_t __user *argv,
 		     const compat_uptr_t __user *envp, int flags);
 asmlinkage ssize_t compat_sys_preadv2(compat_ulong_t fd,
-		const struct compat_iovec __user *vec,
+		const struct iovec __user *vec,
 		compat_ulong_t vlen, u32 pos_low, u32 pos_high, rwf_t flags);
 asmlinkage ssize_t compat_sys_pwritev2(compat_ulong_t fd,
-		const struct compat_iovec __user *vec,
+		const struct iovec __user *vec,
 		compat_ulong_t vlen, u32 pos_low, u32 pos_high, rwf_t flags);
 #ifdef __ARCH_WANT_COMPAT_SYS_PREADV64V2
 asmlinkage long  compat_sys_preadv64v2(unsigned long fd,
-		const struct compat_iovec __user *vec,
+		const struct iovec __user *vec,
 		unsigned long vlen, loff_t pos, rwf_t flags);
 #endif
 
 #ifdef __ARCH_WANT_COMPAT_SYS_PWRITEV64V2
 asmlinkage long compat_sys_pwritev64v2(unsigned long fd,
-		const struct compat_iovec __user *vec,
+		const struct iovec __user *vec,
 		unsigned long vlen, loff_t pos, rwf_t flags);
 #endif
 
-- 
2.28.0

