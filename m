Return-Path: <linuxppc-dev+bounces-7875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBECA95C5B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 04:51:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhRZp0WJjz3brm;
	Tue, 22 Apr 2025 12:51:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745289930;
	cv=none; b=GDpoTCr1CXwPqftfb2TDtFf2ynrWXmYKOWYzXZ9zT9ElUggyeBAsBPdYFSQ83czgY/v4MMSApDGGcRUl9X4cl0EQ9tc1t5dvssESgbWPEVlzu8vZwSQDW59k2wGwCHiCHYFOwZB5uetB2UYXmSZ8SGtpbcTS6xidGVwPIHZ7qHc/T6c6l/V0+y2FAzkoJz/QFY4/MM3ZQddQ5pu5CyvDPdPu9rxIRK2TaHD33d+4YR5mtSnJ0kATOkibOvoPCj4BgbsUF7y2VDiLY0bpv9dC2NPD1BAe2Pmbu+sXEYY2X+0jSf2KessPAk75Lj6xNcjILe/FHGcMTGm/REV7aebefw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745289930; c=relaxed/relaxed;
	bh=oCjWgRNzcNEmHv9cpN9198Y2KWYcelAVC6xmqtQLcj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=be8pwvYd2kOrYOeDu811yl8KvCNfMQuxY3fWvZLnNHKb7i4CiiMxpeB6Z12oKUCToI5iUInxTTOoLFXLyp2BytY/cUXnLIxdAo9Ww5iFsp+4hfWf61wg6hFMxZSZYFx8YPa+ia8OCQMqLsltFXqd/eD0QtPb9I+4Q0UFckzqyDL4xUuMFaRPLTdvXen61prF+Z7LTyjMTh2p5hib6s34T+KTk3Y07O6XX54UFko4cVib/ZwxoEMJPAlbyuvELSzREVilCNWRtz5vPzyPXwXG434GN7FBAR7yfZsOZJ/xJfUV1fbaiiDY0JIXD9CdIG58PpyajYgY+vDnqPeoo3IH3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass (client-ip=95.215.58.172; helo=out-172.mta1.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.172; helo=out-172.mta1.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 572 seconds by postgrey-1.37 at boromir; Tue, 22 Apr 2025 12:45:29 AEST
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhRRs6rh7z2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 12:45:28 +1000 (AEST)
Date: Mon, 21 Apr 2025 22:35:32 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Subject: [PATCH] fsl_msi: Translate bitmap to hwirq on fsl,mpic
Message-ID: <2025042122-cute-skua-c6de4a@boujee-and-buff>
Mail-Followup-To: linuxppc-dev@lists.ozlabs.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	linux-kernel@vger.kernel.org
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7mrpmxef3ve3htry"
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--7mrpmxef3ve3htry
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] fsl_msi: Translate bitmap to hwirq on fsl,mpic
MIME-Version: 1.0

On PPC_32 QorIQ, the hwirq bitmap is done with the cascade being the most
significant bits and the srs on the cascade being the least. This has the
effect of filling up one cascade before the next.

Since each cascade has 32 srs and is tied to a single CPU and interrupt,
this means no load balancing of MSIs.

Rework this case to translate between the bitmap and hwirq so that MSIs
are allocated across the cascades round-robin to achieve load balancing.

Also, to avoid holes in the bitmap, allocate it for exactly what the
hardware supports.

Tested on P4080 (which had the problem) and T4240 (which did not, but
also no regressions).

Signed-off-by: Ben Collins <bcollins@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org
---
 arch/powerpc/sysdev/fsl_msi.c | 232 ++++++++++++++++++++++++----------
 arch/powerpc/sysdev/fsl_msi.h |   7 +-
 2 files changed, 167 insertions(+), 72 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index 7b9a5ea9cad9d..37f2143187ee1 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -29,17 +29,63 @@
 #include "fsl_pci.h"
=20
 #define MSIIR_OFFSET_MASK	0xfffff
+
 #define MSIIR_IBS_SHIFT		0
 #define MSIIR_SRS_SHIFT		5
+#define MSIIR_SRS_MASK		0x7
+
 #define MSIIR1_IBS_SHIFT	4
 #define MSIIR1_SRS_SHIFT	0
-#define MSI_SRS_MASK		0xf
+#define MSIIR1_SRS_MASK		0xf
+
 #define MSI_IBS_MASK		0x1f
