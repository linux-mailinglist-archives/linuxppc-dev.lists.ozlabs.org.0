Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEE72C31B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 21:08:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgZpd25NFzDqfD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 07:08:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=MMucw70O; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=MMucw70O; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgZhk2nQmzDqB0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 07:03:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606248211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pruzrQouk9MyD9Ysfhx+ZPTNO+LhkPA5Pe+NxzsDRfw=;
 b=MMucw70O3zkF8z3TLv/ZaUnlQc+TmfVb8+DJbYMiPXI6Jz14qBVYMeeu3cAMwQb05ieJxg
 kiRQEDocN8Lv1ewXQ4On/8txuWBSwmEL57a4I2hSP/RGQ5I9GGmKE+CUVhDDJxYJWTJrBU
 BnwkYDSgumFdKCrrZFNPxQe4rta6Wdo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606248211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pruzrQouk9MyD9Ysfhx+ZPTNO+LhkPA5Pe+NxzsDRfw=;
 b=MMucw70O3zkF8z3TLv/ZaUnlQc+TmfVb8+DJbYMiPXI6Jz14qBVYMeeu3cAMwQb05ieJxg
 kiRQEDocN8Lv1ewXQ4On/8txuWBSwmEL57a4I2hSP/RGQ5I9GGmKE+CUVhDDJxYJWTJrBU
 BnwkYDSgumFdKCrrZFNPxQe4rta6Wdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-7YeQ_o1APmq2yKrCeuY72A-1; Tue, 24 Nov 2020 15:03:27 -0500
X-MC-Unique: 7YeQ_o1APmq2yKrCeuY72A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50C79107AD89;
 Tue, 24 Nov 2020 20:03:25 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E5D15D6AB;
 Tue, 24 Nov 2020 20:03:21 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] powerpc/pseries: pass MSI affinity to irq_create_mapping()
Date: Tue, 24 Nov 2020 21:03:08 +0100
Message-Id: <20201124200308.1110744-3-lvivier@redhat.com>
In-Reply-To: <20201124200308.1110744-1-lvivier@redhat.com>
References: <20201124200308.1110744-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Laurent Vivier <lvivier@redhat.com>, Marc Zyngier <maz@kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 linux-block@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With virtio multiqueue, normally each queue IRQ is mapped to a CPU.

But since commit 0d9f0a52c8b9f ("virtio_scsi: use virtio IRQ affinity")
this is broken on pseries.

The affinity is correctly computed in msi_desc but this is not applied
to the system IRQs.

It appears the affinity is correctly passed to rtas_setup_msi_irqs() but
lost at this point and never passed to irq_domain_alloc_descs()
(see commit 06ee6d571f0e ("genirq: Add affinity hint to irq allocation"))
because irq_create_mapping() doesn't take an affinity parameter.

As the previous patch has added the affinity parameter to
irq_create_mapping() we can forward the affinity from rtas_setup_msi_irqs()
to irq_domain_alloc_descs().

With this change, the virtqueues are correctly dispatched between the CPUs
on pseries.

This problem cannot be shown on x86_64 for two reasons:

- the call path traverses arch_setup_msi_irqs() that is arch specific:

   virtscsi_probe()
      virtscsi_init()
         vp_modern_find_vqs()
            vp_find_vqs()
               vp_find_vqs_msix()
                  pci_alloc_irq_vectors_affinity()
                     __pci_enable_msix_range()
                        pci_msi_setup_msi_irqs()
                           arch_setup_msi_irqs()
                              rtas_setup_msi_irqs()
                                 irq_create_mapping()
                                    irq_domain_alloc_descs()
                                      __irq_alloc_descs()

- and x86_64 has CONFIG_PCI_MSI_IRQ_DOMAIN that uses another path:

   virtscsi_probe()
      virtscsi_init()
         vp_modern_find_vqs()
            vp_find_vqs()
               vp_find_vqs_msix()
                  pci_alloc_irq_vectors_affinity()
                     __pci_enable_msix_range()
                        __msi_domain_alloc_irqs()
                           __irq_domain_alloc_irqs()
                              __irq_alloc_descs()

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 arch/powerpc/platforms/pseries/msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index 42ba08eaea91..58197f92c6a2 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -458,7 +458,7 @@ static int rtas_setup_msi_irqs(struct pci_dev *pdev, int nvec_in, int type)
 			return hwirq;
 		}
 
-		virq = irq_create_mapping(NULL, hwirq, NULL);
+		virq = irq_create_mapping(NULL, hwirq, entry->affinity);
 
 		if (!virq) {
 			pr_debug("rtas_msi: Failed mapping hwirq %d\n", hwirq);
-- 
2.28.0

