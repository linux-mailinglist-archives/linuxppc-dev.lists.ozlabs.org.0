Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A404748CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 18:04:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JD4VP3vKdz3cDr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 04:04:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4P9YNy0E;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NEaZQwUV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=4P9YNy0E; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=NEaZQwUV; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JD4Tl0sBnz2ymq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 04:03:55 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639501430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RXDy+gEt+jM/GLA+wNxlJEuBnWYy8r3p2Ru1kkxGm4Q=;
 b=4P9YNy0ES7591XCDm5PSWup8bN4QZP7lauZPNqzguglGF810Qx6tlHC+ni+cCTXT//bRrL
 8sy8xtbBW2WNueS1zjqp8h8A0yb4naQSxUV7RBh2hqT1tsFq6begUYU0evqtkPzN01b278
 fd9gHbaeywBmVDCmDPd2qQ/zpjMiaB9wQAqsRoE0OI6pkTd0Mdkr8wct9zyvWczqltcPfP
 gVFurKQstARHhwA4cqkMjQuwW0a240akK7UOWCq2KqJXtL/Zk07hDvbDB6Geb3dHg82+ku
 rQEa7JysFMGTutJcrfi+Bj+sn5C4cesBd4+iCf7oAFV+qmPbWW589QvaRwSxBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639501430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RXDy+gEt+jM/GLA+wNxlJEuBnWYy8r3p2Ru1kkxGm4Q=;
 b=NEaZQwUVupGSoHFBC83jQ5nykyNdZrjtpZRBFsQka5WyTgqzd9VoqFy4Lrz/ewIMzZW0fK
 mYumgixv6qanTNBQ==
To: Nishanth Menon <nm@ti.com>
Subject: Re: [patch V3 00/35] genirq/msi, PCI/MSI: Spring cleaning - Part 2
In-Reply-To: <87wnk7rvnz.ffs@tglx>
References: <20211210221642.869015045@linutronix.de>
 <20211213182958.ytj4m6gsg35u77cv@detonator> <87fsqvttfv.ffs@tglx>
 <20211214162247.ocjm7ihg5oi7uiuv@slider> <87wnk7rvnz.ffs@tglx>
Date: Tue, 14 Dec 2021 18:03:50 +0100
Message-ID: <87tufbrudl.ffs@tglx>
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

On Tue, Dec 14 2021 at 17:36, Thomas Gleixner wrote:
> On Tue, Dec 14 2021 at 10:22, Nishanth Menon wrote:
>> On 10:41-20211214, Thomas Gleixner wrote:
> [   13.478122] Call trace:
> [   13.509042]  msi_device_destroy_sysfs+0x18/0x88
> [   13.509058]  msi_domain_free_irqs+0x34/0x58
> [   13.509064]  pci_msi_teardown_msi_irqs+0x30/0x3c
> [   13.509072]  free_msi_irqs+0x78/0xd4
> [   13.509077]  pci_disable_msix+0x138/0x164
> [   13.529930]  pcim_release+0x70/0x238
> [   13.529942]  devres_release_all+0x9c/0xfc
> [   13.529951]  device_release_driver_internal+0x1a0/0x244
> [   13.542725]  device_release_driver+0x18/0x24
> [   13.542741]  iwl_req_fw_callback+0x1a28/0x1ddc [iwlwifi]
> [   13.552308]  request_firmware_work_func+0x50/0x9c
> [   13.552320]  process_one_work+0x194/0x25c
>
> That's not a driver problem, that's an ordering issue vs. the devres
> muck. Let me go back to the drawing board. Sigh...

Which is pretty obvious why:

   pcim_enable_device()
        devres_alloc(pcim_release...);
        ...
        pci_irq_alloc()
          msi_setup_device_data()
             devres_alloc(msi_device_data_release, ...)

and once the device is released:

    msi_device_data_release()
    ...
    pcim_release()
       pci_disable_msi[x]()

Groan....
