Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD38C25A2AD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 03:38:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh66Q1J9bzDqc7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 11:38:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UdEnIajh; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh64h4FK7zDqND
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 11:37:23 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id g29so1705777pgl.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 18:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JPefpPAcUzK0if/D0AsPQ1Untz0NkPlA7NBHG2C8W1A=;
 b=UdEnIajh5eOcF+KCJED0/OxxZubSw6+Xx/eFAXciKFxqWk+TDsLoLuM/OC/zl/IXPv
 g0AxZPtE/FIeKX2FO1QPpgogqdPRlzmzDNKd7NJgCPEmvu7bGj/xubobgjN0ydBZIfKB
 Gy71iHH0oU8iRV8jgJTnDAle2jSxJ3LW4ExlTNGe/Af6Ly4RY6XU7Wzj9UtsGEd+D71p
 zcaAmpjWELi91/HTiSjomabXlNSVZewy5PlMyUs0Lyt/Z8ECnZRI45YJba5aldKqeAlT
 GNGLlZlI8wLVoDwMTyNMsRbCgSu7urixq+LG5soG/z2WlpldnkWGa7E6fqnQznFLy3vl
 OWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JPefpPAcUzK0if/D0AsPQ1Untz0NkPlA7NBHG2C8W1A=;
 b=C3oxY0LvWYn5NukD3zwIzFXOIAieDP+4cF0aOFvZ3RSrnE4ldIjK0ToiWXAaX2ASBN
 p6D8YPqNmPvIrnx0crvUEBLpvMh18QhGldcvX+w4QIlqETjMcntHdE33Qu8ow3ou2t7V
 XbVx71WuepKBwbqUJdylyVr41rAk96SSe0vqz+5Ri4qkMJ75QrycyTRMPI4hgdqXHYaU
 sWlTdKFH6Lossh1J5xOQS7CY9GiHpAhSST76CUnsRqPJluIx4f1O0o2Dqv7k7W55xkb8
 OIq5txcjiac6NI80SaTs4KSHmQQ8TzZU+t0tpJ+MSHLAVDvOrl8JqMWe+gRaug4juTtW
 lKQg==
X-Gm-Message-State: AOAM531GoOMhh/bDpQp6dd4oHdiAoK8lNg/5Fclyh+YATucBLUlakGYp
 3UGzQfE2yr4Dbff8xsVYJDTjXi4KoasXGQ==
X-Google-Smtp-Source: ABdhPJwklRXm8dc7nOk4kEy7R5sTZU8gOeStsultU3nV8TzslA9xUseWxKa5AaKRozDJmFh8jVYHxg==
X-Received: by 2002:a63:e907:: with SMTP id i7mr28492pgh.210.1599010639744;
 Tue, 01 Sep 2020 18:37:19 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id 13sm3405008pfp.3.2020.09.01.18.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 18:37:19 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/powernv/pci: Drop pnv_phb->initialized
Date: Wed,  2 Sep 2020 11:36:57 +1000
Message-Id: <20200902013657.1753830-1-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
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

The pnv_phb->initialized flag is an odd beast. It was added back in 2012 in
commit db1266c85261 ("powerpc/powernv: Skip check on PE if necessary") to
allow devices to be enabled even if the device had not yet been assigned to
a PE. Allowing the device to be enabled before the PE is configured may
cause spurious EEH events since none of the IOMMU context has been setup.

I'm not entirely sure why this was ever necessary. My best guess is that it
was an workaround for a bug or some other undesireable behaviour from the
PCI core. Either way, it's unnecessary now since as of commit dc3d8f85bb57
("powerpc/powernv/pci: Re-work bus PE configuration") we can guarantee that
the PE will be configured before the PCI core will allow drivers to bind to
the device.

It's also worth pointing out that the ->initialized flag is only set in
pnv_pci_ioda_create_dbgfs(). That function has its entire body wrapped
in #ifdef CONFIG_DEBUG_FS. As a result, for kernels built without debugfs
(i.e. petitboot) the other checks in pnv_pci_enable_device_hook() are
bypassed entirely.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: reword commit message a bit
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 17 -----------------
 arch/powerpc/platforms/powernv/pci.h      |  1 -
 2 files changed, 18 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 023a4f987bb2..6ac3c637b313 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2410,9 +2410,6 @@ static void pnv_pci_ioda_create_dbgfs(void)
 	list_for_each_entry_safe(hose, tmp, &hose_list, list_node) {
 		phb = hose->private_data;
 
-		/* Notify initialization of PHB done */
-		phb->initialized = 1;
-
 		sprintf(name, "PCI%04x", hose->global_number);
 		phb->dbgfs = debugfs_create_dir(name, powerpc_debugfs_root);
 
@@ -2609,17 +2606,8 @@ static resource_size_t pnv_pci_default_alignment(void)
  */
 static bool pnv_pci_enable_device_hook(struct pci_dev *dev)
 {
-	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
 	struct pci_dn *pdn;
 
-	/* The function is probably called while the PEs have
-	 * not be created yet. For example, resource reassignment
-	 * during PCI probe period. We just skip the check if
-	 * PEs isn't ready.
-	 */
-	if (!phb->initialized)
-		return true;
-
 	pdn = pci_get_pdn(dev);
 	if (!pdn || pdn->pe_number == IODA_INVALID_PE)
 		return false;
@@ -2629,14 +2617,9 @@ static bool pnv_pci_enable_device_hook(struct pci_dev *dev)
 
 static bool pnv_ocapi_enable_device_hook(struct pci_dev *dev)
 {
-	struct pci_controller *hose = pci_bus_to_host(dev->bus);
-	struct pnv_phb *phb = hose->private_data;
 	struct pci_dn *pdn;
 	struct pnv_ioda_pe *pe;
 
-	if (!phb->initialized)
-		return true;
-
 	pdn = pci_get_pdn(dev);
 	if (!pdn)
 		return false;
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 739a0b3b72e1..36d22920f5a3 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -119,7 +119,6 @@ struct pnv_phb {
 	int			flags;
 	void __iomem		*regs;
 	u64			regs_phys;
-	int			initialized;
 	spinlock_t		lock;
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.26.2

