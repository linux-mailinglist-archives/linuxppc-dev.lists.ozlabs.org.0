Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C0621AEFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 07:50:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B32Fs53C7zDqF1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 15:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DLqOqUOa; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B31gW18FfzDrHq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 15:24:23 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id b6so4535992wrs.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 22:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DcM0wquoQP+oo4DewDurr7YaCCp1MlfqSM/65NyMvoc=;
 b=DLqOqUOa4B+tVQvhUIBxUw5nlmkDFcb3SveDxqiMhEK/ZSLq2SW1+5sMlTULX0BT94
 cAbMvvuSD5RznyZyeUGl3eQxSwqe1WGfoPWS1Ogo3XekMAwTHxhryE+I/U3ou3oQvDyF
 ccxsmGIXOVODfo2zlYm+C3/3KbnC9gMIaD84o6z7SSO6gDEV3aELTW5mN1KfSRk9+1vK
 U5WaPFsIuXCEZR3yy/EDet98QUYnJry+zUH51+dZTRNHFhQnIhrhY8o/YNYKDyrS2hj8
 tn6NOBpgmZtSp+37loLOW/bPcx6uLzoSqLGLcBH4IOajGm+mYLxBK8NZP2ELnZ7PYU/3
 aURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DcM0wquoQP+oo4DewDurr7YaCCp1MlfqSM/65NyMvoc=;
 b=JMYc7gEl6cHgasbLnCCR4bZcs0LqaAOM4fc2eCcUefDvPyIXEhkYbBVwGdptNuVqBg
 s/c0CRwjdxV6ONTA081qQc9o1Pw3YllONcJ2R4OpGKuskJdi1LkYIyEuIPdN/ZP1Wh3b
 Vlj70ybB4fS6DOqy5Ys6M/Azyynndn6Bq/LmQqR2ItyzBckdKjjxWMeOsA0wFztSJKn/
 yFBq5Iuuod7vyMA34M6tvB9zskyBNxmnjyt1RfSemflYuJl5IaogysAw0l40BhyfDTZq
 pxFLReuwkF97vxbQbvkjg+GAEu58C59qDsVM5b3KuPZx0cEZrCRaxddDrQeaKPHhKsgG
 eJfw==
X-Gm-Message-State: AOAM530/D3Zp+D1x7Z6L1w4N6BKMvzm3aXL+3V+niO28kEnsQP1PZKnN
 qlbH9jU4t8DYvP3NeVA6XJNTPOP1TrE=
X-Google-Smtp-Source: ABdhPJywiYU2Z5trAalfaGI77dGLeJI43BPsaGx/SJStsSV1vujeNtZS2+J0r3pqbxPVEuvsCPX1mw==
X-Received: by 2002:adf:db86:: with SMTP id u6mr32168177wri.27.1594358659117; 
 Thu, 09 Jul 2020 22:24:19 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au ([220.240.245.68])
 by smtp.gmail.com with ESMTPSA id 92sm9090941wrr.96.2020.07.09.22.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 22:24:18 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/15] powerpc/powernv/pci: Refactor pnv_ioda_alloc_pe()
Date: Fri, 10 Jul 2020 15:23:35 +1000
Message-Id: <20200710052340.737567-11-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710052340.737567-1-oohall@gmail.com>
References: <20200710052340.737567-1-oohall@gmail.com>
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

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
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
index 58c97e60c3db..b4c9bdba7217 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -223,7 +223,7 @@ int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe);
 void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe);
 void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe);
 
-struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb);
+struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb, int count);
 void pnv_ioda_free_pe(struct pnv_ioda_pe *pe);
 
 #ifdef CONFIG_PCI_IOV
-- 
2.26.2

