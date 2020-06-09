Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C4F1F3FBA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:45:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hDw54QmszDqJW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 01:45:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hDs86XkzzDqbB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 01:42:35 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EAA0968B02; Tue,  9 Jun 2020 17:42:30 +0200 (CEST)
Date: Tue, 9 Jun 2020 17:42:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: ipr crashes due to NULL dma_need_drain since cc97923a5bcc
 ("block: move dma drain handling to scsi")
Message-ID: <20200609154230.GA18426@lst.de>
References: <87zh9cftj0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zh9cftj0.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 linux-ide@vger.kernel.org, brking@us.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Can you try this patch?

---
From 1c9913360a0494375c5655b133899cb4323bceb4 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Tue, 9 Jun 2020 14:07:31 +0200
Subject: scsi: wire up ata_scsi_dma_need_drain for SAS HBA drivers

We need ata_scsi_dma_need_drain for all drivers wired up to drive ATAPI
devices through libata.  That also includes the SAS HBA drivers in
addition to native libata HBA drivers.

Fixes: cc97923a5bcc ("block: move dma drain handling to scsi")
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/aic94xx/aic94xx_init.c    | 1 +
 drivers/scsi/hisi_sas/hisi_sas_v1_hw.c | 1 +
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c | 1 +
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c | 1 +
 drivers/scsi/ipr.c                     | 1 +
 drivers/scsi/isci/init.c               | 1 +
 drivers/scsi/mvsas/mv_init.c           | 1 +
 drivers/scsi/pm8001/pm8001_init.c      | 1 +
 8 files changed, 8 insertions(+)

diff --git a/drivers/scsi/aic94xx/aic94xx_init.c b/drivers/scsi/aic94xx/aic94xx_init.c
index d022407e5645c7..bef47f38dd0dbc 100644
--- a/drivers/scsi/aic94xx/aic94xx_init.c
+++ b/drivers/scsi/aic94xx/aic94xx_init.c
@@ -40,6 +40,7 @@ static struct scsi_host_template aic94xx_sht = {
 	/* .name is initialized */
 	.name			= "aic94xx",
 	.queuecommand		= sas_queuecommand,
+	.dma_need_drain		= ata_scsi_dma_need_drain,
 	.target_alloc		= sas_target_alloc,
 	.slave_configure	= sas_slave_configure,
 	.scan_finished		= asd_scan_finished,
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
index 2e1718f9ade218..09a7669dad4c67 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v1_hw.c
@@ -1756,6 +1756,7 @@ static struct scsi_host_template sht_v1_hw = {
 	.proc_name		= DRV_NAME,
 	.module			= THIS_MODULE,
 	.queuecommand		= sas_queuecommand,
+	.dma_need_drain		= ata_scsi_dma_need_drain,
 	.target_alloc		= sas_target_alloc,
 	.slave_configure	= hisi_sas_slave_configure,
 	.scan_finished		= hisi_sas_scan_finished,
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
index e7e7849a4c14e2..968d3870235359 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
@@ -3532,6 +3532,7 @@ static struct scsi_host_template sht_v2_hw = {
 	.proc_name		= DRV_NAME,
 	.module			= THIS_MODULE,
 	.queuecommand		= sas_queuecommand,
+	.dma_need_drain		= ata_scsi_dma_need_drain,
 	.target_alloc		= sas_target_alloc,
 	.slave_configure	= hisi_sas_slave_configure,
 	.scan_finished		= hisi_sas_scan_finished,
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
index 3e6b78a1f993b9..55e2321a65bc5f 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
@@ -3075,6 +3075,7 @@ static struct scsi_host_template sht_v3_hw = {
 	.proc_name		= DRV_NAME,
 	.module			= THIS_MODULE,
 	.queuecommand		= sas_queuecommand,
+	.dma_need_drain		= ata_scsi_dma_need_drain,
 	.target_alloc		= sas_target_alloc,
 	.slave_configure	= hisi_sas_slave_configure,
 	.scan_finished		= hisi_sas_scan_finished,
diff --git a/drivers/scsi/ipr.c b/drivers/scsi/ipr.c
index 7d77997d26d457..7d86f4ca266c86 100644
--- a/drivers/scsi/ipr.c
+++ b/drivers/scsi/ipr.c
@@ -6731,6 +6731,7 @@ static struct scsi_host_template driver_template = {
 	.compat_ioctl = ipr_ioctl,
 #endif
 	.queuecommand = ipr_queuecommand,
+	.dma_need_drain = ata_scsi_dma_need_drain,
 	.eh_abort_handler = ipr_eh_abort,
 	.eh_device_reset_handler = ipr_eh_dev_reset,
 	.eh_host_reset_handler = ipr_eh_host_reset,
diff --git a/drivers/scsi/isci/init.c b/drivers/scsi/isci/init.c
index 974c3b9116d5ba..085e285f427d93 100644
--- a/drivers/scsi/isci/init.c
+++ b/drivers/scsi/isci/init.c
@@ -153,6 +153,7 @@ static struct scsi_host_template isci_sht = {
 	.name				= DRV_NAME,
 	.proc_name			= DRV_NAME,
 	.queuecommand			= sas_queuecommand,
+	.dma_need_drain			= ata_scsi_dma_need_drain,
 	.target_alloc			= sas_target_alloc,
 	.slave_configure		= sas_slave_configure,
 	.scan_finished			= isci_host_scan_finished,
diff --git a/drivers/scsi/mvsas/mv_init.c b/drivers/scsi/mvsas/mv_init.c
index 5973eed9493820..b0de3bdb01db06 100644
--- a/drivers/scsi/mvsas/mv_init.c
+++ b/drivers/scsi/mvsas/mv_init.c
@@ -33,6 +33,7 @@ static struct scsi_host_template mvs_sht = {
 	.module			= THIS_MODULE,
 	.name			= DRV_NAME,
 	.queuecommand		= sas_queuecommand,
+	.dma_need_drain		= ata_scsi_dma_need_drain,
 	.target_alloc		= sas_target_alloc,
 	.slave_configure	= sas_slave_configure,
 	.scan_finished		= mvs_scan_finished,
diff --git a/drivers/scsi/pm8001/pm8001_init.c b/drivers/scsi/pm8001/pm8001_init.c
index a8f5344fdfda2a..9e99262a2b9dd3 100644
--- a/drivers/scsi/pm8001/pm8001_init.c
+++ b/drivers/scsi/pm8001/pm8001_init.c
@@ -87,6 +87,7 @@ static struct scsi_host_template pm8001_sht = {
 	.module			= THIS_MODULE,
 	.name			= DRV_NAME,
 	.queuecommand		= sas_queuecommand,
+	.dma_need_drain		= ata_scsi_dma_need_drain,
 	.target_alloc		= sas_target_alloc,
 	.slave_configure	= sas_slave_configure,
 	.scan_finished		= pm8001_scan_finished,
-- 
2.26.2

