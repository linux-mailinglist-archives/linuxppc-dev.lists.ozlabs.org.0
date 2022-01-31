Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC5F4A5142
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 22:17:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jngr31v8Zz3bc9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 08:17:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KmPtM4Xy;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+0otG72A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=KmPtM4Xy; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=+0otG72A; 
 dkim-atps=neutral
X-Greylist: delayed 35316 seconds by postgrey-1.36 at boromir;
 Tue, 01 Feb 2022 08:16:48 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JngqN265Pz2y7J
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 08:16:48 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1643663802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tU8NK9NTEirj5O/+bd9d0PukMKUVqECyFzPD3aLKDXk=;
 b=KmPtM4XylI1QpBV825qhL/YVm9F73QsW9H0dQ5UPcPGil3mXgUuoX3HprH/+a3ZG/ShNJr
 BjlGsc1ndAOmgHyQvIvZUOUD6HLDHOBCi/Ji6X9uEEf7jDK1BzH1apOdzDHBzBMfjkAtXZ
 8BD8lWMmiKDXbdlCTK3THWqdS9xoq1KFr2G35OtVX67EMI6vGc6c9cosnIZIpe5sYh+au2
 PL1LZWmdvONdEfE18CsyjWjHM6gOUgcS0xyBIooTsaH48TF002qdkFf00iF1dJ2JVj/0SI
 eh6W7ozcJJE4CPYA3I/LgUWnchhhUB5lvUTPvZV1OWQ8MM0o/wu35qDKV5db6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1643663802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tU8NK9NTEirj5O/+bd9d0PukMKUVqECyFzPD3aLKDXk=;
 b=+0otG72AhE6uKJBBtoOAEgmDIjBRXfGv02FMllL7V8PEVFVne4ebGZPaDcAGYon+0st4ER
 /th5pds4YqGCrMCA==
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
In-Reply-To: <c78df469-1a9f-5778-24d1-8f08a6bf5bcc@roeck-us.net>
References: <87mtjc2lhe.ffs@tglx>
 <c78df469-1a9f-5778-24d1-8f08a6bf5bcc@roeck-us.net>
Date: Mon, 31 Jan 2022 22:16:41 +0100
Message-ID: <87ee4n38sm.ffs@tglx>
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
 Stuart Yoder <stuyoder@gmail.com>, linux-pci@vger.kernel.org,
 Will Deacon <will@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Ashok Raj <ashok.raj@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, xen-devel@lists.xenproject.org,
 Kevin Tian <kevin.tian@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@kaod.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Marc Zygnier <maz@kernel.org>, dmaengine@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guenter,

On Mon, Jan 31 2022 at 07:21, Guenter Roeck wrote:
> Sure. Please see http://server.roeck-us.net/qemu/x86/.
> The logs are generated with with v5.16.4.

thanks for providing the data. It definitely helped me to leave the
state of not seeing the wood for the trees. Fix below.

Thanks,

        tglx
---
Subject: PCI/MSI: Remove bogus warning in pci_irq_get_affinity()
From: Thomas Gleixner <tglx@linutronix.de>
Date: Mon, 31 Jan 2022 22:02:46 +0100

The recent overhaul of pci_irq_get_affinity() introduced a regression when
pci_irq_get_affinity() is called for an MSI-X interrupt which was not
allocated with affinity descriptor information.

The original code just returned a NULL pointer in that case, but the rework
added a WARN_ON() under the assumption that the corresponding WARN_ON() in
the MSI case can be applied to MSI-X as well.

In fact the MSI warning in the original code does not make sense either
because it's legitimate to invoke pci_irq_get_affinity() for a MSI
interrupt which was not allocated with affinity descriptor information.

Remove it and just return NULL as the original code did.

Fixes: f48235900182 ("PCI/MSI: Simplify pci_irq_get_affinity()")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/msi.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -1111,7 +1111,8 @@ const struct cpumask *pci_irq_get_affini
 	if (!desc)
 		return cpu_possible_mask;
 
-	if (WARN_ON_ONCE(!desc->affinity))
+	/* MSI[X] interrupts can be allocated without affinity descriptor */
+	if (!desc->affinity)
 		return NULL;
 
 	/*
