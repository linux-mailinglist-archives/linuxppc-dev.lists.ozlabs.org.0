Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C8D4B1156
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 16:09:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvgBn1xdgz3bYh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 02:09:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=eWMjiv3D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d2a;
 helo=mail-io1-xd2a.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=eWMjiv3D; 
 dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvgB83B4fz3bV2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 02:08:46 +1100 (AEDT)
Received: by mail-io1-xd2a.google.com with SMTP id i62so7676606ioa.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 07:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hp7QvZlzzROYEH5efuLIQi3BV5UCPx6fV4t5giE2B0o=;
 b=eWMjiv3DIgoG+N319e9OUDVFWv3MK5uB+VgCQTlN12e4mXc7WeyBQcF06s568P/rQA
 8uw/HPq2j3DMLGqxHhvR5dALW4Ralubr6nG0CgpSSJFFdsP26xkYzc8qJn6DXXISwztz
 b4zAguaGaFg1RQXJMmCzyBQIzYb9jhjOKV6js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hp7QvZlzzROYEH5efuLIQi3BV5UCPx6fV4t5giE2B0o=;
 b=CgLLFuAXBQMRvbqraNapaCSpIHyJM+r1c7xAcYG+SN9QQXe120AgRYTIs8jn0Lv6K4
 SHEGLzQ2YC9yCnbWzvb59F/opYtxap3d2UFQWHeQvMiSy07rNAJvuZ6q4l1sUl6490On
 paqWptWVgQ+JxCK5DAgNdbrtqfoQwEFJqzmITEnXGQPFdwgxjfd+05wvgcOECzl3q2tS
 9CXMirFX9YQrrTuS5RxqOppVafIi7ofaY+Wr5Ky2wOFGmRQKxmso8mohyMQSi8ZY+pY+
 1v590V/+DuLQBQz1Yq1TOcgOAHq+xWM34/C2b4vgR6FDdhOyIRG8UUsDZdt6xGklKOzQ
 C4FQ==
X-Gm-Message-State: AOAM531yBUyDnOfdOYFpj86EO6e4PGWszNEqb13LBkfdxz4UrbkEsaDa
 1AfW8WGBWHlNVmWqpl6zbr8D+w==
X-Google-Smtp-Source: ABdhPJwYK2ZTmK1mhm9ma5UmVH97aL8K2bUMDn8CEL5pw4CYaefr1l1mSN35amtlhqC5HZ+cT5n2ng==
X-Received: by 2002:a05:6602:492:: with SMTP id
 y18mr3922007iov.95.1644505723189; 
 Thu, 10 Feb 2022 07:08:43 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
 by smtp.gmail.com with ESMTPSA id v4sm8269910ilc.21.2022.02.10.07.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 07:08:42 -0800 (PST)
Subject: Re: [PATCH] selftest/vm: Use correct PAGE_SHIFT value for ppc64
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20220209154301.42024-1-aneesh.kumar@linux.ibm.com>
 <84508bb4-9400-f429-e6d2-d8b05a1e8368@linuxfoundation.org>
 <87zgmz9x7e.fsf@linux.ibm.com>
 <eed2c443-21b0-3c0e-6571-551460fdf303@linuxfoundation.org>
 <d2c3d33a-9e4b-1efc-b956-66bbf9a6bac5@linux.ibm.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f6e8a74f-1c20-16da-2872-704df0bd4af1@linuxfoundation.org>
