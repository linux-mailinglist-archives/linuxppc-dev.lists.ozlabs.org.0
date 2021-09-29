Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED6E41BBA6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 02:15:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJxjK0Gk0z306h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 10:15:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MsMlAeMD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MsMlAeMD; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJxhh2ndrz2yP3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 10:14:58 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id j13so708176qtq.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 17:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NehGJkwuAH5cn6ZVvhJBy23NkjQ5FXtijCmNKg2ytok=;
 b=MsMlAeMDhyELVoGT7sx8CXNAWUcIGKigKj2Rgro6taKYrAnfCQSM4mxlSo+ZJXl/pw
 aHe8+w1jvzDYzrDn0UwpqI4xhQ3pnqrd3OXBcRtJ9rjkWioJXiG2io63PIKIoMwGJIJ5
 xUMxIivY9fiznlqLaXLK8ZUENzNCj6W7T18LX5B+AhgDT3FzyueuO7SSHSAsOa9+C4Im
 nOW3Ca08DvYiIcxlb0jubjrdLAAHJx/zLitnDinsnUNryK8hialYOU8EMLDmdOi6JLRK
 VUGPqNHYrg5kgKdvDTKXMBIWBHrBer76I+Y5jgy1u9bxmVc2PKu69hDYTNd3no2CvMK9
 KIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NehGJkwuAH5cn6ZVvhJBy23NkjQ5FXtijCmNKg2ytok=;
 b=xmeC5f2a61dG6HILpuXqFptylZeRk9MbYm3GKSneu3kMt3MyVLFOWbbQKntW+FbkZZ
 raLbTILKAu/vqC0CC4aHDme8god+hvRHwUNNz0jgaYfKyUMVelhImUkz/CZMVJX5h6EO
 3fcMEUyF3SafufVpF/NMzrK2UzNZSBBbPwyMS5LGXotgHFzNa1AMQTr0qpvtpGakGLwo
 nhRPCAqaCt3BoRVM+8957kx/Bm4XZOLQhII9AS3buePqUioWEwdk60rE+Oge8mpYhIOB
 YClY1wUna/DTfZjfSPWSGmXQK1CDRvnExXqirXBCrdOPyAzhYeMq8Vz9uSxZvya+1BZo
 2lZw==
X-Gm-Message-State: AOAM533JlXLb6qafxQA9+j6iviQfrdUZDZyoMRD5BHHj1CP3gC+yN0x3
 AOCJQmv1jK9svW4QsnxbZuk=
X-Google-Smtp-Source: ABdhPJyb6ovx8PQjLWzfavnyLmRMGoe4RWhuLLT85PmLNmyCIFAP0yzuepySYACtrTHYQRobKIKKNA==
X-Received: by 2002:ac8:7746:: with SMTP id g6mr8761481qtu.416.1632874494970; 
 Tue, 28 Sep 2021 17:14:54 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.40.88])
 by smtp.gmail.com with ESMTPSA id v8sm565451qta.21.2021.09.28.17.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 17:14:54 -0700 (PDT)
Message-ID: <4479e869-1c98-4473-262c-3aeb37b8fca2@gmail.com>
Date: Tue, 28 Sep 2021 21:14:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 4/4] powerpc/pseries/cpuhp: remove obsolete comment
 from pseries_cpu_die
Content-Language: en-US
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210927201933.76786-1-nathanl@linux.ibm.com>
 <20210927201933.76786-5-nathanl@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20210927201933.76786-5-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/27/21 17:19, Nathan Lynch wrote:
> This comment likely refers to the obsolete DLPAR workflow where some
> resource state transitions were driven more directly from user space
> utilities, but it also seems to contradict itself: "Change isolate state to
> Isolate [...]" is at odds with the preceding sentences, and it does not
> relate at all to the code that follows.


This comment was added by commit 413f7c405a34, a 2006 commit where Mike
Ellerman moved code from platform/pseries/smp.c into hotplug-cpu.c.

I checked the original code back in smp.c and this comment was added there
by commit 1da177e4c3f41, which is Linus's initial git commit, where he mentions
that he didn't bothered with full history (although it is available somewhere,
allegedly).

This is enough to say that we can't easily see the history behind this comment.
I also believe that we're better of without it since it doesn't make sense
with the current codebase.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> 
> Remove it to prevent confusion.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>   arch/powerpc/platforms/pseries/hotplug-cpu.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index b50f3e9aa259..5ab44600c8d3 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -137,11 +137,6 @@ static void pseries_cpu_die(unsigned int cpu)
>   			cpu, pcpu);
>   	}
>   
> -	/* Isolation and deallocation are definitely done by
> -	 * drslot_chrp_cpu.  If they were not they would be
> -	 * done here.  Change isolate state to Isolate and
> -	 * change allocation-state to Unusable.
> -	 */
>   	paca_ptrs[cpu]->cpu_start = 0;
>   }
>   
> 
