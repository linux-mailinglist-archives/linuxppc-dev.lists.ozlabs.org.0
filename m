Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4F126F989
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 11:47:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt8C83NvMzDqsG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 19:47:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XvA9AJa0; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt7rF0t4DzDqdm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 19:31:25 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id q12so2683944plr.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 02:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IFR/7gghpiS/Lqpcfe/CQUMOj1KJq+hJ2Y/BRMx8XRQ=;
 b=XvA9AJa0gNaY1ZhJZgIK8arQsJ3v52p4ZomItXPGxUlJSOca5E4nUpIfvweThxu/7+
 te1aQhKSxK7ro9eKyBgi+K04g84Q9kNnfqqJEnCh9h0zuvr+0/Xwy+z2h2dWsPkr70xG
 4ecCvIRwn3mkDc5kGko9GXgRzG5NvGuuyulyQMDT3Ye4LJH1dEkrf3OcUCmNg+d7SG3z
 5/OuDkDb8hJ4IqpA+O6cuTMpBaBMFiSsX1t/q+rdozd14xR8xpCl5XIr7ir5kbffnX3s
 lEVD/I1Lks/bDaOgm88jMBZXGNZFqAdKeQjP2ZoTxi3Cm0KpSdRn7tSJER4TjQ9AjTSg
 +RFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IFR/7gghpiS/Lqpcfe/CQUMOj1KJq+hJ2Y/BRMx8XRQ=;
 b=pAp4eP/cwAA6jv8oZI/n0EoZwlMu9MrMd28VA9/5enknzNdGgeYe5TctDT/h+tgqQj
 ruPGHKS7uJaTvWfYl1Rwez5tgBDe9t/bJnhTdEDyvrmEgWNgkjGDQYfI409T9RnMuQo6
 KuNtwdi/wmN70TK47sa2u18IjOcRtz1D6zWlsBLugSxWvkLvVcvHHKlF5NEQI1p+uv2t
 Izi56wHdpnLlp73r5rJsu8gC/wgpvK/RAknP83XBOkkHAjq9M3+RRYfOiLQXTuJMDVin
 6LUE+U7jv0ZWyO6r1/OtWB2UTdw+RSWeIw68j+nxvJzEkStJgomlkf9n6TKT8oKb1i6k
 bt+A==
X-Gm-Message-State: AOAM532MHRRNknDbsFRWNT740uOqJySLI3AUC6Z3fSHBvmuBsR/QesBF
 U35Kwn27zKhoklSpfbbFgZo7bxc1yOB2hA==
X-Google-Smtp-Source: ABdhPJzQX8Rx/Jck2E3MoslDmT9qZjsWe7ek8OFrnAEk51b7lOY5o8yS3dw4kAbhqQyDTuA4p+hgjA==
X-Received: by 2002:a17:902:3:b029:d1:9bd3:685d with SMTP id
 3-20020a1709020003b02900d19bd3685dmr32960895pla.1.1600421481857; 
 Fri, 18 Sep 2020 02:31:21 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id cf7sm2258853pjb.52.2020.09.18.02.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 02:31:21 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 9/9] powerpc/eeh: Clean up PE addressing
Date: Fri, 18 Sep 2020 19:30:50 +1000
Message-Id: <20200918093050.37344-9-oohall@gmail.com>
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

When support for EEH on PowerNV was added a lot of pseries specific code
was made "generic" and some of the quirks of pseries EEH came along for the
ride. One of the stranger quirks is eeh_pe containing two types of PE
address: pe->addr and pe->config_addr. There reason for this appears to be
historical baggage rather than any real requirements.

On pseries EEH PEs are manipulated using RTAS calls. Each EEH RTAS call
takes a "PE configuration address" as an input which is used to identify
which EEH PE is being manipulated by the call. When initialising the EEH
state for a device the first thing we need to do is determine the
configuration address for the PE which contains the device so we can enable
EEH on that PE. This process is outlined in PAPR which is the modern
(i.e post-2003) FW specification for pseries. However, EEH support was
first described in the pSeries RISC Platform Architecture (RPA) and
although they are mostly compatible EEH is one of the areas where they are
not.

The major difference is that RPA doesn't actually have the concept of a PE.
On RPA systems the EEH RTAS calls are done on a per-device basis using the
same config_addr that would be passed to the RTAS functions to access PCI
config space (e.g. ibm,read-pci-config). The config_addr is not identical
since the function and config register offsets of the config_addr must be
set to zero. EEH operations being done on a per-device basis doesn't make a
whole lot of sense when you consider how EEH was implemented on legacy PCI
systems.

