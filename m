Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BE5263CE9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 08:03:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn7cW5xlHzDqLj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 16:03:55 +1000 (AEST)
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
 header.s=20161025 header.b=PC4VcPBU; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn7D05TrCzDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 15:46:08 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id k15so3966666pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Sep 2020 22:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s1uIXF6ZtsklhL069zqG/t3PFdjdtfIeg4mKptBpJ44=;
 b=PC4VcPBUIHLSuyuYr6Tt4BKklayyZSDVqZRCEw1U5miZhmrfavDubnlNRVxFq0qlPA
 ndnmDe2H4OPPXq+fkQCtqIBEJbBqREWe1N1jGE4UDgv677/6N1tz75CXpqEHt7bEoLJP
 XTlRjsbBMPx/g/KV7+XNtSzbBpq4WvZoZHkPsOoWiFjfLZTZs7MllhOUF/Xq/Xu51FW5
 wco4kXty/+mTMABepPYRBcWgiQoEEQEutbmHrKPxwQ7Z6Oc7LYts4hIbL0yaGRK+vm1x
 agyb2DMXizYiVGaALVhWX2GiEELW9aoAbw4zSL2g4brq0Ev/0AIvBNW9yKVbZA7r1rtZ
 CRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s1uIXF6ZtsklhL069zqG/t3PFdjdtfIeg4mKptBpJ44=;
 b=JBzjB9AtkJYBHNKw+Ij83hBfF4O8mHrhZ1OamvX12KSyPceVN0UsJ5t82tzCHVJW1J
 Z4dwS53ituvc8VqRDCe4imIazxoetZc6bCT0cmToFHYTaKfZRPdtYppeyynlfRB7udTh
 JlKVQCmStHMud8LYgRR2pm9Fg7JGub9b3skOxN+Lo0P3jkDqWPhXyBeg3D9YE4KrNFMl
 KqV6K866ctONLjBcv+qvs1RoysUQy1Egxc7rPsUaUUdinZ7MVJ5BRzNK8ptBnD1bIFPG
 IG2f4iHdV8zBbxstj1lA3u0/uk3C6aGBQTVc7B5hD5yibrB2iK1cbxoU1gUMTwocFVqn
 p1dw==
X-Gm-Message-State: AOAM5320nHxQPvjRHVKfTE2F+lLn2PL9NNKgGwe1T0e6Y4MRQQacsdJf
 8VfvKOtAdKwWbiGrMTpJLe89re+Au01d4g==
X-Google-Smtp-Source: ABdhPJxT5dn6jIcJFRBK3ArSSDxSeaQGeZm6ACrvCVayVMmU2AqD0DDFFKFRRqTajuB2A1Fb+LO05g==
X-Received: by 2002:a63:6346:: with SMTP id x67mr3244298pgb.121.1599716764324; 
 Wed, 09 Sep 2020 22:46:04 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id o30sm3960374pgc.45.2020.09.09.22.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 22:46:03 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 9/9] powerpc/eeh: Clean up PE addressing
Date: Thu, 10 Sep 2020 15:45:32 +1000
Message-Id: <20200910054532.2043724-10-oohall@gmail.com>
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

At some point in the distant past we only supported EEH on pseries. The
various EEH RTAS call use the "PE config address" as a handle to the PE
being manipulated so we need to find that address a PE.

There's three ways to determine the address of a PE starting from a device
inside of that PE: The old way, which requires traversing the DT until you
find a built-in device and finding its PE using the
ibm,read-slot-reset-state2 RTAS call. The new way, which requires using the
ibm,get-config-addr-info RTAS call to map the device address to a PE
address. And then there's the Linux way, which is "blindly assume the
device and PE addresses are the same." Naturally, PAPR doesn't recommend
(or even mention) that last one, but it's a technique
Linux on Power has used since the dawn of time.

Most (all?) modern pseries systems will provide the get-addr-info RTAS call
so Linux uses that for everything except for the initial ibm,eeh-set-option
RTAS call to enable EEH on the PE. The Linux way is still broken in that
case, but it seems to work so who maybe firmware have hacks to support it,
who knows. For systems that don't support the RTAS call we'll use the Linux
way as a fallback. For some reason we don't just use the fallback address
to initialise eeh_dev->addr and instead eeh_pe has two addresses and we'll
choose which one to use at runtime. This results in code that looks
something like:

	config_addr = pe->config_addr;
	if (pe->addr)
	        config_addr = pe->addr;

	rtas_call(..., config_addr, ...);

In other words, if the result of the RTAS call is non-zero then Linux will
use that as the pe address. If not, it falls back to using the config_addr.
It's worth pointing out that both fields here used to be part of pci_dn and
ended up in eeh_pe after a while.

