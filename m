Return-Path: <linuxppc-dev+bounces-1014-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD61696CA53
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 00:26:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzcXW5ZrGz2y8q;
	Thu,  5 Sep 2024 08:26:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725456113;
	cv=none; b=kP+nGYywwg2h3sqZAu3/P8wi3/U/bjFFHPoeOGbp2zTHqTvo6s7H8JbO8+By2XNOhZPlb0JLnM+jrOK3QICX66sj+9Sc40dJuieezWg1rG6VXJMmUTDgtOi8D18UWI/xxeyBAA1OzhfWk5w4nv2nP2nt++CwEUUmtKm1II1W5rbv5/GQPNlutjznIdTXLgInM49BiraqOZ5907qPS5fKcgbeN77LN8MGtnXhL+vBqc03sCvzlRuSTRo6ZarX8QzQg/LKQJ3YNjDzX9DNbNSCMRu+FEaMt8BVDQIDDL9Ugb/eMq+J4gvd4I0zbUth2+pY59fJP0z1zv0ygs9kOeexZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725456113; c=relaxed/relaxed;
	bh=Vd2ZYCNG0SqbW6OjTbIGTZ++FMQuVNRn0puOuY80IA4=;
	h=DKIM-Signature:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type; b=V+7QfY4kAELaJ5onKHu3124Eu61DAsfEsFvAF1mgUVuXBLMGZqhauNOGMYoD5I1+6GknTphD47DqNouEGvGs8Rmp+46InMcfurd6RTA6ngf8p6nG75OGXWSoySwhwP/gAM3ExVrVvrjlCl7JZi2j+ZRVuyBpyQX2sipfpE539tjiF16QlIljPBMC5FALnJw564930ySK4C20nzcEYgN7iARYbzUcU39jlyoXSpV3bjpIStBApuuhYdy1iPJmx8Kiji7G6cYkwl6uUZDpvzkBMI9TbLALKOhPG9pxVUaYYjkO77rzIbgUza7vooQuh0TAtaW0OnSj9nXFNrLSwmkmHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cSc5mpms; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=adhemerval.zanella@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cSc5mpms;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=adhemerval.zanella@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzNSJ5S73z2xKQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 23:21:50 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20570b42f24so33308965ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725456109; x=1726060909; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vd2ZYCNG0SqbW6OjTbIGTZ++FMQuVNRn0puOuY80IA4=;
        b=cSc5mpmsw02MCVDbHfLFmAfmV3tXykS+UqadkpUeITCvP93Mh8F6863YFiDN23C/Fc
         S4ABJDZBgkvBNO5qvCm4rOh8mPHYA1wOatwOF2HVBoz/ZT4DdVIEB4xgMb6WJd/JeCCU
         SOvjJ5Dh2mV78XIHVGrF6j+nEUXRN1EJtbYXSAXxlz1QlXcv20u5nrGljl+p3FJEDI1c
         2UkAQ7tEFka9pw3AjV9wIpyZOaCUr68zVfSBDHypvlD0MLfoQIMCFLaY/d4Qp+hIlf1O
         nnkxFFb5YhIB3QucckboERDoYFzrMDOlsjzaZqa/wX92MVDqVxWf/GKVvTOEEBNQbST9
         vusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725456109; x=1726060909;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vd2ZYCNG0SqbW6OjTbIGTZ++FMQuVNRn0puOuY80IA4=;
        b=m0KnYtI7G+J18/7+87hQ7bZIbmsvmXBTewvgIgAVmlGP6ABK0tnd+73rIyOEvvkPJ2
         5eqNGr8pMn4UvGfaX1SQts3I6p6/hwQa3PoEsTl9NOq0BZMupJlL4rec0fOaJASmBcAc
         9rf609kCzHw1zGM1ZOppRZMRDLmsZWTapqm1t7SXWEx5JXkeA9RHayICWyz8SmjtUuOs
         4f2O3O8f6yxD0PLPjKCDjhBEJq81OhIsWrnFbQZHbXoq8haJKdalVesK+y4jV0zU7hrb
         x2pyWMiWAt0WlJMBA17NeEHnhRGlWG9bt8Lf4e7YNK3VeZ9yBV9kkwNW9QHaHBHKbEeo
         nAdg==
