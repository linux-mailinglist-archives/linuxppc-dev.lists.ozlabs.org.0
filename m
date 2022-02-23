Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D97F4C074E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 02:45:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Jkr4Z8gz3dcx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 12:45:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=KgXpJPPM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20210112.gappssmtp.com
 header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=KgXpJPPM; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3JhJ4yQTz3bPS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 12:42:55 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id 4so8672752pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 17:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=sgQ4pvXgGqOVO+N8moxatmc5jwRe/+fI7Xu5f8+JqZo=;
 b=KgXpJPPMQwH9w8gozOo+zTZ1a384KP+JFjDoioBZIi6s8smONJs4TyFo+kGbejpfJD
 AnUvVpcCwYJXDkegOkRKwenDm9Bcy1n1aQgGolNklkCPtpDxRjodlPh8ROfIoqqQGWgw
 wc1Z3UQMXWImfkfneDskrMp1PLZpvMb2xrw9QAWiCjPSyKH5ztHVZbroTQ6dmTqG6Lc2
 A4xkJ+LfVum26Hb76lucaasDCRzDWvpeo7LmSfqxJdE8LUVUlFGq9YldMUlujQM5YwMQ
 6E9ukyeoRGTs5m/d/477F+RzD75Ilmmnh/nact1JsbYH8PJzUdJ7E9F83aVz2wOyHISi
 mxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sgQ4pvXgGqOVO+N8moxatmc5jwRe/+fI7Xu5f8+JqZo=;
 b=PAczmhc4AoyqYo+syWwDowiG+hKhr2r0vBB8T65vUfuXGhU8ovPyVD+qT/sNbkAnfv
 GbQH/KjXjCenW4jxNGzWdB4NraGCPKQbAmwXNs6desoq86TCErIZBKBBMD2HORfwlgJp
 Fz4IDQ1oa/e+lHhJnAHw2foU3XqCv1yko/e/Z7X0OgVbnieQJlYL4vPeZp+qcZrfR2r+
 muu84Z9SqVmq72BIwY/N9lP1IOM7BBfWE/9bEQIu163xNM35spc7W68i20tWexps2H7w
 JYxNgu3eiCH4rdUtSan72gbMiTqrL97N7wIjeCCmj5feG6Kv7Qgqovt1ZkUoo77CHbQo
 gWcw==
X-Gm-Message-State: AOAM532t3rc4uljDVJeL9dV+5BImxnk4qyq/YeW0Di9RVa4GUtmzVmyi
 JEjZr9w362iLUwkIvRfsXz2A4Q==
X-Google-Smtp-Source: ABdhPJxkNmlCxKcZY6Nd/iFQ4JtJcxqvcyi1rl2zS5ckqmSSgYGC4lT0zZsv8apBv/K5LTxvkvT3FA==
X-Received: by 2002:a17:90b:197:b0:1bc:5037:7c52 with SMTP id
 t23-20020a17090b019700b001bc50377c52mr6928726pjs.174.1645580570678; 
 Tue, 22 Feb 2022 17:42:50 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id o125sm17941244pfb.116.2022.02.22.17.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 17:42:50 -0800 (PST)
Date: Tue, 22 Feb 2022 17:42:50 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 15:31:01 PST (-0800)
Subject: Re: [PATCH V5 12/21] riscv: compat: syscall: Add entry.S
 implementation
In-Reply-To: <20220201150545.1512822-13-guoren@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-27e65ada-d969-45b9-aa94-e69469cdf095@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 guoren@linux.alibaba.com, linux-parisc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>,
 drew@beagleboard.org, anup@brainfault.org, wangjunqiang@iscas.ac.cn,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, guoren@kernel.org, liush@allwinnertech.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, wefu@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 01 Feb 2022 07:05:36 PST (-0800), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement the entry of compat_sys_call_table[] in asm. Ref to
> riscv-privileged spec 4.1.1 Supervisor Status Register (sstatus):
>
>  BIT[32:33] = UXL[1:0]:
>  - 1:32
>  - 2:64
>  - 3:128
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  arch/riscv/include/asm/csr.h |  7 +++++++
>  arch/riscv/kernel/entry.S    | 18 ++++++++++++++++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index ae711692eec9..eed96fa62d66 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -36,6 +36,13 @@
>  #define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
>  #endif
>
> +#ifdef CONFIG_COMPAT
> +#define SR_UXL		_AC(0x300000000, UL) /* XLEN mask for U-mode */
> +#define SR_UXL_32	_AC(0x100000000, UL) /* XLEN = 32 for U-mode */
> +#define SR_UXL_64	_AC(0x200000000, UL) /* XLEN = 64 for U-mode */
> +#define SR_UXL_SHIFT	32
> +#endif
> +
>  /* SATP flags */
>  #ifndef CONFIG_64BIT
>  #define SATP_PPN	_AC(0x003FFFFF, UL)
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index ed29e9c8f660..1951743f09b3 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -207,13 +207,27 @@ check_syscall_nr:
>  	 * Syscall number held in a7.
>  	 * If syscall number is above allowed value, redirect to ni_syscall.
>  	 */
> -	bgeu a7, t0, 1f
> +	bgeu a7, t0, 3f
> +#ifdef CONFIG_COMPAT
> +	REG_L s0, PT_STATUS(sp)
> +	srli s0, s0, SR_UXL_SHIFT
> +	andi s0, s0, (SR_UXL >> SR_UXL_SHIFT)
> +	li t0, (SR_UXL_32 >> SR_UXL_SHIFT)
> +	sub t0, s0, t0
> +	bnez t0, 1f
> +
> +	/* Call compat_syscall */
> +	la s0, compat_sys_call_table
> +	j 2f
> +1:
> +#endif
>  	/* Call syscall */
>  	la s0, sys_call_table
> +2:
>  	slli t0, a7, RISCV_LGPTR
>  	add s0, s0, t0
>  	REG_L s0, 0(s0)
> -1:
> +3:
>  	jalr s0
>
>  ret_from_syscall:

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
