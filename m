Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5A73F62BB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 18:35:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvF8669Rhz2yn5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 02:35:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvF7d2rw6z2xsB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 02:34:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GvF7V49s9z9sVj;
 Tue, 24 Aug 2021 18:34:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NNE9R10_fWol; Tue, 24 Aug 2021 18:34:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GvF7V39gHz9sV8;
 Tue, 24 Aug 2021 18:34:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F08B8B828;
 Tue, 24 Aug 2021 18:34:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1icTG244R3t1; Tue, 24 Aug 2021 18:34:30 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C25C8B80A;
 Tue, 24 Aug 2021 18:34:29 +0200 (CEST)
Subject: Re: [PATCH linux-next] powerpc/tm: remove duplicate include in
 tm-poison.c
To: Shuah Khan <skhan@linuxfoundation.org>, cgel.zte@gmail.com,
 mpe@ellerman.id.au
References: <20210805065255.628170-1-yong.yiran@zte.com.cn>
 <c5e9900b-1c2d-8e72-ad83-a6024b876fd2@linuxfoundation.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4bc97c33-7fc0-ff9d-041b-e773f682c5d2@csgroup.eu>
Date: Tue, 24 Aug 2021 18:34:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c5e9900b-1c2d-8e72-ad83-a6024b876fd2@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: yong.yiran@zte.com.cn, shuah@kernel.org, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, paulus@samba.org,
 linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/08/2021 à 16:40, Shuah Khan a écrit :
> On 8/5/21 12:52 AM, cgel.zte@gmail.com wrote:
>> From: yong yiran <yong.yiran@zte.com.cn>
>>
>> 'inttypes.h' included in 'tm-poison.c' is duplicated.
>> Remove all but the first include of inttypes.h from tm-poison.c.
>>
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: yong yiran <yong.yiran@zte.com.cn>
>> ---
>>   tools/testing/selftests/powerpc/tm/tm-poison.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/powerpc/tm/tm-poison.c 
>> b/tools/testing/selftests/powerpc/tm/tm-poison.c
>> index 29e5f26af7b9..27c083a03d1f 100644
>> --- a/tools/testing/selftests/powerpc/tm/tm-poison.c
>> +++ b/tools/testing/selftests/powerpc/tm/tm-poison.c
>> @@ -20,7 +20,6 @@
>>   #include <sched.h>
>>   #include <sys/types.h>
>>   #include <signal.h>
>> -#include <inttypes.h>
>>   #include "tm.h"
>>
> 
> We can't accept this patch. The from and Signed-off-by don't match.
> 

As far as I can see they match. You have:

From: yong yiran <yong.yiran@zte.com.cn>
Signed-off-by: yong yiran <yong.yiran@zte.com.cn>

