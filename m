Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B5C70D891
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 11:13:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQTC22PDgz3cdk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 19:13:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.52; helo=mail-ej1-f52.google.com; envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQTBD469yz3f8F
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 19:13:07 +1000 (AEST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-970056276acso260950366b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 02:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684833185; x=1687425185;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e65v/JQ0YakfdpO5WAozFB3zrVj1i6YIZiY4qha6yIU=;
        b=HZjDhxABUsNVFiIn4aEMG1FUD4lxaqNXQUQeqtAm0kKbrWryPR0b1d/RScdkPiotza
         4R2unPIH/TGiqea6HteDtjn81cFUnk+Pmj7ZOW7x2lNNaAaBIE5wHjxEGAqDBjjMlCWw
         M1neFYGOygfkJ33/mZwJbJrf3RbZYgmf7mDdrrRSAcVAp7sbSbykKjkAgotVfyuELk5k
         KUo45iUUii+g8qNrb8k+4PdTrxFHh/nUzo7V6IsFGnwHBErG/7d8zMhJ9gyDalszcxYq
         sepsPvOjHMdFWK6hY41CAwIGGem08InXSKpqxlHo0COpg2FXAgixbW3jdwDEWdlunZMM
         8fKw==
X-Gm-Message-State: AC+VfDwDAOZGgbSnSMiNaWhlF3P6II6WLk/X3f88Jjellw3Ms4hMhrRE
	8m+/S26VldJ8om8HE4j5O/A=
X-Google-Smtp-Source: ACHHUZ7RCSSHlTvlKn5S49Hw1Z7qGeq8+J1cF4YtJ4wYDQ+mU0uyNA3Z4JuVX1vTGl6Lc5SU2Hiv7Q==
X-Received: by 2002:a17:907:9408:b0:965:6d21:48bc with SMTP id dk8-20020a170907940800b009656d2148bcmr11601570ejc.75.1684833184311;
        Tue, 23 May 2023 02:13:04 -0700 (PDT)
Received: from [192.168.1.58] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id h26-20020a17090634da00b0096f7e7d1566sm4147570ejb.224.2023.05.23.02.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 02:13:03 -0700 (PDT)
Message-ID: <012b7c3d-1411-e5e1-662a-33369bfca610@kernel.org>
Date: Tue, 23 May 2023 11:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 2/2] serial: cpm_uart: Fix a COMPILE_TEST dependency
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230523085902.75837-1-herve.codina@bootlin.com>
 <20230523085902.75837-3-herve.codina@bootlin.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230523085902.75837-3-herve.codina@bootlin.com>
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

On 23. 05. 23, 10:59, Herve Codina wrote:
> In a COMPILE_TEST configuration, the cpm_uart driver uses symbols from
> the cpm_uart_cpm2.c file. This file is compiled only when CONFIG_CPM2 is
> set.
> 
> Without this dependency, the linker fails with some missing symbols for
> COMPILE_TEST configuration that needs SERIAL_CPM without enabling CPM2.
> 
> This lead to:
>    depends on CPM2 || CPM1 || (PPC32 && CPM2 && COMPILE_TEST)
> 
> This dependency does not make sense anymore and can be simplified
> removing all the COMPILE_TEST part.

Then it's the same as my revert:
https://lore.kernel.org/all/20230518055620.29957-1-jirislaby@kernel.org/

:D

But nevermind.

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202305160221.9XgweObz-lkp@intel.com/
> Fixes: e3e7b13bffae ("serial: allow COMPILE_TEST for some drivers")
> ---
>   drivers/tty/serial/Kconfig             | 2 +-
>   drivers/tty/serial/cpm_uart/cpm_uart.h | 2 --
>   2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 625358f44419..de092bc1289e 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -769,7 +769,7 @@ config SERIAL_PMACZILOG_CONSOLE
>   
>   config SERIAL_CPM
>   	tristate "CPM SCC/SMC serial port support"
> -	depends on CPM2 || CPM1 || (PPC32 && COMPILE_TEST)
> +	depends on CPM2 || CPM1
>   	select SERIAL_CORE
>   	help
>   	  This driver supports the SCC and SMC serial ports on Motorola
> diff --git a/drivers/tty/serial/cpm_uart/cpm_uart.h b/drivers/tty/serial/cpm_uart/cpm_uart.h
> index 0577618e78c0..46c03ed71c31 100644
> --- a/drivers/tty/serial/cpm_uart/cpm_uart.h
> +++ b/drivers/tty/serial/cpm_uart/cpm_uart.h
> @@ -19,8 +19,6 @@ struct gpio_desc;
>   #include "cpm_uart_cpm2.h"
>   #elif defined(CONFIG_CPM1)
>   #include "cpm_uart_cpm1.h"
> -#elif defined(CONFIG_COMPILE_TEST)
> -#include "cpm_uart_cpm2.h"
>   #endif
>   
>   #define SERIAL_CPM_MAJOR	204

-- 
js
suse labs

