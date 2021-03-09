Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A159B332B41
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 16:57:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw0Gd2tTGz3dj1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 02:57:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=tOG8dHR4;
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
 header.s=casper.20170209 header.b=tOG8dHR4; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw0Ds02hWz3dNb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 02:56:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=YCa5USJ2jm70Z2UsFo8WsaOurKZNnFvLpmzM+RUjH7Q=; b=tOG8dHR47ixjkPXc3KpuPHwBJN
 9VFDsIBs0iNabrNwVXnkHpEUdRE0Xw1VihxeUy1+Fk4KYBtVgcEksHwzR18mV15ZWijtKj5WiAj/5
 7KOcX17CSbvl+aU8mkaAl7PIwJV8dwwIDpxTeRudfOZASKqLd2oSxE8ndV2Mhje3p8opZFyB+5AY6
 3WCbnTsjVJ3yqS6hJgSLnrgXWlagzm2/jm1eIMY/fHzgbKF2asFhyKisFuX10Qwx8gBqZ5of7CTH3
 ZHAvbig1z/NdDSn0Hj3VaXLltwy6s7eRmlDs/uoLyCyDcM4moI+4Km8Zi3CtzTIP32H3qV1JoiGlq
 YC8O2rHA==;
Received: from [2001:4bb8:180:9884:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lJehF-000lP8-0R; Tue, 09 Mar 2021 15:55:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 6/9] virtio_balloon: remove the balloon-kvm file system
Date: Tue,  9 Mar 2021 16:53:45 +0100
Message-Id: <20210309155348.974875-7-hch@lst.de>
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
 drivers/virtio/virtio_balloon.c | 30 +++---------------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index cae76ee5bdd688..1efb890cd3ff09 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -6,6 +6,7 @@
  *  Copyright 2008 Rusty Russell IBM Corporation
  */
 
+#include <linux/anon_inodes.h>
 #include <linux/virtio.h>
 #include <linux/virtio_balloon.h>
 #include <linux/swap.h>
@@ -42,10 +43,6 @@
 	(1 << (VIRTIO_BALLOON_HINT_BLOCK_ORDER + PAGE_SHIFT))
 #define VIRTIO_BALLOON_HINT_BLOCK_PAGES (1 << VIRTIO_BALLOON_HINT_BLOCK_ORDER)
 
-#ifdef CONFIG_BALLOON_COMPACTION
-static struct vfsmount *balloon_mnt;
-#endif
-
 enum virtio_balloon_vq {
 	VIRTIO_BALLOON_VQ_INFLATE,
 	VIRTIO_BALLOON_VQ_DEFLATE,
@@ -805,18 +802,6 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 
 	return MIGRATEPAGE_SUCCESS;
 }
-
-static int balloon_init_fs_context(struct fs_context *fc)
-{
-	return init_pseudo(fc, BALLOON_KVM_MAGIC) ? 0 : -ENOMEM;
-}
-
-static struct file_system_type balloon_fs = {
-	.name           = "balloon-kvm",
-	.init_fs_context = balloon_init_fs_context,
-	.kill_sb        = kill_anon_super,
-};
-
 #endif /* CONFIG_BALLOON_COMPACTION */
 
 static unsigned long shrink_free_pages(struct virtio_balloon *vb,
@@ -909,17 +894,11 @@ static int virtballoon_probe(struct virtio_device *vdev)
 		goto out_free_vb;
 
 #ifdef CONFIG_BALLOON_COMPACTION
-	balloon_mnt = kern_mount(&balloon_fs);
-	if (IS_ERR(balloon_mnt)) {
-		err = PTR_ERR(balloon_mnt);
-		goto out_del_vqs;
-	}
-
 	vb->vb_dev_info.migratepage = virtballoon_migratepage;
-	vb->vb_dev_info.inode = alloc_anon_inode_sb(balloon_mnt->mnt_sb);
+	vb->vb_dev_info.inode = alloc_anon_inode();
 	if (IS_ERR(vb->vb_dev_info.inode)) {
 		err = PTR_ERR(vb->vb_dev_info.inode);
-		goto out_kern_unmount;
+		goto out_del_vqs;
 	}
 	vb->vb_dev_info.inode->i_mapping->a_ops = &balloon_aops;
 #endif
@@ -1016,8 +995,6 @@ static int virtballoon_probe(struct virtio_device *vdev)
 out_iput:
 #ifdef CONFIG_BALLOON_COMPACTION
 	iput(vb->vb_dev_info.inode);
-out_kern_unmount:
-	kern_unmount(balloon_mnt);
 out_del_vqs:
 #endif
 	vdev->config->del_vqs(vdev);
@@ -1070,7 +1047,6 @@ static void virtballoon_remove(struct virtio_device *vdev)
 	if (vb->vb_dev_info.inode)
 		iput(vb->vb_dev_info.inode);
 
-	kern_unmount(balloon_mnt);
 #endif
 	kfree(vb);
 }
-- 
2.30.1

