Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0065838AD32
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 13:56:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm7WP6R5pz3bsG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 21:56:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tMou58N9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tMou58N9; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm7Vy3gP2z2xvc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 21:56:24 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id m13so12473720qtk.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4NwcGNbUiLWOZxk3Po/t8ltzFfv9Dmek7i9uGh5YXhs=;
 b=tMou58N9AsYp7b3didtdforKkhve5y6UEbSKe9s9y/TlxOj/Rgb07i/jT6K+OSXcXD
 NogA0utjZXXCu46qXSFt7fbeyIDmqp7VC0DpIouJzA/gcBb4b8oLwxxhEeE8G1Qd7Ca+
 Rgqvz3BeWv38aRsnVs0fTfbH52ZHb9+8qNUmri0jMSznuhnMS5gY2HXMPkcOUqjw8dLT
 Wwr6H3uofyYxmpMlFqw+BhtLFQoYtr+bzZALH1TcmsO2dKaXKNFvgSUKqMuGz+CV0qHw
 kFqrsU0fPgFpqRcVb4r4WFuv9Y44eQTX0luZoqGvF5svEYJaqEMWjSjJQ8ofU7tsi57c
 DmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4NwcGNbUiLWOZxk3Po/t8ltzFfv9Dmek7i9uGh5YXhs=;
 b=t4JAhO/1IfC9hvITRmyaY3RHNZtwYUA1v5Oz9ftqksuHkbgWZ9i/a5Nfrv9PgrJcAh
 iXgOPbLv5R7RmO5L7U9LvkUqeKkw6o7b0NUoV/cHx6R+Ne8ZcV4HgOqe9GFLLkipCtKH
 n2U5UV1IFUf9xyPwQPvlXMQL4zPaO/N2LJGk8Pg8egmeOjJXeXjxWu5mvfWnuiAQBNBi
 1If4gu4vr63Pz8dEEz7vhPZBvOlxfMKrqFm95AUU9kOnf2OdaVgSSiBaVEK/VQhy5t+h
 rCAiswN8QUxNdY5LQilUu7F5Q9VrG87kSJdqvVXk63jEMXi2WHXfioQHFhWfzRpQq1MU
 LyPQ==
X-Gm-Message-State: AOAM530PzeHevBfWvLHcJftgLLsKILidWilBsdnIhqPq8aZHmd5BM9ly
 z7/YEdvjJ6ov492hW7mTntY=
X-Google-Smtp-Source: ABdhPJwbtFMmRH/lQLxI0xaeHJA4iAHYjZ+u77Kze81ydq8mtfRcYReCgbscjlFfUq1VbMIJ2FPePA==
X-Received: by 2002:aed:2128:: with SMTP id 37mr4519811qtc.163.1621511780559; 
 Thu, 20 May 2021 04:56:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 j6sm1715403qti.4.2021.05.20.04.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 04:56:20 -0700 (PDT)
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
 <20210515163525.GA1106462@roeck-us.net>
 <e0eba73a-c2df-71c3-e03d-d4074d908fca@linux.ibm.com>
 <d830fce9-c00a-e879-4115-94a2346a806f@roeck-us.net>
 <87pmxpqxb1.fsf@linux.ibm.com>
 <a7dd34f3-7d79-c933-fb62-eaad5c83d37a@roeck-us.net>
 <87a6ork1qp.fsf@mpe.ellerman.id.au>
 <969f377f-fddb-c2de-781c-fde37d121a4d@roeck-us.net>
 <87wnrtiqjp.fsf@mpe.ellerman.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines to
 take a page walk cache flush argument
Message-ID: <52aa88b9-1f88-dc5f-c3f5-b7ead24e38df@roeck-us.net>
Date: Thu, 20 May 2021 04:56:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87wnrtiqjp.fsf@mpe.ellerman.id.au>
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
Cc: npiggin@gmail.com, linux-mm@kvack.org, kaleshsingh@google.com,
 joel@joelfernandes.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/20/21 4:38 AM, Michael Ellerman wrote:
> Guenter Roeck <linux@roeck-us.net> writes:
>> On 5/18/21 5:26 PM, Michael Ellerman wrote:
>> [ ... ]
>>>>> That was the generic header change in the patch. I was commenting about the
>>>>> ppc64 specific change causing build failures.
>>>>
>>>> Ah, sorry. I wasn't aware that the following is valid C code
>>>>
>>>> void f1()
>>>> {
>>>>        return f2();
>>>>        ^^^^^^
>>>> }
>>>>
>>>> as long as f2() is void as well. Confusing, but we live and learn.
>>>
>>> It might be valid, but it's still bad IMHO.
>>>
>>> It's confusing to readers, and serves no useful purpose.
>>>
>>
>> Agreed, but it is surprisingly wide-spread. Try to run the coccinelle
>> script below, just for fun. The script doesn't even catch instances
>> in include files, yet there are more than 450 hits.
> 
> Yikes, that is a lot.
> 
> I guess they're pretty harmless, but would be nice to clean them up
> eventually.
> 
> Why doesn't the script work for instances in headers?
> 

Ah, that is one of those Coccinelle details. No idea. I run the script with

make coccicheck COCCI="return-void.cocci" MODE=report M=.

Probably there is a better way to invoke it which does handle include files.

Guenter
