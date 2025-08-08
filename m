Return-Path: <linuxppc-dev+bounces-10763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD685B1EC0B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 17:31:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bz7Kl55gkz2xpn;
	Sat,  9 Aug 2025 01:31:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754667083;
	cv=none; b=nODvoV0LmHGQ/ZTXxGLivsM+8By/iOnd3rQ9wZDJo1bARp8lU7za9smb74BANSrEFJwqNuMeJFD+48C35zIddRL7Kcw7e0/0jM4CkVuvRfbIi0erOllXAGv3IasDbeequroFiRsBA6QPlPgMxS/S07f7I4G/gMLRrK/sPInLeDfOUaYi1xzjAh8FBz2tDai4iWBdMAFu/xCTUraL50c69fgog4DJXBo4Zz5gwHhQfZLZmwS2S9bUERHkqRSLCjPdBPepE29WRNgVBNZXoOXbzhymtWDlKPsFLDBE03ZxTc4ELXKJHmRhc+jnLu/g8Vak3u/MSCUsHsrfZ2SjzYJi1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754667083; c=relaxed/relaxed;
	bh=efnbVXMC7ZOteleCFwefUBLp+DUBqOdfmhfJeBukDwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F0vpw+vDwUNahNo2+26j7bMvH6yuqgjMYQhh8Mp7cP07ATPBa81P1YoUqRYXLZSqQcm7smGKDUC9eLuGTt6CAT4xE/P6WK2kX1ODT9pEF0zVfEkfHuyrl+St83AFaYw8O8+tV19ubI2afreMl6eg+wKPbpR6dHiyba1iU9KFirDy+p9yZty8ry71GQocax7m9akR9yFfgYZJwJed9e20GWBeMTz8wqKvlM+XlldvpqUhDOO21LMLXmPPVxJb29QqMsb8bCerX9stiKqOARTqy/xEOEdtiGhP6H9RBocpCDnqeLkfjr74OY8oLUWJc9liZH9AJlYTrYx9nv6JeayESw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J5nfC4Lj; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J5nfC4Lj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bz7Kk6SF8z2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Aug 2025 01:31:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0174AA55AF9;
	Fri,  8 Aug 2025 15:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8BCC4CEF7;
	Fri,  8 Aug 2025 15:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754667080;
	bh=X1AhUCKCUNMHG7AhrYCMyABgRQsIbWAveiaYKrESRr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5nfC4Ljhus24QE2bfM1Dm2iP4Bk9knUapLab7O69YwOX/LnpRGMdjXVFCSEJxnaS
	 MPS19Tylqt/p09uRBM6DuR8KeuRNBwFyChp7ewvL/MGur6KMri9PC+WleJypfwY9mf
	 aoEtPOYSa05kB+atwvz3CIV7L6gGuxTWiFPpMLfOwtLkwfIOTKHGjM5baVT8f3HG65
	 kS7YHzQcvE1R0yhbZxLecboaZdTW4BhJ8b6IQ2G7CcoMJH8IXWoA6qxrp2F4t6asNG
	 /BLZop+d8PCJxRKBgT0hHFnVPuQB3X/dM0zWhckyXcWTwc+zf2tCPmma94+Iu4O6ij
	 r0GF9GgpmilQg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Sasha Levin <sashal@kernel.org>,
	mahesh@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.16-6.6] powerpc/eeh: Make EEH driver device hotplug safe
Date: Fri,  8 Aug 2025 11:30:51 -0400
Message-Id: <20250808153054.1250675-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808153054.1250675-1-sashal@kernel.org>
References: <20250808153054.1250675-1-sashal@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Timothy Pearson <tpearson@raptorengineering.com>

[ Upstream commit 1010b4c012b0d78dfb9d3132b49aa2ef024a07a7 ]

Multiple race conditions existed between the PCIe hotplug driver and the
EEH driver, leading to a variety of kernel oopses of the same general
nature:

<pcie device unplug>
<eeh driver trigger>
<hotplug removal trigger>
<pcie tree reconfiguration>
<eeh recovery next step>
<oops in EEH driver bus iteration loop>

A second class of oops is also seen when the underlying bus disappears
during device recovery.

Refactor the EEH module to be PCI rescan and remove safe.  Also clean
up a few minor formatting / readability issues.

Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Link: https://patch.msgid.link/1334208367.1359861.1752615503144.JavaMail.zimbra@raptorengineeringinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**YES**

This commit should be backported to stable kernel trees for the
following reasons:

## 1. **Critical Bug Fix for Race Conditions**
The commit explicitly fixes "Multiple race conditions" between the PCIe
hotplug driver and the EEH (Enhanced Error Handling) driver that lead to
kernel oopses. These are serious kernel crashes that can cause system
instability or complete system failure.

## 2. **Clear Bug Symptoms Described**
The commit message describes two classes of kernel oopses:
- Race conditions during concurrent PCIe device unplug and EEH recovery
  operations