Date: Thu, 10 Feb 2022 08:08:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d2c3d33a-9e4b-1efc-b956-66bbf9a6bac5@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/10/22 8:03 AM, Aneesh Kumar K V wrote:
> On 2/10/22 20:09, Shuah Khan wrote:
>> On 2/9/22 9:12 PM, Aneesh Kumar K.V wrote:
>>> Shuah Khan <skhan@linuxfoundation.org> writes:
>>>
>>>> On 2/9/22 8:43 AM, Aneesh Kumar K.V wrote:
>>>>> Keep it simple by using a #define and limiting hugepage size to 2M.
>>>>> This keeps the test simpler instead of dynamically finding the page size
>>>>> and huge page size.
>>>>>
>>>>> Without this tests are broken w.r.t reading /proc/self/pagemap
>>>>>
>>>>>     if (pread(pagemap_fd, ent, sizeof(ent),
>>>>>             (uintptr_t)ptr >> (PAGE_SHIFT - 3)) != sizeof(ent))
>>>>>         err(2, "read pagemap");
>>>>>
>>>>> Cc: Shuah Khan <shuah@kernel.org>
>>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>>> ---
>>>>>    tools/testing/selftests/vm/ksm_tests.c        | 8 ++++++++
>>>>>    tools/testing/selftests/vm/transhuge-stress.c | 8 ++++++++
>>>>>    2 files changed, 16 insertions(+)
>>>>>
>>>>> diff --git a/tools/testing/selftests/vm/ksm_tests.c b/tools/testing/selftests/vm/ksm_tests.c
>>>>> index 1436e1a9a3d3..8200328ff018 100644
>>>>> --- a/tools/testing/selftests/vm/ksm_tests.c
>>>>> +++ b/tools/testing/selftests/vm/ksm_tests.c
>>>>> @@ -22,8 +22,16 @@
>>>>>    #define KSM_MERGE_ACROSS_NODES_DEFAULT true
>>>>>    #define MB (1ul << 20)
>>>>> +#ifdef __powerpc64__
>>>>> +#define PAGE_SHIFT    16
>>>>> +/*
>>>>> + * This will only work with radix 2M hugepage size
>>>>> + */
>>>>> +#define HPAGE_SHIFT 21
>>>>> +#else
>>>>>    #define PAGE_SHIFT 12
>>>>>    #define HPAGE_SHIFT 21
>>>>> +#endif
>>>>>    #define PAGE_SIZE (1 << PAGE_SHIFT)
>>>>>    #define HPAGE_SIZE (1 << HPAGE_SHIFT)
>>>>> diff --git a/tools/testing/selftests/vm/transhuge-stress.c b/tools/testing/selftests/vm/transhuge-stress.c
>>>>> index 5e4c036f6ad3..f04c8aa4bcf6 100644
>>>>> --- a/tools/testing/selftests/vm/transhuge-stress.c
>>>>> +++ b/tools/testing/selftests/vm/transhuge-stress.c
>>>>> @@ -16,8 +16,16 @@
>>>>>    #include <string.h>
>>>>>    #include <sys/mman.h>
>>>>> +#ifdef __powerpc64__
>>>>> +#define PAGE_SHIFT    16
>>>>> +/*
>>>>> + * This will only work with radix 2M hugepage size
>>>>> + */
>>>>> +#define HPAGE_SHIFT 21
>>>>
>>>> Why not have this is in common code?
>>>
>>> Can you suggest where I can move that. We also have helper functions
>>> like allocate_transhuge() duplicated between tests. I didn't find
>>> libutil.a or anything similar supported by the selftets build.
>>>
>>>>
>>
>> I noticed that HPAGE_SHIFT is defined in #ifdef __powerpc64__ block
>> as well as #else. I am asking is it necessary to be part of both
>> blocks.
>>
>> +#ifdef __powerpc64__
>> +#define PAGE_SHIFT    16
>> +/*
>> + * This will only work with radix 2M hugepage size
>> + */
>> +#define HPAGE_SHIFT 21  --- this one
>> +#else
>>    #define PAGE_SHIFT 12
>>    #define HPAGE_SHIFT 21   --- this one
>> +#endif
>>
> 
> 
> The reason I did that was to add the comment which is relevant only for ppc64. ppc64 supports two hugepage sizes, 2M and 16M. The test won't work correctly with 16M hugepage size. We do have other tests in selftest/vm/ with similar restrictions.
> 
> 

Right. You don't have to duplicate code for the comment. You can add the
comment and then clarify in the comment that it is only relevant to ppc64.

This way the comment is clear and we can avoid duplicate code that makes it
hard to maintain in the future.

thanks,
-- Shuah

