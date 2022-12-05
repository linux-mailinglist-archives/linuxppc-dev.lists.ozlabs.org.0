Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F591642C8A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 17:09:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQpQr1D4vz3cKV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 03:09:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=t1aBQ5Pw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=t1aBQ5Pw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQpPf4gXXz3bgR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 03:08:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D3C01611D6;
	Mon,  5 Dec 2022 16:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7ED3C433D6;
	Mon,  5 Dec 2022 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670256516;
	bh=2zTjxGImNhiKZkQVLYwU+D7sO9c/DELnBsQOLmxj5RM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t1aBQ5PwG5R+hRKkkXrH8ZTKVgOxRxmB/P6l1a7WOnp6bg1x+OclpQCfQnhw/5RV9
	 VWi7ElCSsHDX/U7BRQ1/TnpM9vFr8hQGRZDE9i4Y2GO9/XQcyWYoAD1bZDv9jDw4w5
	 KgmnSDvMOM5qBG6N1xQJdeSmTODNmVm+4pNvzk5Y=
Date: Mon, 5 Dec 2022 17:08:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dawei Li <set_pte_at@outlook.com>
Subject: Re: [PATCH 2/6] macio: Make remove callback of macio driver void
 returned
Message-ID: <Y44XgS8nHgcJjQCL@kroah.com>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
 <TYCP286MB2323FCDC7ECD87F8D97CB74BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB2323FCDC7ECD87F8D97CB74BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
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

On Mon, Dec 05, 2022 at 11:36:40PM +0800, Dawei Li wrote:
> Commit fc7a6209d571 ("bus: Make remove callback return
> void") forces bus_type::remove be void-returned, it doesn't
> make much sense for any bus based driver implementing remove
> callbalk to return non-void to its caller.
> 
> This change is for macio bus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> ---
>  arch/powerpc/include/asm/macio.h                | 12 ++++++------
>  drivers/ata/pata_macio.c                        |  4 +---
>  drivers/macintosh/rack-meter.c                  |  4 +---
>  drivers/net/ethernet/apple/bmac.c               |  4 +---
>  drivers/net/ethernet/apple/mace.c               |  4 +---
>  drivers/net/wireless/intersil/orinoco/airport.c |  4 +---
>  drivers/scsi/mac53c94.c                         |  5 +----
>  drivers/scsi/mesh.c                             |  5 +----
>  drivers/tty/serial/pmac_zilog.c                 |  7 ++-----
>  sound/aoa/soundbus/i2sbus/core.c                |  4 +---
>  10 files changed, 16 insertions(+), 37 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/macio.h b/arch/powerpc/include/asm/macio.h
> index ff5fd82d9ff0..f641c730c3b7 100644
> --- a/arch/powerpc/include/asm/macio.h
> +++ b/arch/powerpc/include/asm/macio.h
> @@ -124,15 +124,15 @@ static inline struct pci_dev *macio_get_pci_dev(struct macio_dev *mdev)
>   */
>  struct macio_driver
>  {
> -	int	(*probe)(struct macio_dev* dev, const struct of_device_id *match);
> -	int	(*remove)(struct macio_dev* dev);
> +	int	(*probe)(struct macio_dev *dev, const struct of_device_id *match);
> +	void	(*remove)(struct macio_dev *dev);

Again, you are changing lines you do not need to here.

thanks,

greg k-h
