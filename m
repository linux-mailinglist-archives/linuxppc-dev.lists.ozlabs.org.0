Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B55A1A51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 14:42:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K2MJ69JRzDqbc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 22:42:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K26w6LQNzDrQM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 22:32:07 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E9C05B023;
 Thu, 29 Aug 2019 12:32:04 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] scsi: cxlflash: Fix fallthrough warnings.
Date: Thu, 29 Aug 2019 14:32:00 +0200
Message-Id: <279d33f05007e9f3e3fb4e6ea19634b2608ffbd3.1567081143.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1567081143.git.msuchanek@suse.de>
References: <cover.1567081143.git.msuchanek@suse.de>
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
Cc: Uma Krishnan <ukrishn@linux.ibm.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org,
 "Manoj N. Kumar" <manoj@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Michal Suchanek <msuchanek@suse.de>, "Matthew R. Ochs" <mrochs@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add fallthrough comments where missing.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 drivers/scsi/cxlflash/main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/scsi/cxlflash/main.c b/drivers/scsi/cxlflash/main.c
index b1f4724efde2..f402fa9a7bec 100644
--- a/drivers/scsi/cxlflash/main.c
+++ b/drivers/scsi/cxlflash/main.c
@@ -753,10 +753,13 @@ static void term_intr(struct cxlflash_cfg *cfg, enum undo_level level,
 		/* SISL_MSI_ASYNC_ERROR is setup only for the primary HWQ */
 		if (index == PRIMARY_HWQ)
 			cfg->ops->unmap_afu_irq(hwq->ctx_cookie, 3, hwq);
+		/* fall through */
 	case UNMAP_TWO:
 		cfg->ops->unmap_afu_irq(hwq->ctx_cookie, 2, hwq);
+		/* fall through */
 	case UNMAP_ONE:
 		cfg->ops->unmap_afu_irq(hwq->ctx_cookie, 1, hwq);
+		/* fall through */
 	case FREE_IRQ:
 		cfg->ops->free_afu_irqs(hwq->ctx_cookie);
 		/* fall through */
@@ -973,14 +976,18 @@ static void cxlflash_remove(struct pci_dev *pdev)
 	switch (cfg->init_state) {
 	case INIT_STATE_CDEV:
 		cxlflash_release_chrdev(cfg);
+		/* fall through */
 	case INIT_STATE_SCSI:
 		cxlflash_term_local_luns(cfg);
 		scsi_remove_host(cfg->host);
+		/* fall through */
 	case INIT_STATE_AFU:
 		term_afu(cfg);
+		/* fall through */
 	case INIT_STATE_PCI:
 		cfg->ops->destroy_afu(cfg->afu_cookie);
 		pci_disable_device(pdev);
+		/* fall through */
 	case INIT_STATE_NONE:
 		free_mem(cfg);
 		scsi_host_put(cfg->host);
@@ -3017,6 +3024,7 @@ static ssize_t num_hwqs_store(struct device *dev,
 		wait_event(cfg->reset_waitq, cfg->state != STATE_RESET);
 		if (cfg->state == STATE_NORMAL)
 			goto retry;
+		/* fall through */
 	default:
 		/* Ideally should not happen */
 		dev_err(dev, "%s: Device is not ready, state=%d\n",
-- 
2.12.3

