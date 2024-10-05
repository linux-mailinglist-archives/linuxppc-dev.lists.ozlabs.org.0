Return-Path: <linuxppc-dev+bounces-1769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C066991ACE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Oct 2024 23:26:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XLdkz0XjBz2xpx;
	Sun,  6 Oct 2024 08:26:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728148453;
	cv=none; b=LGd/KteYH5h/pNT+x5LruZGLgfRpiIWqd4+jrvGxiVh3xbhpcwwsruNfI3TSyeCYgzlrvS1R1w/6pg5B9U8vPJQ1wF6vwY/zMbW+4+IPxj4MmzN/jjktzuQw0UUx5IRAUVpqatWRAGJ6JznNFVofYXyMO8hFjLXrGC3vIIgA+UsMNCcnHW5sdeQBUiyqIXO23t7KcfE80ltSetnb5KVkQ2m47/sKXs0L/xVU/+RZmzg/7F1sSqZ179zTgXUnsjku+YJB+hTNZZrcoThOF5xjmmMxloNKAJBPRnjvdNu/aUC1PMcagzZqSuhdEC6OzTyDQ38comRwK7naaWZrG6oP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728148453; c=relaxed/relaxed;
	bh=d+vL4rnKAcRWy/BUE6jAqCKdidayjqwnsDQnh1rx2zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmM+ECSXh1upki1dPCuIeSutt/gp6dNgzEQ7St8c55ght17a937ZvK2a5A+p/sQVO+Ab+WVUT9iv2ZbBzoqjuwh6AFZIS1Enc/H3WKrMqbPW9PD9ApVFEjOVPy2ddlFwCpUdKfBNXjHE5CocjEdFl/pSV+042rsKEHeE1Xh2azWLSMKwYbnX4sr7uZIOoIzWalB5zeUVhN6sQ+3oLc6EuVihc85QkzUBllxYxLQWq83wtCcbjxBIJg3kalwjdD5Fw4uRwnei4efTjItH409n2io4FzhioKeGUYTU69MqJL4CcZbUScSXfL6V6DQOOFqbCNvLCxodgQhYQfMCqoRlqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f0WCpxD1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=richard.henderson@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f0WCpxD1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=richard.henderson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XLX842QDjz2xks
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Oct 2024 04:14:10 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso2634278a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Oct 2024 10:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728148443; x=1728753243; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d+vL4rnKAcRWy/BUE6jAqCKdidayjqwnsDQnh1rx2zc=;
        b=f0WCpxD1ar+2YqtDsjbUwVxzo9xJ4aFNLocnVL/s41MUSk602fryVZAiFFeHinSgmw
         WN0WasVG0w7UWMNZUOL88Ff6y9fjjRb9TvNsnVXFfH3fr84gdWlq5/B6nDiC+CCaoJtM
         gX5snV/R/LMvVTUmJ6CswDZw7p42x1+zMbUvO2e4y7Z5W9zm6vHloUfc5G/ZX2o64sAy
         sqZy6uD1pBUno5igqJoYBqehFP/o/VYVHatl31gMNEIzFEUXV5+el8mkPMKJ1JsLyudJ
         vlKeGydQTPIhiF4iSFdCOocLv98wmBdgIFbvoN+aqa8jH/nP+5I3lPsb20AGHDDWYSet
         AgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728148443; x=1728753243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d+vL4rnKAcRWy/BUE6jAqCKdidayjqwnsDQnh1rx2zc=;
        b=smTWrip4T22NJ35he7RhQBbG4IsWJaP/Qnwx980Ipe9PG4wd7PdiRcletVOtb8ozjr
         Koaxnz3DkX+/QQd63yzs31/BsB5B1PxF+udBlMnKLbcCsZvfWGc0nvERbR2usEA0KmCj
         hdWXIN22HTr1xfIvt4kqqLTG5i33WLV1mXxb0fvohTvTBd9bJfyFQkvdFW4oJ7Rm04B2
         cdsXWARVKMy6EQK89ctXS6ZWBPBiuigcY5rT8TP/ppL2w93vW6ML4XT7fs4EppfGafHP
         pKfFQaj1iNydcadIAH2WZHAbY8iK7bnn9kSODdkICQjZ5mpR7xnIwnMg8FcANcqTiFdf
         UuVg==
