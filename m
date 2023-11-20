Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA807F0D2C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 09:06:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=obKcY+65;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYg7R0x8Tz303d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 19:06:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=obKcY+65;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYg6X6KqLz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 19:05:23 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so7659875e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 00:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700467519; x=1701072319; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k/r7/AHUvU5h9gmXC8cWkhPHDiuLCW3OhU5H88ffb6E=;
        b=obKcY+65WaSuh+78Wvjec2h410a4b8rO9kO3yjW6/Dc6IugCODWOCHzMCKbosHAUSY
         Ml+gLTXfgPZPGniXeVWNLWJcNRNfIZ724iSC5tJX3xORHyU1UUWxPrHgYLpl2Dl1BPZF
         4tYJwBh1jKSCYHKZMkRbncwo+14aJb08mvGd82NIAs3Bqvjq6ME8vjP4zE7mHtpzn2PW
         OxD9IYgv/2EQDb+4LRxajdHPzH1IOGWVIhug464XPREyi5b8poUqAIU2LIkzz+52TxU+
         ADg5zukcT0Ct44Wq+b6agB3nxMG2MtCEO62xSeRsvX+ie3dTbRY3UDOdBajl5mHY4yun
         7cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700467519; x=1701072319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/r7/AHUvU5h9gmXC8cWkhPHDiuLCW3OhU5H88ffb6E=;
        b=j3ctu6txXUW6CFWFjJ9ZOAvWwPUUlsUgOkpGF+PBFsSpdly/gTMJpkDCCrQMsLgFoD
         02eY7+qxrDUoWssMrj/G2894+7N5U7iQWSK0/hTPDykrKcMXFmUZgIT6Tl9sw1i3sqTg
         wAcxFPUZNRwqf1T0UPSDBUO8QqX9RszcgRXDJQNCSaMnl7A12Nea2KdKGc8mSnMYnPd6
         yeGC8HLtJFUzhoiB9r1W2ybaAsJ/+3hq4v9YAHnAiBwQoFDf11F5CHtJNg2WlG/PeKwe
         PKSNdQCoET7Dc5EaEnVD/s7buEr8/K91dn/QHtslqsO2C8GZXd5wkdw9Zw+IXmk2HOk4
         DACw==
X-Gm-Message-State: AOJu0YxDRPykeWOPhjFpmfDfvGUzXH1FTAeF1aFF0a2yghPCJPre8eBK
	F0joJv9aby4CqksAj+K6mAAqNv3I3gYRCp9p9yk=
X-Google-Smtp-Source: AGHT+IFN4nwCSr0/wD+U66vM10GQFv+Nri9nZ939m/NOfkfbpyvhNkhO8KxhTxplHCfzLfcHQj8ulg==
X-Received: by 2002:a05:600c:6001:b0:408:33ba:569a with SMTP id az1-20020a05600c600100b0040833ba569amr10872487wmb.8.1700467518744;
        Mon, 20 Nov 2023 00:05:18 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b004064cd71aa8sm12586581wmq.34.2023.11.20.00.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 00:05:18 -0800 (PST)
Date: Mon, 20 Nov 2023 09:05:17 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v4 2/5] RISC-V: Add SBI debug console helper routines
Message-ID: <20231120-639982716fbfd33a6fc144d6@orel>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118033859.726692-3-apatel@ventanamicro.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 18, 2023 at 09:08:56AM +0530, Anup Patel wrote:
> Let us provide SBI debug console helper routines which can be
> shared by serial/earlycon-riscv-sbi.c and hvc/hvc_riscv_sbi.c.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h |  5 +++++
>  arch/riscv/kernel/sbi.c      | 43 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 66f3933c14f6..ee7aef5f6233 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -334,6 +334,11 @@ static inline unsigned long sbi_mk_version(unsigned long major,
>  }
>  
>  int sbi_err_map_linux_errno(int err);
> +
> +extern bool sbi_debug_console_available;
> +int sbi_debug_console_write(unsigned int num_bytes, phys_addr_t base_addr);
> +int sbi_debug_console_read(unsigned int num_bytes, phys_addr_t base_addr);
> +
>  #else /* CONFIG_RISCV_SBI */
>  static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1; }
>  static inline void sbi_init(void) {}
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 5a62ed1da453..73a9c22c3945 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -571,6 +571,44 @@ long sbi_get_mimpid(void)
>  }
>  EXPORT_SYMBOL_GPL(sbi_get_mimpid);
>  
> +bool sbi_debug_console_available;
> +
> +int sbi_debug_console_write(unsigned int num_bytes, phys_addr_t base_addr)
> +{
> +	struct sbiret ret;
> +
> +	if (!sbi_debug_console_available)
> +		return -EOPNOTSUPP;
> +
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> +				num_bytes, lower_32_bits(base_addr),
> +				upper_32_bits(base_addr), 0, 0, 0);
> +	else
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> +				num_bytes, base_addr, 0, 0, 0, 0);
> +
> +	return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;

We can't get perfect mappings, but I wonder if we can do better than
returning ENOTSUPP for "Failed to write the byte due to I/O errors."

How about

 if (ret.error == SBI_ERR_FAILURE)
     return -EIO;

 return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;


> +}
> +
> +int sbi_debug_console_read(unsigned int num_bytes, phys_addr_t base_addr)
> +{
> +	struct sbiret ret;
> +
> +	if (!sbi_debug_console_available)
> +		return -EOPNOTSUPP;
> +
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
> +				num_bytes, lower_32_bits(base_addr),
> +				upper_32_bits(base_addr), 0, 0, 0);
> +	else
> +		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
> +				num_bytes, base_addr, 0, 0, 0, 0);
> +
> +	return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;

Same comment as above.

> +}
> +
>  void __init sbi_init(void)
>  {
>  	int ret;
> @@ -612,6 +650,11 @@ void __init sbi_init(void)
>  			sbi_srst_reboot_nb.priority = 192;
>  			register_restart_handler(&sbi_srst_reboot_nb);
>  		}
> +		if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
> +		    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
> +			pr_info("SBI DBCN extension detected\n");
> +			sbi_debug_console_available = true;
> +		}
>  	} else {
>  		__sbi_set_timer = __sbi_set_timer_v01;
>  		__sbi_send_ipi	= __sbi_send_ipi_v01;
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew
