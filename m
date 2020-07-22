Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FDB2291F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:18:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRdL0xBPzDqyS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:18:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QL+bQrI+; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBR9q56SLzDqvV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:57:51 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id a9so665882pjd.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ab2zru3LbsxkRx8LDlOwi5GsBI6XqfxyDpTcP2Svmfk=;
 b=QL+bQrI+NJSkJCq+Ll63AMOhQCkEo1gRlwPUulmadNezhl7Sailu3mt5lTB7Zj673A
 NjqWHTggNlpWHZXmrHWCfUK8PKH6ITQJVpHE6PSbYgLS6j85hHOlTvnAbbPriAQ2aR4E
 4nRswTDOl3VTi+GXLjW1gtV9fW9uAYoar6Kh85oCAhpGATQETd7Iycw8ukZLPikC63Bk
 nuUo52+y96+9AxFq14tRV9Q5M/r1cSVJ0FReUTOOiVQlB7D37ZSdmwbnTGiox0Hjb5Nv
 tsK0TJ52C5UHY8/MRwiK3rSe5NlpQKSHzX+3voYjEulYhnq2Lxkx5rYDpuM/Dt/iBLgY
 bzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ab2zru3LbsxkRx8LDlOwi5GsBI6XqfxyDpTcP2Svmfk=;
 b=NOMf63VNa6nshcoGQeYYXahitfK5ex6ih+DaNHqZ9XK7iRqpfosS0rd3O6gFNdjpmi
 3ZXqCSWmSbPyWnHIsGvU6RyWnlF1zhvxHT6VrMvta3/hAglqDaK5ItG31WnAO+m3R/fa
 N+JaXVomQxkSRwGR3rxABPGO8QogZ/SxoA4ZmKoi2rp04jkwVnIvILbGb8PLTrqtwkPA
 whVEmaU2+JEF3cr1xRu8MwLlrrEcoih82QNg2s8xzREVl/tk37paVuuc+uTUCZPIYGyc
 qoOXzKwDT6DBUML3tR04N5xRwf0IX1xa29aeQtaO6Qc4l31LfZmhofUuKR3polBNIO5G
 gLcQ==
X-Gm-Message-State: AOAM5318kRXhJOAqa/FESwvsRuXAr8o5ZMQfXfr4fYk1C9r9a17x0Nn5
 vaNwA0X1uz5U/eBqmlJVg66726C3MwU=
X-Google-Smtp-Source: ABdhPJz7utqnnh+ldJ2rLmMc92JwLvnC+VLzfcOMQrMN6gnfStZq/Mk3Po9nugt2JGGO94hgDBFhDg==
X-Received: by 2002:a17:90a:ac14:: with SMTP id
 o20mr8648799pjq.185.1595401068201; 
 Tue, 21 Jul 2020 23:57:48 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id c14sm22645104pfj.82.2020.07.21.23.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:57:47 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 10/16] powerpc/powernv/pci: Refactor pnv_ioda_alloc_pe()
Date: Wed, 22 Jul 2020 16:57:09 +1000
Message-Id: <20200722065715.1432738-10-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722065715.1432738-1-oohall@gmail.com>
References: <20200722065715.1432738-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rework the PE allocation logic to allow allocating blocks of PEs rather
than individually. We'll use this to allocate contigious blocks of PEs for
the SR-IOVs.

This patch also adds code to pnv_ioda_alloc_pe() and pnv_ioda_reserve_pe() to
use the existing, but unused, phb->pe_alloc_mutex. Currently these functions
use atomic bit ops to release a currently allocated PE number. However,
the pnv_ioda_alloc_pe() wants to have exclusive access to the bit map while
scanning for hole large enough to accomodate the allocation size.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: Add some details about the pe_alloc mutex and why we're using it.
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 41 ++++++++++++++++++-----
 arch/powerpc/platforms/powernv/pci.h      |  2 +-
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 2d36a9ebf0e9..c9c25fb0783c 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -145,23 +145,45 @@ static void pnv_ioda_reserve_pe(struct pnv_phb *phb, int pe_no)
 		return;
 	}
 
+	mutex_lock(&phb->ioda.pe_alloc_mutex);
 	if (test_and_set_bit(pe_no, phb->ioda.pe_alloc))
 		pr_debug("%s: PE %x was reserved on PHB#%x\n",
 			 __func__, pe_no, phb->hose->global_number);
+	mutex_unlock(&phb->ioda.pe_alloc_mutex);
 
 	pnv_ioda_init_pe(phb, pe_no);
 }
 
-struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb)
+struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb, int count)
 {
-	long pe;
+	struct pnv_ioda_pe *ret = NULL;
+	int run = 0, pe, i;
 
+	mutex_lock(&phb->ioda.pe_alloc_mutex);
+
+	/* scan backwards for a run of @count cleared bits */
 	for (pe = phb->ioda.total_pe_num - 1; pe >= 0; pe--) {
-		if (!test_and_set_bit(pe, phb->ioda.pe_alloc))
-			return pnv_ioda_init_pe(phb, pe);
+		if (test_bit(pe, phb->ioda.pe_alloc)) {
+			run = 0;
+			continue;
+		}
+
+		run++;
+		if (run == count)
+			break;
 	}
+	if (run != count)
+		goto out;
 
-	return NULL;
+	for (i = pe; i < pe + count; i++) {
+		set_bit(i, phb->ioda.pe_alloc);
+		pnv_ioda_init_pe(phb, i);
+	}
+	ret = &phb->ioda.pe_array[pe];
+
+out:
+	mutex_unlock(&phb->ioda.pe_alloc_mutex);
+	return ret;
 }
 
 void pnv_ioda_free_pe(struct pnv_ioda_pe *pe)
@@ -173,7 +195,10 @@ void pnv_ioda_free_pe(struct pnv_ioda_pe *pe)
 	WARN_ON(pe->npucomp); /* NPUs for nvlink are not supposed to be freed */
 	kfree(pe->npucomp);
 	memset(pe, 0, sizeof(struct pnv_ioda_pe));
+
+	mutex_lock(&phb->ioda.pe_alloc_mutex);
 	clear_bit(pe_num, phb->ioda.pe_alloc);
+	mutex_unlock(&phb->ioda.pe_alloc_mutex);
 }
 
 /* The default M64 BAR is shared by all PEs */
@@ -976,7 +1001,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
 	if (pdn->pe_number != IODA_INVALID_PE)
 		return NULL;
 
-	pe = pnv_ioda_alloc_pe(phb);
+	pe = pnv_ioda_alloc_pe(phb, 1);
 	if (!pe) {
 		pr_warn("%s: Not enough PE# available, disabling device\n",
 			pci_name(dev));
@@ -1047,7 +1072,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
 
 	/* The PE number isn't pinned by M64 */
 	if (!pe)
-		pe = pnv_ioda_alloc_pe(phb);
+		pe = pnv_ioda_alloc_pe(phb, 1);
 
 	if (!pe) {
 		pr_warn("%s: Not enough PE# available for PCI bus %04x:%02x\n",
@@ -3065,7 +3090,7 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 		pnv_ioda_reserve_pe(phb, phb->ioda.root_pe_idx);
 	} else {
 		/* otherwise just allocate one */
-		root_pe = pnv_ioda_alloc_pe(phb);
+		root_pe = pnv_ioda_alloc_pe(phb, 1);
 		phb->ioda.root_pe_idx = root_pe->pe_number;
 	}
 
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 23fc5e391c7f..06431a452130 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -224,7 +224,7 @@ int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe);
 void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe);
 void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe);
 
-struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb);
+struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb, int count);
 void pnv_ioda_free_pe(struct pnv_ioda_pe *pe);
 
 #ifdef CONFIG_PCI_IOV
-- 
2.26.2

