Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC36474D2E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 22:20:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDB9z6CGtz3bZj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 08:20:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EzQFCHRv;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lDR2zL85;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=EzQFCHRv; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=lDR2zL85; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDB9J6LP7z2yP5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:20:04 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639516798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UY5SIbLiQJhNf3IcwLAaYT3af81CnBCUSA3qSWP4dj0=;
 b=EzQFCHRvraOq6euqkQn1B+tUeoQ1uw1bo4mwk9Q+vKSF8S8PO4nMGeLKZ/WNHEDZ5eJhpq
 mjggZFTuoIKEO/OrzzxxfitzasNIFFxeDKcRyrdk7DdmUaNmMFC1unLIMtUfaK38TWwXYn
 h2orgm5VCZyrGWnjQirGszYr8438eZQal4q/1iuBvD2zWg9nOeapYD6mAyJQRKxCWoQSAd
 enz2/bCSy9StMuvCnU8bbCEhKsc+iX17V3lbzwiD4WPpGEDgVUswHFbLH8z54QbwfbJl42
 iPxl/XpXV7+3L/A3q2mlzAY6VVHUHz35mnJZ8s3Ze10jfDmKSXRCDaOkhFkkdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639516798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UY5SIbLiQJhNf3IcwLAaYT3af81CnBCUSA3qSWP4dj0=;
 b=lDR2zL85oMI4BdOLKEJ1Arl/dti0X9kWdevk0BKKPLGWBqf9hwgLOpBluOuP1fE4iBCR8Y
 5fOFMFfQxW57zEAA==
To: Nishanth Menon <nm@ti.com>
Subject: Re: [patch V3 00/35] genirq/msi, PCI/MSI: Spring cleaning - Part 2
In-Reply-To: <20211214205626.lrnddha6bd6d6es5@possibly>
References: <20211210221642.869015045@linutronix.de>
 <20211213182958.ytj4m6gsg35u77cv@detonator> <87fsqvttfv.ffs@tglx>
 <20211214162247.ocjm7ihg5oi7uiuv@slider> <87wnk7rvnz.ffs@tglx>
 <87tufbrudl.ffs@tglx> <87mtl3rli1.ffs@tglx>
 <20211214205626.lrnddha6bd6d6es5@possibly>
Date: Tue, 14 Dec 2021 22:19:57 +0100
Message-ID: <87h7basx36.ffs@tglx>
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

Nishanth,

On Tue, Dec 14 2021 at 14:56, Nishanth Menon wrote:
> On 21:15-20211214, Thomas Gleixner wrote:
>> I think I managed to distangle this. Can you please give:
>> 
>>    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v4-part-2
>
>
> Umm.. I am not entirely sure what is going on.. but all kinds of weird
> corruption seems to occur with msi-v4-part-2 that does'nt seem to be
> present in v5.16-rc5. (I use NFS since ethernet in K3 platforms use
> inta/intr and dma that is impacted by this series).
>
> I will try and rebase your patches on v5.16-rc4 to be sure as well and
> report back later today once i get some time.
>
> [1] https://gist.github.com/nmenon/a66e022926c4c15313c45d44313d860c msi-v4-part-2
> [2] https://gist.github.com/nmenon/43085664d69ad846d596e76a06ed0656  v5.16-rc5

thanks for trying. I'll have a look again with brain awake tomorrow
morning.

Thanks,

        tglx
