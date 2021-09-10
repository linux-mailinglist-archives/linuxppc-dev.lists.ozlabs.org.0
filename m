Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B3F4060FA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 02:25:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5Gq1041yz3dkq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 10:25:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JjK8XoY6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JjK8XoY6; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5GhF33PTz308v
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Sep 2021 10:19:09 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A92D4611C2;
 Fri, 10 Sep 2021 00:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233147;
 bh=EzVc4+9z8jJm3006a4PiHOFkM6wMDw2uoZJqKWC7Rz8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JjK8XoY61T71LIr3dIYYdc01p6UJMuamzPA6uha8dgRoRgcp3vanJrY3HKnegvV/C
 ngLva2mWvFNYmfuuL8PIcgCVgIywlocDI0a8Lt1ihT+UU/9wyeY57e4iMNuPnuwP3d
 oqToHElSyqnHkmajCHnDDybvP1QuI+aDRRM26urT8yClQEuloNwnrAaOOxxdC+ZAGs
 EZFr4WkFB+OYYk7xhX4CLKJbNyJq7eK3TQ/uxhPNB314Yhz9FLdcvVbToSx+R0abn2
 EEYcqGKGDuCKOXA/WZuyDsBzZpmYt1agm4qruW1BusJRbU8RyI+lrYTD8ZQ8hrK03Z
 F/JAQ0y6JkKQA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 32/88] KVM: PPC: Book3S HV: XICS: Fix mapping of
 passthrough interrupts
Date: Thu,  9 Sep 2021 20:17:24 -0400
Message-Id: <20210910001820.174272-32-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001820.174272-1-sashal@kernel.org>
References: <20210910001820.174272-1-sashal@kernel.org>
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
index 395f98158e81..a284999a3171 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5170,6 +5170,7 @@ static int kvmppc_set_passthru_irq(struct kvm *kvm, int host_irq, int guest_gsi)
 	struct kvmppc_passthru_irqmap *pimap;
 	struct irq_chip *chip;
 	int i, rc = 0;
+	struct irq_data *host_data;
 
 	if (!kvm_irq_bypass)
 		return 1;
@@ -5234,7 +5235,14 @@ static int kvmppc_set_passthru_irq(struct kvm *kvm, int host_irq, int guest_gsi)
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
@@ -5242,7 +5250,7 @@ static int kvmppc_set_passthru_irq(struct kvm *kvm, int host_irq, int guest_gsi)
 	if (xics_on_xive())
 		rc = kvmppc_xive_set_mapped(kvm, guest_gsi, desc);
 	else
-		kvmppc_xics_set_mapped(kvm, guest_gsi, desc->irq_data.hwirq);
+		kvmppc_xics_set_mapped(kvm, guest_gsi, irq_map->r_hwirq);
 	if (rc)
 		irq_map->r_hwirq = 0;
 
-- 
2.30.2

