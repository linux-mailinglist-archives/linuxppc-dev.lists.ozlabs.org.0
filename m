Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4A925C282
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 16:27:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj36G3rHDzDr6P
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 00:27:02 +1000 (AEST)
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
 header.s=casper.20170209 header.b=KT+oozOc; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj31Y5YzYzDr3k
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 00:22:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=rSb0BL01Ey1fqtHAuOSKbe3w6r8nDxlokUvLOIV+cDE=; b=KT+oozOcmlzKunmiiHT+7RSbLJ
 gavWA9RkFz1P2aj1gpddXMWCOPrlOgFZgn4hA6S1M4p8FygVV8uLc6oVLVdIdzudykwHVoOkF2Wzp
 y4CN6+hoansmAFrPY6AcwRlPW2AYCFAG2hVuPOCHgYk9sMriwkwFnPJiKXXa/+f29JxRVYESVJilJ
 yro5pzGVFiYakxduDdi7cG5eLmyL8MSiW3yaSWrBYgWmOz0MpQKOhV3qjfYYYQRIUYzeTH/kA9Ou6
 ke5i0/VMjflVHFxMBa1jtGpOoAqFVtzP5nH9zYLeue3nJYnASu8pHhLeNb2npgfemID2x+DEVJ+Pe
 P43farcQ==;
Received: from [2001:4bb8:184:af1:c70:4a89:bc61:2] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDq8U-0004aE-Co; Thu, 03 Sep 2020 14:22:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org
Subject: [PATCH 02/14] proc: cleanup the compat vs no compat file ops
Date: Thu,  3 Sep 2020 16:22:30 +0200
Message-Id: <20200903142242.925828-3-hch@lst.de>
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

Instead of providing a special no-compat version provide a special
compat version for operations with ->compat_ioctl.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/proc/inode.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/proc/inode.c b/fs/proc/inode.c
index 016b1302cbabc0..93dd2045737504 100644
--- a/fs/proc/inode.c
+++ b/fs/proc/inode.c
@@ -572,9 +572,6 @@ static const struct file_operations proc_reg_file_ops = {
 	.write		= proc_reg_write,
 	.poll		= proc_reg_poll,
 	.unlocked_ioctl	= proc_reg_unlocked_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl	= proc_reg_compat_ioctl,
-#endif
 	.mmap		= proc_reg_mmap,
 	.get_unmapped_area = proc_reg_get_unmapped_area,
 	.open		= proc_reg_open,
@@ -582,12 +579,13 @@ static const struct file_operations proc_reg_file_ops = {
 };
 
 #ifdef CONFIG_COMPAT
-static const struct file_operations proc_reg_file_ops_no_compat = {
+static const struct file_operations proc_reg_file_ops_compat = {
 	.llseek		= proc_reg_llseek,
 	.read		= proc_reg_read,
 	.write		= proc_reg_write,
 	.poll		= proc_reg_poll,
 	.unlocked_ioctl	= proc_reg_unlocked_ioctl,
+	.compat_ioctl	= proc_reg_compat_ioctl,
 	.mmap		= proc_reg_mmap,
 	.get_unmapped_area = proc_reg_get_unmapped_area,
 	.open		= proc_reg_open,
@@ -646,8 +644,8 @@ struct inode *proc_get_inode(struct super_block *sb, struct proc_dir_entry *de)
 		inode->i_op = de->proc_iops;
 		inode->i_fop = &proc_reg_file_ops;
 #ifdef CONFIG_COMPAT
-		if (!de->proc_ops->proc_compat_ioctl)
-			inode->i_fop = &proc_reg_file_ops_no_compat;
+		if (de->proc_ops->proc_compat_ioctl)
+			inode->i_fop = &proc_reg_file_ops_compat;
 #endif
 	} else if (S_ISDIR(inode->i_mode)) {
 		inode->i_op = de->proc_iops;
-- 
2.28.0

