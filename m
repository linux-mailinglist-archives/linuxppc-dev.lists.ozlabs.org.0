Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E97B7D0DDB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 12:47:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=mSEv8DzF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBhB40ypGz3fQH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 21:47:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=mSEv8DzF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBh9C1S88z30P0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 21:46:54 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so953711a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 03:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697798808; x=1698403608; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C4FNgEavOCML3+P3zV8vrHxk6JHiOQKnLJ34VOXcto0=;
        b=mSEv8DzF/U90C+QpE2cgW79BHaqoU+xznooPnnkhXcad2gG0KHiKC632t2fim1kkZ6
         RKJa3PJxSzOF5PJA90vm7WiLzGLiLE7AYbBM05G3hJCJjQgIlni+XuCR08duPv3ZMpDw
         uHMxZoivtkga4Ueb8onLFqrw1ulcGNt4CVPZfs2yYr140gF0kZDWpaUQdWQpgvW68udL
         FYEYKAMWr85zAy9HcYxkI6DkEAB0/L2TupRlJrVrw26RPZe8GWmWbQpKNBUG81rTgh25
         RdVOyXIBVpcKRCbtu6YIY+2+9An8AE0y9v5uArK/lGK8KxpVMHiHO6I1GT/Z5AjioTQa
         86Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697798808; x=1698403608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4FNgEavOCML3+P3zV8vrHxk6JHiOQKnLJ34VOXcto0=;
        b=DDTWOFHNTgBrk2+V7/u/l9OADDd+5+oSLrlAHr2TFbrg/CDzXnscwne1xccWG6bnJU
         gXv2HVd90+h1dtVAXWDQIyBzZBLkX9WW52/hElYDtcjxOf7NsiF1TvVs8sqB6qn7Ai1E
         XoA+F2lb83AInaG+FkPmsXh+qn5R6vSuEoNdfZmEd/KJHeNus3tUBCqkYLnveDe2LT+w
         cPJp4wMfrvPzTgoEeoW7UoOFaukaXIuzgt/2/HxP2pHClIXyevES5CFy5559RL8d216G
         s+gI6XVx26kx6tDTPWeRU+y5kh1MXpPVbo9pA66rH5I4QJTzaLcmzBE6eQQmUSRNXqoc
         t6Hg==
X-Gm-Message-State: AOJu0YwPZ1yNb2XQvovJ92+8Od64flv/g8vENjWScKm90wxdrIV6dMOK
	gqFjTZldejba30xW/kICOSFBdg==
X-Google-Smtp-Source: AGHT+IGO0GMjn00PKL7e3zKeoD4F27QBrWs+IFdZxdcX9F+Azofcpoji3ND0CTBFW2yKpQjyxJQKzg==
X-Received: by 2002:a17:907:3d92:b0:9b2:b71f:83be with SMTP id he18-20020a1709073d9200b009b2b71f83bemr978732ejc.1.1697798807645;
        Fri, 20 Oct 2023 03:46:47 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id f17-20020a1709062c5100b009c5c5c2c5a4sm1205348ejh.219.2023.10.20.03.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 03:46:47 -0700 (PDT)
Date: Fri, 20 Oct 2023 12:46:46 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 8/9] tty: Add SBI debug console support to HVC SBI
 driver
Message-ID: <20231020-f1ec2b7e384a4cfeae39966f@orel>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-9-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020072140.900967-9-apatel@ventanamicro.com>
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
Cc: linux-serial@vger.kernel.org, kvm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 20, 2023 at 12:51:39PM +0530, Anup Patel wrote:
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
>  drivers/tty/hvc/hvc_riscv_sbi.c | 82 ++++++++++++++++++++++++++++++---
>  2 files changed, 76 insertions(+), 8 deletions(-)
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
> index 31f53fa77e4a..56da1a4b5aca 100644
> --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> @@ -39,21 +39,89 @@ static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
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
> +	phys_addr_t pa;
> +	struct sbiret ret;
> +
> +	if (is_vmalloc_addr(buf)) {
> +		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
> +		if (PAGE_SIZE < (offset_in_page(buf) + count))

I thought checkpatch complained about uppercase constants being on the
left in comparisons.

> +			count = PAGE_SIZE - offset_in_page(buf);
> +	} else {
> +		pa = __pa(buf);
> +	}
> +
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> +				count, lower_32_bits(pa), upper_32_bits(pa),
> +				0, 0, 0);
> +	else
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> +				count, pa, 0, 0, 0, 0);
> +	if (ret.error)
> +		return 0;
> +
> +	return count;

Shouldn't we return ret.value here in case it's less than count? I see we
already do that below in get().

>  }
> -device_initcall(hvc_sbi_init);
>  
> -static int __init hvc_sbi_console_init(void)
> +static int hvc_sbi_dbcn_tty_get(uint32_t vtermno, char *buf, int count)
>  {
> -	hvc_instantiate(0, 0, &hvc_sbi_ops);
> +	phys_addr_t pa;
> +	struct sbiret ret;
> +
> +	if (is_vmalloc_addr(buf)) {
> +		pa = page_to_phys(vmalloc_to_page(buf)) + offset_in_page(buf);
> +		if (PAGE_SIZE < (offset_in_page(buf) + count))
> +			count = PAGE_SIZE - offset_in_page(buf);
> +	} else {
> +		pa = __pa(buf);
> +	}
> +
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
> +				count, lower_32_bits(pa), upper_32_bits(pa),
> +				0, 0, 0);
> +	else
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
> +				count, pa, 0, 0, 0, 0);
> +	if (ret.error)
> +		return 0;
> +
> +	return ret.value;
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
> +	if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
> +	    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
> +		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 16));

Why an outbuf size of only 16?

> +		if (err)
> +			return err;
> +		hvc_instantiate(0, 0, &hvc_sbi_dbcn_ops);
> +	} else {
> +		if (IS_ENABLED(CONFIG_RISCV_SBI_V01)) {
> +			err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_v01_ops, 16));
> +			if (err)
> +				return err;
> +			hvc_instantiate(0, 0, &hvc_sbi_v01_ops);
> +		} else {
> +			return -ENODEV;
> +		}
> +	}
>  
>  	return 0;
>  }
> -console_initcall(hvc_sbi_console_init);
> +device_initcall(hvc_sbi_init);
> -- 
> 2.34.1
>

Thanks,
drew
