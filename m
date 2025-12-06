Return-Path: <linuxppc-dev+bounces-14672-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C250CAA8A9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 06 Dec 2025 15:39:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNrVK5zwqz2xpl;
	Sun, 07 Dec 2025 01:39:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765031961;
	cv=none; b=VwfG7RG0L+uia8DeQppYZJoWFipBMmc5f3rXSC87b9yZ+USKVjx4YorNPLLC9CLPJpSjEXITSqTGTMk2s33p3B2OggOcDy3/kIS2JMmTUsyReRkxKxnvm+0mIgkSSLwjqm/BrexgEMP9iqMXxCulrFusYei96vt2p+gB8VNCJvBfNPz420JXLlZyULhtubDwAyU0JIIQ0R5ZOM7TekL6zXmsef/73RM33Ja1Sb+Kgo7Vml0IdMrhnwMJJFhDz6WqDwMbBsYvrvcrfq93ncVPQYrETgZjSuUxLZ6lrcba5wAWoWIK+jLmq79wYSvCPdHXd/A/+E9cNsDKraHfC/M6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765031961; c=relaxed/relaxed;
	bh=EggVBhQVxr4sw5CIp1bFASO3vEsWBXTPAXy9MI/s5eI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NkMJlEE9SaWdIw90udZLqALazsSu2gMxVK2mv1xYB0kTQ19wqRHBotAIHFX9uj8bo7BxhwckRutU5Jkeag869r/gcAOTWlX/qpbtAQFJeV3yo4mLHzRAlwPOehET7b3cTcJ99WLkfByQMSpXaAp0Iyn+FuUTNOj79hd/PZwjKQ69ktqZ9dB1v3tO+gU1QV7J9b38sJdjYxPVyR1s2/NS9EcZCOc0zQe7f25jqZjkzKPGoaE4cz62DxaZIMILguoH1MJopofg+VBrmYUt1xiITAS2Rjn/0Ak5rh8MRkz/7eIU4Knlhf88XxxLz7gUAamunMNT2qZ9AVJ0CkLcvlS6SQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ugF5ZRVi; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=q+vECNFo; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ugF5ZRVi;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=q+vECNFo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNrVH138dz2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Dec 2025 01:39:19 +1100 (AEDT)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1765031938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EggVBhQVxr4sw5CIp1bFASO3vEsWBXTPAXy9MI/s5eI=;
	b=ugF5ZRViUhrj+hM4jZ6Njmm1VIzrK/SAqbJ0nSbSJnj9HY2kcGyVFQSTyD5ZNPshS5S7q/
	6T7S5BteirJBQ6sN67Et2NQ5nMDu52fmrnmADKhzem/jj40OC1I0XhGQASpfnUPc9hEAyG
	tnCZ6wX4GQWXtFzk+PJnrmYZuXL9WrYvfEeE5+ahoxihjlbfH3hulBpIy+XTOFqpKyJhh2
	GA0M7auanj846Sum5O1gBULcHxj2wice0FUZEaCYALhtFBdVhhN+1opCOcnCz/ihRCkSYR
	bMLgz98qdcUwOaxY099dBfNEXLICQl3G8jTOtIDstgTHwu7x8OEWZGF704t3Ig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1765031938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EggVBhQVxr4sw5CIp1bFASO3vEsWBXTPAXy9MI/s5eI=;
	b=q+vECNFoeflg8tmIPJEKZSEti6baZZYjstytbwCY2A/OlQTqbKOjuEhaDDom+ynw/qA73N
	Rj+A7PrqBre9ILBQ==
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de,
 maz@kernel.org, gautam@linux.ibm.com, Gregory Joyce <gjoyce@ibm.com>
Subject: Re: [bug report] powerpc: per device MSI irq domain
In-Reply-To: <f82d1224-509f-446c-8dee-13e28429b52b@linux.ibm.com>
References: <6af2c4c2-97f6-4758-be33-256638ef39e5@linux.ibm.com>
 <87qztawmiv.fsf@yellow.woof>
 <f82d1224-509f-446c-8dee-13e28429b52b@linux.ibm.com>
Date: Sat, 06 Dec 2025 15:38:56 +0100
Message-ID: <87jyyzisjj.fsf@yellow.woof>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Nilay Shroff <nilay@linux.ibm.com> writes:
> Yes you can find the architecture document here: 
> https://github.com/linuxppc/public-docs/blob/main/LoPAPR/LoPAR-20200812.pdf
>
> You may refer section 7 in the above document, which describes RTAS API.

