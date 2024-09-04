Return-Path: <linuxppc-dev+bounces-1010-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A3696C6A2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 20:44:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzWcb4dXXz2yfl;
	Thu,  5 Sep 2024 04:44:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725475471;
	cv=none; b=laPfbwXSdpEMYNgVa1Ey0npKw54MaH5KKBhUeYg1mi7W0moFNN863yMekFjillRDt0+Ilib71Pundid97fqLkcuZ6j3SqshWueB7g3bOjU/qM6XrAxdXqzwvAdK6jT1XVGErTTCtH6PtlDP1YtqUjdOAq6snWp1TcDN98eQeh16EpfBRYStJhT2cF6W3s0dqzSv+HYbvsdAayYFfymq3UAD4R821Paq8b6+7ylX+WOZos6lx8K/NHWIf0S6monJ48EYZ41zPFrNdb5FE5FnaeF52zJAR3ZQtc2JTO/76bj8z7M1U5mvAGPgrEOrrQ0X+u13NmSnYC0od0FZK9jGK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725475471; c=relaxed/relaxed;
	bh=YgHFLJHjFySkLrkQbW13i1FNcl4+/MKPF84n+E1N1tM=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:Date:Message-ID:
	 References:MIME-version:Content-type; b=CYC9VqjziTKT8PmAVANDu9KvrbuI82YgrUdKhBcs9Kdwcegizy59bUHDRvnDprJAZnDTTD8Tlc3vwejQ1LU0pNS83CXZProyeEAzzeJcmkPq7AsBp5tl33M0VrUftFVg9v+KTTEGVqNexjgAU4wqT6tP8OEuM5plDyigUd/QVBfOCbf9bDrvx6rCBkwiDqWjaSaRmeteSe97n0BoFwn3QX/kcx2YKQYzNBdpiEaJeYYff2jixIKyNnhHAwx+wNlFlZXoxCjfINCxusdX8m2WyNMMLgXXadO2diUrNO9Ain7sLP8iRAv/uh7xBjbnWFWC/MuxIB6s7+vE7DX2uRmBJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DCpVigqJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DCpVigqJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzWcb1b2Dz2yWy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 04:44:29 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2053525bd90so38601055ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 11:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725475466; x=1726080266; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgHFLJHjFySkLrkQbW13i1FNcl4+/MKPF84n+E1N1tM=;
        b=DCpVigqJZlHiHOugRlYriHGkjNczurliCEKpqsda17g2+Xmleg6GvKRPH5fM8Rvo1/
         xZMCZ6GHivfAp9y/CJgmrqRBgrk3ZVzRBUyABW/osyhuXFhc5BReoDY0Gp1sZ8kF/fCK
         n6ofcNvJNkoQdsHXSUeYhEwLPkwk1jcO82cfp+dVt5p7Ekpwu6aXnyA4FmWzaOAfQHCJ
         71dAUaoL72EHTsRpQNUpZXmPp6NEQUPjVlcOgCaolUdOBRMhF0foSn3tzc4+AEBAgMO7
         mGTrCiEQY9dKAWURlcPTpEL4duRLtRavDw/bzsFFxtHwBnALf/80ILkhcYSG2XggBzyq
         d/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475466; x=1726080266;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgHFLJHjFySkLrkQbW13i1FNcl4+/MKPF84n+E1N1tM=;
        b=qpi7U9t+XXCBRYRBttA6KcpmZ5SdAKk0FAnHlBrrT4IpqkB7ZYOPJQ4DEMd5M76X58
         2y3cyWkGJAFouWpV6Ma16WHuCS3UL/MCH+04Q9iKK8elgbXmppFIPtvXZa+wDLu+8I6T
         7huMzMJKOUhRfXAqpI7FOjRNTyDsrz637IBeyztDzWpr9k8RfcPmNQk1Rrh8Czfzr6yz
         C1+P69x22uvdJb++hVJn8K8NzRWWG8hMyrMRIQI+tQMIonJcjpwMQsZALfZWTJD7BMkl
         CCphTmWz/p68iWnGX87arE7z1YzDLiy2HiH0UM78CaTpDuBsrVzZAGXzWpZrBW/zR/6J
         tdXA==
X-Forwarded-Encrypted: i=1; AJvYcCUSWQvJDzswAvN/6n57LMyai0ua/lykpGHXs5YLYllQr9qHOY0MTlz3RsVQYTH6ojB7evngbWEuXTArWfY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzwlrgnFLtHQCSnZ/hJQQSkR2BNVrG4FwfMQaBbEVg9z3WwD9r9
	Jjgj4nDdMw6EKQWJUh5OMoAW5g4d5DCohQvbfcpCar6XyptNrDSc
