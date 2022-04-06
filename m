Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 381294F6AD7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 22:06:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYbBF1Jf6z3bYJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 06:06:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=cR+5rsgY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d2d;
 helo=mail-io1-xd2d.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=cR+5rsgY; 
 dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYb9X5DRBz2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 06:05:50 +1000 (AEST)
Received: by mail-io1-xd2d.google.com with SMTP id p21so4360016ioj.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Apr 2022 13:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vCgsdofueDzmclBeFxqo6aKHtjsWdXLi6JiPYoFCmoc=;
 b=cR+5rsgYLkhZXAAFxLpza6qfB2xOzcJNUAIYelWplokZAKThWScNamgWLpMmkHBhgA
 R1+F1qKd7EG/GEu8cxmj1P80ibmXO1V5w96lKod+E60ujDAa/xCZ0xLxp4Nsp/y1+zNj
 pGI4QVenIIYqNlvjtSBl1t5pMtIx0NmwB3jyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vCgsdofueDzmclBeFxqo6aKHtjsWdXLi6JiPYoFCmoc=;
 b=BLaC36Vtyk/zLfe4CrQCKYKvXa15Zv+u+AFPvtWI6uYQvnvXQH0GeUD/OJeCeGcaxV
 vgRLET5kqaUyHJ++oHm1He1ercVZyzhbnd+AbBH6EOUAz1RE6ELZej69mKi2il4wCcRs
 TfrK4WMd/rJHYhHXKK+++90GOoKJOZzltiI7HV8IJHzkMYoDrI676YUlNTHvUxlTMuJT
 Oow+KbiXwCKbObQwb+z2owpht07WYDfsf4uHpTVTM8yVyz8YHpLevD9DC1AzTYLHlf09
 zH4Qo/ppwzo01zQs/taMN4DMuBl1eI05WfhndqcAUSLL4Ge84OMVlPqgFjwXQcyErph8
 4uPA==
X-Gm-Message-State: AOAM530u5Lye9cK6cD4YAQ9Th8T34R0vcr/xABm5v69pBdC5PWq1+phI
 SA4raQFkrHrHCoIEWkPFhgyQ5Q==
X-Google-Smtp-Source: ABdhPJwZyiBF+1MJR1ViEYkDA/OLIZOqcFI6CqmqutLKLEchEzixjki5nX6+7D+OjxHw9lBwnsyheA==
X-Received: by 2002:a05:6638:41a0:b0:323:d771:8146 with SMTP id
 az32-20020a05663841a000b00323d7718146mr5494354jab.193.1649275547223; 
 Wed, 06 Apr 2022 13:05:47 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a056602184e00b00649673c175asm11534641ioi.25.2022.04.06.13.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 13:05:46 -0700 (PDT)
Subject: Re: [PATCH] testing/selftests/mqueue: Fix mq_perf_tests to free the
 allocated cpu set
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, disgoel@linux.vnet.ibm.com
References: <20220406175715.87937-1-atrajeev@linux.vnet.ibm.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ad0648a9-0252-2d1f-cc48-7e14846fc0af@linuxfoundation.org>
Date: Wed, 6 Apr 2022 14:05:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220406175715.87937-1-atrajeev@linux.vnet.ibm.com>
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
Cc: maddy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/6/22 11:57 AM, Athira Rajeev wrote:
> The selftest "mqueue/mq_perf_tests.c" use CPU_ALLOC to allocate
> CPU set. This cpu set is used further in pthread_attr_setaffinity_np
> and by pthread_create in the code. But in current code, allocated
> cpu set is not freed. Fix this by adding CPU_FREE after its usage
> is done.
> 

Good find.

> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>   tools/testing/selftests/mqueue/mq_perf_tests.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/mqueue/mq_perf_tests.c b/tools/testing/selftests/mqueue/mq_perf_tests.c
> index b019e0b8221c..17c41f216bef 100644
> --- a/tools/testing/selftests/mqueue/mq_perf_tests.c
> +++ b/tools/testing/selftests/mqueue/mq_perf_tests.c
> @@ -732,6 +732,7 @@ int main(int argc, char *argv[])
>   		pthread_attr_destroy(&thread_attr);
>   	}
>   
> +	CPU_FREE(cpu_set);
>   	if (!continuous_mode) {
>   		pthread_join(cpu_threads[0], &retval);
>   		shutdown((long)retval, "perf_test_thread()", __LINE__);
> 

CPU_ALLOC() is called very early on in main() and there are a
few error paths that exit without calling CPU_FREE. This change
doesn't fully fix the problem.

Review the other exit paths where CPU_FREE is needed.

thanks,
-- Shuah
