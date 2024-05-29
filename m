Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 44F978D4160
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 00:26:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=cvgJVUuX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqP3J69hrz7BSd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 08:20:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=cvgJVUuX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqP2J5GLKz7B35
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 08:19:52 +1000 (AEST)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7e8e7306174so798739f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 15:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717021189; x=1717625989; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mC4b6Il0GC2QVDL2/I1OYkGxzS6sqepYodC6YDu796A=;
        b=cvgJVUuXK95HbGTYoojl2ZKlI4ZrXdG03sd3dFr9BoLPrIoJf7Do+VzDqZ6bfXgXRy
         ptLT+MS5h0iNRmI2FCWI0K6XQ9lisacqx6cESOd6gXZWHY1E8tQV8R9S62Xk5ZjFmWuM
         D0/sQbSuRtFk/qJyun1jem1KMWqpIkWYGGET8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717021189; x=1717625989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mC4b6Il0GC2QVDL2/I1OYkGxzS6sqepYodC6YDu796A=;
        b=r68Y7quzSf3B/VqvCbqNmPQ0qnkZ5PAkpv9iH7GQyi+iZG05Q9ATL9lehS+NMENI6a
         MCbsfHBuv+IztzR+kZOMLeR4N8yLjmTqsXHC+YZoxlYwjnYo308Fd6xQh03TtcCQQ/4u
         6sJssk0Tn7wjCmGjPXMsFzCzX4h73HhNW8/uWR7EuspgfX4uB4ZVOgbjGw4tLi5Z1yQH
         26pkzpRQ6h34/3p1LkIBfCgaPsUlv7wcJ1bMmeYhCcTDiI6ps/+wFlEJC4ZQj2O01JLl
         4kkFaUJrzGZqW+jKuwsPL1cjEXeg9gTCnSexAXpnvWPdYFuhVsYHRRZwCHAwjbATqzBs
         7W9g==
X-Forwarded-Encrypted: i=1; AJvYcCXYZ088t8eXuzCI31V1+b9Mxj6q4XnZdshQkZdZ/RdRV1035T5LnXo1LeOKAXWZc1314f6sTu8GywJed3yMBTAax5DnikjM6jeeqADW5g==
X-Gm-Message-State: AOJu0YzBzlm4EhuKHLR9C4rd5LbFwUnJLtVd9iPsjkdzExphFwmrFVE8
	oH+GrWEJ6PBQvNsID57I3PzyRgMsBiq4OWRM5tLQxsn3/qftvlxaj3NMvLMyI7Q=
X-Google-Smtp-Source: AGHT+IHkLiHSvg/KtR3lDXPP39vKvdxIInqwjcrMHdeIk4e1kiHq6u41EdK9U8AuM2KlTdWAHFCSVA==
X-Received: by 2002:a5d:961a:0:b0:7e1:7e15:6471 with SMTP id ca18e2360f4ac-7eaf5d698c8mr34483339f.1.1717021189367;
        Wed, 29 May 2024 15:19:49 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b10cf31917sm1013611173.45.2024.05.29.15.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 15:19:49 -0700 (PDT)
Message-ID: <2359b378-d664-4d63-bd64-f539ec8607ac@linuxfoundation.org>
Date: Wed, 29 May 2024 16:19:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: cachestat: Fix build warnings on ppc64
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org
References: <20240521030111.56568-1-mpe@ellerman.id.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240521030111.56568-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: nphamcs@gmail.com, linuxppc-dev@lists.ozlabs.org, hannes@cmpxchg.org, linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/20/24 21:01, Michael Ellerman wrote:
> Fix warnings like:
>    test_cachestat.c: In function ‘print_cachestat’:
>    test_cachestat.c:30:38: warning: format ‘%llu’ expects argument of
>    type ‘long long unsigned int’, but argument 2 has type ‘__u64’ {aka
>    ‘long unsigned int’} [-Wformat=]
> 
> By switching to unsigned long long for u64 for ppc64 builds.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   tools/testing/selftests/cachestat/test_cachestat.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/cachestat/test_cachestat.c b/tools/testing/selftests/cachestat/test_cachestat.c
> index b171fd53b004..632ab44737ec 100644
> --- a/tools/testing/selftests/cachestat/test_cachestat.c
> +++ b/tools/testing/selftests/cachestat/test_cachestat.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   #define _GNU_SOURCE
> +#define __SANE_USERSPACE_TYPES__ // Use ll64
>   
>   #include <stdio.h>
>   #include <stdbool.h>

Applied to linux-kselftest fixes for the next rc.

Michael, If you want to take this through, let me know, I can drop this.

thanks,
-- Shuah
