Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98497625C49
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:03:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N80m72nffz3fBh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:03:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bhdG0eo2;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CdnfXWBv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bhdG0eo2;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CdnfXWBv;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80hG0bWDz3cMb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 00:59:58 +1100 (AEDT)
Message-ID: <20221111122014.120489922@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=uAK7e6YKYfE3NKk9044qCaJfhx6qFWH6i8PscALcCkU=;
	b=bhdG0eo2d5cR5NUOFj3Ienrsw5VPaTNHp3Q9tmXe+N2uBx5Zp/1epSUs7hD/C0G7eLrHaV
	+C8SctVO+X4BrGfCIZMTE0ojXzDO8B42XGVZas3NbDPd0Q/HPETWT9XKnO9F2VmwX6OV9S
	V668vy8p1CUipfcobFboZ4vTtAxDWK63IStDKwrOKRaBdhZFOak3Blp+nwAEE7pjT3xpcw
	ZLBLGCh74g5FftekR3u7YTxhlQ16TIYo++JJjAD0y7eaEOF/5GUbQq9RCpuQSBLyXzaAzV
	C/+4MDauiberZ+DV2mcdIIvqMMOnfOqSzRFvFsw2nuyv9tz7FHZ0r4CKPbYqkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=uAK7e6YKYfE3NKk9044qCaJfhx6qFWH6i8PscALcCkU=;
	b=CdnfXWBvUOFJUQvenC/sG/RoCl0EBsTovXNlHbcYl5w55OTi8OHqj96pgDXVqDNddziMC5
	Q0FyhLFGFQVlnUCw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject:  [patch 09/39] powerpc/pseries/msi: Use msi_domain_ops::msi_post_free()
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:28 +0100 (CET)
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the new msi_post_free() callback which is invoked after the interrupts
have been freed to tell the hypervisor about the shutdown.

This allows to remove the exposure of __msi_domain_free_irqs().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/pseries/msi.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -447,21 +447,18 @@ static void pseries_msi_ops_msi_free(str
  * RTAS can not disable one MSI at a time. It's all or nothing. Do it
  * at the end after all IRQs have been freed.
  */
-static void pseries_msi_domain_free_irqs(struct irq_domain *domain,
-					 struct device *dev)
+static void pseries_msi_post_free(struct irq_domain *domain, struct device *dev)
 {
 	if (WARN_ON_ONCE(!dev_is_pci(dev)))
 		return;
 
-	__msi_domain_free_irqs(domain, dev);
-
 	rtas_disable_msi(to_pci_dev(dev));
 }
 
 static struct msi_domain_ops pseries_pci_msi_domain_ops = {
 	.msi_prepare	= pseries_msi_ops_prepare,
 	.msi_free	= pseries_msi_ops_msi_free,
-	.domain_free_irqs = pseries_msi_domain_free_irqs,
+	.msi_post_free	= pseries_msi_post_free,
 };
 
 static void pseries_msi_shutdown(struct irq_data *d)

