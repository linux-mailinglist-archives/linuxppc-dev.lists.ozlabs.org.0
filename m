Return-Path: <linuxppc-dev+bounces-355-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B159F95B7AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 15:57:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqPsP4zDQz2yVt;
	Thu, 22 Aug 2024 23:57:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724331993;
	cv=none; b=F5Dc9l0w558h2uovYhpalykRrs3IIorneD3UXcnpYvwYfZVBonl9+wNPQ712WP7TjuSrw6lPZP8ja3cImNKYPlB4H5hKUYRgMCLXouAvvTTLL+QCDu4lsbvqPnwpWUBgCkoOCFKpBKQKfiWSLAg2EDcEno5r8WeinECpJSzrxskQ/y5Xojzff167lg4BBWD5/LptwwvURDkexU4DWZhHiy/I7FYOInwu6/3hsVapAONM69NntCkkTTY81gIRTJnZ8j1Nmi6uqFI+gKzQO7Qc6pAU/gzFLpU208ZGRQGGdNxtvbtnx8LWI8cdXM0NJq9TGaPtu6btS80gNg8444xmJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724331993; c=relaxed/relaxed;
	bh=8qYevs4zeTkjTfpEhQtmJiHqDtFyobpTT9z2QpZVinc=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=LtyyCkzSbxMlBI+jlmg2j1E4vlPYmAqW0KpBArjVLxzVthSLBySl5mZhofNPYAE+fSyZuEeadjmsrytR+bCVsihEUPMG3R8RIYvk/wT5gdUsFMcYQtlhQyDmSrCkFharvb8IiJYYQ1smIdBcit4zda4HGiWxJJE3T87kGomS8lYifaq7hfCQKS5DERf7Mv2AatH+HTcK0sgawlVB36pvWuRJ70g2TkP01BvoSK4/9mbcjyVWHGcnHxMFxHQ2NebfEcDhUeAo3BrSZCcbasQ2sVV/ZF0Fc/lLaYuxQ05MD62cWit/Mu9f8R3euCuzfaQndk9iJKVKtQ2oz6iwkWq/PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; spf=pass (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqNkd0kx6z2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 23:06:33 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WqNh70f6Rz1xvnJ;
	Thu, 22 Aug 2024 21:04:23 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id C0F491A0170;
	Thu, 22 Aug 2024 21:06:12 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 22 Aug 2024 21:06:12 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <akpm@linux-foundation.org>, <david@redhat.com>,
	<Liam.Howlett@oracle.com>, <tglx@linutronix.de>, <cuigaosheng1@huawei.com>,
	<bgray@linux.ibm.com>, <joel@jms.id.au>, <bhelgaas@google.com>
CC: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH -next 3/4] powerpc: Remove obsoleted declaration for pas_pci_irq_fixup
Date: Thu, 22 Aug 2024 21:06:08 +0800
Message-ID: <20240822130609.786431-4-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822130609.786431-1-cuigaosheng1@huawei.com>
References: <20240822130609.786431-1-cuigaosheng1@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The pas_pci_irq_fixup() have been removed since
commit 771f7404a9de ("pasemi_mac: Move the IRQ mapping from the
PCI layer to the driver"), and now it is useless, so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/powerpc/platforms/pasemi/pasemi.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/pasemi/pasemi.h b/arch/powerpc/platforms/pasemi/pasemi.h
index 018c30665e1b..6f6743b8e48d 100644
--- a/arch/powerpc/platforms/pasemi/pasemi.h
+++ b/arch/powerpc/platforms/pasemi/pasemi.h
@@ -5,7 +5,6 @@
 extern time64_t pas_get_boot_time(void);
 extern void pas_pci_init(void);
 struct pci_dev;
-extern void pas_pci_irq_fixup(struct pci_dev *dev);
 extern void pas_pci_dma_dev_setup(struct pci_dev *dev);
 
 void __iomem *__init pasemi_pci_getcfgaddr(struct pci_dev *dev, int offset);
-- 
2.25.1


