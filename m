Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 617FD3189A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 12:39:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbvmV5Zp3zDwpV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 22:39:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbvWH2sYLzDwkk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 22:27:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=J16G02Ml; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbvWF0hYnz9sRf; Thu, 11 Feb 2021 22:27:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1613042873;
 bh=81Cjr2r0taGDZmAMMNX6LcWV8d9iipuNOztidsQaUuI=;
 h=From:To:Subject:Date:From;
 b=J16G02MlgZlrJuVPk7GCm6sGajq7oFJKvUPZbJGRUb3Yc4Y4M59ZAfEvOMxWaD7sZ
 KJuN+KuT8iW5yC6h1hiYP/AhQGd3bq8xGkIx4nSgXfykexEsL0HDVQ8E/PkUiPFwj4
 P3waVNASW5yEVs+SzsTxFKq92gVHPCqSXN438VDH+hdWUvdE2kjlMXx2lEBIwE0NFD
 mhjWRaDevbd71Mt3lg084TrQTXLYWpWl4S0weMbuYjxWV77j8+RGEEOBW1rEdpG7io
 7zVGo9SPekbTIN7B2Lt+bxa5+ExG1/rpLeKzP5j9QvWfIbGpc+SnAMIwn2SZ0u8OiP
 2bbRodtW5kGkQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv/pci: Use kzalloc() for phb related allocations
Date: Thu, 11 Feb 2021 22:27:49 +1100
Message-Id: <20210211112749.3410771-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As part of commit fbbefb320214 ("powerpc/pci: Move PHB discovery for
PCI_DN using platforms"), I switched some allocations from
memblock_alloc() to kmalloc(), otherwise memblock would warn that it
was being called after slab init.

However I missed that the code relied on the allocations being zeroed,
without which we could end up crashing:

  pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
  BUG: Unable to handle kernel data access on read at 0x6b6b6b6b6b6b6af7
  Faulting instruction address: 0xc0000000000dbc90
  Oops: Kernel access of bad area, sig: 11 [#1]
  LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
  ...
  NIP  pnv_ioda_get_pe_state+0xe0/0x1d0
  LR   pnv_ioda_get_pe_state+0xb4/0x1d0
  Call Trace:
    pnv_ioda_get_pe_state+0xb4/0x1d0 (unreliable)
    pnv_pci_config_check_eeh.isra.9+0x78/0x270
    pnv_pci_read_config+0xf8/0x160
    pci_bus_read_config_dword+0xa4/0x120
    pci_bus_generic_read_dev_vendor_id+0x54/0x270
    pci_scan_single_device+0xb8/0x140
    pci_scan_slot+0x80/0x1b0
    pci_scan_child_bus_extend+0x94/0x490
    pcibios_scan_phb+0x1f8/0x3c0
    pcibios_init+0x8c/0x12c
    do_one_initcall+0x94/0x510
    kernel_init_freeable+0x35c/0x3fc
    kernel_init+0x2c/0x168
    ret_from_kernel_thread+0x5c/0x70

Switch them to kzalloc().

Fixes: fbbefb320214 ("powerpc/pci: Move PHB discovery for PCI_DN using platforms")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 7ee14ac275bd..f0f901683a2f 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2921,7 +2921,7 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	phb_id = be64_to_cpup(prop64);
 	pr_debug("  PHB-ID  : 0x%016llx\n", phb_id);
 
-	phb = kmalloc(sizeof(*phb), GFP_KERNEL);
+	phb = kzalloc(sizeof(*phb), GFP_KERNEL);
 	if (!phb)
 		panic("%s: Failed to allocate %zu bytes\n", __func__,
 		      sizeof(*phb));
@@ -2970,7 +2970,7 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	else
 		phb->diag_data_size = PNV_PCI_DIAG_BUF_SIZE;
 
-	phb->diag_data = kmalloc(phb->diag_data_size, GFP_KERNEL);
+	phb->diag_data = kzalloc(phb->diag_data_size, GFP_KERNEL);
 	if (!phb->diag_data)
 		panic("%s: Failed to allocate %u bytes\n", __func__,
 		      phb->diag_data_size);
@@ -3032,7 +3032,7 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	}
 	pemap_off = size;
 	size += phb->ioda.total_pe_num * sizeof(struct pnv_ioda_pe);
-	aux = kmalloc(size, GFP_KERNEL);
+	aux = kzalloc(size, GFP_KERNEL);
 	if (!aux)
 		panic("%s: Failed to allocate %lu bytes\n", __func__, size);
 
-- 
2.25.1

