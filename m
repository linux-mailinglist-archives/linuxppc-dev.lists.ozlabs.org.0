Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC33642C84
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 17:08:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQpPr1j4Lz3bVP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 03:08:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tGQk9MFX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tGQk9MFX;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQpNx1GHCz2x9C
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 03:07:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 02AC9611B3;
	Mon,  5 Dec 2022 16:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA843C433D6;
	Mon,  5 Dec 2022 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670256475;
	bh=Eu6yRxptwIjp+jobzTRehJVPk3s3l2rtPAWW3JDKriU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tGQk9MFX4LB7qvP2B2anJGqE6Z6d0L46ICiQtdTZRCj2bbx+sL1Qj6lDYAd796T73
	 krThdNV5BAuOVBcjlWHfKp1kVWotWO8++wS4g8SLIq/MBzEqMQLv0PWpHmDlNEYi2z
	 li2DvIFUErFDJ0iS5DzLus0ZVrozvfh9M06QC2jc=
Date: Mon, 5 Dec 2022 17:07:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dawei Li <set_pte_at@outlook.com>
Subject: Re: [PATCH 6/6] soundbus: make remove callback of soundbus driver
 void returned
Message-ID: <Y44XWIqnKwE7ntPL@kroah.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
 <TYCP286MB2323BBFCE929111043E60D3BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB2323BBFCE929111043E60D3BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
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
Cc: jgross@suse.com, wei.liu@kernel.org, sstabellini@kernel.org, linux-hyperv@vger.kernel.org, haiyangz@microsoft.com, linuxppc-dev@lists.ozlabs.org, decui@microsoft.com, alsa-devel@alsa-project.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, xen-devel@lists.xenproject.org, johannes@sipsolutions.net, kys@microsoft.com, robert.jarzmik@free.fr, roger.pau@citrix.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 05, 2022 at 11:36:44PM +0800, Dawei Li wrote:
> Since commit fc7a6209d571 ("bus: Make remove callback return
> void") forces bus_type::remove be void-returned, it doesn't
> make much sense for any bus based driver implementing remove
> callbalk to return non-void to its caller.
> 
> This change is for soundbus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
>  sound/aoa/fabrics/layout.c    | 3 +--
>  sound/aoa/soundbus/soundbus.h | 6 +++---
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/aoa/fabrics/layout.c b/sound/aoa/fabrics/layout.c
> index ec4ef18555bc..850dc8c53e9b 100644
> --- a/sound/aoa/fabrics/layout.c
> +++ b/sound/aoa/fabrics/layout.c
> @@ -1094,7 +1094,7 @@ static int aoa_fabric_layout_probe(struct soundbus_dev *sdev)
>  	return -ENODEV;
>  }
>  
> -static int aoa_fabric_layout_remove(struct soundbus_dev *sdev)
> +static void aoa_fabric_layout_remove(struct soundbus_dev *sdev)
>  {
>  	struct layout_dev *ldev = dev_get_drvdata(&sdev->ofdev.dev);
>  	int i;
> @@ -1123,7 +1123,6 @@ static int aoa_fabric_layout_remove(struct soundbus_dev *sdev)
>  	kfree(ldev);
>  	sdev->pcmid = -1;
>  	sdev->pcmname = NULL;
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/sound/aoa/soundbus/soundbus.h b/sound/aoa/soundbus/soundbus.h
> index 3a99c1f1a3ca..230dfa1ba270 100644
> --- a/sound/aoa/soundbus/soundbus.h
> +++ b/sound/aoa/soundbus/soundbus.h
> @@ -184,10 +184,10 @@ struct soundbus_driver {
>  
>  	/* we don't implement any matching at all */
>  
> -	int	(*probe)(struct soundbus_dev* dev);
> -	int	(*remove)(struct soundbus_dev* dev);
> +	int	(*probe)(struct soundbus_dev *dev);

Why change this line too?

thanks,

greg k-h
