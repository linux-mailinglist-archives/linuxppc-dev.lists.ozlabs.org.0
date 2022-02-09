Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1073F4AFDC2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 20:54:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jv9ZL5B7pz3cNV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 06:54:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=XZYtYNQG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d31;
 helo=mail-io1-xd31.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=XZYtYNQG; 
 dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jv9Yf1GWDz3bPD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 06:53:58 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id p63so4601981iod.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Feb 2022 11:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O5WO0GhtENZ4Ge8Y89ntw8iLo0frKjtIwBpplGmqm1U=;
 b=XZYtYNQGwFDSiwdvHmn4Qx/2WbSo9LHWZVuwD5qVV9+PHAuX3IZXPRPUVPc2w8kJT3
 U6gJgjZzQGczCe8z1lUvFxDAjt3Pq12x+Y3i/gJwKN+I7Bs0gEy5N0si9NQY+1/dw3ox
 tM9LNoffy8hb3RQucX48qU+U/6KmTUrhfaLRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O5WO0GhtENZ4Ge8Y89ntw8iLo0frKjtIwBpplGmqm1U=;
 b=4teUBP5O4blnWZ/vfV0rvs4t2rpgTJQDSP2b6tzK+Dzx2ZQdzD2oW8n7tx9vboUYjc
 SR0PEx0OVbzCpEorx7mezlF1A2wKLX4ErL5fhTSrKM+zYC4gg+gqXMjFCM7D9VsPC1db
 Tn5wuMap/TZUt6006h847Qs/tmL6rK9Yg7mIbadMHVIyv/zHuPjvZiDWSlYPUXbnvsl6
 HHpknQ6Cw48sNhlsQPRl1o9tOH+aMaeAHpjcInPVtdTHLbz7zL0DwaBd2zIo/NmxLsbq
 lxiG8MUoVxxNVEtqCACzHM0QqDg3xNJYb9d0VXtjEgpjg/8mMTOazbpN0ErbGERZZ449
 9Ikg==
X-Gm-Message-State: AOAM530CvIQyHnsHtJ/Ig/ZrOSjbSkycATEpCFM7cgvoqaTT0sUvSkw8
 x6TFXAeuQU7o+oUdVYiMZTEyHg==
X-Google-Smtp-Source: ABdhPJz2+2fc0dL1ssZvgLiP/Y/63ErBrkUzup+hUR8RVfVHDk3lc5Se0BXrHIu6wtd4Pi3h+F3qkg==
X-Received: by 2002:a5d:9e12:: with SMTP id h18mr1900891ioh.67.1644436435015; 
 Wed, 09 Feb 2022 11:53:55 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
 by smtp.gmail.com with ESMTPSA id b24sm10234383ioc.24.2022.02.09.11.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 11:53:54 -0800 (PST)
Subject: Re: [PATCH] selftest/vm: Use correct PAGE_SHIFT value for ppc64
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20220209154301.42024-1-aneesh.kumar@linux.ibm.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <84508bb4-9400-f429-e6d2-d8b05a1e8368@linuxfoundation.org>
Date: Wed, 9 Feb 2022 12:53:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220209154301.42024-1-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/9/22 8:43 AM, Aneesh Kumar K.V wrote:
> Keep it simple by using a #define and limiting hugepage size to 2M.
> This keeps the test simpler instead of dynamically finding the page size
> and huge page size.
> 
> Without this tests are broken w.r.t reading /proc/self/pagemap
> 
> 	if (pread(pagemap_fd, ent, sizeof(ent),
> 			(uintptr_t)ptr >> (PAGE_SHIFT - 3)) != sizeof(ent))
> 		err(2, "read pagemap");
> 
> Cc: Shuah Khan <shuah@kernel.org>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   tools/testing/selftests/vm/ksm_tests.c        | 8 ++++++++
>   tools/testing/selftests/vm/transhuge-stress.c | 8 ++++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/tools/testing/selftests/vm/ksm_tests.c b/tools/testing/selftests/vm/ksm_tests.c
> index 1436e1a9a3d3..8200328ff018 100644
> --- a/tools/testing/selftests/vm/ksm_tests.c
> +++ b/tools/testing/selftests/vm/ksm_tests.c
> @@ -22,8 +22,16 @@
>   #define KSM_MERGE_ACROSS_NODES_DEFAULT true
>   #define MB (1ul << 20)
>   
> +#ifdef __powerpc64__
> +#define PAGE_SHIFT	16
> +/*
> + * This will only work with radix 2M hugepage size
> + */
> +#define HPAGE_SHIFT 21
> +#else
>   #define PAGE_SHIFT 12
>   #define HPAGE_SHIFT 21
> +#endif
>   
>   #define PAGE_SIZE (1 << PAGE_SHIFT)
>   #define HPAGE_SIZE (1 << HPAGE_SHIFT)
> diff --git a/tools/testing/selftests/vm/transhuge-stress.c b/tools/testing/selftests/vm/transhuge-stress.c
> index 5e4c036f6ad3..f04c8aa4bcf6 100644
> --- a/tools/testing/selftests/vm/transhuge-stress.c
> +++ b/tools/testing/selftests/vm/transhuge-stress.c
> @@ -16,8 +16,16 @@
>   #include <string.h>
>   #include <sys/mman.h>
>   
> +#ifdef __powerpc64__
> +#define PAGE_SHIFT	16
> +/*
> + * This will only work with radix 2M hugepage size
> + */
> +#define HPAGE_SHIFT 21

Why not have this is in common code?

> +#else
>   #define PAGE_SHIFT 12
>   #define HPAGE_SHIFT 21

Same here.

> +#endif
>   
>   #define PAGE_SIZE (1 << PAGE_SHIFT)
>   #define HPAGE_SIZE (1 << HPAGE_SHIFT)
> 

Please cc linux-kselftest mailing list in the future.

With the above fixed.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

