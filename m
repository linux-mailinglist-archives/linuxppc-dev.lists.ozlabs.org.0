Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7FB4E8763
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 13:21:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRD0x14X4z3c1L
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 22:21:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KLWyEO1U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=leon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KLWyEO1U; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KR6KC44xzz302S
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 18:05:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87F07B80CC1;
 Sun, 27 Mar 2022 07:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF89C340EC;
 Sun, 27 Mar 2022 07:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648364698;
 bh=X/Z0U6GxGaaswFQP/q5cQDmThmBP/93x/RCyJbllhv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KLWyEO1UbxHyNVoDNL/roXtV3ntCYrCI14DuGtZmrvURMsaENvGmBhcc+g2Hq6z55
 pCz8tq91GZiUNxXtD3fqEWnRtwUk/l96208zjRGXFs2EG/+G48bk8zULB4LK0EyBCO
 aWWHH+YRsiC/wOgoJRq0aI40DzEEiCr4RsfopyrJI/n/eGgI9D0pQwRi80UxYM9ku7
 2WUBYW+VmxW0Jz1OfjOmv/4vfbdr93ZD/O/T0SKZemSzO6Zo0ZX5znzXDznONvXBDL
 GLr1ezU2BVJR+IpBfBz929i/iI/6pQ6EsbwWjly85gGpXcS3yeJScuLR+bTihqYbI7
 YtoQThz4uEpzA==
Date: Sun, 27 Mar 2022 10:04:54 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Benjamin =?iso-8859-1?Q?St=FCrz?= <benni@stuerz.xyz>
Subject: Re: [PATCH 11/22] rdmavt: Replace comments with C99 initializers
Message-ID: <YkAMlurdV15gNROq@unreal>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-11-benni@stuerz.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220326165909.506926-11-benni@stuerz.xyz>
X-Mailman-Approved-At: Sun, 27 Mar 2022 22:20:50 +1100
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
Cc: andrew@lunn.ch, linux-atm-general@lists.sourceforge.net,
 linux-ia64@vger.kernel.org, linus.walleij@linaro.org,
 dave.hansen@linux.intel.com, linux-pci@vger.kernel.org, robert.moore@intel.com,
 laforge@gnumonks.org, alim.akhtar@samsung.com, hpa@zytor.com,
 wcn36xx@lists.infradead.org, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, gregory.clement@bootlin.com,
 rafael.j.wysocki@intel.com, linux@armlinux.org.uk, krzk@kernel.org,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, rric@kernel.org, ajd@linux.ibm.com,
 arnd@arndb.de, kvalo@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, loic.poulain@linaro.org, bp@alien8.de,
 bhelgaas@google.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 26, 2022 at 05:58:58PM +0100, Benjamin Stürz wrote:
> This replaces comments with C99's designated
> initializers because the kernel supports them now.
> 
> Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
> ---
>  drivers/infiniband/sw/rdmavt/rc.c | 62 +++++++++++++++----------------
>  1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/infiniband/sw/rdmavt/rc.c b/drivers/infiniband/sw/rdmavt/rc.c
> index 4e5d4a27633c..121b8a23ac07 100644
> --- a/drivers/infiniband/sw/rdmavt/rc.c
> +++ b/drivers/infiniband/sw/rdmavt/rc.c
> @@ -10,37 +10,37 @@
>   * Convert the AETH credit code into the number of credits.
>   */
>  static const u16 credit_table[31] = {
> -	0,                      /* 0 */
> -	1,                      /* 1 */
> -	2,                      /* 2 */
> -	3,                      /* 3 */
> -	4,                      /* 4 */
> -	6,                      /* 5 */
> -	8,                      /* 6 */
> -	12,                     /* 7 */
> -	16,                     /* 8 */
> -	24,                     /* 9 */
> -	32,                     /* A */
> -	48,                     /* B */
> -	64,                     /* C */
> -	96,                     /* D */
> -	128,                    /* E */
> -	192,                    /* F */
> -	256,                    /* 10 */
> -	384,                    /* 11 */
> -	512,                    /* 12 */
> -	768,                    /* 13 */
> -	1024,                   /* 14 */
> -	1536,                   /* 15 */
> -	2048,                   /* 16 */
> -	3072,                   /* 17 */
> -	4096,                   /* 18 */
> -	6144,                   /* 19 */
> -	8192,                   /* 1A */
> -	12288,                  /* 1B */
> -	16384,                  /* 1C */
> -	24576,                  /* 1D */
> -	32768                   /* 1E */
> +	[0x00] = 0,
> +	[0x01] = 1,
> +	[0x02] = 2,
> +	[0x03] = 3,
> +	[0x04] = 4,
> +	[0x05] = 6,
> +	[0x06] = 8,
> +	[0x07] = 12,
> +	[0x08] = 16,
> +	[0x09] = 24,
> +	[0x0A] = 32,
> +	[0x0B] = 48,
> +	[0x0C] = 64,
> +	[0x0D] = 96,
> +	[0x0E] = 128,
> +	[0x0F] = 192,
> +	[0x10] = 256,
> +	[0x11] = 384,
> +	[0x12] = 512,
> +	[0x13] = 768,
> +	[0x14] = 1024,
> +	[0x15] = 1536,
> +	[0x16] = 2048,
> +	[0x17] = 3072,
> +	[0x18] = 4096,
> +	[0x19] = 6144,
> +	[0x1A] = 8192,
> +	[0x1B] = 12288,
> +	[0x1C] = 16384,
> +	[0x1D] = 24576,
> +	[0x1E] = 32768
>  };

I have hard time to see any value in this commit, why is this change needed?

Thanks

>  
>  /**
> -- 
> 2.35.1
> 
> 