Thank you, that helped a lot.

Can you please confirm that the below diff fixes the problem? It brings
back the "fallback" thing that you mentioned.

Best regards,
Nam

diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index a82aaa786e9e..8898a968a59b 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -19,6 +19,11 @@
 
 #include "pseries.h"
 
+struct pseries_msi_device {
+	unsigned int msi_quota;
+	unsigned int msi_used;
+};
+
 static int query_token, change_token;
 
 #define RTAS_QUERY_FN		0
@@ -433,8 +438,26 @@ static int pseries_msi_ops_prepare(struct irq_domain *domain, struct device *dev
 	struct msi_domain_info *info = domain->host_data;
 	struct pci_dev *pdev = to_pci_dev(dev);
 	int type = (info->flags & MSI_FLAG_PCI_MSIX) ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MSI;
+	int ret;
+
+	struct pseries_msi_device *pseries_dev __free(kfree)
+		= kmalloc(sizeof(*pseries_dev), GFP_KERNEL);
+	if (!pseries_dev)
+		return -ENOMEM;
+
+	ret = rtas_prepare_msi_irqs(pdev, nvec, type, arg);
+	if (ret > 0) {
+		nvec = ret;
+		ret = rtas_prepare_msi_irqs(pdev, nvec, type, arg);
+	}
+	if (ret < 0)
+		return ret;
 
-	return rtas_prepare_msi_irqs(pdev, nvec, type, arg);
+	pseries_dev->msi_quota = nvec;
+	pseries_dev->msi_used = 0;
+
+	arg->scratchpad[0].ptr = no_free_ptr(pseries_dev);
+	return 0;
 }
 
 /*
@@ -443,9 +466,13 @@ static int pseries_msi_ops_prepare(struct irq_domain *domain, struct device *dev
  */
 static void pseries_msi_ops_teardown(struct irq_domain *domain, msi_alloc_info_t *arg)
 {
+	struct pseries_msi_device *pseries_dev = arg->scratchpad[0].ptr;
 	struct pci_dev *pdev = to_pci_dev(domain->dev);
 
 	rtas_disable_msi(pdev);
+
+	WARN_ON(pseries_dev->msi_used);
+	kfree(pseries_dev);
 }
 
 static void pseries_msi_shutdown(struct irq_data *d)
@@ -546,12 +573,18 @@ static int pseries_irq_domain_alloc(struct irq_domain *domain, unsigned int virq
 				    unsigned int nr_irqs, void *arg)
 {
 	struct pci_controller *phb = domain->host_data;
+	struct pseries_msi_device *pseries_dev;
 	msi_alloc_info_t *info = arg;
 	struct msi_desc *desc = info->desc;
 	struct pci_dev *pdev = msi_desc_to_pci_dev(desc);
 	int hwirq;
 	int i, ret;
 
+	pseries_dev = info->scratchpad[0].ptr;
+
+	if (pseries_dev->msi_used + nr_irqs > pseries_dev->msi_quota)
+		return -ENOSPC;
+
 	hwirq = rtas_query_irq_number(pci_get_pdn(pdev), desc->msi_index);
 	if (hwirq < 0) {
 		dev_err(&pdev->dev, "Failed to query HW IRQ: %d\n", hwirq);
@@ -567,9 +600,10 @@ static int pseries_irq_domain_alloc(struct irq_domain *domain, unsigned int virq
 			goto out;
 
 		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
-					      &pseries_msi_irq_chip, domain->host_data);
+					      &pseries_msi_irq_chip, pseries_dev);
 	}
 
+	pseries_dev->msi_used++;
 	return 0;
 
 out:
@@ -582,9 +616,11 @@ static void pseries_irq_domain_free(struct irq_domain *domain, unsigned int virq
 				    unsigned int nr_irqs)
 {
 	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
-	struct pci_controller *phb = irq_data_get_irq_chip_data(d);
+	struct pseries_msi_device *pseries_dev = irq_data_get_irq_chip_data(d);
+	struct pci_controller *phb = domain->host_data;
 
 	pr_debug("%s bridge %pOF %d #%d\n", __func__, phb->dn, virq, nr_irqs);
+	pseries_dev->msi_used -= nr_irqs;
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
 

