Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 238574060C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 02:19:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5Gh50wnHz3c83
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 10:19:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oFfPqXH9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oFfPqXH9; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5Gdd5Vf2z2yfk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Sep 2021 10:16:53 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3217961207;
 Fri, 10 Sep 2021 00:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233012;
 bh=5QHMzjuKFZj8EELoxq77L9sxWasggjwmQgGgG+hbvEg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oFfPqXH96IeJlDskuSn3iIA7g0CQoMgaqUizcCCZZGDOnW5REBqxCBvJC8PjGub6K
 7KA2MPAq4izMlhw4BL0Fy61hIcIqb7bStSZNZGenTQdyWHCAJxoXCjC+uBTzhjciOs
 B9tZmYD+HRV/haiotUr/+PHQojFYM2CV6CaotcKSGo82FM/S2PAMXcG5GKHdhWM+xS
 Bbm/LpJawPr/iivNBW03+tWSsm2OUNb3EPanSiKmdEJZPyv7JFezGaNrR7JgtWHqrX
 mHHBfgMA55eQmPxgkuZHjz62ubQsSM/LBJCD5qBMThcESw+DM1zgRIrLA3OMDZrNni
 qetwFMUuu9SuA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 38/99] KVM: PPC: Book3S HV: XICS: Fix mapping of
 passthrough interrupts
Date: Thu,  9 Sep 2021 20:14:57 -0400
Message-Id: <20210910001558.173296-38-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001558.173296-1-sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Cédric Le Goater <clg@kaod.org>

[ Upstream commit 1753081f2d445f9157550692fcc4221cd3ff0958 ]

PCI MSIs now live in an MSI domain but the underlying calls, which
will EOI the interrupt in real mode, need an HW IRQ number mapped in
the XICS IRQ domain. Grab it there.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20210701132750.1475580-31-clg@kaod.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s_hv.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 085fb8ecbf68..1ca0a4f760bc 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5328,6 +5328,7 @@ static int kvmppc_set_passthru_irq(struct kvm *kvm, int host_irq, int guest_gsi)
 	struct kvmppc_passthru_irqmap *pimap;
 	struct irq_chip *chip;
 	int i, rc = 0;
+	struct irq_data *host_data;
 
 	if (!kvm_irq_bypass)
 		return 1;
@@ -5392,7 +5393,14 @@ static int kvmppc_set_passthru_irq(struct kvm *kvm, int host_irq, int guest_gsi)
 	 * the KVM real mode handler.
 	 */
 	smp_wmb();
-	irq_map->r_hwirq = desc->irq_data.hwirq;
+
+	/*
+	 * The 'host_irq' number is mapped in the PCI-MSI domain but
+	 * the underlying calls, which will EOI the interrupt in real
+	 * mode, need an HW IRQ number mapped in the XICS IRQ domain.
+	 */
+	host_data = irq_domain_get_irq_data(irq_get_default_host(), host_irq);
+	irq_map->r_hwirq = (unsigned int)irqd_to_hwirq(host_data);
 
 	if (i == pimap->n_mapped)
 		pimap->n_mapped++;
@@ -5400,7 +5408,7 @@ static int kvmppc_set_passthru_irq(struct kvm *kvm, int host_irq, int guest_gsi)
 	if (xics_on_xive())
 		rc = kvmppc_xive_set_mapped(kvm, guest_gsi, desc);
 	else
-		kvmppc_xics_set_mapped(kvm, guest_gsi, desc->irq_data.hwirq);
+		kvmppc_xics_set_mapped(kvm, guest_gsi, irq_map->r_hwirq);
 	if (rc)
 		irq_map->r_hwirq = 0;
 
-- 
2.30.2

