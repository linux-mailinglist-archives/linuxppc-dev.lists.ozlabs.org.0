Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C6D2AE55
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2019 07:58:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45C5r62VdxzDqPW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2019 15:58:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=bjorn.andersson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="tuK8ZJtV"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45C5pt3p40zDqJV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2019 15:57:22 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id v9so2070649pgr.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 May 2019 22:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JyuJRgpS/Z7CTA8H0O+hxtzN/dPpz0TyAwIDE7XTsoE=;
 b=tuK8ZJtVIXwdPqsWdCte9y3TqlJG9qgELDQ3Qtp6LQKM8RKkyKpCzZkxEj0Rc2WkDL
 2Zsfou7/kcXjVBVVKZbyd1vpgHoltIgN/xtEWFYBHpnAG3V6zkWDiy1iTyxASIA9CENQ
 mA7+QcLY3xq9OCa85rUrfTnUC93wNgN7pb/iWF9gDRmtjp/EREjqEwTpSmkigkxsMWFW
 Dch1i+eR2PB3g/qfC+a+rSADliGMCp1rcVIDlZ1nUQhX3IA1oVSLv+0kdbMvq+wLMVEH
 EiFnt8NM5d7BexcLwQ+IFWTjLJXCKlKrLgcaDZCIFCHPhnltSPGoP4cbGO158bKGJAU7
 /huA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JyuJRgpS/Z7CTA8H0O+hxtzN/dPpz0TyAwIDE7XTsoE=;
 b=K0/PZHl8wlbvPTKzVnIl7c4Qgp8f+nqVFQO8zl8bj2xC1XrQv5HOfx0LOFnuWHIczt
 JVrUActY8JL2flSiXRrPLuddyMLddXRYNfgQ5demS7HCj2ePwWzCCmcP9/WmQ+PwyZX2
 VQoqxs0yyrC7th9hlcR7Ej9kBaH7/Xf5DWqXuOLYzloMassDolZMnTPAN3iG42M2LR+p
 BQfgnNQCakwwGfME9dYQ5Q7IL0GXmjKQiiWW7bBeJ0QEIgrmFRx8l+ivcNA+L5upyL1w
 X0VP9FvG4epE4cRT9DoDqDvFLx53RWaxeSJboZ6ZrZ8rZb7P2oNKHqLN9+BypnuDrjgo
 UOUA==
X-Gm-Message-State: APjAAAVfuUyETVcwFkJ22Ehsv4Yd5q8Qvj780jmXucnFxBaieCgpP5GW
 +KuqKR6lXbKBbjrxAP4L0v1EQQ==
X-Google-Smtp-Source: APXvYqyFsSMergPg5Nna/kdDGDiTnNFmQX2Z9Q80x2Bevc9+pSNViT0695L4158UfsAXYGHWblpzzg==
X-Received: by 2002:a63:e603:: with SMTP id g3mr14837549pgh.167.1558936638925; 
 Sun, 26 May 2019 22:57:18 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id t18sm8297274pgm.69.2019.05.26.22.57.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 May 2019 22:57:17 -0700 (PDT)
Date: Sun, 26 May 2019 22:57:15 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH v2 20/45] drivers: tty: serial: msm_serial: use devm_*
 functions
Message-ID: <20190527055715.GW31438@minitux>
References: <1552602855-26086-1-git-send-email-info@metux.net>
 <1552602855-26086-21-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1552602855-26086-21-git-send-email-info@metux.net>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: linux-arm-msm@vger.kernel.org, yamada.masahiro@socionext.com,
 macro@linux-mips.org, jacmet@sunsite.dk, festevam@gmail.com,
 stefan.wahren@i2se.com, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 linux-serial@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 andy.gross@linaro.org, tklauser@distanz.ch, david.brown@linaro.org,
 rjui@broadcom.com, s.hauer@pengutronix.de, slemieux.tyco@gmail.com,
 linuxppc-dev@lists.ozlabs.org, vz@mleia.com, matthias.bgg@gmail.com,
 andriy.shevchenko@linux.intel.com, baohua@kernel.org, sbranden@broadcom.com,
 eric@anholt.net, richard.genoud@gmail.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, shawnguo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 14 Mar 15:33 PDT 2019, Enrico Weigelt, metux IT consult wrote:

> Use the safer devm versions of memory mapping functions.
> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

As pointed out by others, this resource does not follow the life cycle
of the port->dev, so I don't think this improves the code.

Regards,
Bjorn

> ---
>  drivers/tty/serial/msm_serial.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> index 1090960..e8e0c87 100644
> --- a/drivers/tty/serial/msm_serial.c
> +++ b/drivers/tty/serial/msm_serial.c
> @@ -1324,8 +1324,8 @@ static void msm_release_port(struct uart_port *port)
>  		return;
>  	size = resource_size(uart_resource);
>  
> -	release_mem_region(port->mapbase, size);
> -	iounmap(port->membase);
> +	devm_release_mem_region(port->dev, port->mapbase, size);
> +	devm_iounmap(port->dev, port->membase);
>  	port->membase = NULL;
>  }
>  
> @@ -1342,10 +1342,13 @@ static int msm_request_port(struct uart_port *port)
>  
>  	size = resource_size(uart_resource);
>  
> -	if (!request_mem_region(port->mapbase, size, "msm_serial"))
> +	if (!devm_request_mem_region(port->dev,
> +				     port->mapbase,
> +				     size,
> +				     "msm_serial"))
>  		return -EBUSY;
>  
> -	port->membase = ioremap(port->mapbase, size);
> +	port->membase = ioremap(port->dev, port->mapbase, size);
>  	if (!port->membase) {
>  		ret = -EBUSY;
>  		goto fail_release_port;
> @@ -1354,7 +1357,7 @@ static int msm_request_port(struct uart_port *port)
>  	return 0;
>  
>  fail_release_port:
> -	release_mem_region(port->mapbase, size);
> +	devm_release_mem_region(port->dev, port->mapbase, size);
>  	return ret;
>  }
>  
> -- 
> 1.9.1
> 
