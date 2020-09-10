Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA9B263CBE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 07:51:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn7Ky0DnyzDqc6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 15:51:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lYDmIwhH; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn7Ch34QQzDqYW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 15:45:51 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id s65so2578122pgb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Sep 2020 22:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=23k9vBgkV/hNU6p5yvO4/vd6lQ18G2LoW/JuuCHHXrU=;
 b=lYDmIwhHwSRo21c8XfuEbhIFHAXgcgrU26FsEIQQUfEsyEL8TkPphV3x5NrUtvll3M
 tXBIobN1Aohw/nQU51UHt0GOgMcKoFcVehi40T8ETjidRSkhYAr1W+jDrT0rMiuFIKtZ
 pKgRs5CrUn3+t4uc7Lbt8w5U5qVjeANgbMxNS1JHfOGDVMYqH7x6yHP4ieuHHd6pqasx
 MNiv+9XuX5czr4/jq3KjfPAFhILAiuzlzIRnbkW0Bm0pBITyeQCiDb02yaPrH5YtV8wN
 2oXAD/Hfp9JGwi8cnt2Z4i41wgCHHrnXhBzvOSZW5yhEYpLxObAUj9f+fYnna+0IKJKo
 gLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=23k9vBgkV/hNU6p5yvO4/vd6lQ18G2LoW/JuuCHHXrU=;
 b=a0swkJRSHqaszibt89pmv0sKqONTxFCGSFoqTO6LcMVYTal3jePENBbUiMYYwujevs
 2xAT+Cf3hHaPyuTucBM6d0fz62rINdrXnMmxMDp9dFxspRpCJp7LDh9hDIJ7FHsXPRaz
 /2TBUfxC0Xd5IeIZ5ZSWIPqu2rsJN5y2RZXjZq+todrrHorUa4JHuvVMraIVhuiJkcOa
 SyY1EnUYNUwm2NFiaxS+/iaq8qs83T9aExuDqBCv9t8toex+7jzOEpn1qn6u4ik3JQ5a
 aKtxr9gipIF9D3pZ6IPdBHYFTGRqr6h+lCx0Pl5ot1ddIibYsnl0vYSxiDSnVaIX7dBa
 7RbA==
X-Gm-Message-State: AOAM530MKw/OVxatrURDtMmJXS7ewGF8vhwer+iZY652c71BTokg+PdT
 sN+YNiIhjo5GzNpmKLzePsO/AoEQ6gj1cw==
X-Google-Smtp-Source: ABdhPJxtzS9E/HJeMss4LWXs9oF/s88fDIZTtd2yt3Uq4pxzUwrydhw6ulgZoI/9BGgcxHrMOew0UA==
X-Received: by 2002:a63:e345:: with SMTP id o5mr3313983pgj.208.1599716749779; 
 Wed, 09 Sep 2020 22:45:49 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id o30sm3960374pgc.45.2020.09.09.22.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 22:45:49 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/9] powerpc/powernv: Stop using eeh_ops->init()
Date: Thu, 10 Sep 2020 15:45:25 +1000
Message-Id: <20200910054532.2043724-3-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910054532.2043724-1-oohall@gmail.com>
References: <20200910054532.2043724-1-oohall@gmail.com>
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

Fold pnv_eeh_init() into eeh_powernv_init() rather than having eeh_init()
call it via eeh_ops->init(). It's simpler and it'll let us delete
eeh_ops.init.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 94 ++++++++++----------
 1 file changed, 45 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index a550f837ccb5..03e566874595 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -44,54 +44,6 @@ void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
 	eeh_probe_device(pdev);
 }
 
