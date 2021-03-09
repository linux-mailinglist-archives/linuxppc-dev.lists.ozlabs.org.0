Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 373CB332B4F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 16:58:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw0HY1dDXz3dtp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 02:58:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=WHyxP41M;
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
 header.s=casper.20170209 header.b=WHyxP41M; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw0FG34FZz3dT1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 02:56:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=IFk47HqYrcljU8sgV3Szm3kSO/BjefEBgYu1y49MYsE=; b=WHyxP41MA1s5vmF0W/htokhaBx
 JJRExXLLcZF4nmAarls1d3HuzNwpxmbC2mhuQ2AjlEBa/HE9uab75LwxnBHvSlkMbCIWybzSODn2N
 nI1H1JvK6Iir6AOGJrydVaRgu6VKcvBTzTMpXy9rIa7WbTAufbU1gTxOWVjZCYgJMpuoZTM/mo4PI
 uRhHJt00wwUBMfOwTrEx++Btjp1eJXNPixwQbRg7gtFznHkapP3JdMEA9Bcm9iGgeFNorbolw8FTk
 j7Z0M3Q+So7C7evvGwEeGHmpDkMRkIYZTYMWqzUeucdgD9LBE/o0m4JdRWf9Xk52M7m+GAD4SKJAt
 L4oOHUZw==;
Received: from [2001:4bb8:180:9884:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lJehy-000lWp-8R; Tue, 09 Mar 2021 15:55:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 8/9] z3fold: remove the z3fold file system
Date: Tue,  9 Mar 2021 16:53:47 +0100
Message-Id: <20210309155348.974875-9-hch@lst.de>
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
 mm/z3fold.c | 38 ++------------------------------------
 1 file changed, 2 insertions(+), 36 deletions(-)

diff --git a/mm/z3fold.c b/mm/z3fold.c
index e7cd9298b221f5..e0749a3d8987de 100644
--- a/mm/z3fold.c
+++ b/mm/z3fold.c
@@ -23,6 +23,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/anon_inodes.h>
 #include <linux/atomic.h>
 #include <linux/sched.h>
 #include <linux/cpumask.h>
@@ -345,38 +346,10 @@ static inline void free_handle(unsigned long handle, struct z3fold_header *zhdr)
 	}
 }
 
-static int z3fold_init_fs_context(struct fs_context *fc)
-{
-	return init_pseudo(fc, Z3FOLD_MAGIC) ? 0 : -ENOMEM;
-}
-
-static struct file_system_type z3fold_fs = {
-	.name		= "z3fold",
-	.init_fs_context = z3fold_init_fs_context,
-	.kill_sb	= kill_anon_super,
-};
-
-static struct vfsmount *z3fold_mnt;
-static int z3fold_mount(void)
-{
-	int ret = 0;
-
-	z3fold_mnt = kern_mount(&z3fold_fs);
-	if (IS_ERR(z3fold_mnt))
-		ret = PTR_ERR(z3fold_mnt);
-
-	return ret;
-}
-
-static void z3fold_unmount(void)
-{
-	kern_unmount(z3fold_mnt);
-}
-
 static const struct address_space_operations z3fold_aops;
 static int z3fold_register_migration(struct z3fold_pool *pool)
 {
-	pool->inode = alloc_anon_inode_sb(z3fold_mnt->mnt_sb);
+	pool->inode = alloc_anon_inode();
 	if (IS_ERR(pool->inode)) {
 		pool->inode = NULL;
 		return 1;
@@ -1787,22 +1760,15 @@ MODULE_ALIAS("zpool-z3fold");
 
 static int __init init_z3fold(void)
 {
-	int ret;
-
 	/* Make sure the z3fold header is not larger than the page size */
 	BUILD_BUG_ON(ZHDR_SIZE_ALIGNED > PAGE_SIZE);
-	ret = z3fold_mount();
-	if (ret)
-		return ret;
 
 	zpool_register_driver(&z3fold_zpool_driver);
-
 	return 0;
 }
 
 static void __exit exit_z3fold(void)
 {
-	z3fold_unmount();
 	zpool_unregister_driver(&z3fold_zpool_driver);
 }
 
-- 
2.30.1

