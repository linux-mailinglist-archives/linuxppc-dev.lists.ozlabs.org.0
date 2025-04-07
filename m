Return-Path: <linuxppc-dev+bounces-7501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34396A7ED71
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 21:35:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWfYn3MZwz2yr6;
	Tue,  8 Apr 2025 05:35:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744054509;
	cv=none; b=c22t/YDYe1456Lnznlxqdzz/CUhmfPgT+S9L4qYUz9I8HfAh+adj+3Nkv4I7YJeBqP8PDFUbhoW9tP8gTZYZn2kg7B3mFPlT7px8pyNnCfN17haPClHD2FMbpH/9K32XvQFs8lkQ+KPFF4WGC2B7WqI7yUuc1I//mSfhVvgn+iRUAdZ4SMeUHQ4ly3ztpvoCmobHVgl2trsFuBVTm8Ul/5KXP5obRkGgfJB036V4VA2gisL7UJj4Ep9c/ZEeGUJjdhDLpgKyyFtvng/JmDXuOsGTaANor4I41v1Ta1LKJt5Qfa9aYJyftnnSJKRY6AqWzs62YQ0dLMpP5s8nlu001g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744054509; c=relaxed/relaxed;
	bh=DVJ4GuVVHtqsBDi7tugR1KJnADU0CpN8EXx54ExKKeQ=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=VFkhZjfyarXzncduTf9e+dWb7BkLfSBhwAh94L4D5F0HotQY+lnqfRKC4yAKgb5HxAWPN3UCbGiSjVjvj38blCuExMf+W88QJFcoMsHaZTuHdFVXKKatvzzGn2axQotWNNetTUODYf9vyAw9aPT9u0+GPd0v66G7yhquJKEonVNfwUsnFfJMINyLpqBHlJB5YK2oa45iculicI+JzsS8Udr6nDRs/fd0n/T82wnX+F/b27zFBD2evwQltySyIZcFBXDSlvkS+0eIJ0XcVoN/sXxNGHqFSiR3o2jsnghIhBJBLE3wuXtVkWTl3TMsy9Epmr/pSMb35xiTYWaWlV4F1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NVPgT29u; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NVPgT29u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWfYm3DQZz2xRx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 05:35:07 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-af579e46b5dso3076540a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Apr 2025 12:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744054505; x=1744659305; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DVJ4GuVVHtqsBDi7tugR1KJnADU0CpN8EXx54ExKKeQ=;
        b=NVPgT29uTxp5K4y9wjiOBtyx1nE4acMM6hgKmFsunJXA2gGSmXqiR3d/braDnZ7Fmf
         9WgK5V3orPyiktD4c65NbBiAcd5R2MfVnNdd2a9wTihNr6o3I16KpLCfSyeZ6SO3bGek
         hjWWIgAPu8XY9UC0m0tWt1a89AzQnscIWYvozBSptqqxhE6Wx3uodHkd5Onarz9nbXzt
         4dgmoAPiZ7pmNFTKq8b4SYgT2W0FSf3QZgkUqzL8nihXL88cBgv9M645BD7J1ZGMnxHB
         0ZM6khoZHUbjxVowRZPrJiP+b2u/6JWkIT5zsWCYDw7GFwrDFLD48rYgIXDiwtK2P6Lv
         qmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744054505; x=1744659305;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DVJ4GuVVHtqsBDi7tugR1KJnADU0CpN8EXx54ExKKeQ=;
        b=oTlqMkFcpCE7jDNw5z7DR3u6LRKHxjcV2oKob+x7k/v09FPNT+drppsRAR+d+lqeVG
         a9bZakOFdoWxkqQ9O+1gLj3bFfIkjVPPmINHgYTdJxourSuRSisoyjhjgw+Ej/pfkbTU
         mmALymhuOs35ifF5hokoHGKqmbSaOM7oSuvi0PUfF4PJqx+IBQhyqJaPfb/2L4/UP6NA
         lrHDhqXPsrEnIv7kZ7Pqrho8BwPA4xbJ76AcoL4qI2LzmRIWH4H46OWgia9fitcAqloS
         isut26INdGCheyPdhOabyxZ1MZ79/XuI4Amurhz36N+ryHHdzGHMkddai3WudlrUBCkf
         UVMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWcLb0NBwnXxiknhWd1XMHd511C4jksAVDUQD2szRGHj6Jq5crKQwWbNVXdxCEjnbKcvkUnUqYSMvWz3E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwtaY2F6/pkZGhk8hPwccPfr0ZuTbIJN+qMnkhUMPW5ZYY1qrfa
	y9Chw8AmreVl8I2FtarkOjkTwzdq9XyA7W7QIln38G1o4TY2Qyh9
