Return-Path: <linuxppc-dev+bounces-12880-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB14BDCD8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 09:15:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmj5q23FGz3cgW;
	Wed, 15 Oct 2025 18:15:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760512511;
	cv=none; b=cG7rW91wLTpkZvXAeTJO+SHqsXCAxBHkvter06ghhQk6IkUJjAO6SeCZXE5D7Xx3jww6p7leqn0pDL5CV3nVHQcgbjxayc4pTbR55PM4C0nQY/3hITlstI9yoAYn827ff8Uir9gPZgxzvipStZ048a/WvOzXESyU4RpCnbHCT8T3IfF1Zg7ZHvrZb+XxO2jslZoRQE99R0AzgGVYssHzoamKaoGElESjSJKJXqgx/KeuYM8tvXP/IK010RLGRxjEU15Ufnaj9UgYFGOWRqQ9AsXJiKhWrgcwPr6/sQZe1UnxvJFxMYDE377QGCKe5o3Ucu7GLEXnzlV6bJrs4TSJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760512511; c=relaxed/relaxed;
	bh=Q5W3plTml2LrXx/+V26o+pAQSf6UvRi+HJfSZMFUt2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ntMETcJAY59DV+5iUqFdTYhpoWWvBZ7DtSjsDXKAP8gIkiEPKZ3ykoIOWTtw3T6bNTaTrP4TG/9G9i9xoLi6R7qEL2fJI8yjyi/a2Gop+kvsfS3uXzbc0zd+C8T0b8l8oxn1SQH6bLUFyRO7S8hHpSaj1frIzflZ8TTldb6E4veW9U7FYYNll6X7xe7xK3lWPldWim9PIo7JPL/Zz38fr08lmtYz3HeOVFuggO/XfJL235kTSKMKVDxsSaE1h+VLQrbBo26gZBxcGTYKJLhFH9mjOMBfawQcpNa5Ka4ZGi64k7DuKa2k3y5H8hUIOgb0AOgTLhcR1hzeMtU7xt5dZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sNXX1el/; dkim-atps=neutral; spf=pass (client-ip=95.215.58.171; helo=out-171.mta1.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sNXX1el/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.171; helo=out-171.mta1.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Wed, 15 Oct 2025 18:15:07 AEDT
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmj5m00bqz3cdg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 18:15:07 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760512419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q5W3plTml2LrXx/+V26o+pAQSf6UvRi+HJfSZMFUt2w=;
	b=sNXX1el/j7XakQCK55yUWvZmBso+twy+0FuXrccV5J2VIhAypNGnPMphlDPr7nfOLds3QC
	qnbmD0eeDAxZw1VsK7kqREenh/3tCfSI5a9vKVcpccWLolSEqdF+kXXxIahqM8PoeZm5Ya
	Qr+oRQMfk1F9EgHh6rBY6gXhjW1GOac=
From: Ben Collins <ben.collins@linux.dev>
Date: Wed, 15 Oct 2025 03:13:35 -0400
Subject: [PATCH] fsl_msi: Translate bitmap to hwirq on fsl,mpic
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-fsl_msi_bitmap_translate-v1-1-c438208b7f80@linux.dev>
X-B4-Tracking: v=1; b=H4sIAJ5J72gC/x3MTQqAIBBA4avErBNU+qOrRIjWWANl4UgE0d2Tl
 t/ivQcYIyFDXzwQ8SKmI2SosoBptWFBQXM2aKlrJVUtPG9mZzKO0m5Pk6INvNmEQraNcr6aO/Q
 acn5G9HT/62F83w8gX/uhagAAAA==
X-Change-ID: 20251015-fsl_msi_bitmap_translate-0761bf4d8ef2
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Ben Collins <bcollins@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

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
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org
---
Rework fsl,mpic bitmap translation on PPC_32 so that IRQs cascade across
CPUs properly.

v2:
- Slight fuzz fixes since patch is 6 months old.
---
 arch/powerpc/sysdev/fsl_msi.c | 70 ++++++++++++++++++++++++++++++++++++-------
 arch/powerpc/sysdev/fsl_msi.h |  7 +++--
 2 files changed, 63 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index 2a007bfb038d0167edc7e6143d22ca5b76989947..b07eef18dec3c1f7623527c96b3abf5a589bd443 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -29,17 +29,63 @@
 #include "fsl_pci.h"
 
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
 
-#define msi_hwirq(msi, msir_index, intr_index) \
-		((msir_index) << (msi)->srs_shift | \
+#define MSI_MPIC_SIZE		0x10
+#define MSI_IPIC_SIZE		0x04
+
+#define msi_to_hwirq(msi, msir_index, intr_index) \
+		(((msir_index) << (msi)->srs_shift) | \
 		 ((intr_index) << (msi)->ibs_shift))
 
+static inline int msi_to_bit(struct fsl_msi *msi, int msir_index, int intr_index)
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
+	hwirq  = (bit & msi->srs_mask) << msi->srs_shift;
+	hwirq |=  bit >> hweight32(msi->srs_mask);
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
+	bit  = (hwirq >> msi->srs_shift) & msi->srs_mask;
+	bit |= (hwirq & MSI_IBS_MASK) << msi->srs_shift;
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
 
 struct fsl_msi_feature {
@@ -72,7 +118,7 @@ static void fsl_msi_print_chip(struct irq_data *irqd, struct seq_file *p)
 	irq_hw_number_t hwirq = irqd_to_hwirq(irqd);
 	int cascade_virq, srs;
 
-	srs = (hwirq >> msi_data->srs_shift) & MSI_SRS_MASK;
+	srs = hwirq_to_srs(msi_data, hwirq);
 	cascade_virq = msi_data->cascade_array[srs]->virq;
 
 	seq_printf(p, "fsl-msi-%d", cascade_virq);
@@ -107,8 +153,9 @@ static const struct irq_domain_ops fsl_msi_host_ops = {
 static int fsl_msi_init_allocator(struct fsl_msi *msi_data)
 {
 	int rc, hwirq;
+	int num_irqs = msi_data->nr_msi_regs * IRQS_PER_MSI_REG;
 
-	rc = msi_bitmap_alloc(&msi_data->bitmap, NR_MSI_IRQS_MAX,
+	rc = msi_bitmap_alloc(&msi_data->bitmap, num_irqs,
 			      irq_domain_get_of_node(msi_data->irqhost));
 	if (rc)
 		return rc;
@@ -117,7 +164,7 @@ static int fsl_msi_init_allocator(struct fsl_msi *msi_data)
 	 * Reserve all the hwirqs
 	 * The available hwirqs will be released in fsl_msi_setup_hwirq()
 	 */
-	for (hwirq = 0; hwirq < NR_MSI_IRQS_MAX; hwirq++)
+	for (hwirq = 0; hwirq < num_irqs; hwirq++)
 		msi_bitmap_reserve_hwirq(&msi_data->bitmap, hwirq);
 
 	return 0;
@@ -172,7 +219,7 @@ static void fsl_compose_msi_msg(struct pci_dev *pdev, int hwirq,
 		msg->data = hwirq;
 
 	pr_debug("%s: allocated srs: %d, ibs: %d\n", __func__,
-		 (hwirq >> msi_data->srs_shift) & MSI_SRS_MASK,
+		 hwirq_to_srs(msi_data, hwirq),
 		 (hwirq >> msi_data->ibs_shift) & MSI_IBS_MASK);
 }
 
@@ -308,8 +355,8 @@ static irqreturn_t fsl_msi_cascade(int irq, void *data)
 		intr_index = ffs(msir_value) - 1;
 
 		err = generic_handle_domain_irq(msi_data->irqhost,
-				msi_hwirq(msi_data, msir_index,
-					  intr_index + have_shift));
+				msi_to_hwirq(msi_data, msir_index,
+					     intr_index + have_shift));
 		if (!err)
 			ret = IRQ_HANDLED;
 
@@ -384,7 +431,7 @@ static int fsl_msi_setup_hwirq(struct fsl_msi *msi, struct platform_device *dev,
 	/* Release the hwirqs corresponding to this MSI register */
 	for (i = 0; i < IRQS_PER_MSI_REG; i++)
 		msi_bitmap_free_hwirqs(&msi->bitmap,
-				       msi_hwirq(msi, offset, i), 1);
+				       msi_to_hwirq(msi, offset, i), 1);
 
 	return 0;
 }
@@ -412,7 +459,8 @@ static int fsl_of_msi_probe(struct platform_device *dev)
 	}
 	platform_set_drvdata(dev, msi);
 
-	msi->irqhost = irq_domain_create_linear(dev_fwnode(&dev->dev), NR_MSI_IRQS_MAX,
+	msi->irqhost = irq_domain_create_linear(dev_fwnode(&dev->dev),
+						msi->nr_msi_regs * IRQS_PER_MSI_REG,
 						&fsl_msi_host_ops, msi);
 	if (msi->irqhost == NULL) {
 		dev_err(&dev->dev, "No memory for MSI irqhost\n");
diff --git a/arch/powerpc/sysdev/fsl_msi.h b/arch/powerpc/sysdev/fsl_msi.h
index e2a1bfc7c23777f72f51486ee02284d92d56e1e2..0515030af9acb965c0b5db68d5655004777f4344 100644
--- a/arch/powerpc/sysdev/fsl_msi.h
+++ b/arch/powerpc/sysdev/fsl_msi.h
@@ -15,7 +15,6 @@
 #define NR_MSI_REG_MSIIR1	16 /* MSIIR1 can index 16 MSI registers */
 #define NR_MSI_REG_MAX		NR_MSI_REG_MSIIR1
 #define IRQS_PER_MSI_REG	32
-#define NR_MSI_IRQS_MAX	(NR_MSI_REG_MAX * IRQS_PER_MSI_REG)
 
 #define FSL_PIC_IP_MASK   0x0000000F
 #define FSL_PIC_IP_MPIC   0x00000001
@@ -32,11 +31,13 @@ struct fsl_msi {
 	unsigned long cascade_irq;
 
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
 
 	struct msi_bitmap bitmap;
 

---
base-commit: 9b332cece987ee1790b2ed4c989e28162fa47860
change-id: 20251015-fsl_msi_bitmap_translate-0761bf4d8ef2

Best regards,
-- 
Ben Collins <ben.collins@linux.dev>


