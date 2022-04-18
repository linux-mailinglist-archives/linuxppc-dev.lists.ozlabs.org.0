Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EAF505A8A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 17:06:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khqy25ZWZz2ync
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 01:06:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jZXwt08x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jZXwt08x; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhqxP5V2Vz2xZW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 01:05:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650294330; x=1681830330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mm1ye/WQVxQp/MY2hRmkn81yEIqLrJ2QUUa96JnW2oA=;
 b=jZXwt08xUUsyc1EaZZ/idQM8hJlfOoLWwv3FonVqdCd0y4UZTyINydrA
 nhtlcLqPZAOI7mjiVy1zZdH/zwnebbpZHwHfkr9kNli3+w8C0YZWoxXCX
 qGvGPosFuORAbO8cyCGQrBVbJTUCF5VxTepQr0kksNiqnWSKUbkOT7NTk
 yT83GO6liLiAmQwB0rqCrVx7+0Q6FXoEgHeX22+0UrhGNA02DDRBz9dAb
 rR9Md0tIuhLjJhHTlu8sdU4mNf/L/1v6P1UsXumsbUc46sNr12SNEDF8U
 gsIQW7l6q5G/VZmrDN7M4AjkIHIwEicR6tvRq4KfUWThxEp/To9muswCk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="243467124"
X-IronPort-AV: E=Sophos;i="5.90,270,1643702400"; d="scan'208";a="243467124"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 08:03:08 -0700
X-IronPort-AV: E=Sophos;i="5.90,270,1643702400"; d="scan'208";a="726670038"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2022 08:03:07 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Russell Currey <ruscur@russell.cc>,
 Oliver OHalloran <oohall@gmail.com>
Subject: [PATCH v3] PCI/AER: Handle Multi UnCorrectable/Correctable errors
 properly
Date: Mon, 18 Apr 2022 15:02:37 +0000
Message-Id: <20220418150237.1021519-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

Also note that, for cases with only multi-bit error is set, since this
is not the first occurrence of the error, PCI_ERR_ROOT_ERR_SRC may have
zero or some junk value. So we cannot cleanly process this error
information using aer_isr_one_error(). All we are attempting with this
fix is to make sure error interrupt processing can continue in this
scenario.

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

 # You will get a new IRQ with only multiple ERR_COR bit set
 pcieport <Dev ID>: AER: Root Error Status 0002

Currently, the above issue has been only reproduced in the ICL server
platform.

[Eric: proposed reproducing steps]
Fixes: 4696b828ca37 ("PCI/AER: Hoist aerdrv.c, aer_inject.c up to drivers/pci/pcie/")
Reported-by: Eric Badger <ebadger@purestorage.com>
Reviewed-by: Ashok Raj <ashok.raj@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---

Changes since v2:
 * Added more details to the commit log.
 * Rebased on v5.18-rc1.

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

