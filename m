Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB18272949
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 17:01:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw71b4fQKzDqV8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 01:01:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+776a1a22abff015854b2+6238+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=GRkfTBxW; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw6Qr0jdLzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 00:34:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=puJFCdMF2FXbv89uAHf/KkyLCkpGKdSCiHzE06eX0/Y=; b=GRkfTBxWaYN59mWczbVBJZ/J4z
 kVM8Nphlbf3FY02zkGWWBVM283NPs2K9y+IDVdwyxNN1Q6a4B7YoCyWtJodiottCcy6XpP96dRyGn
 JHkp6fow0Ism2aY5WYKFck/rP6z+BMXBmYaJqqKRA5DWZwKptXaUZhs1y+Gx9Hcs78ge5sNfRyKIN
 h2HYTgdyzISCw5GbBnBiQ0zAOMx4TZdmJQTPfx5COcVblaZe9D1Cqm0YVjyEpK04tgDaqtazmJ5UR
 ftg8Mk3Zj7g+8AAriBQApIZOIJYX0rTvWCnxH8RgTXNwePT8RLDRBDPDY+Cv19f1nEHzB8vcryJzp
 d7oTPRIQ==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKMtZ-0007rC-EL; Mon, 21 Sep 2020 14:34:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 02/11] mm: call import_iovec() instead of
 rw_copy_check_uvector() in process_vm_rw()
Date: Mon, 21 Sep 2020 16:34:25 +0200
Message-Id: <20200921143434.707844-3-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921143434.707844-1-hch@lst.de>
References: <20200921143434.707844-1-hch@lst.de>
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

This is the only direct call of rw_copy_check_uvector().  Removing it
will allow rw_copy_check_uvector() to be inlined into import_iovec(),
while only paying a minor price by setting up an otherwise unused
iov_iter in the process_vm_readv/process_vm_writev syscalls that aren't
in a super hot path.

Signed-off-by: David Laight <david.laight@aculab.com>
[hch: expanded the commit log, pass CHECK_IOVEC_ONLY instead of 0 for the
      compat case, handle CHECK_IOVEC_ONLY in iov_iter_init]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/iov_iter.c         |  2 +-
 mm/process_vm_access.c | 33 ++++++++++++++++++---------------
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 5e40786c8f1232..db54588406dfae 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -443,7 +443,7 @@ void iov_iter_init(struct iov_iter *i, unsigned int direction,
 			const struct iovec *iov, unsigned long nr_segs,
 			size_t count)
 {
-	WARN_ON(direction & ~(READ | WRITE));
+	WARN_ON(direction & ~(READ | WRITE | CHECK_IOVEC_ONLY));
 	direction &= READ | WRITE;
 
 	/* It will get better.  Eventually... */
diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
index 29c052099affdc..40cd502c337534 100644
--- a/mm/process_vm_access.c
+++ b/mm/process_vm_access.c
@@ -264,7 +264,7 @@ static ssize_t process_vm_rw(pid_t pid,
 	struct iovec iovstack_r[UIO_FASTIOV];
 	struct iovec *iov_l = iovstack_l;
 	struct iovec *iov_r = iovstack_r;
-	struct iov_iter iter;
+	struct iov_iter iter_l, iter_r;
 	ssize_t rc;
 	int dir = vm_write ? WRITE : READ;
 
@@ -272,23 +272,25 @@ static ssize_t process_vm_rw(pid_t pid,
 		return -EINVAL;
 
 	/* Check iovecs */
-	rc = import_iovec(dir, lvec, liovcnt, UIO_FASTIOV, &iov_l, &iter);
+	rc = import_iovec(dir, lvec, liovcnt, UIO_FASTIOV, &iov_l, &iter_l);
 	if (rc < 0)
 		return rc;
-	if (!iov_iter_count(&iter))
+	if (!iov_iter_count(&iter_l))
 		goto free_iovecs;
 
-	rc = rw_copy_check_uvector(CHECK_IOVEC_ONLY, rvec, riovcnt, UIO_FASTIOV,
-				   iovstack_r, &iov_r);
+	rc = import_iovec(CHECK_IOVEC_ONLY, rvec, riovcnt, UIO_FASTIOV, &iov_r,
+			  &iter_r);
 	if (rc <= 0)
 		goto free_iovecs;
 
-	rc = process_vm_rw_core(pid, &iter, iov_r, riovcnt, flags, vm_write);
+	rc = process_vm_rw_core(pid, &iter_l, iter_r.iov, iter_r.nr_segs,
+				flags, vm_write);
 
 free_iovecs:
 	if (iov_r != iovstack_r)
 		kfree(iov_r);
-	kfree(iov_l);
+	if (iov_l != iovstack_l)
+		kfree(iov_l);
 
 	return rc;
 }
@@ -322,30 +324,31 @@ compat_process_vm_rw(compat_pid_t pid,
 	struct iovec iovstack_r[UIO_FASTIOV];
 	struct iovec *iov_l = iovstack_l;
 	struct iovec *iov_r = iovstack_r;
-	struct iov_iter iter;
+	struct iov_iter iter_l, iter_r;
 	ssize_t rc = -EFAULT;
 	int dir = vm_write ? WRITE : READ;
 
 	if (flags != 0)
 		return -EINVAL;
 
-	rc = compat_import_iovec(dir, lvec, liovcnt, UIO_FASTIOV, &iov_l, &iter);
+	rc = compat_import_iovec(dir, lvec, liovcnt, UIO_FASTIOV, &iov_l, &iter_l);
 	if (rc < 0)
 		return rc;
-	if (!iov_iter_count(&iter))
+	if (!iov_iter_count(&iter_l))
 		goto free_iovecs;
-	rc = compat_rw_copy_check_uvector(CHECK_IOVEC_ONLY, rvec, riovcnt,
-					  UIO_FASTIOV, iovstack_r,
-					  &iov_r);
+	rc = compat_import_iovec(CHECK_IOVEC_ONLY, rvec, riovcnt, UIO_FASTIOV,
+				 &iov_r, &iter_r);
 	if (rc <= 0)
 		goto free_iovecs;
 
-	rc = process_vm_rw_core(pid, &iter, iov_r, riovcnt, flags, vm_write);
+	rc = process_vm_rw_core(pid, &iter_l, iter_r.iov, iter_r.nr_segs,
+				flags, vm_write);
 
 free_iovecs:
 	if (iov_r != iovstack_r)
 		kfree(iov_r);
-	kfree(iov_l);
+	if (iov_l != iovstack_l)
+		kfree(iov_l);
 	return rc;
 }
 
-- 
2.28.0

