Return-Path: <linuxppc-dev+bounces-15378-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 163CCCFD12B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 11:02:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmNrL4lRgz2yFh;
	Wed, 07 Jan 2026 21:02:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767780162;
	cv=none; b=VdP1mBoMUlwwjjODTHGGqI1mYj1VOHJXrVu4LmX7AqPq7+nvPsI1kEn3RV4csf+RaJq/EnUYXh7D3XzZvTOTP9Mlbta9Kgl6hrwiS/qQ6k+ADivVZJ+jPCASTtpyeEgO7D3WihE4I9rP3ekwC+jOKxdBG/HTN5uNz/oecSfJeqMYhI9jLiPgsZ+8fDuczi/fagAdbhQ9OEnkV7fIAIJR1pnmMcS3T6tlcrTQVStjEXNBmmpNAjjEiefw2PktNCh6LhNJkiu4UgBAmfZPr/nOoPKx1GZUITVSk2dLp/ORmmyOcoe1/gVCkC/rKVIO6l7L3nueMO2cZou62IgqmaEbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767780162; c=relaxed/relaxed;
	bh=Qbwx1guxAlbBYM+NGSyz5ENZkElfMSx+ICTxeCbRCcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gg07wHy24V1HdGayEszejs2DyCrvb81yokNUFhwuTk53LHk46Q+huon9SrL5WVNknYRqM1tbhcIH4YspZCHDfjEAL0MNkjqTTb7s5ttMvzxl59P1FJLscTku3arvzgHhLC19SbAIwT4wzIl2Ebg7S7P0L+ys4hM/OkPoh9VWpOzcNhNbKyIFXflX8fKhXsJz7TQxCFfxeP0kSJYTFgll8nBOoScyEMltGVmf1VCIOJZQn+ScgWxI3aZOikfJmtl0mK/9FB3e4LlQifLRIbi5KCWppzd+gWpDh0CD8vsDDkhTlmFFnMAFFZhVt2kCnVQQwKdUjdVYRBk+oMyud/3oeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uxsTslS5; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vqMMvItA; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uxsTslS5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vqMMvItA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmNrK04rqz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 21:02:40 +1100 (AEDT)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767780158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Qbwx1guxAlbBYM+NGSyz5ENZkElfMSx+ICTxeCbRCcE=;
	b=uxsTslS5EZMVtyPpJcaifJz8HoSgh8luxmkRgBDN3NjEFU5ShaUhAcX+Pig5EqiRfttRF8
	WIDWR6I14fFP5/8bhF1du2Qlt3CHXF7FH7i7DeH0a+A7AXq+xyvdL37EWjz7hvPX0Renmu
	WDPe6jTYQJd9bv4nI5qRbGfj8Eb5c0j9lHhKroO7gC6vkrInym3DCThHRNkq+TWBEzy4Np
	GKtP5Tdfj68JxoPxTw7uzCqzKjM2U+CSAFrBaKauTHgflu48SsNyW7lI3P2lwS097CCML5
	+ttzPaVOI3e6EXsMmhgP77WKv/KhCbM6wv7F+hw4MMEd2bzFfXnKmQ9meM6uDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767780158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Qbwx1guxAlbBYM+NGSyz5ENZkElfMSx+ICTxeCbRCcE=;
	b=vqMMvItA0GqmSzUiH63sQjCqgkGfq9XPIteOxXjS6u/nYhP2eLEZilxTzAyAeZSKW9gDxa
	LZXgY6lrKE42Y0BQ==
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
	Nilay Shroff <nilay@linux.ibm.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] powerpc/pseries: Fix MSI-X allocation failure when quota is exceeded
Date: Wed,  7 Jan 2026 10:02:30 +0000
Message-ID: <20260107100230.1466093-1-namcao@linutronix.de>
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

Reported-by: Nilay Shroff <nilay@linux.ibm.com>
Closes: https://lore.kernel.org/linuxppc-dev/6af2c4c2-97f6-4758-be33-256638=
ef39e5@linux.ibm.com/
Fixes: daaa574aba6f ("powerpc/pseries/msi: Switch to msi_create_parent_irq_=
domain()")
Signed-off-by: Nam Cao <namcao@linutronix.de>
Acked-by: Nilay Shroff <nilay@linux.ibm.com>
Cc: stable@vger.kernel.org
---
v2:
  - change pseries_msi_ops_prepare()'s allocation logic to match the
    original logic in __pci_enable_msix_range()

  - fix up Nilay's email address
---
 arch/powerpc/platforms/pseries/msi.c | 44 ++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/=
pseries/msi.c
index a82aaa786e9e..edc30cda5dbc 100644
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
@@ -433,8 +438,28 @@ static int pseries_msi_ops_prepare(struct irq_domain *=
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
+	while (1) {
+		ret =3D rtas_prepare_msi_irqs(pdev, nvec, type, arg);
+		if (!ret)
+			break;
+		else if (ret > 0)
+			nvec =3D ret;
+		else
+			return ret;
+	}
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
@@ -443,9 +468,13 @@ static int pseries_msi_ops_prepare(struct irq_domain *=
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
@@ -546,12 +575,18 @@ static int pseries_irq_domain_alloc(struct irq_domain=
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
@@ -567,9 +602,10 @@ static int pseries_irq_domain_alloc(struct irq_domain =
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
@@ -582,9 +618,11 @@ static void pseries_irq_domain_free(struct irq_domain =
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
2.51.0


