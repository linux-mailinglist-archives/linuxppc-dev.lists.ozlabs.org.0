Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063F13F60C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 16:42:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvBfG5fQPz2yNG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 00:42:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=J3cKzkSZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d35;
 helo=mail-io1-xd35.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=J3cKzkSZ; 
 dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvBdX0lXqz2xTK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 00:41:51 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id b7so26653527iob.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 07:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R4sYf/rlvV8BhzPPdioEXkPuJURRz5oo6OShBjBno4A=;
 b=J3cKzkSZLG5+Jlxd5R1kmYkfVivtcSeU9aN1Wo0RIgBDtD+XJIgw3iIsCE62Z173IY
 vmw85CJvjFLV3zemN9Czo15vKZCpXmMX7jJoiYu8O9Rob2/+I95we24z7V6oXTiqyruc
 ZAb9jsCuTEQR8tonDWOkriUWJUINLJDr3fszA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R4sYf/rlvV8BhzPPdioEXkPuJURRz5oo6OShBjBno4A=;
 b=g1d2HVfGVN5CwvwJ5eSB1jr25Yw/QatxYI7w4Jqi2/KUN3GVfGz/eyncQqYIIrOlzk
 q03N1r7LWfe8JSbvDqaiB6pDA7IzekTWhgIl+IhiYd4DRzu6W4xKdOza3a1DnnyHCuyw
 k83gjDODFlaXPTlgVN0uALDZs49Ta1/0VI/1z/uTEXMsF8VqgUmwjtSMCI/1t4Uw0+qF
 T5tKcu6hi0fJBq79DHqdkYN84AVmA0BXJxKUPnPs0ZUaI6vZv89L5pwxqISWry+CcOrs
 OSYMwUAJxPZjPYKwQ5Z86JqCUT2gUbNfpWyrO88d5YJUXhyUPTFN2knEE1/mxTBHru1x
 pPLQ==
X-Gm-Message-State: AOAM531JTW60Z57zulpznIDX0NmuVuJhNJJoJqv+Di/KvpT87ERQhZmQ
 k3mfaR3nSeuVSDdEgGx9+ecawVlcannAqw==
X-Google-Smtp-Source: ABdhPJwz5TxZkECr6N1SrMAlQvdgJ2sMTH9JWZGMdbIvLLOQ872P317kjoNNEoVPAU0Qn/JHdk5s/Q==
X-Received: by 2002:a5d:824e:: with SMTP id n14mr31134832ioo.134.1629816109044; 
 Tue, 24 Aug 2021 07:41:49 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id s6sm10046526iow.1.2021.08.24.07.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 07:41:48 -0700 (PDT)
Subject: Re: [PATCH linux-next] selftests/powerpc: remove duplicate include
To: CGEL <cgel.zte@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20210824030550.57467-1-deng.changcheng@zte.com.cn>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <9096738b-7e57-418d-6253-16a107789dac@linuxfoundation.org>
Date: Tue, 24 Aug 2021 08:41:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210824030550.57467-1-deng.changcheng@zte.com.cn>
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
Cc: Zeal Robot <zealci@zte.com.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/23/21 9:05 PM, CGEL wrote:
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
> 
> Clean up the following includecheck warning:
> 
> ./tools/testing/selftests/powerpc/tm/tm-poison.c: inttypes.h is included
> more than once.
> 
> No functional change.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
> ---
>   tools/testing/selftests/powerpc/tm/tm-poison.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/powerpc/tm/tm-poison.c b/tools/testing/selftests/powerpc/tm/tm-poison.c
> index 29e5f26..27c083a 100644
> --- a/tools/testing/selftests/powerpc/tm/tm-poison.c
> +++ b/tools/testing/selftests/powerpc/tm/tm-poison.c
> @@ -20,7 +20,6 @@
>   #include <sched.h>
>   #include <sys/types.h>
>   #include <signal.h>
> -#include <inttypes.h>
>   
>   #include "tm.h"
>   
> 

We can't accept this patch. The from and Signed-off-by don't match.

thanks,
-- Shuah
