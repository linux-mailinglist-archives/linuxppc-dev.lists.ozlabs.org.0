Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C0522D60B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 10:21:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDJvS0F0JzF0bG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 18:21:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HKGn6rQD; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDJj470GZzF14v
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 18:12:56 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id s26so6503911pfm.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 01:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sv4HImIExSjO3J544V9iDARZhf98u6/xJnOC0GFK+Gk=;
 b=HKGn6rQDToc+LwRlTN64osI7uOV4Ue3jeObUMSCyU2T3Y0K1WPIfAq+kvNsxhqjlbt
 fD/PayWiQvPxM9vhX6jomrVtNn5PIKeATqECNveXVhWQIx2MC/StDFgs2MbtHXhoMv2L
 OGSOacT8o8+1+lChV9tzmFJ6ii1Ze6e98bCa8po6flFrWd8zRUMK+404Nw+E77oTX2xG
 t/VeWY0qI4RXMpROHaOhM+vaK0wnRnjNZTt1VN8PomopOFoAi0Eu57CMVmGKv0US3Ok/
 JoXs+GBWU7H6gzJUJv3NAW78XMfwPJ5WwgfJSHggZUpeZ6pPsdFkyovc4EmhrYg8V+j5
 gI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sv4HImIExSjO3J544V9iDARZhf98u6/xJnOC0GFK+Gk=;
 b=m0T58M9XR7fRRy+ZcogBrZ3La92xxPsYZNvo8AbyVigwgL1lgHbwoE76RpHPA/UCCS
 6XTXYErffctMEU4/3N4ZCzDHDxHmC1zQRxXlHiGsx0XOu10YJgjJGMhtQeSIarT5mYLC
 4rvd/4GDjFrCtq5R1J5/AQz1Q7dIYCoH9cV7pcQzaGLuIIb6p0mFSViXjFNyzkr2gmhR
 VhNw6jE3bAdSKCUC+Sp31D3fIALr73vQuJzJlqi2xlcCLnO3SEC+H//IZ0Jfp0is0j4y
 x/7fqoONo5CoSA4JE08pZEF5gRMNq3SItnB/kbevWUsYRahpTlsZKOaHblctWPkV69Xg
 pisQ==
X-Gm-Message-State: AOAM530KEJpl+f07ZmqiFU017udfxQhxIBExuorNgtGLzt48E5lfrgHV
 hGDJe7harKBsjRctCaYsbGdVMM4kCH8=
X-Google-Smtp-Source: ABdhPJyNyIgXILmWsaGSkDhHHny9T7jK6dWL/EIiAkw1KyAAJL7q2WPNaoePZO4e8etNhG4TEfrJ4A==
X-Received: by 2002:a65:6403:: with SMTP id a3mr11916156pgv.246.1595664774119; 
 Sat, 25 Jul 2020 01:12:54 -0700 (PDT)
Received: from localhost.localdomain ([118.210.60.180])
 by smtp.gmail.com with ESMTPSA id a26sm8647360pgm.20.2020.07.25.01.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 01:12:53 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 05/14] powerpc/eeh: Kill off eeh_ops->get_pe_addr()
Date: Sat, 25 Jul 2020 18:12:22 +1000
Message-Id: <20200725081231.39076-5-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200725081231.39076-1-oohall@gmail.com>
References: <20200725081231.39076-1-oohall@gmail.com>
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
v3: no change
---
 arch/powerpc/include/asm/eeh.h               |  1 -
 arch/powerpc/platforms/powernv/eeh-powernv.c | 13 ------------
 arch/powerpc/platforms/pseries/eeh_pseries.c | 22 ++++++++++----------
 3 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 2a935db72198..676d499bda42 100644
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

