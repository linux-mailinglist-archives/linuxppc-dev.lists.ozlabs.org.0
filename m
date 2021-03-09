Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C50332B17
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 16:55:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw0DB67nxz3d4w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 02:55:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=UqioM+JO;
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
 header.s=casper.20170209 header.b=UqioM+JO; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw0CD2Lr0z30N8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 02:54:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=KGWSD1qzjw8jWYcVTd5k5Vux/eD/dPBH9TiN6yLVseE=; b=UqioM+JOtMrCZY+99WNlohS+n6
 D8sXLpSvt07nrEhE9GYHmdMTmjw4DL1jAclk+Ci+jnYGdn+IEIwZ0S8fpKJ2whNwkyjmljxBPh47g
 cMsKfNPA0fujb0XrwseHmDs/2m816gk63sTddN9x9X9wgRohgavTvx8tm6KQtpAyIG7cxz0OK5MKP
 PgIH6/WtutbbPjhpmXZVF7C1m9jWVkHGrdDIIbgcgrxaJ3JqKKlPb7/Swf8vZxBO2cCE67ILF7rVn
 MmRlVgFU4oQqmQ/DBvwu33p+M9TPPMt61GrQMTQJl2w3aFf67m+MltPsTuxfefjtilLeB/ZfnOnxB
 lkLQIpmA==;
Received: from [2001:4bb8:180:9884:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lJegA-000lLy-1I; Tue, 09 Mar 2021 15:53:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: make alloc_anon_inode more useful
Date: Tue,  9 Mar 2021 16:53:39 +0100
Message-Id: <20210309155348.974875-1-hch@lst.de>
X-Mailer: git-send-email 2.30.1
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

Hi all,

this series first renames the existing alloc_anon_inode to
alloc_anon_inode_sb to clearly mark it as requiring a superblock.

It then adds a new alloc_anon_inode that works on the anon_inode
file system super block, thus removing tons of boilerplate code.

The few remainig callers of alloc_anon_inode_sb all use alloc_file_pseudo
later, but might also be ripe for some cleanup.

Diffstat:
 arch/powerpc/platforms/pseries/cmm.c |   27 +-------------
 drivers/dma-buf/dma-buf.c            |    2 -
 drivers/gpu/drm/drm_drv.c            |   64 +----------------------------------
 drivers/misc/cxl/api.c               |    2 -
 drivers/misc/vmw_balloon.c           |   24 +------------
 drivers/scsi/cxlflash/ocxl_hw.c      |    2 -
 drivers/virtio/virtio_balloon.c      |   30 +---------------
 fs/aio.c                             |    2 -
 fs/anon_inodes.c                     |   15 +++++++-
 fs/libfs.c                           |    2 -
 include/linux/anon_inodes.h          |    1 
 include/linux/fs.h                   |    2 -
 kernel/resource.c                    |   30 ++--------------
 mm/z3fold.c                          |   38 +-------------------
 mm/zsmalloc.c                        |   48 +-------------------------
 15 files changed, 39 insertions(+), 250 deletions(-)