-static int pnv_eeh_init(void)
-{
-	struct pci_controller *hose;
-	struct pnv_phb *phb;
-	int max_diag_size = PNV_PCI_DIAG_BUF_SIZE;
-
-	if (!firmware_has_feature(FW_FEATURE_OPAL)) {
-		pr_warn("%s: OPAL is required !\n",
-			__func__);
-		return -EINVAL;
-	}
-
-	/* Set probe mode */
-	eeh_add_flag(EEH_PROBE_MODE_DEV);
-
-	/*
-	 * P7IOC blocks PCI config access to frozen PE, but PHB3
-	 * doesn't do that. So we have to selectively enable I/O
-	 * prior to collecting error log.
-	 */
-	list_for_each_entry(hose, &hose_list, list_node) {
-		phb = hose->private_data;
-
-		if (phb->model == PNV_PHB_MODEL_P7IOC)
-			eeh_add_flag(EEH_ENABLE_IO_FOR_LOG);
-
-		if (phb->diag_data_size > max_diag_size)
-			max_diag_size = phb->diag_data_size;
-
-		/*
-		 * PE#0 should be regarded as valid by EEH core
-		 * if it's not the reserved one. Currently, we
-		 * have the reserved PE#255 and PE#127 for PHB3
-		 * and P7IOC separately. So we should regard
-		 * PE#0 as valid for PHB3 and P7IOC.
-		 */
-		if (phb->ioda.reserved_pe_idx != 0)
-			eeh_add_flag(EEH_VALID_PE_ZERO);
-
-		break;
-	}
-
-	eeh_set_pe_aux_size(max_diag_size);
-	ppc_md.pcibios_bus_add_device = pnv_pcibios_bus_add_device;
-
-	return 0;
-}
-
 static irqreturn_t pnv_eeh_event(int irq, void *data)
 {
 	/*
@@ -1674,7 +1626,6 @@ static int pnv_eeh_restore_config(struct eeh_dev *edev)
 
 static struct eeh_ops pnv_eeh_ops = {
 	.name                   = "powernv",
-	.init                   = pnv_eeh_init,
 	.probe			= pnv_eeh_probe,
 	.set_option             = pnv_eeh_set_option,
 	.get_state              = pnv_eeh_get_state,
@@ -1715,8 +1666,53 @@ DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID, pnv_pci_fixup_vf_mps);
  */
 static int __init eeh_powernv_init(void)
 {
+	int max_diag_size = PNV_PCI_DIAG_BUF_SIZE;
+	struct pci_controller *hose;
+	struct pnv_phb *phb;
 	int ret = -EINVAL;
 
+	if (!firmware_has_feature(FW_FEATURE_OPAL)) {
+		pr_warn("%s: OPAL is required !\n", __func__);
+		return -EINVAL;
+	}
+
+	/* Set probe mode */
+	eeh_add_flag(EEH_PROBE_MODE_DEV);
+
+	/*
+	 * P7IOC blocks PCI config access to frozen PE, but PHB3
+	 * doesn't do that. So we have to selectively enable I/O
+	 * prior to collecting error log.
+	 */
+	list_for_each_entry(hose, &hose_list, list_node) {
+		phb = hose->private_data;
+
+		if (phb->model == PNV_PHB_MODEL_P7IOC)
+			eeh_add_flag(EEH_ENABLE_IO_FOR_LOG);
+
+		if (phb->diag_data_size > max_diag_size)
+			max_diag_size = phb->diag_data_size;
+
+		/*
+		 * PE#0 should be regarded as valid by EEH core
+		 * if it's not the reserved one. Currently, we
+		 * have the reserved PE#255 and PE#127 for PHB3
+		 * and P7IOC separately. So we should regard
+		 * PE#0 as valid for PHB3 and P7IOC.
+		 */
+		if (phb->ioda.reserved_pe_idx != 0)
+			eeh_add_flag(EEH_VALID_PE_ZERO);
+
+		break;
+	}
+
+	/*
+	 * eeh_init() allocates the eeh_pe and its aux data buf so the
+	 * size needs to be set before calling eeh_init().
+	 */
+	eeh_set_pe_aux_size(max_diag_size);
+	ppc_md.pcibios_bus_add_device = pnv_pcibios_bus_add_device;
+
 	ret = eeh_init(&pnv_eeh_ops);
 	if (!ret)
 		pr_info("EEH: PowerNV platform initialized\n");
-- 
2.26.2