X-Gm-Gg: ASbGncthxRC80zdtb5KTtY0gmIYabOx1LNFvu7Wept/xbO4XhI7oxRX/0t6D7H3RQQN
	cGUF85MItxgsEzJyV6eyLfnl0jaOKZI+n4jC7V/X4PxzasCjo75xwEkVUpaNWj5QKUUijp0vSIQ
	XCb121BWmi+/ixjelIqpnab/1uxJUKPAUBZOKEpZ+do3lziA+Uwm0uAeoloxO+8rM50riNgzrnM
	LFU3nkJLPmEX0kk4yzOP9KVxKDyqNabHgW/3b3S+Li2bMKOjp2RP39yrdCrZK2zVDUNtQTLGV1o
	DYNCfZb7dc/cXuYvS3RT6zxFLKErlTgxZV0=
X-Google-Smtp-Source: AGHT+IEwR5LPIlJHU5C8CKnG2cRfeSQ0eaRv18zIYFGfx6blxBoZKJoQWTjslknSv3dhd7av10NJ2g==
X-Received: by 2002:a17:90b:2747:b0:2fe:d766:ad8e with SMTP id 98e67ed59e1d1-306a6112527mr16563789a91.4.1744054505379;
        Mon, 07 Apr 2025 12:35:05 -0700 (PDT)
Received: from dw-tp ([171.76.81.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca1f40fsm9522413a91.4.2025.04.07.12.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:35:04 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, paulus@ozlabs.org
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH] powerpc: Add check to select PPC_RADIX_BROADCAST_TLBIE
In-Reply-To: <20250407084029.357710-1-maddy@linux.ibm.com>
Date: Tue, 08 Apr 2025 00:40:24 +0530
Message-ID: <874iyzzt27.fsf@gmail.com>
References: <20250407084029.357710-1-maddy@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

Madhavan Srinivasan <maddy@linux.ibm.com> writes:

> Commit 3d45a3d0d2e6 ("powerpc: Define config option for processors with broadcast TLBIE")

We may need to add above to Fixes tag as well, no?

> added a config option PPC_RADIX_BROADCAST_TLBIE to support processors with
> broadcast TLBIE. Since this option is relevant only for RADIX_MMU, add
> a check as a dependency to enable PPC_RADIX_BROADCAST_TLBIE in both
> powernv and pseries configs. This fixes the unmet config dependency
> warning reported
>
>    WARNING: unmet direct dependencies detected for PPC_RADIX_BROADCAST_TLBIE
>      Depends on [n]: PPC_RADIX_MMU [=n]
>      Selected by [y]:
>      - PPC_PSERIES [=y] && PPC64 [=y] && PPC_BOOK3S [=y]
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504051857.jRqxM60c-lkp@intel.com/
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>

It's a bit strange that even though PPC_RADIX_BROADCAST_TLBIE adds
PPC_RADIX_MMU as a dependency where is it defined, we still have to add
an extra check for the same dependency to enable this for any platform.

The config generated by the 0day in the shared link, indeed had an unmet
dependency. i.e.

CONFIG_PPC_64S_HASH_MMU=y
# CONFIG_PPC_RADIX_MMU is not set
CONFIG_PPC_RADIX_BROADCAST_TLBIE=y


So, the fix look good to me. Please feel free to take:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


> ---
>  arch/powerpc/platforms/powernv/Kconfig | 2 +-
>  arch/powerpc/platforms/pseries/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
> index 3fbe0295ce14..95d7ba73d43d 100644
> --- a/arch/powerpc/platforms/powernv/Kconfig
> +++ b/arch/powerpc/platforms/powernv/Kconfig
> @@ -17,7 +17,7 @@ config PPC_POWERNV
>  	select MMU_NOTIFIER
>  	select FORCE_SMP
>  	select ARCH_SUPPORTS_PER_VMA_LOCK
> -	select PPC_RADIX_BROADCAST_TLBIE
> +	select PPC_RADIX_BROADCAST_TLBIE if PPC_RADIX_MMU
>  	default y
>  
>  config OPAL_PRD
> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
> index a934c2a262f6..fa3c2fff082a 100644
> --- a/arch/powerpc/platforms/pseries/Kconfig
> +++ b/arch/powerpc/platforms/pseries/Kconfig
> @@ -23,7 +23,7 @@ config PPC_PSERIES
>  	select FORCE_SMP
>  	select SWIOTLB
>  	select ARCH_SUPPORTS_PER_VMA_LOCK
> -	select PPC_RADIX_BROADCAST_TLBIE
> +	select PPC_RADIX_BROADCAST_TLBIE if PPC_RADIX_MMU
>  	default y
>  
>  config PARAVIRT
> -- 
> 2.48.1

