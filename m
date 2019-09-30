Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A55F3C1A26
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 04:12:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hQrx4ts7zDqFm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 12:12:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gpUTBSTD"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hQnJ1ZZnzDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 12:09:07 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id q7so6458210pgi.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Sep 2019 19:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RTVI3ok1pi5ZTGTh8NOoqYXjMZw8tk1g5KZ1fDiav2E=;
 b=gpUTBSTDbKWiOWTYJr4xGS9Bj5qnm3EyE5j0gG4H9K/ZnkE+SlAcuHsMy7sVUhnXqo
 b51BzmFSkky79YX+vwzRmvMqGR6awh+5Vs1QFDk78IcVJV4O6nNptZi65o+rMuSRwlxI
 ZsC3KTRZf2wWRKsYDQoYW39upnSkyZiQ2KGopoKbV5KvwQgRXUMpY+7GKPvFiS6AVuiS
 qEZabFbSu9pLkd/Wy2wRFQg4YyYzUPzCZnobfq9Rn0xFE52RhH6yj4zTZFZF5il1yE+k
 xlbZ5cQ1OaKohFslw5EZef6+CIfInNiN/cuLuO7WX23FJeV6/XaKreGdqdSCHGF8nZdY
 9QOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RTVI3ok1pi5ZTGTh8NOoqYXjMZw8tk1g5KZ1fDiav2E=;
 b=fedIPA+7ayo19KZzx92aoyZyh4ObXpsRYKo3C48PUhTX7c8P6b2WsD6Dl6m4iajAXi
 3OUoW79QQIetH2Zw8UN13Xs3joN5iGYPLo8s427FJ8JgtH9chSDf8dznZyszhdyJXQX6
 Upvr/I1WC26GCVL9iCxYsOiDMjGAzJW//XkkjzAbmb8IYBYlPbci+lpOGmFcJmDCqIv8
 faB/NBdb9f0nZtllJVpURSpY7LHR3lxUWEI0hl2JTMUk0ipAhSQPS8ZMuuwn93d5gyub
 GA78bD+VfmQSw88vVlUZSBJ1rZMplSErl+EN80CmtWDM8WSQqLbOjYpbdraJR1ISG92h
 PQjA==
X-Gm-Message-State: APjAAAXKSiH8iekO6OiR/0YfqEjmMqUQuiVpwTITkrEx9A4a+NBnJn4J
 Eokp6/7zEXKPNvEipVSlLJWwOTVl
X-Google-Smtp-Source: APXvYqxBAsZT6i+qBEIPbNaMB+PAMCM4UoHyB6CPxex2iU6SaH7KeuCaRT4XRG0WiyOqC11i7zEvBw==
X-Received: by 2002:a63:5947:: with SMTP id j7mr6738157pgm.402.1569809345238; 
 Sun, 29 Sep 2019 19:09:05 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id x72sm11450733pfc.89.2019.09.29.19.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2019 19:09:04 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powernv/iov: Ensure the pdn for VFs always contains a
 valid PE number
Date: Mon, 30 Sep 2019 12:08:46 +1000
Message-Id: <20190930020848.25767-2-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190930020848.25767-1-oohall@gmail.com>
References: <20190930020848.25767-1-oohall@gmail.com>
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
Cc: aik@ozlabs.ru, linux-pci@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, shawn@anastas.io
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On PowerNV we use the pcibios_sriov_enable() hook to do two things:

1. Create a pci_dn structure for each of the VFs, and
2. Configure the PHB's internal BARs that map MMIO ranges to PEs
   so that each VF has it's own PE. Note that the PE also determines
   the IOMMU table the HW uses for the device.

Currently we do not set the pe_number field of the pci_dn immediately after
assigning the PE number for the VF that it represents. Instead, we do that
in a fixup (see pnv_pci_dma_dev_setup) which is run inside the
pcibios_add_device() hook which is run prior to adding the device to the
bus.

On PowerNV we add the device to it's IOMMU group using a bus notifier and
in order for this to work the PE number needs to be known when the bus
notifier is run. This works today since the PE number is set in the fixup
which runs before adding the device to the bus. However, if we want to move
the fixup to a later stage this will break.

We can fix this by setting the pdn->pe_number inside of
pcibios_sriov_enable(). There's no good to avoid this since we already have
all the required information at that point, so... do that. Moving this
earlier does cause two problems:

1. We trip the WARN_ON() in the fixup code, and
2. The EEH core will clear pdn->pe_number while recovering VFs.

The only justification for either of these is a comment in eeh_rmv_device()
suggesting that pdn->pe_number *must* be set to IODA_INVALID_PE in order
for the VF to be scanned. However, this comment appears to have no basis in
reality so just delete it.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
Can't get rid of the fixup entirely since we need it to set the
ioda_pe->pdev back-pointer. I'll look at killing that another time.
---
 arch/powerpc/kernel/eeh_driver.c          |  6 ------
 arch/powerpc/platforms/powernv/pci-ioda.c | 19 +++++++++++++++----
 arch/powerpc/platforms/powernv/pci.c      |  4 ----
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index d9279d0..7955fba 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -541,12 +541,6 @@ static void eeh_rmv_device(struct eeh_dev *edev, void *userdata)
 
 		pci_iov_remove_virtfn(edev->physfn, pdn->vf_index);
 		edev->pdev = NULL;
-
-		/*
-		 * We have to set the VF PE number to invalid one, which is
-		 * required to plug the VF successfully.
-		 */
-		pdn->pe_number = IODA_INVALID_PE;
 #endif
 		if (rmv_data)
 			list_add(&edev->rmv_entry, &rmv_data->removed_vf_list);
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 5e3172d..70508b3 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1558,6 +1558,10 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 
 	/* Reserve PE for each VF */
 	for (vf_index = 0; vf_index < num_vfs; vf_index++) {
+		int vf_devfn = pci_iov_virtfn_devfn(pdev, vf_index);
+		int vf_bus = pci_iov_virtfn_bus(pdev, vf_index);
+		struct pci_dn *vf_pdn;
+
 		if (pdn->m64_single_mode)
 			pe_num = pdn->pe_num_map[vf_index];
 		else
@@ -1570,13 +1574,11 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 		pe->pbus = NULL;
 		pe->parent_dev = pdev;
 		pe->mve_number = -1;
-		pe->rid = (pci_iov_virtfn_bus(pdev, vf_index) << 8) |
-			   pci_iov_virtfn_devfn(pdev, vf_index);
+		pe->rid = (vf_bus << 8) | vf_devfn;
 
 		pe_info(pe, "VF %04d:%02d:%02d.%d associated with PE#%x\n",
 			hose->global_number, pdev->bus->number,
-			PCI_SLOT(pci_iov_virtfn_devfn(pdev, vf_index)),
-			PCI_FUNC(pci_iov_virtfn_devfn(pdev, vf_index)), pe_num);
+			PCI_SLOT(vf_devfn), PCI_FUNC(vf_devfn), pe_num);
 
 		if (pnv_ioda_configure_pe(phb, pe)) {
 			/* XXX What do we do here ? */
@@ -1590,6 +1592,15 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 		list_add_tail(&pe->list, &phb->ioda.pe_list);
 		mutex_unlock(&phb->ioda.pe_list_mutex);
 
+		/* associate this pe to it's pdn */
+		list_for_each_entry(vf_pdn, &pdn->parent->child_list, list) {
+			if (vf_pdn->busno == vf_bus &&
+			    vf_pdn->devfn == vf_devfn) {
+				vf_pdn->pe_number = pe_num;
+				break;
+			}
+		}
+
 		pnv_pci_ioda2_setup_dma_pe(phb, pe);
 #ifdef CONFIG_IOMMU_API
 		iommu_register_group(&pe->table_group,
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 2825d00..b7761e2 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -816,16 +816,12 @@ void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
 	struct pnv_phb *phb = hose->private_data;
 #ifdef CONFIG_PCI_IOV
 	struct pnv_ioda_pe *pe;
-	struct pci_dn *pdn;
 
 	/* Fix the VF pdn PE number */
 	if (pdev->is_virtfn) {
-		pdn = pci_get_pdn(pdev);
-		WARN_ON(pdn->pe_number != IODA_INVALID_PE);
 		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
 			if (pe->rid == ((pdev->bus->number << 8) |
 			    (pdev->devfn & 0xff))) {
-				pdn->pe_number = pe->pe_number;
 				pe->pdev = pdev;
 				break;
 			}
-- 
2.9.5