X-Forwarded-Encrypted: i=1; AJvYcCXppvYXghN66XZLbTwdUVf5nM/MdOK7TjdCLmhD/0HpK86kNdFPG2feFZDbJqtxysn2KfMY+zO4JEwawvQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyFFwuESUTOXsZcRTR2DgxPiOKf7141oYuC2kUdFJH3Bc5v6lSP
	BvrQW/yzEgt7meTncKW1nx3t29Mgu4BCplQROBitf38I65OIC7QKBf7laNLP1XA=
X-Google-Smtp-Source: AGHT+IHNpwkCP+QEkYIrMc7mghHUBa8dyZ0ef4WmVGXl0vpaZbDnwcxB6gw+kSB/ilBIMALmK26aeQ==
X-Received: by 2002:a17:903:234e:b0:206:94f5:c312 with SMTP id d9443c01a7336-20699af10a7mr74145445ad.28.1725456108954;
        Wed, 04 Sep 2024 06:21:48 -0700 (PDT)
Received: from ?IPV6:2804:1b3:a7c3:e912:6904:dd5a:7f0d:ac77? ([2804:1b3:a7c3:e912:6904:dd5a:7f0d:ac77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae912bf3sm13555005ad.24.2024.09.04.06.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 06:21:48 -0700 (PDT)
Message-ID: <45fbd9a2-78f7-4697-b3f7-b26b72f4a795@linaro.org>
Date: Wed, 4 Sep 2024 10:21:45 -0300
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
Subject: Re: Profiling of vdso_test_random
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Xi Ruoyao <xry111@xry111.site>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <30e9575c-a53e-4e17-bbbd-7127798efb05@csgroup.eu>
Content-Language: en-US
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <30e9575c-a53e-4e17-bbbd-7127798efb05@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 04/09/24 08:41, Christophe Leroy wrote:
> Hi,
> 
> I'm done a 'perf record' on vdso_test_random reduced to vdso test only, and I get the following function usage profile.
> 
> Do you see the same type of percentage on your platforms ?
> 
> I would have expected most of the time to be spent in __arch_chacha20_blocks_nostack() but that's in fact not the case.
> 
> # Samples: 61K of event 'task-clock:ppp'
> # Event count (approx.): 15463500000
> #
> # Overhead  Command          Shared Object        Symbol
> # ........  ...............  ................... ....................................
> #
>     57.74%  vdso_test_getra  [vdso]               [.] __c_kernel_getrandom
>     22.49%  vdso_test_getra  [vdso]               [.] __arch_chacha20_blocks_nostack
>     10.80%  vdso_test_getra  vdso_test_getrandom  [.] test_vdso_getrandom
>      8.89%  vdso_test_getra  [vdso]               [.] __kernel_getrandom
>      0.01%  vdso_test_getra  [kernel.kallsyms]    [k] finish_task_switch.isra.0
> 

After tinkering with vDSO build parameters (I had to remove the '-Bsymbolic'
and 'objdump -S') to get perf show the symbols I see on aarch64 with a reduced
vdso_test_random:

$ perf record ./vdso_test_getrandom bench-single
$ perf report
[...]
# Samples: 305  of event 'cycles:P'
# Event count (approx.): 5583551
#
# Overhead  Command          Shared Object        Symbol
# ........  ...............  ...................  .........................................
#
    44.27%  vdso_test_getra  [vdso]               [.] __arch_chacha20_blocks_nostack
    21.16%  vdso_test_getra  [vdso]               [.] __kernel_getrandom
     6.19%  vdso_test_getra  [kernel.kallsyms]    [k] task_mm_cid_work
     3.14%  vdso_test_getra  [kernel.kallsyms]    [k] perf_iterate_ctx
     2.96%  vdso_test_getra  vdso_test_getrandom  [.] test_vdso_getrandom
     2.48%  vdso_test_getra  [kernel.kallsyms]    [k] __memcg_slab_free_hook
     2.28%  vdso_test_getra  [kernel.kallsyms]    [k] next_uptodate_folio
     2.05%  vdso_test_getra  [kernel.kallsyms]    [k] _raw_spin_unlock_irq

It is what I would expect, so I am not sure why might be different on powerpc.

