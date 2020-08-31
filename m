Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE10425739E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 08:18:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bg0QH6PhlzDqSq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 16:18:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X+Qluia4; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bg0Nd3SZXzDqR7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 16:17:19 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id ds1so2592664pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 23:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3TgkdHA65USPmhlGYSIYMudY2FyQahas0dyMYCZ/3fs=;
 b=X+Qluia4tgtjeb5FOC1NmOlbhHP9SMTHYPs2vJpZqZV7ZQlKhTbl6UICneabAcbBxS
 D/h6wXvnZBPqP6kDvXPUzcKjYQwUkhxcCPlsqcaAYa5KCH/sxQRbD61GyFYk7hONwwV+
 tZBQpaMrwnAPCoQGnQ58MJEiDsCCnWLeTcEoWa4IvskQHzJJBR/oLEP/yAP78ZmT6d8t
 auju8cE05hofbgoYatO+kQMS4IEQS22LZnXM6B/+UWny3dwUdwqCReyP7Tfj5YUs2oOT
 +wtjRMXBF2mZl3ukQlvsweN2b91AvC1RqHtrB0sZM3++nnSZEYg/PKvA7a6z16MTlJNl
 ay/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3TgkdHA65USPmhlGYSIYMudY2FyQahas0dyMYCZ/3fs=;
 b=Ih5n3sHNqDbwf0TK+Vwn77uP1FdEVWmbvQzS8rZYSilUrI0mkvvHo5ZsXpapsXQnrw
 AAd0Cxge6ZdsNWO06EOnDiMGhIHLyOHv743EizzroaEu0c+O7JzvP1KAPnfSVqNX4lvO
 aPeV8HZyFXaR5l+VJghm9y8SjY73XVOjcgdXmZe4PbtKIPrP0QBkJSRH9xJoEvDgugFg
 +m7c2eD+xsFDci/koEvpZd9oqyP8Q2oIjmwIfoUIfg35BOfpN0dzPzwfa9rFD+K+b1Ka
 XfwOw8uNzrJykCqqdixgawJOB6cd/H0xKO6au03ssazgmOqOXHi/pRui1ySMF18J5+7A
 FNEw==
X-Gm-Message-State: AOAM531lefLntFdvzwqm7i09Fi622ZMLRvOlEjXUga9o5Yi1Wo4aA2G6
 LuBkLJtQDKPPQZLBHbyy+NKwSBd9fLKM0w==
X-Google-Smtp-Source: ABdhPJzM828BZ2D6FbHwnU4WuWgZJoM3/oFXjT8L0cIrMIqa6h319O8+lkQ9hO+benacHLlmp9KzdA==
X-Received: by 2002:a17:90a:ad8b:: with SMTP id s11mr35352pjq.40.1598854635883; 
 Sun, 30 Aug 2020 23:17:15 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id t20sm5804139pjg.21.2020.08.30.23.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 23:17:15 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv/pci: Drop pnv_phb->initialized
Date: Mon, 31 Aug 2020 16:15:00 +1000
Message-Id: <20200831061500.1646445-1-oohall@gmail.com>
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
allow devices to be enabled even if their PE assignments hadn't been
completed yet. I can't think of any situation where we would (or should)
have PCI devices being enabled before their PEs are assigned, so I can only
assume it was a workaround for a bug or some other undesirable behaviour
from the PCI core.

Since commit dc3d8f85bb57 ("powerpc/powernv/pci: Re-work bus PE
configuration") the PE setup occurs before the PCI core allows driver to
attach to the device so the problem should no longer exist. Even it does
allowing the device to be enabled before we have assigned the device to a
PE is almost certainly broken and will cause spurious EEH events so we
should probably just remove it.

It's also worth pointing out that ->initialized flag is set in
pnv_pci_ioda_create_dbgfs() which has the entire function body wrapped in
flag.  That has the fun side effect of bypassing any other checks in
pnv_pci_enable_device_hook() which is probably not what anybody wants.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
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

