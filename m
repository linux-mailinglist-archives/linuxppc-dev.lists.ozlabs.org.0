Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2816DF1DD2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 19:54:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477bLT5bmbzF3bt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 05:54:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=flukshun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EQQ2FIfp"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477bJN3BQ5zDqJW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 05:52:49 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id t4so10285155otr.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 10:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:mime-version:content-transfer-encoding:to:from:in-reply-to
 :cc:references:message-id:user-agent:subject:date;
 bh=/laGZJEmPy2D0nklJHHpG1RYf/kARGTtsk0gGb6OD8s=;
 b=EQQ2FIfpsQyWLB5lYTCbH/5TJ6+nQdEKYjCGAUFU2I9v/wn5AxK2ic9UdlXhLEcAwp
 edmHOL0xf3BdnB0U+7wpdDcSSogc9T3rM+uJJPbLscZnA7E9eN6OD9ppQ5yf5cIawZpB
 Bwc3IG6XqGRm42CybHUFLUqasSJ2aagHP4OLWi0QkbBlTHTzpa+u0SHoNDRSN4UH5WK1
 QsPjpDw/PkQlEQDWyJpaAuzBeyzfb7nIJITI9WPBjgIfMqHLy1jC6w5Cvm7EkTfQJmmJ
 T8/Y0O0bnMLeraHzmy1pfZjmJfjKIa8ypgSV9CA56txDVzpHPHFvyLlF5h9n1sdqFEOB
 crPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:mime-version:content-transfer-encoding:to
 :from:in-reply-to:cc:references:message-id:user-agent:subject:date;
 bh=/laGZJEmPy2D0nklJHHpG1RYf/kARGTtsk0gGb6OD8s=;
 b=b/H8SyxgE6PrA7yA4dZOOo7k93a7mabr6OqLXbkMheffA7IwH/VIXK7AgCQ8SlINSr
 b1e/jDi2lNf+f8Uq0zxWOVOuFmalKIeI8LCQo50VbtIgb39AOCeQraIDykQACnX9Zcgm
 1kLM2Udr8zST8NsrMCJfIz+pdmFaF1MbwgKTgxexD/8bovy+NdsWea0yYEIA5Ne6Oh4H
 5nP81dfnJMQQBS+gvEa8qQDp8DRz4SUJU9rV6k2JedgjPX9qH7ZfghoKprfJd1Zkn1gl
 OUN5KC/u+0oCOuuvyPzrCToyr/4s9J1lqS0jVVPBpTZ4T2p8u5pSn/O6IhDbk0eM7pBk
 nh7A==
X-Gm-Message-State: APjAAAUtbEaEaBoI2mTFtODI5sICbyunpQWcjis72L074Bp1OnaOjhqV
 OMlsXu2zL5dW9PgONHBIyH4=
X-Google-Smtp-Source: APXvYqzd/uW5CIndQtAe5OzDf/POp/SdrPUqtEJNDrh8KUVb+MS+/vQ6RYWhqoGoa4PiY7fY12yL9A==
X-Received: by 2002:a9d:6294:: with SMTP id x20mr2828006otk.31.1573066365766; 
 Wed, 06 Nov 2019 10:52:45 -0800 (PST)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id c7sm7235360otr.32.2019.11.06.10.52.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Nov 2019 10:52:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <20191106130558-mutt-send-email-mst@kernel.org>
References: <1572902923-8096-1-git-send-email-linuxram@us.ibm.com>
 <265679db-9cb3-1660-0cf6-97f740b1b48b@ozlabs.ru>
 <20191106130558-mutt-send-email-mst@kernel.org>
Message-ID: <157306632211.17570.17567742230498149897@sif>
User-Agent: alot/0.7
Subject: Re: [RFC v1 0/2] Enable IOMMU support for pseries Secure VMs
Date: Wed, 06 Nov 2019 12:52:02 -0600
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
Cc: andmike@us.ibm.com, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, ram.n.pai@gmail.com, cai@lca.pw,
 tglx@linutronix.de, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de, bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Michael S. Tsirkin (2019-11-06 12:06:37)
