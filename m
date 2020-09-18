Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 390B326F97F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 11:44:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt86l2bT7zDqsH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 19:43:59 +1000 (AEST)
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
 header.s=20161025 header.b=g9R5d9WQ; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt7r71wwdzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 19:31:19 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id k14so3125725pgi.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lfmlpxA2dpOs7K1CLeinRUN8jkbYFOfTOBYF4vxK8Gk=;
 b=g9R5d9WQTPIdV1tf7h81b5FpIeVtKOYkut6XlpV6G64CF7B0smgTIFTT/7Y7bgor/u
 rnIK+GkDzVfgT4jdfreP/g+1jUJkFs+GuLbgqxjrtuAfhymhXkBX6Q7ozkxWan1kgPUA
 erJKHA0OYb0A7ag+uWfsa0xSFvKpuHpAjr+H1wZ7buxQ8WAE5jMlmBfgn/nrb4lsEaJd
 XqK9j8zUkDTJqoB54Wef3dCuSqffUYFnbu7dGouanZfz/TeI0Kbs8V79WjMJVwE8VAwP
 BxHeXw9txmK1qvQ0jnKJzvWgkvYKFjl/tyuADaWKGW01WCEwrvOhG+R17HHnjpLXZtaN
 TaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lfmlpxA2dpOs7K1CLeinRUN8jkbYFOfTOBYF4vxK8Gk=;
 b=LVE8wUXIRM01CF900sD5PPkSFRslTdaYwlOtAHDqkw6rxED+VjWW/TsDbswrcIsFcm
 BXBj5ACiZjbz93t6YvwA8z/QVS3TYZYmwifZZXALjK2dSGUygoGem6Vx1VdqMa68A2Gx
 +7FcG0XtqVkCU55T/0D1fvyfEe9FBesOT0S1Qk2FWbDQ22dAj8pdNRczR1cnyzjTa5Gj
 MnRwVpD8tyE7PUXBNq7eyQMSJIphLHM/j6euBbGGDFtcNb7ZgxCU2D2/CeQK4NBQRtQ2
 Btn1VEEuZ9F1lHqhjCpqVHvHfaMMuPUZQv5sCqn54GAK72498srlabvyifZHcPJlnGgc
 QQAQ==
X-Gm-Message-State: AOAM533dKi4tRloyxlXoxN9xW3vdJyxVOTzkt2mompvi1yLAbaYTbTkf
 HNsnwyZMaU/BkQBKyMd7LXl8p4+4lK65Iw==
X-Google-Smtp-Source: ABdhPJywSmQxS/WniPGc3XE2Wh6mgdw84MafpkDi3P36zuedoHpyDmfxBb+DubA+2k+afxoe0qPetw==
X-Received: by 2002:aa7:8aca:0:b029:13e:d13d:a07d with SMTP id
 b10-20020aa78aca0000b029013ed13da07dmr31382312pfd.20.1600421477218; 
 Fri, 18 Sep 2020 02:31:17 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id cf7sm2258853pjb.52.2020.09.18.02.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 02:31:16 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 7/9] powerpc/pseries/eeh: Rework device EEH PE determination
Date: Fri, 18 Sep 2020 19:30:48 +1000
Message-Id: <20200918093050.37344-7-oohall@gmail.com>
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

The process Linux uses for determining if a device supports EEH or not
appears to be at odds with what PAPR says the OS should be doing. The
current flow is something like:

1. Assume pe_config_addr is equal the the device's config_addr.
2. Attempt to enable EEH on that PE
3. Verify EEH was enabled (POWER4 bug workaround)
4. Try find the pe_config_addr using the ibm,get-config-addr-info2 RTAS
   call.
5. If that fails walk the pci_dn tree upwards trying to find a parent
   device with EEH support. If we find one then add the device to that PE.

The first major problem with this process is that we need the PE config
address in step 2) since its needs to be passed to the ibm,set-eeh-option
RTAS call when enabling EEH for th PE. We hack around this requirement in
by making the assumption in 1) and delay finding the actual PE address
until 4). This is fine if:

a) The PCI device is the 0th function, and
b) The device is on the PE's root bus.

Granted, the current sequence does appear to work on most systems even when
these conditions are false. At a guess PowerVM's RTAS has workarounds to
accommodate Linux's quirks or the RTAS call to enable EEH is treated as
no-op on most platforms since EEH is usually enabled by default. However,
what is currently implemented is a bit sketch and is downright confusing
since it doesn't match up with what what PAPR suggests we should be doing.

