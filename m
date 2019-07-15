Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6EF69F7D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 01:26:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nfmR0Lj6zDqWS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 09:26:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nfkS6pNQzDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 09:24:32 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6FNO7XS032164;
 Mon, 15 Jul 2019 18:24:08 -0500
Message-ID: <d5b4f80db724da9d7571b614be76dd8b2b57432e.camel@kernel.crashing.org>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Date: Tue, 16 Jul 2019 09:24:06 +1000
In-Reply-To: <8736j7neg8.fsf@morokweng.localdomain>
References: <20190323165456-mutt-send-email-mst@kernel.org>
 <87a7go71hz.fsf@morokweng.localdomain>
 <20190520090939-mutt-send-email-mst@kernel.org>
 <877ea26tk8.fsf@morokweng.localdomain>
 <20190603211528-mutt-send-email-mst@kernel.org>
 <877e96qxm7.fsf@morokweng.localdomain>
 <20190701092212-mutt-send-email-mst@kernel.org>
 <87d0id9nah.fsf@morokweng.localdomain>
 <20190715103411-mutt-send-email-mst@kernel.org>
 <874l3nnist.fsf@morokweng.localdomain>
 <20190715163453-mutt-send-email-mst@kernel.org>
 <8736j7neg8.fsf@morokweng.localdomain>
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
Cc: Mike Anderson <andmike@linux.ibm.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 Jason Wang <jasowang@redhat.com>, Alexey Kardashevskiy <aik@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-07-15 at 19:03 -0300, Thiago Jung Bauermann wrote:
> > > Indeed. The idea is that QEMU can offer the flag, old guests can
> > > reject
> > > it (or even new guests can reject it, if they decide not to
> > > convert into
> > > secure VMs) and the feature negotiation will succeed with the
> > > flag
> > > unset.
> > 
> > OK. And then what does QEMU do? Assume guest is not encrypted I
> > guess?
> 
> There's nothing different that QEMU needs to do, with or without the
> flag. the perspective of the host, a secure guest and a regular guest
> work the same way with respect to virtio.

This is *precisely* why I was against adding a flag and touch the
protocol negociation with qemu in the first place, back when I cared
about that stuff...

Guys, this has gone in circles over and over again.

This has nothing to do with qemu. Qemu doesn't need to know about this.
It's entirely guest local. This is why the one-liner in virtio was a
far better and simpler solution.

This is something the guest does to itself (with the participation of a
ultravisor but that's not something qemu cares about at this stage, at
least not as far as virtio is concerned).

Basically, the guest "hides" its memory from the host using a HW secure
memory facility. As a result, it needs to ensure that all of its DMA
pages are bounced through insecure pages that aren't hidden. That's it,
it's all guest side. Qemu shouldn't have to care about it at all.

Cheers,
Ben.


