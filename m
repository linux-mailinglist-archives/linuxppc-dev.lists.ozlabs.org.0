Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE3725C30D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 16:43:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj3T96Fh6zDqnc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 00:43:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+0324f78733eae8ed4bec+6220+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=SbA4Ermb; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj31b0PRHzDr3m
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 00:22:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=GwBdpIiwC2/H13uoaD81joKeq/bh8CR8vbkN01NmQb8=; b=SbA4ErmbdCRIGV1PaNDyOgDFPM
 WOOiPDFGt5XBXfY5jP3ztB9vrJDDiTR3S831moFSwBWUyfChZFA1BRQyvkGlC4vN6lIlYL31/eVpQ
 4AZ/cMaZgHPOscMzV+WC/lo7EDhbN6cT4yHXmo8UUQdHbIdKsugCkPPCeHoLQmyy2ajyyl1HCObXN
 dj+uFNX/JF/U5HPn9nHMlQ9Pywqvz2sdtEcNQUADBxGUgwOgUPSXjjzUvlPRHTvAFfIzHtMEXNFst
 f548siR/l2sI0jQVLbHQdGVTZCCgvbgDJNNoQ5+zgVnaQl8a2szvK8Yw6jk21Qfeo4BxY81HFnhg5
 HmT3L4Cw==;
Received: from [2001:4bb8:184:af1:c70:4a89:bc61:2] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDq8V-0004aL-IH; Thu, 03 Sep 2020 14:22:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org
Subject: [PATCH 03/14] proc: add a read_iter method to proc proc_ops
Date: Thu,  3 Sep 2020 16:22:31 +0200
Message-Id: <20200903142242.925828-4-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903142242.925828-1-hch@lst.de>
References: <20200903142242.925828-1-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Alexey Dobriyan <adobriyan@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This will allow proc files to implement iter read semantics.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/proc/inode.c         | 53 ++++++++++++++++++++++++++++++++++++++---
 include/linux/proc_fs.h |  1 +
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/fs/proc/inode.c b/fs/proc/inode.c
index 93dd2045737504..58c075e2a452d6 100644
--- a/fs/proc/inode.c
+++ b/fs/proc/inode.c
@@ -297,6 +297,21 @@ static loff_t proc_reg_llseek(struct file *file, loff_t offset, int whence)
 	return rv;
 }
 
+static ssize_t proc_reg_read_iter(struct kiocb *iocb, struct iov_iter *iter)
+{
+	struct proc_dir_entry *pde = PDE(file_inode(iocb->ki_filp));
+	ssize_t ret;
+
+	if (pde_is_permanent(pde))
+		return pde->proc_ops->proc_read_iter(iocb, iter);
+
+	if (!use_pde(pde))
+		return -EIO;
+	ret = pde->proc_ops->proc_read_iter(iocb, iter);
+	unuse_pde(pde);
+	return ret;
+}
+
 static ssize_t pde_read(struct proc_dir_entry *pde, struct file *file, char __user *buf, size_t count, loff_t *ppos)
 {
 	typeof_member(struct proc_ops, proc_read) read;
@@ -578,6 +593,18 @@ static const struct file_operations proc_reg_file_ops = {
 	.release	= proc_reg_release,
 };
 
+static const struct file_operations proc_iter_file_ops = {
+	.llseek		= proc_reg_llseek,
+	.read_iter	= proc_reg_read_iter,
+	.write		= proc_reg_write,
+	.poll		= proc_reg_poll,
+	.unlocked_ioctl	= proc_reg_unlocked_ioctl,
+	.mmap		= proc_reg_mmap,
+	.get_unmapped_area = proc_reg_get_unmapped_area,
+	.open		= proc_reg_open,
+	.release	= proc_reg_release,
+};
+
 #ifdef CONFIG_COMPAT
 static const struct file_operations proc_reg_file_ops_compat = {
 	.llseek		= proc_reg_llseek,
@@ -591,6 +618,19 @@ static const struct file_operations proc_reg_file_ops_compat = {
 	.open		= proc_reg_open,
 	.release	= proc_reg_release,
 };
+
+static const struct file_operations proc_iter_file_ops_compat = {
+	.llseek		= proc_reg_llseek,
+	.read_iter	= proc_reg_read_iter,
+	.write		= proc_reg_write,
+	.poll		= proc_reg_poll,
+	.unlocked_ioctl	= proc_reg_unlocked_ioctl,
+	.compat_ioctl	= proc_reg_compat_ioctl,
+	.mmap		= proc_reg_mmap,
+	.get_unmapped_area = proc_reg_get_unmapped_area,
+	.open		= proc_reg_open,
+	.release	= proc_reg_release,
+};
 #endif
 
 static void proc_put_link(void *p)
@@ -642,10 +682,17 @@ struct inode *proc_get_inode(struct super_block *sb, struct proc_dir_entry *de)
 
 	if (S_ISREG(inode->i_mode)) {
 		inode->i_op = de->proc_iops;
-		inode->i_fop = &proc_reg_file_ops;
+		if (de->proc_ops->proc_read_iter)
+			inode->i_fop = &proc_iter_file_ops;
+		else
+			inode->i_fop = &proc_reg_file_ops;
 #ifdef CONFIG_COMPAT
-		if (de->proc_ops->proc_compat_ioctl)
-			inode->i_fop = &proc_reg_file_ops_compat;
+		if (de->proc_ops->proc_compat_ioctl) {
+			if (de->proc_ops->proc_read_iter)
+				inode->i_fop = &proc_iter_file_ops_compat;
+			else
+				inode->i_fop = &proc_reg_file_ops_compat;
+		}
 #endif
 	} else if (S_ISDIR(inode->i_mode)) {
 		inode->i_op = de->proc_iops;
diff --git a/include/linux/proc_fs.h b/include/linux/proc_fs.h
index 2df965cd09742d..270cab43ca3dad 100644
--- a/include/linux/proc_fs.h
+++ b/include/linux/proc_fs.h
@@ -30,6 +30,7 @@ struct proc_ops {
 	unsigned int proc_flags;
 	int	(*proc_open)(struct inode *, struct file *);
 	ssize_t	(*proc_read)(struct file *, char __user *, size_t, loff_t *);
+	ssize_t (*proc_read_iter)(struct kiocb *, struct iov_iter *);
 	ssize_t	(*proc_write)(struct file *, const char __user *, size_t, loff_t *);
 	loff_t	(*proc_lseek)(struct file *, loff_t, int);
 	int	(*proc_release)(struct inode *, struct file *);
-- 
2.28.0

