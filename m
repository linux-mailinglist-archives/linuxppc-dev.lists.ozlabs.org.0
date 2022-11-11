Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 165B4625C33
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:02:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N80l6705mz3f3H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:02:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=whjvZ1hG;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wxPrtb03;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=whjvZ1hG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wxPrtb03;
	dkim-atps=neutral
X-Greylist: delayed 332 seconds by postgrey-1.36 at boromir; Sat, 12 Nov 2022 00:59:58 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80hG0Jg3z3cMM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 00:59:58 +1100 (AEDT)
Message-ID: <20221111122014.063153448@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=pIvr9Rr0WHVjkSJi7bxH/bI9Rim62Flb8AM+4v5YvL4=;
	b=whjvZ1hGnpGUhhkqm9I0JMcNO4qtQO27s2DQH8Oz9beyGWo7DUQsr+41f0+cZiGoF9CSwx
	vy50S9pzw9A2kbFhsoMOktYg78PizaWs9IR3KZshscuyc2m56wjLCpqJFSZBll2eH6V8nU
	MFd9D8/wAHhHSsTq9hOhTwRl6vK+7OlKxNjL0jjqxx5Jpk/xWBNusgl4nofXeNU4sGa2Jp
	4xxBlfu+GgVENgM2JLDzwXreETXKAUYT3oNe/e3Yp7Pby/icgOzh/0FpdMoIZobV0qz8X0
	+eNahDWVvyqLmTEvfdcUV0DxSloKi+SoF3/VjpwVitY04LcMpyXhGyF/Qz4d6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=pIvr9Rr0WHVjkSJi7bxH/bI9Rim62Flb8AM+4v5YvL4=;
	b=wxPrtb03zedDnlK+TXh2gy6+0tXIlW3ThKc+ATDQcqkU5payjRpOO+xzL6leSmWxWqt9sy
	poWzdm2Y5IW7krDQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 08/39] genirq/msi: Provide msi_domain_ops::post_free()
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:27 +0100 (CET)
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

To prepare for removing the exposure of __msi_domain_free_irqs() provide a
post_free() callback in the MSI domain ops which can be used to solve
the problem of the only user of __msi_domain_free_irqs() in arch/powerpc.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |    4 ++++
 kernel/irq/msi.c    |    2 ++
 2 files changed, 6 insertions(+)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -315,6 +315,8 @@ struct msi_domain_info;
  *			function.
  * @domain_free_irqs:	Optional function to override the default free
  *			function.
+ * @msi_post_free:	Optional function which is invoked after freeing
+ *			all interrupts.
  *
  * @get_hwirq, @msi_init and @msi_free are callbacks used by the underlying
  * irqdomain.
@@ -359,6 +361,8 @@ struct msi_domain_ops {
 					     struct device *dev, int nvec);
 	void		(*domain_free_irqs)(struct irq_domain *domain,
 					    struct device *dev);
+	void		(*msi_post_free)(struct irq_domain *domain,
+					 struct device *dev);
 };
 
 /**
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1026,6 +1026,8 @@ void msi_domain_free_irqs_descs_locked(s
 	lockdep_assert_held(&dev->msi.data->mutex);
 
 	ops->domain_free_irqs(domain, dev);
+	if (ops->msi_post_free)
+		ops->msi_post_free(domain, dev);
 	msi_domain_free_msi_descs(info, dev);
 }
 

