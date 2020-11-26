Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 299512C5072
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 09:34:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChWJg07CMzDrFF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 19:34:27 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=aR+B/7r3; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=aR+B/7r3; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChWBk6jyDzDr7W
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 19:29:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606379356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=saFRkzBjwNYVIzOFQ9gg9qkqgMtu8TL9hGt5bH7Do50=;
 b=aR+B/7r32ZVIZhDr+vW0B2ndFE/5pLs6Hpr0Qk7vT0eSOl+FKFrU0XCCuk/YA8BQKYgh2j
 0r0rvX61p5j/Y93eSqasd6lSUDGvxxHJ8qXEV5uYW/8I6o2WnyrRxysM0DnnXHUsVqr+DU
 QnUZ5M/+BGzqWPjLH9NxZTNf0azv4l4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606379356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=saFRkzBjwNYVIzOFQ9gg9qkqgMtu8TL9hGt5bH7Do50=;
 b=aR+B/7r32ZVIZhDr+vW0B2ndFE/5pLs6Hpr0Qk7vT0eSOl+FKFrU0XCCuk/YA8BQKYgh2j
 0r0rvX61p5j/Y93eSqasd6lSUDGvxxHJ8qXEV5uYW/8I6o2WnyrRxysM0DnnXHUsVqr+DU
 QnUZ5M/+BGzqWPjLH9NxZTNf0azv4l4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-TcFidZI_MIehiIoxx3YsYg-1; Thu, 26 Nov 2020 03:29:12 -0500
X-MC-Unique: TcFidZI_MIehiIoxx3YsYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C36AA10151E7;
 Thu, 26 Nov 2020 08:29:10 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 066E45C1B4;
 Thu, 26 Nov 2020 08:29:07 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] powerpc/pseries: Pass MSI affinity to
 irq_create_mapping()
Date: Thu, 26 Nov 2020 09:28:52 +0100
Message-Id: <20201126082852.1178497-3-lvivier@redhat.com>
In-Reply-To: <20201126082852.1178497-1-lvivier@redhat.com>
References: <20201126082852.1178497-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 linux-pci@vger.kernel.org, Greg Kurz <groug@kaod.org>,
 linux-block@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With virtio multiqueue, normally each queue IRQ is mapped to a CPU.

Commit 0d9f0a52c8b9f ("virtio_scsi: use virtio IRQ affinity") exposed
an existing shortcoming of the arch code by moving virtio_scsi to
the automatic IRQ affinity assignment.

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

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pseries/msi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index 133f6adcb39c..b3ac2455faad 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -458,7 +458,8 @@ static int rtas_setup_msi_irqs(struct pci_dev *pdev, int nvec_in, int type)
 			return hwirq;
 		}
 
-		virq = irq_create_mapping(NULL, hwirq);
+		virq = irq_create_mapping_affinity(NULL, hwirq,
+						   entry->affinity);
 
 		if (!virq) {
 			pr_debug("rtas_msi: Failed mapping hwirq %d\n", hwirq);
-- 
2.28.0

