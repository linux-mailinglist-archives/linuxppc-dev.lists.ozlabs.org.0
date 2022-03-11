Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 717254D5892
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 04:00:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF9fC2hyZz3bW2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 14:00:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hTu0sEoz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hTu0sEoz; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF9dZ3csQz2xCp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 13:59:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646967586; x=1678503586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UJTpyFGEbvemu6dDdKBT6cEZiQLRbmMy45pgsMr9KBM=;
 b=hTu0sEozR+X9r1Xrj2IRcI1+Hljk3ugkucOfXNbVAkLKVh3+1Wz4CZUY
 P0+fwGphjC2Dz2WnmTzDEFR9PjF+XKDD8SP7NCTWgbh4JY+INqA6YBjSw
 mW1Cp3pwvzrXFMs/6Xp4LBSS0mTWEi5tWHj8NXuXHrlekLaO7JJinU/eN
 1WPttRvt9EJvu3QxkLmFdLKoNOIsedeBdYZDncJD5GIHUvr8RwpkTCGhT
 EouQcjdONF/+3joY9WxQrqeS2inRPSMtKfyvv67ixdV7+FAaMDkqXxxQB
 IPeXUQDLGJ5ONpuZK7SpftSbQIBu6BvjKdJHBPM+SWGgc6wjOZxx9cRdc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="255674884"
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="255674884"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 18:58:41 -0800
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="644784512"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 18:58:20 -0800
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Russell Currey <ruscur@russell.cc>,
 Oliver OHalloran <oohall@gmail.com>
Subject: [PATCH v1] PCI/AER: Handle Multi UnCorrectable/Correctable errors
 properly
Date: Fri, 11 Mar 2022 02:58:07 +0000
Message-Id: <20220311025807.14664-1-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Badger <ebadger@purestorage.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the aer_irq() handler returns IRQ_NONE for cases without bits
PCI_ERR_ROOT_UNCOR_RCV or PCI_ERR_ROOT_COR_RCV are set. But this
assumption is incorrect.

Consider a scenario where aer_irq() is triggered for a correctable
error, and while we process the error and before we clear the error
status in "Root Error Status" register, if the same kind of error
is triggered again, since aer_irq() only clears events it saw, the
multi-bit error is left in tact. This will cause the interrupt to fire
again, resulting in entering aer_irq() with just the multi-bit error
logged in the "Root Error Status" register.

Repeated AER recovery test has revealed this condition does happen
and this prevents any new interrupt from being triggered. Allow to
process interrupt even if only multi-correctable (BIT 1) or
multi-uncorrectable bit (BIT 3) is set.

Reported-by: Eric Badger <ebadger@purestorage.com>
Reviewed-by: Ashok Raj <ashok.raj@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/pci/pcie/aer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 9fa1f97e5b27..7952e5efd6cf 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -101,6 +101,11 @@ struct aer_stats {
 #define ERR_COR_ID(d)			(d & 0xffff)
 #define ERR_UNCOR_ID(d)			(d >> 16)
 
+#define AER_ERR_STATUS_MASK		(PCI_ERR_ROOT_UNCOR_RCV |	\
+					PCI_ERR_ROOT_COR_RCV |		\
+					PCI_ERR_ROOT_MULTI_COR_RCV |	\
+					PCI_ERR_ROOT_MULTI_UNCOR_RCV)
+
 static int pcie_aer_disable;
 static pci_ers_result_t aer_root_reset(struct pci_dev *dev);
 
@@ -1196,7 +1201,7 @@ static irqreturn_t aer_irq(int irq, void *context)
 	struct aer_err_source e_src = {};
 
 	pci_read_config_dword(rp, aer + PCI_ERR_ROOT_STATUS, &e_src.status);
-	if (!(e_src.status & (PCI_ERR_ROOT_UNCOR_RCV|PCI_ERR_ROOT_COR_RCV)))
+	if (!(e_src.status & AER_ERR_STATUS_MASK))
 		return IRQ_NONE;
 
 	pci_read_config_dword(rp, aer + PCI_ERR_ROOT_ERR_SRC, &e_src.id);
-- 
2.25.1

