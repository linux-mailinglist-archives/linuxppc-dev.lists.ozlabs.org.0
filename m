Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBFD372A88
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 14:59:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZKgH6GSNz302S
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 22:59:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1RVOhA+x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=1RVOhA+x; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZKfp6Phcz2yRK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 22:59:13 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E030613B4;
 Tue,  4 May 2021 12:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620133150;
 bh=VKrAeZZpludZjTm6WuzJcgg7371nyGiXlt3bsLCkX3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1RVOhA+xUnttg6X+/OXWdWei9lFiPRvoAUP4JZ66jwCl3Fwz8Y9JcIZ2dWfl4AXDh
 Mg7CS6WUOwTfkw4umLIPAtPqY5sJ9P6hfLWa3HEE2n4liAZAnteKFXFxaUW5xREyNd
 jljZ143srAqD73QuO6fQW2meQYvxR3Y6pcFbbX8Q=
Date: Tue, 4 May 2021 14:59:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Greg Kurz <groug@kaod.org>
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <YJFFG1tSP0dUCxcX@kroah.com>
References: <20210326061311.1497642-1-hch@lst.de>
 <20210504142236.76994047@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504142236.76994047@bahia.lan>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-api@vger.kernel.org, qemu-ppc@nongnu.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 04, 2021 at 02:22:36PM +0200, Greg Kurz wrote:
> On Fri, 26 Mar 2021 07:13:09 +0100
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > Hi all,
> > 
> > the nvlink2 vfio subdriver is a weird beast.  It supports a hardware
> > feature without any open source component - what would normally be
> > the normal open source userspace that we require for kernel drivers,
> > although in this particular case user space could of course be a
> > kernel driver in a VM.  It also happens to be a complete mess that
> > does not properly bind to PCI IDs, is hacked into the vfio_pci driver
> > and also pulles in over 1000 lines of code always build into powerpc
> > kernels that have Power NV support enabled.  Because of all these
> > issues and the lack of breaking userspace when it is removed I think
> > the best idea is to simply kill.
> > 
> > Changes since v1:
> >  - document the removed subtypes as reserved
> >  - add the ACK from Greg
> > 
> > Diffstat:
> >  arch/powerpc/platforms/powernv/npu-dma.c     |  705 ---------------------------
> >  b/arch/powerpc/include/asm/opal.h            |    3 
> >  b/arch/powerpc/include/asm/pci-bridge.h      |    1 
> >  b/arch/powerpc/include/asm/pci.h             |    7 
> >  b/arch/powerpc/platforms/powernv/Makefile    |    2 
> >  b/arch/powerpc/platforms/powernv/opal-call.c |    2 
> >  b/arch/powerpc/platforms/powernv/pci-ioda.c  |  185 -------
> >  b/arch/powerpc/platforms/powernv/pci.c       |   11 
> >  b/arch/powerpc/platforms/powernv/pci.h       |   17 
> >  b/arch/powerpc/platforms/pseries/pci.c       |   23 
> >  b/drivers/vfio/pci/Kconfig                   |    6 
> >  b/drivers/vfio/pci/Makefile                  |    1 
> >  b/drivers/vfio/pci/vfio_pci.c                |   18 
> >  b/drivers/vfio/pci/vfio_pci_private.h        |   14 
> >  b/include/uapi/linux/vfio.h                  |   38 -
> 
> 
> Hi Christoph,
> 
> FYI, these uapi changes break build of QEMU.

What uapi changes?

What exactly breaks?

Why does QEMU require kernel driver stuff?

thanks,

greg k-h
