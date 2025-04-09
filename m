Return-Path: <linuxppc-dev+bounces-7559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDFAA82751
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Apr 2025 16:11:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZXlHm14bdz2yZS;
	Thu, 10 Apr 2025 00:11:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744207908;
	cv=none; b=N5P18MwRGNlbvJw7/yVyzCTgDdZWHjfNXSTN+gdRdWBwlNFvFSYPRBk9nRfsT+jJxhvPqOmuku1KGOiJf2RKteJSpR3WZBcLHwQopAbXCggkjYcMJeVbsmWUt9GNCOMDJmUzLFTHmR/vdsyaQGbDaSKfkT5CntTLeRe6rvmR8zY9KOqm74+LDI4AlCL256GW584S9KE8+rrZ5SxMkGHjSmHd5elLEMYfWjSB59hsP1RvN1BV9fdQAbnRpuURhTJF4pt/WHt5qS1RwiEDtB3VmYntRDxcEm4XJm5rkrLDowMltz2u3Fy2uNU6hPtb6+Q8PlcdlNLp1Iu44W/+kSv43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744207908; c=relaxed/relaxed;
	bh=79dRAhMX6hAzgdIihnfQk7TyjpU16Gt/P7A1hHpHnDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VaF2rhAN4dpuQaZ15UaIbd1xkJxjklUPfr64n7gPoXeF+1Fi+ZM+hrwtOGLQxlYnTydYoITb9uTpLRcI5uFmR2ToT5O38QiUOeN8kdQQ8B4MkbfeDnEd6HdKnTLQxzNkMTlwhQQycrD72/nJOeSOFZg1uqTqHbRU2vZyOZ2bHGlahdVMFKwt0xE0BzYmiNKn2KtKmbyxeo9qcVYOB+dYtQSTpPwlsaDfcXXD+4WJSTfHYIPH+vftRF4V12t9SkL2UewJ1oojpRRtTjkwqacrN8yihb9xzDFZM1l7DO2HO980Iigx8GjGfiMxJGCPw6ZDECmAk/itz5ayBL5+S2X8Qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k+cszjHJ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k+cszjHJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZXlHk0DWRz2yRZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 00:11:44 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39ab85402c9so759254f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Apr 2025 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744207900; x=1744812700; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79dRAhMX6hAzgdIihnfQk7TyjpU16Gt/P7A1hHpHnDM=;
        b=k+cszjHJItoHVFa+OJSnKBymgKqzRmbD6/kaqcC9Z1xpVMzp/YiGUsMo847yOCVEle
         1HQJPMx/TmkFs8Kp0H17Kw+P19hDsA/slEgSfV9+hZ0k2KPk6tVp9T5yZ0N6FJuzuXLd
         BhMrlJRJxuUvK+ogl8vTYditQ2LSQzI6Yd5Vw0FI5NDHVpU/6LV8fYdWyHqSUz7n4R0Y
         DA4sAgtEXzJ7nJt/jlGPiGP/UmirPNR/xCFOgvWY+JYsYJDy+afaKnLfdOEhfQOWmCYq
         gIO3f8UizcOU+wShxhhvbWsiTJtvg1ZdAETxnE7DBp+764ePvQDMxh8h5RrFxTGKZ5V4
         lmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207900; x=1744812700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79dRAhMX6hAzgdIihnfQk7TyjpU16Gt/P7A1hHpHnDM=;
        b=K3cpWN5ndrLDBWshIPdV0vzVO2gsiR1Jlmyy2JuV65omk/rTSq7DzfVyW6G/k7148d
         v5MCcMAtluG2kz+3kOoXki0kyOKiBPIugBNAien+5m1SUPbdBEpLxzpeqEihrf6tbnDN
         MO0q1apHORobaeAEcIUUm08it89l+VGAWdNMk1WrVytBcKv+ui+QDwvQSPXHG7Nki5TG
         KOuH+LV1iXYGNrO0x2PHIztSvtQtwnnC3wRLTKmVrG6fGk+IKkKBjHUF1svkslsT2eRa
         FDpbvtGNDkSPDaDWn4hXm9vgqT3v05Zvxujx2ZUvIerXUlYXOWsc8TaxDK9vHyG3Q7tI
         iidA==
