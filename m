Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03004824002
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 11:59:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=SLrT9oOc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5Nrf53k2z3btj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 21:59:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=SLrT9oOc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5Nqq1s8qz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jan 2024 21:58:45 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-556ea884968so458237a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jan 2024 02:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704365922; x=1704970722; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I5fZa5BBUNgRC/MuXKPlVg1/H35HoZwMYqORDEqtrMo=;
        b=SLrT9oOcY5rFtjEkmf8mP4Z1C48WXdbZJZVzkbg4mex51pXgQQtwloMPUPw0DMbzxN
         LhENsi/Y42UGB4dLq8JP+IiKJNd3nrj2tzyVIFHt4OBpb3loewKIWfD03hJX1Fkh1OIy
         ja9EIEXU2XTcB8KB9esVgpTbak6R1UxE+WIBkd34XYGG/D6/QMmmmygLFJZjyvnI3SDA
         cubkZPGFYxQSa9CFav08rJdf7AKzRvhDsa+oPwzkLjkALzm+xrvBD+gvm7PG2dz0vav7
         IU2+Ypfx1kX7Vzqi/ywA6LKoX6uuUcotCb37OkPolQPG1WV/w9JsQgrO4f9/TRDckHCd
         9+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704365922; x=1704970722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5fZa5BBUNgRC/MuXKPlVg1/H35HoZwMYqORDEqtrMo=;
        b=FWwlef0j5ywsVGdsUpUza404Iy1Ws0UAlh/3RgvHNOU3rriwCVvSGOFnh8ygIOYyB0
         /NwDfiY1goWF0wcStghCpB//L7lqqYWlT+3LA1XUipdvFtOSoXjJUFV/L4aM75D1eivS
         bq1z6c5IG6nd5HT+ZRuJT93AqGcV5siERdfmeYIzxqWrAZCfthIuHK6O9+5xKjRDBQ4O
         beiDl/1DOcRxZsGSmHfnibrkQXcHv/mSfkJDBvsXlpSjoeVANCk+Hn3hkYsqcMhpvaQj
         4UxjIIJQcxw3AsKRh4VOCOXWY0koJl6w1OY7Wj5PZ0dRpY1P/Qjc2oCtAtMiWdp9I4gT
         KpIg==
X-Gm-Message-State: AOJu0Yz8DtkLB2lXIxFUxs5jAw1Wra7yeq3F+1pLVR8xQd/NoZm6II0d
	GYYEkeIJOinb0v0H8CxEMxGUHYv9cZlWmlXDb85roI1twic=
X-Google-Smtp-Source: AGHT+IH2SFA7HOTq7Srx7DUub3qQkU+yO1rsmGqpIPcd4XSv3GgGa5Bl/CgkrtDWu8S+ikAtHQUTUA==
X-Received: by 2002:a17:906:d9c9:b0:a27:fdc1:593f with SMTP id qk9-20020a170906d9c900b00a27fdc1593fmr240521ejb.67.1704365529270;
        Thu, 04 Jan 2024 02:52:09 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y2-20020a1709063da200b00a26e4986df8sm10496620ejh.58.2024.01.04.02.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 02:52:08 -0800 (PST)
Date: Thu, 4 Jan 2024 11:52:07 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org, linux-next@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: KVM: Require HAVE_KVM
Message-ID: <20240104-d5ebb072b91a6f7abbb2ac76@orel>
References: <20240104104307.16019-2-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104104307.16019-2-ajones@ventanamicro.com>
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
Cc: sfr@canb.auug.org.au, aou@eecs.berkeley.edu, anup@brainfault.org, rdunlap@infradead.org, npiggin@gmail.com, palmer@dabbelt.com, paul.walmsley@sifive.com, atishp@atishpatra.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This applies to linux-next, but I forgot to append -next to the PATCH
prefix.

On Thu, Jan 04, 2024 at 11:43:08AM +0100, Andrew Jones wrote:
> KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
> supporting architectures select HAVE_KVM and then their KVM
> Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
> consistent with that approach which fixes configs which have KVM
> but not EVENTFD, as was discovered with a randconfig test.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org/

I think powerpc may need a patch like this as well, since I don't see
anything ensuring EVENTFD is selected for it anymore either.

Thanks,
drew

> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig     | 1 +
>  arch/riscv/kvm/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a935a5f736b9..daba06a3b76f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -128,6 +128,7 @@ config RISCV
>  	select HAVE_KPROBES if !XIP_KERNEL
>  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>  	select HAVE_KRETPROBES if !XIP_KERNEL
> +	select HAVE_KVM
>  	# https://github.com/ClangBuiltLinux/linux/issues/1881
>  	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
>  	select HAVE_MOVE_PMD
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 1fd76aee3b71..36fa8ec9e5ba 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -19,7 +19,7 @@ if VIRTUALIZATION
>  
>  config KVM
>  	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
> -	depends on RISCV_SBI && MMU
> +	depends on HAVE_KVM && RISCV_SBI && MMU
>  	select HAVE_KVM_IRQCHIP
>  	select HAVE_KVM_IRQ_ROUTING
>  	select HAVE_KVM_MSI
> -- 
> 2.43.0
> 
