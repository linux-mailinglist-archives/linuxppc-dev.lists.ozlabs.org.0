Return-Path: <linuxppc-dev+bounces-14701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8AACAFDE0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 09 Dec 2025 13:06:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQcyY2WShz2yFK;
	Tue, 09 Dec 2025 23:06:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765281989;
	cv=none; b=fLUnDLT3tw8hlxvH7RRvyhu38UKzqiH3RwtpzGnedNrKa7QgVD9VxceX14SBtTRLAFQhik1g0YM7M4ns4j7MMJpDMitQwktHWOn3eGvtg3aywJaEcaNTxlHmrED0qt7KBl87/vHuIVYPZXBbjLyzZxsqrqrvxCrmDBBBHvGcCIP9MfGDcGfLJT8wGokHjABekZ/7zWN3ZdE54vjAZZeeF0RR3tDGP6ENlT9YHJv0Hf/OR5a1AzETs5875SI9MeaLt467nLth2sBxoog29+sh0Zg377zSjWIk6JCn4yky8EO0Qh0D7Ifcm8kD/WWu/thnUjUFdNcKifS1EAMuSy5AlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765281989; c=relaxed/relaxed;
	bh=2oBUs/Xeg0iHrAOwl+cmzce9yeqIJ3n3SQQbE9B/K3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DXlYkrXJs1rrW3t8s1IXBMe2HFFCBhVBy7N4eVBmHB9PXwJjdwXCh9t2PG+G20izuxu3Ss3RsscedjdnZ7lY/wF1InHZuJhzMQzd+R9eWgX4MfPetNsPNVoDRLmvrHd4KdUlIkiwocxOeYJnzCWbvI57BaLUe9xUhvKm7gAsQtclEq+vQ44GCq0/4tt0yqRvqz6kcZ1TFcq5cSzUyAszZgqRDPraYs23lo4epQURTADwmVSISzsT9NVTmYRj9hOHBQKu0cRxptLL6JlNMvoM5dJQnwp0AsxZWNzv+4tqBAfaMhyJnxl74tQQONZ2BIM1udvw8hSMvXqQcCtfLgDNcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fcg1gMJk; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fcg1gMJk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQcyX2sGxz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 23:06:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A57F160127;
	Tue,  9 Dec 2025 12:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F50C4CEF5;
	Tue,  9 Dec 2025 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765281955;
	bh=X2u9zZxh+1rv+/IM29w/6M1Ga67FE5iZdik7P6+xoUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fcg1gMJkgulL+QmYHsePZCrmmDYCmK+lvtL+YQbGlg+O8wNvDoiABrGCuH0cKrowp
	 luJ1qATscGqIc/vH8msAeLI8EfT6/2tMMlfVa70PJDCh9TzxaUaUqhNja/Oe7qQ/Dn
	 2/YIr/so/u0GflsJaoXRbzUGtkjx++KjDqjE9+v2odR38qwRtM2WMlpz5ShXGH5UYs
	 WsDbopDyc4LhIuOBfFMXHCfCfB8M3NmcZDvN1Pgz9OPs0MIxNFTMudBJj6VpuoKObO
	 YLxWs1xzRylojfHDRZxW2qeGYY/phqhx0+u4can1X2XdFRgGJsRppFcYhazVqwSXWC
	 +pp4XTeg9AmTw==
Message-ID: <c51882f6-500d-481f-adf3-c257fb7ea47a@kernel.org>
Date: Tue, 9 Dec 2025 13:05:50 +0100
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
Subject: Re: [PATCH] bus: fsl-mc: Cope for unbound devices in fsl_mc_shutdown
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20251209115950.3382308-2-u.kleine-koenig@baylibre.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251209115950.3382308-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 09/12/2025 à 12:59, Uwe Kleine-König a écrit :
> Other than a driver's shutdown callback the bus shutdown callback is
> also called for unbound drivers. So check for the device being bound
> before following the pointer to its driver.
> 
> Fixes: ef980bda574d ("bus: fsl-mc: Convert to bus callbacks")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> I pointed out this issue a few days ago in the thread that resulted in
> commit ef980bda574d, but didn't receive a reaction so far. Given that
> ef980bda574d is contained in next, I guess it's time for a proper patch
> to fix the issue. Here it is.

Thanks for the fixup.

Nobody reacted against what you pointed out a few days ago so I guess 
this fix is OK.

Unless you mind I will squash it into previous patch to avoid having to 
manage the Fixes: tag update when I rebase to 6.19rc1

Christophe

> 
> Best regards
> Uwe
> 
>   drivers/bus/fsl-mc/fsl-mc-bus.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index 6bc163d2ca49..c08c04047ae2 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -162,7 +162,7 @@ static void fsl_mc_shutdown(struct device *dev)
>   	struct fsl_mc_driver *mc_drv = to_fsl_mc_driver(dev->driver);
>   	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
>   
> -	if (mc_drv->shutdown)
> +	if (dev->driver && mc_drv->shutdown)
>   		mc_drv->shutdown(mc_dev);
>   }
>   
> 
> base-commit: ef980bda574d3a2ebaa297def62f03d2222e6ef3


