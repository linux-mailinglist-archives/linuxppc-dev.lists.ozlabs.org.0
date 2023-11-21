Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B107F3A57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 00:38:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=cNBeHWQ1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZgmc2RgSz3vdB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 10:38:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=cNBeHWQ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZfc53Skpz3bws
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 09:45:56 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-7a956887c20so240301739f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 14:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700606753; x=1701211553; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7iA+kWZUEVLsdUBXgt5tCOpWMD0Y1GKECDIJZh9fHq4=;
        b=cNBeHWQ1eGevIXViyePOBxfVQi0kBS2PAuCLW6DOsF0o5uRlaJBDXUH++XLUwgaSpz
         6wkAhTN4tHGhs05+PBdn45Na8QlDfI1BTEVskkzctH97SlpyHC4OLMn9keHjgxDzR/Yp
         bpnVy+WCH74R75qp/Fgg9uPKqG3LU3z85gyFgdd4F+2ZGsGTEaoOGOOqc9LUxmZXykFi
         mbJheFzrINNpXFNbjXWBe83kZL6HdkBGvY89Ysce7FSRipuh3fs/pSATDJUzzcPMxKv/
         rBIxLHaiKRWqtraIcCsx7Q0EH5KV8/PvKrEkTCq/Q2Tfbnk/snvAGY3SDybq2y4W0wpo
         oxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700606753; x=1701211553;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7iA+kWZUEVLsdUBXgt5tCOpWMD0Y1GKECDIJZh9fHq4=;
        b=DlEnpewywg04fOV66Rkf248wDY3/IZ5RkLijmyzk4rTVIU3/4JkdMFYc9HF7sFj6ze
         5oiQgLzBvRKKqy+2eK2Oj9Z88Xxppr9dfE5p0/6Rs2nPmK/JJ1GZp0Z2s6XBs/Xn+WdA
         SG8upLtL/nScu9TJ9cQW40KCXJho8n+vjjiPv5tm43lFbG7Ezgq8EJbgNKr62VgtDOT/
         S4c68TIu7eXZCuXu3IT36QiEr5EpHpWNybkNAHgedkZfrYoziqQ4wzpCorTOmXos9Q4l
         qKN55KidyJFnXWrLg1E0a0xAEqNBZfI6s+bfVhAp7APO3irFQ+DslKxM6sqlr2hSZCia
         xgcA==
X-Gm-Message-State: AOJu0YyyiUCZWweqyGiOBmrEC+DdfRL9e1VXxPGpWb4Ojf/NBcu4mNCN
	PNB1GQ8bmNNpMKD3UahDULyHPw==
X-Google-Smtp-Source: AGHT+IGhfz2kelvWRYhxoS/GC2I/AI6SPzGv2+DveMsAbESr2DRqPpVwoYyjSVjW8igCCV35ZmqdBw==
X-Received: by 2002:a6b:c812:0:b0:7a6:a089:572c with SMTP id y18-20020a6bc812000000b007a6a089572cmr316749iof.21.1700606752801;
        Tue, 21 Nov 2023 14:45:52 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:3d43:c8e2:1496:e620? ([2605:a601:adae:4500:3d43:c8e2:1496:e620])
        by smtp.gmail.com with ESMTPSA id p33-20020a056638192100b004664ef1a3c6sm1930255jal.155.2023.11.21.14.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 14:45:52 -0800 (PST)
Message-ID: <adf2a8f4-f675-4d27-8b46-5d80d3251b6c@sifive.com>
Date: Tue, 21 Nov 2023 16:45:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] RISC-V: Add SBI debug console helper routines
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-3-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231118033859.726692-3-apatel@ventanamicro.com>
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
> +}

Since every place that calls these functions will need to do the vmalloc lookup,
would it make sense to do it here, and have these take a pointer instead?

Regards,
Samuel