Storing both addresses in eeh_pe doesn't really make a whole lot of sense.
Why does the eeh_pe structure, which is platform independent, have two
addresses baked into it for the sake of a pseries platform quirk? Why
doesn't the pseries platform handle determining what the "correct" PE
address is during EEH initialisation for the device and just pass that
address to the EEH core? What does it even mean for a pe to have an
"address" if there's two of them?

There are no good answers to these questions; especially that last one. The
EEH core makes a token effort to support looking up a PE by either address
by having two arguments to eeh_pe_get(). However, a survey of all the
callers to eeh_pe_get() shows that all except one hard-code zero as the
config_addr argument. The only one that doesn't is in eeh_pe_tree_insert()a
which looks like this:

	if (!eeh_has_flag(EEH_VALID_PE_ZERO) && !edev->pe_config_addr)
		return -EINVAL;

	pe = eeh_pe_get(hose, edev->pe_config_addr, edev->bdfn);

The third argument (config_addr) is only used if the second (pe->addr)
argument is invalid. In this case that would require edev->pe_config_addr
to be zero and the EEH_VALID_PE_ZERO flag to be unset. The preceding check
ensure that can never be true so there is no situation where eeh_pe_get()
will search for a PE with the specified pe->config_addr.

Similarly, on pseries the EEH_VALID_PE_ZERO flag isn't set so the check
above also ensures that there will never be a PE with pe->addr == 0. As a
result all the logic to choose whether we pass pe->config_addr or pe->addr
to an RTAS call is also dead code. The pe->config_addr will never be used
since pe->addr must be non-zero. Otherwise it wouldn't be in the PE tree.

This patch tries to clean up this mess by:

1) Removing pe->config_addr
2) Removing the EEH_VALID_PE_ZERO flag
3) Removing the fallback address argument to eeh_pe_get().
4) Removing all the checks for pe->addr being zero in the pseries EEH code.

This leaves us with PE's only being identified by what's in their pe->addr
field and relying on the platform to ensure that eeh_dev's are only
inserted into the EEH tree if they're actually inside a PE.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h               |  4 +-
 arch/powerpc/kernel/eeh.c                    |  2 +-
 arch/powerpc/kernel/eeh_pe.c                 | 46 +++-----------------
 arch/powerpc/platforms/powernv/eeh-powernv.c | 16 ++-----
 arch/powerpc/platforms/pseries/eeh_pseries.c | 42 +++---------------
 5 files changed, 17 insertions(+), 93 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 85030c05e67e..dd6a4ac6c713 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -27,7 +27,6 @@ struct pci_dn;
 #define EEH_FORCE_DISABLED	0x02	/* EEH disabled			     */
 #define EEH_PROBE_MODE_DEV	0x04	/* From PCI device		     */
 #define EEH_PROBE_MODE_DEVTREE	0x08	/* From device tree		     */
-#define EEH_VALID_PE_ZERO	0x10	/* PE#0 is valid		     */
 #define EEH_ENABLE_IO_FOR_LOG	0x20	/* Enable IO for log		     */
 #define EEH_EARLY_DUMP_LOG	0x40	/* Dump log immediately		     */
 
@@ -280,8 +279,7 @@ int eeh_phb_pe_create(struct pci_controller *phb);
 int eeh_wait_state(struct eeh_pe *pe, int max_wait);
 struct eeh_pe *eeh_phb_pe_get(struct pci_controller *phb);
 struct eeh_pe *eeh_pe_next(struct eeh_pe *pe, struct eeh_pe *root);
