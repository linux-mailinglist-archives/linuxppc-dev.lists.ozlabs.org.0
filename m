Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B565421510B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 03:54:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0TBs5GvYzDqWs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 11:54:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VdYGbd3d; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0Spx2Xb3zDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 11:36:57 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id a6so39138216wrm.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 18:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qTN85kQJFZ/CqX764MNi5Fp1Sshxh/UeqhfI2UhtFmQ=;
 b=VdYGbd3dPoJIBHtt3Am4ytKbek6q+AG0RuLtwKvxn0A3PMSg+cClslHBCKjxHkOP2R
 d/hZljB/49lIADK/YVUnvC3qf5Z7CkLxOp7bcsZf9qy717Xbb/pbV7K5g50NT9YYc1dU
 a+giLVqqSDFDY5Oh/hUFGkxTnDMu35PT/S3je94iSaNf0mmk+Tzet7M/batOk82QfPNL
 6zYIYn7fjLq9k/Ta03KZWG2iXCxBCnYahUloNae3v2sJ5DJNLQjTUKjTBf97NIFf/OBX
 kLbHjmbzegOOjWhSD3O5e2w9x76wPIHxB+h9kWsJaLvpM/dmk7IYh/7VbxC1PfORjDXQ
 mybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qTN85kQJFZ/CqX764MNi5Fp1Sshxh/UeqhfI2UhtFmQ=;
 b=f4cab2ZWJyCk0GDWXRYzY0W0S4KBhjYx4uO/2sXE0RBeBGLW9cwu0pxAgIxnT2jvAC
 HtcmRRBcKjjqkgSfmAmh1JHWBgrZux/LAKn4D35/llrLautS37cOM1v3mt8HRIdz84C7
 zl3+tvN+UhFjOLxanrE6+34bKgM3+J52oE3rTq5UJ/S2wPJnb5SWnL2sdNeWwYiJd/18
 ElOI9gckRW5I79K5q7X0Hmf9FZN5tUWJy+2OjnDzvMdk6GxZxuOxcxG27Jx7DAnyPny6
 pBQlP069Tj3Ox/7EbyU+kM2w4OlWbwn0iXpKA1NEG25nMEzY5PMxnnH04y7O5eSp9j0y
 WFIQ==
X-Gm-Message-State: AOAM532KKeCXxJxqy24SnMJL1gFLQX7kV1qdppbJRe32Jw+6IzYAzSLU
 Tk/DeE1OuF+ePnoWmqvcdZIuKCzVz4Y=
X-Google-Smtp-Source: ABdhPJxw/QWLvVsH6KLBa+fUHYHKijNy1iSh3WaZUWTfG+cPNiL2NEpjEcCoQ7RmLk+5LMbKv83XBQ==
X-Received: by 2002:a5d:6990:: with SMTP id g16mr37704861wru.131.1593999413774; 
 Sun, 05 Jul 2020 18:36:53 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au (59-102-73-59.tpgi.com.au.
 [59.102.73.59])
 by smtp.gmail.com with ESMTPSA id v6sm9533392wrr.85.2020.07.05.18.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 18:36:53 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/14] powerpc/eeh: Remove VF config space restoration
Date: Mon,  6 Jul 2020 11:36:11 +1000
Message-Id: <20200706013619.459420-7-oohall@gmail.com>
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

There's a bunch of strange things about this code. First up is that none of
the fields being written to are functional for a VF. The SR-IOV
specification lists then as "Reserved, but OS should preserve" so writing
new values to them doesn't do anything and is clearly wrong from a
correctness perspective.

However, since VFs are designed to be managed by the OS there is an
argument to be made that we should be saving and restoring some parts of
config space. We already sort of do that by saving the first 64 bytes of
config space in the eeh_dev (see eeh_dev->config_space[]). This is
inadequate since it doesn't even consider saving and restoring the PCI
capability structures. However, this is a problem with EEH in general and
that needs to be fixed for non-VF devices too.

There's no real reason to keep around this around so delete it.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h               |  1 -
 arch/powerpc/kernel/eeh.c                    | 59 --------------------
 arch/powerpc/platforms/powernv/eeh-powernv.c | 20 ++-----
 arch/powerpc/platforms/pseries/eeh_pseries.c | 26 +--------
 4 files changed, 7 insertions(+), 99 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 1bddc0dfe099..046c5a2fe411 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -314,7 +314,6 @@ int eeh_pe_reset(struct eeh_pe *pe, int option, bool include_passed);
 int eeh_pe_configure(struct eeh_pe *pe);
 int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
 		      unsigned long addr, unsigned long mask);
