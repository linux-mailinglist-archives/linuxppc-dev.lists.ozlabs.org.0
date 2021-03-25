Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F32349C7A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 23:45:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F60Yf14hNz3bxr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 09:45:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=IicXkfu1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=IicXkfu1; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F60YD2249z303X
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 09:45:01 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id l123so3536418pfl.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 15:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=i1A3B1VA5Zv5sBwoUoS9WZiP910FQdZZhnQVANdwB9c=;
 b=IicXkfu18EISqV5ydhu56kRQMXqHpoRlop4C6BcDh/WNhGYMdJzZ/j9kZAfuPT4BQ/
 npjBX182kJUDvhCs3A14H6ZmbO6bikVoZBMzyFhHP3JHmK2ypCwwuYKXo48N26dOflJz
 sF9QIO5+3JINV4A5ZlwLXVEoUJCE0XxMhc7Us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=i1A3B1VA5Zv5sBwoUoS9WZiP910FQdZZhnQVANdwB9c=;
 b=SwfIfyApH6CNDa6J9E8Kddsp4FwOfgZGKpESOoV6i3wsWWOoZ7wR1/cdZrGau16aJ5
 CdBvRoNFTzHEqpBbFhhW9AL5KV7/kc3zXh7VWXjx+FgTkoJpCCwo5z7CduD64ZccG2zv
 eZJyrfGKJtEBqHC+sVFK2nTXExqiA2EoBw3jDzBPQOP8gYBJsuaMm1RXlThv3khxL5XM
 N2n0WhzHThkIHhNdT8Is5hGHbxGvIyxOdCz60c5ONQvV5I4accUbh8eM4QYOExrPgDBG
 UhNj2C2/kOpW1t+BXgLczexBzt1oIxfF1ewdZaONbKwmQg5IzrjYSwZCT6tvJaGtbXOf
 OfsQ==
X-Gm-Message-State: AOAM533O5XMK1IoahdwyOwIC2yEg5929xOQBzg+orIN6hmT3CcPW5/6j
 rk2TvTU0hsluv71df+y72rcbHA==
X-Google-Smtp-Source: ABdhPJzl6JZCX5R+lL7U/Se0bnk4N2jLloez48zhqiROs1PEF9zolxztpZkiesZDt5uQTPGMyTaL1w==
X-Received: by 2002:a17:902:da81:b029:e5:de44:af5b with SMTP id
 j1-20020a170902da81b02900e5de44af5bmr12069109plx.27.1616712298559; 
 Thu, 25 Mar 2021 15:44:58 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-5199-f2bf-3cbb-22e6.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:5199:f2bf:3cbb:22e6])
 by smtp.gmail.com with ESMTPSA id o20sm4304026pjs.2.2021.03.25.15.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 15:44:58 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 07/15] powerpc/uaccess: Call might_fault()
 inconditionaly
In-Reply-To: <874kgykgfk.fsf@dja-thinkpad.axtens.net>
References: <cover.1615398265.git.christophe.leroy@csgroup.eu>
 <e0a980a4dc7a2551183dd5cb30f46eafdbee390c.1615398265.git.christophe.leroy@csgroup.eu>
 <874kgykgfk.fsf@dja-thinkpad.axtens.net>
Date: Fri, 26 Mar 2021 09:44:54 +1100
Message-ID: <871rc2kg49.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:

> Hi Christophe,
>
>> Commit 6bfd93c32a50 ("powerpc: Fix incorrect might_sleep in
>> __get_user/__put_user on kernel addresses") added a check to not call
>> might_sleep() on kernel addresses. This was to enable the use of
>> __get_user() in the alignment exception handler for any address.
>>
>> Then commit 95156f0051cb ("lockdep, mm: fix might_fault() annotation")
>> added a check of the address space in might_fault(), based on
>> set_fs() logic. But this didn't solve the powerpc alignment exception
>> case as it didn't call set_fs(KERNEL_DS).
>>
>> Nowadays, set_fs() is gone, previous patch fixed the alignment
>> exception handler and __get_user/__put_user are not supposed to be
>> used anymore to read kernel memory.
>>
>> Therefore the is_kernel_addr() check has become useless and can be
>> removed.
>
> While I agree that __get_user/__put_user should not be used on kernel
> memory, I'm not sure that we have covered every case where they might be
> used on kernel memory yet. I did a git grep for __get_user - there are
> several callers in arch/powerpc and it looks like at least lib/sstep.c
> might be using __get_user to read kernel memory while single-stepping.
>
> I am not sure if might_sleep has got logic to cover the powerpc case -
> it uses uaccess_kernel, but we don't supply a definition for that on
> powerpc, so if we do end up calling __get_user on a kernel address, I
> think we might now throw a warning. (Unless we are saved by
> pagefault_disabled()?)

Ah, I just re-read some of my earlier emails and was reminded that yes,
if we are calling __get/put, we must have disabled page faults.

So yes, this is good.

>
> (But I haven't tested this yet, so it's possible I misunderstood
> something.)
>
> Do you expect any consequences if we've missed a case where
> __(get|put)_user is called on a kernel address because it hasn't been
> converted to use better helpers yet?
>
> Kind regards,
> Daniel
>
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>  arch/powerpc/include/asm/uaccess.h | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
>> index eaa828a6a419..c4bbc64758a0 100644
>> --- a/arch/powerpc/include/asm/uaccess.h
>> +++ b/arch/powerpc/include/asm/uaccess.h
>> @@ -77,8 +77,7 @@ __pu_failed:							\
>>  	__typeof__(*(ptr)) __pu_val = (x);			\
>>  	__typeof__(size) __pu_size = (size);			\
>>  								\
>> -	if (!is_kernel_addr((unsigned long)__pu_addr))		\
>> -		might_fault();					\
>> +	might_fault();						\
>>  	__chk_user_ptr(__pu_addr);				\
>>  	__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err);	\
>>  								\
>> @@ -238,12 +237,12 @@ do {								\
>>  	__typeof__(size) __gu_size = (size);			\
>>  								\
>>  	__chk_user_ptr(__gu_addr);				\
>> -	if (do_allow && !is_kernel_addr((unsigned long)__gu_addr)) \
>> +	if (do_allow) {								\
>>  		might_fault();					\
>> -	if (do_allow)								\
>>  		__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err);	\
>> -	else									\
>> +	} else {									\
>>  		__get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err); \
>> +	}									\

One microscopic nit: these changes throw the '\'s further out of
alignment.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

>>  	(x) = (__typeof__(*(ptr)))__gu_val;			\
>>  								\
>>  	__gu_err;						\
>> -- 
>> 2.25.0
