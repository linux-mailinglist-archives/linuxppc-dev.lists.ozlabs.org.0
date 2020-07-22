Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50909228F46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:40:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBN774l82zDqRk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:40:19 +1000 (AEST)
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
 header.s=20161025 header.b=PhNz3mPU; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBMqh4B0QzDqgd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:26:56 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id s189so507765pgc.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MhjGcknO9l3C3dTxpOOgwVsJN6afLuH59RwDlcNqnoQ=;
 b=PhNz3mPU+eXq+LyHjk2vFEiKF/aWBVU92EGw/WJtcUicQxTYllbyKu9nmzN7rwzRYd
 b6lk6ycpZSSXtxArEpDjQ/qi0SO1KP2+ID3aSGMYFzehzKsYATB+eyjC1Thd/YOOPvID
 JBj09tdy53ZUlmgHVbYgsWek6wJnkEEGz7m7uNtY3cAXA3S+O4RQ5YjzmqN4FdFRrbBf
 P4uF48F0LIx0ur8Y/7Wmdrve/CWh067nL/+3BnyW2/pHBsb5jkKAQE38h73cTfTdbaIz
 PWjLWaxNTgMmSLjRvCw62b3KQFKjKovKx7oQ3+7UH2TyQTBBCJKFnKzBBVG71QsgCvMa
 xIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MhjGcknO9l3C3dTxpOOgwVsJN6afLuH59RwDlcNqnoQ=;
 b=rhw5BEvzEpXJFwaSEeSIUOYn3Jfw74DCMNOQsUTwI38ufSptbtNvnO0YUo/iXHqxgn
 3cONjZXWL3Of7ArGifeGvMibW+slo9H6uXqpH8cgevtVr/dBeWJzy1M+k2a/ISNJSHII
 PP7NtJSReiSbtyyENY+W6ZSMqs+ZKfLkhF122OnFDbuDntbB0M06Ji8ptuQUXdjYSp3j
 FILCONAkfY7Ek9r1ina7B5o3mxfmyPbnKSZ3mtkWqe8MdK1Z+UZ1tnjlte1kuwkdpK3t
 jGBt5cxM9ASxuP5UIChFxlnnG25NHc0k/F3bQ9vutk5+pU2afw/vPMj/WrBmB058lGJt
 WGdQ==
X-Gm-Message-State: AOAM530L2bmZSAMCTkm43vd/bxE5u82RBfmEtT4IXmiKFyL93c2vKJqU
 RwxLuInuQ2lPqmgMMS2JowrRaIs4/sg=
X-Google-Smtp-Source: ABdhPJy6BDUzDBVrdetqEEei5aBKdVMkGfn1aaBsESNIQ3NC4fZ+6bEoP9WamWLM1nzpyVW04i8zfQ==
X-Received: by 2002:aa7:9a92:: with SMTP id w18mr27088890pfi.233.1595392014395; 
 Tue, 21 Jul 2020 21:26:54 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id d4sm20583709pgf.9.2020.07.21.21.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 21:26:53 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/14] powerpc/eeh: Remove VF config space restoration
Date: Wed, 22 Jul 2020 14:26:20 +1000
Message-Id: <20200722042628.1425880-6-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722042628.1425880-1-oohall@gmail.com>
References: <20200722042628.1425880-1-oohall@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>
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
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
v2: no changes
---
 arch/powerpc/include/asm/eeh.h               |  1 -
 arch/powerpc/kernel/eeh.c                    | 59 --------------------
 arch/powerpc/platforms/powernv/eeh-powernv.c | 20 ++-----
 arch/powerpc/platforms/pseries/eeh_pseries.c | 26 +--------
 4 files changed, 7 insertions(+), 99 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index d619012281bd..c7d5a234bb51 100644
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
index bcc72b9a5309..39cdf447dfa6 100644
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

