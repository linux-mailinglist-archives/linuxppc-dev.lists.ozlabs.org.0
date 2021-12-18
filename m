Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6C9479A4A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 11:26:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JGMSk52ltz3cQS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 21:25:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tn5AlMpl;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rrfck+zS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=tn5AlMpl; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=rrfck+zS; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JGMS04SMhz2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 21:25:20 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639823115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nl4ddDnB1oKo0fcoNLd0K0Xuyht31044PvDVab+sRz0=;
 b=tn5AlMplZSyHPZ4eu4NMTH2tosi8XfO1/mNklSs+ImTlR8P5gfKJgKJLi6NJ4TFAklevD0
 1avFcMo8k3hGWDd1Iy/rc1ZPeM7eACV1BbuVnX4QY/eXDhd48j/Sh4CvcSDSL9IbisUp7z
 caDqaSpU9ud+i2NkshpSak1RSaSSAW8O+tSdpPZC1vhiTXp+kGqQePG8eL1c519ZMa10bj
 4A/PikhGc/SgM12CbM14omQUZtwMCPY58ymXGe2D8aFAWliD8DPNhbbTAoxPao+HsDqHhF
 X3Af3aTvpYn3Z94vxqiwZNOhBtC+RdSsTPCSCauo8T9TOXtM5vssh7kfd7kvGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639823115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nl4ddDnB1oKo0fcoNLd0K0Xuyht31044PvDVab+sRz0=;
 b=rrfck+zS5tliLA0jRIoJ5g0PCCswYFJD7whCSlQHRXayW7rMo7mOMzACWAo8/AkVTaI5km
 I03oaHuan7mQiiAA==
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
In-Reply-To: <Yb0PaCyo/6z3XOlf@archlinux-ax161>
References: <20211210221642.869015045@linutronix.de>
 <20211210221814.900929381@linutronix.de>
 <Yb0PaCyo/6z3XOlf@archlinux-ax161>
Date: Sat, 18 Dec 2021 11:25:14 +0100
Message-ID: <87v8zm9pmd.ffs@tglx>
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
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, Will Deacon <will@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 iommu@lists.linux-foundation.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Megha Dey <megha.dey@intel.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Marc Zygnier <maz@kernel.org>, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 17 2021 at 15:30, Nathan Chancellor wrote:
> On Fri, Dec 10, 2021 at 11:19:26PM +0100, Thomas Gleixner wrote:
> I just bisected a boot failure on my AMD test desktop to this patch as
> commit f48235900182 ("PCI/MSI: Simplify pci_irq_get_affinity()") in
> -next. It looks like there is a problem with the NVMe drive after this
> change according to the logs. Given that the hard drive is not getting
> mounted for journald to write logs to, I am not really sure how to get
> them from the machine so I have at least taken a picture of what I see
> on my screen; open to ideas on that front!

Bah. Fix below.

Thanks,

        tglx
---
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 71802410e2ab..9b4910befeda 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -1100,7 +1100,7 @@ EXPORT_SYMBOL(pci_irq_vector);
  */
 const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
 {
-	int irq = pci_irq_vector(dev, nr);
+	int idx, irq = pci_irq_vector(dev, nr);
 	struct msi_desc *desc;
 
 	if (WARN_ON_ONCE(irq <= 0))
@@ -1113,7 +1113,10 @@ const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
 
 	if (WARN_ON_ONCE(!desc->affinity))
 		return NULL;
-	return &desc->affinity[nr].mask;
+
+	/* MSI has a mask array in the descriptor. */
+	idx = dev->msi_enabled ? nr : 0;
+	return &desc->affinity[idx].mask;
 }
 EXPORT_SYMBOL(pci_irq_get_affinity);
 

