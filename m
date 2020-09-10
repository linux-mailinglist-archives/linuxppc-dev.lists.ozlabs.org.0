Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1297263CE5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 08:01:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn7ZC5xYKzDqd0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 16:01:55 +1000 (AEST)
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
 header.s=20161025 header.b=rrbvaS/6; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn7Cw26LWzDqYY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 15:46:04 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id w7so3997272pfi.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Sep 2020 22:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XJC1/EbgU1ZCqFg7zMtDJdbZ5W9CVIZmmngLBRDob4Y=;
 b=rrbvaS/61M9gM0suTUPm5xmLf24q0CvjeTOPDzLcEPb7aP2EgqJrereJm8kXAft9Av
 X60NnOrgPVdJVraMrQFGLOuc4iLNdrcgRB2T6CcMqtMcBWL980PpXcQSzoHtellmlnsr
 RyxRRWdzAo6WYG07oFABzuy5eR8D7OIZYP9EruclZSFV0xdMbGOuhPrgXQ6n4bbTPKt3
 ojk74JDjmClxor6ARxeR2/1qWcdsF5UdOPBEQnrxchURuCMNulY9naqD5bJNljTIMLVg
 1BKVmL2RVbAXV4+moiQec1F0M1ozlzMrY0/w1EBNmT+GLcyWnCOoEbzvlXtTHAr4V1Ma
 29VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XJC1/EbgU1ZCqFg7zMtDJdbZ5W9CVIZmmngLBRDob4Y=;
 b=N/dcM68p/kcwbN80hmDHWk3zBdAmJc0w6vf3q9Ldup4HAE0DUKIVP050BWvFPNnapI
 0JWNQ8wZnXwvtskJSP84Rrcr4MQpybvk1NbmprdwYe4h2S9W/K4TxpGI95F9OenIDTB0
 m7hETyrtDLCjK03gDQw5dWkvNKKMnkAstVN1GoP0nZ6QPFiq7/vEEq6EBtXyHQA/LJiD
 In9Bkf8LuiK7jXd6sccmptXTJn8FQrkEtqnXR5zt4RgIoMC7SdEYUOmrFydLKhzZRuLs
 60mAOYsHCAJvn9hI5KjF2CwiCBK9HEt4UMG0b7RqBJ028bTJoHQAf5IqIgapKwXfCLdD
 60yg==
X-Gm-Message-State: AOAM531DljJL14/QzvYcl4/hd2OVt+UHjFedtg6nCPQQ5rt+lNbfyKpH
 SJNQqu0ayS2SVccaPqhMKCSdo3G4z1UTYg==
X-Google-Smtp-Source: ABdhPJwO6khBPfGMbZhDrDAVeaHCdJ3UnRQq/cErMyC0IxVzHZ6SM6wK8W5QL2Uu0s9HPcv03gfq+Q==
X-Received: by 2002:a63:4f66:: with SMTP id p38mr3209134pgl.284.1599716762241; 
 Wed, 09 Sep 2020 22:46:02 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id o30sm3960374pgc.45.2020.09.09.22.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 22:46:01 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 8/9] powerpc/pseries/eeh: Allow zero to be a valid PE
 configuration address
Date: Thu, 10 Sep 2020 15:45:31 +1000
Message-Id: <20200910054532.2043724-9-oohall@gmail.com>
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

There's no real reason why zero can't be a valid PE configuration address.
Under qemu each sPAPR PHB (i.e. EEH supporting) has the passed-though
devices on bus zero, so the PE address of bus <dddd>:00 should be zero.

However, all previous versions of Linux will reject that, so Qemu at least
goes out of it's way to avoid it. The Qemu implementation of
ibm,get-config-addr-info2 RTAS has the following comment:

> /*
>  * We always have PE address of form "00BB0001". "BB"
>  * represents the bus number of PE's primary bus.
>  */

So qemu puts a one into the register portion of the PE's config_addr to
avoid it being zero. The whole is pretty silly considering that RTAS will
return a negative error code if it can't map the device's config_addr to a
PE's.

