Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7605332B38
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 16:57:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw0G93fxDz3dWT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 02:57:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=U2dY1Yox;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+5fd0a10d8842976b880f+6407+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=U2dY1Yox; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw0DP1z8jz3dJy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 02:55:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=3M8hBLIawJHMtUGgys5VeJcEPDN2yS9O0RGnqufBgKI=; b=U2dY1YoxC/q1JkvxYuErcUmM7G
 yNLzZEFPUD/PpwSMC0sxlmTrm15YRnKHKJAt+fMXoP9qEB/cTAxoI5Pm6jwZZk+bXrHectQuAsiFC
 rX1aVSPbDujtJRpARm7H+EDSahwdvGZgm8tKkGQEqHEF57ViiLlCwMAkXxyCyYQO/nmP1hGHolJS5
 aHHrsNWOUhNj6riEwaOc9ADfSNG2qUcuWpHQnzqa0IYvDrRP3H7eJdz57HO8orK9CyOiPihYKpRWJ
 lwcNNXwHH8HGXZTyH602DtYjkOGdhM7VkOAiZZgjli5xWKnsO06znGdhAsbUh5UFfx9JQ9Ikwrkbz
 Eeiwq1jA==;
Received: from [2001:4bb8:180:9884:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lJehA-000lO8-7a; Tue, 09 Mar 2021 15:54:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 5/9] vmw_balloon: remove the balloon-vmware file system
Date: Tue,  9 Mar 2021 16:53:44 +0100
Message-Id: <20210309155348.974875-6-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309155348.974875-1-hch@lst.de>
References: <20210309155348.974875-1-hch@lst.de>
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, David Hildenbrand <david@redhat.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Minchan Kim <minchan@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Nadav Amit <namit@vmware.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Just use the generic anon_inode file system.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/misc/vmw_balloon.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 5d057a05ddbee8..be4be32f858253 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -16,6 +16,7 @@
 //#define DEBUG
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/anon_inodes.h>
 #include <linux/types.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -1735,20 +1736,6 @@ static inline void vmballoon_debugfs_exit(struct vmballoon *b)
 
 
 #ifdef CONFIG_BALLOON_COMPACTION
-
-static int vmballoon_init_fs_context(struct fs_context *fc)
-{
-	return init_pseudo(fc, BALLOON_VMW_MAGIC) ? 0 : -ENOMEM;
-}
-
-static struct file_system_type vmballoon_fs = {
-	.name           	= "balloon-vmware",
-	.init_fs_context	= vmballoon_init_fs_context,
-	.kill_sb        	= kill_anon_super,
-};
-
-static struct vfsmount *vmballoon_mnt;
-
 /**
  * vmballoon_migratepage() - migrates a balloon page.
  * @b_dev_info: balloon device information descriptor.
@@ -1878,8 +1865,6 @@ static void vmballoon_compaction_deinit(struct vmballoon *b)
 		iput(b->b_dev_info.inode);
 
 	b->b_dev_info.inode = NULL;
-	kern_unmount(vmballoon_mnt);
-	vmballoon_mnt = NULL;
 }
 
 /**
@@ -1895,13 +1880,8 @@ static void vmballoon_compaction_deinit(struct vmballoon *b)
  */
 static __init int vmballoon_compaction_init(struct vmballoon *b)
 {
-	vmballoon_mnt = kern_mount(&vmballoon_fs);
-	if (IS_ERR(vmballoon_mnt))
-		return PTR_ERR(vmballoon_mnt);
-
 	b->b_dev_info.migratepage = vmballoon_migratepage;
-	b->b_dev_info.inode = alloc_anon_inode_sb(vmballoon_mnt->mnt_sb);
-
+	b->b_dev_info.inode = alloc_anon_inode();
 	if (IS_ERR(b->b_dev_info.inode))
 		return PTR_ERR(b->b_dev_info.inode);
 
-- 
2.30.1

