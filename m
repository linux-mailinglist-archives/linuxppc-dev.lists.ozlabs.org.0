Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBED263CDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 07:58:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn7V54MGwzDqDN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 15:58:21 +1000 (AEST)
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
 header.s=20161025 header.b=gTpU1bEX; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn7Cr3qSrzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 15:46:00 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id u13so3658805pgh.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Sep 2020 22:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jlZZ9WIzffYJqqW5m/7iFT1/yI4XkdcSDIdoDJxuEhA=;
 b=gTpU1bEXTDJ+IgAIQZccyI6JC1w9aqEZkPLeOv8/eDhPr8PGFuQinqZEIQJ7ztY6Hm
 1L9xxrLLprGZtfFT9T0+SiHIvb8zrNr/5zAR73cwOg3AaMSFF5fpHSq39JGfILvUekOb
 jY1mx5PIjug1aS03OwNLwBrLrfyJcc07ObjGFi6RRxneGhFBO8CH8rvIQO3/AsCgpiiP
 d/t5xa5L+/tOqxzD1WGRGSnLloxIWsvAbbP30pgtcGhgEVLQK722WG/Q8iiE7shrReB2
 iuu5B2iMHtTTtbHGZiJ11aQoJAJnmn0zq9Hw0NCJRIXEmHcZWs01n05rcLk/H0MOL6aQ
 XwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlZZ9WIzffYJqqW5m/7iFT1/yI4XkdcSDIdoDJxuEhA=;
 b=VGNd9fUv6gtWI/6FmHLXPWO7l+keLI3sLG9E3fCtwHXXwta/n29tInvpcNXMtyHstz
 a6j3fUWYtOrl33R7I/KdW3JJvmwiSL+UehD/XfGgqboKiGGPl/hxCU1yYJp5ELig8EJ6
 y3Bob54ssc7l9RjPGuI5xW1gTYFbDw3dYywRAWO/Bvj7PJXJQgYFhZlotQLEKGo6k0T8
 b6vUoZ5+bPCIRo4j7+fLgl17OC2H3cRvBJNK28axRnSDDAOGvO8GCAIzZ17e3iNRnai3
 iTpKMiZ1ogdAoB4FHTNbXHgDjwmx548rpMkTxIV9F5CbmOmlFODs0T00G083O3i0breW
 Mseg==
X-Gm-Message-State: AOAM530S2BRoW+j4a0lI1uD3bTRlDwODUPVx/pNcgE9SDtrMvvRQOTAR
 G6AIg/bTOKjGJ7V8ByuEa4PoxmAghoqFvQ==
X-Google-Smtp-Source: ABdhPJzBL0L42w9IuqfY+TCQpWPQs9/TT/t3uCaRNSMtxgMqF0DCJuJP3y/XrgyvdR3nlV3S1PIDzg==
X-Received: by 2002:a62:4e89:0:b029:13e:d13d:a132 with SMTP id
 c131-20020a624e890000b029013ed13da132mr3779711pfb.26.1599716758177; 
 Wed, 09 Sep 2020 22:45:58 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id o30sm3960374pgc.45.2020.09.09.22.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 22:45:57 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/9] powerpc/pseries/eeh: Clean up pe_config_addr lookups
Date: Thu, 10 Sep 2020 15:45:29 +1000
Message-Id: <20200910054532.2043724-7-oohall@gmail.com>
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

De-duplicate, and fix up the comments, and make the prototype just take a
pci_dn since the job of the function is to return the pe_config_addr of the
PE which contains a given device.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 80 +++-----------------
 1 file changed, 11 insertions(+), 69 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index b1561961c7ff..10303de3d8d5 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -33,8 +33,6 @@
 #include <asm/ppc-pci.h>
 #include <asm/rtas.h>
 
-static int pseries_eeh_get_pe_addr(struct pci_dn *pdn);
-
 /* RTAS tokens */
 static int ibm_set_eeh_option;
 static int ibm_set_slot_reset;
@@ -86,7 +84,8 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 
 
 /**
- * pseries_eeh_get_config_addr - Retrieve config address
+ * pseries_eeh_get_pe_config_addr - Find the pe_config_addr for a device
+ * @pdn: pci_dn of the input device
  *
  * Retrieve the assocated config address. Actually, there're 2 RTAS
  * function calls dedicated for the purpose. We need implement
@@ -97,16 +96,17 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
  * It's notable that zero'ed return value means invalid PE config
  * address.
  */
