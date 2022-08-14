Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD55923C5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 18:25:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5N6f4zv1z3f2q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 02:24:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DsDeSRuq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DsDeSRuq;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5N411WwCz3c6P
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 02:22:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DAB32B80B7F;
	Sun, 14 Aug 2022 16:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E5FC433C1;
	Sun, 14 Aug 2022 16:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494157;
	bh=t0TSqAFuhyH1+CMJ7UbBnSE+KHqu5QO/EWY90mPSeHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DsDeSRuqTgrZ13QVuVlWlk3NfV4OoWpnNwI9A3DY3YOVkbMcXOizPGNmjtanrqypA
	 pEJGg1qCm+B2SnBL49g7VDNewhQnKMY6f8IwVXHyHTQLASp3xS7Vq6P2xngm+HFukp
	 hfLIxOIYQ8vbCCNk4rdqQQ10Zhgv+nxkJzSY0tYCjEUfouMdgk22tpf7E/z9MeS/oG
	 QPf6gt4ntBvc/lUySPurWWhJeuwnbLftXqP2fGp0PiwZiajsfU/I29lTOkjun9x/r4
	 LiBhwT1RgQeNR/Fw7UBEmx0aj9JGceLUbP5awwIIgB2I+OTQY4fb06diJNkA1hgSpa
	 qHGOWJLI4pjXw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 35/48] powerpc/ioda/iommu/debugfs: Generate unique debugfs entries
Date: Sun, 14 Aug 2022 12:19:28 -0400
Message-Id: <20220814161943.2394452-35-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814161943.2394452-1-sashal@kernel.org>
References: <20220814161943.2394452-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>, nick.child@ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, tglx@linutronix.de, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

[ Upstream commit d73b46c3c1449bf27f793b9d9ee86ed70c7a7163 ]

The iommu_table::it_index is a LIOBN which is not initialized on PowerNV
as it is not used except IOMMU debugfs where it is used for a node name.

This initializes it_index witn a unique number to avoid warnings and
have a node for every iommu_table.

This should not cause any behavioral change without CONFIG_IOMMU_DEBUGFS.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220714080800.3712998-1-aik@ozlabs.ru
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index c8cf2728031a..9de9b2fb163d 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1609,6 +1609,7 @@ static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
 	tbl->it_ops = &pnv_ioda1_iommu_ops;
 	pe->table_group.tce32_start = tbl->it_offset << tbl->it_page_shift;
 	pe->table_group.tce32_size = tbl->it_size << tbl->it_page_shift;
+	tbl->it_index = (phb->hose->global_number << 16) | pe->pe_number;
 	if (!iommu_init_table(tbl, phb->hose->node, 0, 0))
 		panic("Failed to initialize iommu table");
 
@@ -1779,6 +1780,7 @@ static long pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe)
 		res_end = min(window_size, SZ_4G) >> tbl->it_page_shift;
 	}
 
+	tbl->it_index = (pe->phb->hose->global_number << 16) | pe->pe_number;
 	if (iommu_init_table(tbl, pe->phb->hose->node, res_start, res_end))
 		rc = pnv_pci_ioda2_set_window(&pe->table_group, 0, tbl);
 	else
-- 
2.35.1

