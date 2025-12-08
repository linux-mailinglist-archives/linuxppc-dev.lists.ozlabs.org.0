Return-Path: <linuxppc-dev+bounces-14687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28594CAD4C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 14:40:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQ3501HnZz2yVT;
	Tue, 09 Dec 2025 00:40:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765201204;
	cv=none; b=iAchVIcbHQgFjDfYCn82ydX5/iiTjAt2TTtRVpvCgGCMwJqUPsCCXnImj6+xol1+WFiD9t5uDJDmlMrUU3A6Ivj6xak4V2rpejtDY0LDx3JfwfbWgESdT/xMV6BxrDqyYe94dDwKYc/NO5MJoB1bYuoDkzFigqizlOqKHlKNxqfLkaajK57gZ51roZ195y3AwfYFP13owrihyqcqy2eULxqL1xEKeE842f/O+BX8EmA3JThYYlgCaK1jsKInqj2SSRBqWlQ5/DKIU5Wyo8BHPTIArHw9I9HNdP038k8xwJ2Fb2Ux/Hg/EkPriTKZsMMZHhKBvCTYaf5Slg69n4oczg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765201204; c=relaxed/relaxed;
	bh=LPRcMTt1XndV8muqKGUnybX/A1IYES6ugXD4w/hW3RM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBdmOdlXhAeH4fGXv7/TAp/wMOFk+6qG2CQfqBCCPgpAwcQE3+Q2uSdl0avea6IBFCElCUMK0PoeDKeG+w1YinqwRRU0bYdHJ3Xu+yiAWss4+3+7bpOFezJGzFfCgsb25o/kGO9KNbMglqjK35U60Uh6mr9gZoOaP3sjMYVM8DA3l1sxHN5TEp9NEATjeyiSmDM/7LJemCoIs62AL2ujEel7BMmTgtlDLKLdiFGCvWy6QqMQzTC5/Mv7d6DFfswanTTOrmsRH25eJo2X1TuLIkwOKev66WFdfcqyvdvIL9m2Dw+DoGcpSEEy6TXDR28Gx0zC3e+cMn+qT4Bw9W3bNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RhsRZPHE; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=i0EHEcbk; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RhsRZPHE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=i0EHEcbk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQ34x3vd2z2ySq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 00:40:01 +1100 (AEDT)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1765201195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LPRcMTt1XndV8muqKGUnybX/A1IYES6ugXD4w/hW3RM=;
	b=RhsRZPHEkZxPhZJ71U4XjSDsy4QbloQklyp2q+DXzPF2uPb2SC22ETdtOGyh3yhvpwINxr
	cGDU+e/z9JP1M1T7Zeif2FvI7SdEhEmuVuhhc2r4q94hcl3L1Q2f8S7vuK652KVaxHJcv4
	yO0811NIiONtO3i+W1ydVPp0cgC+EXQONxJokD+OEozW01Wa6xgUQ2sgkcW9LD+pI7t4vN
	qMQcwlTVz7ZWp3YGWpu5UINfoewJSoMfbNbggTVFSDNZIXPqo1D5ujN1kwUnJ1RnXrKbtx
	THhUpCnCqRC1dEPxcC9CwY71tOZDJsN18E7XwCpPkcaOM2KjES/XQn+C09QFKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1765201195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LPRcMTt1XndV8muqKGUnybX/A1IYES6ugXD4w/hW3RM=;
	b=i0EHEcbk0YHTVkv1xOu3t+RMxxcaJUOmGv6IYvBZ5L9tzUwH1E78I4AFiuJ+Px5AQgvBye
	bLpo5o91jG95ZbAA==
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	maz@kernel.org,
	gautam@linux.ibm.com,
	Gregory Joyce <gjoyce@ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Nilay Shroff <nilay@inux.ibm.com>,
	stable@vger.kernel.org