=20
-#define msi_hwirq(msi, msir_index, intr_index) \
-		((msir_index) << (msi)->srs_shift | \
+#define MSI_MPIC_SIZE		0x10
+#define MSI_IPIC_SIZE		0x04
+
+#define msi_to_hwirq(msi, msir_index, intr_index) \
+		(((msir_index) << (msi)->srs_shift) | \
 		 ((intr_index) << (msi)->ibs_shift))
=20
+static inline int msi_to_bit(struct fsl_msi *msi, int msir_index, int intr=
_index)
+{
+	if (!msi->srs_shift)
+		return msi_to_hwirq(msi, msir_index, intr_index);
+
+	return msir_index | (intr_index << hweight32(msi->srs_mask));
+}
+
+static inline int bit_to_hwirq(struct fsl_msi *msi, int bit)
+{
+	int hwirq;
+
+	if (!msi->srs_shift)
+		return bit;
+
+	hwirq  =3D (bit & msi->srs_mask) << msi->srs_shift;
+	hwirq |=3D  bit >> hweight32(msi->srs_mask);
+
+	return hwirq;
+}
+
+static inline int hwirq_to_bit(struct fsl_msi *msi, int hwirq)
+{
+	int bit;
+
+	if (!msi->srs_shift)
+		return hwirq;
+
+	bit  =3D (hwirq >> msi->srs_shift) & msi->srs_mask;
+	bit |=3D (hwirq & MSI_IBS_MASK) << msi->srs_shift;
+
+	return bit;
+}
+
+#define hwirq_to_srs(msi, hwirq) \
+		(((hwirq) >> (msi)->srs_shift) & (msi)->srs_mask)
+#define hwirq_to_ibs(msi, hwirq) \
+		(((hwirq) >> (msi)->ibs_shift) & MSI_IBS_MASK)
+
 static LIST_HEAD(msi_head);
=20
 struct fsl_msi_feature {
@@ -72,7 +118,7 @@ static void fsl_msi_print_chip(struct irq_data *irqd, st=
ruct seq_file *p)
 	irq_hw_number_t hwirq =3D irqd_to_hwirq(irqd);
 	int cascade_virq, srs;
=20
-	srs =3D (hwirq >> msi_data->srs_shift) & MSI_SRS_MASK;
+	srs =3D hwirq_to_srs(msi_data, hwirq);
 	cascade_virq =3D msi_data->cascade_array[srs]->virq;
=20
 	seq_printf(p, "fsl-msi-%d", cascade_virq);
@@ -107,8 +153,9 @@ static const struct irq_domain_ops fsl_msi_host_ops =3D=
 {
 static int fsl_msi_init_allocator(struct fsl_msi *msi_data)
 {
 	int rc, hwirq;
+	int num_irqs =3D msi_data->nr_msi_regs * IRQS_PER_MSI_REG;
=20
-	rc =3D msi_bitmap_alloc(&msi_data->bitmap, NR_MSI_IRQS_MAX,
+	rc =3D msi_bitmap_alloc(&msi_data->bitmap, num_irqs,
 			      irq_domain_get_of_node(msi_data->irqhost));
 	if (rc)
 		return rc;
@@ -117,7 +164,7 @@ static int fsl_msi_init_allocator(struct fsl_msi *msi_d=
ata)
 	 * Reserve all the hwirqs
 	 * The available hwirqs will be released in fsl_msi_setup_hwirq()
 	 */
-	for (hwirq =3D 0; hwirq < NR_MSI_IRQS_MAX; hwirq++)
+	for (hwirq =3D 0; hwirq < num_irqs; hwirq++)
 		msi_bitmap_reserve_hwirq(&msi_data->bitmap, hwirq);
=20
 	return 0;
@@ -135,7 +182,8 @@ static void fsl_teardown_msi_irqs(struct pci_dev *pdev)
 		irq_set_msi_desc(entry->irq, NULL);
 		irq_dispose_mapping(entry->irq);
 		entry->irq =3D 0;
-		msi_bitmap_free_hwirqs(&msi_data->bitmap, hwirq, 1);
+		msi_bitmap_free_hwirqs(&msi_data->bitmap,
+				       hwirq_to_bit(msi_data, hwirq), 1);
 	}
 }
=20
@@ -171,44 +219,41 @@ static void fsl_compose_msi_msg(struct pci_dev *pdev,=
 int hwirq,
 	else
 		msg->data =3D hwirq;
=20
-	pr_debug("%s: allocated srs: %d, ibs: %d\n", __func__,
-		 (hwirq >> msi_data->srs_shift) & MSI_SRS_MASK,
-		 (hwirq >> msi_data->ibs_shift) & MSI_IBS_MASK);
+	pr_debug("%s: allocated srs: %i, ibs: %i\n", __func__,
+		 hwirq_to_srs(msi_data, hwirq),
+		 hwirq_to_ibs(msi_data, hwirq));
 }
=20
+#ifdef CONFIG_EPAPR_PARAVIRT
+static const char * const of_msi_match[] =3D {
+	"fsl,vmpic-msi",
+	"fsl,vmpic-msi-v4.3",
+	NULL,
+};
+#endif
+
 static int fsl_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
 {
 	struct pci_controller *hose =3D pci_bus_to_host(pdev->bus);
 	struct device_node *np;
-	phandle phandle =3D 0;
-	int rc, hwirq =3D -ENOMEM;
+	int n_bit, bit =3D -ENOMEM;
 	unsigned int virq;
 	struct msi_desc *entry;
 	struct msi_msg msg;
 	struct fsl_msi *msi_data;
=20
-	if (type =3D=3D PCI_CAP_ID_MSI) {
-		/*
-		 * MPIC version 2.0 has erratum PIC1. For now MSI
-		 * could not work. So check to prevent MSI from
-		 * being used on the board with this erratum.
-		 */
-		list_for_each_entry(msi_data, &msi_head, list)
-			if (msi_data->feature & MSI_HW_ERRATA_ENDIAN)
-				return -EINVAL;
-	}
-
+#ifdef CONFIG_EPAPR_PARAVIRT
+	phandle ph =3D 0;
 	/*
 	 * If the PCI node has an fsl,msi property, then we need to use it
-	 * to find the specific MSI.
+	 * to find the specific MSI. This is deprecated on physical hardware
+	 * and only used by ePAPR to restrict use of PAMU registered devices.
 	 */
 	np =3D of_parse_phandle(hose->dn, "fsl,msi", 0);
 	if (np) {
-		if (of_device_is_compatible(np, "fsl,mpic-msi") ||
-		    of_device_is_compatible(np, "fsl,vmpic-msi") ||
-		    of_device_is_compatible(np, "fsl,vmpic-msi-v4.3"))
-			phandle =3D np->phandle;
-		else {
+		if (of_device_compatible_match(np, of_msi_match)) {
+			ph =3D np->phandle;
+		} else {
 			dev_err(&pdev->dev,
 				"node %pOF has an invalid fsl,msi phandle %u\n",
 				hose->dn, np->phandle);
@@ -217,54 +262,73 @@ static int fsl_setup_msi_irqs(struct pci_dev *pdev, i=
nt nvec, int type)
 		}
 		of_node_put(np);
 	}
+#endif
=20
+	/*
+	 * fsl_teardown_msi_irqs() will cleanup already allocated descriptors if
+	 * we return an error. Hence the lack of cleaning up previous
+	 * iterations.
+	 */
+	n_bit =3D 0;
 	msi_for_each_desc(entry, &pdev->dev, MSI_DESC_NOTASSOCIATED) {
+		int hwirq;
+
+		if (n_bit >=3D nvec)
+			break;
+
 		/*
-		 * Loop over all the MSI devices until we find one that has an
+		 * Loop over all the MSI devices until we find one that has the
 		 * available interrupt.
 		 */
 		list_for_each_entry(msi_data, &msi_head, list) {
 			/*
-			 * If the PCI node has an fsl,msi property, then we
-			 * restrict our search to the corresponding MSI node.
-			 * The simplest way is to skip over MSI nodes with the
-			 * wrong phandle. Under the Freescale hypervisor, this
-			 * has the additional benefit of skipping over MSI
-			 * nodes that are not mapped in the PAMU.
+			 * MPIC version 2.0 has erratum PIC1. For now MSI could not
+			 * work. So check to prevent MSI from being used on the board
+			 * with this erratum.
 			 */
-			if (phandle && (phandle !=3D msi_data->phandle))
+			if (type =3D=3D PCI_CAP_ID_MSI &&
+			    msi_data->feature & MSI_HW_ERRATA_ENDIAN)
 				continue;
=20
-			hwirq =3D msi_bitmap_alloc_hwirqs(&msi_data->bitmap, 1);
-			if (hwirq >=3D 0)
+#ifdef CONFIG_EPAPR_PARAVIRT
+			/* Check for phandle on ePAPR */
+			if (ph && (ph !=3D msi_data->phandle))
+				continue;
+#endif
+
+			bit =3D msi_bitmap_alloc_hwirqs(&msi_data->bitmap, 1);
+			if (bit >=3D 0)
 				break;
 		}
=20
-		if (hwirq < 0) {
-			rc =3D hwirq;
-			dev_err(&pdev->dev, "could not allocate MSI interrupt\n");
-			goto out_free;
+		if (bit < 0) {
+			dev_err(&pdev->dev,
+				"could not allocate MSI interrupt\n");
+			return bit;
 		}
=20
+		hwirq =3D bit_to_hwirq(msi_data, bit);
+
 		virq =3D irq_create_mapping(msi_data->irqhost, hwirq);
=20
 		if (!virq) {
-			dev_err(&pdev->dev, "fail mapping hwirq %i\n", hwirq);
-			msi_bitmap_free_hwirqs(&msi_data->bitmap, hwirq, 1);
-			rc =3D -ENOSPC;
-			goto out_free;
+			dev_err(&pdev->dev, "failed to map hwirq %i\n", hwirq);
+			msi_bitmap_free_hwirqs(&msi_data->bitmap, bit, 1);
+			return -ENOSPC;
 		}
+
 		/* chip_data is msi_data via host->hostdata in host->map() */
 		irq_set_msi_desc(virq, entry);
=20
 		fsl_compose_msi_msg(pdev, hwirq, &msg, msi_data);
 		pci_write_msi_msg(virq, &msg);
+
+		n_bit++;
 	}
-	return 0;
=20
-out_free:
-	/* free by the caller of this function */
-	return rc;
+	WARN_ON(n_bit !=3D nvec);
+
+	return 0;
 }
=20
 static irqreturn_t fsl_msi_cascade(int irq, void *data)
@@ -284,10 +348,11 @@ static irqreturn_t fsl_msi_cascade(int irq, void *dat=
a)
 	switch (msi_data->feature & FSL_PIC_IP_MASK) {
 	case FSL_PIC_IP_MPIC:
 		msir_value =3D fsl_msi_read(msi_data->msi_regs,
-			msir_index * 0x10);
+					  msir_index * MSI_MPIC_SIZE);
 		break;
 	case FSL_PIC_IP_IPIC:
-		msir_value =3D fsl_msi_read(msi_data->msi_regs, msir_index * 0x4);
+		msir_value =3D fsl_msi_read(msi_data->msi_regs,
+					  msir_index * MSI_IPIC_SIZE);
 		break;
 #ifdef CONFIG_EPAPR_PARAVIRT
 	case FSL_PIC_IP_VMPIC: {
@@ -308,18 +373,31 @@ static irqreturn_t fsl_msi_cascade(int irq, void *dat=
a)
 		intr_index =3D ffs(msir_value) - 1;
=20
 		err =3D generic_handle_domain_irq(msi_data->irqhost,
-				msi_hwirq(msi_data, msir_index,
+				msi_to_hwirq(msi_data, msir_index,
 					  intr_index + have_shift));
 		if (!err)
 			ret =3D IRQ_HANDLED;
=20
-		have_shift +=3D intr_index + 1;
-		msir_value =3D msir_value >> (intr_index + 1);
+		have_shift  +=3D intr_index + 1;
+		msir_value >>=3D intr_index + 1;
 	}
=20
 	return ret;
 }
=20
+static ssize_t irq_bitmap_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct fsl_msi *msi =3D dev_get_drvdata(dev);
+
+	if (msi->bitmap.bitmap =3D=3D NULL)
+		return 0;
+
+	return bitmap_print_to_pagebuf(false, buf, msi->bitmap.bitmap,
+				       msi->bitmap.irq_count);
+}
+static DEVICE_ATTR_RO(irq_bitmap);
+
 static void fsl_of_msi_remove(struct platform_device *ofdev)
 {
 	struct fsl_msi *msi =3D platform_get_drvdata(ofdev);
@@ -327,7 +405,10 @@ static void fsl_of_msi_remove(struct platform_device *=
ofdev)
=20
 	if (msi->list.prev !=3D NULL)
 		list_del(&msi->list);
-	for (i =3D 0; i < NR_MSI_REG_MAX; i++) {
+
+	device_remove_file(&ofdev->dev, &dev_attr_irq_bitmap);
+
+	for (i =3D 0; i < msi->nr_msi_regs; i++) {
 		if (msi->cascade_array[i]) {
 			virq =3D msi->cascade_array[i]->virq;
=20
@@ -382,14 +463,16 @@ static int fsl_msi_setup_hwirq(struct fsl_msi *msi, s=
truct platform_device *dev,
 	}
=20
 	/* Release the hwirqs corresponding to this MSI register */
-	for (i =3D 0; i < IRQS_PER_MSI_REG; i++)
+	for (i =3D 0; i < IRQS_PER_MSI_REG; i++) {
 		msi_bitmap_free_hwirqs(&msi->bitmap,
-				       msi_hwirq(msi, offset, i), 1);
+				       msi_to_bit(msi, offset, i), 1);
+	}
=20
 	return 0;
 }
=20
 static const struct of_device_id fsl_of_msi_ids[];
+
 static int fsl_of_msi_probe(struct platform_device *dev)
 {
 	struct fsl_msi *msi;
@@ -412,8 +495,27 @@ static int fsl_of_msi_probe(struct platform_device *de=
v)
 	}
 	platform_set_drvdata(dev, msi);
=20
+	if (device_create_file(&dev->dev, &dev_attr_irq_bitmap)) {
+		dev_err(&dev->dev,
+			"couldn't create device file for irq_bitmap\n");
+	}
+
+	if (of_device_is_compatible(dev->dev.of_node, "fsl,mpic-msi-v4.3") ||
+	    of_device_is_compatible(dev->dev.of_node, "fsl,vmpic-msi-v4.3")) {
+		msi->nr_msi_regs =3D NR_MSI_REG_MSIIR1;
+		msi->ibs_shift   =3D MSIIR1_IBS_SHIFT;
+		msi->srs_mask    =3D MSIIR1_SRS_MASK;
+		msi->srs_shift   =3D MSIIR1_SRS_SHIFT;
+	} else {
+		msi->nr_msi_regs =3D NR_MSI_REG_MSIIR;
+		msi->ibs_shift   =3D MSIIR_IBS_SHIFT;
+		msi->srs_mask    =3D MSIIR_SRS_MASK;
+		msi->srs_shift   =3D MSIIR_SRS_SHIFT;
+	}
+
 	msi->irqhost =3D irq_domain_add_linear(dev->dev.of_node,
-				      NR_MSI_IRQS_MAX, &fsl_msi_host_ops, msi);
+					msi->nr_msi_regs * IRQS_PER_MSI_REG,
+					&fsl_msi_host_ops, msi);
=20
 	if (msi->irqhost =3D=3D NULL) {
 		dev_err(&dev->dev, "No memory for MSI irqhost\n");
@@ -440,8 +542,6 @@ static int fsl_of_msi_probe(struct platform_device *dev)
 				dev->dev.of_node);
 			goto error_out;
 		}
-		msi->msiir_offset =3D
-			features->msiir_offset + (res.start & 0xfffff);
=20
 		/*
 		 * First read the MSIIR/MSIIR1 offset from dts
@@ -475,10 +575,7 @@ static int fsl_of_msi_probe(struct platform_device *de=
v)
=20
 	p =3D of_get_property(dev->dev.of_node, "msi-available-ranges", &len);
=20
-	if (of_device_is_compatible(dev->dev.of_node, "fsl,mpic-msi-v4.3") ||
-	    of_device_is_compatible(dev->dev.of_node, "fsl,vmpic-msi-v4.3")) {
-		msi->srs_shift =3D MSIIR1_SRS_SHIFT;
-		msi->ibs_shift =3D MSIIR1_IBS_SHIFT;
+	if (msi->nr_msi_regs =3D=3D NR_MSI_REG_MSIIR1) {
 		if (p)
 			dev_warn(&dev->dev, "%s: dose not support msi-available-ranges property=
\n",
 				__func__);
@@ -494,9 +591,6 @@ static int fsl_of_msi_probe(struct platform_device *dev)
 		static const u32 all_avail[] =3D
 			{ 0, NR_MSI_REG_MSIIR * IRQS_PER_MSI_REG };
=20
-		msi->srs_shift =3D MSIIR_SRS_SHIFT;
-		msi->ibs_shift =3D MSIIR_IBS_SHIFT;
-
 		if (p && len % (2 * sizeof(u32)) !=3D 0) {
 			dev_err(&dev->dev, "%s: Malformed msi-available-ranges property\n",
 				__func__);
diff --git a/arch/powerpc/sysdev/fsl_msi.h b/arch/powerpc/sysdev/fsl_msi.h
index e2a1bfc7c2377..0515030af9acb 100644
--- a/arch/powerpc/sysdev/fsl_msi.h
+++ b/arch/powerpc/sysdev/fsl_msi.h
@@ -15,7 +15,6 @@
 #define NR_MSI_REG_MSIIR1	16 /* MSIIR1 can index 16 MSI registers */
 #define NR_MSI_REG_MAX		NR_MSI_REG_MSIIR1
 #define IRQS_PER_MSI_REG	32
-#define NR_MSI_IRQS_MAX	(NR_MSI_REG_MAX * IRQS_PER_MSI_REG)
=20
 #define FSL_PIC_IP_MASK   0x0000000F
 #define FSL_PIC_IP_MPIC   0x00000001
@@ -32,11 +31,13 @@ struct fsl_msi {
 	unsigned long cascade_irq;
=20
 	u32 msiir_offset; /* Offset of MSIIR, relative to start of CCSR */
-	u32 ibs_shift; /* Shift of interrupt bit select */
-	u32 srs_shift; /* Shift of the shared interrupt register select */
+	u32 ibs_shift;    /* Shift of interrupt bit select */
+	u32 srs_mask;     /* Mask of the shared interrupt register select */
+	u32 srs_shift;    /* Shift for shared interrupt register select */
 	void __iomem *msi_regs;
 	u32 feature;
 	struct fsl_msi_cascade_data *cascade_array[NR_MSI_REG_MAX];
+	u32 nr_msi_regs;
=20
 	struct msi_bitmap bitmap;
=20
--=20
2.49.0


--=20
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF

--7mrpmxef3ve3htry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEPsl1mBZylhoRORc6XVpXxyQrIs8FAmgHAGUACgkQXVpXxyQr
Is9Tag/8DDm8htyYA3qZgteSn7ucSdSiD5QAsGzIh0ngwe+Be0QKqRxZ43969Qzw
9DNhkXbr66WK0AxvDeEi66REWwWtMXvGLGjCQfMgkQvquwSN+9eL/gMvDxAmhZrg
zoiihOhyx1TtSj3qed/XHX4rrkHLRAGT6bo4Y8La1M+5KKxdyizKSCztenYeUjH8
h/T+EduPqZTLaTUZuoQVh/zfjvUR9nrnWrm9yhlfjeqTO+esWCsPl9ba8Kr0Sg0E
ohuvYYD29rmaeJtjCMGPyGt7E9htFlq9JEaDkS3xtt4wVWah/2ijnQ3k7S612DE1
7Ua6BPbm+SrIRs+1Uuf/qHkv9HNCA+1rnCTi8HaAn3BI0bMFn58CH8JkagOYTuDI
YPtjOpJb/kWwUbG/1el0dCsh2Q6J/ZeO4x/fBMRvxKe3xNLFWVjhq8eFkc0b5vrN
ei2HYtMKPL6MwqffngSHRPkFKKf5PYpixS2GASqRTS/TtewkfRKaxgyhC3uiprEE
nMuvNECuBUqpeKoAteWdQVirw/m46R8+hggWrDsk/g21oxlrUXvhn4SNvZY5NcVo
GfqgOIgsiZrAUMied7Jzcs8l9GaES8CgoHQjQCwzGg7D6EFNNYEe1ZYaQxwfl4x+
C6lHIZbAAGQBes2bEUUF2SILdiVTbNZQqQlpVPw+egdJ/3wEE9U=
=PNEl
-----END PGP SIGNATURE-----

--7mrpmxef3ve3htry--

