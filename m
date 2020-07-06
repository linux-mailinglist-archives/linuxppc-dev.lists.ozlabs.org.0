Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF23215115
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 04:06:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0TTS73wkzDqPF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 12:06:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VwSd0q7J; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0SqB2dVGzDqZq
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 11:37:10 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id f18so40214620wml.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 18:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aadEXe3E5yNGms/5w6g7hJysAqcbDp3E2kOo9ped8T8=;
 b=VwSd0q7J1BV3YS2RSGSv6gZdi58AyGFPnaMCJ7jSiNMJGHMuTlqex8sCLjbzzud3FK
 iW13R+WzkIFjhiyGW8LT7RtkJ05Wf186wcYRBpr5j8mPDMQcJBzWsMRYZeDcwAcVrd8c
 LBfgqVUANGK6/nRAXnmMscEzctiaN/m8BnV1syNat/zmq7f3rI1nYcGEz9nfqlaPoBWz
 RIeK300BETWmU/VbbP6vBaYbRvpHTRPyi61MKzhHGhbmq044j2IUP3q3diL1PoPOXLul
 g30dy9KX3pcNEkM9vDoyxStYAjUCHKNOLOBNtpSoBVxic2+kljsq/duq3vPQDb3TZd6O
 OlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aadEXe3E5yNGms/5w6g7hJysAqcbDp3E2kOo9ped8T8=;
 b=Yq+V5KSNK2ObjmqsvEqiFYINbZZgPOqT2jVloXoyYGf4+t43IL+GlYeG44vQOnd58w
 zJR4LpqRsLPlrKxJ8tSIe0eAK8SdjyUMA02Gbw3EjKtkLLH6TBltyQktN12Oe7X2JcKl
 iYQbTv1/+aAWM8whqtObP0hv49z+MWhgT/laD3UGWfqfvyccAeme0dhfpY1s//XRG9xg
 KzxUNsVP+Uq7a0RJZrlCH+qofXDJWdZK+NCAmimoFolF8hss6Fl2Ju5h/AluEtI6mFj6
 zXntJfr7Zbozzz7inAicJ0K1nNIWLMdHhN2vqtzfA03ZIq7HeYbbx8f8J7PjRJgRtAIM
 ukiw==
X-Gm-Message-State: AOAM531E1VVoG9pkAXUC4RyfV+ldvi8TkNPxSy3BOlZXjO0Deq3p+/DO
 rM0Yy62e5EYKd4Uw3glLQZotJ59cJhI=
X-Google-Smtp-Source: ABdhPJzAQ+IcNO6+EW0dQ9TJFekj8wgaXWZStZ437ZWbLr0yTB2f3+Sy2dZNPqdsURtwozWe2pGc4g==
X-Received: by 2002:a7b:cc17:: with SMTP id f23mr45499121wmh.41.1593999426621; 
 Sun, 05 Jul 2020 18:37:06 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au (59-102-73-59.tpgi.com.au.
 [59.102.73.59])
 by smtp.gmail.com with ESMTPSA id v6sm9533392wrr.85.2020.07.05.18.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 18:37:06 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/14] powerpc/eeh: Remove class code field from edev
Date: Mon,  6 Jul 2020 11:36:16 +1000
Message-Id: <20200706013619.459420-12-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200706013619.459420-1-oohall@gmail.com>
References: <20200706013619.459420-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The edev->class_code field is never referenced anywhere except for the
platform specific probe functions. The same information is available in
the pci_dev for PowerNV and in the pci_dn on pseries so we can remove
the field.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h               | 1 -
 arch/powerpc/platforms/powernv/eeh-powernv.c | 5 ++---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 293a55dc803b..a2f7ed204ece 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -133,7 +133,6 @@ static inline bool eeh_pe_passed(struct eeh_pe *pe)
 
 struct eeh_dev {
 	int mode;			/* EEH mode			*/
-	int class_code;			/* Class code of the device	*/
 	int bdfn;			/* bdfn of device (for cfg ops) */
 	struct pci_controller *controller;
 	int pe_config_addr;		/* PE config address		*/
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index c9f2f454d053..7cbb03a97a61 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -372,19 +372,18 @@ static struct eeh_dev *pnv_eeh_probe(struct pci_dev *pdev)
 	}
 
 	/* Skip for PCI-ISA bridge */
-	if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_ISA)
+	if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_ISA)
 		return NULL;
 
 	eeh_edev_dbg(edev, "Probing device\n");
 
 	/* Initialize eeh device */
-	edev->class_code = pdn->class_code;
 	edev->mode	&= 0xFFFFFF00;
 	edev->pcix_cap = pnv_eeh_find_cap(pdn, PCI_CAP_ID_PCIX);
 	edev->pcie_cap = pnv_eeh_find_cap(pdn, PCI_CAP_ID_EXP);
 	edev->af_cap   = pnv_eeh_find_cap(pdn, PCI_CAP_ID_AF);
 	edev->aer_cap  = pnv_eeh_find_ecap(pdn, PCI_EXT_CAP_ID_ERR);
-	if ((edev->class_code >> 8) == PCI_CLASS_BRIDGE_PCI) {
+	if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_PCI) {
 		edev->mode |= EEH_DEV_BRIDGE;
 		if (edev->pcie_cap) {
 			pnv_pci_cfg_read(pdn, edev->pcie_cap + PCI_EXP_FLAGS,
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index e75579b857ce..daf6caeca8f0 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -273,12 +273,11 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 	 * correctly reflects that current device is root port
 	 * or PCIe switch downstream port.
 	 */
-	edev->class_code = pdn->class_code;
 	edev->pcix_cap = pseries_eeh_find_cap(pdn, PCI_CAP_ID_PCIX);
 	edev->pcie_cap = pseries_eeh_find_cap(pdn, PCI_CAP_ID_EXP);
 	edev->aer_cap = pseries_eeh_find_ecap(pdn, PCI_EXT_CAP_ID_ERR);
 	edev->mode &= 0xFFFFFF00;
-	if ((edev->class_code >> 8) == PCI_CLASS_BRIDGE_PCI) {
+	if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_PCI) {
 		edev->mode |= EEH_DEV_BRIDGE;
 		if (edev->pcie_cap) {
 			rtas_read_config(pdn, edev->pcie_cap + PCI_EXP_FLAGS,
-- 
2.26.2

