Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0198C268635
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 09:38:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqdXH1FQgzDqRN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 17:38:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.66; helo=mail-ed1-f66.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqZpV6vDLzDqQH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 15:36:02 +1000 (AEST)
Received: by mail-ed1-f66.google.com with SMTP id n22so16289109edt.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Sep 2020 22:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wxoqNVM1H3WKm36n114z2e2rqxZdPyaA6w9fRdtHnaY=;
 b=q/5Wb7djYAP/EyCUjYY+qSZN9aJ1R0VEoX9uXgTAE1kNKQ4LOZrjh9fSLORCGX14FJ
 eOAN1/0yq6qkamVA4OzzELxS5SrFTpN8eHi5X3/W3YEkaYJA6A6R+/wEORZAJmDEg6mX
 +vnwyQa8wtkIGRF7s+ZuXMFvZfZf0Apb+Dec9hNdeJMq6fhF9GYxhj0FV4bvinnanO/L
 3kwokOaF8RBUSzO7k7QNV1g2RveYKhEwPBaRSHIRyNyqxuTuthDPvWsyEJ9tWNaA/4VX
 bz6dYGuExlyNnM6xZV5IjVl/kNs6Yk39Ni4+VP2Vdoy8pQbyTPrHgKTZ2BSvVoIACg73
 vlJA==
X-Gm-Message-State: AOAM531ycpbrqlmpx+2X6QTTQpFhsn4IeZ1V5SKSPj+TT885kSY3v9Ch
 HWSn6smROb4cpkTVjJmnePK+akMeLYArpQ==
X-Google-Smtp-Source: ABdhPJxO+gzy3P9dKsKAj7haR8PwnXeJ/5KijEPEhdd1N2WjH/pSCW9CdV40QrRQdcD5R0/bYD5Omg==
X-Received: by 2002:a05:6402:1515:: with SMTP id
 f21mr16006592edw.175.1600061758925; 
 Sun, 13 Sep 2020 22:35:58 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id f17sm8461864eds.45.2020.09.13.22.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2020 22:35:58 -0700 (PDT)
Subject: Re: [PATCH] tty: hvcs: Don't NULL tty->driver_data until
 hvcs_cleanup()
To: Tyrel Datwyler <tyreld@linux.ibm.com>, gregkh@linuxfoundation.org
References: <20200820234643.70412-1-tyreld@linux.ibm.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <9f00bbcd-9b5b-9574-fcaa-7188046feb5f@kernel.org>
Date: Mon, 14 Sep 2020 07:35:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820234643.70412-1-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 14 Sep 2020 17:35:24 +1000
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
Cc: Joe Perches <joe@perches.com>,
 "open list:HYPERVISOR VIRTUAL CONSOLE DRIVER"
 <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>,
 Jason Yan <yanaijie@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21. 08. 20, 1:46, Tyrel Datwyler wrote:
> The code currently NULLs tty->driver_data in hvcs_close() with the
> intent of informing the next call to hvcs_open() that device needs to be
> reconfigured. However, when hvcs_cleanup() is called we copy hvcsd from
> tty->driver_data which was previoulsy NULLed by hvcs_close() and our
> call to tty_port_put(&hvcsd->port) doesn't actually do anything since
> &hvcsd->port ends up translating to NULL by chance. This has the side
> effect that when hvcs_remove() is called we have one too many port
> references preventing hvcs_destuct_port() from ever being called. This
> also prevents us from reusing the /dev/hvcsX node in a future
> hvcs_probe() and we can eventually run out of /dev/hvcsX devices.
> 
> Fix this by waiting to NULL tty->driver_data in hvcs_cleanup().

Without actually looking into the code, it looks like we need a fix
similar to:
commit 24eb2377f977fe06d84fca558f891f95bc28a449
Author: Jiri Slaby <jirislaby@kernel.org>
Date:   Tue May 26 16:56:32 2020 +0200

    tty: hvc_console, fix crashes on parallel open/close

here too?

> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
>  drivers/tty/hvc/hvcs.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
> index 55105ac38f89..509d1042825a 100644
> --- a/drivers/tty/hvc/hvcs.c
> +++ b/drivers/tty/hvc/hvcs.c
> @@ -1216,13 +1216,6 @@ static void hvcs_close(struct tty_struct *tty, struct file *filp)
>  
>  		tty_wait_until_sent(tty, HVCS_CLOSE_WAIT);
>  
> -		/*
> -		 * This line is important because it tells hvcs_open that this
> -		 * device needs to be re-configured the next time hvcs_open is
> -		 * called.
> -		 */
> -		tty->driver_data = NULL;
> -
>  		free_irq(irq, hvcsd);
>  		return;
>  	} else if (hvcsd->port.count < 0) {
> @@ -1237,6 +1230,13 @@ static void hvcs_cleanup(struct tty_struct * tty)
>  {
>  	struct hvcs_struct *hvcsd = tty->driver_data;
>  
> +	/*
> +	 * This line is important because it tells hvcs_open that this
> +	 * device needs to be re-configured the next time hvcs_open is
> +	 * called.
> +	 */
> +	tty->driver_data = NULL;
> +
>  	tty_port_put(&hvcsd->port);
>  }
>  
> 

thanks,
-- 
js