For legacy PCI(-X) systems EEH was implemented using special PCI-PCI
bridges which contained logic to detect errors and freeze the secondary
bus when one occurred. This means that the EEH enabled state is shared
among all devices behind that EEH bridge. As a result there's no way to
implement the per-device control required for the semantics specified by
RPA. It can be made to work if we assume that a separate EEH bridge exists
for each EEH capable PCI slot and there are no bridges behind those slots.
However, RPA also specifies the ibm,configure-bridge RTAS call for
re-initalising bridges behind EEH capable slots after they are reset due
to an EEH event so that is probably not a valid assumption. This
incoherence was fixed in later PAPR, which succeeded RPA. Unfortunately,
since Linux EEH support seems to have been implemented based on the RPA
spec some of the legacy assumptions were carried over (probably for POWER4
compatibility).

The fix made in PAPR was the introduction of the "PE" concept and
redefining the EEH RTAS calls (set-eeh-option, reset-slot, etc) to operate
on a per-PE basis so all devices behind an EEH bride would share the same
EEH state. The "config_addr" argument to the EEH RTAS calls became the
"PE_config_addr" and the OS was required to use the
ibm,get-config-addr-info RTAS call to find the correct PE address for the
device. When support for the new interfaces was added to Linux it was
implemented using something like:

At probe time:

	pdn->eeh_config_addr = rtas_config_addr(pdn);
	pdn->eeh_pe_config_addr = rtas_get_config_addr_info(pdn);

When performing an RTAS call:

	config_addr = pdn->eeh_config_addr;
	if (pdn->eeh_pe_config_addr)
		config_addr = pdn->eeh_pe_config_addr;

	rtas_call(..., config_addr, ...);

In other words, if the ibm,get-config-addr-info RTAS call is implemented
and returned a valid result we'd use that as the argument to the EEH
RTAS calls. If not, Linux would fall back to using the device's
config_addr. Over time these addresses have moved around going from pci_dn
to eeh_dev and finally into eeh_pe. Today the users look like this:

	config_addr = pe->config_addr;
	if (pe->addr)
		config_addr = pe->addr;

	rtas_call(..., config_addr, ...);

However, considering the EEH core always operates on a per-PE basis and
even on pseries the only per-device operation is the initial call to
ibm,set-eeh-option I'm not sure if any of this actually works on an RPA
system today. It doesn't make much sense to have the fallback address in
a generic structure either since the bulk of the code which reference it
is in pseries anyway.

The EEH core makes a token effort to support looking up a PE using the
config_addr by having two arguments to eeh_pe_get(). However, a survey of
all the callers to eeh_pe_get() shows that all bar one have the config_addr
argument hard-coded to zero.The only caller that doesn't is in
eeh_pe_tree_insert() which has:

	if (!eeh_has_flag(EEH_VALID_PE_ZERO) && !edev->pe_config_addr)
		return -EINVAL;

	pe = eeh_pe_get(hose, edev->pe_config_addr, edev->bdfn);

The third argument (config_addr) is only used if the second (pe->addr)
argument is invalid. The preceding check ensures that the call to
eeh_pe_get() will never happen if edev->pe_config_addr is invalid so there
is no situation where eeh_pe_get() will search for a PE based on the 3rd
argument. The check also means that we'll never insert a PE into the tree
where pe_config_addr is zero since EEH_VALID_PE_ZERO is never set on
pseries. All the users of the fallback address on pseries never actually
use the fallback and all the only caller that supplies something for the
config_addr argument to eeh_pe_get() never use it either. It's all dead
code.

This patch removes the fallback address from eeh_pe since nothing uses it.
Specificly, we do this by:

1) Removing pe->config_addr
2) Removing the EEH_VALID_PE_ZERO flag
3) Removing the fallback address argument to eeh_pe_get().
4) Removing all the checks for pe->addr being zero in the pseries EEH code.

This leaves us with PE's only being identified by what's in their pe->addr
field and the EEH core relying on the platform to ensure that eeh_dev's are
only inserted into the EEH tree if they're actually inside a PE.

No functional changes, I hope.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: re-wrote commit message
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
index 6d95e774bded..e0f6ad2d2986 100644
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
 
@@ -1675,16 +1675,6 @@ static int __init eeh_powernv_init(void)
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

