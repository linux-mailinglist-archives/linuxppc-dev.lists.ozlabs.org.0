Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F137F3A51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 00:37:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=cSWqiEe2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZglh3ngwz3dVJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 10:37:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=cSWqiEe2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZfW010jGz3c2b
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 09:41:31 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7a9857c14c5so210447539f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 14:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700606488; x=1701211288; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6Y5P6vvizTkCcH4d/w5IMJ1P3rAQH0RFmdfD+hCzFk=;
        b=cSWqiEe2Dtl5ThUWf/FiHNuoDxr8dEtRDni1rcxXUBhdMi6/N97zp6dhrbWmqfAeXX
         GVHK+9G2IJOgrgx1spLVRJTSA0+2GY6lFyBwxX/YvLLx72D/hFinOfuMM+1DzRiVutu/
         Skc844fnstYpbg0n4WVxfC4+a/sf4p7+UkZNhTzUex7eLL7gskE5kumXbRUaSBGF+pQL
         LcGoBSwYRok0a7gObDq+T2LpeTKo3EnU58/H0uAONl6e5g8mwDpboFHB0GK5lKD0zpub
         NLlmCSYFNel42EC+n4/GJVTqPmtGaUJB0qtW/gSc2JVy2DlS12CQfpu8Z1e3r8nr422i
         aqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700606488; x=1701211288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6Y5P6vvizTkCcH4d/w5IMJ1P3rAQH0RFmdfD+hCzFk=;
        b=dN0CdC+0LC5f44pwHgP0IFiqCbqV1g5ccrYzEFXx2btuDhBvGnXWhqxDhtHmTUhQvc
         QWb25uRmZxmnI//SYM8bWxVEjPCEso9L3HJd7RBAXNV9acGDddpgKC2L989WbVWx97o2
         Pt/a9dN30/Et6Ne8506JxhASoqcr+PjGPklCB5J0sMI6Qfz5KQpnNwtpBjMB1RVN5JFz
         sVGMTj9wLqpJei3sgpksBdEllHc3kv353WH/37xnc/100NcQDE19oMQs1qdzeINF1Q+q
         fYoFXgDa+g/B5/qIkVYvBl+g1c1c26ujOmuDK6CLoBlmop+fbMfEJpQREZ/+5Kd8UhL1
         BQQw==
X-Gm-Message-State: AOJu0YwvK86/gNodv9g+8KVoBnAI1COuxuyfYvGxxXjvhlZWz4FI2E1t
	8VFR8k3kDzo46/SDgLmEILntoj4g0670yRQUwHE=
X-Google-Smtp-Source: AGHT+IFH/7RqkC4+CMkzTbT30NHfcCp/3hQroU+yf96S1nn9LE96a/StCjzs0+QoFrxTjKwkdSqwCg==
X-Received: by 2002:a6b:f719:0:b0:79f:d04d:ce5a with SMTP id k25-20020a6bf719000000b0079fd04dce5amr326806iog.2.1700606488169;
        Tue, 21 Nov 2023 14:41:28 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:3d43:c8e2:1496:e620? ([2605:a601:adae:4500:3d43:c8e2:1496:e620])
        by smtp.gmail.com with ESMTPSA id s7-20020a056602010700b007b34b374dd1sm509116iot.18.2023.11.21.14.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 14:41:27 -0800 (PST)
Message-ID: <8c0f4eba-1923-4686-b07b-1f3b78b298e9@sifive.com>
Date: Tue, 21 Nov 2023 16:41:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] tty/serial: Add RISC-V SBI debug console based
 earlycon
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-4-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231118033859.726692-4-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 22 Nov 2023 10:36:05 +1100
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
Cc: Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Anup,

On 2023-11-17 9:38 PM, Anup Patel wrote:
> We extend the existing RISC-V SBI earlycon support to use the new
> RISC-V SBI debug console extension.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  drivers/tty/serial/Kconfig              |  2 +-
>  drivers/tty/serial/earlycon-riscv-sbi.c | 24 ++++++++++++++++++++----
>  2 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 732c893c8d16..1f2594b8ab9d 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -87,7 +87,7 @@ config SERIAL_EARLYCON_SEMIHOST
>  
>  config SERIAL_EARLYCON_RISCV_SBI
>  	bool "Early console using RISC-V SBI"
> -	depends on RISCV_SBI_V01
> +	depends on RISCV_SBI
>  	select SERIAL_CORE
>  	select SERIAL_CORE_CONSOLE
>  	select SERIAL_EARLYCON
> diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
> index 27afb0b74ea7..5351e1e31f45 100644
> --- a/drivers/tty/serial/earlycon-riscv-sbi.c
> +++ b/drivers/tty/serial/earlycon-riscv-sbi.c
> @@ -15,17 +15,33 @@ static void sbi_putc(struct uart_port *port, unsigned char c)
>  	sbi_console_putchar(c);
>  }
>  
> -static void sbi_console_write(struct console *con,
> -			      const char *s, unsigned n)
> +static void sbi_0_1_console_write(struct console *con,
> +				  const char *s, unsigned int n)
>  {
>  	struct earlycon_device *dev = con->data;
>  	uart_console_write(&dev->port, s, n, sbi_putc);
>  }
>  
> +static void sbi_dbcn_console_write(struct console *con,
> +				   const char *s, unsigned int n)
> +{
> +	sbi_debug_console_write(n, __pa(s));

This only works for strings in the linear mapping or the kernel mapping (not
vmalloc, which includes the stack). So I don't think we can use __pa() here.

> +}
> +
>  static int __init early_sbi_setup(struct earlycon_device *device,
>  				  const char *opt)
>  {
> -	device->con->write = sbi_console_write;
> -	return 0;
> +	int ret = 0;
> +
> +	if (sbi_debug_console_available) {
> +		device->con->write = sbi_dbcn_console_write;
> +	} else {
> +		if (IS_ENABLED(CONFIG_RISCV_SBI_V01))

"else if", no need for the extra block/indentation.

Regards,
Samuel

> +			device->con->write = sbi_0_1_console_write;
> +		else
> +			ret = -ENODEV;
> +	}
> +
> +	return ret;
>  }
>  EARLYCON_DECLARE(sbi, early_sbi_setup);

