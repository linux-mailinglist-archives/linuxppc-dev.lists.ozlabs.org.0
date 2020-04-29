Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 936861BD58B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 09:18:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bqc84gKLzDr6q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 17:18:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BqH91T9qzDqNt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 17:03:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=Dlf3xkP3; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 49BqH82kT8z9sSl; Wed, 29 Apr 2020 17:03:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1588143812; bh=HxCWIIobHMn+H9/ckOe42yZdj7I6ZyqGTOIXmqfn1jk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dlf3xkP3RlCvbr6qlyOFHv2BmvvijWLR0fLgc089+qr0pjFjSJe1UmVQEkfHIFTNT
 tJdMkOtVg/+p9kkpJ5CG4OhmtRdHkefU/o3seO3CJKCWW5pjsKc1Z4NNRczL0OL1x1
 OQe6kQYlhh8C66RYri8sxxPXDuTpBOyfWZ5oN38E7a/4r/PH7q5BnkX2VNDWtMObpw
 WWMLjyjMiImZSAOPs1Lds5NZ10IVq2pGTXIzIYvmo9GkzyXPjMcqP3iQIokpnGpbkK
 DXaxK+LzI/7fAcLTjcbL1obBiHkpVUuWgiAFVqySqPcq9BfOZ5AAIn8O0Je26a/gzn
 wYuUqo0m0fbIA==
From: Jeremy Kerr <jk@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/spufs: stop using access_ok
Date: Wed, 29 Apr 2020 15:03:03 +0800
Message-Id: <20200429070303.17599-2-jk@ozlabs.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429070303.17599-1-jk@ozlabs.org>
References: <20200429070303.17599-1-jk@ozlabs.org>
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
Cc: Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christoph Hellwig <hch@lst.de>

Just use the proper non __-prefixed get/put_user variants where that is
not done yet.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 arch/powerpc/platforms/cell/spufs/file.c | 42 +++++-------------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spufs/file.c b/arch/powerpc/platforms/cell/spufs/file.c
index b4e1ef650b40..cd7d10f27fad 100644
--- a/arch/powerpc/platforms/cell/spufs/file.c
+++ b/arch/powerpc/platforms/cell/spufs/file.c
@@ -590,17 +590,12 @@ static ssize_t spufs_mbox_read(struct file *file, char __user *buf,
 			size_t len, loff_t *pos)
 {
 	struct spu_context *ctx = file->private_data;
-	u32 mbox_data, __user *udata;
+	u32 mbox_data, __user *udata = (void __user *)buf;
 	ssize_t count;
 
 	if (len < 4)
 		return -EINVAL;
 
-	if (!access_ok(buf, len))
-		return -EFAULT;
-
-	udata = (void __user *)buf;
-
 	count = spu_acquire(ctx);
 	if (count)
 		return count;
@@ -616,7 +611,7 @@ static ssize_t spufs_mbox_read(struct file *file, char __user *buf,
 		 * but still need to return the data we have
 		 * read successfully so far.
 		 */
-		ret = __put_user(mbox_data, udata);
+		ret = put_user(mbox_data, udata);
 		if (ret) {
 			if (!count)
 				count = -EFAULT;
@@ -698,17 +693,12 @@ static ssize_t spufs_ibox_read(struct file *file, char __user *buf,
 			size_t len, loff_t *pos)
 {
 	struct spu_context *ctx = file->private_data;
-	u32 ibox_data, __user *udata;
+	u32 ibox_data, __user *udata = (void __user *)buf;
 	ssize_t count;
 
 	if (len < 4)
 		return -EINVAL;
 
-	if (!access_ok(buf, len))
-		return -EFAULT;
-
-	udata = (void __user *)buf;
-
 	count = spu_acquire(ctx);
 	if (count)
 		goto out;
@@ -727,7 +717,7 @@ static ssize_t spufs_ibox_read(struct file *file, char __user *buf,
 	}
 
 	/* if we can't write at all, return -EFAULT */
-	count = __put_user(ibox_data, udata);
+	count = put_user(ibox_data, udata);
 	if (count)
 		goto out_unlock;
 
@@ -741,7 +731,7 @@ static ssize_t spufs_ibox_read(struct file *file, char __user *buf,
 		 * but still need to return the data we have
 		 * read successfully so far.
 		 */
-		ret = __put_user(ibox_data, udata);
+		ret = put_user(ibox_data, udata);
 		if (ret)
 			break;
 	}
@@ -836,17 +826,13 @@ static ssize_t spufs_wbox_write(struct file *file, const char __user *buf,
 			size_t len, loff_t *pos)
 {
 	struct spu_context *ctx = file->private_data;
-	u32 wbox_data, __user *udata;
+	u32 wbox_data, __user *udata = (void __user *)buf;
 	ssize_t count;
 
 	if (len < 4)
 		return -EINVAL;
 
-	udata = (void __user *)buf;
-	if (!access_ok(buf, len))
-		return -EFAULT;
-
-	if (__get_user(wbox_data, udata))
+	if (get_user(wbox_data, udata))
 		return -EFAULT;
 
 	count = spu_acquire(ctx);
@@ -873,7 +859,7 @@ static ssize_t spufs_wbox_write(struct file *file, const char __user *buf,
 	/* write as much as possible */
 	for (count = 4, udata++; (count + 4) <= len; count += 4, udata++) {
 		int ret;
-		ret = __get_user(wbox_data, udata);
+		ret = get_user(wbox_data, udata);
 		if (ret)
 			break;
 
@@ -1982,9 +1968,6 @@ static ssize_t spufs_mbox_info_read(struct file *file, char __user *buf,
 	u32 stat, data;
 	int ret;
 
-	if (!access_ok(buf, len))
-		return -EFAULT;
-
 	ret = spu_acquire_saved(ctx);
 	if (ret)
 		return ret;
@@ -2028,9 +2011,6 @@ static ssize_t spufs_ibox_info_read(struct file *file, char __user *buf,
 	u32 stat, data;
 	int ret;
 
-	if (!access_ok(buf, len))
-		return -EFAULT;
-
 	ret = spu_acquire_saved(ctx);
 	if (ret)
 		return ret;
@@ -2082,9 +2062,6 @@ static ssize_t spufs_wbox_info_read(struct file *file, char __user *buf,
 	u32 data[ARRAY_SIZE(ctx->csa.spu_mailbox_data)];
 	int ret, count;
 
-	if (!access_ok(buf, len))
-		return -EFAULT;
-
 	ret = spu_acquire_saved(ctx);
 	if (ret)
 		return ret;
@@ -2143,9 +2120,6 @@ static ssize_t spufs_dma_info_read(struct file *file, char __user *buf,
 	struct spu_dma_info info;
 	int ret;
 
-	if (!access_ok(buf, len))
-		return -EFAULT;
-
 	ret = spu_acquire_saved(ctx);
 	if (ret)
 		return ret;
-- 
2.17.1

