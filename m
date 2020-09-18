Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B31826FDD4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 15:09:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtDgb2GtbzDqsb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 23:09:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+1a7941a35ce833a0e493+6235+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=asfKxViQ; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtD8k6s5dzDqkC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 22:45:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7X3/qUs2y75UUlnvdA2vy1FAPs/IUNMhWXsjmEB0AzE=; b=asfKxViQlq1FD+ot58IVT8gZ94
 dLEzCslIpXlEHDVY3AVvzeQWEaxRhvHNXoigPkGAIjK5bFpDNasQOxqoNgyABCmM6qqkkt51q64Dy
 U/CK/Xw07dd/60lKM1KHzeS66iYZd7bcglc4ZdnqLXf8QC6JOmLB6SzsLsGPLZ4sGBlzYzOE9RXSt
 DxcJwzh9T4OKXpp4G4seXuWqwOoYAwiUhcD6w3brKbgCkdH84kpJRUaaIBc95IuKO6lijNRqToZbP
 HZ0MF5B2UTpvywzo+XWFmaKqS/cx8n+7oEw8/8/UxjpLmR3ZmNR4wU7av4yWOn2KaD4wu1ecjNXE6
 nQMpYohw==;
Received: from [80.122.85.238] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJFlr-0008Us-Db; Fri, 18 Sep 2020 12:45:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 9/9] security/keys: remove compat_keyctl_instantiate_key_iov
Date: Fri, 18 Sep 2020 14:45:33 +0200
Message-Id: <20200918124533.3487701-10-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918124533.3487701-1-hch@lst.de>
References: <20200918124533.3487701-1-hch@lst.de>
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
 linux-scsi@vger.kernel.org, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that import_iovec handles compat iovecs, the native version of
keyctl_instantiate_key_iov can be used for the compat case as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 security/keys/compat.c   | 36 ++----------------------------------
 security/keys/internal.h |  5 -----
 security/keys/keyctl.c   |  2 +-
 3 files changed, 3 insertions(+), 40 deletions(-)

diff --git a/security/keys/compat.c b/security/keys/compat.c
index 7ae531db031cf8..1545efdca56227 100644
--- a/security/keys/compat.c
+++ b/security/keys/compat.c
@@ -11,38 +11,6 @@
 #include <linux/slab.h>
 #include "internal.h"
 
-/*
- * Instantiate a key with the specified compatibility multipart payload and
- * link the key into the destination keyring if one is given.
- *
- * The caller must have the appropriate instantiation permit set for this to
- * work (see keyctl_assume_authority).  No other permissions are required.
- *
- * If successful, 0 will be returned.
- */
-static long compat_keyctl_instantiate_key_iov(
-	key_serial_t id,
-	const struct compat_iovec __user *_payload_iov,
-	unsigned ioc,
-	key_serial_t ringid)
-{
-	struct iovec iovstack[UIO_FASTIOV], *iov = iovstack;
-	struct iov_iter from;
-	long ret;
-
-	if (!_payload_iov)
-		ioc = 0;
-
-	ret = import_iovec(WRITE, (const struct iovec __user *)_payload_iov,
-			   ioc, ARRAY_SIZE(iovstack), &iov, &from);
-	if (ret < 0)
-		return ret;
-
-	ret = keyctl_instantiate_key_common(id, &from, ringid);
-	kfree(iov);
-	return ret;
-}
-
 /*
  * The key control system call, 32-bit compatibility version for 64-bit archs
  */
@@ -113,8 +81,8 @@ COMPAT_SYSCALL_DEFINE5(keyctl, u32, option,
 		return keyctl_reject_key(arg2, arg3, arg4, arg5);
 
 	case KEYCTL_INSTANTIATE_IOV:
-		return compat_keyctl_instantiate_key_iov(
-			arg2, compat_ptr(arg3), arg4, arg5);
+		return keyctl_instantiate_key_iov(arg2, compat_ptr(arg3), arg4,
+						  arg5);
 
 	case KEYCTL_INVALIDATE:
 		return keyctl_invalidate_key(arg2);
diff --git a/security/keys/internal.h b/security/keys/internal.h
index 338a526cbfa516..9b9cf3b6fcbb4d 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -262,11 +262,6 @@ extern long keyctl_instantiate_key_iov(key_serial_t,
 				       const struct iovec __user *,
 				       unsigned, key_serial_t);
 extern long keyctl_invalidate_key(key_serial_t);
-
-struct iov_iter;
-extern long keyctl_instantiate_key_common(key_serial_t,
-					  struct iov_iter *,
-					  key_serial_t);
 extern long keyctl_restrict_keyring(key_serial_t id,
 				    const char __user *_type,
 				    const char __user *_restriction);
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 9febd37a168fd0..e26bbccda7ccee 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -1164,7 +1164,7 @@ static int keyctl_change_reqkey_auth(struct key *key)
  *
  * If successful, 0 will be returned.
  */
-long keyctl_instantiate_key_common(key_serial_t id,
+static long keyctl_instantiate_key_common(key_serial_t id,
 				   struct iov_iter *from,
 				   key_serial_t ringid)
 {
-- 
2.28.0