X-Google-Smtp-Source: AGHT+IEjTKWtslS5vaK91XOUjdRJaDUR6SpUN4Km4jw0RPNFjXM8gAGqnbvKfJCQi21N+GxmptTg/g==
X-Received: by 2002:a17:902:ced1:b0:203:74fe:4ee0 with SMTP id d9443c01a7336-2054c4765d1mr177313565ad.53.1725475466378;
        Wed, 04 Sep 2024 11:44:26 -0700 (PDT)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae78c41csm16869605ad.0.2024.09.04.11.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 11:44:25 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Donet Tom <donettom@linux.vnet.ibm.com>, Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
Subject: Re: [RFC v1 09/10] book3s64/radix: Refactoring common kfence related functions
In-Reply-To: <f37526c7-a608-426c-b23b-2681139868db@csgroup.eu>
Date: Thu, 05 Sep 2024 00:04:44 +0530
Message-ID: <87a5gn2rp7.fsf@gmail.com>
References: <cover.1722408881.git.ritesh.list@gmail.com> <292790d676ed9e31507a0ba4b11800cbc6670e44.1722408881.git.ritesh.list@gmail.com> <f37526c7-a608-426c-b23b-2681139868db@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 31/07/2024 à 09:56, Ritesh Harjani (IBM) a écrit :
>> [Vous ne recevez pas souvent de courriers de ritesh.list@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>> 
>> Both radix and hash on book3s requires to detect if kfence
>> early init is enabled or not. Hash needs to disable kfence
>> if early init is not enabled because with kfence the linear map is
>> mapped using PAGE_SIZE rather than 16M mapping.
>> We don't support multiple page sizes for slb entry used for kernel
>> linear map in book3s64.
>> 
>> This patch refactors out the common functions required to detect kfence
>> early init is enabled or not.
>> 
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   arch/powerpc/include/asm/kfence.h        |  2 ++
>>   arch/powerpc/mm/book3s64/radix_pgtable.c | 12 ------------
>>   arch/powerpc/mm/init-common.c            | 12 ++++++++++++
>>   3 files changed, 14 insertions(+), 12 deletions(-)
>> 
>> diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
>> index fab124ada1c7..5975688d8de1 100644
>> --- a/arch/powerpc/include/asm/kfence.h
>> +++ b/arch/powerpc/include/asm/kfence.h
>> @@ -15,6 +15,8 @@
>>   #define ARCH_FUNC_PREFIX "."
>>   #endif
>> 
>> +extern bool kfence_early_init;
>> +
>>   #ifdef CONFIG_KFENCE
>>   extern bool kfence_disabled;
>> 
>> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> index b0d927009af8..311e2112d782 100644
>> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> @@ -363,18 +363,6 @@ static int __meminit create_physical_mapping(unsigned long start,
>>   }
>> 
>>   #ifdef CONFIG_KFENCE
>> -static bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
>> -
>> -static int __init parse_kfence_early_init(char *arg)
>> -{
>> -       int val;
>> -
>> -       if (get_option(&arg, &val))
>> -               kfence_early_init = !!val;
>> -       return 0;
>> -}
>> -early_param("kfence.sample_interval", parse_kfence_early_init);
>> -
>>   static inline phys_addr_t alloc_kfence_pool(void)
>>   {
>>          phys_addr_t kfence_pool;
>> diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
>> index 21131b96d209..259821a4db62 100644
>> --- a/arch/powerpc/mm/init-common.c
>> +++ b/arch/powerpc/mm/init-common.c
>> @@ -33,6 +33,18 @@ bool disable_kuep = !IS_ENABLED(CONFIG_PPC_KUEP);
>>   bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
>>   #ifdef CONFIG_KFENCE
>>   bool __ro_after_init kfence_disabled;
>> +bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
>> +static int __init parse_kfence_early_init(char *arg)
>
> If I understand correctly, previously it was only for radix, now it is 
> for every platform including PPC32 ?
>

Ok. I see what you mean. Let me see how can I limit this cmdline parsing
of kfence and/or special case kfence handling to book3s64 only.

>> +{
>> +       int val;
>> +
>> +       if (get_option(&arg, &val))
>> +               kfence_early_init = !!val;
>> +       return 0;
>> +}
>> +early_param("kfence.sample_interval", parse_kfence_early_init);
>> +#else
>> +bool __ro_after_init kfence_early_init;
>
> I don't understand, why do you need that in the #else case ?
>

Yes, I don't like it either. Let me clean this up.
this was required in htab_init_page_sizes(). 

Thanks for pointing out.

-ritesh

