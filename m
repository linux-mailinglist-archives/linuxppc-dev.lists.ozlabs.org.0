Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E62303F2000
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 20:36:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrD5066sHz3dBc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 04:36:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrD4b4tQ3z2yMy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 04:36:29 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GrD4V5dpBz9sVh;
 Thu, 19 Aug 2021 20:36:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MA0itZQEM3-N; Thu, 19 Aug 2021 20:36:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GrD4V4N4Pz9sV0;
 Thu, 19 Aug 2021 20:36:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 758B38B844;
 Thu, 19 Aug 2021 20:36:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id O-mFpJo8XPBW; Thu, 19 Aug 2021 20:36:26 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E66C58B837;
 Thu, 19 Aug 2021 20:36:25 +0200 (CEST)
Subject: Re: [PATCH 5/6] audit: Declare ppc32_classify_syscall()
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20210819125656.14498-1-clg@kaod.org>
 <20210819125656.14498-6-clg@kaod.org>
 <d268f141-4ec3-eb1d-a6c1-4cd5f535ea49@csgroup.eu>
Message-ID: <54d4ac4b-022b-6e8c-e07f-15de90935ff9@csgroup.eu>
Date: Thu, 19 Aug 2021 20:36:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d268f141-4ec3-eb1d-a6c1-4cd5f535ea49@csgroup.eu>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/08/2021 à 16:56, Christophe Leroy a écrit :
> 
> 
> Le 19/08/2021 à 14:56, Cédric Le Goater a écrit :
>> This fixes a compile error with W=1.
>>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>   I don't think this is correct. Which file could we use ?
> 
> I think you can completely remove ppc32_classify_syscall(), and instead add the following in the 
> default case in audit_classify_syscall():
> 
>       default:
> +        if (IS_ENABLED(CONFIG_PPC64) && abi == AUDIT_ARCH_PPC)
> +            return 1;
>           return 0;
> 

After looking more in details, in fact I think we should convert powerpc to 
CONFIG_AUDIT_ARCH_COMPAT_GENERIC

> 
>>
>>   arch/powerpc/include/asm/unistd.h | 3 +++
>>   arch/powerpc/kernel/audit.c       | 1 -
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/unistd.h b/arch/powerpc/include/asm/unistd.h
>> index b541c690a31c..d9025a7e973c 100644
>> --- a/arch/powerpc/include/asm/unistd.h
>> +++ b/arch/powerpc/include/asm/unistd.h
>> @@ -47,6 +47,9 @@
>>   #define __ARCH_WANT_SYS_UTIME
>>   #define __ARCH_WANT_SYS_NEWFSTATAT
>>   #define __ARCH_WANT_COMPAT_SYS_SENDFILE
>> +#ifdef CONFIG_AUDIT
>> +extern int ppc32_classify_syscall(unsigned int syscall);
>> +#endif
>>   #endif
>>   #define __ARCH_WANT_SYS_FORK
>>   #define __ARCH_WANT_SYS_VFORK
>> diff --git a/arch/powerpc/kernel/audit.c b/arch/powerpc/kernel/audit.c
>> index a2dddd7f3d09..c3c6c6a1069b 100644
>> --- a/arch/powerpc/kernel/audit.c
>> +++ b/arch/powerpc/kernel/audit.c
>> @@ -41,7 +41,6 @@ int audit_classify_arch(int arch)
>>   int audit_classify_syscall(int abi, unsigned syscall)
>>   {
>>   #ifdef CONFIG_PPC64
>> -    extern int ppc32_classify_syscall(unsigned);
>>       if (abi == AUDIT_ARCH_PPC)
>>           return ppc32_classify_syscall(syscall);
>>   #endif
>>
