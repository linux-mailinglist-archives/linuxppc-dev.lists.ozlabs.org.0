Return-Path: <linuxppc-dev+bounces-2940-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAF29BF876
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 22:26:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkJDv5SKPz2y8V;
	Thu,  7 Nov 2024 08:26:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730928415;
	cv=none; b=F6OcIP6GQTr9ug4pQUu9tYMcL/EeU6dtLgf4ruhNw4DlL56QNOPz0l3LMa5+ehPjGgLnCtUoN8CbP3era1Xu48SRBN59yk6x7Ur9W2B6iEbHY9H9w0XAJBn5raAUI6sa3frILLOPMfMWaJy3brPsROhUTHmaXgW+V22dt85iEuohvca1WcmyBsU2xb4hISw0D+GmgII+n2mGQ6ZavRzF+vrhkIraAykNU8GsaZx/ihICZ9lznbY9Ad2Ka41KFQvS9dRPo6am9N2C8wMeBx6DKOfU4tkrEAjn81FOHpLeIBTifE015wRyY9WvK6dErqCTgcvBBWSo+tt4ksczCFWB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730928415; c=relaxed/relaxed;
	bh=F+dagBU0nmezbLilw4BEggYRYfOkcVWVFzb8sbAaHjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nLtGvgRX5rYOYBVtTMKNLPGkydEZWxsvLaJ7Q3+LDt4a6KqTaVrj0qocWT6lJI+soGGPXWeEWDc/TIJ9TYUVM2S3mKJwC9nvKlGGWZdRws3NABLB1BR8u1Qgcuo/wbQjdKV+Xk3ScCSEwR0qWyhxqyWTynsgquhieCwpxGBcA8cvZf9RIRC1MnS1ZGuwqc5w3awZ+uGbbq+xxlLCqT0VSnRp4eyMRkMhc3lWDq+qmo/W/pCo8AF8wWUJ9UVbRiT9FpJlRHB9egBRzu8eOuKEZV+sezNwA3cakQ9ckQIj+Cm7ltwlet/qKvDXBK4PXO1otNvKuSb8Ld5wkJJNLiMqRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T7v38/3y; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T7v38/3y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkJDt0lMtz2y8F
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 08:26:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D3EADA444C2;
	Wed,  6 Nov 2024 21:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FE7C4CEC6;
	Wed,  6 Nov 2024 21:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730928403;
	bh=LHBtxJhLBykWSxx00mtqWlXXjjjtzn2Hz6+h64j7m6A=;
	h=From:To:Cc:Subject:Date:From;
	b=T7v38/3yK0uSWHnVsgInKyiUPs+SoGDfDPS9DuPtSPQ3dGIA8wEZtXFqy8s6jRAL1
	 Ak7OmesWGEaHpDhd8mXGc0RjoTFXacEY5YbTl3raPkiit9zeH07hIdh2NMuoiRGOF6
	 aikkXNa/qOM5zRMj1a1TnU+/gdpO+OPCDE4Ft/buVRDMTXQ9Ga1xx8RqSmhxADC29n
	 DuvGFUz2L0vYfYTAezQnErDB3Tl8Pl9CLkEQDkAxkdcpyF+zwGoShooHBpoCgeKy94
	 AhuXpGKLgCkR2noXIOCI1jiIr2DaeMmTGXzAcLypbbV7aE0O87GO2Z8sWVF2MkfkSa
	 Qi6xIiNF6Oyng==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: 44x: Use for_each_of_range() iterator
Date: Wed,  6 Nov 2024 15:26:39 -0600
Message-ID: <20241106212640.341677-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Simplify the ppc44x PCI dma-ranges parsing to use the for_each_of_range()
iterator.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/powerpc/platforms/44x/pci.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/44x/pci.c b/arch/powerpc/platforms/44x/pci.c
index db6d33ca753f..364aeb86ab64 100644
--- a/arch/powerpc/platforms/44x/pci.c
+++ b/arch/powerpc/platforms/44x/pci.c
@@ -94,10 +94,8 @@ static int __init ppc4xx_parse_dma_ranges(struct pci_controller *hose,
 					  struct resource *res)
 {
 	u64 size;
-	const u32 *ranges;
-	int rlen;
-	int pna = of_n_addr_cells(hose->dn);
-	int np = pna + 5;
+	struct of_range_parser parser;
+	struct of_range range;
 
 	/* Default */
 	res->start = 0;
@@ -105,18 +103,15 @@ static int __init ppc4xx_parse_dma_ranges(struct pci_controller *hose,
 	res->end = size - 1;
 	res->flags = IORESOURCE_MEM | IORESOURCE_PREFETCH;
 
-	/* Get dma-ranges property */
-	ranges = of_get_property(hose->dn, "dma-ranges", &rlen);
-	if (ranges == NULL)
+	if (of_pci_dma_range_parser_init(&parser, hose->dn))
 		goto out;
 
-	/* Walk it */
-	while ((rlen -= np * 4) >= 0) {
-		u32 pci_space = ranges[0];
-		u64 pci_addr = of_read_number(ranges + 1, 2);
-		u64 cpu_addr = of_translate_dma_address(hose->dn, ranges + 3);
-		size = of_read_number(ranges + pna + 3, 2);
-		ranges += np;
+	for_each_of_range(&parser, &range) {
+		u32 pci_space = range.flags;
+		u64 pci_addr = range.bus_addr;
+		u64 cpu_addr = range.cpu_addr;
+		size = range.size;
+
 		if (cpu_addr == OF_BAD_ADDR || size == 0)
 			continue;
 
-- 
2.45.2


