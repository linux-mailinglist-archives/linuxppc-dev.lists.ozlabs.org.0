Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4117124CE54
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 08:57:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXslZ2mx6zDqsl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 16:57:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXsjn0qRlzDr84
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 16:55:56 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BXsjg1tpkzB09ZW;
 Fri, 21 Aug 2020 08:55:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bFctMp_9QdrQ; Fri, 21 Aug 2020 08:55:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BXsjg0swPzB09ZV;
 Fri, 21 Aug 2020 08:55:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1BEF18B8AD;
 Fri, 21 Aug 2020 08:55:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TR0EcjU_QKMV; Fri, 21 Aug 2020 08:55:52 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B90A68B881;
 Fri, 21 Aug 2020 08:55:51 +0200 (CEST)
Subject: Re: kernel since 5.6 do not boot anymore on Apple PowerBook
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Giuseppe Sacco <giuseppe@sguazz.it>, linuxppc-dev@lists.ozlabs.org
References: <89e412a76350b28f791bb8a2b6f9647a034f6fc8.camel@sguazz.it>
 <04544f16-fb20-54b9-e56e-47d45af03b6c@csgroup.eu>
 <c98f8586c16c86bb9b4485138bbabce9f15c282b.camel@sguazz.it>
 <64815669-5282-f74f-efc6-6c4c376fb602@csgroup.eu>
 <990279c219476c4d513df52454adf583de32641a.camel@sguazz.it>
 <211a35b02193ae79a201d4d567fe1d7a53a979f5.camel@sguazz.it>
 <639a48d1-815b-33f1-3c9e-cd9ca8ec41b1@csgroup.eu>
 <aab7a9fefe9ccfa272fbc45eeaa8228fced14d3b.camel@sguazz.it>
 <498426507489f2c8e32daaf7af1105b5adba552f.camel@sguazz.it>
 <c2a89243-6135-4edd-2c1c-42c2159b5a1e@csgroup.eu>
 <e6878657490aa34b54b3daf0430073078a9840e7.camel@sguazz.it>
 <b70a6343-a380-ff08-a401-04f9ab50be6b@csgroup.eu>
Message-ID: <59de290b-4b6c-a55e-9289-e640473b1382@csgroup.eu>
Date: Fri, 21 Aug 2020 08:55:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b70a6343-a380-ff08-a401-04f9ab50be6b@csgroup.eu>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Giuseppe,

Le 08/07/2020 à 20:44, Christophe Leroy a écrit :
> 
> 
> Le 08/07/2020 à 19:36, Giuseppe Sacco a écrit :
>> Hi Cristophe,
>>
>> Il giorno mer, 08/07/2020 alle 19.09 +0200, Christophe Leroy ha
>> scritto:
>>> Hi
>>>
>>> Le 08/07/2020 à 19:00, Giuseppe Sacco a écrit :
>>>> Hello,
>>>> while trying to debug a problem using git bisect, I am now at a point
>>>> where I cannot build the kernel at all. This is the error message I
>>>> get:
>>>>
>>>> $ LANG=C make ARCH=powerpc \
>>>>    CROSS_COMPILE=powerpc-linux- \
>>>>    CONFIG_MODULE_COMPRESS_GZIP=true \
>>>>    INSTALL_MOD_STRIP=1 CONFIG_MODULE_COMPRESS=1 \
>>>>    -j4 INSTALL_MOD_PATH=$BOOT INSTALL_PATH=$BOOT \
>>>>    CONFIG_DEBUG_INFO_COMPRESSED=1 \
>>>>    install modules_install
>>>> make[2]: *** No rule to make target 'vmlinux', needed by
>>>
>>> Surprising.
>>>
>>> Did you make any change to Makefiles ?
>>
>> No
>>
>>> Are you in the middle of a bisect ? If so, if the previous builds
>>> worked, I'd do 'git bisect skip'
>>
>> Yes, the previous one worked.
>>
>>> What's the result with:
>>>
>>> LANG=C make ARCH=powerpc CROSS_COMPILE=powerpc-linux- vmlinux
>>
>> $ LANG=C make ARCH=powerpc CROSS_COMPILE=powerpc-linux- vmlinux
>>    CALL    scripts/checksyscalls.sh
>>    CALL    scripts/atomic/check-atomics.sh
>>    CHK     include/generated/compile.h
>>    CC      kernel/module.o
>> kernel/module.c: In function 'do_init_module':
>> kernel/module.c:3593:2: error: implicit declaration of function
>> 'module_enable_ro'; did you mean 'module_enable_x'? [-Werror=implicit-
>> function-declaration]
>>   3593 |  module_enable_ro(mod, true);
>>        |  ^~~~~~~~~~~~~~~~
>>        |  module_enable_x
>> cc1: some warnings being treated as errors
>> make[1]: *** [scripts/Makefile.build:267: kernel/module.o] Error 1
>> make: *** [Makefile:1735: kernel] Error 2
>>
>> So, should I 'git bisect skip'?
> 
> Ah yes, I had the exact same problem last time I bisected.
> 
> So yes do 'git bisect skip'. You'll probably hit this problem half a 
> dozen of times, but at the end you should get a usefull bisect anyway.
> 

Were you able to progress ?

Christophe
