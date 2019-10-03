Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A44BCAF17
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 21:21:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kjY90bp7zDqZC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 05:21:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=dan.streetman@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kjJk1DgKzDqJM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 05:10:45 +1000 (AEST)
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <dan.streetman@canonical.com>) id 1iG6Ur-0007Fj-HA
 for linuxppc-dev@lists.ozlabs.org; Thu, 03 Oct 2019 19:10:41 +0000
Received: by mail-io1-f72.google.com with SMTP id r5so6902299iop.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Oct 2019 12:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zN8BjvlVM6Yfmn/ry19EbJlWmoqgSPYEwTG104xKOok=;
 b=N0EMndsegS5tuOYpxSDkz0EwVVuCGCEdyMNPw5g5CbYUpn6uu9GY9ITuuf+xELKMkz
 TTE0j0NqTPvJ7wcRoQ9JFtO3ey9bvGj/WnmYEfAA55oqCmeSz4gJ1XmbUmxLISsPuWkY
 Sj41i4nnm2SKjR1rhLPgrohtIB/dYuyyenUsUjRAwQRvG3C/tPOZ03r5qNiEh3ZbesA0
 /s9YG9BgSg1nXeAYxRjp58iBkxrkJpzn+po46OYILD8nXk4mxx1DQgN/lNuFZk3NRPQr
 Trl2/vxU9D7J+VTOQQyHVkJVXVjdiAP4vxjpxRYLeMEiVAGYbbciwCwoonUltImgDmak
 J9sA==
X-Gm-Message-State: APjAAAWENo8uUAniMxUz42qIQcQIZ9SWYfvQtWLws6GwD59bMqV2xkpe
 /4tEo6K1xAZbPhjWNEfGYoDKmbchnedPVUYpJJyUL9127oo3dDqnQ52ibe3uzGfRxBKtjjFI4hG
 qgHv1b4zox27F0DBt85Dh6/7GQTRdDyz+AVfRi6eMXpGaxGj6MI/ovlo4giM=
X-Received: by 2002:a5e:990f:: with SMTP id t15mr9541019ioj.270.1570129840488; 
 Thu, 03 Oct 2019 12:10:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy26sjHplQ5R9JDlngxIv5FBinKJp1W9/0TUghKMgjbwSflwXhiPbCTEtAtCFOgD+s1gxXlZTcQYgC4B3bmccg=
X-Received: by 2002:a5e:990f:: with SMTP id t15mr9540974ioj.270.1570129840027; 
 Thu, 03 Oct 2019 12:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190927130402.687-1-ddstreet@canonical.com>
 <20190927181856.GD1804168@kroah.com>
