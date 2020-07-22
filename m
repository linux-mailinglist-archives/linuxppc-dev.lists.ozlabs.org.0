Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD39228F45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:38:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBN4v1PfbzDqND
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:38:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WK8nECfF; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBMqg00sbzDqfb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:26:54 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id mn17so489919pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KzL6Vf0zQ8+A4li13aububSj08meRJo4nJmerUw7F/c=;
 b=WK8nECfF1+E/Z+LpTCTojhZDVUvMVhuJc0SRGx+uzn30eWD+Mb912Zh2rYcRLjKwhY
 m+RU9xKRvVtUVK/y2T6er4VITuptKsRULJxdwh7S3sfiMa2hJtKc5+uPvuAl+axQw5Z9
 1eu+jfNAAdkmWEkHCTBXgGHed32lvLyXRSiFmZ25yQIvTbR0xKtec8vrrmKfHBVNUNHV
 2/8sa3lOL+sXLw/rCRg3y6KFJQxEsV95kXHzTl8kr1KQXaj9iJq9FX1wrZcGTCDgWhew
 a0Nlo06RcYteQRMM8smT1Gkgb2MdwrK1kzsA4P8mb8uan37H8aNkcKtvhFpNOanVh3bV
 ALkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KzL6Vf0zQ8+A4li13aububSj08meRJo4nJmerUw7F/c=;
 b=a1Stjgs15s5sTWzllXUjmDj3ytUPHRZIZZrxXt+QNHYfI3AEGZ+ndLyUazyXyHX8Gs
 0iZ0e+2PQHEVcB6FQEgN0C8JvZu8auTSDhCt3rxaGys8b673UTNmbXDv8Y3J6Yrzvpy1
 0RP/kmcl8oIXK79oZJjQzo3Q4/6iYMHMETMnh+Eeet22NNYmJXo4IGSMoQLN2jpNXZZr
 IV1rSqZlfqEFFlfMuJJiwtkqFQ5jihlBPkBKD2UJJxUWRnVDEbuZxsaxiT0Pf0J/Tnpa
 KMGCJ+GEAg06zN8l+CreMcNSziq6JX5BIpbBfCiBcVPo7b8n6y1gP7YF+IIVmT7fCjjz
 Eqpg==
X-Gm-Message-State: AOAM532CHEeMpkWPvBr2JO1AHZ0vA54vthJcVvy7/xuWnkkbR6vswIW3
 IBxKX3I3aTeJtolcgjFAnmB+2fLOI8g=
X-Google-Smtp-Source: ABdhPJwXByS3qYbK6yASFXXmN4OZkDxFliNZ85rNM6qYdpauugW6sPrmabM6YzAGxUH+pSKEhc6Oew==
X-Received: by 2002:a17:90a:ba92:: with SMTP id
 t18mr8138035pjr.121.1595392012104; 
 Tue, 21 Jul 2020 21:26:52 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id d4sm20583709pgf.9.2020.07.21.21.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 21:26:51 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/14] powerpc/eeh: Kill off eeh_ops->get_pe_addr()
Date: Wed, 22 Jul 2020 14:26:19 +1000
Message-Id: <20200722042628.1425880-5-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722042628.1425880-1-oohall@gmail.com>
References: <20200722042628.1425880-1-oohall@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is used in precisely one place which is in pseries specific platform
code.  There's no need to have the callback in eeh_ops since the platform
chooses the EEH PE addresses anyway. The PowerNV implementation has always
been a stub too so remove it.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
v2: Made "buid" in pseries_eeh_get_pe_addr() an unsigned long to match
    the pci_controller type.
---
 arch/powerpc/include/asm/eeh.h               |  1 -
 arch/powerpc/platforms/powernv/eeh-powernv.c | 13 ------------
 arch/powerpc/platforms/pseries/eeh_pseries.c | 22 ++++++++++----------
 3 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 9c5ba535f6a1..d619012281bd 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -220,7 +220,6 @@ struct eeh_ops {
 	int (*init)(void);
 	struct eeh_dev *(*probe)(struct pci_dev *pdev);
 	int (*set_option)(struct eeh_pe *pe, int option);
-	int (*get_pe_addr)(struct eeh_pe *pe);
 	int (*get_state)(struct eeh_pe *pe, int *delay);
 	int (*reset)(struct eeh_pe *pe, int option);
 	int (*get_log)(struct eeh_pe *pe, int severity, char *drv_log, unsigned long len);
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 79409e005fcd..bcd0515d8f79 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -535,18 +535,6 @@ static int pnv_eeh_set_option(struct eeh_pe *pe, int option)
 	return 0;
 }
 