-int eeh_restore_vf_config(struct pci_dn *pdn);
 
 /**
  * EEH_POSSIBLE_ERROR() -- test for possible MMIO failure.
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 859f76020256..a4df6f6de0bd 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -742,65 +742,6 @@ static void eeh_restore_dev_state(struct eeh_dev *edev, void *userdata)
 		pci_restore_state(pdev);
 }
 
-int eeh_restore_vf_config(struct pci_dn *pdn)
-{
-	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
-	u32 devctl, cmd, cap2, aer_capctl;
-	int old_mps;
-
-	if (edev->pcie_cap) {
-		/* Restore MPS */
-		old_mps = (ffs(pdn->mps) - 8) << 5;
-		eeh_ops->read_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
-				     2, &devctl);
-		devctl &= ~PCI_EXP_DEVCTL_PAYLOAD;
-		devctl |= old_mps;
-		eeh_ops->write_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
-				      2, devctl);
-
-		/* Disable Completion Timeout if possible */
-		eeh_ops->read_config(pdn, edev->pcie_cap + PCI_EXP_DEVCAP2,
-				     4, &cap2);
-		if (cap2 & PCI_EXP_DEVCAP2_COMP_TMOUT_DIS) {
-			eeh_ops->read_config(pdn,
-					     edev->pcie_cap + PCI_EXP_DEVCTL2,
-					     4, &cap2);
-			cap2 |= PCI_EXP_DEVCTL2_COMP_TMOUT_DIS;
-			eeh_ops->write_config(pdn,
-					      edev->pcie_cap + PCI_EXP_DEVCTL2,
-					      4, cap2);
-		}
-	}
-
-	/* Enable SERR and parity checking */
-	eeh_ops->read_config(pdn, PCI_COMMAND, 2, &cmd);
-	cmd |= (PCI_COMMAND_PARITY | PCI_COMMAND_SERR);
-	eeh_ops->write_config(pdn, PCI_COMMAND, 2, cmd);
-
-	/* Enable report various errors */
-	if (edev->pcie_cap) {
-		eeh_ops->read_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
-				     2, &devctl);
-		devctl &= ~PCI_EXP_DEVCTL_CERE;
-		devctl |= (PCI_EXP_DEVCTL_NFERE |
-			   PCI_EXP_DEVCTL_FERE |
-			   PCI_EXP_DEVCTL_URRE);
-		eeh_ops->write_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
-				      2, devctl);
-	}
-
-	/* Enable ECRC generation and check */
-	if (edev->pcie_cap && edev->aer_cap) {
-		eeh_ops->read_config(pdn, edev->aer_cap + PCI_ERR_CAP,
-				     4, &aer_capctl);
-		aer_capctl |= (PCI_ERR_CAP_ECRC_GENE | PCI_ERR_CAP_ECRC_CHKE);
-		eeh_ops->write_config(pdn, edev->aer_cap + PCI_ERR_CAP,
-				      4, aer_capctl);
-	}
-
-	return 0;
-}
-
 /**
  * pcibios_set_pcie_reset_state - Set PCI-E reset state
  * @dev: pci device struct
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index bcd0515d8f79..8f3a7611efc1 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -1629,20 +1629,12 @@ static int pnv_eeh_restore_config(struct pci_dn *pdn)
 	if (!edev)
 		return -EEXIST;
 
-	/*
-	 * We have to restore the PCI config space after reset since the
-	 * firmware can't see SRIOV VFs.
-	 *
-	 * FIXME: The MPS, error routing rules, timeout setting are worthy
-	 * to be exported by firmware in extendible way.
-	 */
-	if (edev->physfn) {
-		ret = eeh_restore_vf_config(pdn);
-	} else {
-		phb = pdn->phb->private_data;
-		ret = opal_pci_reinit(phb->opal_id,
-				      OPAL_REINIT_PCI_DEV, config_addr);
-	}
+	if (edev->physfn)
+		return 0;
+
+	phb = edev->controller->private_data;
+	ret = opal_pci_reinit(phb->opal_id,
+			      OPAL_REINIT_PCI_DEV, edev->bdfn);
 
 	if (ret) {
 		pr_warn("%s: Can't reinit PCI dev 0x%x (%lld)\n",
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 088771fa38be..83122bf65a8c 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -718,30 +718,6 @@ static int pseries_eeh_write_config(struct pci_dn *pdn, int where, int size, u32
 	return rtas_write_config(pdn, where, size, val);
 }
 
-static int pseries_eeh_restore_config(struct pci_dn *pdn)
-{
-	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
-	s64 ret = 0;
-
-	if (!edev)
-		return -EEXIST;
-
-	/*
-	 * FIXME: The MPS, error routing rules, timeout setting are worthy
-	 * to be exported by firmware in extendible way.
-	 */
-	if (edev->physfn)
-		ret = eeh_restore_vf_config(pdn);
-
-	if (ret) {
-		pr_warn("%s: Can't reinit PCI dev 0x%x (%lld)\n",
-			__func__, edev->pe_config_addr, ret);
-		return -EIO;
-	}
-
-	return ret;
-}
-
 #ifdef CONFIG_PCI_IOV
 int pseries_send_allow_unfreeze(struct pci_dn *pdn,
 				u16 *vf_pe_array, int cur_vfs)
@@ -848,7 +824,7 @@ static struct eeh_ops pseries_eeh_ops = {
 	.read_config		= pseries_eeh_read_config,
 	.write_config		= pseries_eeh_write_config,
 	.next_error		= NULL,
-	.restore_config		= pseries_eeh_restore_config,
+	.restore_config		= NULL, /* NB: configure_bridge() does this */
 #ifdef CONFIG_PCI_IOV
 	.notify_resume		= pseries_notify_resume
 #endif
-- 
2.26.2

