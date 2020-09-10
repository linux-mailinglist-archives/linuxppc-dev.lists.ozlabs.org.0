Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 801E5263CDE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 08:00:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn7Wy5BBQzDqd0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 15:59:58 +1000 (AEST)
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
 header.s=20161025 header.b=UiVp6LEW; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn7Ct3J8LzDqb5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 15:46:02 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 7so3623852pgm.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Sep 2020 22:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kdTNACTCKcUE/vmTt4U//eWOWcI9QLR4DgzQ0oAx5q8=;
 b=UiVp6LEWjLNSLQJqgdAR3yY/tx6bg7f6lkpWgL82IwL0JFGXwluAabLUY82K8ez0aT
 qKHjSsfyDHDHQ4jVlbXXq4u+x5t6gvlE+dW1zR5AEQQesPGEo/f8AfMholBRLTFv4Wlv
 5fNPSPk7rXSpbJuORq3MJDq363qGD3aF/BgrSurlpg8LZsN+U+GGtHMgJJV2//YHHPtY
 XcnPfrZ9nrb59i7RunyhV6+F4fkkh5zD/6t2kSlsQ+DblChKE/X5wQfstyg2jvQ9LmGX
 wmYW/VSBBEVKjmLkg/uWstOLf3jc53KiiSJV4az+83kCASpizl24nGS+9J3NNQyJj5Uy
 kTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kdTNACTCKcUE/vmTt4U//eWOWcI9QLR4DgzQ0oAx5q8=;
 b=bVfbJWNqvpVshhnvlD2rNRjo5UhfRKl9FwUkJ1okqFlaaRIvTRnXYR1T0L2moJ4BBb
 q0Kw+kZXloA7fCdyolJ9Ow6Em9omV2l20UMNM3+Pqo6f1ddp9CKfZxlTXwCcywraTGp+
 27rna/CWUflUr4JWH7+RUnpwuZeAgb+qLAfD+owLdJN83jYNqay/R6jj/jZhopHSlZlO
 2GsyTWp6wZffjFg77bILzImYL+UqE90ywbOqsn7f/cbWuSHZULasqCmq7H0ApgWV4U4Y
 0qEr21oEH87jaQUvTSi6HEFAQTBhg3zqGMmY8+Q04ICdhUdG53i6p+joPIhxitWycBBf
 e+fg==
X-Gm-Message-State: AOAM530KOIWIMHrDvsx4+pBOxRZl1qhcZDQPLxoOj5hb1l9XGadQVj91
 xTlKhD4PZWayydERQ22/OPZkEpjTPESKJQ==
X-Google-Smtp-Source: ABdhPJz1barEInOPGbvAa25O8AioYY6a10xVmRX8V/9eDkkwzwZdPNCJrasNz40UABXGkP920e0kAQ==
X-Received: by 2002:a63:1d5c:: with SMTP id d28mr3060427pgm.82.1599716760164; 
 Wed, 09 Sep 2020 22:46:00 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id o30sm3960374pgc.45.2020.09.09.22.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 22:45:59 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 7/9] powerpc/pseries/eeh: Rework device EEH PE determination
Date: Thu, 10 Sep 2020 15:45:30 +1000
Message-Id: <20200910054532.2043724-8-oohall@gmail.com>
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

The process Linux uses for determining if a device supports EEH or not
appears to be at odds with what PAPR+ says the OS should be doing. The
current flow is something like:

1. Assume pe_config_addr is equal the the device's config_addr.
2. Attempt to enable EEH on that PE
3. Verify EEH was enabled (POWER4 bug workaround)
4. Try find the pe_config_addr using the ibm,get-config-addr-info2 RTAS
   call.
5. If that fails walk the pci_dn tree upwards trying to find a parent
   device with EEH support. If we find one then add the device to that PE.

The first major flaw with this is that in order to enable EEH on a PE we
need to know the PE's configuration address since that's an input to the
ibm,set-eeh-option RTAS call which is used to enable EEH for the PE. We
hack around that by assuming that the PE address is equal to the device's
RTAS config address with the register fields set to zero (see
rtas_config_addr()). This assumption happens to be valid if:

a) The PCI device is the 0th function, and
b) The device is on the PE's root bus.

However, it this does also appear to work for devices where these
conditions are not true. At a guess PowerVM's RTAS has some workarounds to
accommodate Linux's quirks. However, it's a bit sketch and the code is
confusing since it's not implementing what PAPR claims is the correct way.

This patch re-works how we handle EEH init so that we find the PE config
address using the ibm,get-config-addr-info2 RTAS call, then use that to
finish the EEH init process. It also drops the Power4 workaround since as
of commit 471d7ff8b51b ("powerpc/64s: Remove POWER4 support") the kernel
does not support running on a Power4 CPU.

1. Find the pe_config_addr using the RTAS call.
2. Enable the PE (if needed)
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

