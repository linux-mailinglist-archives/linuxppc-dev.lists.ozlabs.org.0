Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC6D4F879C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 21:01:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZ9j92ccGz3bVN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 05:01:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=bJx6W9C9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d2c;
 helo=mail-io1-xd2c.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=bJx6W9C9; 
 dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZ9hT1FsCz2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 05:01:11 +1000 (AEST)
Received: by mail-io1-xd2c.google.com with SMTP id b16so7993100ioz.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 12:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=keVkYj4cWaI4gay87MdL0AahO7PaN4KeF2eJUm3V5FQ=;
 b=bJx6W9C91GXHZT9WZmR5uDci7uh5rihNKWqmcZX88RTvcFDWcennu7TEZgFHORE0o5
 Sih/OiecaC+yPBT1oUXlgYv4Thkp3gG2s1+O1pF9KogW+eHi2GYSo6vwUN0wYrwPG3Ls
 d0JJ9Qy1LuKY4eLK/uh5sCTBRurXSZkClGXzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=keVkYj4cWaI4gay87MdL0AahO7PaN4KeF2eJUm3V5FQ=;
 b=qWI5XjpNOQT/aFQ/8bxfu8l9j33SRwvxTtfhyG/fMUSqCbzrwHFMGW+CCowDHgwpCj
 t7YG2gwgGYy9U+Fcve48klOlNyrzLxpfhMUt/8hT1pey5VxJkLTRtIMp3FOcGBywnVj4
 9PdmPS2KfNp3FJvfqY7yfxrdu1pYwMOWJ+e/0cK+d2ZgYDe+GM7MLzWX1XZgocBW46gO
 nQ4Khiqu7UkSFyuZsJDnC1Wn+Pzl4kn6MaBknA7GhkoT3oYpV6WtyDZHvqb292hCo6Uj
 Gc7Ip6fadtBbhTtbZxsP7ISoe7e/IRiJd+VPprWIIRE7V3Qm3S+wHiGkjO8w2Ymb67AN
 G1Ag==
X-Gm-Message-State: AOAM533p8DHArER9xqt7VhpSNl+KRzoJDlF9U7cVmerACPne46T5zKhn
 uBLLjL65f+B/lMeBoRUtEctcZQ==
X-Google-Smtp-Source: ABdhPJxGOZ2BJ+RHSzRcbdkCNemhvmf9CaBqWrCb2/N1joKqeDq2ON7aDkwhDmdeCC+ElIarNR2UwQ==
X-Received: by 2002:a05:6638:d87:b0:323:c006:3650 with SMTP id
 l7-20020a0566380d8700b00323c0063650mr7872341jaj.64.1649358065787; 
 Thu, 07 Apr 2022 12:01:05 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a6bf705000000b00649a2634725sm13146036iog.17.2022.04.07.12.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 12:01:05 -0700 (PDT)
Subject: Re: [PATCH V2] testing/selftests/mqueue: Fix mq_perf_tests to free
 the allocated cpu set
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, disgoel@linux.vnet.ibm.com
References: <20220407184008.93879-1-atrajeev@linux.vnet.ibm.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <e9c8a8c7-9a0d-09be-343d-038b7f791b98@linuxfoundation.org>
Date: Thu, 7 Apr 2022 13:01:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220407184008.93879-1-atrajeev@linux.vnet.ibm.com>
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

On 4/7/22 12:40 PM, Athira Rajeev wrote:
> The selftest "mqueue/mq_perf_tests.c" use CPU_ALLOC to allocate
> CPU set. This cpu set is used further in pthread_attr_setaffinity_np
> and by pthread_create in the code. But in current code, allocated
> cpu set is not freed.
> 
> Fix this issue by adding CPU_FREE in the "shutdown" function which
> is called in most of the error/exit path for the cleanup. Also add
> CPU_FREE in some of the error paths where shutdown is not called.
> 
> Fixes: 7820b0715b6f ("tools/selftests: add mq_perf_tests")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> Changelog:
>  From v1 -> v2:
>   Addressed review comment from Shuah Khan to add
>   CPU_FREE in other exit paths where it is needed
> 

Thank you. I have a couple of comments on making the error
paths simpler. Please see below.

>   tools/testing/selftests/mqueue/mq_perf_tests.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mqueue/mq_perf_tests.c b/tools/testing/selftests/mqueue/mq_perf_tests.c
> index b019e0b8221c..182434c7898d 100644
> --- a/tools/testing/selftests/mqueue/mq_perf_tests.c
> +++ b/tools/testing/selftests/mqueue/mq_perf_tests.c
> @@ -180,6 +180,9 @@ void shutdown(int exit_val, char *err_cause, int line_no)
>   	if (in_shutdown++)
>   		return;
>   
> +	/* Free the cpu_set allocated using CPU_ALLOC in main function */
> +	CPU_FREE(cpu_set);
> +
>   	for (i = 0; i < num_cpus_to_pin; i++)
>   		if (cpu_threads[i]) {
>   			pthread_kill(cpu_threads[i], SIGUSR1);
> @@ -589,6 +592,7 @@ int main(int argc, char *argv[])
>   						cpu_set)) {
>   					fprintf(stderr, "Any given CPU may "
>   						"only be given once.\n");
> +					CPU_FREE(cpu_set);

This could be done in a common error path handling.

>   					exit(1);
>   				} else
>   					CPU_SET_S(cpus_to_pin[cpu],
> @@ -607,6 +611,7 @@ int main(int argc, char *argv[])
>   				queue_path = malloc(strlen(option) + 2);
>   				if (!queue_path) {
>   					perror("malloc()");
> +					CPU_FREE(cpu_set);

This could be done in a common error path handling.

>   					exit(1);
>   				}
>   				queue_path[0] = '/';
> @@ -619,6 +624,7 @@ int main(int argc, char *argv[])
>   	}
>   
>   	if (continuous_mode && num_cpus_to_pin == 0) {
> +		CPU_FREE(cpu_set);

This could be done in a common error path handling.

>   		fprintf(stderr, "Must pass at least one CPU to continuous "
>   			"mode.\n");
>   		poptPrintUsage(popt_context, stderr, 0);
> @@ -628,10 +634,12 @@ int main(int argc, char *argv[])
>   		cpus_to_pin[0] = cpus_online - 1;
>   	}
>   
> -	if (getuid() != 0)
> +	if (getuid() != 0) {
> +		CPU_FREE(cpu_set);
>   		ksft_exit_skip("Not running as root, but almost all tests "
>   			"require root in order to modify\nsystem settings.  "
>   			"Exiting.\n");
> +	}
>   

Why not move this check before CPU_ALLOC and make this the very first
check in main()?

With this change the other places where CPU_FREE is added right before
exit(1). Something like this:

err_code:
	CPU_FREE(cpu_set);
	exit(code)

>   	max_msgs = fopen(MAX_MSGS, "r+");
>   	max_msgsize = fopen(MAX_MSGSIZE, "r+");
> 

thanks,
-- Shuah
