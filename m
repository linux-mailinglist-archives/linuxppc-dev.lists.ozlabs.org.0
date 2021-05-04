Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7D9372BF4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 16:24:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZMXz63zfz300b
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 00:24:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=A/agEr85;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=A/agEr85; dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZMXR1plMz2xYk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 00:23:50 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id n2so13455510ejy.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ensQSDTh3BO9iGPVrV6EYBnSBYEfz7lspMmgWRr6tEM=;
 b=A/agEr85m2gTABKwkX7MweJdDLUWMMy/uuv8cOATtF0IOSbqQGQWqB7WVO/2i6CTej
 A/xEN0wabqwjnysRyxUsM6987Nm7ZjOXb3ElY7BOmpcbi2Nz6d878YWmh7i2EiFYeKva
 NM7Q/fRoU0PTIKl2uxcCG8z+XO6JfxPjFQ6us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ensQSDTh3BO9iGPVrV6EYBnSBYEfz7lspMmgWRr6tEM=;
 b=CnCwhH+7L43cQHl20s+7PXWvafLxP1a0/eRlZ684oITLGqgtO+OGJjKhcF/PP0f09X
 uAJ058k1cLegI4kig64Wa+dNJuSbLgj+yY+ACdJns2St+h5wCzTjcav54hGomX7BXOmD
 taErU50n+Aq3R6MbuEfvFIa0TsCmL/HOlf67KdYpjg+yByGSfA0+LFVQLJAE27EafUtS
 SNyWAUyDlvW921qMayrwNOHijuAMNRG4wN3o9iItuH71yg70QQ6qD+5e7Mw4ixoxV2Fk
 D3Eag6Np8CvlAMubOZKE0RSFmsNHH9XarxXMcSUHr6Km57zVBH6xHOW6rbtpzKTcg6DY
 xd0w==
X-Gm-Message-State: AOAM532we27W2V8e3nsSIK8aROH8fV2scBLkpwPPicbXHsUtSGEnq5pZ
 PWYV7T5ox5eB/D6Txrtt7jyDFQ==
X-Google-Smtp-Source: ABdhPJzaM96uclt2Tpt863I3ZtqPW7KYS209iLyt378polAbgvCVI1aPL30//Pa3FZcXPaOgGHkVGA==
X-Received: by 2002:a17:906:194d:: with SMTP id
 b13mr22253337eje.83.1620138223252; 
 Tue, 04 May 2021 07:23:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t14sm1462204ejc.121.2021.05.04.07.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 07:23:42 -0700 (PDT)
Date: Tue, 4 May 2021 16:23:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kurz <groug@kaod.org>
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <YJFY7NjEBtCSlJHw@phenom.ffwll.local>
Mail-Followup-To: Greg Kurz <groug@kaod.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210326061311.1497642-1-hch@lst.de>
 <20210504142236.76994047@bahia.lan> <YJFFG1tSP0dUCxcX@kroah.com>
 <20210504152034.18e41ec3@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504152034.18e41ec3@bahia.lan>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
 dri-devel@lists.freedesktop.org, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Jason Gunthorpe <jgg@nvidia.com>,
 qemu-ppc@nongnu.org, linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 04, 2021 at 03:20:34PM +0200, Greg Kurz wrote:
> On Tue, 4 May 2021 14:59:07 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, May 04, 2021 at 02:22:36PM +0200, Greg Kurz wrote:
> > > On Fri, 26 Mar 2021 07:13:09 +0100
> > > Christoph Hellwig <hch@lst.de> wrote:
> > > 
> > > > Hi all,
> > > > 
> > > > the nvlink2 vfio subdriver is a weird beast.  It supports a hardware
> > > > feature without any open source component - what would normally be
> > > > the normal open source userspace that we require for kernel drivers,
> > > > although in this particular case user space could of course be a
> > > > kernel driver in a VM.  It also happens to be a complete mess that
> > > > does not properly bind to PCI IDs, is hacked into the vfio_pci driver
> > > > and also pulles in over 1000 lines of code always build into powerpc
> > > > kernels that have Power NV support enabled.  Because of all these
> > > > issues and the lack of breaking userspace when it is removed I think
> > > > the best idea is to simply kill.
> > > > 
> > > > Changes since v1:
> > > >  - document the removed subtypes as reserved
> > > >  - add the ACK from Greg
> > > > 
> > > > Diffstat:
> > > >  arch/powerpc/platforms/powernv/npu-dma.c     |  705 ---------------------------
> > > >  b/arch/powerpc/include/asm/opal.h            |    3 
> > > >  b/arch/powerpc/include/asm/pci-bridge.h      |    1 
> > > >  b/arch/powerpc/include/asm/pci.h             |    7 
> > > >  b/arch/powerpc/platforms/powernv/Makefile    |    2 
> > > >  b/arch/powerpc/platforms/powernv/opal-call.c |    2 
> > > >  b/arch/powerpc/platforms/powernv/pci-ioda.c  |  185 -------
> > > >  b/arch/powerpc/platforms/powernv/pci.c       |   11 
> > > >  b/arch/powerpc/platforms/powernv/pci.h       |   17 
> > > >  b/arch/powerpc/platforms/pseries/pci.c       |   23 
> > > >  b/drivers/vfio/pci/Kconfig                   |    6 
> > > >  b/drivers/vfio/pci/Makefile                  |    1 
> > > >  b/drivers/vfio/pci/vfio_pci.c                |   18 
> > > >  b/drivers/vfio/pci/vfio_pci_private.h        |   14 
> > > >  b/include/uapi/linux/vfio.h                  |   38 -
> > > 
> > > 
> > > Hi Christoph,
> > > 
> > > FYI, these uapi changes break build of QEMU.
> > 
> > What uapi changes?
> > 
> 
> All macros and structure definitions that are being removed
> from include/uapi/linux/vfio.h by patch 1.

Just my 2cents from drm (where we deprecate old gunk uapi quite often):
Imo it's best to keep the uapi headers as-is, but exchange the
documentation with a big "this is removed, never use again" warning:

- it occasionally serves as a good lesson for how to not do uapi (whatever
  the reasons really are in the specific case)

- it's good to know which uapi numbers (like parameter extensions or
  whatever they are in this case) are defacto reserved, because there are
  binaries (qemu in this) that have code acting on them out there.

The only exception where we completely nuke the structs and #defines is
when uapi has been only used by testcases. Which we know, since we defacto
limit our stable uapi guarantee to the canonical open&upstream userspace
drivers only (for at least the driver-specific stuff, the cross-driver
interfaces are hopeless).

Anyway feel free to ignore since this might be different than drivers/gpu.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
