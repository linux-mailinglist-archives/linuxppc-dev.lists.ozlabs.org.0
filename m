Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E590A4A44BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 12:34:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnQvd573gz3bVc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 22:34:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=08+adjG5;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=F4vMMMS/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=08+adjG5; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=F4vMMMS/; 
 dkim-atps=neutral
X-Greylist: delayed 353 seconds by postgrey-1.36 at boromir;
 Mon, 31 Jan 2022 22:34:02 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnQty0sNTz30Mn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 22:34:02 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1643628478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=4vunJSw+29nMhKwarhIq3XOACVtrs68uDOcnGTjBogA=;
 b=08+adjG5kvqly9R27r6UQqPVlHuuR0wvg7AraR+yb44p1SYXk6tzK2abtw7IGSi2A3wXfI
 6U1PBy/jkvuCM3fKrPHG2APL7p9nnSGR9rg89/6St5G9+Iod6wSzgG4//1TPbjInXUs8YN
 AwxB3zkSRCSMca4ho01kA/XiGI4WDXwyqGA/Q1QoCwvYXEwS/NWbubISSEMuoN2RNNZk6X
 k+mIQEs2lRbseraKMG1ylwlb9XmMSJiXrB/5Msv2UG1+iYWWGnwuZaVGTtIizxYMk1wpBk
 7RxcI8ct1tXsnuKIrqrBOd4gsj7C5lweoLU2Rx7EKaWcOJBL6ltT48oEiUJlEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1643628478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=4vunJSw+29nMhKwarhIq3XOACVtrs68uDOcnGTjBogA=;
 b=F4vMMMS/RR2647UpQl2u4kgknqNjM8y1uiJemITMdVUuEzICexEkSEXuPmcOo4kKXCPGTF
 66aXb64gMDoB5SDg==
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
In-Reply-To: <20220130171210.GA3545402@roeck-us.net>
Date: Mon, 31 Jan 2022 12:27:57 +0100
Message-ID: <87mtjc2lhe.ffs@tglx>
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

On Sun, Jan 30 2022 at 09:12, Guenter Roeck wrote:
> On Fri, Dec 10, 2021 at 11:19:26PM +0100, Thomas Gleixner wrote:
> This patch results in the following runtime warning when booting x86
> (32 bit) nosmp images from NVME in qemu.
>
> [   14.825482] nvme nvme0: 1/0/0 default/read/poll queues
> ILLOPC: ca7c6d10: 0f 0b
> [   14.826188] ------------[ cut here ]------------
> [   14.826307] WARNING: CPU: 0 PID: 7 at drivers/pci/msi/msi.c:1114 pci_irq_get_affinity+0x80/0x90

This complains about msi_desc->affinity being NULL.

> git bisect bad f48235900182d64537c6e8f8dc0932b57a1a0638
> # first bad commit: [f48235900182d64537c6e8f8dc0932b57a1a0638] PCI/MSI: Simplify pci_irq_get_affinity()

Hrm. Can you please provide dmesg and /proc/interrupts from a
kernel before that commit?

Thanks,

        tglx

