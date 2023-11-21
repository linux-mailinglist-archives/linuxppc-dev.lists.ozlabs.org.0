Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3187F3A50
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 00:36:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=L/2XfFWb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZgkn07dxz3clH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 10:36:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=L/2XfFWb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZfPH2nhPz3c18
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 09:36:33 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-359d796abd6so764705ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 14:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700606187; x=1701210987; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Czx5VSw2pBO1b75rdOa8rP1Tn4/X67nT2FHShLEAAdk=;
        b=L/2XfFWb5DbBTi1fxD7CMic3v19CCudXW0pYCQVCylZCxwgbmorcrewARD+My0KQPb
         l3DG2Kvkq6NQhGAPzm4+xpbe3P29O4dzdjgvNSC8oIDNWmDLcuCWwkMnJ8lJ0z846R0R
         FozH01nOm6l20Fj/JbDHsybnImUFDGLuQyz4Fe5ROcBFlp9KeNeWhG5tPMyOTGp6CGKI
         rMAuVPTZd/y6SLYCLDF+13j8Y3QgFRTl7Z/fEhy4oyH7YkAuNPLx3DLZtsOJQuVgREnS
         gPZEh92HMBT3VSZIVaaN58DGMW2YOMOIidwU7/J3NcbWkgq/JkqHpPUdVkvRTV3agBSA
         PeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700606187; x=1701210987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Czx5VSw2pBO1b75rdOa8rP1Tn4/X67nT2FHShLEAAdk=;
        b=Y+YNJzOvW/sHxHvwNPQI03/wdHPSkm5FukxVSkGkLDobrEQ7zrvAz9gtV7F+Xy7pFF
         Jiqe/LdytFVqcAa8jcbtU+ReA5uCjoxLl9EDVBmhBRSrsvDarzQgrdllJRlXLikOmCui
         I3OHg0fBoUX0wnlnR0ba72BpAHykj/2xX8IsLsbzc5DI8jsLcMHrulDuf10jkIodGhf2
         P/WGuP7/rWAkl84+GHJrnlKjHCzYhENPG0jdY8/J5Rbsd4TrUaS1HcV42axD38RODRoA
         wjM+xK9Mih6FN1Oyy+lEpiD6ckSucuNL7XL2SnRhrKcy3h4pAfcX5vtHM5OgpWR/jyzy
         8uYA==
X-Gm-Message-State: AOJu0YzEya5In4WDRCF3rIg/nqLUKVsVd8+gCFzc1fZA4vXBC3HjqbeY
	mghu7f6GiMI6StoLiLhvYV66Bw==
X-Google-Smtp-Source: AGHT+IGfRVAH/8cvT9hmm4Ha5Eu0JN6NTmiZ2ExPb4m6TDcyvIXswopr0JkqwntNsAW38gNPKGfKow==
X-Received: by 2002:a92:cac2:0:b0:357:f72d:ad06 with SMTP id m2-20020a92cac2000000b00357f72dad06mr285038ilq.2.1700606186826;
        Tue, 21 Nov 2023 14:36:26 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:3d43:c8e2:1496:e620? ([2605:a601:adae:4500:3d43:c8e2:1496:e620])
        by smtp.gmail.com with ESMTPSA id 8-20020a056e020ca800b0034aa175c9c3sm3434455ilg.87.2023.11.21.14.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 14:36:26 -0800 (PST)
Message-ID: <70ff59ea-378c-4d53-899a-eafffcad22fd@sifive.com>
Date: Tue, 21 Nov 2023 16:36:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] RISC-V: Add stubs for
 sbi_console_putchar/getchar()
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-2-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231118033859.726692-2-apatel@ventanamicro.com>
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
> The functions sbi_console_putchar() and sbi_console_getchar() are
> not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
> stub of these functions to avoid "#ifdef" on user side.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 0892f4421bc4..66f3933c14f6 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -271,8 +271,13 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg3, unsigned long arg4,
>  			unsigned long arg5);
>  
> +#ifdef CONFIG_RISCV_SBI_V01
>  void sbi_console_putchar(int ch);
>  int sbi_console_getchar(void);
> +#else
> +static inline void sbi_console_putchar(int ch) { }
> +static inline int sbi_console_getchar(void) { return -ENOENT; }

"The SBI call returns the byte on success, or -1 for failure."

So -ENOENT is not really an appropriate value to return here.

Regards,
Samuel

> +#endif
>  long sbi_get_mvendorid(void);
>  long sbi_get_marchid(void);
>  long sbi_get_mimpid(void);

