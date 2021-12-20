Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8666F47A923
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 12:56:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHdNR2lf6z2yZ2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 22:56:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HSeZ4MSH;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xrSZ1J5E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=HSeZ4MSH; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=xrSZ1J5E; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHdMj2lKSz2xY1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 22:56:01 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1640001352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/CUTvkF0ZJD/0bUX2KphRLF8+ED9CK1uoT06irTMlA8=;
 b=HSeZ4MSHoOtA7+F6FETI6mp8k3+faOYIGAz2lfvwDy1sSASh6hTd2VQBM/xtD9dWQ6/+it
 Xx1QiktSyrVJW+s/MoE14UBVxgCvvz4QKIShLntOLlYBJxOVA077qH2vgT/zKoawye+Uqx
 snVV6hWDoQFRr82vrxuTiQA6fWGNWW8AQwrmHtXAqARcz5dCEF253M2O/8L7qxll49Y14E
 5fSXcstjpAFKPqGx7Ea82OtzbwbxPCD/3HPgDpfoxqEWUh14UdrFA6upqctLwnFjwYbD3a
 oi0s+ejfwagnJisgRBLJVVnUWCRjx+V6vSjMsZE6J9vLkzoXsCRI261DIG6qXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1640001352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/CUTvkF0ZJD/0bUX2KphRLF8+ED9CK1uoT06irTMlA8=;
 b=xrSZ1J5EcwueXFBw2+PxkXfD7FQuFpsVSXWU/APxdJHshmEM2RfAp9OAgcYlk78X64Avva
 QQ/LsT2krF+p+kDg==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Nathan Chancellor
 <nathan@kernel.org>
Subject: Re: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
In-Reply-To: <ee5db32f-c21e-287f-2a19-94c1ba6e8217@kaod.org>
References: <20211210221642.869015045@linutronix.de>
 <20211210221814.900929381@linutronix.de>
 <Yb0PaCyo/6z3XOlf@archlinux-ax161> <87v8zm9pmd.ffs@tglx>
 <ee5db32f-c21e-287f-2a19-94c1ba6e8217@kaod.org>
Date: Mon, 20 Dec 2021 12:55:51 +0100
Message-ID: <87pmpra3so.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 Ashok Raj <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Sinan Kaya <okaya@kernel.org>, iommu@lists.linux-foundation.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Kevin Tian <kevin.tian@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Megha Dey <megha.dey@intel.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 18 2021 at 21:25, C=C3=A9dric Le Goater wrote:

> On 12/18/21 11:25, Thomas Gleixner wrote:
>> On Fri, Dec 17 2021 at 15:30, Nathan Chancellor wrote:
>>> On Fri, Dec 10, 2021 at 11:19:26PM +0100, Thomas Gleixner wrote:
>>> I just bisected a boot failure on my AMD test desktop to this patch as
>>> commit f48235900182 ("PCI/MSI: Simplify pci_irq_get_affinity()") in
>>> -next. It looks like there is a problem with the NVMe drive after this
>>> change according to the logs. Given that the hard drive is not getting
>>> mounted for journald to write logs to, I am not really sure how to get
>>> them from the machine so I have at least taken a picture of what I see
>>> on my screen; open to ideas on that front!
>>=20
>> Bah. Fix below.
>
> That's a fix for the issue I was seeing on pseries with NVMe.
>
> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>

I had a faint memory that I've seen that issue before, but couldn't find
the mail in those massive threads.

Thanks for confirming!

       tglx
