Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FC219EF74
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 05:09:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wb9v3PLszDqyH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 13:09:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aamsoEdj; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wb83022nzDqvY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 13:08:02 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id s23so5335111plq.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 20:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E2qWsIMiygkD4gxWJ4WDuEUPozx3Qle5TChbeDfpN3M=;
 b=aamsoEdjLOOoqHNOV4CId51Cndrk4wm8xRf7qKZ3UiViLyE5PLY85NQqXC8CkGP9dT
 QRfzE099nXj0iUcGTpUuxyzQIhNRyQUrEq4Gy/nsU6nkriLptnO2NNiOs/3BGTgczmA1
 +LOXcBl03GAJS9WozdhuqVSxeYxY3vzUjQgfkIoU2smXvlX2yRmNzj8R9wp2yiQ61G7W
 5VGqe+hhI2Eo7cwMuTBYLO+kR3cFCb5wAhDEKYL9MSiRQ06liZwrWDV8FYVr8Rz4QKDb
 30dTbgFfX12C+ECB43vsLSW/RXa9qQT49H8DOJD4Xr4jrqxL6C9txfvajQJaiZZp64ES
 7OBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E2qWsIMiygkD4gxWJ4WDuEUPozx3Qle5TChbeDfpN3M=;
 b=KNlwvr6M8VQA5bwcOgRbgpYTpUHBxO7PbggcalIMc3JbmE2bgM/9/sWSbkiakNTDQj
 M/4CQraCNczRnBAIE43lJaM/KI0z0sA1v8MjLw64j1hGP0+AirrGNiOegD9mJj4dz0Ba
 7etwiSPLRLPhTSZ3Fklt7LWodar9IEh9DB6/dwhISte091sg9IzXN0wWuFY7x7D7cacX
 +npUtaKYjE2Kwq1VkIlOY++C5qEFdIw8YVxq7X8hCJZClExKzG4aCekuuaI4DwsaILDz
 NqEx/c8XWLx5u7S9+Xr9uvjeryshE+9ie4ElTMFQu923wx8xzdZjcCxZLOcUlgUZEtV6
 fGrQ==
X-Gm-Message-State: AGi0Pub+TB1DHTFlosRMEZ7LZ4ee94j3mr3Y2a6uCWL+VfDKwowrBArT
 83JVQOdj+HHRNPWzagDAqXbiK/3l
X-Google-Smtp-Source: APiQypKJt2pBrJxGjz0mCCbPe4cP5n0tN3HWf7+00JomkVpA/4NH2WMolnBGqsOJPoPs8HCfCYfwMg==
X-Received: by 2002:a17:90a:eb0f:: with SMTP id
 j15mr23646621pjz.139.1586142479338; 
 Sun, 05 Apr 2020 20:07:59 -0700 (PDT)
Received: from localhost.ibm.com ([220.240.58.168])
 by smtp.gmail.com with ESMTPSA id e187sm10196443pfe.143.2020.04.05.20.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 20:07:59 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/7] powerpc/powernv/npu: Clean up compound table group
 initialisation
Date: Mon,  6 Apr 2020 13:07:39 +1000
Message-Id: <20200406030745.24595-2-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406030745.24595-1-oohall@gmail.com>
References: <20200406030745.24595-1-oohall@gmail.com>
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
Cc: aik@ozlabs.ru, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Re-work the control flow a bit so what's going on is a little clearer.
This also ensures the table_group is only initialised once in the P9
case. This shouldn't be a functional change since all the GPU PCI
devices should have the same table_group configuration, but it does
look strange.

Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/npu-dma.c | 46 +++++++++++-------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index b95b9e3c4c98..de617549c9a3 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -427,7 +427,7 @@ static void pnv_comp_attach_table_group(struct npu_comp *npucomp,
 
 struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
 {
-	struct iommu_table_group *table_group;
+	struct iommu_table_group *compound_group;
 	struct npu_comp *npucomp;
 	struct pci_dev *gpdev = NULL;
 	struct pci_controller *hose;
@@ -446,36 +446,32 @@ struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
 	hose = pci_bus_to_host(npdev->bus);
 
 	if (hose->npu) {
-		table_group = &hose->npu->npucomp.table_group;
-
-		if (!table_group->group) {
-			table_group->ops = &pnv_npu_peers_ops;
-			iommu_register_group(table_group,
-					hose->global_number,
-					pe->pe_number);
-		}
+		/* P9 case: compound group is per-NPU (all gpus, all links) */
+		npucomp = &hose->npu->npucomp;
 	} else {
-		/* Create a group for 1 GPU and attached NPUs for POWER8 */
-		pe->npucomp = kzalloc(sizeof(*pe->npucomp), GFP_KERNEL);
-		table_group = &pe->npucomp->table_group;
-		table_group->ops = &pnv_npu_peers_ops;
-		iommu_register_group(table_group, hose->global_number,
-				pe->pe_number);
+		/* P8 case: Compound group is per-GPU (1 gpu, 2 links) */
+		npucomp = pe->npucomp = kzalloc(sizeof(*npucomp), GFP_KERNEL);
 	}
 
-	/* Steal capabilities from a GPU PE */
-	table_group->max_dynamic_windows_supported =
-		pe->table_group.max_dynamic_windows_supported;
-	table_group->tce32_start = pe->table_group.tce32_start;
-	table_group->tce32_size = pe->table_group.tce32_size;
-	table_group->max_levels = pe->table_group.max_levels;
-	if (!table_group->pgsizes)
-		table_group->pgsizes = pe->table_group.pgsizes;
+	compound_group = &npucomp->table_group;
+	if (!compound_group->group) {
+		compound_group->ops = &pnv_npu_peers_ops;
+		iommu_register_group(compound_group, hose->global_number,
+				pe->pe_number);
+
+		/* Steal capabilities from a GPU PE */
+		compound_group->max_dynamic_windows_supported =
+			pe->table_group.max_dynamic_windows_supported;
+		compound_group->tce32_start = pe->table_group.tce32_start;
+		compound_group->tce32_size = pe->table_group.tce32_size;
+		compound_group->max_levels = pe->table_group.max_levels;
+		if (!compound_group->pgsizes)
+			compound_group->pgsizes = pe->table_group.pgsizes;
+	}
 
-	npucomp = container_of(table_group, struct npu_comp, table_group);
 	pnv_comp_attach_table_group(npucomp, pe);
 
-	return table_group;
+	return compound_group;
 }
 
 struct iommu_table_group *pnv_npu_compound_attach(struct pnv_ioda_pe *pe)
-- 
2.21.1

