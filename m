Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B172F7437
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 09:22:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHDgV5BS5zDsfJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:22:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.54; helo=mail-ed1-f54.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHDd05xVDzDsbM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 19:20:00 +1100 (AEDT)
Received: by mail-ed1-f54.google.com with SMTP id s11so1277356edd.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 00:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q3u1c2cmK2DITir507fdDBtH+U4eOB5jtHbxWlFMVtQ=;
 b=WY0S/hzXONrzB2ZcI3RDdejcRLXjFAd7fUzYEH2EefWpNuKyDaZOporbC+Jnj7A09p
 NQqJiL0bIEZ29RTO7QTxu0AqTzqUcUSzs7oEssrcxjSKwwcc3BLd1gail7da7YlRNTb5
 WmiQXmLhuX3GGFgK3xa9fdEUPptqySfZCIzm7nb3w6bEt+W5aOeWcKIRbGbTRuSApCek
 B7tU+e1WqcdEhuQS+0+0SiSgpj+Mw16r4PXUZ6w00MZmvfC3ENqzmn7lWxHj1aunuATS
 a4UEBQJ9M1NcOGiBltK2sSIQkmio969scsd+0Z316/tn8nwzF7hB3nCwlGOcvOm3kv3W
 kouQ==
X-Gm-Message-State: AOAM531qSFrfjlF3JXkHipt9N/v90DsxpTYcLnc0xvmZQBhnlVU6q9OQ
 D1yYb9CLoXKNDN6iGgfWVTg=
X-Google-Smtp-Source: ABdhPJwWBbtrNN8Dt/03jdN8TWPQGNvz2cTqSx6WvSbbavMAhwqQ7OozTqX2J4z2mqMcfAOpbO1pBg==
X-Received: by 2002:aa7:d2d4:: with SMTP id k20mr6782073edr.361.1610698796929; 
 Fri, 15 Jan 2021 00:19:56 -0800 (PST)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id o20sm2929393ejb.123.2021.01.15.00.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 00:19:56 -0800 (PST)
Subject: Re: [PATCH 1/3] tty: hvcs: Drop unnecessary if block
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210114175718.137483-1-u.kleine-koenig@pengutronix.de>
 <20210114175718.137483-2-u.kleine-koenig@pengutronix.de>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <1afca17b-f148-4412-c80f-6168e79fd2ac@kernel.org>
Date: Fri, 15 Jan 2021 09:19:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114175718.137483-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14. 01. 21, 18:57, Uwe Kleine-König wrote:
> If hvcs_probe() succeeded dev_set_drvdata() is called with a non-NULL
> value, and if hvcs_probe() failed hvcs_remove() isn't called.
> 
> So there is no way dev_get_drvdata() can return NULL in hvcs_remove() and
> the check can just go away.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> ---
>   drivers/tty/hvc/hvcs.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
> index 509d1042825a..3e0461285c34 100644
> --- a/drivers/tty/hvc/hvcs.c
> +++ b/drivers/tty/hvc/hvcs.c
> @@ -825,9 +825,6 @@ static int hvcs_remove(struct vio_dev *dev)
>   	unsigned long flags;
>   	struct tty_struct *tty;
>   
> -	if (!hvcsd)
> -		return -ENODEV;
> -
>   	/* By this time the vty-server won't be getting any more interrupts */
>   
>   	spin_lock_irqsave(&hvcsd->lock, flags);
> 


-- 
js
