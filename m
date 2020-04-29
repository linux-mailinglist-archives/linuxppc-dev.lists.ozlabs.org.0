Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE01B1BD487
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:17:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BpGJ5WJWzDr31
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:17:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BpCX4jQGzDr1r
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:15:20 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 18D8168CF0; Wed, 29 Apr 2020 08:15:15 +0200 (CEST)
Date: Wed, 29 Apr 2020 08:15:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [RFC PATCH] powerpc/spufs: fix copy_to_user while atomic
Message-ID: <20200429061514.GD30946@lst.de>
References: <20200427200626.1622060-2-hch@lst.de>
 <20200428120207.15728-1-jk@ozlabs.org> <20200428171133.GA17445@lst.de>
 <e1ebea36b162e8a3b4b24ecbc1051f8081ff5e53.camel@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1ebea36b162e8a3b4b24ecbc1051f8081ff5e53.camel@ozlabs.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 "Eric W . Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

And another one that should go on top of this one to address Al's other
compaint:

---
From 1b7ced3de0b3a4addec61f61ac5278c3ff141657 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Wed, 22 Apr 2020 09:05:30 +0200
Subject: powerpc/spufs: stop using access_ok

Just use the proper non __-prefixed get/put_user variants where that is
not done yet.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/platforms/cell/spufs/file.c | 42 +++++-------------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/platforms/cell/spufs/file.c b/arch/powerpc/platforms/cell/spufs/file.c
index b4e1ef650b406..cd7d10f27fad1 100644
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
2.26.2

