Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0920F389BE8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 05:34:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlwMB73Smz3001
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 13:33:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=r8cfHmDe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=r8cfHmDe; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlwLm0pj3z2xv2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 13:33:34 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id b7so4056128plg.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 20:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:cc:from:in-reply-to:content-transfer-encoding;
 bh=uh/AhorRtA4XtzQ3+Jum+20lJfkZDrBbTUmmaGp1NEc=;
 b=r8cfHmDeeB8laB3h0UarWI1ejPwMhGneXm/jy1xHWPYhoXeZaud9VcjwrG+IRfFZZe
 U2tKLxtFjvzDlwqUV6Gv4tpwthLd9ULi1CZIrPg3zNMnFrFlYmN7WaQJVBA35fCJc+Lp
 GdicJucaKXHWhlzLyZcqa7Eyx71HVTc6na/YkbtZ++mjXqLh3CwoVvw30/3QUqPdTIDr
 VBCLG9KWRJaHtICO//+oAq4POF8SVmm1+sIHY4VMt9dTOVVKqAGWj/TPMEhFpiefPboT
 XGW1Ucqh4XN5OLeZw/QKjENdyPmxUVzfkUiW9l9OiEw2SejZ1q1diWob1WUALL0Zo7pg
 p/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=uh/AhorRtA4XtzQ3+Jum+20lJfkZDrBbTUmmaGp1NEc=;
 b=OPwmM4y9IIW6ZTY91YGJ9RPFvFMYXJswuzxnQpdnZoYKMiUJzHvrX63dOJ7in/vyJ4
 0ZIeQAwcV9pEw1rDob59ts88kLCymI2TWBgjs/51dwWaVpLg0OaIlb4Eso6cT9YMBBvh
 mQCfGQd/R95/JnJLGCc0+A4CcDtRKsRoHswI3ktm6q/DZSM2kgYizlKAx5kauyaosNKS
 mn8QB36xLkKrl+pgqCneegeylLvK/zyM9N7QC3OyvQBokMa2+OeXmyyiDdrdt3bzKzYE
 Yau4HTUENTyH/J4Em1+WzIm8cmaCpryUMG0M3ajbWNj/k2q8aqp7fi9KwZZLRhHpQhzg
 fQuQ==
X-Gm-Message-State: AOAM530Yktid/x70TunjXYD2jo05jMPlk10sOdrM9UD3j7gD9rzJ+v7C
 AXOfb8/hlXHYbQxyaP614nu9L/gvR8/D+A==
X-Google-Smtp-Source: ABdhPJy/ADiM/N7AtE4spsknRSpgC6BMDvLVb+BTVFArdXHqaapOhtORloNgVXs9LaLgH1lFCayYtw==
X-Received: by 2002:a17:90a:7e09:: with SMTP id
 i9mr2476103pjl.166.1621481612474; 
 Wed, 19 May 2021 20:33:32 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id bt4sm677585pjb.53.2021.05.19.20.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 20:33:31 -0700 (PDT)
Message-ID: <74d06e55-62c3-6367-bb33-f6bbeffcac74@ozlabs.ru>
Date: Thu, 20 May 2021 13:33:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [RFC PATCH kernel] powerpc: Fix early setup to make early_ioremap
 work
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org
References: <20210520032919.358935-1-aik@ozlabs.ru>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210520032919.358935-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hm, my thunderbird says it is not cc:'ed but git sendmail says it did cc:


Server: localhost
MAIL FROM:<aik@ozlabs.ru>
RCPT TO:<linuxppc-dev@lists.ozlabs.org>
RCPT TO:<aik@ozlabs.ru>
RCPT TO:<mpe@ellerman.id.au>
RCPT TO:<christophe.leroy@csgroup.eu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
         Michael Ellerman <mpe@ellerman.id.au>,
         Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH kernel] powerpc: Fix early setup to make 
early_ioremap work


Not sure what to believe.


On 20/05/2021 13:29, Alexey Kardashevskiy wrote:
> The immediate problem is that after
> 0bd3f9e953bd ("powerpc/legacy_serial: Use early_ioremap()")
> the kernel silently reboots. The reason is that early_ioremap() returns
> broken addresses as it uses slot_virt[] array which initialized with
> offsets from FIXADDR_TOP == IOREMAP_END+FIXADDR_SIZE ==
> KERN_IO_END- FIXADDR_SIZ + FIXADDR_SIZE == __kernel_io_end which is 0
> when early_ioremap_setup() is called. __kernel_io_end is initialized
> little bit later in early_init_mmu().
> 
> This fixes the initialization by swapping early_ioremap_setup and
> early_init_mmu.
> 
> This also fixes IOREMAP_END to use FIXADDR_SIZE defined just next to it,
> seems to make sense, unless there is some weird logic with redefining
> FIXADDR_SIZE as the compiling goes.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>   arch/powerpc/include/asm/book3s/64/pgtable.h | 2 +-
>   arch/powerpc/kernel/setup_64.c               | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index a666d561b44d..54a06129794b 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -325,8 +325,8 @@ extern unsigned long pci_io_base;
>   #define  PHB_IO_END	(KERN_IO_START + FULL_IO_SIZE)
>   #define IOREMAP_BASE	(PHB_IO_END)
>   #define IOREMAP_START	(ioremap_bot)
> -#define IOREMAP_END	(KERN_IO_END - FIXADDR_SIZE)
>   #define FIXADDR_SIZE	SZ_32M
> +#define IOREMAP_END	(KERN_IO_END - FIXADDR_SIZE)
>   
>   /* Advertise special mapping type for AGP */
>   #define HAVE_PAGE_AGP
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index b779d25761cf..ce09fe5debf4 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -369,11 +369,12 @@ void __init early_setup(unsigned long dt_ptr)
>   	apply_feature_fixups();
>   	setup_feature_keys();
>   
> -	early_ioremap_setup();
>   
>   	/* Initialize the hash table or TLB handling */
>   	early_init_mmu();
>   
> +	early_ioremap_setup();
> +
>   	/*
>   	 * After firmware and early platform setup code has set things up,
>   	 * we note the SPR values for configurable control/performance
> 

-- 
Alexey
