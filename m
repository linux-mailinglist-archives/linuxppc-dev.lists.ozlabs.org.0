Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A765A23360E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 17:53:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHZhZ5KyTzDqfP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 01:53:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=cascardo@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHZHF56n6zDqf4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 01:35:21 +1000 (AEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58] helo=mussarela)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1k1AaI-0006gK-Tp; Thu, 30 Jul 2020 15:35:07 +0000
Date: Thu, 30 Jul 2020 12:35:02 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] powerpc/vio: drop bus_type from parent device
Message-ID: <20200730153502.GD6828@mussarela>
References: <20200406155748.6761-1-cascardo@canonical.com>
 <87ime56bax.fsf@mpe.ellerman.id.au>
 <20200730053716.GA3862178@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730053716.GA3862178@kroah.com>
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
Cc: Peter Rajnoha <prajnoha@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 30, 2020 at 07:37:16AM +0200, Greg KH wrote:
> On Thu, Jul 30, 2020 at 11:28:38AM +1000, Michael Ellerman wrote:
> > [ Added Peter & Greg to Cc ]
> > 
> > Thadeu Lima de Souza Cascardo <cascardo@canonical.com> writes:
> > > Commit df44b479654f62b478c18ee4d8bc4e9f897a9844 ("kobject: return error
> > > code if writing /sys/.../uevent fails") started returning failure when
> > > writing to /sys/devices/vio/uevent.
> > >
> > > This causes an early udevadm trigger to fail. On some installer versions of
> > > Ubuntu, this will cause init to exit, thus panicing the system very early
> > > during boot.
> > >
> > > Removing the bus_type from the parent device will remove some of the extra
> > > empty files from /sys/devices/vio/, but will keep the rest of the layout
> > > for vio devices, keeping them under /sys/devices/vio/.
> > 
> > What exactly does it change?
> > 
> > I'm finding it hard to evaluate if this change is going to cause a
> > regression somehow.
> > 
> > I'm also not clear on why removing the bus type is correct, apart from
> > whether it fixes the bug you're seeing.
> > 
> > > It has been tested that uevents for vio devices don't change after this
> > > fix, they still contain MODALIAS.
> > >
> > > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> > > Fixes: df44b479654f ("kobject: return error code if writing /sys/.../uevent fails")
> > 
> > AFAICS there haven't been any other fixes for that commit. Do we know
> > why it is only vio that was affected? (possibly because it's a fake bus
> > to begin with?)
> 
> So there was an error previously, the core was ignoring it, and now it
> isn't and to fix that you want to remove describing what bus a device is
> on?
> 
> Huh???
> 
> > 
> > cheers
> > 
> > > diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
> > > index 37f1f25ba804..a94dab3972a0 100644
> > > --- a/arch/powerpc/platforms/pseries/vio.c
> > > +++ b/arch/powerpc/platforms/pseries/vio.c
> > > @@ -36,7 +36,6 @@ static struct vio_dev vio_bus_device  = { /* fake "parent" device */
> > >  	.name = "vio",
> > >  	.type = "",
> > >  	.dev.init_name = "vio",
> > > -	.dev.bus = &vio_bus_type,
> > >  };
> 
> Wait, a static 'struct device'?  You all are playing with fire there.
> That's a reference counted object, and should never be declared like
> that at all.
> 
> I see you register it, but never unregister it, why?  Why is it even
> needed?
> 
> And if you remove the bus type of it, it will show up in a different
> part of sysfs, so I think this patch will show a user-visable change,
> right?
> 
> thanks,
> 
> greg k-h

As the comment says, it's a "fake parent device". There is a user-visible
change, which is removing some attributes from the object, but it's still
showing up on the same path.

Returning an error code like df44b479654f does is also a user visible change
and it breaks installer images that panic early on boot.

I could investigate an alternative here, which would be not fail when writing
to uevent for this specific fake device.

Cascardo.
