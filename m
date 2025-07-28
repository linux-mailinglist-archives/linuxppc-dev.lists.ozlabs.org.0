Return-Path: <linuxppc-dev+bounces-10422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2CBB1338B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jul 2025 06:07:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4br4gm3QrCz307K;
	Mon, 28 Jul 2025 14:07:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753675652;
	cv=none; b=ffevgCjucSINEMZEr6eKFmeHWppxgb50l0ssBuU/NCJwsWOV39W6d/2jeah3rkX1xcY9siS5eWmRsFCC1fECm1frCKkx444PIyDfYiSnB802ak7UQ0z6KJe9vX3g5eu7UbfBfu+zarYP0rwWHwmwk0xCZGHV0siE7DeT4rYfz0b0i4nHYMlMvvNrvMpXa2611qkcftINgmrG8p3uVu5R13Dl/Yo1aIFiRoG7F8ZkX4B8Kj3u30KTPPTy+Qf1vPG7V1AAbBnjF94FqRa2T8xVxsL/cavx8tsNYz2kmKaaqxU1EQoxUH7fT0/Q9Ckk0SAObWSCH0Y0swzq4IO3WA5ZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753675652; c=relaxed/relaxed;
	bh=wV6/zQ4yg2etN44nBlpFmTn2KJ2NFfwboTfeM9i/Axc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PcjHD2lUw3LzmpgjTWLd6oBcDBwAri++D7d24O+JKVRSkq5eGSThL6Ed/3+QVRoaCkNqSA2W/TWkGIfG/GixJ8Tt+kpuV5JF2VaD4sRf3XoJQJ8ToeNkHwKAuHuR6qorf4m8bUgV/3zZlgKr/UgwLdb/xA9/LC7J1D+rK5kH3V1hX59dKmzfbR58gmfNWNIDdtxghJlEKfQphfr55lkp2ByNi05G7/j21oI5uKqbJxzXPi2LediRWsRSmTrg8OSt77tZHyaaieRKkbXuKVdf38PWWSbJZpDmCUnld+RkcYmajzC9a3+BEw8ujx+9xVxC3WZffFdgBmOsDaj2f1B4bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=BTGCDQOf; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=BTGCDQOf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4br4gl0v33z2y82
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jul 2025 14:07:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25824418C3;
	Mon, 28 Jul 2025 04:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03B0C4CEE7;
	Mon, 28 Jul 2025 04:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753675648;
	bh=fdomNWLnFThVBOP8tgvg4AOSqOTTnoRZvG6osUoYBc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTGCDQOf1KOaG8Hzm+T3oiw/sydty6dZISJjRIgXAWBn6QqzfhCfdhbCZMBVhGmQ6
	 CjIUlZ0I33ohhNfPOWII1Nlyut0aso0TWmpPzwM6IQicfYSHa6mCAZKW2uheeTjK3M
	 dw5nDq/5RGbFv1oJP5jYFaz+n1MTTi6w2l8yYhwM=
Date: Mon, 28 Jul 2025 06:07:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
	john.ogness@linutronix.de, pmladek@suse.com, johan@kernel.org,
	namcao@linutronix.de, timur@kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] tty: serial: ucc_uart: use WARN_ON() instead of BUG()
Message-ID: <2025072814-splicing-sassy-f33a@gregkh>
References: <aIbV+WbhFMDamaiW@bhairav-test.ee.iitb.ac.in>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIbV+WbhFMDamaiW@bhairav-test.ee.iitb.ac.in>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jul 28, 2025 at 07:14:25AM +0530, Akhilesh Patil wrote:
> Replace BUG() with WARN_ON() as recommended in
> Documentation/process/deprecated.rst
> Fix system entering into unstable/break/undebuggable state due to use
> of BUG(). Follow strict suggestions as per [1] [2].
> 
> Link: https://lore.kernel.org/lkml/CA+55aFy6jNLsywVYdGp83AMrXBo_P-pkjkphPGrO=82SPKCpLQ@mail.gmail.com/ [1]
> Link: https://lore.kernel.org/lkml/CAHk-=whDHsbK3HTOpTF=ue_o04onRwTEaK_ZoJp_fjbqq4+=Jw@mail.gmail.com/ [2]
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---
>  drivers/tty/serial/ucc_uart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
> index 0613f8c11ab1..6214ab1b67cb 100644
> --- a/drivers/tty/serial/ucc_uart.c
> +++ b/drivers/tty/serial/ucc_uart.c
> @@ -223,7 +223,7 @@ static inline dma_addr_t cpu2qe_addr(void *addr, struct uart_qe_port *qe_port)
>  
>  	/* something nasty happened */
>  	printk(KERN_ERR "%s: addr=%p\n", __func__, addr);
> -	BUG();
> +	WARN_ON(1);
>  	return 0;
>  }
>  
> @@ -242,7 +242,7 @@ static inline void *qe2cpu_addr(dma_addr_t addr, struct uart_qe_port *qe_port)
>  
>  	/* something nasty happened */
>  	printk(KERN_ERR "%s: addr=%llx\n", __func__, (u64)addr);
> -	BUG();
> +	WARN_ON(1);
>  	return NULL;
>  }

You can't just do a search/replace for these types of things, otherwise
we would have done so a long time ago.

How did you test this patch?  The BUG() here assumes that if this ever
fires, the system is really broken, how have you recovered from that
broken state?

thanks,

greg k-h

