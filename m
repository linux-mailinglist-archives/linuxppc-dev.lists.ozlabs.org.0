Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E18DB26862B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 09:37:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqdVC6m5KzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 17:37:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.67; helo=mail-ed1-f67.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqZgd0dzJzDqPj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 15:30:01 +1000 (AEST)
Received: by mail-ed1-f67.google.com with SMTP id l17so16220971edq.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Sep 2020 22:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z1T/2900SANPNqCTbSqc4He4lRILj51ILCl9GCqP3W4=;
 b=s3UUJkIebXRh+ra61w7BmNjBAu6fWOopXCVonXcGAhdzlUx8e0NeKp67TA1pRcLEMz
 mhNjfNj9q2IRrJs8dbpeU7tC5+Sjk3dmUtKysQA/PUfXCC/A+nRQr78N8li39ZB0d89I
 YgAq64B6pPeO3rWmcLHr0PBYPDJjOAaqvLo/O4/gEMOoCB3dS0orSr++gW0N1gJH5d7O
 7cKRDvVc0yEUvkWIK6GIyWTBpAEqquc8N56B/8HyytQTqFkyIKS/OJpYIuFYZ4hQH3qy
 B36XMiH4YoujKfIzorH807JVuvDVgBSzPH0bHEVkumnE7xYmT+OvDYbGrKOmNwy/bQ8C
 YByQ==
X-Gm-Message-State: AOAM532+ONri99Szi+JG0vJ6p6ec/hTih3GVaumLKD/W3QtDmEsDpv15
 PHQgYH2CwUq23nYNkSzwWDc=
X-Google-Smtp-Source: ABdhPJws3XUQIstEOGdOZPJBBXittRedeH4J1mdmUeRlgYjVJja4dh8lelFgQzZbYXI6D6tqtn3KRQ==
X-Received: by 2002:aa7:c896:: with SMTP id p22mr15216133eds.382.1600061397730; 
 Sun, 13 Sep 2020 22:29:57 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id k10sm8371017edo.36.2020.09.13.22.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2020 22:29:56 -0700 (PDT)
Subject: Re: [PATCH] serial: ucc_uart: make qe_uart_set_mctrl() static
To: Jason Yan <yanaijie@huawei.com>, timur@kernel.org,
 gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk, leoyang.li@nxp.com,
 linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org
References: <20200912033834.143166-1-yanaijie@huawei.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <27cadfe5-7a7e-6d59-476d-1d03acc2185d@kernel.org>
Date: Mon, 14 Sep 2020 07:29:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200912033834.143166-1-yanaijie@huawei.com>
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
Cc: Hulk Robot <hulkci@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12. 09. 20, 5:38, Jason Yan wrote:
> This eliminates the following sparse warning:
> 
> drivers/tty/serial/ucc_uart.c:286:6: warning: symbol 'qe_uart_set_mctrl'
> was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Sure:
Acked-by: Jiri Slaby <jirislaby@kernel.org>

> ---
>  drivers/tty/serial/ucc_uart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
> index 3c8c662c69e2..d6a8604157ab 100644
> --- a/drivers/tty/serial/ucc_uart.c
> +++ b/drivers/tty/serial/ucc_uart.c
> @@ -283,7 +283,7 @@ static unsigned int qe_uart_tx_empty(struct uart_port *port)
>   * don't need that support. This function must exist, however, otherwise
>   * the kernel will panic.
>   */
> -void qe_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
> +static void qe_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
>  {
>  }
>  
> 


-- 
js
