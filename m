Return-Path: <linuxppc-dev+bounces-15979-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D95D3A64C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 12:08:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvnkP69rBz2yql;
	Mon, 19 Jan 2026 22:08:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768820893;
	cv=none; b=iSrciJPGW6XZzRPMO8rOCYXRW/EXG2LVzQFQXkh+FXl9/gP1IRhWBG7omj5m0q2umEwt4void+7/gbytgxhrB6gxeynmPlG0WpgSDRLtyJvZZnlQG6OoWDbF6CaSsjFmWNpD5ktqle7y4nIDKx7UNzVkx3qprHiLYLuo9rfP64gsDB/Kjmbmq7UdcjOgo0JnIga0Z2xndylVlcFspy2mTLkKJWNmTvOmTX19DQBbMnPooZ5X92ImFEQFt+Pw3p5v1A6fM4FD88iv1JGuQMwaBUtLTZK+bOgFvTt5VbiENixa2S2dF7w7ZD/YlXxNIU5qmNn+RZCrZnRhXhl2IGro/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768820893; c=relaxed/relaxed;
	bh=0j8xZJKX/4mbINzA6wXnFac2i+N8zyKdGYZVUMx/a+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hp8L55xWx0ik5i7Wtgy2ethFnBF3yvkceJzgm8bqPVoF4ADGxX1Qu9yPVi48EWUIlZXX3Dmb2lIEVmYxkWzQarusdaVE8Bi67BGuGcxGitqWF6JUfh0im4Xhgfm4/3m8Hp99JJoXp2lLX957J+Xnheq54KuelHtLmy54iJVMollw8WRffkt1eYGObtZfoPWDfHqIhxxH1VOb0j/ymUUdsbBbnE6tKquKrjEGLHcB/cNlF+UXVmx1BBPRKfIL3VKuNKJoH87GNB6TrfXwuCSw3acjBGBFUF9LMcpE8+ir0qgsTfujFeIwr6VSExfLshwkUOtolSGdWqNutZ+BhrPCog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nep/NM8G; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nep/NM8G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvnkP09c8z2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 22:08:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F6C941986;
	Mon, 19 Jan 2026 11:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C115C116C6;
	Mon, 19 Jan 2026 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820891;
	bh=fOCQQatKJkAsP/8aCqj/CsMBsA/Znj0mtdxM6Z1bniQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nep/NM8G8LkTEJd5plGPg9EQoqA/Jk3Te//DN57NcVg99WM5Tmu9m/En4Lq/XbxSW
	 8tFsNoGyCBi514D8uUE6IhigyDSkHHy9NNjZmPD7fH5G9f4G5fhV1XBdvuvlr7g+OP
	 MkSkyDiIh8gNd5hNBMXpbMPW/b31+MpuWPkyW8nK30G1C7793fOeq0FZ1GWa6rEOc2
	 F7ctsmLlXgEJrQo9kccckQ0JfYchVr42jjohlOOAZi1txpzP8gD2AgiJIA9ReX7F5F
	 A7TUSgK8XmxyIULpB18MIwQN0BybFvJnZK+F28d5q++GnKL/yryTTzZ4JP6H0Na9+4
	 F6JFGXJPWGAmg==
Message-ID: <db748d3f-53c8-43cc-a5bc-94940252ca0c@kernel.org>
Date: Mon, 19 Jan 2026 12:08:05 +0100
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
Subject: Re: [PATCH 3/8] base: soc: export soc_device_get_machine()
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
 <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 19/01/2026 à 11:40, Bartosz Golaszewski a écrit :
> Some SoC drivers reimplement the functionality of
> soc_device_get_machine(). Make this function accessible through the
> sys_soc.h header. Rework it slightly to return a negative error number
> on failure to read the machine string (SoC core can keep on ignoring
> it). While at it: make it use the __free() helper from cleanup.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   drivers/base/soc.c      | 16 +++++++++-------
>   include/linux/sys_soc.h | 10 ++++++++++
>   2 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> index 6f42632d2b0fcc8a729484e6ad270f9bcabe4a0b..bec8771d40f0590d4d7c3985c08fedfd4043a394 100644
> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -5,6 +5,7 @@
>    * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
>    */
>   
> +#include <linux/cleanup.h>
>   #include <linux/err.h>
>   #include <linux/glob.h>
>   #include <linux/idr.h>
> @@ -111,17 +112,18 @@ static void soc_release(struct device *dev)
>   	kfree(soc_dev);
>   }
>   
> -static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
>   {
> -	struct device_node *np;
> -
>   	if (soc_dev_attr->machine)
> -		return;
> +		return -EBUSY;
> +
> +	struct device_node *np __free(device_node) = of_find_node_by_path("/");
> +	if (!np)
> +		return -ENOENT;
>   
> -	np = of_find_node_by_path("/");
> -	of_property_read_string(np, "model", &soc_dev_attr->machine);
> -	of_node_put(np);
> +	return of_property_read_string(np, "model", &soc_dev_attr->machine);
>   }
> +EXPORT_SYMBOL_GPL(soc_device_get_machine);
>   
>   static struct soc_device_attribute *early_soc_dev_attr;
>   
> diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
> index d9b3cf0f410c8cfb509a4c1a4d6c83fde6fe33c6..2d2dbc18462a39ddee95e38826a769fab089026f 100644
> --- a/include/linux/sys_soc.h
> +++ b/include/linux/sys_soc.h
> @@ -37,6 +37,16 @@ void soc_device_unregister(struct soc_device *soc_dev);
>    */
>   struct device *soc_device_to_device(struct soc_device *soc);
>   
> +/**
> + * soc_device_get_machine - retrieve the machine model and store it in
> + *                          the soc_device_attribute structure
> + * @soc_dev_attr: SoC attribute structure to store the model in
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr);
> +
>   #ifdef CONFIG_SOC_BUS
>   const struct soc_device_attribute *soc_device_match(
>   	const struct soc_device_attribute *matches);
> 