-/**
- * pnv_eeh_get_pe_addr - Retrieve PE address
- * @pe: EEH PE
- *
- * Retrieve the PE address according to the given tranditional
- * PCI BDF (Bus/Device/Function) address.
- */
-static int pnv_eeh_get_pe_addr(struct eeh_pe *pe)
-{
-	return pe->addr;
-}
-
 static void pnv_eeh_get_phb_diag(struct eeh_pe *pe)
 {
 	struct pnv_phb *phb = pe->phb->private_data;
@@ -1670,7 +1658,6 @@ static struct eeh_ops pnv_eeh_ops = {
 	.init                   = pnv_eeh_init,
 	.probe			= pnv_eeh_probe,
 	.set_option             = pnv_eeh_set_option,
-	.get_pe_addr            = pnv_eeh_get_pe_addr,
 	.get_state              = pnv_eeh_get_state,
 	.reset                  = pnv_eeh_reset,
 	.get_log                = pnv_eeh_get_log,
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 18a2522b9b5e..bcc72b9a5309 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -32,6 +32,8 @@
 #include <asm/ppc-pci.h>
 #include <asm/rtas.h>
 
+static int pseries_eeh_get_pe_addr(struct pci_dn *pdn);
+
 /* RTAS tokens */
 static int ibm_set_eeh_option;
 static int ibm_set_slot_reset;
@@ -301,7 +303,7 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 		eeh_edev_dbg(edev, "EEH failed to enable on device (code %d)\n", ret);
 	} else {
 		/* Retrieve PE address */
-		edev->pe_config_addr = eeh_ops->get_pe_addr(&pe);
+		edev->pe_config_addr = pseries_eeh_get_pe_addr(pdn);
 		pe.addr = edev->pe_config_addr;
 
 		/* Some older systems (Power4) allow the ibm,set-eeh-option
@@ -431,8 +433,10 @@ static int pseries_eeh_set_option(struct eeh_pe *pe, int option)
  * It's notable that zero'ed return value means invalid PE config
  * address.
  */
-static int pseries_eeh_get_pe_addr(struct eeh_pe *pe)
+static int pseries_eeh_get_pe_addr(struct pci_dn *pdn)
 {
+	int config_addr = rtas_config_addr(pdn->busno, pdn->devfn, 0);
+	unsigned long buid = pdn->phb->buid;
 	int ret = 0;
 	int rets[3];
 
@@ -443,18 +447,16 @@ static int pseries_eeh_get_pe_addr(struct eeh_pe *pe)
 		 * meaningless.
 		 */
 		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
-				pe->config_addr, BUID_HI(pe->phb->buid),
-				BUID_LO(pe->phb->buid), 1);
+				config_addr, BUID_HI(buid), BUID_LO(buid), 1);
 		if (ret || (rets[0] == 0))
 			return 0;
 
 		/* Retrieve the associated PE config address */
 		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
-				pe->config_addr, BUID_HI(pe->phb->buid),
-				BUID_LO(pe->phb->buid), 0);
+				config_addr, BUID_HI(buid), BUID_LO(buid), 0);
 		if (ret) {
 			pr_warn("%s: Failed to get address for PHB#%x-PE#%x\n",
-				__func__, pe->phb->global_number, pe->config_addr);
+				__func__, pdn->phb->global_number, config_addr);
 			return 0;
 		}
 
@@ -463,11 +465,10 @@ static int pseries_eeh_get_pe_addr(struct eeh_pe *pe)
 
 	if (ibm_get_config_addr_info != RTAS_UNKNOWN_SERVICE) {
 		ret = rtas_call(ibm_get_config_addr_info, 4, 2, rets,
-				pe->config_addr, BUID_HI(pe->phb->buid),
-				BUID_LO(pe->phb->buid), 0);
+				config_addr, BUID_HI(buid), BUID_LO(buid), 0);
 		if (ret) {
 			pr_warn("%s: Failed to get address for PHB#%x-PE#%x\n",
-				__func__, pe->phb->global_number, pe->config_addr);
+				__func__, pdn->phb->global_number, config_addr);
 			return 0;
 		}
 
@@ -839,7 +840,6 @@ static struct eeh_ops pseries_eeh_ops = {
 	.init			= pseries_eeh_init,
 	.probe			= pseries_eeh_probe,
 	.set_option		= pseries_eeh_set_option,
-	.get_pe_addr		= pseries_eeh_get_pe_addr,
 	.get_state		= pseries_eeh_get_state,
 	.reset			= pseries_eeh_reset,
 	.get_log		= pseries_eeh_get_log,
-- 
2.26.2

