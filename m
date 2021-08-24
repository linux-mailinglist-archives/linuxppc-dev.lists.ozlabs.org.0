Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A9B3F62ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 18:43:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvFKM018Zz2yPY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 02:43:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=KBiJ2SXh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d30;
 helo=mail-io1-xd30.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=KBiJ2SXh; 
 dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvFJd51Htz2yK3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 02:42:24 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id y18so11557498ioc.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 09:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nIgXchQzkQhDuuxzVmoHtjc1x93MwuM62GG3/htVnnc=;
 b=KBiJ2SXhXbplYkTDTlgBKn+GW+K2v1LLz+EFVixmgw6vRoIIIsEbnEpVq3wEFG7LJ4
 fvKH5uG5E2XcfDDTBIguvTuzzA4ljDGsD+YD35BNEkHHS5OAldRXYV1GS5NGRpajpnzW
 klTsgpCugR+REOLminT46oURTG4xCKeUzMtxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nIgXchQzkQhDuuxzVmoHtjc1x93MwuM62GG3/htVnnc=;
 b=REA8xib9l9PNm4RGxHa8DLQNxxeyvEnti3LikDZtE2eVQn+jBZmFWNap5MFGwDKWtT
 3FdcOGu/cS6EjIbKAxFHbzMU77BBqNcOx/zQq10upRJEQ/t+Rc97Bf1PgRzzLny+Aljg
 rXW8sbdq4WcscG/pithe2n4xK2mJf1OAPHjX080bYj+4p7ZOpGVMQE6RH6bPvBCsaw+I
 iY3h/T4zt84QvpOn4sS7ZI+YKin9pjShBabj5F67iiDT/J4XAii+gJMWjTsexH2n0Vkd
 20+eq6h4yL6yMuHQXidp4Ni3ErouAORBP52Atn9Pl/Y6IBHuQDPnVfOBSSmIk3lWfjC4
 cO0A==
X-Gm-Message-State: AOAM530c3PvJY4SqBHD/0W2iAV7/4DlWbgBv7wdWgGgtHW4chfgsIBJc
 gU5zRPFwore6IedNLQvxGhRXiQ==
X-Google-Smtp-Source: ABdhPJzMw5fmv+XMCK8ylBh9MKFCODi5eD0DzaIc7+CibHXe9LdxjQ8fqrYMknxdF7urKjq5vCuB2g==
X-Received: by 2002:a5d:9bcf:: with SMTP id d15mr31669482ion.88.1629823340657; 
 Tue, 24 Aug 2021 09:42:20 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id m13sm9743492ilh.43.2021.08.24.09.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 09:42:20 -0700 (PDT)
Subject: Re: [PATCH linux-next] selftests/powerpc: remove duplicate include
To: Christophe Leroy <christophe.leroy@csgroup.eu>, CGEL
 <cgel.zte@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20210824030550.57467-1-deng.changcheng@zte.com.cn>
 <9096738b-7e57-418d-6253-16a107789dac@linuxfoundation.org>
 <e59721c8-fe59-cafe-01a3-8c7d74f2583d@csgroup.eu>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <7f9f3bf4-646c-b8ab-8d46-7e87cf8e9af3@linuxfoundation.org>
Date: Tue, 24 Aug 2021 10:42:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e59721c8-fe59-cafe-01a3-8c7d74f2583d@csgroup.eu>
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
Cc: Shuah Khan <shuah@kernel.org>, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/24/21 10:35 AM, Christophe Leroy wrote:
> 
> 
> Le 24/08/2021 à 16:41, Shuah Khan a écrit :
>> On 8/23/21 9:05 PM, CGEL wrote:
>>> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>>>
>>> Clean up the following includecheck warning:
>>>
>>> ./tools/testing/selftests/powerpc/tm/tm-poison.c: inttypes.h is included
>>> more than once.
>>>
>>> No functional change.
>>>
>>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>>> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
>>> ---
>>>   tools/testing/selftests/powerpc/tm/tm-poison.c | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/tools/testing/selftests/powerpc/tm/tm-poison.c b/tools/testing/selftests/powerpc/tm/tm-poison.c
>>> index 29e5f26..27c083a 100644
>>> --- a/tools/testing/selftests/powerpc/tm/tm-poison.c
>>> +++ b/tools/testing/selftests/powerpc/tm/tm-poison.c
>>> @@ -20,7 +20,6 @@
>>>   #include <sched.h>
>>>   #include <sys/types.h>
>>>   #include <signal.h>
>>> -#include <inttypes.h>
>>>   #include "tm.h"
>>>
>>
>> We can't accept this patch. The from and Signed-off-by don't match.
> 
> As far as I can see they match:
> 
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
> 

Yeah. My bad.

thanks,
-- Shuah

