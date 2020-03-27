Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C36CB195FEC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 21:41:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pv0G5yp6zDr94
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 07:41:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=cGQrpu0N; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ptgC0cNyzDrJs
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 07:26:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=EXuaCeS05yLOJp+RgAPhKUivN9VXlZucpZvJEklQ5u8=; b=cGQrpu0N+Jt542t+QGpCQbTZ3e
 5KnZii4QKxQDU02MM087BiogIvjLDj6oW9CyQvk85pl3TUw598rqOsrx0TUxD0qeJezNmnnc6hAx5
 +fukxqlR6F82l7bXqjIgMMoUghUjhnr2atvS5OsOZhhiL89ptS+z+OPSBFYHOdGpZcWnf1rCkuez+
 yIkhRQxFNGoJZlXJHDzWenQCDh5687zbYS+Z4eRNbZ84oHVcotq8URhJ1OQu1sfDtmLSZ93xq4goq
 HMqnnhWaD9Tos4MXX3WhAVl2cKXe1zHAWg0grmi7zS+p6GCSJCqnaZ2HBvEo/83vQhX8hkuL6V2lc
 gxHgMR2A==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jHvYd-0003Il-H5; Fri, 27 Mar 2020 20:26:23 +0000
Message-Id: <aad636cc03c54233fe83e63674c65ef09827aefd.1585340156.git.geoff@infradead.org>
In-Reply-To: <cover.1585340156.git.geoff@infradead.org>
References: <cover.1585340156.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Tue, 20 Aug 2019 23:24:47 +0200
Subject: [PATCH 5/9] ps3disk: use the default segment boundary
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 27 Mar 2020 20:26:23 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Emmanuel Nicolet <emmanuel.nicolet@gmail.com>

Hi,
since commit dcebd755926b ("block: use bio_for_each_bvec() to compute
multi-page bvec count"), the kernel will bug_on on the PS3 because
bio_split() is called with sectors == 0:

kernel BUG at block/bio.c:1853!
Oops: Exception in kernel mode, sig: 5 [#1]
BE PAGE_SIZE=4K MMU=Hash PREEMPT SMP NR_CPUS=8 NUMA PS3
Modules linked in: firewire_sbp2 rtc_ps3(+) soundcore ps3_gelic(+) \
ps3rom(+) firewire_core ps3vram(+) usb_common crc_itu_t
CPU: 0 PID: 97 Comm: blkid Not tainted 5.3.0-rc4 #1
NIP:  c00000000027d0d0 LR: c00000000027d0b0 CTR: 0000000000000000
REGS: c00000000135ae90 TRAP: 0700   Not tainted  (5.3.0-rc4)
MSR:  8000000000028032 <SF,EE,IR,DR,RI>  CR: 44008240  XER: 20000000
IRQMASK: 0
GPR00: c000000000289368 c00000000135b120 c00000000084a500 c000000004ff8300
GPR04: 0000000000000c00 c000000004c905e0 c000000004c905e0 000000000000ffff
GPR08: 0000000000000000 0000000000000001 0000000000000000 000000000000ffff
GPR12: 0000000000000000 c0000000008ef000 000000000000003e 0000000000080001
GPR16: 0000000000000100 000000000000ffff 0000000000000000 0000000000000004
GPR20: c00000000062fd7e 0000000000000001 000000000000ffff 0000000000000080
GPR24: c000000000781788 c00000000135b350 0000000000000080 c000000004c905e0
GPR28: c00000000135b348 c000000004ff8300 0000000000000000 c000000004c90000
NIP [c00000000027d0d0] .bio_split+0x28/0xac
LR [c00000000027d0b0] .bio_split+0x8/0xac
Call Trace:
[c00000000135b120] [c00000000027d130] .bio_split+0x88/0xac (unreliable)
[c00000000135b1b0] [c000000000289368] .__blk_queue_split+0x11c/0x53c
[c00000000135b2d0] [c00000000028f614] .blk_mq_make_request+0x80/0x7d4
[c00000000135b3d0] [c000000000283a8c] .generic_make_request+0x118/0x294
[c00000000135b4b0] [c000000000283d34] .submit_bio+0x12c/0x174
[c00000000135b580] [c000000000205a44] .mpage_bio_submit+0x3c/0x4c
[c00000000135b600] [c000000000206184] .mpage_readpages+0xa4/0x184
[c00000000135b750] [c0000000001ff8fc] .blkdev_readpages+0x24/0x38
[c00000000135b7c0] [c0000000001589f0] .read_pages+0x6c/0x1a8
[c00000000135b8b0] [c000000000158c74] .__do_page_cache_readahead+0x118/0x184
[c00000000135b9b0] [c0000000001591a8] .force_page_cache_readahead+0xe4/0xe8
[c00000000135ba50] [c00000000014fc24] .generic_file_read_iter+0x1d8/0x830
[c00000000135bb50] [c0000000001ffadc] .blkdev_read_iter+0x40/0x5c
[c00000000135bbc0] [c0000000001b9e00] .new_sync_read+0x144/0x1a0
[c00000000135bcd0] [c0000000001bc454] .vfs_read+0xa0/0x124
[c00000000135bd70] [c0000000001bc7a4] .ksys_read+0x70/0xd8
[c00000000135be20] [c00000000000a524] system_call+0x5c/0x70
Instruction dump:
7fe3fb78 482e30dc 7c0802a6 482e3085 7c9e2378 f821ff71 7ca42b78 7d3e00d0
7c7d1b78 79290fe0 7cc53378 69290001 <0b090000> 81230028 7bca0020 7929ba62
[ end trace 313fec760f30aa1f ]---

The problem originates from setting the segment boundary of the request
queue to -1UL. This makes get_max_segment_size() return zero when offset
is zero, whatever the max segment size. The test with BLK_SEG_BOUNDARY_MASK
fails and 'mask - (mask & offset) + 1' overflows to zero in the return
statement.

Not setting the segment boundary and using the default value
(BLK_SEG_BOUNDARY_MASK) fixes the problem.
Maybe BLK_SEG_BOUNDARY_MASK should be set to -1UL? It's currently set to
only 0xFFFFFFFFUL. I don't know if that would break anything.

Signed-off-by: Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 drivers/block/ps3disk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/ps3disk.c b/drivers/block/ps3disk.c
index c5c6487a19d5..7b55811c2a81 100644
--- a/drivers/block/ps3disk.c
+++ b/drivers/block/ps3disk.c
@@ -454,7 +454,6 @@ static int ps3disk_probe(struct ps3_system_bus_device *_dev)
 	queue->queuedata = dev;
 
 	blk_queue_max_hw_sectors(queue, dev->bounce_size >> 9);
-	blk_queue_segment_boundary(queue, -1UL);
 	blk_queue_dma_alignment(queue, dev->blk_size-1);
 	blk_queue_logical_block_size(queue, dev->blk_size);
 
-- 
2.20.1