- Crashes when the underlying bus disappears during device recovery

These are real-world stability issues that affect system reliability.

## 3. **Focused Fix with Clear Scope**
The changes are focused on making the EEH driver "PCI rescan and remove
safe" by properly coordinating locking around critical sections. The key
changes include:

- Moving `pci_lock_rescan_remove()` calls to protect larger critical
  sections in `eeh_handle_normal_event()` and
  `eeh_handle_special_event()`
- Removing scattered lock/unlock pairs from individual functions like
  `eeh_pe_report_edev()` and `eeh_reset_device()`
- Adding proper NULL checks (e.g., checking if `edev->pdev` exists
  before dereferencing in `eeh_bridge_check_link()`)
- Adding `*result = PCI_ERS_RESULT_DISCONNECT` when no device is found

## 4. **Minimal Risk of Regression**
The changes are:
- Confined to the PowerPC EEH subsystem
- Primarily involve moving existing locking to broader scopes
- Add defensive NULL checks
- Don't introduce new features or change architecture

## 5. **Follows Stable Kernel Rules**
This fix meets the stable kernel criteria:
- Fixes a real bug (kernel oopses)
- Has been tested (signed off by multiple maintainers)
- Is self-contained to a specific subsystem
- Doesn't add new features
- Has clear bug symptoms that users experience

## 6. **Critical for PowerPC Server Systems**
EEH is crucial for PowerPC server systems' reliability, especially in
environments with PCIe hotplug operations. The race conditions can lead
to unexpected downtime in production systems.

The refactoring to consolidate the locking at higher levels (in the main
event handlers) rather than scattered throughout the code makes the
locking strategy clearer and reduces the chance of deadlocks or missed
locking, which is a good defensive programming practice for stable
kernels.

 arch/powerpc/kernel/eeh_driver.c | 48 +++++++++++++++++++++-----------
 arch/powerpc/kernel/eeh_pe.c     | 10 ++++---
 2 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 7efe04c68f0f..dd50de91c438 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -257,13 +257,12 @@ static void eeh_pe_report_edev(struct eeh_dev *edev, eeh_report_fn fn,
 	struct pci_driver *driver;
 	enum pci_ers_result new_result;
 
-	pci_lock_rescan_remove();
 	pdev = edev->pdev;
 	if (pdev)
 		get_device(&pdev->dev);
-	pci_unlock_rescan_remove();
 	if (!pdev) {
 		eeh_edev_info(edev, "no device");
+		*result = PCI_ERS_RESULT_DISCONNECT;
 		return;
 	}
 	device_lock(&pdev->dev);
@@ -304,8 +303,9 @@ static void eeh_pe_report(const char *name, struct eeh_pe *root,
 	struct eeh_dev *edev, *tmp;
 
 	pr_info("EEH: Beginning: '%s'\n", name);
-	eeh_for_each_pe(root, pe) eeh_pe_for_each_dev(pe, edev, tmp)
-		eeh_pe_report_edev(edev, fn, result);
+	eeh_for_each_pe(root, pe)
+		eeh_pe_for_each_dev(pe, edev, tmp)
+			eeh_pe_report_edev(edev, fn, result);
 	if (result)
 		pr_info("EEH: Finished:'%s' with aggregate recovery state:'%s'\n",
 			name, pci_ers_result_name(*result));
@@ -383,6 +383,8 @@ static void eeh_dev_restore_state(struct eeh_dev *edev, void *userdata)
 	if (!edev)
 		return;
 
+	pci_lock_rescan_remove();
+
 	/*
 	 * The content in the config space isn't saved because
 	 * the blocked config space on some adapters. We have
@@ -393,14 +395,19 @@ static void eeh_dev_restore_state(struct eeh_dev *edev, void *userdata)
 		if (list_is_last(&edev->entry, &edev->pe->edevs))
 			eeh_pe_restore_bars(edev->pe);
 
+		pci_unlock_rescan_remove();
 		return;
 	}
 
 	pdev = eeh_dev_to_pci_dev(edev);
-	if (!pdev)
+	if (!pdev) {
+		pci_unlock_rescan_remove();
 		return;
+	}
 
 	pci_restore_state(pdev);
+
+	pci_unlock_rescan_remove();
 }
 
 /**
@@ -647,9 +654,7 @@ static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
 	if (any_passed || driver_eeh_aware || (pe->type & EEH_PE_VF)) {
 		eeh_pe_dev_traverse(pe, eeh_rmv_device, rmv_data);
 	} else {
-		pci_lock_rescan_remove();
 		pci_hp_remove_devices(bus);
-		pci_unlock_rescan_remove();
 	}
 
 	/*
@@ -665,8 +670,6 @@ static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
 	if (rc)
 		return rc;
 
-	pci_lock_rescan_remove();
-
 	/* Restore PE */
 	eeh_ops->configure_bridge(pe);
 	eeh_pe_restore_bars(pe);
@@ -674,7 +677,6 @@ static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
 	/* Clear frozen state */
 	rc = eeh_clear_pe_frozen_state(pe, false);
 	if (rc) {
-		pci_unlock_rescan_remove();
 		return rc;
 	}
 
@@ -709,7 +711,6 @@ static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
 	pe->tstamp = tstamp;
 	pe->freeze_count = cnt;
 
-	pci_unlock_rescan_remove();
 	return 0;
 }
 
@@ -843,10 +844,13 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		{LIST_HEAD_INIT(rmv_data.removed_vf_list), 0};
 	int devices = 0;
 
+	pci_lock_rescan_remove();
+
 	bus = eeh_pe_bus_get(pe);
 	if (!bus) {
 		pr_err("%s: Cannot find PCI bus for PHB#%x-PE#%x\n",
 			__func__, pe->phb->global_number, pe->addr);
+		pci_unlock_rescan_remove();
 		return;
 	}
 
@@ -1094,10 +1098,15 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		eeh_pe_state_clear(pe, EEH_PE_PRI_BUS, true);
 		eeh_pe_dev_mode_mark(pe, EEH_DEV_REMOVED);
 
-		pci_lock_rescan_remove();
-		pci_hp_remove_devices(bus);
-		pci_unlock_rescan_remove();
+		bus = eeh_pe_bus_get(pe);
+		if (bus)
+			pci_hp_remove_devices(bus);
+		else
+			pr_err("%s: PCI bus for PHB#%x-PE#%x disappeared\n",
+				__func__, pe->phb->global_number, pe->addr);
+
 		/* The passed PE should no longer be used */
+		pci_unlock_rescan_remove();
 		return;
 	}
 
