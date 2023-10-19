Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9217CF326
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 10:47:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=n0v+zL6X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB1Z14JdXz3dnN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 19:47:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=n0v+zL6X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB1Y73GDBz3cBH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 19:46:50 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32d80ae19f8so5959922f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697705202; x=1698310002; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FirHlCGgMz/FvpzIKQkoBCDO6SGDDg5U9N5KzhQ/LwY=;
        b=n0v+zL6XQ//NsC+SwxWO3W6k7Q3u7sxT1rJFuYTZxI/0cxjcCqf7zyvaOvEmxdotI8
         vpnag3GCbhgfZ1p/H4dsWSsOJaCw10CUeYPPNB4SoYkQvAU5jFya3iooWPVeJEV2SFH2
         2kEPJywyzXQfKtUCVSGm+PyfQ8E+aS4XviYQVVZB1CJn++S1Gzw6gEINTr4E0j2h+6O+
         yqvT7pVrEXuAmbmA+kfSPdbL7vRlczMLptA9YXjXgGAdhrZC9W54kHwe0cJxIOzWW/m2
         Zx+/z2rDVRYMK6r2ZEpZwcvafMJtKph+B8PtEmfasoOG6fuiq1E9DaLLV6Xc3hhSnbUC
         A+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697705202; x=1698310002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FirHlCGgMz/FvpzIKQkoBCDO6SGDDg5U9N5KzhQ/LwY=;
        b=LXeAb0oiw+OicwyslV0t1ex8K6P6aL0pfSpRbamr1ULYLMu3NBap1y/0F2VOOaWjbf
         Na9TFWECvDjirqee3ILIorada2AY2ybGC1zY4e3SQLC+JmOD9KVtwoCNSEzMkkYZHzop
         IDgByt5XWE6GRm2SxZEiBAuX3E8PPALPG7TJr+iHD135rMqiq5fI+2tjkeRnnfkFwNHa
         EFnAX0rJO3pjZO5YQ1qS5E274wRKcXhIMvSjAjcvFZTv8IhflD5EKbwnHPqsG3jULyeK
         q8v/z/IcGAKXgNs0RLewKulcTszgMcZQD0JeUnUl3nAYprtAlLMF1apNj6GfUz6OwU2A
         peEQ==
X-Gm-Message-State: AOJu0Ywmsm6lkFJf7eXQZDs84TTao03hxgMSUkm5Y8EduATzDcaJXNVU
	sK2X/TxPnOJ83rQmF8bruTsShA==
X-Google-Smtp-Source: AGHT+IHIrPhAgCqHiVC0M3rtirooHgesr0AO+GlYhKykcNrHjz1YNAMNd8HgQcR133zWbZZBLn3Q5w==
X-Received: by 2002:adf:cd83:0:b0:329:6be4:e199 with SMTP id q3-20020adfcd83000000b003296be4e199mr1046765wrj.13.1697705202536;
        Thu, 19 Oct 2023 01:46:42 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id l16-20020a5d6750000000b0032dc1fc84f2sm3960900wrw.46.2023.10.19.01.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:46:42 -0700 (PDT)
Date: Thu, 19 Oct 2023 10:46:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2 8/8] RISC-V: Enable SBI based earlycon support
Message-ID: <20231019-08c33e28cf77beab61519f49@orel>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-9-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012051509.738750-9-apatel@ventanamicro.com>
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

On Thu, Oct 12, 2023 at 10:45:09AM +0530, Anup Patel wrote:
> Let us enable SBI based earlycon support in defconfigs for both RV32
> and RV64 so that "earlycon=sbi" can be used again.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index ab86ec3b9eab..f82700da0056 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -132,6 +132,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_8250_DW=y
>  CONFIG_SERIAL_OF_PLATFORM=y
>  CONFIG_SERIAL_SH_SCI=y
> +CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 89b601e253a6..5721af39afd1 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -66,6 +66,7 @@ CONFIG_INPUT_MOUSEDEV=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
