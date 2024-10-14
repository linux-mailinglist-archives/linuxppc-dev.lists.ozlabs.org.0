Return-Path: <linuxppc-dev+bounces-2184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C99399BFD1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 08:10:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRn0P1glRz3bft;
	Mon, 14 Oct 2024 17:10:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728886245;
	cv=none; b=ODEP60gDFTO5JAu8b/dlT3SDstEwCELqR4KluwIJ6D5VSmWKzgpDzv8WYaD/Akuc0/j/Zuf8eWf2U9/K5Y4JgWXe3F7HltsT6pUua3DNbojv81DH9Yer7wXFrnpG1b7ZEqlbl79Qm2GT88u7yUjHLsj5pkXDK7wBGKLDLPpw0VTXguEExOQPBS+BrrN0QVFVEPbXpnb5uR4LYmIijwbuxXhzuTwLa+gzg7oGxIT2eeGPSqrwGqu6gGRKO9brZ1t422n8B0/M/nbaYwFjt5ofX+7txJQDURY9mQqjtJpuv6uy+jsCuxJEf/OihGFiIcdjPGBpqkw3AHrUomhYs10kuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728886245; c=relaxed/relaxed;
	bh=VXl8K9R+AsPQzajgHopX1HC5YVYkDkfG3JHXOUDVO0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPMNOCJeegoR1UjQM7yQqhHFJ/UJTmepBYp9Gxfxay1pS2YYoxgMXZGmpZiWG+7fKSJbEKcnIeZb/GZsZjL+BmOmzhkZ85zbH5Xgt/2G6Fuub7Ef6R7EyX9wSHv4EA3Ep9FrU4044/VM6Rq/orvWobibd94IcsbL63x8bj7Z5c46soay817LDlPkxhkDSY0eNCZcsHJqejjg5UmE8aqYhMtXiccKJE5dbF1/XAAhDKz9hpZS6HLH2DwYriZ6or7M0JYS1pKhje1/a0SI9esvCGdRiNtc61SGZqzO/1oQZ2IC/mvAP+SpuCvcP6wJTgjKmbO3DOONg0jCUsjuzr2x3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=e5kxh8wd; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=e5kxh8wd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRn0M52Bvz3bdX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 17:10:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C73955C5990;
	Mon, 14 Oct 2024 06:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44453C4CEC3;
	Mon, 14 Oct 2024 06:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728886239;
	bh=vtOULXzKh1W2zjoRRH7MNf2bpYcEKecnN3dY3aNLMSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5kxh8wdesQJ0pTug01/NkZeExuwthoVgZUktUVr+s/szlFweo7jeFGN5DGAw641X
	 1HqC/vulNeN0xjiBXuGBENKV/QLDFKwV/tobl31ROkTUGKA/9r+x/rAa1R/qNGU/b1
	 mJIYxxMrwmdXVJ2c+gJB78DB7j/keAhi5pGYExM4=
Date: Mon, 14 Oct 2024 08:10:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] tty: hvc: riscv_sbi: instantiate the legcay console
 earlier
Message-ID: <2024101402-starlet-riverside-02d4@gregkh>
References: <20241014000857.3032-1-jszhang@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014000857.3032-1-jszhang@kernel.org>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 14, 2024 at 08:08:57AM +0800, Jisheng Zhang wrote:
> The hvc_instantiate() is an early console discovery mechanism, it is
> usually called before allocating hvc terminal devices. In fact, if
> we check hvc_riscv_sbi's hvc_instantiate() return value, we'll find
> that it's -1. So the calling hvc_instantiate() is too late.
> 
> We can remove the hvc_instantiate() to only rely on the hvc_alloc() to
> register the kernel console. We can also move its calling earlier so
> the kernel console is registered earlier, so that we can get kernel
> console msg earlier. We take the 2nd choice in this patch.
> 
> Before the patch:
> [    0.367440] printk: legacy console [hvc0] enabled
> [    0.401397] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> 
> After the patch:
> 
> [    0.004665] printk: legacy console [hvc0] enabled
> [    0.050183] Calibrating delay loop (skipped), value calculated using timer frequency.. 20.00 BogoMIPS (lpj=100000)
> 
> As can be seen, now the kernel console is registered much earlier before
> the BogoMIPS calibrating.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

What commit id does this fix?

> ---
>  drivers/tty/hvc/hvc_riscv_sbi.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
> index cede8a572594..d2ecfbf7c84a 100644
> --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> @@ -68,12 +68,10 @@ static int __init hvc_sbi_init(void)
>  		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 256));
>  		if (err)
>  			return err;
> -		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
>  	} else if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
>  		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 256));
>  		if (err)
>  			return err;
> -		hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
>  	} else {
>  		return -ENODEV;
>  	}
> @@ -81,3 +79,18 @@ static int __init hvc_sbi_init(void)
>  	return 0;
>  }
>  device_initcall(hvc_sbi_init);
> +
> +static int __init hvc_sbi_console_init(void)
> +{
> +	int err;
> +
> +	if (sbi_debug_console_available)
> +		err = hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
> +	else if (IS_ENABLED(CONFIG_RISCV_SBI_V01))
> +		err = hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
> +	else
> +		return -ENODEV;
> +
> +	return err < 0 ? -ENODEV : 0;

Please spell out a ? : line, it's not required here.

> +}
> +console_initcall(hvc_sbi_console_init);

Are you sure this will always work properly?  For some reason the
original code did not do this, you might want to check the
lore.kernel.org archives to find out why.

thanks,

greg k-h

