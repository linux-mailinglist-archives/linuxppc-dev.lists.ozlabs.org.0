Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C41333435
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 05:07:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwJSk2lSSz3cLG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 15:07:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ldgU6n02;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=ldgU6n02; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwJSD4rwtz3cG9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 15:07:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MZP04mmRYHSUMNN7Bbpif73MByRe1GqD/bRFFteUyfw=; b=ldgU6n02jJhSaG5jfG/yFXoBjb
 jqO0xwes2kpfTznTIioIJ6OLRsJ2Rf5BKvl+WRQqfq3ithfHHVTOrh+OiOVFLlkCnr6A6dP6sA/8g
 Wx51dHg8mloZlZdg/ttj4KY3k1GlayTwG64TE/tu12bbfG6O36fKXrVbls/MysL7RmCmrJuMq9H77
 VBewHZHaWWnTDDLy4jE9fWXCsINUJACeVhrwMp5LBIjUn60fkuv0edawFzc9/FSWl1eoHTIxAvExX
 cxW2jUeNPKjL+VpiGPOtLh+akLXAvSlyp6mUR091Ti2VOzOqnxnANFHSVocMPKcksPzQ0Z/4ngUfM
 3R7+aFkQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lJq6T-002MKD-Jm; Wed, 10 Mar 2021 04:05:49 +0000
Date: Wed, 10 Mar 2021 04:05:45 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: make alloc_anon_inode more useful
Message-ID: <20210310040545.GM3479805@casper.infradead.org>
References: <20210309155348.974875-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309155348.974875-1-hch@lst.de>
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Minchan Kim <minchan@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Nadav Amit <namit@vmware.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Nitin Gupta <ngupta@vflare.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 09, 2021 at 04:53:39PM +0100, Christoph Hellwig wrote:
> this series first renames the existing alloc_anon_inode to
> alloc_anon_inode_sb to clearly mark it as requiring a superblock.
> 
> It then adds a new alloc_anon_inode that works on the anon_inode
> file system super block, thus removing tons of boilerplate code.
> 
> The few remainig callers of alloc_anon_inode_sb all use alloc_file_pseudo
> later, but might also be ripe for some cleanup.

On a somewhat related note, could I get you to look at
drivers/video/fbdev/core/fb_defio.c?

As far as I can tell, there's no need for fb_deferred_io_aops to exist.
We could just set file->f_mapping->a_ops to NULL, and set_page_dirty()
would do the exact same thing this code does (except it would get the
return value correct).

But maybe that would make something else go wrong that distinguishes
between page->mapping being NULL and page->mapping->a_ops->foo being NULL?
Completely untested patch ...

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index a591d291b231..441ec31d3e4d 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -151,17 +151,6 @@ static const struct vm_operations_struct fb_deferred_io_vm_ops = {
 	.page_mkwrite	= fb_deferred_io_mkwrite,
 };
 
-static int fb_deferred_io_set_page_dirty(struct page *page)
-{
-	if (!PageDirty(page))
-		SetPageDirty(page);
-	return 0;
-}
-
-static const struct address_space_operations fb_deferred_io_aops = {
-	.set_page_dirty = fb_deferred_io_set_page_dirty,
-};
-
 int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	vma->vm_ops = &fb_deferred_io_vm_ops;
@@ -212,14 +201,6 @@ void fb_deferred_io_init(struct fb_info *info)
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_init);
 
-void fb_deferred_io_open(struct fb_info *info,
-			 struct inode *inode,
-			 struct file *file)
-{
-	file->f_mapping->a_ops = &fb_deferred_io_aops;
-}
-EXPORT_SYMBOL_GPL(fb_deferred_io_open);
-
 void fb_deferred_io_cleanup(struct fb_info *info)
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 06f5805de2de..c4ba76359f22 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1415,10 +1415,7 @@ __releases(&info->lock)
 		if (res)
 			module_put(info->fbops->owner);
 	}
-#ifdef CONFIG_FB_DEFERRED_IO
-	if (info->fbdefio)
-		fb_deferred_io_open(info, inode, file);
-#endif
+	file->f_mapping->a_ops = NULL;
 out:
 	unlock_fb_info(info);
 	if (res)
diff --git a/include/linux/fb.h b/include/linux/fb.h
index ecfbcc0553a5..a8dccd23c249 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -659,9 +659,6 @@ static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
 /* drivers/video/fb_defio.c */
 int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma);
 extern void fb_deferred_io_init(struct fb_info *info);
-extern void fb_deferred_io_open(struct fb_info *info,
-				struct inode *inode,
-				struct file *file);
 extern void fb_deferred_io_cleanup(struct fb_info *info);
 extern int fb_deferred_io_fsync(struct file *file, loff_t start,
 				loff_t end, int datasync);
