Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F04D22F7442
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 09:25:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHDlB4f3bzDsgf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:25:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.43; helo=mail-ed1-f43.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHDdt4c2MzDsbl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 19:20:50 +1100 (AEDT)
Received: by mail-ed1-f43.google.com with SMTP id s11so1279479edd.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 00:20:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bBlGeqvogN/tfxpT7qIQYHjcZ7UeRjnnIYs3P87C0W0=;
 b=mcT9QOP0AFCjGZuzWnEDO0K/dUWca/nhyxA5RzJ5K6fuBfKZ3MyqSb67Ob/9H50Smy
 Z2dvG9RACgblXEx6faEaZIGpzibrTGQ77G/QV2rjyWX4j5DK5VDdz20Qrhzxc7tMuOcI
 a21yAPfMd1AdRw9GOG3JtHvfkff5KP+lKl1ByFLr4SzjU+XjDqdnytkZt5WxdsMslqxQ
 PUIv5mA97IdyKS92PZcLsAfc+29zNQg+f++SIXf8UdzzFIvABACniNsYhXAO9QkxjBC2
 af5quSRAVS6iagpgwxaqJ6sSTALQlD2Ddx/0JRpKM3VEvyfCdoeMelBtsY9afCV/W2iM
 MYyw==
X-Gm-Message-State: AOAM532wlL11DU7dN6bnwP1gLnShcIUJ/RuA6AZ1AEbw/BRblDoJ2ABw
 Tqj5rnVPyIuc+xO5adOfz4E=
X-Google-Smtp-Source: ABdhPJwPRo+BZcR8EuEdLUaLQa2/MEEQ7N5QfiNCyKXjmI9rNiQ7nzOrspllBA1Qb61UYd4mriJXZw==
X-Received: by 2002:aa7:c603:: with SMTP id h3mr8806921edq.254.1610698846251; 
 Fri, 15 Jan 2021 00:20:46 -0800 (PST)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id ay24sm1005068edb.79.2021.01.15.00.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 00:20:45 -0800 (PST)
Subject: Re: [PATCH 3/3] tty: vcc: Drop impossible to hit WARN_ON
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210114175718.137483-1-u.kleine-koenig@pengutronix.de>
 <20210114175718.137483-4-u.kleine-koenig@pengutronix.de>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <046bdfe5-5741-0ebb-6cfd-2548f9a5543e@kernel.org>
Date: Fri, 15 Jan 2021 09:20:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114175718.137483-4-u.kleine-koenig@pengutronix.de>
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
> vcc_get() returns the port that has provided port->index. As the port that
> is about to be removed isn't removed yet this trivially will find this
> port. So simplify the call to not assign an identical value to the port
> pointer and drop the warning that is never hit.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> ---
>   drivers/tty/vcc.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tty/vcc.c b/drivers/tty/vcc.c
> index d9b0dc6deae9..e2d6205f83ce 100644
> --- a/drivers/tty/vcc.c
> +++ b/drivers/tty/vcc.c
> @@ -692,12 +692,9 @@ static int vcc_remove(struct vio_dev *vdev)
>   		tty_vhangup(port->tty);
>   
>   	/* Get exclusive reference to VCC, ensures that there are no other
> -	 * clients to this port
> +	 * clients to this port. This cannot fail.
>   	 */
> -	port = vcc_get(port->index, true);
> -
> -	if (WARN_ON(!port))
> -		return -ENODEV;
> +	vcc_get(port->index, true);
>   
>   	tty_unregister_device(vcc_tty_driver, port->index);
>   
> 


-- 
js
