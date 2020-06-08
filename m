Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1601F12FC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 08:42:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gNwW0LsqzDqWK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 16:42:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.196;
 helo=mail-lj1-f196.google.com; envelope-from=jhovold@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gNv21qJQzDqT8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 16:41:16 +1000 (AEST)
Received: by mail-lj1-f196.google.com with SMTP id y11so17345023ljm.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Jun 2020 23:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z4UQh0Us0hQtEs1TDFqY5o6aN1qVDkFutQCZsE8JqaU=;
 b=eBfTgDhCmtIOpOGwb9DuaD0i7V7Pb0lEvWSiArRzyyRO3B5kcoTYkcEUkza0C9Cd6M
 emHGgdJl1GDTAVnm1saOeWgXJ2vebs7xIiuofET3xCftRWEoK8KPYa5WJDlb3XhqvDFn
 0coZzI+DnlTTM68hUyif+sea3KDSudWmsJgJjCkx3mrcrICLHNFMk8t7I1u1FzW0ipuJ
 gVw+MQhnBPLwOGaNMUE9jL/e3+2CSFtbQ5Posm9jU5eeCBjRbmtWiyKPIwdSTilc7Ga6
 isrXJlYrorkVy1VgClaqYvBjbdxIBHCGERwit7xAKTEnpBX99Z0gxB7Jw5qyO0olHZMJ
 jSRQ==
X-Gm-Message-State: AOAM530T7Hc3A9ADUO4DbgBWrozX4xdh1yj4HSC56aUSlw9tkJ4xIJyI
 tZJarim2GXX4cfUaI3s2WSE=
X-Google-Smtp-Source: ABdhPJw7i0D0egd72cvg61t4dDEMZ5Zoy6Geiu+vS8eBA4Z7uYi/XVCKJRKsmx3xMFnlXhqh8YnFKw==
X-Received: by 2002:a2e:8e27:: with SMTP id r7mr10196151ljk.382.1591598471669; 
 Sun, 07 Jun 2020 23:41:11 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id t26sm4169562lfk.61.2020.06.07.23.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 23:41:11 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1jiBSz-0003mQ-EB; Mon, 08 Jun 2020 08:41:05 +0200
Date: Mon, 8 Jun 2020 08:41:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] tty: serial: cpm_uart: Fix behaviour for non existing
 GPIOs
Message-ID: <20200608064105.GL19480@localhost>
References: <bafd8df9e743c433196c727293c5015620fae2b8.1591428452.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bafd8df9e743c433196c727293c5015620fae2b8.1591428452.git.christophe.leroy@csgroup.eu>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 06, 2020 at 07:30:21AM +0000, Christophe Leroy wrote:
> devm_gpiod_get_index() doesn't return NULL but -ENOENT when the
> requested GPIO doesn't exist,  leading to the following messages:
> 
> [    2.742468] gpiod_direction_input: invalid GPIO (errorpointer)
> [    2.748147] can't set direction for gpio #2: -2
> [    2.753081] gpiod_direction_input: invalid GPIO (errorpointer)
> [    2.758724] can't set direction for gpio #3: -2
> [    2.763666] gpiod_direction_output: invalid GPIO (errorpointer)
> [    2.769394] can't set direction for gpio #4: -2
> [    2.774341] gpiod_direction_input: invalid GPIO (errorpointer)
> [    2.779981] can't set direction for gpio #5: -2
> [    2.784545] ff000a20.serial: ttyCPM1 at MMIO 0xfff00a20 (irq = 39, base_baud = 8250000) is a CPM UART
> 
> Use IS_ERR_OR_NULL() to properly check gpiod validity.

Why check for NULL at all?

> Fixes: 97cbaf2c829b ("tty: serial: cpm_uart: Convert to use GPIO descriptors")
> Cc: stable@vger.kernel.org
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/tty/serial/cpm_uart/cpm_uart_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> index a04f74d2e854..3cbe24802296 100644
> --- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> +++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
> @@ -1217,7 +1217,7 @@ static int cpm_uart_init_port(struct device_node *np,
>  
>  		gpiod = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
>  
> -		if (gpiod) {
> +		if (!IS_ERR_OR_NULL(gpiod)) {
>  			if (i == GPIO_RTS || i == GPIO_DTR)
>  				ret = gpiod_direction_output(gpiod, 0);
>  			else

Johan
