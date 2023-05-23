Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F7A70D608
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 09:52:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQRP92TGHz3f7p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 17:52:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.50; helo=mail-ej1-f50.google.com; envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQRNj0ktxz300C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 17:52:04 +1000 (AEST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-96f0678de80so1305389366b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 00:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684828322; x=1687420322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nu/cDoOXs5TVBA/QD7O9cdrmYWXrhKeMaEH35tlFdtw=;
        b=f5F+XuGCg3eWBl7FNpQr0OG5qsU1IEt27kV1QxUncrfeECAIW70sSXJ+enzGwuBhyK
         1LbvuWHBfK2ejg9UGqpiPhJ/VaBx2GUEjVjxW10iyaN54kUAAoLaSFpVFVo7abhSMPbu
         I+dTIQnvPnrNVot7LVdbABJHH7AL9gx2xOjOaaoVMUC3hbD2wrM70P0iT4Lq7mJ+q0fC
         zMicjZOSy3Y9i+2no6RgpIpqcYOP9d9m11KqyDOfneiuLrfup8pmrQa6LiJ6NnYn0B8b
         rSFk9ZwJV15Rxse6CNqON11F9l5kfUQwTbfHvROx75io7CI1ga+3U0awC2K8uQ8ZPBuJ
         e54A==
X-Gm-Message-State: AC+VfDzV1XtqSM3ppcqwaYzkkfZ3L49q4h0YdCH1oQDw+i6knOBMPQBa
	LMvosUJ0j8y8cPYon+ZYM60=
X-Google-Smtp-Source: ACHHUZ4cF4d+RcQ1dnyhjQGJi6YIELHknuY1Ue6me+Xi1cncPggsoYNjnFkzjIFNZaywgQfp4lzdEQ==
X-Received: by 2002:a17:906:5044:b0:96a:63d4:24c5 with SMTP id e4-20020a170906504400b0096a63d424c5mr12495026ejk.77.1684828321864;
        Tue, 23 May 2023 00:52:01 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id z25-20020a1709064e1900b0096f6e836fa0sm4033655eju.27.2023.05.23.00.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 00:52:01 -0700 (PDT)
Message-ID: <d65bb452-80ca-7644-c38c-1bc0566661f0@kernel.org>
Date: Tue, 23 May 2023 09:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] serial: cpm_uart: Fix a COMPILE_TEST dependency
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230522082048.21216-1-herve.codina@bootlin.com>
 <20230522082048.21216-3-herve.codina@bootlin.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230522082048.21216-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22. 05. 23, 10:20, Herve Codina wrote:
> In a COMPILE_TEST configuration, the cpm_uart driver uses symbols from
> the cpm_uart_cpm2.c file. This file is compiled only when CONFIG_CPM2 is
> set.
> 
> Without this dependency, the linker fails with some missing symbols for
> COMPILE_TEST configuration that needs SERIAL_CPM without enabling CPM2.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202305160221.9XgweObz-lkp@intel.com/
> Fixes: e3e7b13bffae ("serial: allow COMPILE_TEST for some drivers")
> ---
>   drivers/tty/serial/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 625358f44419..68a9d9db9144 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -769,7 +769,7 @@ config SERIAL_PMACZILOG_CONSOLE
>   
>   config SERIAL_CPM
>   	tristate "CPM SCC/SMC serial port support"
> -	depends on CPM2 || CPM1 || (PPC32 && COMPILE_TEST)
> +	depends on CPM2 || CPM1 || (PPC32 && CPM2 && COMPILE_TEST)

Actually, does this makes sense? I mean, the last part after "||" is now 
superfluous and doesn't help anything, right?

>   	select SERIAL_CORE
>   	help
>   	  This driver supports the SCC and SMC serial ports on Motorola

-- 
js

