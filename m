Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2F3372D01
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 17:34:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZP5V0cgHz30Fb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 01:34:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L7sp14P3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L7sp14P3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com;
 envelope-from=alex.williamson@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=L7sp14P3; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=L7sp14P3; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZP4z3mJ0z2xYk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 01:33:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620142411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLdHIElXsh+Br5DFDsP1+YjonXAJx6g75JUakM7EhX0=;
 b=L7sp14P3Ja5xwEFUVLYLsX2NGR06TKzmsEbTOiAfIdKi3b9dqjYrubdwY1/rjUK/AKVzir
 1UvSWWHlp+1etZd72bfdiqpG6AakaFlSVvILIihlklXDXng1taUpjHAqbc1ZGnwiH7iZiv
 2Ju3qEZUL2+Bwf6OEpVcyAWjZn1LeCE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620142411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLdHIElXsh+Br5DFDsP1+YjonXAJx6g75JUakM7EhX0=;
 b=L7sp14P3Ja5xwEFUVLYLsX2NGR06TKzmsEbTOiAfIdKi3b9dqjYrubdwY1/rjUK/AKVzir
 1UvSWWHlp+1etZd72bfdiqpG6AakaFlSVvILIihlklXDXng1taUpjHAqbc1ZGnwiH7iZiv
 2Ju3qEZUL2+Bwf6OEpVcyAWjZn1LeCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-oGqKZBKrOxqxLaLvFcQSeQ-1; Tue, 04 May 2021 11:33:28 -0400
X-MC-Unique: oGqKZBKrOxqxLaLvFcQSeQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C45CF1922039;
 Tue,  4 May 2021 15:33:26 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13D425C230;
 Tue,  4 May 2021 15:33:25 +0000 (UTC)
Date: Tue, 4 May 2021 09:33:24 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <20210504093324.4f0cafc7@redhat.com>
In-Reply-To: <20210504161131.2ed74d7b@bahia.lan>
References: <20210326061311.1497642-1-hch@lst.de>
 <20210504142236.76994047@bahia.lan> <YJFFG1tSP0dUCxcX@kroah.com>
 <20210504152034.18e41ec3@bahia.lan> <YJFMZ8KYVCDwUBPU@kroah.com>
 <20210504161131.2ed74d7b@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, qemu-devel@nongnu.org, Paul
 Mackerras <paulus@samba.org>, Jason Gunthorpe <jgg@nvidia.com>,
 qemu-ppc@nongnu.org, linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 May 2021 16:11:31 +0200
Greg Kurz <groug@kaod.org> wrote:

> On Tue, 4 May 2021 15:30:15 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, May 04, 2021 at 03:20:34PM +0200, Greg Kurz wrote:  
> > > On Tue, 4 May 2021 14:59:07 +0200
> > > Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> > >   
> > > > On Tue, May 04, 2021 at 02:22:36PM +0200, Greg Kurz wrote:  
> > > > > On Fri, 26 Mar 2021 07:13:09 +0100
> > > > > Christoph Hellwig <hch@lst.de> wrote:
> > > > >   
> > > > > > Hi all,
> > > > > > 
> > > > > > the nvlink2 vfio subdriver is a weird beast.  It supports a hardware
> > > > > > feature without any open source component - what would normally be
> > > > > > the normal open source userspace that we require for kernel drivers,
> > > > > > although in this particular case user space could of course be a
> > > > > > kernel driver in a VM.  It also happens to be a complete mess that
> > > > > > does not properly bind to PCI IDs, is hacked into the vfio_pci driver
> > > > > > and also pulles in over 1000 lines of code always build into powerpc
> > > > > > kernels that have Power NV support enabled.  Because of all these
> > > > > > issues and the lack of breaking userspace when it is removed I think
> > > > > > the best idea is to simply kill.
> > > > > > 
> > > > > > Changes since v1:
> > > > > >  - document the removed subtypes as reserved
> > > > > >  - add the ACK from Greg
> > > > > > 
> > > > > > Diffstat:
> > > > > >  arch/powerpc/platforms/powernv/npu-dma.c     |  705 ---------------------------
> > > > > >  b/arch/powerpc/include/asm/opal.h            |    3 
> > > > > >  b/arch/powerpc/include/asm/pci-bridge.h      |    1 
> > > > > >  b/arch/powerpc/include/asm/pci.h             |    7 
> > > > > >  b/arch/powerpc/platforms/powernv/Makefile    |    2 
> > > > > >  b/arch/powerpc/platforms/powernv/opal-call.c |    2 
> > > > > >  b/arch/powerpc/platforms/powernv/pci-ioda.c  |  185 -------
> > > > > >  b/arch/powerpc/platforms/powernv/pci.c       |   11 
> > > > > >  b/arch/powerpc/platforms/powernv/pci.h       |   17 
> > > > > >  b/arch/powerpc/platforms/pseries/pci.c       |   23 
> > > > > >  b/drivers/vfio/pci/Kconfig                   |    6 
> > > > > >  b/drivers/vfio/pci/Makefile                  |    1 
> > > > > >  b/drivers/vfio/pci/vfio_pci.c                |   18 
> > > > > >  b/drivers/vfio/pci/vfio_pci_private.h        |   14 
> > > > > >  b/include/uapi/linux/vfio.h                  |   38 -  
> > > > > 
> > > > > 
> > > > > Hi Christoph,
> > > > > 
> > > > > FYI, these uapi changes break build of QEMU.  
> > > > 
> > > > What uapi changes?
> > > >   
> > > 
> > > All macros and structure definitions that are being removed
> > > from include/uapi/linux/vfio.h by patch 1.
> > >   
> > > > What exactly breaks?
> > > >   
> > > 
> > > These macros and types are used by the current QEMU code base.
> > > Next time the QEMU source tree updates its copy of the kernel
> > > headers, the compilation of affected code will fail.  
> > 
> > So does QEMU use this api that is being removed, or does it just have
> > some odd build artifacts of the uapi things?
> >   
> 
> These are region subtypes definition and associated capabilities.
> QEMU basically gets information on VFIO regions from the kernel
> driver and for those regions with a nvlink2 subtype, it tries
> to extract some more nvlink2 related info.


Urgh, let's put the uapi header back in place with a deprecation
notice.  Userspace should never have a dependency on the existence of a
given region, but clearly will have code to parse the data structure
describing that region.  I'll post a patch.  Thanks,

Alex

