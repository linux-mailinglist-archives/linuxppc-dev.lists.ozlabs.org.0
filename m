Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C44368B6C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 05:07:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRK3B1LJxz30Cn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 13:07:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=lRuvet4P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=lRuvet4P; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRK2k4pC3z2xZs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 13:07:07 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 u14-20020a17090a1f0eb029014e38011b09so480253pja.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 20:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=SFQX8bi87piijHZfLuuDNGJ4qf5mSKDGS7jymau0C6s=;
 b=lRuvet4P4e2XL1bejNfN+jLPxs67WmPs55GBIZ1OUiJnVZxCcs/coLxunM78f4PUgm
 vnbo1KpiH2qWS9efHL728y+7FQ7yxwSA5YBX5e70Foz4RFbhyu0oU6GWexT6ISoy/JaB
 slio/FSVCm8f7pHBwWBy5sfQOThRQWnFnfUJix1aAirkpQ5XdFq+s36XA6EQ5aKdAv7L
 sn1YDYYL3xTkuM99mKvyNA6KspGfEk0VSIuQevREL7KDR/2yq5fVQXSlkM/UE+/NDwaH
 26qJNwB00KguT4D6tEhHO1mWZ2Fi3OtS0cU4BEtDcp+9pccP1QEzDU2vh4NbHNk00W8g
 RV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SFQX8bi87piijHZfLuuDNGJ4qf5mSKDGS7jymau0C6s=;
 b=DlN7Jo2/LxoLzyK5GAM6+gVIYoXQHxYyc/VmGHYqGdSlf9k4LVVyrtz4g9cFpS2oxw
 t7ESYoV/+w9YTeAIrONGB7kfGMdjyjmnrAm7WEvBvniL1zhaNNwbfDcIwPBgqGwR4yTs
 FYGO3Ow6Z5B1UdKt8b+H+8+2rGTt+pqlAPgcf8oqQ6BMsgnj73lnnO9WZFqvLFB4B9gv
 9BRVZsocRwoBkXvzPcok2KtnxVOjVOg0YDF+6U7e0hLakGUS6Onj6CcTAL7cVu08y6mK
 NYKAFA3l7T8bMqcyn3shHrK/XRJb/IVaXfilBuO/EvwJQv3iF/DCazxthfjFfiocl4np
 TWEA==
X-Gm-Message-State: AOAM5301wuIzIzIXfn3Wv+j7HTl2STI4KOi63rqkf5q2T1XOoVlldf+m
 JhFTRPFAbyTJS02KLUyj6RZn7j8+dJ8pgAlO
X-Google-Smtp-Source: ABdhPJzaA8mpJI85JBtnNjNt9UNXBjq2JSYTYhD+pRJPHp7R/hD/Pznnjitm0TXFxJH+ImpVQnZPJw==
X-Received: by 2002:a17:902:e051:b029:eb:4411:db58 with SMTP id
 x17-20020a170902e051b02900eb4411db58mr1631511plx.11.1619147224370; 
 Thu, 22 Apr 2021 20:07:04 -0700 (PDT)
Received: from localhost
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id c129sm3206168pfb.141.2021.04.22.20.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 20:07:03 -0700 (PDT)
Message-ID: <3e50aa5b-5895-6beb-ddf3-8c7647dbb199@ozlabs.ru>
Date: Fri, 23 Apr 2021 13:06:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH kernel] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
Content-Language: en-US
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
References: <20210422092737.895392-1-aik@ozlabs.ru>
 <87mttqylho.fsf@dja-thinkpad.axtens.net>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <87mttqylho.fsf@dja-thinkpad.axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 23/04/2021 08:58, Daniel Axtens wrote:
> Hi Alexey,
> 
>> The $(CPP) (do only preprocessing) macro is already defined in Makefile.
>> However POWERPC redefines it and adds $(KBUILD_CFLAGS) which results
>> in flags duplication. Which is not a big deal by itself except for
>> the flags which depend on other flags and the compiler checks them
>> as it parses the command line.
>>
>> Specifically, scripts/Makefile.build:304 generates ksyms for .S files.
>> If clang+llvm+sanitizer are enabled, this results in
>> -fno-lto -flto -fsanitize=cfi-mfcall  .... -fno-lto -flto -fsanitize=cfi-mfcall
> 
> Checkpatch doesn't like this line:
> WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> #14:
> -fno-lto -flto -fsanitize=cfi-mfcall  .... -fno-lto -flto -fsanitize=cfi-mfcall
> However, it doesn't make sense to wrap the line so we should just ignore
> checkpatch here.
> 
>> in the clang command line and triggers error:
>>
>> clang-13: error: invalid argument '-fsanitize=cfi-mfcall' only allowed with '-flto'
>>
>> This removes unnecessary CPP redifinition.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>   arch/powerpc/Makefile | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>> index c9d2c7825cd6..3a2f2001c62b 100644
>> --- a/arch/powerpc/Makefile
>> +++ b/arch/powerpc/Makefile
>> @@ -214,7 +214,6 @@ KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
>>   KBUILD_AFLAGS	+= $(AFLAGS-y)
>>   KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
>>   KBUILD_CFLAGS	+= -pipe $(CFLAGS-y)
>> -CPP		= $(CC) -E $(KBUILD_CFLAGS)
> 
> I was trying to check the history to see why powerpc has its own
> definition. It seems to date back at least as far as merging the two
> powerpc platforms into one, maybe it was helpful then. I agree it
> doesn't seem to be needed now.
> 
> Snowpatch claims that this breaks the build, but I haven't been able to
> reproduce the issue in either pmac32 or ppc64 defconfig. I have sent it
> off to a fork of mpe's linux-ci repo to see if any of those builds hit
> any issues: https://github.com/daxtens/linux-ci/actions

To be precise, you need LLVM + LTO + byte code (-emit-llvm-bc), I am not 
even sure what is the point of having -flto without -emit-llvm-bc.

No flags duplication:

[fstn1-p1 1]$ /mnt/sdb/pbuild/llvm-no-lto/bin/clang-13  -emit-llvm-bc 
-fno-lto -flto -fvisibility=hidden -fsanitize=cfi-mfcall 
/mnt/sdb/pbuild/llvm-bugs/1/a.c
/usr/bin/ld: warning: cannot find entry symbol mit-llvm-bc; defaulting 
to 00000000100003e0
/usr/bin/ld: 
/usr/lib/powerpc64le-linux-gnu/crt1.o:(.data.rel.ro.local+0x8): 
undefined reference to `main'
clang-13: error: linker command failed with exit code 1 (use -v to see 
invocation)

=> command line is fine, the file is not (but it is for debugging this 
problem).


Now I am adding the second -fno-lto:

[fstn1-p1 1]$ /mnt/sdb/pbuild/llvm-no-lto/bin/clang-13  -emit-llvm-bc 
-fno-lto -flto -fvisibility=hidden -fsanitize=cfi-mfcall -fno-lto 
/mnt/sdb/pbuild/llvm-bugs/1/a.c
clang-13: error: invalid argument '-fsanitize=cfi-mfcall' only allowed 
with '-flto'


=> failed.

> Assuming that doesn't break, this patch looks good to me:
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> 
> Kind regards,
> Daniel
> 

-- 
Alexey