-static int pseries_eeh_get_config_addr(struct pci_controller *phb, int config_addr)
+static int pseries_eeh_get_pe_config_addr(struct pci_dn *pdn)
 {
+	int config_addr = rtas_config_addr(pdn->busno, pdn->devfn, 0);
+	struct pci_controller *phb = pdn->phb;
 	int ret = 0;
 	int rets[3];
 
 	if (ibm_get_config_addr_info2 != RTAS_UNKNOWN_SERVICE) {
 		/*
-		 * First of all, we need to make sure there has one PE
-		 * associated with the device. Otherwise, PE address is
-		 * meaningless.
+		 * First of all, use function 1 to determine if this device is
+		 * part of a PE or not. ret[0] being zero indicates it's not.
 		 */
 		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
 				config_addr, BUID_HI(phb->buid),
@@ -431,7 +431,7 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 		struct eeh_pe *parent;
 
 		/* Retrieve PE address */
-		edev->pe_config_addr = pseries_eeh_get_pe_addr(pdn);
+		edev->pe_config_addr = pseries_eeh_get_pe_config_addr(pdn);
 		pe.addr = edev->pe_config_addr;
 
 		/* Some older systems (Power4) allow the ibm,set-eeh-option
@@ -551,64 +551,6 @@ static int pseries_eeh_set_option(struct eeh_pe *pe, int option)
 	return ret;
 }
 
-/**
- * pseries_eeh_get_pe_addr - Retrieve PE address
- * @pe: EEH PE
- *
- * Retrieve the assocated PE address. Actually, there're 2 RTAS
- * function calls dedicated for the purpose. We need implement
- * it through the new function and then the old one. Besides,
- * you should make sure the config address is figured out from
- * FDT node before calling the function.
- *
- * It's notable that zero'ed return value means invalid PE config
- * address.
- */
-static int pseries_eeh_get_pe_addr(struct pci_dn *pdn)
-{
-	int config_addr = rtas_config_addr(pdn->busno, pdn->devfn, 0);
-	unsigned long buid = pdn->phb->buid;
-	int ret = 0;
-	int rets[3];
-
-	if (ibm_get_config_addr_info2 != RTAS_UNKNOWN_SERVICE) {
-		/*
-		 * First of all, we need to make sure there has one PE
-		 * associated with the device. Otherwise, PE address is
-		 * meaningless.
-		 */
-		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
-				config_addr, BUID_HI(buid), BUID_LO(buid), 1);
-		if (ret || (rets[0] == 0))
-			return 0;
-
-		/* Retrieve the associated PE config address */
-		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
-				config_addr, BUID_HI(buid), BUID_LO(buid), 0);
-		if (ret) {
-			pr_warn("%s: Failed to get address for PHB#%x-PE#%x\n",
-				__func__, pdn->phb->global_number, config_addr);
-			return 0;
-		}
-
-		return rets[0];
-	}
-
-	if (ibm_get_config_addr_info != RTAS_UNKNOWN_SERVICE) {
-		ret = rtas_call(ibm_get_config_addr_info, 4, 2, rets,
-				config_addr, BUID_HI(buid), BUID_LO(buid), 0);
-		if (ret) {
-			pr_warn("%s: Failed to get address for PHB#%x-PE#%x\n",
-				__func__, pdn->phb->global_number, config_addr);
-			return 0;
-		}
-
-		return rets[0];
-	}
-
-	return ret;
-}
-
 /**
  * pseries_eeh_get_state - Retrieve PE state
  * @pe: EEH PE
@@ -911,7 +853,7 @@ static int __init eeh_pseries_init(void)
 {
 	struct pci_controller *phb;
 	struct pci_dn *pdn;
-	int ret, addr, config_addr;
+	int ret, config_addr;
 
 	/* figure out EEH RTAS function call tokens */
 	ibm_set_eeh_option		= rtas_token("ibm,set-eeh-option");
@@ -969,8 +911,8 @@ static int __init eeh_pseries_init(void)
 		pr_info("Issue PHB reset ...\n");
 		list_for_each_entry(phb, &hose_list, list_node) {
 			pdn = list_first_entry(&PCI_DN(phb->dn)->child_list, struct pci_dn, list);
-			addr = (pdn->busno << 16) | (pdn->devfn << 8);
-			config_addr = pseries_eeh_get_config_addr(phb, addr);
+			config_addr = pseries_eeh_get_pe_config_addr(pdn);
+
 			/* invalid PE config addr */
 			if (config_addr == 0)
 				continue;
-- 
2.26.2