X-Forwarded-Encrypted: i=1; AJvYcCW2GuLoWgOQTS91/X/TRe3Ota/CWjm2hMEXA97wzk6FRnkcZcBcWfZhHF4SfWU7qhQcjxMWv1wuuRXT3EI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx8WywVNe1PoDJEZviLfUQeBSAKLHHFgptJ0OaOz2KF4s0I06+B
	9qBHqfcgQDr9x8xo/bM69HqhAFmjmmJjKVgUCw1gq0qI+/kJTIQt
X-Gm-Gg: ASbGncsO9wCMgrGqgQ/n+NWXr+GU8xJSB22g763Ay5q32OsnVgyuPk9XcgqUeSy4Z56
	A+UpN/qdBkbi6hYHyp4necbXWpe85OUHFTPfFkgB10E4E5EF+J0/0ox/V413kVoad6N53GfYbby
	qoOY/eS8cs/TYyWLsF+ago0gc0K0/7NAFBkTOIsn/+EOwka68AraTM5H1MzvXojfBu2qn9rKZuq
	bez8wGv2G7rz8vUgnrmzgVLuAjWb0t+Hxy6ZGdMgv7PYrzd2kiiUeWk/jWvfoUljVDH1/QnG/r5
	SuoxfoDv06j+OjtypgZcrGGjDgMqqxzYyiOQ3plc8G7U/ENZggcb/WKOavvW3dnG2RMy9g==
X-Google-Smtp-Source: AGHT+IHSANHfnsI22VvG7U6Add3MtuqdkHlNUqXmc+ZOIvDB4qPCFfsNQQmWuYIJe4cIBvlXQ9bdkg==
X-Received: by 2002:a05:6000:2901:b0:391:2acc:aadf with SMTP id ffacd0b85a97d-39d87ab626emr1029141f8f.6.1744207899192;
        Wed, 09 Apr 2025 07:11:39 -0700 (PDT)
Received: from [172.27.52.232] (auburn-lo423.yndx.net. [93.158.190.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5d31sm17305755e9.35.2025.04.09.07.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 07:11:38 -0700 (PDT)
Message-ID: <3e245617-81a5-4ea3-843f-b86261cf8599@gmail.com>
Date: Wed, 9 Apr 2025 16:10:58 +0200
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] kasan: Avoid sleepable page allocation from atomic
 context
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
 Jeremy Fitzhardinge <jeremy@goop.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, stable@vger.kernel.org
References: <cover.1744128123.git.agordeev@linux.ibm.com>
 <2d9f4ac4528701b59d511a379a60107fa608ad30.1744128123.git.agordeev@linux.ibm.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <2d9f4ac4528701b59d511a379a60107fa608ad30.1744128123.git.agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 4/8/25 6:07 PM, Alexander Gordeev wrote:
> apply_to_page_range() enters lazy MMU mode and then invokes
> kasan_populate_vmalloc_pte() callback on each page table walk
> iteration. The lazy MMU mode may only be entered only under
> protection of the page table lock. However, the callback can
> go into sleep when trying to allocate a single page.
> 
> Change __get_free_page() allocation mode from GFP_KERNEL to
> GFP_ATOMIC to avoid scheduling out while in atomic context.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3c5c3cfb9ef4 ("kasan: support backing vmalloc space with real shadow memory")
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  mm/kasan/shadow.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index 88d1c9dcb507..edfa77959474 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -301,7 +301,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>  	if (likely(!pte_none(ptep_get(ptep))))
>  		return 0;
>  
> -	page = __get_free_page(GFP_KERNEL);
> +	page = __get_free_page(GFP_ATOMIC);
>  	if (!page)
>  		return -ENOMEM;
>  

I think a better way to fix this would be moving out allocation from atomic context. Allocate page prior
to apply_to_page_range() call and pass it down to kasan_populate_vmalloc_pte().

Whenever kasan_populate_vmalloc_pte() will require additional page we could bail out with -EAGAIN,
and allocate another one.

