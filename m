Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B43A943626
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 21:14:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XpHCC2iy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZ1xr1ckMz3cY5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 05:14:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XpHCC2iy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZ1wc0PtXz3dFH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 05:13:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F0006258A;
	Wed, 31 Jul 2024 19:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AEDC116B1;
	Wed, 31 Jul 2024 19:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722453229;
	bh=CMcboot57RSTYnL296q0XouRciqxcSoATVdJoTZjTN8=;
	h=From:To:Cc:Subject:Date:From;
	b=XpHCC2iyR+WteuZ4QMtDWmr3TJdHXq8UavBJ/jCjZ6tEOmWWY7cW1gz3YBjSpN1Iv
	 Te235UnH+18oWkWMNHafbdUB0ZRmzEU9TcfNnyyw42czjJZRsjt0MxAXtRaQN/t+ED
	 gV49wUx/PYkSk9ARhac+PO4UF189NMljaVEp4pihli8h0g7hJjIBpvbWAUFNEk/OVJ
	 ZNlJeTj4bV/9P2S7wO8GMpoxcz3uytHN/ILTbv9Boleh5wvVfIeqNbV5LAUOUbnmlx
	 eT3lpbRrNiS8pPhHNs53fTe5K0czC1e/geR7DhMwrxUna4kDVQmCQ89+Q/np9+AoJm
	 q9heEj4a07uhA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Subject: [PATCH] powerpc: Use of_property_present()
Date: Wed, 31 Jul 2024 13:12:47 -0600
Message-ID: <20240731191312.1710417-9-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use of_property_present() to test for property presence rather than
of_get_property(). This is part of a larger effort to remove callers
of of_get_property() and similar functions. of_get_property() leaks
the DT property data pointer which is a problem for dynamically
allocated nodes which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 2 +-
 arch/powerpc/platforms/powernv/opal-lpc.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index af3a5d37a149..3d072a7455bf 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -860,7 +860,7 @@ static int pnv_eeh_bridge_reset(struct pci_dev *pdev, int option)
 	int64_t rc;
 
 	/* Hot reset to the bus if firmware cannot handle */
-	if (!dn || !of_get_property(dn, "ibm,reset-by-firmware", NULL))
+	if (!dn || !of_property_present(dn, "ibm,reset-by-firmware"))
 		return __pnv_eeh_bridge_reset(pdev, option);
 
 	pr_debug("%s: FW reset PCI bus %04x:%02x with option %d\n",
diff --git a/arch/powerpc/platforms/powernv/opal-lpc.c b/arch/powerpc/platforms/powernv/opal-lpc.c
index a16f07cdab26..8a7f39e106bd 100644
--- a/arch/powerpc/platforms/powernv/opal-lpc.c
+++ b/arch/powerpc/platforms/powernv/opal-lpc.c
@@ -393,7 +393,7 @@ void __init opal_lpc_init(void)
 	for_each_compatible_node(np, NULL, "ibm,power8-lpc") {
 		if (!of_device_is_available(np))
 			continue;
-		if (!of_get_property(np, "primary", NULL))
+		if (!of_property_present(np, "primary"))
 			continue;
 		opal_lpc_chip_id = of_get_ibm_chip_id(np);
 		of_node_put(np);
-- 
2.43.0