-struct eeh_pe *eeh_pe_get(struct pci_controller *phb,
-			  int pe_no, int config_addr);
+struct eeh_pe *eeh_pe_get(struct pci_controller *phb, int pe_no);
 int eeh_pe_tree_insert(struct eeh_dev *edev, struct eeh_pe *new_pe_parent);
 int eeh_pe_tree_remove(struct eeh_dev *edev);
 void eeh_pe_update_time_stamp(struct eeh_pe *pe);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index c9e25cfce8f0..87de8b798b2d 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1657,7 +1657,7 @@ static ssize_t eeh_force_recover_write(struct file *filp,
 		return -ENODEV;
 
 	/* Retrieve PE */
-	pe = eeh_pe_get(hose, pe_no, 0);
+	pe = eeh_pe_get(hose, pe_no);
 	if (!pe)
 		return -ENODEV;
 
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index d2aaaa73fdd5..61b7d4019051 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -251,43 +251,21 @@ void eeh_pe_dev_traverse(struct eeh_pe *root,
 
 /**
  * __eeh_pe_get - Check the PE address
- * @data: EEH PE
- * @flag: EEH device
  *
  * For one particular PE, it can be identified by PE address
  * or tranditional BDF address. BDF address is composed of
  * Bus/Device/Function number. The extra data referred by flag
  * indicates which type of address should be used.
  */
-struct eeh_pe_get_flag {
-	int pe_no;
-	int config_addr;
-};
-
 static void *__eeh_pe_get(struct eeh_pe *pe, void *flag)
 {
-	struct eeh_pe_get_flag *tmp = (struct eeh_pe_get_flag *) flag;
+	int *target_pe = flag;
 
-	/* Unexpected PHB PE */
+	/* PHB PEs are special and should be ignored */
 	if (pe->type & EEH_PE_PHB)
 		return NULL;
 
-	/*
-	 * We prefer PE address. For most cases, we should
-	 * have non-zero PE address
-	 */
-	if (eeh_has_flag(EEH_VALID_PE_ZERO)) {
-		if (tmp->pe_no == pe->addr)
-			return pe;
-	} else {
-		if (tmp->pe_no &&
-		    (tmp->pe_no == pe->addr))
-			return pe;
-	}
-
-	/* Try BDF address */
-	if (tmp->config_addr &&
-	   (tmp->config_addr == pe->config_addr))
+	if (*target_pe == pe->addr)
 		return pe;
 
 	return NULL;
@@ -297,7 +275,6 @@ static void *__eeh_pe_get(struct eeh_pe *pe, void *flag)
  * eeh_pe_get - Search PE based on the given address
  * @phb: PCI controller
  * @pe_no: PE number
- * @config_addr: Config address
  *
  * Search the corresponding PE based on the specified address which
  * is included in the eeh device. The function is used to check if
@@ -306,16 +283,11 @@ static void *__eeh_pe_get(struct eeh_pe *pe, void *flag)
  * which is composed of PCI bus/device/function number, or unified
  * PE address.
  */
-struct eeh_pe *eeh_pe_get(struct pci_controller *phb,
-		int pe_no, int config_addr)
+struct eeh_pe *eeh_pe_get(struct pci_controller *phb, int pe_no)
 {
 	struct eeh_pe *root = eeh_phb_pe_get(phb);
-	struct eeh_pe_get_flag tmp = { pe_no, config_addr };
-	struct eeh_pe *pe;
-
-	pe = eeh_pe_traverse(root, __eeh_pe_get, &tmp);
 
-	return pe;
+	return eeh_pe_traverse(root, __eeh_pe_get, &pe_no);
 }
 
 /**
@@ -336,19 +308,13 @@ int eeh_pe_tree_insert(struct eeh_dev *edev, struct eeh_pe *new_pe_parent)
 	struct pci_controller *hose = edev->controller;
 	struct eeh_pe *pe, *parent;
 
-	/* Check if the PE number is valid */
-	if (!eeh_has_flag(EEH_VALID_PE_ZERO) && !edev->pe_config_addr) {
-		eeh_edev_err(edev, "PE#0 is invalid for this PHB!\n");
-		return -EINVAL;
-	}
-
 	/*
 	 * Search the PE has been existing or not according
 	 * to the PE address. If that has been existing, the
 	 * PE should be composed of PCI bus and its subordinate
 	 * components.
 	 */
-	pe = eeh_pe_get(hose, edev->pe_config_addr, edev->bdfn);
+	pe = eeh_pe_get(hose, edev->pe_config_addr);
 	if (pe) {
 		if (pe->type & EEH_PE_INVALID) {
 			list_add_tail(&edev->entry, &pe->edevs);
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index d03c5873defc..32e3ff28851b 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -87,7 +87,7 @@ static ssize_t pnv_eeh_ei_write(struct file *filp,
 		return -EINVAL;
 
 	/* Retrieve PE */
-	pe = eeh_pe_get(hose, pe_no, 0);
+	pe = eeh_pe_get(hose, pe_no);
 	if (!pe)
 		return -ENODEV;
 
@@ -306,7 +306,7 @@ static struct eeh_pe *pnv_eeh_get_upstream_pe(struct pci_dev *pdev)
 	if (parent) {
 		struct pnv_ioda_pe *ioda_pe = pnv_ioda_get_pe(parent);
 
-		return eeh_pe_get(phb->hose, ioda_pe->pe_number, 0);
+		return eeh_pe_get(phb->hose, ioda_pe->pe_number);
 	}
 
 	return NULL;
@@ -1358,7 +1358,7 @@ static int pnv_eeh_get_pe(struct pci_controller *hose,
 	}
 
 	/* Find the PE according to PE# */
-	dev_pe = eeh_pe_get(hose, pe_no, 0);
+	dev_pe = eeh_pe_get(hose, pe_no);
 	if (!dev_pe)
 		return -EEXIST;
 
@@ -1693,16 +1693,6 @@ static int __init eeh_powernv_init(void)
 		if (phb->diag_data_size > max_diag_size)
 			max_diag_size = phb->diag_data_size;
 
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
 		break;
 	}
 
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index e42c026392aa..2ebfe9d8bf8c 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -511,7 +511,6 @@ EXPORT_SYMBOL_GPL(pseries_eeh_init_edev_recursive);
 static int pseries_eeh_set_option(struct eeh_pe *pe, int option)
 {
 	int ret = 0;
-	int config_addr;
 
 	/*
 	 * When we're enabling or disabling EEH functioality on
@@ -524,9 +523,6 @@ static int pseries_eeh_set_option(struct eeh_pe *pe, int option)
 	case EEH_OPT_ENABLE:
 	case EEH_OPT_THAW_MMIO:
 	case EEH_OPT_THAW_DMA:
-		config_addr = pe->config_addr;
-		if (pe->addr)
-			config_addr = pe->addr;
 		break;
 	case EEH_OPT_FREEZE_PE:
 		/* Not support */
@@ -538,7 +534,7 @@ static int pseries_eeh_set_option(struct eeh_pe *pe, int option)
 	}
 
 	ret = rtas_call(ibm_set_eeh_option, 4, 1, NULL,
-			config_addr, BUID_HI(pe->phb->buid),
+			pe->addr, BUID_HI(pe->phb->buid),
 			BUID_LO(pe->phb->buid), option);
 
 	return ret;
@@ -559,25 +555,19 @@ static int pseries_eeh_set_option(struct eeh_pe *pe, int option)
  */
 static int pseries_eeh_get_state(struct eeh_pe *pe, int *delay)
 {
-	int config_addr;
 	int ret;
 	int rets[4];
 	int result;
 
-	/* Figure out PE config address if possible */
-	config_addr = pe->config_addr;
-	if (pe->addr)
-		config_addr = pe->addr;
-
 	if (ibm_read_slot_reset_state2 != RTAS_UNKNOWN_SERVICE) {
 		ret = rtas_call(ibm_read_slot_reset_state2, 3, 4, rets,
-				config_addr, BUID_HI(pe->phb->buid),
+				pe->addr, BUID_HI(pe->phb->buid),
 				BUID_LO(pe->phb->buid));
 	} else if (ibm_read_slot_reset_state != RTAS_UNKNOWN_SERVICE) {
 		/* Fake PE unavailable info */
 		rets[2] = 0;
 		ret = rtas_call(ibm_read_slot_reset_state, 3, 3, rets,
-				config_addr, BUID_HI(pe->phb->buid),
+				pe->addr, BUID_HI(pe->phb->buid),
 				BUID_LO(pe->phb->buid));
 	} else {
 		return EEH_STATE_NOT_SUPPORT;
@@ -631,14 +621,7 @@ static int pseries_eeh_get_state(struct eeh_pe *pe, int *delay)
  */
 static int pseries_eeh_reset(struct eeh_pe *pe, int option)
 {
-	int config_addr;
-
-	/* Figure out PE address */
-	config_addr = pe->config_addr;
-	if (pe->addr)
-		config_addr = pe->addr;
-
-	return pseries_eeh_phb_reset(pe->phb, config_addr, option);
+	return pseries_eeh_phb_reset(pe->phb, pe->addr, option);
 }
 
 /**
@@ -654,19 +637,13 @@ static int pseries_eeh_reset(struct eeh_pe *pe, int option)
  */
 static int pseries_eeh_get_log(struct eeh_pe *pe, int severity, char *drv_log, unsigned long len)
 {
-	int config_addr;
 	unsigned long flags;
 	int ret;
 
 	spin_lock_irqsave(&slot_errbuf_lock, flags);
 	memset(slot_errbuf, 0, eeh_error_buf_size);
 
-	/* Figure out the PE address */
-	config_addr = pe->config_addr;
-	if (pe->addr)
-		config_addr = pe->addr;
-
-	ret = rtas_call(ibm_slot_error_detail, 8, 1, NULL, config_addr,
+	ret = rtas_call(ibm_slot_error_detail, 8, 1, NULL, pe->addr,
 			BUID_HI(pe->phb->buid), BUID_LO(pe->phb->buid),
 			virt_to_phys(drv_log), len,
 			virt_to_phys(slot_errbuf), eeh_error_buf_size,
@@ -685,14 +662,7 @@ static int pseries_eeh_get_log(struct eeh_pe *pe, int severity, char *drv_log, u
  */
 static int pseries_eeh_configure_bridge(struct eeh_pe *pe)
 {
-	int config_addr;
-
-	/* Figure out the PE address */
-	config_addr = pe->config_addr;
-	if (pe->addr)
-		config_addr = pe->addr;
-
-	return pseries_eeh_phb_configure_bridge(pe->phb, config_addr);
+	return pseries_eeh_phb_configure_bridge(pe->phb, pe->addr);
 }
 
 /**
-- 
2.26.2

