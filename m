Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DA46A7602
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 22:15:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRn7x4ctKz3cMS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 08:15:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1drUTVAX;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5Ajx6tsc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1drUTVAX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=5Ajx6tsc;
	dkim-atps=neutral
X-Greylist: delayed 394 seconds by postgrey-1.36 at boromir; Thu, 02 Mar 2023 08:14:37 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRn710cDCz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 08:14:36 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1677704869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B374OxTzVS9QcjckHvkiwhr+6E3lqWByqJOzxF2qGow=;
	b=1drUTVAXKqngwe09WrmIidH/RzxI6ZIGMbKPz/8rOfWchpWKji8v3Sd9k/iiJSrrs0Iqav
	rbrDSJRayQwz/HBJVgZWfK4WdTEZ9ZLJ36vYw81BaHEcJEbQQ8FnZ8/CjwLJi1YHx0fioe
	FpS8swwObQDVsKoiMAY6dQv8F4JwaAZjs4QrDFdNznCDcVxVD5LRWiE6z7+xGAYA2bVXj7
	S9Jyrmmiu+gesDGg71KvcSeCYWfjOwaACVFvCfUsv2R1Flux+bdkbfqUQqSI/G1XHmq0uW
	WXlWEHaA477XPYFtRUjNP8uOeSKbkX7NXdZQuCu18GBZIlqT7qUEnWqh6749wQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1677704869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B374OxTzVS9QcjckHvkiwhr+6E3lqWByqJOzxF2qGow=;
	b=5Ajx6tscPHnH64xp+028YR2a9czj6LIZcEPYMzh0ULXNf96J2x0Dqr24aGYiU87iLVJuBC
	Ka5YEgQGUGeS9VBg==
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [patch 05/39] genirq/msi: Remove filter from
 msi_free_descs_free_range()
In-Reply-To: <20230301115530.5ccea5ae@xps-13>
References: <20221111120501.026511281@linutronix.de>
 <20221111122013.888850936@linutronix.de> <20230301115530.5ccea5ae@xps-13>
Date: Wed, 01 Mar 2023 22:07:48 +0100
Message-ID: <87mt4wkwnv.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-pci@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed
 S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Miquel!

On Wed, Mar 01 2023 at 11:55, Miquel Raynal wrote:
> tglx@linutronix.de wrote on Fri, 11 Nov 2022 14:54:22 +0100 (CET):
>
>> When a range of descriptors is freed then all of them are not associated to
>> a linux interrupt. Remove the filter and add a warning to the free function.
>> +		/* Leak the descriptor when it is still referenced */
>> +		if (WARN_ON_ONCE(msi_desc_match(desc, MSI_DESC_ASSOCIATED)))
>> +			continue;
>> +		msi_free_desc(desc);
>>  	}
>>  }
>
> It looks like since this commit I am getting warnings upon EPROBE_DEFER
> errors in the mvpp2 Marvell Ethernet driver. I looked a bit at the
> internals to understand why this warning was shown, and it seems that
> nothing "de-references" the descriptors, which would mean here:
> resetting desc->irq to 0.

Correct. This platform-msi ^(*&!@&^ hack really needs to die ASAP.

Marc, where are we on that? Is this still in limbo?

> I am wondering how useful thisd WARN_ON() is, or otherwise where the

It is useful as it caught bugs already.

> desc->irq entry should be zeroed (if I understand that correctly), any
> help will be appreciated.

Untested workaround below. I hate it with a passion, but *shrug*.

Thanks,

        tglx
---
 drivers/base/platform-msi.c |    1 +
 include/linux/msi.h         |    2 ++
 kernel/irq/msi.c            |   23 ++++++++++++++++++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -324,6 +324,7 @@ void platform_msi_device_domain_free(str
 	struct platform_msi_priv_data *data = domain->host_data;
 
 	msi_lock_descs(data->dev);
+	msi_domain_depopulate_descs(data->dev, virq, nr_irqs);
 	irq_domain_free_irqs_common(domain, virq, nr_irqs);
 	msi_free_msi_descs_range(data->dev, virq, virq + nr_irqs - 1);
 	msi_unlock_descs(data->dev);
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -631,6 +631,8 @@ int msi_domain_prepare_irqs(struct irq_d
 			    int nvec, msi_alloc_info_t *args);
 int msi_domain_populate_irqs(struct irq_domain *domain, struct device *dev,
 			     int virq, int nvec, msi_alloc_info_t *args);
+void msi_domain_depopulate_descs(struct device *dev, int virq, int nvec);
+
 struct irq_domain *
 __platform_msi_create_device_domain(struct device *dev,
 				    unsigned int nvec,
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1109,14 +1109,35 @@ int msi_domain_populate_irqs(struct irq_
 	return 0;
 
 fail:
-	for (--virq; virq >= virq_base; virq--)
+	for (--virq; virq >= virq_base; virq--) {
+		msi_domain_depopulate_descs(dev, virq, 1);
 		irq_domain_free_irqs_common(domain, virq, 1);
+	}
 	msi_domain_free_descs(dev, &ctrl);
 unlock:
 	msi_unlock_descs(dev);
 	return ret;
 }
 
+void msi_domain_depopulate_descs(struct device *dev, int virq_base, int nvec)
+{
+	struct msi_ctrl ctrl = {
+		.domid	= MSI_DEFAULT_DOMAIN,
+		.first  = virq_base,
+		.last	= virq_base + nvec - 1,
+	};
+	struct msi_desc *desc;
+	struct xarray *xa;
+	unsigned long idx;
+
+	if (!msi_ctrl_valid(dev, &ctrl))
+		return;
+
+	xa = &dev->msi.data->__domains[ctrl.domid].store;
+	xa_for_each_range(xa, idx, desc, ctrl.first, ctrl.last)
+		desc->irq = 0;
+}
+
 /*
  * Carefully check whether the device can use reservation mode. If
  * reservation mode is enabled then the early activation will assign a
