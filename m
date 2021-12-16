Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E01BA477A81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 18:24:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFJrT6KqGz3cCK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 04:24:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OMVjennJ;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KLmanqyV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=OMVjennJ; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=KLmanqyV; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFJqm0y0Vz2xsx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 04:23:47 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639675422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ih3MOpW/yCW+x5F+uZuuVRHaDZ9exo66WfrPCFsrhAY=;
 b=OMVjennJ3dIFrwVfMs8MzDcb41Xr30oKty6fkqZ9/dg2KPX2j01Itd6kvCYu1225sOnYuo
 IeaHw/JoJkXrtGr3oWwJMzzEwGmbkJFG3vgu9mNytV1jkcv4dag6oBGHon+mbf9Ogyak6J
 JF0hQ4F7JA1yDzHNDLmTJM8en1l9nh0l4RtyKkhJNdGp1qF+PkIKoY49IEUHTkOsVif77X
 EDZmJYVvTSc9g7y9TRGoIHjKz9B63drgsnnIlXTKDk1IKqeYDrXtl+Qq6LpiQy1hqLdDie
 mG/yWvrQXdNGXa7j6B8oNi6M8Sbe5B02MnwHdqWu6fekNoxcotWWNW+EPmJPkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639675422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ih3MOpW/yCW+x5F+uZuuVRHaDZ9exo66WfrPCFsrhAY=;
 b=KLmanqyVLTn1a9p7GzpJVoRlRAGdDGqehRu/zZHojbSx8/zpp5uAkFxpqxeluTK3IDEpyQ
 hmWFXp91ZBiOKlBQ==
To: Nishanth Menon <nm@ti.com>
Subject: Re: [patch V3 00/35] genirq/msi, PCI/MSI: Spring cleaning - Part 2
In-Reply-To: <20211216014527.5d3sqs2klrqjmm2k@lunacy>
References: <20211213182958.ytj4m6gsg35u77cv@detonator>
 <87fsqvttfv.ffs@tglx> <20211214162247.ocjm7ihg5oi7uiuv@slider>
 <87wnk7rvnz.ffs@tglx> <87tufbrudl.ffs@tglx> <87mtl3rli1.ffs@tglx>
 <20211214205626.lrnddha6bd6d6es5@possibly> <87h7basx36.ffs@tglx>
 <87zgp1rge4.ffs@tglx> <87wnk5rfkt.ffs@tglx>
 <20211216014527.5d3sqs2klrqjmm2k@lunacy>
Date: Thu, 16 Dec 2021 18:23:41 +0100
Message-ID: <87wnk4cvky.ffs@tglx>
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

On Wed, Dec 15 2021 at 19:45, Nishanth Menon wrote:
> On 17:35-20211215, Thomas Gleixner wrote:
> Thanks once again for your help. Hope we can roll in the fixes for
> part3.

Sure, it's only the one-liner for ti sci. Got it folded already.

Thanks for your help and testing!

       tglx
