Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFC8656EE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 21:36:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NhRJ30xnvz3cGC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 07:36:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QhxtH1MT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QhxtH1MT;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NhRFL2nBfz3bvZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Dec 2022 07:33:42 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ED4E2B81023;
	Tue, 27 Dec 2022 20:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80428C433EF;
	Tue, 27 Dec 2022 20:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672173218;
	bh=w1m0A+D7VYsEtmMcIKkAH13aq+/9M4sOnL3xuTJdQyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QhxtH1MTDv8L6B3qWRVnz27e1ZtJ+t+vlUj1+bPUZBB8aa63wRbqhr6tFCdK/oz1/
	 LmogeUOgcnUTGSM41MKg7H3wooUYndwtcDmFhDWJ6JSF2/HPJlw99H4k5KNv/dpuWR
	 nccxdbA2EtbeVWaOC89RUNaF45hUye8iRvQOG9ccdCe10vPGeD7bnZ9gFfLFWA3SlX
	 Na0brjmC/RNzJUmY4j+ZPhU02p2DGQKhbA5dgHdIOHkwTBi7li/gP+9OWSnLhQs0Ex
	 ivd+TFVckvMUgEops6jVActuWpZY+NXSVAz+lwpc95hovsEbE7zc87xJq1RuyrajLj
	 SuLonoE+yDyBw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 26/28] powerpc/msi: Fix deassociation of MSI descriptors
Date: Tue, 27 Dec 2022 15:32:47 -0500
Message-Id: <20221227203249.1213526-26-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227203249.1213526-1-sashal@kernel.org>
References: <20221227203249.1213526-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org, Julia.Lawall@inria.fr, joel@jms.id.au, windhl@126.com, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Marc Zyngier <maz@kernel.org>

[ Upstream commit 4545c6a3d6ba71747eaa984c338ddd745e56e23f ]

Since 2f2940d16823 ("genirq/msi: Remove filter from
msi_free_descs_free_range()"), the core MSI code relies on the
msi_desc->irq field to have been cleared before the descriptor
can be freed, as it indicates that there is no association with
a device anymore.

The irq domain code provides this guarantee, and so does s390,
which is one of the two architectures not using irq domains for
MSIs.

Powerpc, however, is missing this particular requirements,
leading in a splat and leaked MSI descriptors.

Adding the now required irq reset to the handful of powerpc backends
that implement MSIs fixes that particular problem.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/70dab88e-6119-0c12-7c6a-61bcbe239f66@roeck-us.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/4xx/hsta_msi.c  | 1 +
 arch/powerpc/platforms/cell/axon_msi.c | 1 +
 arch/powerpc/platforms/pasemi/msi.c    | 1 +
 arch/powerpc/sysdev/fsl_msi.c          | 1 +
 arch/powerpc/sysdev/mpic_u3msi.c       | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/powerpc/platforms/4xx/hsta_msi.c b/arch/powerpc/platforms/4xx/hsta_msi.c
index d4f7fff1fc87..e11b57a62b05 100644
--- a/arch/powerpc/platforms/4xx/hsta_msi.c
+++ b/arch/powerpc/platforms/4xx/hsta_msi.c
@@ -115,6 +115,7 @@ static void hsta_teardown_msi_irqs(struct pci_dev *dev)
 		msi_bitmap_free_hwirqs(&ppc4xx_hsta_msi.bmp, irq, 1);
 		pr_debug("%s: Teardown IRQ %u (index %u)\n", __func__,
 			 entry->irq, irq);
+		entry->irq = 0;
 	}
 }
 
diff --git a/arch/powerpc/platforms/cell/axon_msi.c b/arch/powerpc/platforms/cell/axon_msi.c
index 5b012abca773..0c11aad896c7 100644
--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -289,6 +289,7 @@ static void axon_msi_teardown_msi_irqs(struct pci_dev *dev)
 	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ASSOCIATED) {
 		irq_set_msi_desc(entry->irq, NULL);
 		irq_dispose_mapping(entry->irq);
+		entry->irq = 0;
 	}
 }
 
diff --git a/arch/powerpc/platforms/pasemi/msi.c b/arch/powerpc/platforms/pasemi/msi.c
index dc1846660005..166c97fff16d 100644
--- a/arch/powerpc/platforms/pasemi/msi.c
+++ b/arch/powerpc/platforms/pasemi/msi.c
@@ -66,6 +66,7 @@ static void pasemi_msi_teardown_msi_irqs(struct pci_dev *pdev)
 		hwirq = virq_to_hw(entry->irq);
 		irq_set_msi_desc(entry->irq, NULL);
 		irq_dispose_mapping(entry->irq);
+		entry->irq = 0;
 		msi_bitmap_free_hwirqs(&msi_mpic->msi_bitmap, hwirq, ALLOC_CHUNK);
 	}
 }
diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index 73c2d70706c0..57978a44d55b 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -132,6 +132,7 @@ static void fsl_teardown_msi_irqs(struct pci_dev *pdev)
 		msi_data = irq_get_chip_data(entry->irq);
 		irq_set_msi_desc(entry->irq, NULL);
 		irq_dispose_mapping(entry->irq);
+		entry->irq = 0;
 		msi_bitmap_free_hwirqs(&msi_data->bitmap, hwirq, 1);
 	}
 }
diff --git a/arch/powerpc/sysdev/mpic_u3msi.c b/arch/powerpc/sysdev/mpic_u3msi.c
index 1d8cfdfdf115..492cb03c0b62 100644
--- a/arch/powerpc/sysdev/mpic_u3msi.c
+++ b/arch/powerpc/sysdev/mpic_u3msi.c
@@ -108,6 +108,7 @@ static void u3msi_teardown_msi_irqs(struct pci_dev *pdev)
 		hwirq = virq_to_hw(entry->irq);
 		irq_set_msi_desc(entry->irq, NULL);
 		irq_dispose_mapping(entry->irq);
+		entry->irq = 0;
 		msi_bitmap_free_hwirqs(&msi_mpic->msi_bitmap, hwirq, 1);
 	}
 }
-- 
2.35.1

