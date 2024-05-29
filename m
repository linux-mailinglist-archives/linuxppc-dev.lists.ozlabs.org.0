Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 357888D4168
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 00:31:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=BQGDoC1P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqP4z5zRdz87pK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 08:22:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=BQGDoC1P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqP2v6QWXz7BKw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 08:20:23 +1000 (AEST)
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7ea34e637a6so1120039f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 15:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717021221; x=1717626021; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqIyzvTkeA6zlhgHopIt1eourCo8hQ0gEK3kB/MiNgM=;
        b=BQGDoC1PlXIVA9alHzVlopSnx5dxwmyfCi2LdKt/ncaOhkXUUXqoJEgfZJSBO+VbNw
         wFeZzc4HlVJAaIQWpOX0lK2UX3JdycZnShVpztwXSz1Mjd5SK+KKG+JrRM4pbs0Ugovj
         RJvHoQovM6SGkUBnP2cvd+9Zu5t2oHZ5qy7AU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717021221; x=1717626021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqIyzvTkeA6zlhgHopIt1eourCo8hQ0gEK3kB/MiNgM=;
        b=Popn+ze9Gg1D4FI7rTZYhj+hn1Ycm+FWtiLZYMjuJ6SJyezNdiv4AqzaQ++h/GTXhq
         tmUS4aAd9e9Kv4ArB1Q78UmRJ/5hAwWXxtKwkpG5ko99LfB/Q1wYd+rnVVeZAquFk7T8
         WSR5/b3S0CwhLBGJX7zhvY569JhNsExJAZDVlz7a8Zu4d9yxNHMBfjWJXSNpq2lZnxza
         va9QefQqnFQzk4OKdM5w+ZxxzlYvwP0beL+lFeM0lHQIrPUo+01YIdHOLS6nPJtJ3Qk3
         /aXbx6m6IwqThG7c9cG/UOWPSlFRVk3xgu9WcOk+6NUmI6ujTHLZ7ffytxtLvql0xfrI
         HsaA==
X-Forwarded-Encrypted: i=1; AJvYcCU1Nqn9tYUH1FMCvKL/4MrywVFk4vW8i9khPYbMI9WpgTgooZMDh35CBmhD9sOEv0OA7FVJ3WMAfP8dJK3LcAFMA0p6DaYTA3vGAnfKeA==
X-Gm-Message-State: AOJu0YwPd2HX3hozoFTZU2k/vshtCFJ0ik5rCG2ynTkGy9vbhGCkFiVc
	xwXltgzIs1dcPnXef7xUjdSIggEZtn+LCLoI1x9TZqeswlS30QFDvCei6ATT0T4=
X-Google-Smtp-Source: AGHT+IGN1oWI90wrMEiMI6sGuVOqtYT1CiAEw2A2euoSlGnG87X1DOMKyfYSgfTF8XB61Cyt02Mi1g==
X-Received: by 2002:a05:6602:8:b0:7de:e04b:42c3 with SMTP id ca18e2360f4ac-7eaf5b6efddmr43687839f.0.1717021221086;
        Wed, 29 May 2024 15:20:21 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b0bd61001fsm2138635173.125.2024.05.29.15.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 15:20:20 -0700 (PDT)
Message-ID: <c2eec7d1-27c3-4089-beea-168d19062aaf@linuxfoundation.org>
Date: Wed, 29 May 2024 16:20:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/openat2: Fix build warnings on ppc64
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org
References: <20240521030325.58095-1-mpe@ellerman.id.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240521030325.58095-1-mpe@ellerman.id.au>
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
Cc: shuah <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/20/24 21:03, Michael Ellerman wrote:
> Fix warnings like:
> 
>    openat2_test.c: In function ‘test_openat2_flags’:
>    openat2_test.c:303:73: warning: format ‘%llX’ expects argument of type
>    ‘long long unsigned int’, but argument 5 has type ‘__u64’ {aka ‘long
>    unsigned int’} [-Wformat=]
> 
> By switching to unsigned long long for u64 for ppc64 builds.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   tools/testing/selftests/openat2/openat2_test.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/openat2/openat2_test.c b/tools/testing/selftests/openat2/openat2_test.c
> index 9024754530b2..5790ab446527 100644
> --- a/tools/testing/selftests/openat2/openat2_test.c
> +++ b/tools/testing/selftests/openat2/openat2_test.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #define _GNU_SOURCE
> +#define __SANE_USERSPACE_TYPES__ // Use ll64
>   #include <fcntl.h>
>   #include <sched.h>
>   #include <sys/stat.h>

Applied to linux-kselftest fixes for the next rc.

Michael, If you want to take this through, let me know, I can drop this.

thanks,
-- Shuah
