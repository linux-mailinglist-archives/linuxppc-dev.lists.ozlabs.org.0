Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D16AD228F62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:49:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBNK84NwwzDqSh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:49:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B7JHnonG; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBMqw1JDjzDqbh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:27:07 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id n5so524112pgf.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ebRz8LrjQdaZpNqzaifodDOnMMWHxG0sMIpeDTH6wUM=;
 b=B7JHnonG0vMuJV3mIHVsr4SXUuzXFnIBWJXjeh/qO38vTGoGuHW6qbjkIu/joKpWEo
 mfopSfO96sFcEuPks6dnDuzzWqwXm1jzeirOFC6PbGnoQtqmeYOyP5ZvdBcKSwQS4yOq
 NAsw9ALhFzwTfno2+kmeR2SnQ3OGdA1uYxIQGofqowxErPCKgqd8Z9LPfoi0uw8Z+aNv
 JWJsdSIM4EiZdDjIq/ZHy0R0c8xUkRWlaFl2fWzTfH5ivjUPKW43E0TdVXsdnd56sL8e
 7U7tArrv/lqspHX8cgB9sJHgkuk3JpR525h1yUhf9jzo/FpcqT4usko4fO40SFRlNGZX
 IAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ebRz8LrjQdaZpNqzaifodDOnMMWHxG0sMIpeDTH6wUM=;
 b=m7vp9JmAG1NbVxUTkUBo/faUCd6MumMUnqBcCU3JqqGn9mdJwj5lvYU0aY3+eyW/VV
 XIXkg/9jXhgLhIMWsfnZTqxW/uanwx7T1dLHK1ught2yGUotiI84hZFu2SAGhHa0QRIv
 ZjTjjgSIk/h7HgQABkHUV4KnFWKokgCiMESPbmtIsnRr7OlnMt9HJ7Noexj6rh0Cvip+
 a+5CDl++URp98EgFx0C03jAEmvnHLptAwC5J7CxbGxRT+Mb8CIYzhnjLxn+oB9y9mwrh
 HeTnnO1pUtH+PsEZYhsiWIBR3D28CHS84y8aVI+x1hvjsG5N2gf50HwZexCFmu6aqab8
 oH3g==
X-Gm-Message-State: AOAM530c9RlNoQMFJSf59JAcMXsnvleqyDEb6vA+fc9T3aY0FLy2kGBC
 vOxT/BUShXJfvqlSoO6ZmWhe8stwZNU=
X-Google-Smtp-Source: ABdhPJynks7qGoSf3eKexMUqK3c8eJLAPOtORD/h/HjUb1ISwN/wYf6r5s6rkQrXnyVQ4vaWI2f9gA==
X-Received: by 2002:a63:e14c:: with SMTP id h12mr25441482pgk.110.1595392024208; 
 Tue, 21 Jul 2020 21:27:04 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id d4sm20583709pgf.9.2020.07.21.21.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 21:27:03 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 11/14] powerpc/eeh: Remove class code field from edev
Date: Wed, 22 Jul 2020 14:26:25 +1000
Message-Id: <20200722042628.1425880-11-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The edev->class_code field is never referenced anywhere except for the
platform specific probe functions. The same information is available in
the pci_dev for PowerNV and in the pci_dn on pseries so we can remove
the field.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: no changes
---
 arch/powerpc/include/asm/eeh.h               | 1 -
 arch/powerpc/platforms/powernv/eeh-powernv.c | 5 ++---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index d16d5b59dd22..0d99aad8d9b7 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -133,7 +133,6 @@ static inline bool eeh_pe_passed(struct eeh_pe *pe)
 
 struct eeh_dev {
 	int mode;			/* EEH mode			*/
-	int class_code;			/* Class code of the device	*/
 	int bdfn;			/* bdfn of device (for cfg ops) */
 	struct pci_controller *controller;
 	int pe_config_addr;		/* PE config address		*/
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index c9f2f454d053..7cbb03a97a61 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -372,19 +372,18 @@ static struct eeh_dev *pnv_eeh_probe(struct pci_dev *pdev)
 	}
 
 	/* Skip for PCI-ISA bridge */
-	if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_ISA)
+	if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_ISA)
 		return NULL;
 
 	eeh_edev_dbg(edev, "Probing device\n");
 
 	/* Initialize eeh device */
-	edev->class_code = pdn->class_code;
 	edev->mode	&= 0xFFFFFF00;
 	edev->pcix_cap = pnv_eeh_find_cap(pdn, PCI_CAP_ID_PCIX);
 	edev->pcie_cap = pnv_eeh_find_cap(pdn, PCI_CAP_ID_EXP);
 	edev->af_cap   = pnv_eeh_find_cap(pdn, PCI_CAP_ID_AF);
 	edev->aer_cap  = pnv_eeh_find_ecap(pdn, PCI_EXT_CAP_ID_ERR);
-	if ((edev->class_code >> 8) == PCI_CLASS_BRIDGE_PCI) {
+	if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_PCI) {
 		edev->mode |= EEH_DEV_BRIDGE;
 		if (edev->pcie_cap) {
 			pnv_pci_cfg_read(pdn, edev->pcie_cap + PCI_EXP_FLAGS,
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index b981332db873..67931fe5f341 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -273,12 +273,11 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 	 * correctly reflects that current device is root port
 	 * or PCIe switch downstream port.
 	 */
-	edev->class_code = pdn->class_code;
 	edev->pcix_cap = pseries_eeh_find_cap(pdn, PCI_CAP_ID_PCIX);
 	edev->pcie_cap = pseries_eeh_find_cap(pdn, PCI_CAP_ID_EXP);
 	edev->aer_cap = pseries_eeh_find_ecap(pdn, PCI_EXT_CAP_ID_ERR);
 	edev->mode &= 0xFFFFFF00;
-	if ((edev->class_code >> 8) == PCI_CLASS_BRIDGE_PCI) {
+	if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_PCI) {
 		edev->mode |= EEH_DEV_BRIDGE;
 		if (edev->pcie_cap) {
 			rtas_read_config(pdn, edev->pcie_cap + PCI_EXP_FLAGS,
-- 
2.26.2

