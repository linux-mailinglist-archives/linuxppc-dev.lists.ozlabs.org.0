Return-Path: <linuxppc-dev+bounces-13537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEFAC1C9F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 18:56:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxZgm37Dlz2yjm;
	Thu, 30 Oct 2025 04:56:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761760612;
	cv=none; b=P3oeoZurNMTmb3mQf24eqk0FAzpiMgs+7YPvbTdZloU0AM+rFQ2Xj0wdVJpN2WryNf/5hJsd7V7Vn6kRX6QXtQP/aZb4YmT3xSTWJumN1/RptaIJqVmrMVyBokabD0plaEzBnk9is0fpBVUL6XXoOT+l4ssd/K36fZEastBix9aj20ZNVjsQmErAc28yS0BPWHgH7kOmvTNa0QtHuml/TqVLQR04srWnHJxhLHzWRvDRuWIHFqAFiwWBmA6N208Rp4aLBF9oo+sjELD+5kT82VWIiBfv6PXsrxWvUsPjexAwScLRi/+oh3LkeOhMKErZ+69sZA0ouEhx/8KmvzHAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761760612; c=relaxed/relaxed;
	bh=2XX/5rMl5M7waHNttl+P5V8RxDNoEAxbGh8REpvOdK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=oB0d9CsL5kf/Cp5eMOIAE7u3uv+SbgxSKhm8PORMzgB80y6ozeCyO6VvtnwdbESCzOhUDJMoFHi/mf2G6aqiUNRs0jJJtxnW3r88PQoTr7kEnKchglICJSUBk4lw8t/gwKogqwelsfKLoKI4PfjReDF8xH4FEYckyckt8qB6Ux1kul0yw1fD2+2Z259ns2P/cNws/lKic5+CjLrRNOPEQ94GEdFYcb4MJa1OQyIBxWJc+amtILpJOGLwCaMM/lM7OK9Gp8npr0UE+5coix7kpbZpYl7xY++PKH4O6IWsuNDjf1K9YJBRvrf1qdJJavaWixYus2fDUXjM+ORLfDO8ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WefDjtFQ; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WefDjtFQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxZgl3F0Bz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 04:56:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 568C561F0D;
	Wed, 29 Oct 2025 17:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA482C4CEF7;
	Wed, 29 Oct 2025 17:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761760609;
	bh=VzK5oAorESm47QWMsddWXTePfWCCmkkIk79NLObV5bc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=WefDjtFQxaqNITeCzyBwduPSq6eq7KGJtsT2AF0tpE+HPH+tjK4IzpZavlRn/5XsQ
	 bAqy+ezFjPZQf9TOZPQl6LXTvXW9IfgUJjbAoy5vs36s3bfKfYzKQg/z1bubPH73jh
	 1ItJud1AeLXZlnq4bcVqu3rpaUAMlJkdHmPuONikaXEvzkph5eumYyBiA1nwLpgQr4
	 QSEpHgWx8G4kOS7ej8Kp+v5EZVkYD3yl7v3+XLUa3lNShkcaOmr1AUVB0MzBpFpGOj
	 pC344FC62eHwyUuXg2zk98jn071eznE2X1eDI8XnNdAIINuY4R7ZrZ6Wl5YCNKdj1p
	 /8lus9PKvBXYA==
Date: Wed, 29 Oct 2025 12:56:47 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of
 global variable
Message-ID: <20251029175647.GA1572736@bhelgaas>
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
In-Reply-To: <20251029163336.2785270-5-thierry.reding@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 29, 2025 at 05:33:33PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Pass the driver-specific data via the syscore struct and use it in the
> syscore ops.

Some of these things in drivers/clk/ are also platform_device drivers
(though not this one) and use generic power management, e.g.,

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/qcom/q6sstop-qcs404.c?id=v6.17#n209

I have no idea if that's desirable or practical here, but using the
platform_device model instead of syscore could have advantages in
terms of modeling device dependencies and ordering.

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - adjust for API changes and update commit message
> 
>  drivers/clk/ingenic/tcu.c | 63 +++++++++++++++++++--------------------
>  1 file changed, 30 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
> index bc6a51da2072..8c6337d8e831 100644
> --- a/drivers/clk/ingenic/tcu.c
> +++ b/drivers/clk/ingenic/tcu.c
> @@ -53,9 +53,9 @@ struct ingenic_tcu {
>  	struct clk *clk;
>  
>  	struct clk_hw_onecell_data *clocks;
> -};
>  
> -static struct ingenic_tcu *ingenic_tcu;
> +	struct syscore syscore;
> +};
>  
>  static inline struct ingenic_tcu_clk *to_tcu_clk(struct clk_hw *hw)
>  {
> @@ -332,6 +332,29 @@ static const struct of_device_id __maybe_unused ingenic_tcu_of_match[] __initcon
>  	{ /* sentinel */ }
>  };
>  
> +static int __maybe_unused tcu_pm_suspend(void *data)
> +{
> +	struct ingenic_tcu *tcu = data;
> +
> +	if (tcu->clk)
> +		clk_disable(tcu->clk);
> +
> +	return 0;
> +}
> +
> +static void __maybe_unused tcu_pm_resume(void *data)
> +{
> +	struct ingenic_tcu *tcu = data;
> +
> +	if (tcu->clk)
> +		clk_enable(tcu->clk);
> +}
> +
> +static const struct syscore_ops tcu_pm_ops __maybe_unused = {
> +	.suspend = tcu_pm_suspend,
> +	.resume = tcu_pm_resume,
> +};
> +
>  static int __init ingenic_tcu_probe(struct device_node *np)
>  {
>  	const struct of_device_id *id = of_match_node(ingenic_tcu_of_match, np);
> @@ -430,7 +453,11 @@ static int __init ingenic_tcu_probe(struct device_node *np)
>  		goto err_unregister_ost_clock;
>  	}
>  
> -	ingenic_tcu = tcu;
> +	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
> +		tcu->syscore.ops = &tcu_pm_ops;
> +		tcu->syscore.data = tcu;
> +		register_syscore(&tcu->syscore);
> +	}
>  
>  	return 0;
>  
> @@ -455,42 +482,12 @@ static int __init ingenic_tcu_probe(struct device_node *np)
>  	return ret;
>  }
>  
> -static int __maybe_unused tcu_pm_suspend(void *data)
> -{
> -	struct ingenic_tcu *tcu = ingenic_tcu;
> -
> -	if (tcu->clk)
> -		clk_disable(tcu->clk);
> -
> -	return 0;
> -}
> -
> -static void __maybe_unused tcu_pm_resume(void *data)
> -{
> -	struct ingenic_tcu *tcu = ingenic_tcu;
> -
> -	if (tcu->clk)
> -		clk_enable(tcu->clk);
> -}
> -
> -static const struct syscore_ops __maybe_unused tcu_pm_ops = {
> -	.suspend = tcu_pm_suspend,
> -	.resume = tcu_pm_resume,
> -};
> -
> -static struct syscore __maybe_unused tcu_pm = {
> -	.ops = &tcu_pm_ops,
> -};
> -
>  static void __init ingenic_tcu_init(struct device_node *np)
>  {
>  	int ret = ingenic_tcu_probe(np);
>  
>  	if (ret)
>  		pr_crit("Failed to initialize TCU clocks: %d\n", ret);
> -
> -	if (IS_ENABLED(CONFIG_PM_SLEEP))
> -		register_syscore(&tcu_pm);
>  }
>  
>  CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
> -- 
> 2.51.0
> 