X-Forwarded-Encrypted: i=1; AJvYcCUBTVCuA2mZWUue0IOEMF8zWF2wU2B8uBjg5zAgZvrjtj9IECES6Mm63gzDOntdZr3LLrQsdpg+jShSz3o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+TJNXVV9ykuxM3o8fhCB2qllFmUJkWOqlzI4lSHVZSHDrnRBL
	gcxrVPDPKcULkhhDwgz7KvgTStvxqCiqpkEV/S0sPUoR5mwLle8jH3HZ3K8hbnw=
X-Google-Smtp-Source: AGHT+IFyeSaZ/mX0gHS9Rgt1KvLjRdPDDqOZ19D3tlNlq221lO03ztxwxmd18OQJDpTQCgw1WknJ4g==
X-Received: by 2002:a05:6a20:9144:b0:1c6:8c89:88c9 with SMTP id adf61e73a8af0-1d6d3ae1752mr16549274637.18.1728148443249;
        Sat, 05 Oct 2024 10:14:03 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d7cfa4sm1697426b3a.196.2024.10.05.10.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 10:14:02 -0700 (PDT)
Message-ID: <24761ba0-99bc-4637-a76c-f29be10a1753@linaro.org>
Date: Sat, 5 Oct 2024 10:13:49 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] asm-generic: use asm-generic/mman-common.h on mips
 and xtensa
To: Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Damien Le Moal <dlemoal@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Helge Deller <deller@gmx.de>,
 Kees Cook <kees@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Murzin <vladimir.murzin@arm.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org
References: <20240925210615.2572360-1-arnd@kernel.org>
 <20240925210615.2572360-4-arnd@kernel.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240925210615.2572360-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 9/25/24 14:06, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> mips and xtensa have almost the same asm/mman.h, aside from an
> unintentional difference in MAP_UNINITIALIZED that has no effect in
> practice.
> 
> Now that the MAP_* flags are moved out of asm-generic/mman-common.h,
> the only difference from the its contents and the mips/xtensa version
> is the PROT_SEM definition that is one bit off from the rest.
> 
> Make the generic PROT_SEM definition conditional on it already being
> defined and then include that header from both architectures, to
> remove the bulk of the contents.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/alpha/include/uapi/asm/mman.h     |  2 +
>   arch/mips/include/uapi/asm/mman.h      | 65 +------------------------
>   arch/parisc/include/uapi/asm/mman.h    |  3 ++
>   arch/xtensa/include/uapi/asm/mman.h    | 66 +-------------------------
>   include/uapi/asm-generic/mman-common.h |  2 +
>   5 files changed, 9 insertions(+), 129 deletions(-)
> 
> diff --git a/arch/alpha/include/uapi/asm/mman.h b/arch/alpha/include/uapi/asm/mman.h
> index 8946a13ce858..1f1c03c047ce 100644
> --- a/arch/alpha/include/uapi/asm/mman.h
> +++ b/arch/alpha/include/uapi/asm/mman.h
> @@ -5,7 +5,9 @@
>   #define PROT_READ	0x1		/* page can be read */
>   #define PROT_WRITE	0x2		/* page can be written */
>   #define PROT_EXEC	0x4		/* page can be executed */
> +#ifndef PROT_SEM /* different on mips and xtensa */
>   #define PROT_SEM	0x8		/* page may be used for atomic ops */
> +#endif

Surely not conditional within arch/alpha/...

> --- a/include/uapi/asm-generic/mman-common.h
> +++ b/include/uapi/asm-generic/mman-common.h
> @@ -10,7 +10,9 @@
>   #define PROT_READ	0x1		/* page can be read */
>   #define PROT_WRITE	0x2		/* page can be written */
>   #define PROT_EXEC	0x4		/* page can be executed */
> +#ifndef PROT_SEM /* different on mips and xtensa */
>   #define PROT_SEM	0x8		/* page may be used for atomic ops */
> +#endif
... only conditional here in asm-generic.


r~

