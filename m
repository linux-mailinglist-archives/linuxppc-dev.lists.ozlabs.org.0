Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42407460CA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 16:31:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QNMy2JPTzDrg7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 00:31:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="eiq/xb+U"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QNK33yhHzDrfv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 00:29:09 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9103420866;
 Fri, 14 Jun 2019 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560522547;
 bh=cY7qQ7vl0+egy4AL6ZDqmTDm4h2jklkJUrmVOLowupA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eiq/xb+UdPxWqpEOmZmONEuKxa+SiiyvP9eYhCH3UgRBUIvfH0GN9HEM0EyX5u+nV
 RUbpqwvtSYeCYQXjqaywHQzWTqhJFoHyZwqfs05GdA56xHZCJTfDvE9I0jozAGTEDQ
 FNqGKrn/YTKGOEjp3fGLFj/D0RUOKHFpybtaugVk=
Date: Fri, 14 Jun 2019 16:29:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Breno =?iso-8859-1?Q?Leit=E3o?= <leitao@debian.org>,
 Nayna Jain <nayna@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH v2] crypto: nx: no need to check return value of
 debugfs_create functions
Message-ID: <20190614142904.GA11066@kroah.com>
References: <20190614135031.GA5809@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190614135031.GA5809@kroah.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Also, there is no need to store the individual debugfs file names,
especially as the whole directiry is deleted at once, so remove the
unneeded structure entirely.

Cc: "Breno Leitão" <leitao@debian.org>
Cc: Nayna Jain <nayna@linux.ibm.com>
Cc: Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: fixed build error found by kbuild

 drivers/crypto/nx/nx.c         |  4 +-
 drivers/crypto/nx/nx.h         | 12 +-----
 drivers/crypto/nx/nx_debugfs.c | 71 +++++++++++-----------------------
 3 files changed, 26 insertions(+), 61 deletions(-)

diff --git a/drivers/crypto/nx/nx.c b/drivers/crypto/nx/nx.c
index 3a5e31be4764..20b5e276f184 100644
--- a/drivers/crypto/nx/nx.c
+++ b/drivers/crypto/nx/nx.c
@@ -581,9 +581,7 @@ static int nx_register_algs(void)
 
 	memset(&nx_driver.stats, 0, sizeof(struct nx_stats));
 
-	rc = NX_DEBUGFS_INIT(&nx_driver);
-	if (rc)
-		goto out;
+	NX_DEBUGFS_INIT(&nx_driver);
 
 	nx_driver.of.status = NX_OKAY;
 
diff --git a/drivers/crypto/nx/nx.h b/drivers/crypto/nx/nx.h
index c3e54af18645..c6b5a3be02be 100644
--- a/drivers/crypto/nx/nx.h
+++ b/drivers/crypto/nx/nx.h
@@ -76,20 +76,12 @@ struct nx_stats {
 	atomic_t last_error_pid;
 };
 
-struct nx_debugfs {
-	struct dentry *dfs_root;
-	struct dentry *dfs_aes_ops, *dfs_aes_bytes;
-	struct dentry *dfs_sha256_ops, *dfs_sha256_bytes;
-	struct dentry *dfs_sha512_ops, *dfs_sha512_bytes;
-	struct dentry *dfs_errors, *dfs_last_error, *dfs_last_error_pid;
-};
-
 struct nx_crypto_driver {
 	struct nx_stats    stats;
 	struct nx_of       of;
 	struct vio_dev    *viodev;
 	struct vio_driver  viodriver;
-	struct nx_debugfs  dfs;
+	struct dentry     *dfs_root;
 };
 
 #define NX_GCM4106_NONCE_LEN		(4)
