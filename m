Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E24E92107DD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 11:18:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xbHY5m2TzDqSR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 19:18:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+501e1de201b53739768b+6156+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=QNVRM5re; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xZtb5nlxzDqqY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 19:00:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=NewiNZRcUdxKIYqGEwecM2/TYLTpV46Y4ANOh3AaYeY=; b=QNVRM5re/f5qDCO18Ck/0VAKzH
 wSFtEOqRYRAr2bGYSrHkREAU4zNfXQfT7bHNCQ642gEiZ/kD2oIal+/v8s+/P9dhOIWy3R0yRohCO
 1rlRel/VN1zwvxCbPcrdSCwjnFAJ76DOEFzjdw8gocpKGPw9hTrlqhEXUS6jKUXBJi+aCMwwqAMKe
 2f20Vv7rUmHhXPpFgitTXcvrBCtCToFm2VVMUejE0AlRtmsGalyDZbcSj4MUlnywB8y4rCRgOUyXf
 uHSD35Uugs7TKYbgEQzDDD/u88xlT4LzBhG3iAS0DjZuD4LH5lXU/zccIkKtU6gfC8EQ7iU6739gJ
 g3f6e3JA==;
Received: from [2001:4bb8:184:76e3:ea38:596b:3e9e:422a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqYar-00087G-2E; Wed, 01 Jul 2020 08:59:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: rename ->make_request_fn and move it to the block_device_operations v2
Date: Wed,  1 Jul 2020 10:59:27 +0200
Message-Id: <20200701085947.3354405-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
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
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org, dm-devel@redhat.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jens,

this series moves the make_request_fn method into block_device_operations
with the much more descriptive ->submit_bio name.  It then also gives
generic_make_request a more descriptive name, and further optimize the
path to issue to blk-mq, removing the need for the direct_make_request
bypass.

Changes since v1:
 - fix a null pointer dereference when dispatching from bio to request
   based drivers
 - clean up a few more comments

Diffstat:
 Documentation/block/biodoc.rst                    |    2 
 Documentation/block/writeback_cache_control.rst   |    2 
 Documentation/fault-injection/fault-injection.rst |    2 
 Documentation/trace/ftrace.rst                    |    4 
 arch/m68k/emu/nfblock.c                           |    8 
 arch/xtensa/platforms/iss/simdisk.c               |    9 
 block/bio.c                                       |   14 -
 block/blk-cgroup.c                                |    2 
 block/blk-core.c                                  |  255 +++++++++-------------
 block/blk-crypto-fallback.c                       |    2 
 block/blk-crypto.c                                |    2 
 block/blk-merge.c                                 |   23 -
 block/blk-mq.c                                    |   12 -
 block/blk-throttle.c                              |    4 
 block/blk.h                                       |    5 
 block/bounce.c                                    |    2 
 drivers/block/brd.c                               |    5 
 drivers/block/drbd/drbd_int.h                     |    8 
 drivers/block/drbd/drbd_main.c                    |   12 -
 drivers/block/drbd/drbd_receiver.c                |    2 
 drivers/block/drbd/drbd_req.c                     |    8 
 drivers/block/drbd/drbd_worker.c                  |    2 
 drivers/block/null_blk_main.c                     |   19 +
 drivers/block/pktcdvd.c                           |   15 -
 drivers/block/ps3vram.c                           |   20 -
 drivers/block/rsxx/dev.c                          |   14 -
 drivers/block/umem.c                              |   11 
 drivers/block/zram/zram_drv.c                     |   14 -
 drivers/lightnvm/core.c                           |    8 
 drivers/lightnvm/pblk-init.c                      |   16 -
 drivers/lightnvm/pblk-read.c                      |    2 
 drivers/md/bcache/bcache.h                        |    2 
 drivers/md/bcache/btree.c                         |    2 
 drivers/md/bcache/request.c                       |   11 
 drivers/md/bcache/request.h                       |    4 
 drivers/md/bcache/super.c                         |   24 +-
 drivers/md/dm-cache-target.c                      |    6 
 drivers/md/dm-clone-target.c                      |   10 
 drivers/md/dm-crypt.c                             |    6 
 drivers/md/dm-delay.c                             |    2 
 drivers/md/dm-era-target.c                        |    2 
 drivers/md/dm-integrity.c                         |    4 
 drivers/md/dm-mpath.c                             |    2 
 drivers/md/dm-raid1.c                             |    2 
 drivers/md/dm-snap-persistent.c                   |    2 
 drivers/md/dm-snap.c                              |    6 
 drivers/md/dm-thin.c                              |    4 
 drivers/md/dm-verity-target.c                     |    2 
 drivers/md/dm-writecache.c                        |    2 
 drivers/md/dm-zoned-target.c                      |    2 
 drivers/md/dm.c                                   |   41 +--
 drivers/md/md-faulty.c                            |    4 
 drivers/md/md-linear.c                            |    4 
 drivers/md/md-multipath.c                         |    4 
 drivers/md/md.c                                   |    7 
 drivers/md/raid0.c                                |    8 
 drivers/md/raid1.c                                |   14 -
 drivers/md/raid10.c                               |   28 +-
 drivers/md/raid5.c                                |   10 
 drivers/nvdimm/blk.c                              |    5 
 drivers/nvdimm/btt.c                              |    5 
 drivers/nvdimm/pmem.c                             |    5 
 drivers/nvme/host/core.c                          |    1 
 drivers/nvme/host/multipath.c                     |   18 -
 drivers/nvme/host/nvme.h                          |    1 
 drivers/s390/block/dcssblk.c                      |   11 
 drivers/s390/block/xpram.c                        |    8 
 fs/buffer.c                                       |    5 
 include/linux/blk-mq.h                            |    2 
 include/linux/blkdev.h                            |   12 -
 include/linux/lightnvm.h                          |    3 
 71 files changed, 387 insertions(+), 408 deletions(-)
