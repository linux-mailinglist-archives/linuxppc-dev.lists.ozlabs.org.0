Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8C4215100
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 03:46:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0T2R57t2zDqWs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 11:46:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mPtLcR0H; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0Spm5PyHzDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 11:36:48 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id 17so40145676wmo.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 18:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uy52RU7NZ3E8hAL5OvSvgU877no0r0au5X43D5QaIiw=;
 b=mPtLcR0HHadUqlve7DanY2gZHEv+ypWUkWXR4qskIEFRcOEwVcImtsPOOek8qwKkk/
 iQnOATCX/Vm/61woUqNrHU0SWdpifC9/oJoFw+XtFMrPayUDfAGWnvwaYS3VeNRfZ+Na
 mHU/IxgtJQPa4NQj/2lDkANGQ/l4z5SD+haObG839lKrgsmqFhg6vTWcfX1k+x7qRpcc
 Lpn0nDrIccPUhXWe8jfC1AEO7kkbwWb/EYuIUksxAWxu61W97E3/jBpgJvrqP7HEQouI
 JUBSTDpvTUUMotjXu/82U9EgAqVhS7AzJyYPvubkqz3UG24wH2DlJZdjaH9teQJiAuXC
 jRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uy52RU7NZ3E8hAL5OvSvgU877no0r0au5X43D5QaIiw=;
 b=eZ+ZBcB96ANg14eWdHUPD4s50D3959cU9HZucad34PlGJYEuwvbhAhLFT/BkM6a+8L
 u8alLIg2N6Ec/CiEBaTmmpjjgcqdK+6hivHtklV7jUgZ0HPQ1ad8RHZ3G9yJ1FclsptM
 gLIHnR60Zkzo+/AE5MHA4v4doThiAe50EXh+Sa1bX8LmEYpKZcTMX6jB3npKa3ZWNH+b
 oaGQ7/cS6yv4II8HqwuRri4BWw0TVcNAcMi/c68Rakx5rGaFTMqDFYYSnBbsH7QDYO1S
 fcwB8R2lHk8aJkKt0ADZyafUMlRho13scby7q4hOMdYuD7mQrnTa+qdTRYspnIULbZ7k
 xfvA==
X-Gm-Message-State: AOAM531cwDyBMgeYg2a1cT2+hhdIVYLsBhUJLnqR9RiwS6VAKcKzzu6X
 3U0Saq8Cy1UofLmiYyt6/0LNCk+MrMs=
X-Google-Smtp-Source: ABdhPJx6N8s05dgYQ4GykxrtmB1Z2bkUDgagkZAC6WhNOt0ti5RZSKXFAU2Z/cgMiXU02MTPTISFAg==
X-Received: by 2002:a1c:2842:: with SMTP id o63mr31563171wmo.169.1593999405852; 
 Sun, 05 Jul 2020 18:36:45 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au (59-102-73-59.tpgi.com.au.
 [59.102.73.59])
 by smtp.gmail.com with ESMTPSA id v6sm9533392wrr.85.2020.07.05.18.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 18:36:45 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/14] powerpc/eeh: Move vf_index out of pci_dn and into
 eeh_dev
Date: Mon,  6 Jul 2020 11:36:08 +1000
Message-Id: <20200706013619.459420-4-oohall@gmail.com>
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

Drivers that do not support the PCI error handling callbacks are handled by
tearing down the device and re-probing them. If the device to be removed is
a virtual function we need to know the index of the index of the VF so that
we can remove it with the pci_iov_{add|remove}_virtfn() API.

Currently this is handled by looking up the pci_dn, and using the vf_index
that was stashed there when the pci_dn for the VF was created in
pcibios_sriov_enable(). We would like to eliminate the use of pci_dn
outside of pseries though so we need to provide the generic EEH code with
some other way to find the vf_index.

