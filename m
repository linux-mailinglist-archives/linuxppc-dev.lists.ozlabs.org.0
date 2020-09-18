Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F5126F95E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 11:34:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt7w048BHzDqnG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 19:34:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KQJcye55; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt7qx41YCzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 19:31:08 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id k8so3090218pfk.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 02:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K9irvCJzuVhbVVR4wetz8ZAi1ZGJ/uKYlexQjpBky2w=;
 b=KQJcye558Jmf8NQEfHSVFQWVUY+69HC0L3fAEGdYrHb3eWi9KtlOm0JYM9b7igcn/A
 lrdY6ngJ2+8eIMGk9RrR71RHR5qqdhVRIfCpq7U4i8P7tbZq+3JGME+TxYVv5t8TF9g9
 bMHQQRtgh0DzF5AVfiIWAkjL5LJ/n4gwdlpKFYbJzdPH6R2AoMo98pwfvQbw/Gxbl3Af
 7Kn4N1PaZi2zyDZe/AuiIygd1YDCvsI0aKV0Qrh2GXtg7VksVL2uRnrrofCQFdOWJQbq
 F5WdjRlFteRMf1s4vAWWCt5WhABn9qhSAlmrnxSZWDF04vTQZxzydkFBErfQKcelOfij
 Z35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K9irvCJzuVhbVVR4wetz8ZAi1ZGJ/uKYlexQjpBky2w=;
 b=IlDLvFI70oVkx0dCYI1djpSSxBk2QrvXL3Qi6o1T17JHfCHnBauMaT4oBCXLwuBr3i
 LTFDI+4K3uVMceYtmOvsbVpJvSroAglfoe0jK2SQ1ipoKn6rXlALw8yJEx28Gk/Vuvqn
 /6jV90Nq2Gni+y2xnerHBl0mCca40r0EnztIEHcfuJ2pgu4TOyHSHQVUYpSylw7L/ES4
 M6C7+gMDllDNVpYyUy9EkZFeJJeqhCu78KO7GHhoe9dLuYSrQdMKJUHHM0VB8Vk9dbCS
 JWRqCEiDxtuMx11OJjhMlpWA/TiStYne4a7uoMfZlkUSOjkJE8vhMlHlTeDzlBlh5CB+
 mi1A==
X-Gm-Message-State: AOAM530V0U2ehFKb2ZkiJ87uN5nPr9CSSq4jplKsl3bMvXQ2FLXt7CvS
 iBtGw5B48zyHgrUOTrrCEgqhitbGrLqz1A==
X-Google-Smtp-Source: ABdhPJzfIoTIJXLesaYMgawTV9YFojGlRkM6JwfjFokNvKEUvY7meagqUw+XQ0BVQcQ7javSgg94fw==
X-Received: by 2002:a63:1016:: with SMTP id f22mr26138469pgl.226.1600421465180; 
 Fri, 18 Sep 2020 02:31:05 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id cf7sm2258853pjb.52.2020.09.18.02.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 02:31:04 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/9] powerpc/powernv: Stop using eeh_ops->init()
Date: Fri, 18 Sep 2020 19:30:43 +1000
Message-Id: <20200918093050.37344-2-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200918093050.37344-1-oohall@gmail.com>
References: <20200918093050.37344-1-oohall@gmail.com>
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
index 3eb0f2439da8..8b0fb6c8b8d9 100644
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
@@ -1697,8 +1648,53 @@ static struct eeh_ops pnv_eeh_ops = {
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

