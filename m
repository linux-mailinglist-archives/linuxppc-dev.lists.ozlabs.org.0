Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7712333CCF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 03:44:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hvq95d5SzDqbl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 11:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.85.160.196; helo=mail-qt1-f196.google.com;
 envelope-from=mst@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hvnl5qjkzDqB5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 11:43:05 +1000 (AEST)
Received: by mail-qt1-f196.google.com with SMTP id l3so11928074qtj.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 18:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UhYcCxgEtL0AtQ/eoB2A8hUZouQaYG46tp9fVW9VG8Y=;
 b=lGiYWbcmxB1NIZkv21XcbAIIpeFHvClZy/3MQaRWmhgTLjpWiDMd0woYN2uCK5wZjy
 yZ1v33eVfNMQWs2PaPyhrEOhhlBeAOswYS9JQbbJSt1HV7xumsdF9kBnSJxK/G0Hq4Gc
 QA2P/QuyVEBV6d/TxuiBPq4i7NrTGGSoSpSRjY06FmN5V9D7+seLGig+sC+FmaKxa4kP
 FASsWS3ji5IjDrKaQ9f8cJzmkpPa/ixQK3Q4c2CPGQBlN1ozy2KQ5mkcj8JXlYwZS5w9
 I+RMAmuvEkkjhHcPJDLx+0qzd1SRLCN4PAHptzsfBLbPLwhR39ZrkOD+Nl+U+j7sWYjE
 CcbQ==
X-Gm-Message-State: APjAAAV6350vBEC7tP0I7mLZzi+GgOqhEiM58b+RxJem0HYok88NHNar
 m+ldihvNoBuFTOqegxCsNhPtlQ==
X-Google-Smtp-Source: APXvYqzNXQ/3cx4oaT89jcuj4XmgWuJZ6ovl6rypbLqytAvqStAvYyx+TJNjAlTL/uzBpJjaoQNTmA==
X-Received: by 2002:ac8:2c7d:: with SMTP id e58mr25943949qta.243.1559612582509; 
 Mon, 03 Jun 2019 18:43:02 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
 [100.0.197.103])
 by smtp.gmail.com with ESMTPSA id q187sm236373qkd.19.2019.06.03.18.42.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 03 Jun 2019 18:43:01 -0700 (PDT)
Date: Mon, 3 Jun 2019 21:42:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [RFC PATCH] virtio_ring: Use DMA API if guest memory is encrypted
Message-ID: <20190603211528-mutt-send-email-mst@kernel.org>
References: <20190129134750-mutt-send-email-mst@kernel.org>
 <877eefxvyb.fsf@morokweng.localdomain>
 <20190204144048-mutt-send-email-mst@kernel.org>
 <87ef71seve.fsf@morokweng.localdomain>
 <20190320171027-mutt-send-email-mst@kernel.org>
 <87tvfvbwpb.fsf@morokweng.localdomain>
 <20190323165456-mutt-send-email-mst@kernel.org>
 <87a7go71hz.fsf@morokweng.localdomain>
 <20190520090939-mutt-send-email-mst@kernel.org>
 <877ea26tk8.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877ea26tk8.fsf@morokweng.localdomain>
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

On Mon, Jun 03, 2019 at 10:13:59PM -0300, Thiago Jung Bauermann wrote:
> 
> 
> Michael S. Tsirkin <mst@redhat.com> writes:
> 
> > On Wed, Apr 17, 2019 at 06:42:00PM -0300, Thiago Jung Bauermann wrote:
> >> I rephrased it in terms of address translation. What do you think of
> >> this version? The flag name is slightly different too:
> >>
> >>
> >> VIRTIO_F_ACCESS_PLATFORM_NO_TRANSLATION This feature has the same
> >>     meaning as VIRTIO_F_ACCESS_PLATFORM both when set and when not set,
> >>     with the exception that address translation is guaranteed to be
> >>     unnecessary when accessing memory addresses supplied to the device
> >>     by the driver. Which is to say, the device will always use physical
> >>     addresses matching addresses used by the driver (typically meaning
> >>     physical addresses used by the CPU) and not translated further. This
> >>     flag should be set by the guest if offered, but to allow for
> >>     backward-compatibility device implementations allow for it to be
> >>     left unset by the guest. It is an error to set both this flag and
> >>     VIRTIO_F_ACCESS_PLATFORM.
> >
> >
> > OK so VIRTIO_F_ACCESS_PLATFORM is designed to allow unpriveledged
> > drivers. This is why devices fail when it's not negotiated.
> 
> Just to clarify, what do you mean by unprivileged drivers? Is it drivers
> implemented in guest userspace such as with VFIO? Or unprivileged in
> some other sense such as needing to use bounce buffers for some reason?

I had drivers in guest userspace in mind.

> > This confuses me.
> > If driver is unpriveledged then what happens with this flag?
> > It can supply any address it wants. Will that corrupt kernel
> > memory?
> 
> Not needing address translation doesn't necessarily mean that there's no
> IOMMU. On powerpc we don't use VIRTIO_F_ACCESS_PLATFORM but there's
> always an IOMMU present. And we also support VFIO drivers. The VFIO API
> for pseries (sPAPR section in Documentation/vfio.txt) has extra ioctls
> to program the IOMMU.
> 
> For our use case, we don't need address translation because we set up an
> identity mapping in the IOMMU so that the device can use guest physical
> addresses.

And can it access any guest physical address?

> If the guest kernel is concerned that an unprivileged driver could
> jeopardize its integrity it should not negotiate this feature flag.

Unfortunately flag negotiation is done through config space
and so can be overwritten by the driver.

> Perhaps there should be a note about this in the flag definition? This
> concern is platform-dependant though. I don't believe it's an issue in
> pseries.

Again ACCESS_PLATFORM has a pretty open definition. It does actually
say it's all up to the platform.

Specifically how will VIRTIO_F_ACCESS_PLATFORM_NO_TRANSLATION be
implemented portably? virtio has no portable way to know
whether DMA API bypasses translation.



> --
> Thiago Jung Bauermann
> IBM Linux Technology Center
