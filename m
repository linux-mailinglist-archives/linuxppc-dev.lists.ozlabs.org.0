Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E09EB7F3A59
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 00:39:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=EDddOUD4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZgnW6FXxz3c01
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 10:39:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=EDddOUD4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZffj4J26z3c4R
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 09:48:12 +1100 (AEDT)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7a6889f33b9so211356939f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 14:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700606890; x=1701211690; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ha2zL2RliN6J5b2kLDdhsZ6GbGCv9fZnJqsfyqkrjz4=;
        b=EDddOUD4eHPDxTlDJiTdQ8cNZ0gcUNHkumUFc0FVg1br6OY6wiTQXEql1ABYLqJgcg
         1+jIG8YwwZPPru3W1i+/Pu9Z6j2EAhrrAf46Esp+DtXRw4tY4fyc2BGgTC0PM46dqr/O
         m60ukbkEE4vlYRta+kObKC2kFfxL2FyxJ0pKl02ljByGV8kbk2CwbjFrDHpPvWJ6Iz/D
         LI9UuOMT3gA1kxYBOoATBSrxjcxQLUEvmTDqTZBOkAatzsNnstJEI2G+Lm+iFJC4aWNU
         /hevK2Pnd1RZdKtUNQcr4m3s6dE9nUsl1ptXmPoy6Gu5clTmHLKuqqDF38t7+F1Q+dZ6
         InDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700606890; x=1701211690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ha2zL2RliN6J5b2kLDdhsZ6GbGCv9fZnJqsfyqkrjz4=;
        b=O1GCPSPB7xpAXkkKkt5tqZi2vNSGRZJxmD/ma5MVCluce1CHZLvgsuFRMF2K713v65
         cdWejKI2q7VI5LyquVtLGcC657RlrB8B58W80SfL+3ae3w6jbV5oWtbJWZ13BRaY9at0
         6SUn9WbSYSQeb3bHCoGgGYYubFF3Gk6I09KaKrr0fYD0gGFxjLZaz3IOhCtACtT2RCBL
         t1BDAmfqu50ETj0ocQ882Kb2vRRgToo3S2XK7gzl5k9wkfKmtwA9t+MEOUfqO40dya+B
         f3iuTXycxcz+7aUs3fIWkRgOjU5XjiTQiKeNgiXFhwHFeqlQB0ikIlcS+RSSMfBxCUGG
         zyXQ==
X-Gm-Message-State: AOJu0YzctspPYx2PDuciuiUre2rk8ZOk6nB/uwE3z86/xdUuWTbJTUXo
	BnhpqTcPwCtWERVOm6icvh7bYQ==
X-Google-Smtp-Source: AGHT+IEqopk3WpneTwAJdQEga6tdFjb3hMHKJSSM4AtmRyuOtlB2pSKEyHj6RtL8C3xrT6bMg/cE5g==
X-Received: by 2002:a05:6602:c08:b0:7aa:125a:b0c4 with SMTP id fn8-20020a0566020c0800b007aa125ab0c4mr437169iob.5.1700606889842;
        Tue, 21 Nov 2023 14:48:09 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:3d43:c8e2:1496:e620? ([2605:a601:adae:4500:3d43:c8e2:1496:e620])
        by smtp.gmail.com with ESMTPSA id fj34-20020a056638636200b004290fd3a68dsm2835154jab.1.2023.11.21.14.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 14:48:09 -0800 (PST)
Message-ID: <fb72e212-711e-4be9-9b92-89b2dc121476@sifive.com>
Date: Tue, 21 Nov 2023 16:48:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] RISC-V: Enable SBI based earlycon support
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-6-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231118033859.726692-6-apatel@ventanamicro.com>
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
> Let us enable SBI based earlycon support in defconfigs for both RV32
> and RV64 so that "earlycon=sbi" can be used again.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 905881282a7c..eaf34e871e30 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -149,6 +149,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
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

This file isn't used anymore since 72f045d19f25 ("riscv: Fixup difference with
defconfig"), so there's no need to update it. I'll send a patch deleting it.

Regards,
Samuel

> @@ -66,6 +66,7 @@ CONFIG_INPUT_MOUSEDEV=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y