> On Wed, Nov 06, 2019 at 12:59:50PM +1100, Alexey Kardashevskiy wrote:
> > =

> > =

> > On 05/11/2019 08:28, Ram Pai wrote:
> > > This patch series enables IOMMU support for pseries Secure VMs.
> > > =

> > > =

> > > Tested using QEMU command line option:
> > > =

> > >  "-device virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.0,addr=3D0x4,
> > >     iommu_platform=3Don,disable-modern=3Doff,disable-legacy=3Don"
> > >  and =

> > > =

> > >  "-device virtio-blk-pci,scsi=3Doff,bus=3Dpci.0,
> > >     addr=3D0x5,drive=3Ddrive-virtio-disk0,id=3Dvirtio-disk0,
> > >     iommu_platform=3Don,disable-modern=3Doff,disable-legacy=3Don"
> > =

> > =

> > Worth mentioning that SLOF won't boot with such devices as SLOF does no=
t know about iommu_platform=3Don.
> =

> Shouldn't be hard to support: set up the iommu to allow everything
> and ack the feature. Right?

It's not a static/linear mapping in this case so we need calls to map DMA
buffers as-needed. I've gotten it to boot with virtio-blk, but the patches
have some hacks and need cleanup, hoping to post them soon.

I'm a bit perplexed how we would manage to boot a guest without those
changes though, this is what I get with qemu 4.1.0:

  qemu-system-ppc64 -M pseries,ic-mode=3Dxics -m 512M -bios /home/mdroth/w/=
build/qemu-4.1.0-build/pc-bios/slof.bin -device virtio-blk-pci,drive=3Ddriv=
e0,id=3Dblk0,disable-modern=3Doff,disable-legacy=3Don,iommu_platform=3Don -=
drive file=3D/home/mdroth/vm/bionic-server-cloudimg-ppc64el.img,if=3Dnone,i=
d=3Ddrive0 -trace enable=3Dspapr_iommu\*,file=3Dtrace.out -monitor unix:/tm=
p/mon.sock,server,nowait -vga none -nographic
  qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-cf=
pc=3Dworkaround
  qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-sb=
bc=3Dworkaround
  qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ib=
s=3Dworkaround
  =

  =

  SLOF ********************************************************************=
**
  QEMU Starting
   Build Date =3D Jul  3 2019 12:26:14
   FW Version =3D git-ba1ab360eebe6338
   Press "s" to enter Open Firmware.
  =

  Populating /vdevice methods
  Populating /vdevice/vty@71000000
  Populating /vdevice/nvram@71000001
  Populating /vdevice/l-lan@71000002
  Populating /vdevice/v-scsi@71000003
         SCSI: Looking for devices
            8200000000000000 CD-ROM   : "QEMU     QEMU CD-ROM      2.5+"
  Populating /pci@800000020000000
                       00 0000 (D) : 1af4 1042    virtio [ block ]
  No NVRAM common partition, re-initializing...
  Scanning USB
  Using default console: /vdevice/vty@71000000
  =

    Welcome to Open Firmware
  =

    Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
    This program and the accompanying materials are made available
    under the terms of the BSD License available at
    http://www.opensource.org/licenses/bsd-license.php
  =

  =

  Trying to load:  from: /pci@800000020000000/scsi@0 ... virtioblk_init: fa=
iled
  virtioblk_transfer: Access beyond end of device!

And then it hangs. This is with TCG so maybe it behaves differently with
KVM, but that's the result I would expect with the current SLOF code.

> =

> > > =

> > > Ram Pai (2):
> > >   powerpc/pseries/iommu: Share the per-cpu TCE page with the hypervis=
or.
> > >   powerpc/pseries/iommu: Use dma_iommu_ops for Secure VMs aswell.
> > > =

> > >  arch/powerpc/platforms/pseries/iommu.c | 30 ++++++++++++++++++------=
------
> > >  1 file changed, 18 insertions(+), 12 deletions(-)
> > > =

> > =

> > -- =

> > Alexey
>=20