@@ -177,7 +169,7 @@ struct nx_sg *nx_walk_and_build(struct nx_sg *, unsigned int,
 #define NX_DEBUGFS_INIT(drv)	nx_debugfs_init(drv)
 #define NX_DEBUGFS_FINI(drv)	nx_debugfs_fini(drv)
 
-int nx_debugfs_init(struct nx_crypto_driver *);
+void nx_debugfs_init(struct nx_crypto_driver *);
 void nx_debugfs_fini(struct nx_crypto_driver *);
 #else
 #define NX_DEBUGFS_INIT(drv)	(0)
diff --git a/drivers/crypto/nx/nx_debugfs.c b/drivers/crypto/nx/nx_debugfs.c
index 7ab2e8dcd9b4..add1d8d0d23c 100644
--- a/drivers/crypto/nx/nx_debugfs.c
+++ b/drivers/crypto/nx/nx_debugfs.c
@@ -42,62 +42,37 @@
  * Documentation/ABI/testing/debugfs-pfo-nx-crypto
  */
 
-int nx_debugfs_init(struct nx_crypto_driver *drv)
+void nx_debugfs_init(struct nx_crypto_driver *drv)
 {
-	struct nx_debugfs *dfs = &drv->dfs;
+	struct dentry *root;
 
-	dfs->dfs_root = debugfs_create_dir(NX_NAME, NULL);
+	root = debugfs_create_dir(NX_NAME, NULL);
+	drv->dfs_root = root;
 
-	dfs->dfs_aes_ops =
-		debugfs_create_u32("aes_ops",
-				   S_IRUSR | S_IRGRP | S_IROTH,
-				   dfs->dfs_root, (u32 *)&drv->stats.aes_ops);
-	dfs->dfs_sha256_ops =
-		debugfs_create_u32("sha256_ops",
-				   S_IRUSR | S_IRGRP | S_IROTH,
-				   dfs->dfs_root,
-				   (u32 *)&drv->stats.sha256_ops);
-	dfs->dfs_sha512_ops =
-		debugfs_create_u32("sha512_ops",
-				   S_IRUSR | S_IRGRP | S_IROTH,
-				   dfs->dfs_root,
-				   (u32 *)&drv->stats.sha512_ops);
-	dfs->dfs_aes_bytes =
-		debugfs_create_u64("aes_bytes",
-				   S_IRUSR | S_IRGRP | S_IROTH,
-				   dfs->dfs_root,
-				   (u64 *)&drv->stats.aes_bytes);
-	dfs->dfs_sha256_bytes =
-		debugfs_create_u64("sha256_bytes",
-				   S_IRUSR | S_IRGRP | S_IROTH,
-				   dfs->dfs_root,
-				   (u64 *)&drv->stats.sha256_bytes);
-	dfs->dfs_sha512_bytes =
-		debugfs_create_u64("sha512_bytes",
-				   S_IRUSR | S_IRGRP | S_IROTH,
-				   dfs->dfs_root,
-				   (u64 *)&drv->stats.sha512_bytes);
-	dfs->dfs_errors =
-		debugfs_create_u32("errors",
-				   S_IRUSR | S_IRGRP | S_IROTH,
-				   dfs->dfs_root, (u32 *)&drv->stats.errors);
-	dfs->dfs_last_error =
-		debugfs_create_u32("last_error",
-				   S_IRUSR | S_IRGRP | S_IROTH,
-				   dfs->dfs_root,
-				   (u32 *)&drv->stats.last_error);
-	dfs->dfs_last_error_pid =
-		debugfs_create_u32("last_error_pid",
-				   S_IRUSR | S_IRGRP | S_IROTH,
-				   dfs->dfs_root,
-				   (u32 *)&drv->stats.last_error_pid);
-	return 0;
+	debugfs_create_u32("aes_ops", S_IRUSR | S_IRGRP | S_IROTH,
+			   root, (u32 *)&drv->stats.aes_ops);
+	debugfs_create_u32("sha256_ops", S_IRUSR | S_IRGRP | S_IROTH,
+			   root, (u32 *)&drv->stats.sha256_ops);
+	debugfs_create_u32("sha512_ops", S_IRUSR | S_IRGRP | S_IROTH,
+			   root, (u32 *)&drv->stats.sha512_ops);
+	debugfs_create_u64("aes_bytes", S_IRUSR | S_IRGRP | S_IROTH,
+			   root, (u64 *)&drv->stats.aes_bytes);
+	debugfs_create_u64("sha256_bytes", S_IRUSR | S_IRGRP | S_IROTH,
+			   root, (u64 *)&drv->stats.sha256_bytes);
+	debugfs_create_u64("sha512_bytes", S_IRUSR | S_IRGRP | S_IROTH,
+			   root, (u64 *)&drv->stats.sha512_bytes);
+	debugfs_create_u32("errors", S_IRUSR | S_IRGRP | S_IROTH,
+			   root, (u32 *)&drv->stats.errors);
+	debugfs_create_u32("last_error", S_IRUSR | S_IRGRP | S_IROTH,
+			   root, (u32 *)&drv->stats.last_error);
+	debugfs_create_u32("last_error_pid", S_IRUSR | S_IRGRP | S_IROTH,
+			   root, (u32 *)&drv->stats.last_error_pid);
 }
 
 void
 nx_debugfs_fini(struct nx_crypto_driver *drv)
 {
-	debugfs_remove_recursive(drv->dfs.dfs_root);
+	debugfs_remove_recursive(drv->dfs_root);
 }
 
 #endif
-- 
2.22.0

