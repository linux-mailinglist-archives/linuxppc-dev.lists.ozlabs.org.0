Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AB01AF160
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 17:00:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494GNG73qyzDrpw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 01:00:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=gZoI0R8F; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494FzV62mLzDrfT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 00:42:14 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6582022253;
 Sat, 18 Apr 2020 14:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587220933;
 bh=t8ELidcRfJWgFD6Yaefs6KTpIll3Zwk7H1XPAqtaCJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gZoI0R8FsLcCcm++7S5a71C6VnzCoSwQMqxwGSBf99bc/Cs1BT0UroWjRSLYkusNz
 Yj6zZiIAJbz42S/sslInYCIE8dldHP4mwJ08HnZxGE/eZncS26hAQdY8WFkpHuqriM
 +Jh0j8/6U3rMmHLxSTL2SemodcS3nF+1ML2OsUl4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 69/78] powerpc/powernv/ioda: Fix ref count for
 devices with their own PE
Date: Sat, 18 Apr 2020 10:40:38 -0400
Message-Id: <20200418144047.9013-69-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418144047.9013-1-sashal@kernel.org>
References: <20200418144047.9013-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Frederic Barrat <fbarrat@linux.ibm.com>

[ Upstream commit 05dd7da76986937fb288b4213b1fa10dbe0d1b33 ]

The pci_dn structure used to store a pointer to the struct pci_dev, so
taking a reference on the device was required. However, the pci_dev
pointer was later removed from the pci_dn structure, but the reference
was kept for the npu device.
See commit 902bdc57451c ("powerpc/powernv/idoa: Remove unnecessary
pcidev from pci_dn").

We don't need to take a reference on the device when assigning the PE
as the struct pnv_ioda_pe is cleaned up at the same time as
the (physical) device is released. Doing so prevents the device from
being released, which is a problem for opencapi devices, since we want
to be able to remove them through PCI hotplug.

Now the ugly part: nvlink npu devices are not meant to be
released. Because of the above, we've always leaked a reference and
simply removing it now is dangerous and would likely require more
work. There's currently no release device callback for nvlink devices
for example. So to be safe, this patch leaks a reference on the npu
device, but only for nvlink and not opencapi.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191121134918.7155-2-fbarrat@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 058223233088e..e9cda7e316a50 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1062,14 +1062,13 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
 		return NULL;
 	}
 
-	/* NOTE: We get only one ref to the pci_dev for the pdn, not for the
-	 * pointer in the PE data structure, both should be destroyed at the
-	 * same time. However, this needs to be looked at more closely again
-	 * once we actually start removing things (Hotplug, SR-IOV, ...)
+	/* NOTE: We don't get a reference for the pointer in the PE
+	 * data structure, both the device and PE structures should be
+	 * destroyed at the same time. However, removing nvlink
+	 * devices will need some work.
 	 *
 	 * At some point we want to remove the PDN completely anyways
 	 */
-	pci_dev_get(dev);
 	pdn->pe_number = pe->pe_number;
 	pe->flags = PNV_IODA_PE_DEV;
 	pe->pdev = dev;
@@ -1084,7 +1083,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
 		pnv_ioda_free_pe(pe);
 		pdn->pe_number = IODA_INVALID_PE;
 		pe->pdev = NULL;
-		pci_dev_put(dev);
 		return NULL;
 	}
 
@@ -1205,6 +1203,14 @@ static struct pnv_ioda_pe *pnv_ioda_setup_npu_PE(struct pci_dev *npu_pdev)
 	struct pci_controller *hose = pci_bus_to_host(npu_pdev->bus);
 	struct pnv_phb *phb = hose->private_data;
 
+	/*
+	 * Intentionally leak a reference on the npu device (for
+	 * nvlink only; this is not an opencapi path) to make sure it
+	 * never goes away, as it's been the case all along and some
+	 * work is needed otherwise.
+	 */
+	pci_dev_get(npu_pdev);
+
 	/*
 	 * Due to a hardware errata PE#0 on the NPU is reserved for
 	 * error handling. This means we only have three PEs remaining
@@ -1228,7 +1234,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_npu_PE(struct pci_dev *npu_pdev)
 			 */
 			dev_info(&npu_pdev->dev,
 				"Associating to existing PE %x\n", pe_num);
-			pci_dev_get(npu_pdev);
 			npu_pdn = pci_get_pdn(npu_pdev);
 			rid = npu_pdev->bus->number << 8 | npu_pdn->devfn;
 			npu_pdn->pe_number = pe_num;
-- 
2.20.1

