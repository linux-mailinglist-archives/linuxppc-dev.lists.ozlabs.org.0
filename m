Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334B686F8B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 21:06:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6Xwn3Jrsz3fFc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 07:06:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=L1Qq1qOb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=L1Qq1qOb;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6XvJ2420z3fXY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 07:04:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 20B8BB822A4;
	Wed,  1 Feb 2023 20:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E13EC433EF;
	Wed,  1 Feb 2023 20:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675281878;
	bh=nizT89zhrZII1N6zYUh2O7TUZNc9wQfYHV7jlGUAi64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L1Qq1qObrisOcQIoLXa4qWduLqh41+m2hPGjKYehCRFWuGWmHkreS83RqK7SG6KXw
	 7DkBP/+a8uNW3l3vjqgnVkfNrtBK+DvckKZBt102AwW1oiR/dTFTv4CpTdr6M2WzSy
	 Iu6UxHhREEiBkp74Od3RZr2HfjFd8FeZaifkHKBo=
Date: Wed, 1 Feb 2023 21:04:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Brian King <brking@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/6] hvcs: Remove sysfs group earlier
Message-ID: <Y9rF01SQ91VBjFa9@kroah.com>
References: <20230201195743.303163-1-brking@linux.vnet.ibm.com>
 <20230201195743.303163-4-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201195743.303163-4-brking@linux.vnet.ibm.com>
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
Cc: mmc@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org, brking@pobox.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 01, 2023 at 01:57:40PM -0600, Brian King wrote:
> Cleanup the sysfs group earlier in remove. This eliminates
> errors coming from kernfs when attempting to remove a console
> device that is in use.
> 
> Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
> ---
>  drivers/tty/hvc/hvcs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
> index 9131dcb2e8d8..9c5887d0c882 100644
> --- a/drivers/tty/hvc/hvcs.c
> +++ b/drivers/tty/hvc/hvcs.c
> @@ -688,8 +688,6 @@ static void hvcs_destruct_port(struct tty_port *p)
>  	spin_unlock_irqrestore(&hvcsd->lock, flags);
>  	spin_unlock(&hvcs_structs_lock);
>  
> -	sysfs_remove_group(&vdev->dev.kobj, &hvcs_attr_group);
> -
>  	kfree(hvcsd);
>  }
>  
> @@ -814,6 +812,8 @@ static void hvcs_remove(struct vio_dev *dev)
>  	 */
>  	tty_port_put(&hvcsd->port);
>  
> +	sysfs_remove_group(&dev->dev.kobj, &hvcs_attr_group);
> +

Why is this needed at all?  The files should be auto-removed when the
device is removed, right?

And calling sysfs_*() functions from a driver is a huge hint that
something is wrong here.  Worst case, this should be calling
device_remove_group(), but really, the default groups pointer should be
set and then you don't have to add/remove anything, it will all happen
automatically for you by the driver core at the properly place and time.

Can you do that instead of this change?  That should fix it all up
properly.

thanks,

greg k-h
