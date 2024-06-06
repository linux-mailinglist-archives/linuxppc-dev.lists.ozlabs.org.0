Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A20A58FE4FF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 13:15:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nXEUUmHi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw1w75HtFz3dLl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 21:15:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nXEUUmHi;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw1vP5fQwz3cyc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 21:14:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717672496;
	bh=JkMBHpq5K4ie+dfHpGJjCUD7zTfjKpLevGsS4Gkp3Mo=;
	h=From:To:Cc:Subject:Date:From;
	b=nXEUUmHiHHZhMfTLqAfWPU4HerXeYWMJtunn0PvlF4di3y67hn37mGLFF9awnrkD5
	 qrk328KUcQi/8DamBIXcYuQd6sgdPo4ymjWbEFwQ7jZxB4FUU/pYmDGCpefnb3/b6g
	 6RA9fwnz+RYxkkAgont6xbe5h1sdAz1jb26tUuYY7TNJjq12YSpSbhDRg3WcbZkwEw
	 Jxkqg+sPV9K9klXKYv2gvf3mJCQwniM/M3LmM3qEjb/zEnwvpEHQmZP+ziCzT9RurX
	 1hrepvtq0dkhjBwWMt6cfpVQDD2nrcqQ60qkK1391r8vAfoh9SUYwWXA2XIJ5Hikso
	 tR9/WQv+MKAPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vw1vM4l74z4wc5;
	Thu,  6 Jun 2024 21:14:55 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: martin.petersen@oracle.com,
	dlemoal@kernel.org,
	cassel@kernel.org
Subject: [PATCH] ata: pata_macio: Fix max_segment_size with PAGE_SIZE == 64K
Date: Thu,  6 Jun 2024 21:14:45 +1000
Message-ID: <20240606111445.400001-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: doru.iorgulescu1@gmail.com, regressions@lists.linux.dev, linux-scsi@vger.kernel.org, john.g.garry@oracle.com, linux-ide@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pata_macio driver advertises a max_segment_size of 0xff00, because
the hardware doesn't cope with requests >= 64K.

However the SCSI core requires max_segment_size to be at least
PAGE_SIZE, which is a problem for pata_macio when the kernel is built
with 64K pages.

In older kernels the SCSI core would just increase the segment size to
be equal to PAGE_SIZE, however since the commit tagged below it causes a
warning and the device fails to probe:

  WARNING: CPU: 0 PID: 26 at block/blk-settings.c:202 .blk_validate_limits+0x2f8/0x35c
  CPU: 0 PID: 26 Comm: kworker/u4:1 Not tainted 6.10.0-rc1 #1
  Hardware name: PowerMac7,2 PPC970 0x390202 PowerMac
  ...
  NIP .blk_validate_limits+0x2f8/0x35c
  LR  .blk_alloc_queue+0xc0/0x2f8
  Call Trace:
    .blk_alloc_queue+0xc0/0x2f8
    .blk_mq_alloc_queue+0x60/0xf8
    .scsi_alloc_sdev+0x208/0x3c0
    .scsi_probe_and_add_lun+0x314/0x52c
    .__scsi_add_device+0x170/0x1a4
    .ata_scsi_scan_host+0x2bc/0x3e4
    .async_port_probe+0x6c/0xa0
    .async_run_entry_fn+0x60/0x1bc
    .process_one_work+0x228/0x510
    .worker_thread+0x360/0x530
    .kthread+0x134/0x13c
    .start_kernel_thread+0x10/0x14
  ...
  scsi_alloc_sdev: Allocation failure during SCSI scanning, some SCSI devices might not be configured

Although the hardware can't cope with a 64K segment, the driver
already deals with that internally by splitting large requests in
pata_macio_qc_prep(). That is how the driver has managed to function
until now on 64K kernels.

So fix the driver to advertise a max_segment_size of 64K, which avoids
the warning and keeps the SCSI core happy.

Fixes: afd53a3d8528 ("scsi: core: Initialize scsi midlayer limits before allocating the queue")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/ce2bf6af-4382-4fe1-b392-cc6829f5ceb2@roeck-us.net/
Reported-by: Doru Iorgulescu <doru.iorgulescu1@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218858
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/ata/pata_macio.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
index 817838e2f70e..3cb455a32d92 100644
--- a/drivers/ata/pata_macio.c
+++ b/drivers/ata/pata_macio.c
@@ -915,10 +915,13 @@ static const struct scsi_host_template pata_macio_sht = {
 	.sg_tablesize		= MAX_DCMDS,
 	/* We may not need that strict one */
 	.dma_boundary		= ATA_DMA_BOUNDARY,
-	/* Not sure what the real max is but we know it's less than 64K, let's
-	 * use 64K minus 256
+	/*
+	 * The SCSI core requires the segment size to cover at least a page, so
+	 * for 64K page size kernels this must be at least 64K. However the
+	 * hardware can't handle 64K, so pata_macio_qc_prep() will split large
+	 * requests.
 	 */
-	.max_segment_size	= MAX_DBDMA_SEG,
+	.max_segment_size	= SZ_64K,
 	.device_configure	= pata_macio_device_configure,
 	.sdev_groups		= ata_common_sdev_groups,
 	.can_queue		= ATA_DEF_QUEUE,
-- 
2.45.1