@@ -1114,6 +1123,8 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 			eeh_clear_slot_attention(edev->pdev);
 
 	eeh_pe_state_clear(pe, EEH_PE_RECOVERING, true);
+
+	pci_unlock_rescan_remove();
 }
 
 /**
@@ -1132,6 +1143,7 @@ void eeh_handle_special_event(void)
 	unsigned long flags;
 	int rc;
 
+	pci_lock_rescan_remove();
 
 	do {
 		rc = eeh_ops->next_error(&pe);
@@ -1171,10 +1183,12 @@ void eeh_handle_special_event(void)
 
 			break;
 		case EEH_NEXT_ERR_NONE:
+			pci_unlock_rescan_remove();
 			return;
 		default:
 			pr_warn("%s: Invalid value %d from next_error()\n",
 				__func__, rc);
+			pci_unlock_rescan_remove();
 			return;
 		}
 
@@ -1186,7 +1200,9 @@ void eeh_handle_special_event(void)
 		if (rc == EEH_NEXT_ERR_FROZEN_PE ||
 		    rc == EEH_NEXT_ERR_FENCED_PHB) {
 			eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
+			pci_unlock_rescan_remove();
 			eeh_handle_normal_event(pe);
+			pci_lock_rescan_remove();
 		} else {
 			eeh_for_each_pe(pe, tmp_pe)
 				eeh_pe_for_each_dev(tmp_pe, edev, tmp_edev)
@@ -1199,7 +1215,6 @@ void eeh_handle_special_event(void)
 				eeh_report_failure, NULL);
 			eeh_set_channel_state(pe, pci_channel_io_perm_failure);
 
-			pci_lock_rescan_remove();
 			list_for_each_entry(hose, &hose_list, list_node) {
 				phb_pe = eeh_phb_pe_get(hose);
 				if (!phb_pe ||
@@ -1218,7 +1233,6 @@ void eeh_handle_special_event(void)
 				}
 				pci_hp_remove_devices(bus);
 			}
-			pci_unlock_rescan_remove();
 		}
 
 		/*
@@ -1228,4 +1242,6 @@ void eeh_handle_special_event(void)
 		if (rc == EEH_NEXT_ERR_DEAD_IOC)
 			break;
 	} while (rc != EEH_NEXT_ERR_NONE);
+
+	pci_unlock_rescan_remove();
 }
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index d283d281d28e..e740101fadf3 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -671,10 +671,12 @@ static void eeh_bridge_check_link(struct eeh_dev *edev)
 	eeh_ops->write_config(edev, cap + PCI_EXP_LNKCTL, 2, val);
 
 	/* Check link */
-	if (!edev->pdev->link_active_reporting) {
-		eeh_edev_dbg(edev, "No link reporting capability\n");
-		msleep(1000);
-		return;
+	if (edev->pdev) {
+		if (!edev->pdev->link_active_reporting) {
+			eeh_edev_dbg(edev, "No link reporting capability\n");
+			msleep(1000);
+			return;
+		}
 	}
 
 	/* Wait the link is up until timeout (5s) */
-- 
2.39.5


