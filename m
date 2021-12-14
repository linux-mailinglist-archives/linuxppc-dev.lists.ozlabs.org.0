Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 274FC474848
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 17:36:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JD3tQ0gdCz3bjB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 03:36:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=x+UREoz0;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=JRPDqiMe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=x+UREoz0; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=JRPDqiMe; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JD3sk2rfVz2yPT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 03:36:10 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639499761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jHkEiVG0BVT8V/9kbAcBq/GVsYt3jqgvF40FkGyKrlo=;
 b=x+UREoz0tV0ByegvETONzIcJg/btHkYAeUTOB9Cwk6fF4WS4tcdqSKPZhosLY9Kw8fzkL2
 iAO8dxlrohDcjOfDmK3UIx35hhe0gnfY1J6UUVxyO061FZZ9igOXoMxu0oZsfFw4GbgpYB
 Q5rK3Ehp3GsvY/ZWFqOBDe34LxDsXDQAfeXwgAzwLGuRTF6/6fajjiB+l4faY58KyXYRd9
 TRvQUMx4KhjpOhAQjyD53NZ44/KDHNZzen3o5CWSSmMuXJs7tSK49MGIkP5L/9Tw/0p3r8
 ob+7BJIhXKuW4vpCWZYdUoDVrJaJ+Ar127CVhFKQjgeiplPgqNc0w3IVyPx/sg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639499761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jHkEiVG0BVT8V/9kbAcBq/GVsYt3jqgvF40FkGyKrlo=;
 b=JRPDqiMesD5qMuzHSYGkN8LOEMskH9IhyPnRCqMbSThsy+YATwXU6QDtFhGJhGuZcxfILm
 UyvW8q3ctT/IqHDg==
To: Nishanth Menon <nm@ti.com>
Subject: Re: [patch V3 00/35] genirq/msi, PCI/MSI: Spring cleaning - Part 2
In-Reply-To: <20211214162247.ocjm7ihg5oi7uiuv@slider>
References: <20211210221642.869015045@linutronix.de>
 <20211213182958.ytj4m6gsg35u77cv@detonator> <87fsqvttfv.ffs@tglx>
 <20211214162247.ocjm7ihg5oi7uiuv@slider>
Date: Tue, 14 Dec 2021 17:36:00 +0100
Message-ID: <87wnk7rvnz.ffs@tglx>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Stuart Yoder <stuyoder@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Sinan Kaya <okaya@kernel.org>, iommu@lists.linux-foundation.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Kevin Tian <kevin.tian@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Robin Murphy <robin.murphy@arm.com>, Johannes Berg <johannes.berg@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Megha Dey <megha.dey@intel.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Marc Zygnier <maz@kernel.org>,
 dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 14 2021 at 10:22, Nishanth Menon wrote:
> On 10:41-20211214, Thomas Gleixner wrote:
> Agreed that the warning is fine, the null pointer exception that follows
> [1] [2] it however does'nt look right and it can be trivially fixed with the
> following fixup for ee90787487bc ("genirq/msi: Provide
> msi_device_populate/destroy_sysfs()") below, with that the log looks
> like [3] - the warn is good, the null pointer exception and resultant
> crash could be avoided (not saying this is the best solution):

Aaargh.

[   13.478122] Call trace:
[   13.509042]  msi_device_destroy_sysfs+0x18/0x88
[   13.509058]  msi_domain_free_irqs+0x34/0x58
[   13.509064]  pci_msi_teardown_msi_irqs+0x30/0x3c
[   13.509072]  free_msi_irqs+0x78/0xd4
[   13.509077]  pci_disable_msix+0x138/0x164
[   13.529930]  pcim_release+0x70/0x238
[   13.529942]  devres_release_all+0x9c/0xfc
[   13.529951]  device_release_driver_internal+0x1a0/0x244
[   13.542725]  device_release_driver+0x18/0x24
[   13.542741]  iwl_req_fw_callback+0x1a28/0x1ddc [iwlwifi]
[   13.552308]  request_firmware_work_func+0x50/0x9c
[   13.552320]  process_one_work+0x194/0x25c

That's not a driver problem, that's an ordering issue vs. the devres
muck. Let me go back to the drawing board. Sigh...

Thanks,

        tglx

