Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A1804FAF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 11:02:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FlKtbOeq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Skx0N0Fygz3cb7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 21:02:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FlKtbOeq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=mazziesaccount@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skr5J0dxpz3c9y
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 17:21:06 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c9fdf53abcso19184041fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Dec 2023 22:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701757259; x=1702362059; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EOqprCd4bG5T3dRTwPYRAAXTaR7ceVabdmLSc2XpaJ0=;
        b=FlKtbOeqGRUzNymzuImHEujnlPe2o0YvtGbUgmHJMSFj9e7jeF4EoLfwVfr2ch9Saj
         SA6o4jBlgAMx2kNsfC/MR+zXN6gt1Jwxfl3fYDyxNzzGTSCJSGoYHTGePgIiUashP2mL
         iOkDYGuQfAh9pvBMUlgEcw4SWxrG+QXqgqwPdRPDw61PWroXyZSvFuGMy372JyRQkEg+
         20cRgr/U2NPW6JcEY99+etJV6VwaWMWitoJqdWfk8kaUTYadBysMNU0CP1ZQKFoaR2gH
         CfxQfQNf/fl1uy3uBGNUYpWtr+n2o9iA/nOTNw5lQl3XN9ja6UATrEmdu4JOo6hdvAA9
         hQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701757259; x=1702362059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOqprCd4bG5T3dRTwPYRAAXTaR7ceVabdmLSc2XpaJ0=;
        b=H6i2qagmg11qa1uJOyocVrNnDQByqhZLVEeXB89OtPs71UDpv7pTIXnm7QDdzlNjIF
         As7I66aQMnhZxL8IMvrgXcnLFZJQo+Thhl40NeaNoKvwa+kuhB0F7kIdW9sA8cuHvSio
         eJBAE8YQiKhhGzI/wlFYqQ0NsCuJMDhkr+QGx5JDoSUaFnSwOKUMMbzRq+7kdOE3+MF+
         XW3axwuLjmyoiC07cepuqGgiCvwuy0PA1juiOihJ5yrWScfSCBmzAgFl3ICbChHBRoIp
         ZAT8c+KvfYmbRv58ynOTPlcLTCYR9qNaUy+EDtlFbMvewBwe2E/bd1RO/C2s/rU35pkD
         fxFg==
X-Gm-Message-State: AOJu0Yxt6FtqCFJCPUp5AiAyqYuLTlGCCpC4jIbPKqQSOBKC2wPQ243I
	hi/gXPAt1jTD0GE6604++T8=
X-Google-Smtp-Source: AGHT+IFEpn9/cYjwhdGUMp5Q8e82xnJ9Pnz3h+NI7jLulEvGm4X2k+vBHEEVziBdAvT0dyhQQPx1Rw==
X-Received: by 2002:a2e:8908:0:b0:2c9:ea39:5fe1 with SMTP id d8-20020a2e8908000000b002c9ea395fe1mr629301lji.9.1701757258904;
        Mon, 04 Dec 2023 22:20:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:16f8:1500::2? (dc78bmyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f8:1500::2])
        by smtp.gmail.com with ESMTPSA id e20-20020a2e8ed4000000b002ca0d8768a7sm296664ljl.93.2023.12.04.22.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 22:20:57 -0800 (PST)
Message-ID: <68533caa-d98f-4824-a761-82a09f419f41@gmail.com>
Date: Tue, 5 Dec 2023 08:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
Content-Language: en-US, en-GB
To: George Stark <gnstark@salutedevices.com>, pavel@ucw.cz, lee@kernel.org,
 vadimp@nvidia.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, hdegoede@redhat.com, andy.shevchenko@gmail.com,
 jic23@kernel.org
References: <20231204180603.470421-1-gnstark@salutedevices.com>
 <20231204180603.470421-2-gnstark@salutedevices.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20231204180603.470421-2-gnstark@salutedevices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 05 Dec 2023 21:01:31 +1100
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
Cc: kernel@salutedevices.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/4/23 20:05, George Stark wrote:
> Using of devm API leads to certain order of releasing resources.
> So all dependent resources which are not devm-wrapped should be deleted
> with respect to devm-release order. Mutex is one of such objects that
> often is bound to other resources and has no own devm wrapping.
> Since mutex_destroy() actually does nothing in non-debug builds
> frequently calling mutex_destroy() is just ignored which is safe for now
> but wrong formally and can lead to a problem if mutex_destroy() is
> extended so introduce devm_mutex_init().
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>   include/linux/devm-helpers.h | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
> index 74891802200d..2f56e476776f 100644
> --- a/include/linux/devm-helpers.h
> +++ b/include/linux/devm-helpers.h
> @@ -76,4 +76,22 @@ static inline int devm_work_autocancel(struct device *dev,
>   	return devm_add_action(dev, devm_work_drop, w);
>   }
>   
> +static inline void devm_mutex_release(void *res)
> +{
> +	mutex_destroy(res);
> +}
> +
> +/**
> + * devm_mutex_init - Resource-managed mutex initialization
> + * @dev:	Device which lifetime work is bound to

Work? Copy-paste error?

> + * @lock:	Pointer to a mutex
> + *
> + * Initialize mutex which is automatically destroyed when driver is detached.
> + */
> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
> +{
> +	mutex_init(lock);
> +	return devm_add_action_or_reset(dev, devm_mutex_release, lock);
> +}
> +
>   #endif

Doesn't the mutex stuff need a header inclusion?

Yours,
	-- Matti


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

