Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7158E1F3E1A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:28:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hCCw1G0XzDqck
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 00:28:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ideasonboard.com (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647;
 helo=perceval.ideasonboard.com;
 envelope-from=kieran.bingham+renesas@ideasonboard.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=qUqBHIMm; 
 dkim-atps=neutral
X-Greylist: delayed 395 seconds by postgrey-1.36 at bilbo;
 Tue, 09 Jun 2020 22:53:01 AEST
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h95T0qZ7zDqHg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 22:53:00 +1000 (AEST)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net
 [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C322181E;
 Tue,  9 Jun 2020 14:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591706789;
 bh=YFKrkm32kVOPplzX9Ke4v6/4mOrSe77eJjI6rVHe9BY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qUqBHIMmwN2gihb/s7oE9n3dKVNLyIg+ccgR+cVU9UyfZF7khDjc0QR7jfOVT+0sw
 XNbTejYmerz9jV4AUKtvQrOLPKLHr+GNWUCjOW0CSjecaj/G85mRM+lcIOj8yXORBx
 J75Pap3RxRl2lt/pk/329smjsPRCC3liARAo7tIg=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 06/17] drivers: scsi: Fix trivial spelling
Date: Tue,  9 Jun 2020 13:45:59 +0100
Message-Id: <20200609124610.3445662-7-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 10 Jun 2020 00:20:39 +1000
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Jiri Kosina <trivial@kernel.org>,
 "open list:IBM Power Virtual FC Device Drivers"
 <linux-scsi@vger.kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 "supporter:QLOGIC QLA2XXX FC-SCSI DRIVER"
 <GR-QLogic-Storage-Upstream@marvell.com>, Nilesh Javali <njavali@marvell.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Paul Mackerras <paulus@samba.org>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The word 'descriptor' is misspelled throughout the tree.

Fix it up accordingly:
    decriptors -> descriptors

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c    | 2 +-
 drivers/scsi/ibmvscsi/ibmvscsi.c  | 2 +-
 drivers/scsi/qla2xxx/qla_inline.h | 2 +-
 drivers/scsi/qla2xxx/qla_iocb.c   | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 635f6f9cffc4..77f4d37d5bd6 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1344,7 +1344,7 @@ static void ibmvfc_map_sg_list(struct scsi_cmnd *scmd, int nseg,
 }
 
 /**
- * ibmvfc_map_sg_data - Maps dma for a scatterlist and initializes decriptor fields
+ * ibmvfc_map_sg_data - Maps dma for a scatterlist and initializes descriptor fields
  * @scmd:		struct scsi_cmnd with the scatterlist
  * @evt:		ibmvfc event struct
  * @vfc_cmd:	vfc_cmd that contains the memory descriptor
diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 44e64aa21194..a92587624c72 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -667,7 +667,7 @@ static int map_sg_list(struct scsi_cmnd *cmd, int nseg,
 }
 
 /**
- * map_sg_data: - Maps dma for a scatterlist and initializes decriptor fields
+ * map_sg_data: - Maps dma for a scatterlist and initializes descriptor fields
  * @cmd:	struct scsi_cmnd with the scatterlist
  * @srp_cmd:	srp_cmd that contains the memory descriptor
  * @dev:	device for which to map dma memory
diff --git a/drivers/scsi/qla2xxx/qla_inline.h b/drivers/scsi/qla2xxx/qla_inline.h
index 1fb6ccac07cc..861dc522723c 100644
--- a/drivers/scsi/qla2xxx/qla_inline.h
+++ b/drivers/scsi/qla2xxx/qla_inline.h
@@ -11,7 +11,7 @@
  * Continuation Type 1 IOCBs to allocate.
  *
  * @vha: HA context
- * @dsds: number of data segment decriptors needed
+ * @dsds: number of data segment descriptors needed
  *
  * Returns the number of IOCB entries needed to store @dsds.
  */
diff --git a/drivers/scsi/qla2xxx/qla_iocb.c b/drivers/scsi/qla2xxx/qla_iocb.c
index 8865c35d3421..1d3c58c5f0e2 100644
--- a/drivers/scsi/qla2xxx/qla_iocb.c
+++ b/drivers/scsi/qla2xxx/qla_iocb.c
@@ -44,7 +44,7 @@ qla2x00_get_cmd_direction(srb_t *sp)
  * qla2x00_calc_iocbs_32() - Determine number of Command Type 2 and
  * Continuation Type 0 IOCBs to allocate.
  *
- * @dsds: number of data segment decriptors needed
+ * @dsds: number of data segment descriptors needed
  *
  * Returns the number of IOCB entries needed to store @dsds.
  */
@@ -66,7 +66,7 @@ qla2x00_calc_iocbs_32(uint16_t dsds)
  * qla2x00_calc_iocbs_64() - Determine number of Command Type 3 and
  * Continuation Type 1 IOCBs to allocate.
  *
- * @dsds: number of data segment decriptors needed
+ * @dsds: number of data segment descriptors needed
  *
  * Returns the number of IOCB entries needed to store @dsds.
  */
@@ -669,7 +669,7 @@ qla24xx_build_scsi_type_6_iocbs(srb_t *sp, struct cmd_type_6 *cmd_pkt,
  * qla24xx_calc_dsd_lists() - Determine number of DSD list required
  * for Command Type 6.
  *
- * @dsds: number of data segment decriptors needed
+ * @dsds: number of data segment descriptors needed
  *
  * Returns the number of dsd list needed to store @dsds.
  */
-- 
2.25.1

