Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5635E4B1095
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 15:40:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvfYN0MGWz3bbH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 01:40:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=WMk422H5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::12d;
 helo=mail-il1-x12d.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=WMk422H5; 
 dkim-atps=neutral
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvfXk3LHhz3bV6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 01:39:48 +1100 (AEDT)
Received: by mail-il1-x12d.google.com with SMTP id i10so4495409ilm.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 06:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iDsPUC9DgyeG7Uucn2JKUAeTRzoT+yJt+cSDVQmW8p8=;
 b=WMk422H52Ffqw8t01qYFjj1uzXht4P7spwzhMz1JARc5qgbQYyxf8oLIts34y85Qho
 3sHj0TkPXQjH0kpDGmAV5/q70YmZ26tEJQxfEvDAWys7c9uxM7uVo1N/X27uDubo3baO
 kb5OIQM8EcvuertJj0MYbCRcD7p4RT2Uo1gDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iDsPUC9DgyeG7Uucn2JKUAeTRzoT+yJt+cSDVQmW8p8=;
 b=ku8jGlZxB9LEmTmHq/RnXii2103+w6H5hG5npFF3cyG/my6via/hfgzkNaxAiECzBR
 DYZ4e8PHcT3ovh6DRPdIvxlheiOgjg3un2PSQItcw2rBIxmCPbvF3nYn7/nFghxZdYuY
 u/7HdSoEEfUMKKDVcE0EnwW1CagsGnroeSfy0nmQBE+liYtQXYbr4eNVqZ0/jOml/8Pi
 hIn9JavNNEtTmkdhqARz3vnu38lqAdW22hwmSq1m6L9ybHhM+3Amrqcc3X4M1iec7f+J
 4A7ibhSigrOy3xjTtJOWX5HMf+h6I+xX3TpZIqcoXk7fHMrnoCSvf1MY+scfrhXdEWg/
 2CdA==
X-Gm-Message-State: AOAM53180Qj3EoYiMJzfb9pMu7eo0SyuyOLYcyRbj6U0jo0K8iMN3Vs+
 nrqkQ2OnqUR6WMbkvis1Ifyp9g==
X-Google-Smtp-Source: ABdhPJyuOKzL/10L9HIjJuQx1QoFStwifNXwHB3cGWaLhTqHMDEZDQGzid2+gDAG/I5Psy2xQ05RzA==
X-Received: by 2002:a92:ca0f:: with SMTP id j15mr4199603ils.212.1644503985180; 
 Thu, 10 Feb 2022 06:39:45 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
 by smtp.gmail.com with ESMTPSA id c13sm1188138ilq.50.2022.02.10.06.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 06:39:44 -0800 (PST)
Subject: Re: [PATCH] selftest/vm: Use correct PAGE_SHIFT value for ppc64
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20220209154301.42024-1-aneesh.kumar@linux.ibm.com>
 <84508bb4-9400-f429-e6d2-d8b05a1e8368@linuxfoundation.org>
 <87zgmz9x7e.fsf@linux.ibm.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <eed2c443-21b0-3c0e-6571-551460fdf303@linuxfoundation.org>
Date: Thu, 10 Feb 2022 07:39:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87zgmz9x7e.fsf@linux.ibm.com>
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

On 2/9/22 9:12 PM, Aneesh Kumar K.V wrote:
> Shuah Khan <skhan@linuxfoundation.org> writes:
> 
>> On 2/9/22 8:43 AM, Aneesh Kumar K.V wrote:
>>> Keep it simple by using a #define and limiting hugepage size to 2M.
>>> This keeps the test simpler instead of dynamically finding the page size
>>> and huge page size.
>>>
>>> Without this tests are broken w.r.t reading /proc/self/pagemap
>>>
>>> 	if (pread(pagemap_fd, ent, sizeof(ent),
>>> 			(uintptr_t)ptr >> (PAGE_SHIFT - 3)) != sizeof(ent))
>>> 		err(2, "read pagemap");
>>>
>>> Cc: Shuah Khan <shuah@kernel.org>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>    tools/testing/selftests/vm/ksm_tests.c        | 8 ++++++++
>>>    tools/testing/selftests/vm/transhuge-stress.c | 8 ++++++++
>>>    2 files changed, 16 insertions(+)
>>>
>>> diff --git a/tools/testing/selftests/vm/ksm_tests.c b/tools/testing/selftests/vm/ksm_tests.c
>>> index 1436e1a9a3d3..8200328ff018 100644
>>> --- a/tools/testing/selftests/vm/ksm_tests.c
>>> +++ b/tools/testing/selftests/vm/ksm_tests.c
>>> @@ -22,8 +22,16 @@
>>>    #define KSM_MERGE_ACROSS_NODES_DEFAULT true
>>>    #define MB (1ul << 20)
>>>    
>>> +#ifdef __powerpc64__
>>> +#define PAGE_SHIFT	16
>>> +/*
>>> + * This will only work with radix 2M hugepage size
>>> + */
>>> +#define HPAGE_SHIFT 21
>>> +#else
>>>    #define PAGE_SHIFT 12
>>>    #define HPAGE_SHIFT 21
>>> +#endif
>>>    
>>>    #define PAGE_SIZE (1 << PAGE_SHIFT)
>>>    #define HPAGE_SIZE (1 << HPAGE_SHIFT)
>>> diff --git a/tools/testing/selftests/vm/transhuge-stress.c b/tools/testing/selftests/vm/transhuge-stress.c
>>> index 5e4c036f6ad3..f04c8aa4bcf6 100644
>>> --- a/tools/testing/selftests/vm/transhuge-stress.c
>>> +++ b/tools/testing/selftests/vm/transhuge-stress.c
>>> @@ -16,8 +16,16 @@
>>>    #include <string.h>
>>>    #include <sys/mman.h>
>>>    
>>> +#ifdef __powerpc64__
>>> +#define PAGE_SHIFT	16
>>> +/*
>>> + * This will only work with radix 2M hugepage size
>>> + */
>>> +#define HPAGE_SHIFT 21
>>
>> Why not have this is in common code?
> 
> Can you suggest where I can move that. We also have helper functions
> like allocate_transhuge() duplicated between tests. I didn't find
> libutil.a or anything similar supported by the selftets build.
> 
>>

I noticed that HPAGE_SHIFT is defined in #ifdef __powerpc64__ block
as well as #else. I am asking is it necessary to be part of both
blocks.

+#ifdef __powerpc64__
+#define PAGE_SHIFT	16
+/*
+ * This will only work with radix 2M hugepage size
+ */
+#define HPAGE_SHIFT 21  --- this one
+#else
   #define PAGE_SHIFT 12
   #define HPAGE_SHIFT 21   --- this one
+#endif


Hope this helps.

thanks,
-- Shuah
