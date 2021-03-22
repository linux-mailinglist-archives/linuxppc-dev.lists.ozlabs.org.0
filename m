Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 821433448F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 16:13:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3ygC3RbPz30HF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:13:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=I4suPRlq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=I4suPRlq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3yfn3Wm8z2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 02:12:47 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2B9861990;
 Mon, 22 Mar 2021 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616425965;
 bh=XaGJOXpYJ2i+MQsioxl6Tg28Kym8UEMe4b4RpcUBm8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I4suPRlqsJeGbJ3kRh4ME6/eP0O/yqXU+Rr96XxgbYcvuIrIDXw4eyoxUAx3shFY3
 EKQL2w6YUEMhzsE51MWi0icihMdRehucbnlG5qw1sdZzfAj/vvYpPzhT2/9Vzwoh7k
 dHoP/0Vx5qwqfEnfs1Yzmdpu1roVfSG7U9Med5yw=
Date: Mon, 22 Mar 2021 16:12:42 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: remove the nvlink2 pci_vfio subdriver
Message-ID: <YFiz6sIJluL/u2Cu@kroah.com>
References: <20210322150155.797882-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322150155.797882-1-hch@lst.de>
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 22, 2021 at 04:01:53PM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> the nvlink2 vfio subdriver is a weird beast.  It supports a hardware
> feature without any open source component - what would normally be
> the normal open source userspace that we require for kernel drivers,
> although in this particular case user space could of course be a
> kernel driver in a VM.  It also happens to be a complete mess that
> does not properly bind to PCI IDs, is hacked into the vfio_pci driver
> and also pulles in over 1000 lines of code always build into powerpc
> kernels that have Power NV support enabled.  Because of all these
> issues and the lack of breaking userspace when it is removed I think
> the best idea is to simply kill.
> 
> Diffstat:
>  arch/powerpc/platforms/powernv/npu-dma.c     |  705 ---------------------------
>  b/arch/powerpc/include/asm/opal.h            |    3 
>  b/arch/powerpc/include/asm/pci-bridge.h      |    1 
>  b/arch/powerpc/include/asm/pci.h             |    7 
>  b/arch/powerpc/platforms/powernv/Makefile    |    2 
>  b/arch/powerpc/platforms/powernv/opal-call.c |    2 
>  b/arch/powerpc/platforms/powernv/pci-ioda.c  |  185 -------
>  b/arch/powerpc/platforms/powernv/pci.c       |   11 
>  b/arch/powerpc/platforms/powernv/pci.h       |   17 
>  b/arch/powerpc/platforms/pseries/pci.c       |   23 
>  b/drivers/vfio/pci/Kconfig                   |    6 
>  b/drivers/vfio/pci/Makefile                  |    1 
>  b/drivers/vfio/pci/vfio_pci.c                |   18 
>  b/drivers/vfio/pci/vfio_pci_private.h        |   14 
>  b/include/uapi/linux/vfio.h                  |   40 -
>  drivers/vfio/pci/vfio_pci_nvlink2.c          |  490 ------------------
>  16 files changed, 8 insertions(+), 1517 deletions(-)

I thought this was supposed to be removed a few years ago!

Anyway, no objection from me:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