This patch re-works how we handle EEH init so that we find the PE config
address using the ibm,get-config-addr-info2 RTAS call first, then use the
found address to finish the EEH init process. It also drops the Power4
workaround since as of commit 471d7ff8b51b ("powerpc/64s: Remove POWER4
support") the kernel does not support running on a Power4 CPU so there's
no need to support the Power4 platform's quirks either. With the patch
applied the sequence is now:

1. Find the pe_config_addr from the device using the RTAS call.
2. Enable the PE.
3. Insert the edev into the tree and create an eeh_pe if needed.

The other change made here is ignoring unsupported devices entirely.
Currently the device's BARs are saved to the eeh_dev even if the device is
not part of an EEH PE. Not being part of a PE means that an EEH recovery
pass will never see that device so the saving the BARs is pointless.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 57 ++++++++------------
 1 file changed, 22 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 10303de3d8d5..c2ecc0db2f94 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -357,10 +357,10 @@ static struct eeh_pe *pseries_eeh_pe_get_parent(struct eeh_dev *edev)
  */
 void pseries_eeh_init_edev(struct pci_dn *pdn)
 {
+	struct eeh_pe pe, *parent;
 	struct eeh_dev *edev;
-	struct eeh_pe pe;
+	int addr;
 	u32 pcie_flags;
-	int enable = 0;
 	int ret;
 
 	if (WARN_ON_ONCE(!eeh_has_flag(EEH_PROBE_MODE_DEVTREE)))
@@ -417,51 +417,38 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 		}
 	}
 
-	/* Initialize the fake PE */
+	/* first up, find the pe_config_addr for the PE containing the device */
+	addr = pseries_eeh_get_pe_config_addr(pdn);
+	if (addr == 0) {
+		eeh_edev_dbg(edev, "Unable to find pe_config_addr\n");
+		goto err;
+	}
+
+	/* Try enable EEH on the fake PE */
 	memset(&pe, 0, sizeof(struct eeh_pe));
 	pe.phb = pdn->phb;
-	pe.config_addr = (pdn->busno << 16) | (pdn->devfn << 8);
+	pe.addr = addr;
 
-	/* Enable EEH on the device */
 	eeh_edev_dbg(edev, "Enabling EEH on device\n");
 	ret = eeh_ops->set_option(&pe, EEH_OPT_ENABLE);
 	if (ret) {
 		eeh_edev_dbg(edev, "EEH failed to enable on device (code %d)\n", ret);
-	} else {
-		struct eeh_pe *parent;
+		goto err;
+	}
 
-		/* Retrieve PE address */
-		edev->pe_config_addr = pseries_eeh_get_pe_config_addr(pdn);
-		pe.addr = edev->pe_config_addr;
+	edev->pe_config_addr = addr;
 
-		/* Some older systems (Power4) allow the ibm,set-eeh-option
-		 * call to succeed even on nodes where EEH is not supported.
-		 * Verify support explicitly.
-		 */
-		ret = eeh_ops->get_state(&pe, NULL);
-		if (ret > 0 && ret != EEH_STATE_NOT_SUPPORT)
-			enable = 1;
+	eeh_add_flag(EEH_ENABLED);
 
-		/*
-		 * This device doesn't support EEH, but it may have an
-		 * EEH parent. In this case any error on the device will
-		 * freeze the PE of it's upstream bridge, so added it to
-		 * the upstream PE.
-		 */
-		parent = pseries_eeh_pe_get_parent(edev);
-		if (parent && !enable)
-			edev->pe_config_addr = parent->addr;
+	parent = pseries_eeh_pe_get_parent(edev);
+	eeh_pe_tree_insert(edev, parent);
+	eeh_save_bars(edev);
+	eeh_edev_dbg(edev, "EEH enabled for device");
 
-		if (enable || parent) {
-			eeh_add_flag(EEH_ENABLED);
-			eeh_pe_tree_insert(edev, parent);
-		}
-		eeh_edev_dbg(edev, "EEH is %s on device (code %d)\n",
-			     (enable ? "enabled" : "unsupported"), ret);
-	}
+	return;
 
-	/* Save memory bars */
-	eeh_save_bars(edev);
+err:
+	eeh_edev_dbg(edev, "EEH is unsupported on device (code = %d)\n", ret);
 }
 
 static struct eeh_dev *pseries_eeh_probe(struct pci_dev *pdev)
-- 
2.26.2

