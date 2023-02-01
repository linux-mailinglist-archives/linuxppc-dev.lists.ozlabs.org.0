Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDAE686F8C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 21:06:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6Xxn37BJz3fJR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 07:06:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wyRlvvRr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wyRlvvRr;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6Xvw0sGtz3fZY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 07:05:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 082D4B822A5;
	Wed,  1 Feb 2023 20:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D236C433EF;
	Wed,  1 Feb 2023 20:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675281910;
	bh=rmPoFPon1DaemO65oh00WGh8tw8UK0ApbZvGK/v+wJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wyRlvvRrwA5mKZiAK0NQOFAMvGpIr3PXJY0/MJcpO5Rbgmq+imjVp8xJKDhBr8JWv
	 Y2tOsLIKmmBuewP60qUTBa50H3a6kHm99rlyoURiTy6NBZOptQkvw6Q9D0vFVRK4yi
	 uXpv6ZpUycUqTeqURkgIjnJkt2V4LMPkFMoqDhCA=
Date: Wed, 1 Feb 2023 21:05:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Brian King <brking@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/6] hvcs: Remove sysfs file prior to vio unregister
Message-ID: <Y9rF81tIiFioCvpE@kroah.com>
References: <20230201195743.303163-1-brking@linux.vnet.ibm.com>
 <20230201195743.303163-3-brking@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201195743.303163-3-brking@linux.vnet.ibm.com>
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

On Wed, Feb 01, 2023 at 01:57:39PM -0600, Brian King wrote:
> This moves the removal of the rescan sysfs attribute to occur
> before the call to unregister the vio to ensure the removal
> does not fail due to the vio driver already being freed.
> 
> Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
> ---
>  drivers/tty/hvc/hvcs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
> index faf5ccfc561e..9131dcb2e8d8 100644
> --- a/drivers/tty/hvc/hvcs.c
> +++ b/drivers/tty/hvc/hvcs.c
> @@ -1519,6 +1519,8 @@ static int __init hvcs_module_init(void)
>  
>  static void __exit hvcs_module_exit(void)
>  {
> +	driver_remove_file(&hvcs_vio_driver.driver, &driver_attr_rescan);

Again, set the default group for the driver and then you don't have to
do any of this at all please.

thanks,

greg k-h
