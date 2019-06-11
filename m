Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B793C41873
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 00:54:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Nlgy1qcqzDqw6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 08:54:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NlfF2vhRzDqv3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 08:53:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45NlfF1xyGz8t3y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 08:53:25 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45NlfF1cRPz9s9y; Wed, 12 Jun 2019 08:53:25 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45NlfD4752z9s3l
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Jun 2019 08:53:24 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x5BMr72S021573;
 Tue, 11 Jun 2019 17:53:08 -0500
Message-ID: <ca81ca5d56a3a12db5a92f5cf9745763a86572e8.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 8/8] habanalabs: enable 64-bit DMA mask in POWER9
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Oded Gabbay <oded.gabbay@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
 linuxppc-dev@ozlabs.org, Christoph Hellwig <hch@infradead.org>
Date: Wed, 12 Jun 2019 08:53:07 +1000
In-Reply-To: <CAFCwf134nTD4FM_9Q+THQ7ZAZzGxhs15O6EheaRJMqM5wxi+aA@mail.gmail.com>
References: <20190611092144.11194-1-oded.gabbay@gmail.com>
 <20190611095857.GB24058@kroah.com> <20190611151753.GA11404@infradead.org>
 <20190611152655.GA3972@kroah.com>
 <CAFCwf13A73AxKzaa7Dk3tU-1NDgTFs4+xCO2os7SuSyUHZ9Z3Q@mail.gmail.com>
 <CAFCwf134nTD4FM_9Q+THQ7ZAZzGxhs15O6EheaRJMqM5wxi+aA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Russell Currey <ruscur@au1.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-06-11 at 20:22 +0300, Oded Gabbay wrote:
> 
> > So, to summarize:
> > If I call pci_set_dma_mask with 48, then it fails on POWER9. However,
> > in runtime, I don't know if its POWER9 or not, so upon failure I will
> > call it again with 32, which makes our device pretty much unusable.
> > If I call pci_set_dma_mask with 64, and do the dedicated configuration
> > in Goya's PCIe controller, then it won't work on x86-64, because bit
> > 59 will be set and the host won't like it (I checked it). In addition,
> > I might get addresses above 50 bits, which my device can't generate.
> > 
> > I hope this makes things more clear. Now, please explain to me how I
> > can call pci_set_dma_mask without any regard to whether I run on
> > x86-64 or POWER9, considering what I wrote above ?
> > 
> > Thanks,
> > Oded
> 
> Adding ppc mailing list.

You can't. Your device is broken. Devices that don't support DMAing to
the full 64-bit deserve to be added to the trash pile.

As a result, getting it to work will require hacks. Some GPUs have
similar issues and require similar hacks, it's unfortunate.

Added a couple of guys on CC who might be able to help get those hacks
right.

It's still very fishy .. the idea is to detect the case where setting a
64-bit mask will give your system memory mapped at a fixed high address
(1 << 59 in our case) and program that in your chip in the "Fixed high
bits" register that you seem to have (also make sure it doesn't affect
MSIs or it will break them).

This will only work as long as all of the system memory can be
addressed at an offset from that fixed address that itself fits your
device addressing capabilities (50 bits in this case). It may or may
not be the case but there's no way to check since the DMA mask logic
won't really apply.

You might want to consider fixing your HW in the next iteration... This
is going to bite you when x86 increases the max physical memory for
example, or on other architectures.

Cheers,
Ben.




