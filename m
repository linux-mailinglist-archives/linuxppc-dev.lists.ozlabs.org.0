Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132CA4D9394
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 06:10:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHhLp43dPz3bXL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 16:10:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kfUyLqyX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kfUyLqyX; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHhL723FYz2yhC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 16:10:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647321007; x=1678857007;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oJuv0Z8dvZxqgVY1+X5D78/R17rRg7H8XXZJ/5nQQ3A=;
 b=kfUyLqyXb/iqq/NKIIACtja1eooU+mxcFSxo74cIN8+UHlPVNJ3arVcp
 IVTEH1W7q9N2bgMBo3PVmzuz5sxDhjO9c06dMta9I+uPrHHH19WG8b8Oc
 NEUbyZ4g+qE+CsFBB40uGCcUbsR8HMPPb6FiiqEVzvCVyf/VJ59MEuYUK
 sKatDAVKq3P4pvZ+QroDn7GuQykusooYaHECNmmLb086o9UPgL2fUQTeT
 JphotTitPSSXeVubSk4dT0umngnqzfGHUobluW/VJlPhhfyJ/rvbGc4zP
 Y4eU3YAlG7byU+NYVXIifdtf7BO6foyJxuNAL2deM6OcoLeON+4E4fre7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="243665578"
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="243665578"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 22:09:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="580384681"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 22:08:55 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Russell Currey <ruscur@russell.cc>,
 Oliver OHalloran <oohall@gmail.com>
Subject: [PATCH v2] PCI/AER: Handle Multi UnCorrectable/Correctable errors
 properly
Date: Tue, 15 Mar 2022 05:08:42 +0000
Message-Id: <20220315050842.120063-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Cc: linux-pci@vger.kernel.org,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

This error can be reproduced by making following changes to the
aer_irq() function and by executing the given test commands.

 static irqreturn_t aer_irq(int irq, void *context)
         struct aer_err_source e_src = {};

         pci_read_config_dword(rp, aer + PCI_ERR_ROOT_STATUS,
				&e_src.status);
 +       pci_dbg(pdev->port, "Root Error Status: %04x\n",
 +		e_src.status);
         if (!(e_src.status & AER_ERR_STATUS_MASK))
                 return IRQ_NONE;

 +       mdelay(5000);

 # Prep injection data for a correctable error.
 $ cd /sys/kernel/debug/apei/einj
 $ echo 0x00000040 > error_type
 $ echo 0x4 > flags
 $ echo 0x891000 > param4

 # Root Error Status is initially clear
 $ setpci -s <Dev ID> ECAP0001+0x30.w
 0000

 # Inject one error
 $ echo 1 > error_inject

 # Interrupt received
 pcieport <Dev ID>: AER: Root Error Status 0001

 # Inject another error (within 5 seconds)
 $ echo 1 > error_inject

 # No interrupt received, but "multiple ERR_COR" is now set
 $ setpci -s <Dev ID> ECAP0001+0x30.w
 0003

 # Wait for a while, then clear ERR_COR. A new interrupt immediately
   fires.
 $ setpci -s <Dev ID> ECAP0001+0x30.w=0x1
 pcieport <Dev ID>: AER: Root Error Status 0002

Currently, the above issue has been only reproduced in the ICL server
platform.

[Eric: proposed reproducing steps]
Fixes: 4696b828ca37 ("PCI/AER: Hoist aerdrv.c, aer_inject.c up to drivers/pci/pcie/")
Reported-by: Eric Badger <ebadger@purestorage.com>
Reviewed-by: Ashok Raj <ashok.raj@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---

Changes since v1:
 * Added Fixes tag.
 * Included reproducing steps proposed by Eric.

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

