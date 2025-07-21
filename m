Return-Path: <linuxppc-dev+bounces-10343-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A086B0CD67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 01:00:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmG7h2vl7z2yZ6;
	Tue, 22 Jul 2025 09:00:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753138800;
	cv=none; b=a52Q5nN11C1MxpYkCNugzNQy8PPWPzwYZVNdGE+IUWofoKPZFqgJfH67zdzhFos+iwUXT1EeGipMfqkc9SmijOmE7whN+x2WESA1wypT3N2M2R4bcl7HIzxltvfaVizE49bIlAymcoXvrCVtoaMMZdUOjgu+pWgbO6W6EiXTnkUo2bNBUEwgBpFHWrV8gyZhbMbNJEOBIMl+e659mXW23wkXXCF7B/bLWgCLfCihiPz92hpNlVGNnXXMLuMWa9cDs5CRAoCjLxlnGgrRJ2+8lc8RMcZ0q0SvJj/aHUNrbBz0ejijb/jOEInlvGFnTC6JmR9jPYBiVZBA3wjWpGrKtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753138800; c=relaxed/relaxed;
	bh=k6qH8mhMJUNtpiP5ZkZtwmZQrunIQJlcyvnjoj0lgTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8DyqxFWHm9HdoNUp0tgXozNiQm3+m/hgYRmhaPpaJdGc4OrhqUz9yEWCooST7QM347fgaHYHBo0D4OB92CQv/BRyG0na5+P4NVciHZvDuy8luzxQv60kaqAZgkYACzMBDdrSOsrNs00Wroxt7uBq0jqPBAfWKhsDcNLBtVlk13zcWL8e0Ak+sw7AGv5Ko17ekCYdTQ2dBH6MHoycnYyBxHx+1oR81ZMZ87sEJGf2qLqGH23x0H5yClrX9bxczMWu5UGtDXIiBWmQaoNSQcP/Mcgx/wxNu4x6uBmYfw3AbCzXIEWfTC+IRedCTZlxt0OLCPotJyML+BL29r3l6g1uA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mwsl87K0; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mwsl87K0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmG7g4QXwz2xlL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 08:59:59 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae35eb87810so98057966b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 15:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753138796; x=1753743596; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6qH8mhMJUNtpiP5ZkZtwmZQrunIQJlcyvnjoj0lgTw=;
        b=Mwsl87K0MDSI5g24AYUNrNW/38ixAtipLah96a0aKwNyq39imyHKky8XX7L2DahbSQ
         TFVESRgW3m2gzpa+c/xEAQdYEPjObSu6Alh4YIrLYl+VMwzpdd1j7rdba5uxYVpRMe4D
         d0GvVzYNH64JipX2CEZztAVEUZBzOFXxzM50gTXGZSXNIQHk8pnEyyi2ijkXLSzrVGzs
         5FNhthrahUKZK42cLwYluKr7jOLdwB4NNDNUkKoCGkLeSzbMMLAG7XAS1dzg5BBnblUs
         iDO0Z5h1908apkETUT7+6qtfp6tsKGghfT3kD6j2JDv9Y9ea2zAtGhuxJQy98kYHUHEB
         v6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753138796; x=1753743596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k6qH8mhMJUNtpiP5ZkZtwmZQrunIQJlcyvnjoj0lgTw=;
        b=W5askTqxRsc+ABWrwNUl8apdrR/kpRNhLkh/T0Q9nxjag6OfkC0Nk+8zk8arH34Xy1
         dZJOgZ64htAZvh4N4BoW9A3tfVFVCT5Zb1oTrL7zEg+I62qbE/rHRLJrK2mf5tTkporM
         KBoKWWFUR+sPMJVaGmyZKLB5NJ5b+6wrK0OPagpkGxOKpcfRUqUfMT2yiykpScTmJozP
         WWXzzJn7E9UDnRAxz/rQPlNLgMeMjupMxOPzepm7hCTbA3sym2R5duad84g01cSVUYHy
         imCiotzIFtHzFdC8SspADY0+2BaIvC9JfIiWClbXYB99YTQMfpT2eZqK+DBvwY11GSw7
         ZTIw==
