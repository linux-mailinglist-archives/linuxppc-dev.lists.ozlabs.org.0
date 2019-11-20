Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7521031C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:52:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HnKv45j0zDqZw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:52:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gD/eav51"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlWc6cVgzDqfb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:52 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id w7so12969413plz.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ffEuiZRwoxy/jWwUkJuQ0W1ws7RxA0qrWc7LrhByu8M=;
 b=gD/eav51lSjZaJfLXQrrKYnQl/ObLzoIzWtr106d/Lx4iTJLPgHWAJ3YJuajg9LN18
 JPa/kJ6Wes/fDdxNJw5I9jzKg7Ae3LhnVt8hUcm9PkT1DrhMyKmOrvFrwX5g7pvgp9XF
 BC5WZcoS/O1GvH4RpL7iTP6UzDkE6hpCeW2nCpxeFuOb1/BPn9CJkbJxY+RPhNS3N2+Z
 4EqxAoOD9ytXz5+Om3/NqwhE3xHLEFpiqswJz4z6qv9HY/cz5UiD2JX0gu2mw3KqTJwr
 AHPoxMa2jiBb8TdRTIy+2pDUTDpA2HHcIrSjeq4F6NqkHXpmXZ7Zu7v46npvwUMrwVCr
 5e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ffEuiZRwoxy/jWwUkJuQ0W1ws7RxA0qrWc7LrhByu8M=;
 b=MpMhT4HDs3v3C3QVd3pDlwy3r/IOXN3GnDhOkA6WWYSFMWh3pcS/6qav6d9Us/JYYz
 6gF+mKO7j5PqWLtuqchiJPJN+7w0qnUzqMhpJZThlxY20/vZPvD2gD2IXes5nGAYHsIy
 QNDIeUIK4vmtoSoZs8YSz2CVlDTLx7w5CDPldyd0aZAKrDt3HxclrrATkBRw8JlEJwdp
 25zUmRx3sFQQJXQv3yj2LNMCl0tw/5dZE6NIJPRULq1EKzlncqHTprnz9WgvcczPrq44
 EmyXzWJAgZG/lTysemeUyEgSPlOnGTC+XbODI0AA9l2r7gqs1seaXOdYDjVXmkIIK6FB
 5vCA==
X-Gm-Message-State: APjAAAUxKrOXwMjvEvKi+Npg6Q7Dhql+lqVvsIMAyTy2Aue8g9djTXcq
 InCNVqqtSMK/DDP/amAfXNHeCytC
X-Google-Smtp-Source: APXvYqwpMW+TM6tlra+Ec6b7IfbWHQVDqRWeQ2ZTPcKMz6/DcZp6Zawt6dphwEWyHoVZCcctIUKacQ==
X-Received: by 2002:a17:90a:2e87:: with SMTP id r7mr674125pjd.21.1574213449353; 
 Tue, 19 Nov 2019 17:30:49 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:49 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 41/46] powernv/eeh: Remove pdn setup for SR-IOV VFs
Date: Wed, 20 Nov 2019 12:28:54 +1100
Message-Id: <20191120012859.23300-42-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120012859.23300-1-oohall@gmail.com>
References: <20191120012859.23300-1-oohall@gmail.com>
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
Cc: alistair@popple.id.au, Oliver O'Halloran <oohall@gmail.com>,
 s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We don't need a pci_dn for the VF any more, so we can skip adding them.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index d111a50fbe68..d3e375d71cdc 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1526,7 +1526,6 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 	for (vf_index = 0; vf_index < num_vfs; vf_index++) {
 		int vf_devfn = pci_iov_virtfn_devfn(pdev, vf_index);
 		int vf_bus = pci_iov_virtfn_bus(pdev, vf_index);
-		struct pci_dn *vf_pdn;
 
 		if (iov->m64_single_mode)
 			pe_num = iov->pe_num_map[vf_index];
@@ -1558,15 +1557,6 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 		list_add_tail(&pe->list, &phb->ioda.pe_list);
 		mutex_unlock(&phb->ioda.pe_list_mutex);
 
-		/* associate this pe to it's pdn */
-		list_for_each_entry(vf_pdn, &pdn->parent->child_list, list) {
-			if (vf_pdn->busno == vf_bus &&
-			    vf_pdn->devfn == vf_devfn) {
-				vf_pdn->pe_number = pe_num;
-				break;
-			}
-		}
-
 		pnv_pci_ioda2_setup_dma_pe(phb, pe);
 #ifdef CONFIG_IOMMU_API
 		iommu_register_group(&pe->table_group,
@@ -1688,17 +1678,11 @@ int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 int pnv_pcibios_sriov_disable(struct pci_dev *pdev)
 {
 	pnv_pci_sriov_disable(pdev);
-
-	/* Release PCI data */
-	remove_sriov_vf_pdns(pdev);
 	return 0;
 }
 
 int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 {
-	/* Allocate PCI data */
-	add_sriov_vf_pdns(pdev);
-
 	return pnv_pci_sriov_enable(pdev, num_vfs);
 }
 #endif /* CONFIG_PCI_IOV */
-- 
2.21.0

