Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB97C0AF3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 20:21:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g0VR3fYszDr0D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 04:21:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="mF0tqbaV"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g0S25HSMzDqxc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 04:19:14 +1000 (AEST)
Received: from localhost (unknown [62.119.166.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7958207FF;
 Fri, 27 Sep 2019 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569608351;
 bh=HdngjJQ6QYecIFl9hcUQfs4nyJNvvZAWF++gJUVxPdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mF0tqbaVT+Ad7vRU+IB9Q/wpNpY9/XUSKr/I4oQWUKhZnG1ACbXl706cvjlSJI+MK
 OjrvU2RLiDQLzpiSdO+pKIwb72GVRTO8aixFg/E+4dL9t/D5pOSrCBlJNaDZmzTVtq
 xPVW6nbek5sFPE29rxR6Ss2oPmYVY6dbt4SXHDv0=
Date: Fri, 27 Sep 2019 20:18:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Streetman <ddstreet@canonical.com>
Subject: Re: [PATCH] powerpc/vio: use simple dummy struct device as bus parent
Message-ID: <20190927181856.GD1804168@kroah.com>
References: <20190927130402.687-1-ddstreet@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190927130402.687-1-ddstreet@canonical.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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

On Fri, Sep 27, 2019 at 09:04:02AM -0400, Dan Streetman wrote:
> The dummy vio_bus_device creates the /sys/devices/vio directory, which
> contains real vio devices under it; since it represents itself as having
> a bus = &vio_bus_type, its /sys/devices/vio/uevent does call the bus's
> .uevent function, vio_hotplug(), and as that function won't find a real
> device for the dummy vio_dev, it will return -ENODEV.
> 
> One of the main users of the uevent node is udevadm, e.g. when it is called
> with 'udevadm trigger --devices'.  Up until recently, it would ignore any
> errors returned when writing to devices' uevent file, but it was recently
> changed to start returning error if it gets an error writing to any uevent
> file:
> https://github.com/systemd/systemd/commit/97afc0351a96e0daa83964df33937967c75c644f
> 
> since the /sys/devices/vio/uevent file has always returned ENODEV from
> any write to it, this now causes the udevadm trigger command to return
> an error.  This may be fixed in udevadm to ignore ENODEV errors, but the
> vio driver should still be fixed.
> 
> This patch changes the arch/powerpc/platform/pseries/vio.c 'dummy'
> parent device into a real dummy device with no .bus, so its uevent
> file will stop returning ENODEV and simply do nothing and return 0.
> 
> Signed-off-by: Dan Streetman <ddstreet@canonical.com>
> ---
>  arch/powerpc/platforms/pseries/vio.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
> index 79e2287991db..63bc16631680 100644
> --- a/arch/powerpc/platforms/pseries/vio.c
> +++ b/arch/powerpc/platforms/pseries/vio.c
> @@ -32,11 +32,8 @@
>  #include <asm/page.h>
>  #include <asm/hvcall.h>
>  
> -static struct vio_dev vio_bus_device  = { /* fake "parent" device */
> -	.name = "vio",
> -	.type = "",
> -	.dev.init_name = "vio",
> -	.dev.bus = &vio_bus_type,
> +static struct device vio_bus = {
> +	.init_name	= "vio",

Eeek, no!  Why are you creating a static device that will then be
reference counted?  Not nice :(

What's wrong with a simple call to device_create() for your "fake"
device you want to make here?  That's what it is there for :)

thanks,

greg k-h
