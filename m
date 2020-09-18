Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5040726F985
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 11:45:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt88g2mh4zDqpg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 19:45:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nYGTN+nK; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt7rB3T6CzDqcQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 19:31:22 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id kk9so2719858pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rZ7UsHcj4rg2iqKHLzWD65XTHRJp5NFDxniPgV6Nmk4=;
 b=nYGTN+nKrk78SK8jd/GhE/gpLuFYOZCmK2MyHzMvohIez+Luk2oMJPBSlP/zaKsa1B
 tVH3n+GGbcJGoAReSChat3iVAdenIl344tk1AWSE/xl7gG6C6Erz9y00IxcLzNyzkZeq
 YO8mZ/uSxaB5V9J0Gfo7eWRQjzEv93qMSE6AINZ+M1hCqU4rOLWLbNMgB21iXd9Pcg7J
 q97CHEBWsw/m6wlMRnXnTFGcSxZXoyWhQerHN5CKj2LJp2aYfij7QG3ANSSzx50jGDB+
 FBMjKGQzMT7ag3NvDa8TOiZbpTxc5cj65ZeIh60+iDA4yufzgnTyDIMEfDSueiSjhrXb
 Yg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rZ7UsHcj4rg2iqKHLzWD65XTHRJp5NFDxniPgV6Nmk4=;
 b=WzwKuqB7vn6/A6y3XxkOTcW5mXzqWw7VZXBTDiHjeWnAbL8iiM6KhhRebHxF0fgfaU
 vU3vLpkaTNonrMzRZ0W+lae+oG9Yf1qNUCN+IhihZjaWBCwOzse+g/hGimuPwu7ALG9H
 uQRQaZp0CJkHMQfyKDDbhzeQs3AD+nnkdG40UWTF5e0SVQypu99AI+gS3HTCNrG7kRxc
 cG3RaUb1fvkVuP2XCk3Y/7dYhdy8DMrCJ1H4453P/BDFf4PnD/4mSbisAFuONEycT/rQ
 uMl37+JPK7MnnK2VMV9VJnW5/u6WyHjgWj5OcUaDRONeI0/a2rvjWWKvfHrhjDV11ARs
 pJvA==
X-Gm-Message-State: AOAM530HJ+pyRxdoZtVixUtnAJfnVFNxF5z8T6bsPis1x5B4p4I9Ce7X
 zJDOcbuJLmSLkdGtaD2ApIyw6NiSssQecA==
X-Google-Smtp-Source: ABdhPJzllBZxMh8rSOmCz57ZmdPT3kLKxF60FIzsKK91ZHNxL3cYdGp8chNkjy/EFtBkDVbr3wF2dw==
X-Received: by 2002:a17:902:24c:b029:d0:cb2d:f270 with SMTP id
 70-20020a170902024cb02900d0cb2df270mr33132150plc.9.1600421479598; 
 Fri, 18 Sep 2020 02:31:19 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id cf7sm2258853pjb.52.2020.09.18.02.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 02:31:19 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 8/9] powerpc/pseries/eeh: Allow zero to be a valid PE
 configuration address
Date: Fri, 18 Sep 2020 19:30:49 +1000
Message-Id: <20200918093050.37344-8-oohall@gmail.com>
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
PE.

This patch fixes Linux to treat zero as a valid PE address. This shouldn't
have any real effects due to the Qemu hack mentioned above. And the fact
that Linux EEH has worked historically on PowerVM means they never pass
through devices on bus zero so we would never see the problem there either.

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

