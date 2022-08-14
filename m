Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A84D459242D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 18:29:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5ND04Lv1z3f6T
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 02:29:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jUn4nEEN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jUn4nEEN;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5N7L221gz3f62
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 02:25:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 97F4E60F49;
	Sun, 14 Aug 2022 16:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAC0C433D6;
	Sun, 14 Aug 2022 16:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494332;
	bh=cKwuaklraC8oBJFY7SqgVzYD/+87TZcMwmlJxnlR3T0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jUn4nEENrWpONykhfAMBhv20s3RUVyRkZ/OHMYPFHGWkBOM//pSTKoxBcMeVv2XnX
	 7vZg98SCgyQLjP3WrhlYK+kmdl59zPJ3HU3lxM6ORnrQpR2tBnJV+EVyzBcWrMIo1P
	 b4MxOMtOzFADb5iK16fj73dAYHtjPGWFyTVojkoyxUNF8VNw2IYMwwLJVqtIG5FBTy
	 OHGeBPk3p1owiWiNvyei0ZyzwgYFlrtYDAv+mLHgpeRxx4KnOiurgVGpGOs+nIhotN
	 ubA22gu/kaG2pFToDApt3TYXN96P3EDlAdnR0maUcduv8ccMXpC0uLsLT9aAtQIdNL
	 oL5ezqSqSeHgw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 28/39] powerpc/ioda/iommu/debugfs: Generate unique debugfs entries
Date: Sun, 14 Aug 2022 12:23:17 -0400
Message-Id: <20220814162332.2396012-28-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162332.2396012-1-sashal@kernel.org>
References: <20220814162332.2396012-1-sashal@kernel.org>
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
index b722ac902269..0f193772c6fa 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1618,6 +1618,7 @@ static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
 	tbl->it_ops = &pnv_ioda1_iommu_ops;
 	pe->table_group.tce32_start = tbl->it_offset << tbl->it_page_shift;
 	pe->table_group.tce32_size = tbl->it_size << tbl->it_page_shift;
+	tbl->it_index = (phb->hose->global_number << 16) | pe->pe_number;
 	if (!iommu_init_table(tbl, phb->hose->node, 0, 0))
 		panic("Failed to initialize iommu table");
 
@@ -1788,6 +1789,7 @@ static long pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe)
 		res_end = min(window_size, SZ_4G) >> tbl->it_page_shift;
 	}
 
+	tbl->it_index = (pe->phb->hose->global_number << 16) | pe->pe_number;
 	if (iommu_init_table(tbl, pe->phb->hose->node, res_start, res_end))
 		rc = pnv_pci_ioda2_set_window(&pe->table_group, 0, tbl);
 	else
-- 
2.35.1

