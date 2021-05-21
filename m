Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA7B38BE57
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 07:52:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmbNw4ltjz3c0H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 15:52:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qYec4TV3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+940d4f53d1157bf1ee93+6480+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=qYec4TV3; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmbMv3wQTz2yyv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 15:51:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=1uf84BS8Q7NSBXg1yQR5EC+qaCg2ZgLYmuXoDkaPjCQ=; b=qYec4TV3LzKaP2n3ES94XtwLuN
 Rl9ETp00pxgXHWMiVaqU1NEHjsNwBCAops8oVhfDa5QRHrJNSDaCyti+sJNn9rvf1uYQ4GA3DB0Ay
 esSC0cXIU4CdBCqSiNTamsYa4lzWuaGSed8x/wHvY7MdpjXgBIZn9QNf9s12VopHptNQ1EM12ISrT
 hM1YZI/vDanDsnHTFFMGFC3HnZQJPaZqKiEjRjgXepy1pmMTbEztkloYN/Ou7kNDoHST4Fhsl9hNE
 VGbBjm4DHc6wZjNzBVhkjnxdDik0YPHERe6nTK4ik7Pt9SDxqpIkw+czTDWp9qLqL4XzR0WKvEHUH
 XEcT4yBA==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1ljy47-00Gpwf-GU; Fri, 21 May 2021 05:51:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, Jim Paris <jim@jtan.com>,
 Joshua Morris <josh.h.morris@us.ibm.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>, Minchan Kim <minchan@kernel.org>,
 Nitin Gupta <ngupta@vflare.org>, Matias Bjorling <mb@lightnvm.io>,
 Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: simplify gendisk and request_queue allocation for bio based drivers
Date: Fri, 21 May 2021 07:50:50 +0200
Message-Id: <20210521055116.1053587-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-raid@vger.kernel.org, nvdimm@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

this series is the first part of cleaning up lifetimes and allocation of
the gendisk and request_queue structure.  It adds a new interface to
allocate the disk and queue together for bio based drivers, and a helper
for cleanup/free them when a driver is unloaded or a device is removed.

Together this removes the need to treat the gendisk and request_queue
as separate entities for bio based drivers.

Diffstat:
 arch/m68k/emu/nfblock.c             |   20 +---
 arch/xtensa/platforms/iss/simdisk.c |   29 +------
 block/blk-core.c                    |    1 
 block/blk.h                         |    6 -
 block/genhd.c                       |  149 +++++++++++++++++++-----------------
 block/partitions/core.c             |   19 ++--
 drivers/block/brd.c                 |   94 +++++++---------------
 drivers/block/drbd/drbd_main.c      |   23 +----
 drivers/block/n64cart.c             |    8 -
 drivers/block/null_blk/main.c       |   38 ++++-----
 drivers/block/pktcdvd.c             |   11 --
 drivers/block/ps3vram.c             |   31 +------
 drivers/block/rsxx/dev.c            |   39 +++------
 drivers/block/rsxx/rsxx_priv.h      |    1 
 drivers/block/zram/zram_drv.c       |   19 ----
 drivers/lightnvm/core.c             |   24 +----
 drivers/md/bcache/super.c           |   15 ---
 drivers/md/dm.c                     |   16 +--
 drivers/md/md.c                     |   25 ++----
 drivers/memstick/core/ms_block.c    |    1 
 drivers/nvdimm/blk.c                |   27 +-----
 drivers/nvdimm/btt.c                |   25 +-----
 drivers/nvdimm/btt.h                |    2 
 drivers/nvdimm/pmem.c               |   17 +---
 drivers/nvme/host/core.c            |    1 
 drivers/nvme/host/multipath.c       |   46 +++--------
 drivers/s390/block/dcssblk.c        |   26 +-----
 drivers/s390/block/xpram.c          |   26 ++----
 include/linux/blkdev.h              |    1 
 include/linux/genhd.h               |   23 +++++
 30 files changed, 297 insertions(+), 466 deletions(-)
