Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAE94B0A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 06:17:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TBWL6MhMzDq9R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 14:17:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 45TBQ73Xs2zDqRB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 14:13:19 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 0AFE8AE8001E;
 Wed, 19 Jun 2019 00:13:14 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/powernv/npu: Export symbols as GPL
Date: Wed, 19 Jun 2019 14:13:12 +1000
Message-Id: <20190619041312.81217-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>,
 Piotr Jaroszynski <pjaroszynski@nvidia.com>, Reza Arbab <arbab@linux.ibm.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The out-of-tree NVIDIA driver has been re-licensed recently to MIT/GPL
so we can do the right thing and restrict the exported symbols to GPL
only.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/platforms/powernv/npu-dma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index dc23d9d2a7d9..459d9e728003 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -58,7 +58,7 @@ struct pci_dev *pnv_pci_get_gpu_dev(struct pci_dev *npdev)
 
 	return gpdev;
 }
-EXPORT_SYMBOL(pnv_pci_get_gpu_dev);
+EXPORT_SYMBOL_GPL(pnv_pci_get_gpu_dev);
 
 /* Given the real PCI device get a linked NPU device. */
 struct pci_dev *pnv_pci_get_npu_dev(struct pci_dev *gpdev, int index)
@@ -1052,7 +1052,7 @@ struct npu_context *pnv_npu2_init_context(struct pci_dev *gpdev,
 
 	return npu_context;
 }
-EXPORT_SYMBOL(pnv_npu2_init_context);
+EXPORT_SYMBOL_GPL(pnv_npu2_init_context);
 
 static void pnv_npu2_release_context(struct kref *kref)
 {
@@ -1107,7 +1107,7 @@ void pnv_npu2_destroy_context(struct npu_context *npu_context,
 	}
 
 }
-EXPORT_SYMBOL(pnv_npu2_destroy_context);
+EXPORT_SYMBOL_GPL(pnv_npu2_destroy_context);
 
 /*
  * Assumes mmap_sem is held for the contexts associated mm.
@@ -1149,7 +1149,7 @@ int pnv_npu2_handle_fault(struct npu_context *context, uintptr_t *ea,
 
 	return result;
 }
-EXPORT_SYMBOL(pnv_npu2_handle_fault);
+EXPORT_SYMBOL_GPL(pnv_npu2_handle_fault);
 
 int pnv_npu2_init(struct pci_controller *hose)
 {
-- 
2.17.1

