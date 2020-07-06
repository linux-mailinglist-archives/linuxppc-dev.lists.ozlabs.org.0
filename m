Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD24215104
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 03:51:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0T843JnszDqXf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 11:51:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SiYA/rn5; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0Spv3SplzDqW9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 11:36:55 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id g10so14620017wmc.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 18:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OpHiWuDbvTKH05ZBLiXEJEQ+595jO3E4iX2L4WzPw0s=;
 b=SiYA/rn5IkJJ1udbezPQw16nA544ToyJKHLVVTGrBUDwCHB4p38RiKbM7RrK4aQE46
 Hgtbmp6BrVqSLas72ZfPU7JntPkAyF7NqjXy/AJR0W8wt8UXF4fKTxNbbfH/Db/LANvE
 nJxK0e7zNXkDyI+oKp5grD8yjyf6XoxWD81Be/hJ7zba9uiMw7P5fHnpZZPo0EjKnjHm
 obRdJOJVKZMDisWgDyWVntU/2lRc1vaRr6lRRMrCiyWUFdP5VIczzxoh60grPyOmqNfh
 SQ1Y8M2YDO+g1Jf2VDCw50/w+YyJtPnjKUjjH14rpytAOkVcCs92S7RJM1bbD7GelrzY
 rliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OpHiWuDbvTKH05ZBLiXEJEQ+595jO3E4iX2L4WzPw0s=;
 b=jrBsGTJzsRV6xr/bkTcAW/TF4rhr9k8faPhXbsmtZqAb9rd8pDEgxPi0c9HJrmIqCm
 7rhTAzLbhoIX+zYRCxX2WcU0ofaCln+GeegGZmDlTT5EPKSUVKG1GzqyglsDbJ5a+TSV
 +3bATPQy1E/BQTM08jM2jTKTvlHjfdonXQGLG89E5jt/kevd9jiX/xm+cPq+kGMQ6qct
 Y1J9yoh4EMub8KZ9QFxHOYKSzQZYZQjm+/9EGgrRU0enTRNawTAQeVHoPZeikYsf7aqe
 jd2QNv75iAhWQvdDVhhfqnplRlLMp9uoJfCImK9emKJ7cPYW3ZpkwIaimZUEAEb9DeAT
 rIfg==
X-Gm-Message-State: AOAM530VpiHksI0exEmbyNgJaegT5fLdrlrVpxH2o4ofi6NI9kYzQam+
 sfjMKlZ0f+oqIb51Jchyx9DIU3emXIY=
X-Google-Smtp-Source: ABdhPJy5rTSPBbs8jfVuBn2Ll5tXmF4gDC69QNgG0MknXG5toecItIVxk3K+s1caRwqnJgOW8Th+Kg==
X-Received: by 2002:a1c:e285:: with SMTP id
 z127mr46997101wmg.162.1593999411155; 
 Sun, 05 Jul 2020 18:36:51 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au (59-102-73-59.tpgi.com.au.
 [59.102.73.59])
 by smtp.gmail.com with ESMTPSA id v6sm9533392wrr.85.2020.07.05.18.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 18:36:50 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/14] powerpc/eeh: Kill off eeh_ops->get_pe_addr()
Date: Mon,  6 Jul 2020 11:36:10 +1000
Message-Id: <20200706013619.459420-6-oohall@gmail.com>
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

This is used in precisely one place which is in pseries specific platform
code.  There's no need to have the callback in eeh_ops since the platform
chooses the EEH PE addresses anyway. The PowerNV implementation has always
been a stub too so remove it.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h               |  1 -
 arch/powerpc/platforms/powernv/eeh-powernv.c | 13 ------------
 arch/powerpc/platforms/pseries/eeh_pseries.c | 22 ++++++++++----------
 3 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 3d648e042835..1bddc0dfe099 100644
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
index 18a2522b9b5e..088771fa38be 100644
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
+	int buid = pdn->phb->buid;
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

