Return-Path: <linuxppc-dev+bounces-15978-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD92D3A646
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 12:07:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvnjX33NTz30Lv;
	Mon, 19 Jan 2026 22:07:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768820848;
	cv=none; b=SZLxXFfJ5ph2H9l99RJZvvIQ5SEJ8HQpCet3Y3X7kMjd/sib0BC70iHIr4i+vh2gAWRC4Yysb6vpGkgVUY9MhTkyrkT8Cen7zk7at+2qGxbyQoGVyVObmdv5hitHT0z6nBVX2U5W6LL2d1Dexh9Dh6LKT1PV9Vi+37sdpn7LGhDoaCgcqwEkEiQqvwW54EIpuKdVkNBoVHo79GgYUonbiZ8E43r2ul2ylj9KDR2WgZcFxE7g3t+ejlmKaaOpQcOL6kDwE3uIXWfjCpND8RvVhDm26YmpA3ONnXTITghVdmsNeGlNOrfDieHTNjmc9yF7qxoRUuOAAQHTlyoTFRlwHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768820848; c=relaxed/relaxed;
	bh=5UVMLN1VUYbL2fz93vyHWvDDcYyJoHLixv8ttRq8yT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEExjFC+85GbP/M0s0cf7UASivLo6nZHImBEfHfnAOvUYbN0RElNRNNPogZoe4z+aDw8p8DfVFUIfOeeYjpri+/BrZs3nJW0B8KDbK2wctIV+2eDapS1Zaok/hm7YKMDUDSkP9NOKDReTSXplJr0XAp6hU29z8QR/OrXa7VcW22QOv3390A70os76oM//SeBSfE5mjI/Zp0GaJvqfsPxno3a77aIsjeAdUPDTSGdqze/rH1JIkjPJYaj+/l5yeiQ4QB5cQN+uIJsAZ7ur8kf9sJ9lyzskuCJa2B4hL+7gPBrKqqIj67PRxa3ZQI2cffijx4il/B8Rj6/23D5UlPA1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EOAvqiNc; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EOAvqiNc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvnjW60C4z2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 22:07:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E2FA43814;
	Mon, 19 Jan 2026 11:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C991C2BC86;
	Mon, 19 Jan 2026 11:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820846;
	bh=cXrQIGq8ghQgg/2tKSWr1ulwNeEYtyDoK9Rxf5XR8Yg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EOAvqiNc4GCvpD1yjoAwVDRZs2iT3IOHlR+F2UAQgOWkMSzesel6Wo+CtWlDfgLIb
	 qqHUdETE4YPQTAgxHXz2Oi1pooZondcvSnLIQAJQ3VA4HAXzzNdikqzVnvH6Xp2Jiy
	 jGUZZrqJnKUSiqvJSxLoBLPuqA09ZDrUfeptW+ykgZvtNOlFtE7cWeGQvgLNRN9Rps
	 aiBTNnR7reEZiRE+bvdOBbOodjPBb6QCyxISi5V15oNoJMi9e8XOC6wQoxs/mKjUxg
	 5LhAd/bl1GXRdTVXfeezwp7e7H/AV+WWwSvtEDZtnnkRvV4e5W1O3AK19Nte89q32h
	 5yUGiBiFsW5BA==
Message-ID: <70d9ba17-59c2-4fc4-89f8-598667daea73@kernel.org>
Date: Mon, 19 Jan 2026 12:07:19 +0100
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
Subject: Re: [PATCH 2/8] base: soc: order includes alphabetically
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
 <20260119-soc-of-root-v1-2-32a0fa9a78b4@oss.qualcomm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260119-soc-of-root-v1-2-32a0fa9a78b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 19/01/2026 à 11:40, Bartosz Golaszewski a écrit :
> For easier readability and maintenance, order the included headers
> alphabetically.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   drivers/base/soc.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> index 282c38aece0de88049dc1e6e9bea00df52bed1ea..6f42632d2b0fcc8a729484e6ad270f9bcabe4a0b 100644
> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -5,16 +5,16 @@
>    * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
>    */
>   
> -#include <linux/sysfs.h>
> +#include <linux/err.h>
> +#include <linux/glob.h>
> +#include <linux/idr.h>
>   #include <linux/init.h>
>   #include <linux/of.h>
> -#include <linux/stat.h>
>   #include <linux/slab.h>
> -#include <linux/idr.h>
>   #include <linux/spinlock.h>
> +#include <linux/stat.h>
> +#include <linux/sysfs.h>
>   #include <linux/sys_soc.h>
> -#include <linux/err.h>
> -#include <linux/glob.h>
>   
>   static DEFINE_IDA(soc_ida);
>   
> 