Subject: [PATCH] powerpc/pseries: Fix MSI-X allocation failure when quota is exceeded
Date: Mon,  8 Dec 2025 14:39:49 +0100
Message-ID: <20251208133949.3651991-1-namcao@linutronix.de>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Nilay reported that since commit daaa574aba6f ("powerpc/pseries/msi: Switch
to msi_create_parent_irq_domain()"), the NVMe driver cannot enable MSI-X
when the device's MSI-X table size is larger than the firmware's MSI quota
for the device.

This is because the commit changes how rtas_prepare_msi_irqs() is called:

  - Before, it is called when interrupts are allocated at the global
    interrupt domain with nvec_in being the number of allocated interrupts.
    rtas_prepare_msi_irqs() can return a positive number and the allocation
    will be retried.

  - Now, it is called at the creation of per-device interrupt domain with
    nvec_in being the number of interrupts that the device supports. If
    rtas_prepare_msi_irqs() returns positive, domain creation just fails.

For Nilay's NVMe driver case, rtas_prepare_msi_irqs() returns a positive
number (the quota). This causes per-device interrupt domain creation to
fail and thus the NVMe driver cannot enable MSI-X.

Rework to make this scenario works again:

  - pseries_msi_ops_prepare() only prepares as many interrupts as the quota
    permit.

  - pseries_irq_domain_alloc() fails if the device's quota is exceeded.

Now, if the quota is exceeded, pseries_msi_ops_prepare() will only prepare
as allowed by the quota. If device drivers attempt to allocate more
interrupts than the quota permits, pseries_irq_domain_alloc() will return
an error code and msi_handle_pci_fail() will allow device drivers a retry.

Reported-by: Nilay Shroff <nilay@inux.ibm.com>
Closes: https://lore.kernel.org/linuxppc-dev/6af2c4c2-97f6-4758-be33-256638=
ef39e5@linux.ibm.com/
Fixes: daaa574aba6f ("powerpc/pseries/msi: Switch to msi_create_parent_irq_=
domain()")
Signed-off-by: Nam Cao <namcao@linutronix.de>
Acked-by: Nilay Shroff <nilay@inux.ibm.com>
Cc: stable@vger.kernel.org
---
 arch/powerpc/platforms/pseries/msi.c | 42 ++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/=
pseries/msi.c
index a82aaa786e9e..8898a968a59b 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -19,6 +19,11 @@
=20
 #include "pseries.h"
=20
+struct pseries_msi_device {
+	unsigned int msi_quota;
+	unsigned int msi_used;
+};
+
 static int query_token, change_token;
=20
 #define RTAS_QUERY_FN		0
@@ -433,8 +438,26 @@ static int pseries_msi_ops_prepare(struct irq_domain *=
domain, struct device *dev
 	struct msi_domain_info *info =3D domain->host_data;
 	struct pci_dev *pdev =3D to_pci_dev(dev);
 	int type =3D (info->flags & MSI_FLAG_PCI_MSIX) ? PCI_CAP_ID_MSIX : PCI_CA=
P_ID_MSI;
+	int ret;
+
+	struct pseries_msi_device *pseries_dev __free(kfree)
+		=3D kmalloc(sizeof(*pseries_dev), GFP_KERNEL);
+	if (!pseries_dev)
+		return -ENOMEM;
+
+	ret =3D rtas_prepare_msi_irqs(pdev, nvec, type, arg);
+	if (ret > 0) {
+		nvec =3D ret;
+		ret =3D rtas_prepare_msi_irqs(pdev, nvec, type, arg);
+	}
+	if (ret < 0)
+		return ret;
=20
-	return rtas_prepare_msi_irqs(pdev, nvec, type, arg);
+	pseries_dev->msi_quota =3D nvec;
+	pseries_dev->msi_used =3D 0;
+
+	arg->scratchpad[0].ptr =3D no_free_ptr(pseries_dev);
+	return 0;
 }
=20
 /*
@@ -443,9 +466,13 @@ static int pseries_msi_ops_prepare(struct irq_domain *=
domain, struct device *dev
  */
 static void pseries_msi_ops_teardown(struct irq_domain *domain, msi_alloc_=
info_t *arg)
 {
+	struct pseries_msi_device *pseries_dev =3D arg->scratchpad[0].ptr;
 	struct pci_dev *pdev =3D to_pci_dev(domain->dev);
=20
 	rtas_disable_msi(pdev);
+
+	WARN_ON(pseries_dev->msi_used);
+	kfree(pseries_dev);
 }
=20
 static void pseries_msi_shutdown(struct irq_data *d)
@@ -546,12 +573,18 @@ static int pseries_irq_domain_alloc(struct irq_domain=
 *domain, unsigned int virq
 				    unsigned int nr_irqs, void *arg)
 {
 	struct pci_controller *phb =3D domain->host_data;
+	struct pseries_msi_device *pseries_dev;
 	msi_alloc_info_t *info =3D arg;
 	struct msi_desc *desc =3D info->desc;
 	struct pci_dev *pdev =3D msi_desc_to_pci_dev(desc);
 	int hwirq;
 	int i, ret;
=20
+	pseries_dev =3D info->scratchpad[0].ptr;
+
+	if (pseries_dev->msi_used + nr_irqs > pseries_dev->msi_quota)
+		return -ENOSPC;
+
 	hwirq =3D rtas_query_irq_number(pci_get_pdn(pdev), desc->msi_index);
 	if (hwirq < 0) {
 		dev_err(&pdev->dev, "Failed to query HW IRQ: %d\n", hwirq);
@@ -567,9 +600,10 @@ static int pseries_irq_domain_alloc(struct irq_domain =
*domain, unsigned int virq
 			goto out;
=20
 		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
-					      &pseries_msi_irq_chip, domain->host_data);
+					      &pseries_msi_irq_chip, pseries_dev);
 	}
=20
+	pseries_dev->msi_used++;
 	return 0;
=20
 out:
@@ -582,9 +616,11 @@ static void pseries_irq_domain_free(struct irq_domain =
*domain, unsigned int virq
 				    unsigned int nr_irqs)
 {
 	struct irq_data *d =3D irq_domain_get_irq_data(domain, virq);
-	struct pci_controller *phb =3D irq_data_get_irq_chip_data(d);
+	struct pseries_msi_device *pseries_dev =3D irq_data_get_irq_chip_data(d);
+	struct pci_controller *phb =3D domain->host_data;
=20
 	pr_debug("%s bridge %pOF %d #%d\n", __func__, phb->dn, virq, nr_irqs);
+	pseries_dev->msi_used -=3D nr_irqs;
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
=20
--=20
2.47.3


