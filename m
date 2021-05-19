Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 798B3388F43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 15:38:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlYpy3yQ1z30DG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 23:38:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YzZGNzRN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YzZGNzRN; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlYpS2KcHz2yhF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 23:37:51 +1000 (AEST)
Received: by mail-qv1-xf32.google.com with SMTP id z1so6758051qvo.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 06:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YWIRPlMK16+RzCykbPBcngvEk4WSCNCvsGMUpXzHNrs=;
 b=YzZGNzRNmp4WdmSOxPiKo2tqmXM1FnA+cZr3Q6v9sCPpmvCgbmagVhwQrPPTWubwxf
 8bwWpUSBYp6rOAJu5tQRJQ0ylbrW16/0oPEAwP5lg2pbE0mOJk9vkgL/S5OQnyMHOZsY
 eFKg+bEwbr9CpSqLXfYWvqNssPDRHG7xuj6ovwlc87/Yti/H4W560vFUNaoupEv8x/3U
 dXHGxjLkLJt3TU7EGfB5AZAPd/43Ae3jAAU4M7ted4iF0ryCsK034dpuwcfRwSUJAVnf
 9cgjUQZP50gCPvF4ny+cGfWhnwPzRNd+s+Gfp6oTBkXCx2EHMJCahuF+Rjz7nNEQCsbr
 CsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YWIRPlMK16+RzCykbPBcngvEk4WSCNCvsGMUpXzHNrs=;
 b=uDP3ruCQw4N6pgTBuDK7XHmqYphSUx6V6Sp3v60nn/Hq725Xa5YbSF3mh/fY6z3H+X
 RM79/ASHXk1LLQKaANs9kk7sVnEJrnxqfQgpcMcyqZJAuUrRN8gMQhl8/PUAp1u+zTs9
 u+ZzZqWQcXMzNOBy12P6LJ0C1Y0ySdMY3t067T5voNrr2225jhBmsHkHr1BPZlmKQrmn
 0zzHda+glKAgwJ2wHsc2ht9goL2Di0KlWifkifd7YlOkGRvPD8gzz1w7ZyTzbuF9WW+I
 MJDyFdzWtfytV9LCweCZSdEmxWkAPxYow4ZorC3f+IgBS4tDFP+5vOOhn2LkSK/bCIDm
 73RA==
X-Gm-Message-State: AOAM5319PmvfHqiIQIQocnRdvPTH5gro/goytDrOIjdhtKteh0CrsjGj
 vT3jTW9BaM9yxt3We6zIcAmHryk9v8M=
X-Google-Smtp-Source: ABdhPJzaGN1oVVL29Ii9MlO6gyKUOEJPHBzF/3Jb4R5JFVqKi8U7chULNKkp8uI592WGsyY4nnqeaw==
X-Received: by 2002:a0c:b292:: with SMTP id r18mr13102237qve.57.1621431467692; 
 Wed, 19 May 2021 06:37:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q13sm15436194qkj.43.2021.05.19.06.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 06:37:47 -0700 (PDT)
Subject: Re: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines to
 take a page walk cache flush argument
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
 <20210515163525.GA1106462@roeck-us.net>
 <e0eba73a-c2df-71c3-e03d-d4074d908fca@linux.ibm.com>
 <d830fce9-c00a-e879-4115-94a2346a806f@roeck-us.net>
 <87pmxpqxb1.fsf@linux.ibm.com>
 <a7dd34f3-7d79-c933-fb62-eaad5c83d37a@roeck-us.net>
 <87a6ork1qp.fsf@mpe.ellerman.id.au>
 <20210519004514.GC10366@gate.crashing.org>
 <20210519120306.GD10366@gate.crashing.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <46cedc01-bca7-236d-9f74-a9cc24391512@roeck-us.net>
Date: Wed, 19 May 2021 06:37:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519120306.GD10366@gate.crashing.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/19/21 5:03 AM, Segher Boessenkool wrote:
> On Tue, May 18, 2021 at 07:45:14PM -0500, Segher Boessenkool wrote:
>> On Wed, May 19, 2021 at 10:26:22AM +1000, Michael Ellerman wrote:
>>> Guenter Roeck <linux@roeck-us.net> writes:
>>>> Ah, sorry. I wasn't aware that the following is valid C code
>>>>
>>>> void f1()
>>>> {
>>>>       return f2();
>>>>       ^^^^^^
>>>> }
>>>>
>>>> as long as f2() is void as well. Confusing, but we live and learn.
>>>
>>> It might be valid, but it's still bad IMHO.
>>>
>>> It's confusing to readers, and serves no useful purpose.
>>
>> And it actually explicitly is undefined behaviour in C90 already
>> (3.6.6.4 in C90, 6.8.6.4 in C99 and later).
> 
> ... but there is a GCC extension that allows this by default:
> <https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html#index-Wreturn-type>
>    For C only, warn about a 'return' statement with an expression in a
>    function whose return type is 'void', unless the expression type is
>    also 'void'.  As a GNU extension, the latter case is accepted
>    without a warning unless '-Wpedantic' is used.
> 

In C99:

"6.8.6.4 The return statement
Constraints

A return statement with an expression shall not appear in a function whose return type
is void. A return statement without an expression shall only appear in a function
whose return type is void."

Sounds like invalid to me, not just undefined behavior.

Guenter
