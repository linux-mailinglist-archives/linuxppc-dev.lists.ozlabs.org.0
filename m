Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 480843981BA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 08:55:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw0Cd4413z3btt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 16:55:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BI35Myps;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+e38fb55258da4e18a096+6492+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=BI35Myps; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw0BY6nNtz2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 16:54:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=GNz/Hu0V5gogSB4co5eOK6xP1gnr1qh2/gA3KL3Dtxg=; b=BI35MypsV5ujI5j9LOM8ffKO3O
 PPR2xJ+smyVf1yBqrB22os7cElpqLd6BGSF+LAFux1FWghPPtYUh71lumcyGTaH+GySHaNY4TdhS/
 AV4vc/JIVMat63n8MdcbvA03bNT/GrAfqDiF7ptTNcphdfH4Gmp4s374edZksMq4302Y5G3rKEHTv
 zkjAvx0fvVtUm2B/6XY5TSPrkqQmnos5aAqRHBWaQFtoEeGLkMCCmRvVNoipNM5EQcjvqqNXgrxv+
 Uv5yjt1xCW0uwaWbb4vvYLNz6VSHAG5NmTU3avE4Jh6rqZRN77aCtw5TtcxU3fh9zr5QCwFWGydth
 c/21yB+g==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKlB-0025F3-IY; Wed, 02 Jun 2021 06:53:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: simplify gendisk and request_queue allocation for blk-mq based drivers
Date: Wed,  2 Jun 2021 09:53:15 +0300
Message-Id: <20210602065345.355274-1-hch@lst.de>
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
Cc: Justin Sanders <justin@coraid.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mike Snitzer <snitzer@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jack Wang <jinpu.wang@ionos.com>,
 Tim Waugh <tim@cyberelk.net>, linux-s390@vger.kernel.org,
 Alex Dubov <oakad@yahoo.com>, Richard Weinberger <richard@nod.at>,
 Christian Borntraeger <borntraeger@de.ibm.com>, xen-devel@lists.xenproject.org,
 Ilya Dryomov <idryomov@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Heiko Carstens <hca@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
 Denis Efremov <efremov@linux.com>, nbd@other.debian.org,
 linux-block@vger.kernel.org, ceph-devel@vger.kernel.org,
 Maxim Levitsky <maximlevitsky@gmail.com>, Geoff Levand <geoff@infradead.org>,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

this series is the scond part of cleaning up lifetimes and allocation of
the gendisk and request_queue structure.  It adds a new interface to
allocate the disk and queue together for blk based drivers, and uses that
in all drivers that do not have any caveats in their gendisk and
request_queue lifetime rules.

Diffstat:
 block/blk-mq.c                      |   91 +++++++++++++++-------------------
 block/blk.h                         |    1 
 block/elevator.c                    |    2 
 drivers/block/amiflop.c             |   16 +-----
 drivers/block/aoe/aoeblk.c          |   33 ++++--------
 drivers/block/aoe/aoedev.c          |    3 -
 drivers/block/ataflop.c             |   16 +-----
 drivers/block/floppy.c              |   20 +------
 drivers/block/loop.c                |   19 ++-----
 drivers/block/nbd.c                 |   53 +++++++------------
 drivers/block/null_blk/main.c       |   11 +---
 drivers/block/paride/pcd.c          |   19 +++----
 drivers/block/paride/pd.c           |   30 ++++-------
 drivers/block/paride/pf.c           |   18 ++----
 drivers/block/ps3disk.c             |   36 +++++--------
 drivers/block/rbd.c                 |   52 ++++++-------------
 drivers/block/rnbd/rnbd-clt.c       |   35 +++----------
 drivers/block/sunvdc.c              |   47 ++++-------------
 drivers/block/swim.c                |   34 +++++-------
 drivers/block/swim3.c               |   33 +++++-------
 drivers/block/sx8.c                 |   23 ++------
 drivers/block/virtio_blk.c          |   26 ++-------
 drivers/block/xen-blkfront.c        |   96 ++++++++++++++----------------------
 drivers/block/z2ram.c               |   15 +----
 drivers/cdrom/gdrom.c               |   45 +++++++---------
 drivers/md/dm-rq.c                  |    9 +--
 drivers/memstick/core/ms_block.c    |   25 +++------
 drivers/memstick/core/mspro_block.c |   26 ++++-----
 drivers/mtd/mtd_blkdevs.c           |   48 ++++++++----------
 drivers/mtd/ubi/block.c             |   68 ++++++++++---------------
 drivers/s390/block/scm_blk.c        |   21 ++-----
 include/linux/blk-mq.h              |   24 ++++++---
 include/linux/elevator.h            |    1 
 33 files changed, 386 insertions(+), 610 deletions(-)
