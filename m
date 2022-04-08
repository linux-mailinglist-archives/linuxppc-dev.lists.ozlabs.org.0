Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 412CC4F9CB7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 20:31:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZmzH10F7z3bdP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 04:31:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=YpRUx5na;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d2c;
 helo=mail-io1-xd2c.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=YpRUx5na; 
 dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZmyb29MBz2ync
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 04:30:29 +1000 (AEST)
Received: by mail-io1-xd2c.google.com with SMTP id z7so11678652iom.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Apr 2022 11:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8c4w2SqV3Zwtk6hjN9XQDs1ojn8rP0mcUHvQvhzuNaU=;
 b=YpRUx5naQgJOrPJtNsmh78aDsmIIkswFS8lXDrNYheqXIeJEK2ARoLdZkPcn+nfw5T
 oYiFN+5ZvBke8G2w+I4t1ThEG9QAMUoMMfn3SprosOFXtLJQ9uLglI+1t3LYKARK0RE9
 fZFK0+HB8gFFQwUCeNj0/qHoPWD0MoYjgz6Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8c4w2SqV3Zwtk6hjN9XQDs1ojn8rP0mcUHvQvhzuNaU=;
 b=Ny5Whdvdb1jQYWMycjCx6iazmvTK38Ev4Ffw/fMYQoC+4b1eBeiRvrpT+JvBycw9C0
 Bm9D24M6YkuZ6SGW0ZFBnr28U4RJMBko+T940ssaSakYWOM8ZG/YGvcv0eoHi6m+1LHM
 eZUaEtNddbj5U5WkGrUO9AQUqUPmupovU6g0bBOt61m18HpVR9LqigKLeP4vgRcTuFkd
 rgIDVgBYYUmTWmHhuXoXChKQiIA3N4fQU6KmHkapXt3rN3FOvoLbzRqREckYlOGqVr++
 wGPxsnjOSnuP60BoIsndpvFFYl9bYUpKFzm8U8ZTFBhDRAlWg7BnPE5YOglYQJ5JLxrt
 n6gQ==
X-Gm-Message-State: AOAM530Y9YYGPpmjGJ5ukNp5fMZALR5Z1CLxZYFe5J5xyiuoaBlnhiuY
 q7595eWDU3ZCtz6VG9CSUy5YcQ==
X-Google-Smtp-Source: ABdhPJz0knJI2EvKgFMOby7OjCoRi/HEQHXa7piPfbIdw92oEo/ocHWDiLbO7mI1s1H7DgX30ZuY4g==
X-Received: by 2002:a05:6638:2643:b0:323:c3e3:fcec with SMTP id
 n3-20020a056638264300b00323c3e3fcecmr10003722jat.289.1649442625269; 
 Fri, 08 Apr 2022 11:30:25 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a056e02174600b002c7f247b3a7sm14985188ill.54.2022.04.08.11.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 11:30:24 -0700 (PDT)
Subject: Re: [PATCH V3] testing/selftests/mqueue: Fix mq_perf_tests to free
 the allocated cpu set
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, disgoel@linux.vnet.ibm.com
References: <20220408072431.94947-1-atrajeev@linux.vnet.ibm.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <1a1d119a-e68e-a590-a518-cfb3c78ed888@linuxfoundation.org>
Date: Fri, 8 Apr 2022 12:30:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220408072431.94947-1-atrajeev@linux.vnet.ibm.com>
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

On 4/8/22 1:24 AM, Athira Rajeev wrote:
> The selftest "mqueue/mq_perf_tests.c" use CPU_ALLOC to allocate
> CPU set. This cpu set is used further in pthread_attr_setaffinity_np
> and by pthread_create in the code. But in current code, allocated
> cpu set is not freed.
> 
> Fix this issue by adding CPU_FREE in the "shutdown" function which
> is called in most of the error/exit path for the cleanup. There are
> few error paths which exit without using shutdown. Add a common goto
> error path with CPU_FREE for these cases.
> 
> Fixes: 7820b0715b6f ("tools/selftests: add mq_perf_tests")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
>   From v2 -> v3:
>    Addressed review comment from Shuah Khan to add
>    common "goto" error path with CPU_FREE for few exit
>    cases.
>   From v1 -> v2:
>    Addressed review comment from Shuah Khan to add
>    CPU_FREE in other exit paths where it is needed
> 

Thank you. I will queue this up for Linux 5.18-rc3

thanks,
-- Shuah