Fix Linux to treat zero as a valid PE address. This shouldn't have any real
effects due to the Qemu hack mentioned above, and the fact that this has
worked historically on PowerVM means they never pass through devices on bus
zero.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 38 +++++++++++---------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index c2ecc0db2f94..e42c026392aa 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -87,21 +87,20 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
  * pseries_eeh_get_pe_config_addr - Find the pe_config_addr for a device
  * @pdn: pci_dn of the input device
  *
- * Retrieve the assocated config address. Actually, there're 2 RTAS
- * function calls dedicated for the purpose. We need implement
- * it through the new function and then the old one. Besides,
- * you should make sure the config address is figured out from
- * FDT node before calling the function.
+ * The EEH RTAS calls use a tuple consisting of: (buid_hi, buid_lo,
+ * pe_config_addr) as a handle to a given PE. This function finds the
+ * pe_config_addr based on the device's config addr.
  *
- * It's notable that zero'ed return value means invalid PE config
- * address.
+ * Keep in mind that the pe_config_addr *might* be numerically identical to the
+ * device's config addr, but the two are conceptually distinct.
+ *
+ * Returns the pe_config_addr, or a negative error code.
  */
 static int pseries_eeh_get_pe_config_addr(struct pci_dn *pdn)
 {
 	int config_addr = rtas_config_addr(pdn->busno, pdn->devfn, 0);
 	struct pci_controller *phb = pdn->phb;
-	int ret = 0;
-	int rets[3];
+	int ret, rets[3];
 
 	if (ibm_get_config_addr_info2 != RTAS_UNKNOWN_SERVICE) {
 		/*
@@ -112,16 +111,16 @@ static int pseries_eeh_get_pe_config_addr(struct pci_dn *pdn)
 				config_addr, BUID_HI(phb->buid),
 				BUID_LO(phb->buid), 1);
 		if (ret || (rets[0] == 0))
-			return 0;
+			return -ENOENT;
 
-		/* Retrieve the associated PE config address */
+		/* Retrieve the associated PE config address with function 0 */
 		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
 				config_addr, BUID_HI(phb->buid),
 				BUID_LO(phb->buid), 0);
 		if (ret) {
 			pr_warn("%s: Failed to get address for PHB#%x-PE#%x\n",
 				__func__, phb->global_number, config_addr);
-			return 0;
+			return -ENXIO;
 		}
 
 		return rets[0];
@@ -134,13 +133,20 @@ static int pseries_eeh_get_pe_config_addr(struct pci_dn *pdn)
 		if (ret) {
 			pr_warn("%s: Failed to get address for PHB#%x-PE#%x\n",
 				__func__, phb->global_number, config_addr);
-			return 0;
+			return -ENXIO;
 		}
 
 		return rets[0];
 	}
 
-	return ret;
+	/*
+	 * PAPR does describe a process for finding the pe_config_addr that was
+	 * used before the ibm,get-config-addr-info calls were added. However,
+	 * I haven't found *any* systems that don't have that RTAS call
+	 * implemented. If you happen to find one that needs the old DT based
+	 * process, patches are welcome!
+	 */
+	return -ENOENT;
 }
 
 /**
@@ -419,7 +425,7 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 
 	/* first up, find the pe_config_addr for the PE containing the device */
 	addr = pseries_eeh_get_pe_config_addr(pdn);
-	if (addr == 0) {
+	if (addr < 0) {
 		eeh_edev_dbg(edev, "Unable to find pe_config_addr\n");
 		goto err;
 	}
@@ -901,7 +907,7 @@ static int __init eeh_pseries_init(void)
 			config_addr = pseries_eeh_get_pe_config_addr(pdn);
 
 			/* invalid PE config addr */
-			if (config_addr == 0)
+			if (config_addr < 0)
 				continue;
 
 			pseries_eeh_phb_reset(phb, config_addr, EEH_RESET_FUNDAMENTAL);
-- 
2.26.2