The easiest thing to do here is move the vf_index field out of pci_dn and
into eeh_dev.  Currently pci_dn and eeh_dev are allocated and initialized
together so this is a fairly minimal change in preparation for splitting
pci_dn and eeh_dev in the future.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h        | 3 +++
 arch/powerpc/include/asm/pci-bridge.h | 1 -
 arch/powerpc/kernel/eeh_driver.c      | 6 ++----
 arch/powerpc/kernel/pci_dn.c          | 7 ++++---
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index e22881a0c415..3d648e042835 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -148,7 +148,10 @@ struct eeh_dev {
 	struct pci_dn *pdn;		/* Associated PCI device node	*/
 	struct pci_dev *pdev;		/* Associated PCI device	*/
 	bool in_error;			/* Error flag for edev		*/
+
+	/* VF specific properties */
 	struct pci_dev *physfn;		/* Associated SRIOV PF		*/
+	int vf_index;			/* Index of this VF 		*/
 };
 
 /* "fmt" must be a simple literal string */
diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index b92e81b256e5..d2a2a14e56f9 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -202,7 +202,6 @@ struct pci_dn {
 #define IODA_INVALID_PE		0xFFFFFFFF
 	unsigned int pe_number;
 #ifdef CONFIG_PCI_IOV
-	int     vf_index;		/* VF index in the PF */
 	u16     vfs_expanded;		/* number of VFs IOV BAR expanded */
 	u16     num_vfs;		/* number of VFs enabled*/
 	unsigned int *pe_num_map;	/* PE# for the first VF PE or array */
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 7b048cee767c..b70b9273f45a 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -477,7 +477,7 @@ static void *eeh_add_virt_device(struct eeh_dev *edev)
 	}
 
 #ifdef CONFIG_PCI_IOV
-	pci_iov_add_virtfn(edev->physfn, eeh_dev_to_pdn(edev)->vf_index);
+	pci_iov_add_virtfn(edev->physfn, edev->vf_index);
 #endif
 	return NULL;
 }
@@ -521,9 +521,7 @@ static void eeh_rmv_device(struct eeh_dev *edev, void *userdata)
 
 	if (edev->physfn) {
 #ifdef CONFIG_PCI_IOV
-		struct pci_dn *pdn = eeh_dev_to_pdn(edev);
-
-		pci_iov_remove_virtfn(edev->physfn, pdn->vf_index);
+		pci_iov_remove_virtfn(edev->physfn, edev->vf_index);
 		edev->pdev = NULL;
 #endif
 		if (rmv_data)
diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index f790a8d06f50..bf11ac8427ac 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -146,7 +146,6 @@ static struct eeh_dev *eeh_dev_init(struct pci_dn *pdn)
 
 #ifdef CONFIG_PCI_IOV
 static struct pci_dn *add_one_sriov_vf_pdn(struct pci_dn *parent,
-					   int vf_index,
 					   int busno, int devfn)
 {
 	struct pci_dn *pdn;
@@ -163,7 +162,6 @@ static struct pci_dn *add_one_sriov_vf_pdn(struct pci_dn *parent,
 	pdn->parent = parent;
 	pdn->busno = busno;
 	pdn->devfn = devfn;
-	pdn->vf_index = vf_index;
 	pdn->pe_number = IODA_INVALID_PE;
 	INIT_LIST_HEAD(&pdn->child_list);
 	INIT_LIST_HEAD(&pdn->list);
@@ -194,7 +192,7 @@ struct pci_dn *add_sriov_vf_pdns(struct pci_dev *pdev)
 	for (i = 0; i < pci_sriov_get_totalvfs(pdev); i++) {
 		struct eeh_dev *edev __maybe_unused;
 
-		pdn = add_one_sriov_vf_pdn(parent, i,
+		pdn = add_one_sriov_vf_pdn(parent,
 					   pci_iov_virtfn_bus(pdev, i),
 					   pci_iov_virtfn_devfn(pdev, i));
 		if (!pdn) {
@@ -207,7 +205,10 @@ struct pci_dn *add_sriov_vf_pdns(struct pci_dev *pdev)
 		/* Create the EEH device for the VF */
 		edev = eeh_dev_init(pdn);
 		BUG_ON(!edev);
+
+		/* FIXME: these should probably be populated by the EEH probe */
 		edev->physfn = pdev;
+		edev->vf_index = i;
 #endif /* CONFIG_EEH */
 	}
 	return pci_get_pdn(pdev);
-- 
2.26.2

