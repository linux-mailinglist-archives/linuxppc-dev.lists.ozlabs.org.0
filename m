Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EE17CF28B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 10:28:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=gwyQwfYJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB17b5lZ2z3cnT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 19:28:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=gwyQwfYJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB16k028pz3cC9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 19:27:24 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40651a726acso67006645e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697704040; x=1698308840; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aS9ZmATMA5UdrpXcs84XzGO/WomcKSWd4ogsdFNAVRI=;
        b=gwyQwfYJ5lv2pdgeiQOurqv9WWWgal+nXu1f/KNr9haUurK+G4T8F8w/ScfKsiRVmq
         T7KbR4hzg0Nj5viI1ewJlyQU9d4nU8rToxj3PPR+5qdo0+W0LgC73U2L+itdsIlgv/tI
         inrS3A1aYK5jsIXh8s3yuGSzgiplto8V2SDCOn/Y0ikCOu7LAT5xjHOrpKPauBcFZGIP
         /FRxTkDD6YyzhZWovimygk7umt4mixSaLbtATHUZQ+gUv8BCe1MsWCbQvOkMh8vzOsT2
         hhYMztK1lde3zvMxSeqC0m8PFWHFdlmtgvmYztXcPi2HHk15GNsG+qLPBaDCAYAgIrYR
         Isjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697704040; x=1698308840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aS9ZmATMA5UdrpXcs84XzGO/WomcKSWd4ogsdFNAVRI=;
        b=Zl0vgtQq8oigmH4wjGVdY+uMJIRtmZTOzlojIwDBk9/JPHZZRu1pu6OtXOC5tJGUvM
         2f6NWHIbpBeCi71bvM1j7IU0NnIXltPKDMzhYkQ4JupsJ4YhJ9n7qS9STfML+Q3VBVKO
         7f2kYj7NOdf28TRqjjN7V4Olzc3/OS6G+EEBsCxpx2pGnrDtEragzGO+AsgqmPMS9Kp1
         m/sT4a2I91ZRg/mNnrRkuevP7PUaD5GMuYngsrPwPE6+i7ODX8x5DyeeAy7wZkwa//lv
         O1dAaJ61xG6X77ViyZ9M0ooGr85ysnyNHPjv5w/KQO3dRB1BGZKyWudxsP6490FR4YTt
         jxZA==
X-Gm-Message-State: AOJu0YzCug3YfUhkYCNHO5XiB1S9G1ccxYvwwlJVPc5Mcsup3vSqy9lp
	gHtRaswQEQ980Vrmj+xJhKLdmQ==
X-Google-Smtp-Source: AGHT+IHskKNqI6cyPtwKoTi5Al9ucFLHv3VeiXwM9dmzqt6kOBsKQXH4yfubGN4sdMpzP0jv+CThYA==
X-Received: by 2002:a05:600c:3542:b0:401:73b2:f039 with SMTP id i2-20020a05600c354200b0040173b2f039mr1228282wmq.7.1697704040501;
        Thu, 19 Oct 2023 01:27:20 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o36-20020a05600c512400b00405959469afsm3842187wms.3.2023.10.19.01.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:27:19 -0700 (PDT)
Date: Thu, 19 Oct 2023 10:27:13 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2 6/8] tty/serial: Add RISC-V SBI debug console based
 earlycon
Message-ID: <20231019-f3c3768f5e95e747e1457c49@orel>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012051509.738750-7-apatel@ventanamicro.com>
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
Cc: linux-serial@vger.kernel.org, kvm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Atish Patra <atishp@atishpatra.org>, linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 12, 2023 at 10:45:07AM +0530, Anup Patel wrote:
> We extend the existing RISC-V SBI earlycon support to use the new
> RISC-V SBI debug console extension.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/tty/serial/Kconfig              |  2 +-
>  drivers/tty/serial/earlycon-riscv-sbi.c | 32 +++++++++++++++++++++----
>  2 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index bdc568a4ab66..cec46091a716 100644
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
> index 27afb0b74ea7..c21cdef254e7 100644
> --- a/drivers/tty/serial/earlycon-riscv-sbi.c
> +++ b/drivers/tty/serial/earlycon-riscv-sbi.c
> @@ -15,17 +15,41 @@ static void sbi_putc(struct uart_port *port, unsigned char c)
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
> +	phys_addr_t pa = __pa(s);
> +
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> +			  n, lower_32_bits(pa), upper_32_bits(pa), 0, 0, 0);
> +	else
> +		sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> +			  n, pa, 0, 0, 0, 0);
> +}
> +
>  static int __init early_sbi_setup(struct earlycon_device *device,
>  				  const char *opt)
>  {
> -	device->con->write = sbi_console_write;
> -	return 0;
> +	int ret = 0;
> +
> +	if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
> +	    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
> +		device->con->write = sbi_dbcn_console_write;
> +	} else {
> +		if (IS_ENABLED(CONFIG_RISCV_SBI_V01))
> +			device->con->write = sbi_0_1_console_write;
> +		else
> +			ret = -ENODEV;
> +	}
> +
> +	return ret;
>  }
>  EARLYCON_DECLARE(sbi, early_sbi_setup);
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
