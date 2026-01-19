Return-Path: <linuxppc-dev+bounces-15976-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4821D3A63B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 12:06:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvnhb4RZ4z2yql;
	Mon, 19 Jan 2026 22:06:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768820799;
	cv=none; b=mWARApgQ2w1Y3Kf4XvF1GEJVb0w6aBD2J72zhkO2rRc3x5QbizevC3dCkbcrEGLMcZeiAjpkoiuefeMXrdw66/VUi2LfKh2NaU2wZ/Go4FKGCWXwPAVa+tSmCL9nisahHnfx2dLfntM8aNrd2WH0sUxOQiQYaHXlYOViI0nH1q6a13pGW3Qgkvc9xbxNBkOgFy8oR8iCOA6aKOhGE0GDtPT9nJYPZ/j3nMwRf/CRaIBNGkMRQxU/pDDU/a21fqJPLezsIN0A5VeZhvdoK3woD89asOSgz6etUnPy2ZRmUOqJDJsHj+bVSLrM+JuHFykqaE14jRm8hExAhlg0yLaF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768820799; c=relaxed/relaxed;
	bh=wTcJSDPIuXc2BRXtTdktb3sp/gm8014rK/KaO9PcsTs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nkFvgSbBbnrKVTJD6W4+FD2pCHu1WI8VzNrj93iUbIoZToA9k0t0YVV6NIARF8u15aDFHxDH26LY4J9Hwpv2ylMEDavT8r7y+cevB6iTvTln9FBYi6AG5qVh6ZmgNb7SmuStA0uoT8xHyW3SB4+B7plvsaC7P+lmzCf8MAc4QBqlWoqZZ0NFMeCsfhK8wNMkHwhnQo9AwdtkFxrI9AWlTSHBNAQDHm0+C6hjNZFWmq8N4Wku42Xy2+HWI19dfRW146JbqA+W1oIBk8jJaYzWYh60ZvHfm9HAbO0SHU0SAagekqTvvXSz/uiASBy99Hht0PwDaCH+d9BWwE6bP5kqQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CLLu2Tkf; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CLLu2Tkf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvnhZ4z5Sz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 22:06:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 586136014E;
	Mon, 19 Jan 2026 11:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567EEC116C6;
	Mon, 19 Jan 2026 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820796;
	bh=vH6Vlkg2BY1oUWpSb3QdiyQ62uOlof27g0kCxt0BO8E=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=CLLu2TkfsudAo/bZ7JuCbtFNh8LcOSZNlfBRZvzcdm5D/xVD2rH81SrtkypRhLLnO
	 UqT0CH4uHuPPzxJDmSrXnwfUtWK+OC047MUKYp1nsHBz97lHPXlzt/x+hN8y/gp0MP
	 UYmeS8ASB6B4UXk6GqFIRKD5+A5JIGkDVL7/2b5x7nzBpq/NZtntetCRW5EyU9TSBN
	 q64nfm73xVcfypAej5Iu8oOkpB6EbjW9v9+cz/iGU79FRsBHhn4arUae+a9kp9mNYv
	 up9PwtgEsBkDdHkH92WL0RJjiY4LHT+feX8z+w3nooL2Hb9ZY+eAZ8gtbeEqslJxBC
	 Hg/xhyFbkLSdg==
Message-ID: <d6986e8a-e3d6-4974-acda-962e1c240121@kernel.org>
Date: Mon, 19 Jan 2026 12:06:28 +0100
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
User-Agent: Mozilla Thunderbird
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH 4/8] soc: fsl: guts: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-4-32a0fa9a78b4@oss.qualcomm.com>
Content-Language: fr-FR
In-Reply-To: <20260119-soc-of-root-v1-4-32a0fa9a78b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 19/01/2026 à 11:40, Bartosz Golaszewski a écrit :
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Acked-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   drivers/soc/fsl/guts.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index 6bf3e6a980ffc67c21ed7b62b5b638e37f27454e..88ba32a40f6a27f8ffd13624e940aa0edf48586f 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -186,7 +186,6 @@ static int __init fsl_guts_init(void)
>   	const struct fsl_soc_data *soc_data;
>   	const struct of_device_id *match;
>   	struct ccsr_guts __iomem *regs;
> -	const char *machine = NULL;
>   	struct device_node *np;
>   	bool little_endian;
>   	u64 soc_uid = 0;
> @@ -217,13 +216,9 @@ static int __init fsl_guts_init(void)
>   	if (!soc_dev_attr)
>   		return -ENOMEM;
>   
> -	if (of_property_read_string(of_root, "model", &machine))
> -		of_property_read_string_index(of_root, "compatible", 0, &machine);
> -	if (machine) {
> -		soc_dev_attr->machine = kstrdup(machine, GFP_KERNEL);
> -		if (!soc_dev_attr->machine)
> -			goto err_nomem;
> -	}
> +	ret = soc_device_get_machine(soc_dev_attr);
> +	if (ret)
> +		of_machine_get_compatible(&soc_dev_attr->machine);
>   
>   	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
>   	if (soc_die) {
> @@ -267,7 +262,6 @@ static int __init fsl_guts_init(void)
>   err_nomem:
>   	ret = -ENOMEM;
>   err:
> -	kfree(soc_dev_attr->machine);
>   	kfree(soc_dev_attr->family);
>   	kfree(soc_dev_attr->soc_id);
>   	kfree(soc_dev_attr->revision);
> 


