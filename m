Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A168B5478
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 11:48:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BUPwCr8G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSdmY4pKNz3cc6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 19:47:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BUPwCr8G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSdlr5Gp5z3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 19:47:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714384041; x=1745920041;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T07B8FcITBSPGezVMSWE2NrugikmY3RzmLEKiCA9YLw=;
  b=BUPwCr8GJz6d9Liyebb5gB4Rgq30Igi4KQPB6jwPI2RQ/D+69kEKNIEL
   nqlLHf0oUFJEGHGKFgs36XXGyTquxOPFwbFsc98d8htwgc14d55df4mOv
   KJYwuSuTuvNRia8b8ldIAjce4XVi1UEBszYLsLVWxe51upYrHGxHOjpjT
   /PI+rCtdt16aJeyfp99RbJw6mxaIbXAllDlhJGeiaILZHE8Y9nw1GDIHy
   HXHXN5Ph7GkuPV7Jx4Bh8IglzNyJ7rGWtmSTrA4Z3bM8roimqRQ53K60t
   xtqgZV6PpAwT7acAnRfrZj2tKu+hN4wvHNb4FT7VGQNR2GsmFJXfzjiIK
   A==;
X-CSE-ConnectionGUID: 2kk9yqPOSK2UBGY8ZVxhTQ==
X-CSE-MsgGUID: lISuaUpgSqij2HT/45/lXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13812900"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="13812900"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 02:47:17 -0700
X-CSE-ConnectionGUID: z6OSQ0dYTbe1DPADCmYT5Q==
X-CSE-MsgGUID: AFMEwtDORWKTOYvFQldNVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30715624"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.45])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 02:47:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] PCI/ERR: Cleanup misleading indentation inside if conditions
Date: Mon, 29 Apr 2024 12:47:06 +0300
Message-Id: <20240429094707.2529-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A few if conditions align misleadingly with the following code block.
The checks are really cascading NULL checks that fit into 80 chars so
remove newlines in between and realign to the if condition indent.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/err.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 705893b5f7b0..31090770fffc 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -116,9 +116,7 @@ static int report_mmio_enabled(struct pci_dev *dev, void *data)
 
 	device_lock(&dev->dev);
 	pdrv = dev->driver;
-	if (!pdrv ||
-		!pdrv->err_handler ||
-		!pdrv->err_handler->mmio_enabled)
+	if (!pdrv || !pdrv->err_handler || !pdrv->err_handler->mmio_enabled)
 		goto out;
 
 	err_handler = pdrv->err_handler;
@@ -137,9 +135,7 @@ static int report_slot_reset(struct pci_dev *dev, void *data)
 
 	device_lock(&dev->dev);
 	pdrv = dev->driver;
-	if (!pdrv ||
-		!pdrv->err_handler ||
-		!pdrv->err_handler->slot_reset)
+	if (!pdrv || !pdrv->err_handler || !pdrv->err_handler->slot_reset)
 		goto out;
 
 	err_handler = pdrv->err_handler;
@@ -158,9 +154,7 @@ static int report_resume(struct pci_dev *dev, void *data)
 	device_lock(&dev->dev);
 	pdrv = dev->driver;
 	if (!pci_dev_set_io_state(dev, pci_channel_io_normal) ||
-		!pdrv ||
-		!pdrv->err_handler ||
-		!pdrv->err_handler->resume)
+	    !pdrv || !pdrv->err_handler || !pdrv->err_handler->resume)
 		goto out;
 
 	err_handler = pdrv->err_handler;
-- 
2.39.2