X-Forwarded-Encrypted: i=1; AJvYcCWMllv9AsVhPzDvQ0e8KP1ufQIoceAEyYByY0De6Fty5eAG0nRHmej4GW0khwvfEX6VrlOqMMQViFMtYw8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzAY96mLjjrAzRYsi/F+zjKmGivH/fuy4qcoQMJInFI5oxE8wrp
	yKbu7yCrXDicD3IK6IDzO8FpmJvsTLu/lCdE7Mw/1CUJDaCJQs3OqvFJ
X-Gm-Gg: ASbGncstwYF8uoCoZHp+by5yGPXq4FPVHUEJApGHIyA/VDuFV4SP5jgYRX7Sq0CpHMO
	/6PNOBYnY6UGjGir5XfQey0L+wqoL0NVDy+tXV27l9Le/IGWPEMHITu9t8yjVSml+bI5p0VXOZF
	m5grxcHi+fKrs6ThLGlilJyVYdeCYgdcoCsxDRZR2eIc9bW8FlwKwcR2+AnRJSPJadfYBUBI9Lw
	lYSW+Z0VDmDWT6KkreSQQBVAd02q7UR7DNvxTmva+71Cqs0GsxNacLKoAB1yNVpxwanIlstfnKf
	x30D9+biK1pPQfo+sXVUKfJoAHgijRKqadtpB4JrEfuL68asxgnXy0XxxgaSloVgFJxwQ2yaoww
	Qp6s2YFYC1W1T+AXxeiupT7jbuHr7fktY9iBM+fifl48wazvBV5Kve0BO8yw7i3E8L8lIyvYure
	QCMPs=
X-Google-Smtp-Source: AGHT+IEnEupELw4ajNrlfkyI1uQuImlm2WT9jEJPd1nte24ZB52Dcj+jDrjKRG7BtovOALnxWEn+Rg==
X-Received: by 2002:a05:6402:3582:b0:612:b0d9:3969 with SMTP id 4fb4d7f45d1cf-612b0d93f03mr5896841a12.8.1753138796402;
        Mon, 21 Jul 2025 15:59:56 -0700 (PDT)
Received: from [192.168.0.18] (cable-94-189-142-142.dynamic.sbb.rs. [94.189.142.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f543ddsm5962670a12.30.2025.07.21.15.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 15:59:55 -0700 (PDT)
Message-ID: <bc47c08b-fbc7-4954-8e81-c22bce654556@gmail.com>
Date: Tue, 22 Jul 2025 00:59:34 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] lib/kasan: introduce CONFIG_ARCH_DEFER_KASAN
 option
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <20250717142732.292822-2-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250717142732.292822-2-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:
> Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
> to defer KASAN initialization until shadow memory is properly set up.
> 
> Some architectures (like PowerPC with radix MMU) need to set up their
> shadow memory mappings before KASAN can be safely enabled, while others
> (like s390, x86, arm) can enable KASAN much earlier or even from the
> beginning.
> 
> This option allows us to:
> 1. Use static keys only where needed (avoiding overhead)
> 2. Use compile-time constants for arch that don't need runtime checks
> 3. Maintain optimal performance for both scenarios
> 
> Architectures that need deferred KASAN should select this option.
> Architectures that can enable KASAN early will get compile-time
> optimizations instead of runtime checks.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
> Changes in v3:
> - Introduced CONFIG_ARCH_DEFER_KASAN to control static key usage
> ---
>  lib/Kconfig.kasan | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index f82889a830f..38456560c85 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -19,6 +19,14 @@ config ARCH_DISABLE_KASAN_INLINE
>  	  Disables both inline and stack instrumentation. Selected by
>  	  architectures that do not support these instrumentation types.
>  
> +config ARCH_DEFER_KASAN
> +	bool
> +	help
> +	  Architectures should select this if they need to defer KASAN
> +	  initialization until shadow memory is properly set up. This
> +	  enables runtime control via static keys. Otherwise, KASAN uses
> +	  compile-time constants for better performance.
> +
>  config CC_HAS_KASAN_GENERIC
>  	def_bool $(cc-option, -fsanitize=kernel-address)
>  

This needs to be merged with the next patch where this option at least has some users.


