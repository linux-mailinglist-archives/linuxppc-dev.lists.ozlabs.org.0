Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AFB7F7A71
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 18:32:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=BoTtAdMB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScMW22Kswz3vbt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 04:32:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=BoTtAdMB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ScMV73tHkz3dFm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Nov 2023 04:31:41 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a00d5b0ec44so311952866b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 09:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700847094; x=1701451894; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0MmcPyK3mkdrLM52uLYpIt1qXSSFyNhnpJboXxQydAo=;
        b=BoTtAdMB0bLx9wudto8g4v+pvFAZck/olrUQkhpg3/KXBlcx7xqxSsWVlOkEf+nJ4Y
         C1r1T40R479mzsG9oSIuafJYXZgwHHFs7DYw2OsoGu9mTTFzJ17UZdIr8JwuZliBWS8b
         P1TgP3CkLQeAlBidDF6pUX8SyUQUGLImrrX5WAtC/m8uFtLOM1qrEGqXL6jZdr1GBtOk
         H5+BkcRy131LcrXZLPmCO/BXxm4XUrlKtumetNjeE4u1v+HccOWRWVE8RTOTMv6NxdQf
         bGLWCV48Nrc4tewIx8jJv+P4J3KiZp+Z87Wrpy9sHC4d6jcx+QvpageBQxD8iuNVhcAj
         I9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700847094; x=1701451894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MmcPyK3mkdrLM52uLYpIt1qXSSFyNhnpJboXxQydAo=;
        b=rjTiZf6xzvjr4c2zhO8bBqtkvG8d5+nwKFM5S8ZBWDNUoLXJ6cIuwAdajX1QFu142T
         aulaNeyzIhnymHXOYzsLIS4jVOuOhcPI6Q+Ws02K+Ts2GMkMCTENDkeTwf25GhiL8fQv
         S18NLdfOq9TCWC9v6G4GvToJUMNiqbIGsb/rtoKvg9e3gJdFXks1H/ZApiGVsbwrSlf0
         s/lhPYjO/BvpvII88i1l1erZKddmpYpFy9YbszhOTOo5S/7+bhwYixUf9QojAuUgsAJ5
         Ql4gv/UPaTBzaNijZUbAt+xmsxB9YZbydzg7dNVoYuOsKzXqOQly1N3UOsQEQrQ8CoL0
         8vaQ==
X-Gm-Message-State: AOJu0YxVE7HgaDiyDiZ7wnFzOjfzjzo/fDF5kg5cmfYqR5rOUJLVrcsR
	iRGSVcfObc0CpHMMJLSNujykjg==
X-Google-Smtp-Source: AGHT+IG6CMsfmQV5iDvLoyvWP8dLg5EMoM/S3qrMav9BlUgZwXuqbKVl403ib2zNmITpuo9KrFP3JA==
X-Received: by 2002:a17:907:2983:b0:9fb:da63:bb2f with SMTP id eu3-20020a170907298300b009fbda63bb2fmr2616757ejc.18.1700847094196;
        Fri, 24 Nov 2023 09:31:34 -0800 (PST)
Received: from localhost ([81.19.4.232])
        by smtp.gmail.com with ESMTPSA id h4-20020a170906398400b009fd541851f4sm2306940eje.198.2023.11.24.09.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 09:31:33 -0800 (PST)
Date: Fri, 24 Nov 2023 18:31:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v5 4/5] tty: Add SBI debug console support to HVC SBI
 driver
Message-ID: <20231124-cf60c92a6a7a2b220feab211@orel>
References: <20231124070905.1043092-1-apatel@ventanamicro.com>
 <20231124070905.1043092-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124070905.1043092-5-apatel@ventanamicro.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Atish Patra <atishp@rivosinc.com>, linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 24, 2023 at 12:39:04PM +0530, Anup Patel wrote:
> From: Atish Patra <atishp@rivosinc.com>
> 
> RISC-V SBI specification supports advanced debug console
> support via SBI DBCN extension.
> 
> Extend the HVC SBI driver to support it.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/tty/hvc/Kconfig         |  2 +-
>  drivers/tty/hvc/hvc_riscv_sbi.c | 37 ++++++++++++++++++++++++++-------
>  2 files changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
> index 4f9264d005c0..6e05c5c7bca1 100644
> --- a/drivers/tty/hvc/Kconfig
> +++ b/drivers/tty/hvc/Kconfig
> @@ -108,7 +108,7 @@ config HVC_DCC_SERIALIZE_SMP
>  
>  config HVC_RISCV_SBI
>  	bool "RISC-V SBI console support"
> -	depends on RISCV_SBI_V01
> +	depends on RISCV_SBI
>  	select HVC_DRIVER
>  	help
>  	  This enables support for console output via RISC-V SBI calls, which
> diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
> index 31f53fa77e4a..2f3571f17ecd 100644
> --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> @@ -39,21 +39,44 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
>  	return i;
>  }
>  
> -static const struct hv_ops hvc_sbi_ops = {
> +static const struct hv_ops hvc_sbi_v01_ops = {
>  	.get_chars = hvc_sbi_tty_get,
>  	.put_chars = hvc_sbi_tty_put,
>  };
>  
> -static int __init hvc_sbi_init(void)
> +static int hvc_sbi_dbcn_tty_put(uint32_t vtermno, const char *buf, int count)
>  {
> -	return PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_ops, 16));
> +	return sbi_debug_console_write(buf, count);
>  }
> -device_initcall(hvc_sbi_init);
>  
> -static int __init hvc_sbi_console_init(void)
> +static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
>  {
> -	hvc_instantiate(0, 0, &hvc_sbi_ops);
> +	return sbi_debug_console_read(buf, count);
> +}
> +
> +static const struct hv_ops hvc_sbi_dbcn_ops = {
> +	.put_chars = hvc_sbi_dbcn_tty_put,
> +	.get_chars = hvc_sbi_dbcn_tty_get,
> +};
> +
> +static int __init hvc_sbi_init(void)
> +{
> +	int err;
> +
> +	if (sbi_debug_console_available) {
> +		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 256));
> +		if (err)
> +			return err;
> +		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
> +	} else if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
> +		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 256));
> +		if (err)
> +			return err;
> +		hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
> +	} else {
> +		return -ENODEV;
> +	}
>  
>  	return 0;
>  }
> -console_initcall(hvc_sbi_console_init);
> +device_initcall(hvc_sbi_init);
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
