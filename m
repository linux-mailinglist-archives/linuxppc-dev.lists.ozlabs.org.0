Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 947912C42C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:23:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch4QZ3rTrzDqrm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 02:23:02 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=e8zxovo7; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=e8zxovo7; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch47d5RGvzDqjp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 02:10:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606317000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYWk5jzHxLGFoIevTIg8NOOjqLX1QGlqnK2/2OZh2eA=;
 b=e8zxovo7rbySwpy4Wx2uWfuUNCMB6UnMGomg37VuZBC8+Egc6Oy6JGcy2HMpUpt6HJrAoB
 GwzrBX9rtuKTxYh9slwfLy7Bgu+VYuBlU8b5be7Mk5Xoy08LqGWQIlV/aAiw5M4FZOpNPU
 /ZdKed8jJZ3SLH9lePWjcniMKJh4uE0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606317000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYWk5jzHxLGFoIevTIg8NOOjqLX1QGlqnK2/2OZh2eA=;
 b=e8zxovo7rbySwpy4Wx2uWfuUNCMB6UnMGomg37VuZBC8+Egc6Oy6JGcy2HMpUpt6HJrAoB
 GwzrBX9rtuKTxYh9slwfLy7Bgu+VYuBlU8b5be7Mk5Xoy08LqGWQIlV/aAiw5M4FZOpNPU
 /ZdKed8jJZ3SLH9lePWjcniMKJh4uE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-j_iamyF2NrOLaaCW_Q-iNg-1; Wed, 25 Nov 2020 10:09:44 -0500
X-MC-Unique: j_iamyF2NrOLaaCW_Q-iNg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A49F2107AFA5;
 Wed, 25 Nov 2020 15:09:42 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7285B5C1A3;
 Wed, 25 Nov 2020 15:09:39 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] genirq/irqdomain: Add an irq_create_mapping_affinity()
 function
Date: Wed, 25 Nov 2020 16:09:31 +0100
Message-Id: <20201125150932.1150619-2-lvivier@redhat.com>
In-Reply-To: <20201125150932.1150619-1-lvivier@redhat.com>
References: <20201125150932.1150619-1-lvivier@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Marc Zyngier <maz@kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 Greg Kurz <groug@kaod.org>, linux-block@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is currently no way to convey the affinity of an interrupt
via irq_create_mapping(), which creates issues for devices that
expect that affinity to be managed by the kernel.

In order to sort this out, rename irq_create_mapping() to
irq_create_mapping_affinity() with an additional affinity parameter
that can conveniently passed down to irq_domain_alloc_descs().

irq_create_mapping() is then re-implemented as a wrapper around
irq_create_mapping_affinity().

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 include/linux/irqdomain.h | 12 ++++++++++--
 kernel/irq/irqdomain.c    | 13 ++++++++-----
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 71535e87109f..ea5a337e0f8b 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -384,11 +384,19 @@ extern void irq_domain_associate_many(struct irq_domain *domain,
 extern void irq_domain_disassociate(struct irq_domain *domain,
 				    unsigned int irq);
 
-extern unsigned int irq_create_mapping(struct irq_domain *host,
-				       irq_hw_number_t hwirq);
+extern unsigned int irq_create_mapping_affinity(struct irq_domain *host,
+				      irq_hw_number_t hwirq,
+				      const struct irq_affinity_desc *affinity);
 extern unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec);
 extern void irq_dispose_mapping(unsigned int virq);
 
+static inline unsigned int irq_create_mapping(struct irq_domain *host,
+					      irq_hw_number_t hwirq)
+{
+	return irq_create_mapping_affinity(host, hwirq, NULL);
+}
+
+
 /**
  * irq_linear_revmap() - Find a linux irq from a hw irq number.
  * @domain: domain owning this hardware interrupt
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index cf8b374b892d..e4ca69608f3b 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -624,17 +624,19 @@ unsigned int irq_create_direct_mapping(struct irq_domain *domain)
 EXPORT_SYMBOL_GPL(irq_create_direct_mapping);
 
 /**
- * irq_create_mapping() - Map a hardware interrupt into linux irq space
+ * irq_create_mapping_affinity() - Map a hardware interrupt into linux irq space
  * @domain: domain owning this hardware interrupt or NULL for default domain
  * @hwirq: hardware irq number in that domain space
+ * @affinity: irq affinity
  *
  * Only one mapping per hardware interrupt is permitted. Returns a linux
  * irq number.
  * If the sense/trigger is to be specified, set_irq_type() should be called
  * on the number returned from that call.
  */
-unsigned int irq_create_mapping(struct irq_domain *domain,
-				irq_hw_number_t hwirq)
+unsigned int irq_create_mapping_affinity(struct irq_domain *domain,
+				       irq_hw_number_t hwirq,
+				       const struct irq_affinity_desc *affinity)
 {
 	struct device_node *of_node;
 	int virq;
@@ -660,7 +662,8 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
 	}
 
 	/* Allocate a virtual interrupt number */
-	virq = irq_domain_alloc_descs(-1, 1, hwirq, of_node_to_nid(of_node), NULL);
+	virq = irq_domain_alloc_descs(-1, 1, hwirq, of_node_to_nid(of_node),
+				      affinity);
 	if (virq <= 0) {
 		pr_debug("-> virq allocation failed\n");
 		return 0;
@@ -676,7 +679,7 @@ unsigned int irq_create_mapping(struct irq_domain *domain,
 
 	return virq;
 }
-EXPORT_SYMBOL_GPL(irq_create_mapping);
+EXPORT_SYMBOL_GPL(irq_create_mapping_affinity);
 
 /**
  * irq_create_strict_mappings() - Map a range of hw irqs to fixed linux irqs
-- 
2.28.0