In-Reply-To: <20190927181856.GD1804168@kroah.com>
From: Dan Streetman <ddstreet@canonical.com>
Date: Thu, 3 Oct 2019 15:10:03 -0400
Message-ID: <CAOZ2QJM+qgiYR+15rydwT6ebuL7UBfPcVp9vXCug6NSWDRS-Cg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/vio: use simple dummy struct device as bus parent
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Herring <robh@kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 27, 2019 at 2:19 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 27, 2019 at 09:04:02AM -0400, Dan Streetman wrote:
> > The dummy vio_bus_device creates the /sys/devices/vio directory, which
> > contains real vio devices under it; since it represents itself as having
> > a bus = &vio_bus_type, its /sys/devices/vio/uevent does call the bus's
> > .uevent function, vio_hotplug(), and as that function won't find a real
> > device for the dummy vio_dev, it will return -ENODEV.
> >
> > One of the main users of the uevent node is udevadm, e.g. when it is called
> > with 'udevadm trigger --devices'.  Up until recently, it would ignore any
> > errors returned when writing to devices' uevent file, but it was recently
> > changed to start returning error if it gets an error writing to any uevent
> > file:
> > https://github.com/systemd/systemd/commit/97afc0351a96e0daa83964df33937967c75c644f
> >
> > since the /sys/devices/vio/uevent file has always returned ENODEV from
> > any write to it, this now causes the udevadm trigger command to return
> > an error.  This may be fixed in udevadm to ignore ENODEV errors, but the
> > vio driver should still be fixed.
> >
> > This patch changes the arch/powerpc/platform/pseries/vio.c 'dummy'
> > parent device into a real dummy device with no .bus, so its uevent
> > file will stop returning ENODEV and simply do nothing and return 0.
> >
> > Signed-off-by: Dan Streetman <ddstreet@canonical.com>
> > ---
> >  arch/powerpc/platforms/pseries/vio.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
> > index 79e2287991db..63bc16631680 100644
> > --- a/arch/powerpc/platforms/pseries/vio.c
> > +++ b/arch/powerpc/platforms/pseries/vio.c
> > @@ -32,11 +32,8 @@
> >  #include <asm/page.h>
> >  #include <asm/hvcall.h>
> >
> > -static struct vio_dev vio_bus_device  = { /* fake "parent" device */
> > -     .name = "vio",
> > -     .type = "",
> > -     .dev.init_name = "vio",
> > -     .dev.bus = &vio_bus_type,
> > +static struct device vio_bus = {
> > +     .init_name      = "vio",
>
> Eeek, no!  Why are you creating a static device that will then be
> reference counted?  Not nice :(

so, I looked again and it seems quite a few places appear to do
exactly this, is it something that should be fixed?

$ git grep 'static struct device [^*{]*{'
arch/arm/kernel/dma-isa.c:static struct device isa_dma_dev = {
arch/arm/mach-rpc/dma.c:static struct device isa_dma_dev = {
arch/arm/mach-s3c24xx/s3c2410.c:static struct device s3c2410_dev = {
arch/arm/mach-s3c24xx/s3c2412.c:static struct device s3c2412_dev = {
arch/arm/mach-s3c24xx/s3c2416.c:static struct device s3c2416_dev = {
arch/arm/mach-s3c24xx/s3c2440.c:static struct device s3c2440_dev = {
arch/arm/mach-s3c24xx/s3c2442.c:static struct device s3c2442_dev = {
arch/arm/mach-s3c24xx/s3c2443.c:static struct device s3c2443_dev = {
arch/arm/mach-s3c64xx/common.c:static struct device s3c64xx_dev = {
arch/arm/mach-s3c64xx/s3c6400.c:static struct device s3c6400_dev = {
arch/arm/mach-s3c64xx/s3c6410.c:static struct device s3c6410_dev = {
arch/mips/sgi-ip22/ip22-gio.c:static struct device gio_bus = {
arch/parisc/kernel/drivers.c:static struct device root = {
arch/powerpc/platforms/ps3/system-bus.c:static struct device ps3_system_bus = {
arch/powerpc/platforms/pseries/ibmebus.c:static struct device
ibmebus_bus_device = { /* fake "parent" device */
arch/powerpc/platforms/pseries/vio.c:static struct device vio_bus = {
arch/um/drivers/virtio_uml.c:static struct device vu_cmdline_parent = {
drivers/base/isa.c:static struct device isa_bus = {
drivers/block/rbd.c:static struct device rbd_root_dev = {
drivers/gpu/drm/ttm/ttm_module.c:static struct device ttm_drm_class_device = {
drivers/iio/dummy/iio_dummy_evgen.c:static struct device iio_evgen_dev = {
drivers/iio/trigger/iio-trig-sysfs.c:static struct device iio_sysfs_trig_dev = {
drivers/misc/sgi-gru/grumain.c:static struct device gru_device = {
drivers/nubus/bus.c:static struct device nubus_parent = {
drivers/sh/maple/maple.c:static struct device maple_bus = {
drivers/sh/superhyway/superhyway.c:static struct device
superhyway_bus_device = {
drivers/soc/fsl/qe/qe_ic.c:static struct device device_qe_ic = {
drivers/virtio/virtio_mmio.c:static struct device vm_cmdline_parent = {
kernel/time/clockevents.c:static struct device tick_bc_dev = {
kernel/time/clocksource.c:static struct device device_clocksource = {


>
> What's wrong with a simple call to device_create() for your "fake"
> device you want to make here?  That's what it is there for :)
>
> thanks,
>
> greg k-h
