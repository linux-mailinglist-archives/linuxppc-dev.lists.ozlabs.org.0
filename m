Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AE3B3C3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 16:30:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rtcr70PGzDqGG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 00:30:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="VE/IsNN+"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rsJ00LbwzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 23:30:55 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A4682087F;
 Sat, 27 Apr 2019 13:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556371852;
 bh=Lh9s0O0+A8sPU7fyQWvhROtRxYQ2VDabkJlyUvL7sek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VE/IsNN+OoggOL0lqnbBMENjYjQMHUlg6MzRjzd1wN8UG2ch8tWXwwllPaD6PTYFn
 mCF1UqTTSxvOfCSi55yzLfekiXXAcF44HsZlZXG4txLN8xZgDjNdx2St37NOCVhQjx
 TD6zDEh5JrUi3h2KNNgGkeyXD0aOAtKHV/ga5/ng=
Date: Sat, 27 Apr 2019 15:30:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH 05/41] drivers: tty: serial: dz: use pr_info() instead of
 incomplete printk()
Message-ID: <20190427133050.GB11368@kroah.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-6-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556369542-13247-6-git-send-email-info@metux.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: linux-ia64@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, andrew@aj.id.au,
 khilman@baylibre.com, sudeep.holla@arm.com, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux@prisktech.co.nz,
 sparclinux@vger.kernel.org, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 27, 2019 at 02:51:46PM +0200, Enrico Weigelt, metux IT consult wrote:
> Fix the checkpatch warning:
> 
>     WARNING: printk() should include KERN_<LEVEL> facility level
>     #934: FILE: dz.c:934:
>     +	printk("%s%s\n", dz_name, dz_version);
> 
> Signed-off-by: Enrico Weigelt <info@metux.net>
> ---
>  drivers/tty/serial/dz.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/dz.c b/drivers/tty/serial/dz.c
> index 559d076..e2670c4 100644
> --- a/drivers/tty/serial/dz.c
> +++ b/drivers/tty/serial/dz.c
> @@ -931,7 +931,7 @@ static int __init dz_init(void)
>  	if (IOASIC)
>  		return -ENXIO;
>  
> -	printk("%s%s\n", dz_name, dz_version);
> +	pr_info("%s%s\n", dz_name, dz_version);

Just drop this line, it's not needed and generally just noise.

thanks,

greg k-h
