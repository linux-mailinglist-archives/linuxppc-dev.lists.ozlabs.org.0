Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 372CD6D7A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 02:11:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qWdf4l73zDqhb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 10:11:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="0EAYC1tR"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qWbf1Cx3zDqfH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 10:10:04 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id f5so4784085pgu.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 17:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fFoYMXbgkLyImkyiPR85e/LWs0d1ApwxQXfa0WN+oEE=;
 b=0EAYC1tRo8ME/2G3iSq7FtnpcVhybbdcYHddpWCWAeLXa3tjYucjA+Q9MWulSm2IN3
 D6/8c2bYhweapxKcISQ+gOB5YdefwYGDQ7B/RiSY52fgUtMzMRIs5NXU9KCf20n/tPao
 Y/giYLnCqn1V/kbTF8RW1bmqRaxOkBHfvtGWrrWwp01Z1PnVShxZRXV2M66SKXWUDetE
 qjz+q+GdhQ+4oaO4BnwtVFbcv1BtxK+7Z/ni5LEcjO+rYWxMI7awKaJZoGOEFBsDy3lY
 BNLt90jcY885u2imdndNgrJsgmvu/1n8E0+JR8Ywb47x/TIAc5QvDPsbnZl/EJ+cCabk
 Ytlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fFoYMXbgkLyImkyiPR85e/LWs0d1ApwxQXfa0WN+oEE=;
 b=RNfBUsxfjBdmDq5KICzWGu5dqmcsJXkO963yDF5E38UZIJFYEjA2MMNeFmkIADhi3X
 e17dinQfJr4P9STQYrMxWuNDWYOQp9v/KBi5GYWXk9fihjYK1BKC50fYaJNwvID651hM
 2Z5mgP46Z/BzR8xbZCcSU3s7Yp/TGy381ADPs1OOKcj0E2Zxe3z4ItqxSpM/nJG4cSfE
 0ZC5BPKy5/SacueAy3BvmEhp8LPUuwvFwsNdL6K7yzqAeOAlk2vPwidMWnnyJLdNpaCo
 COnvXuIA+XjK/MQ+c/6iKGmk+oYuKDzWbVdT2/Uy9SeYd7owiZzX7KLF9pVpyg5hbUYq
 XgVA==
X-Gm-Message-State: APjAAAWLmV4rQ3FisRVmdx+7/QE2oVVGCidx6ja6jtxDod4/UAIukSrs
 BfEZ7gfUzw0dsnm94upNSXs=
X-Google-Smtp-Source: APXvYqzpYHWrPvsO31+ael8IJn2Nps6aYiIVECtFcMVCZg+Aa+th0QJmhwSh9oqlQafyybQhD/Vgkw==
X-Received: by 2002:a63:f941:: with SMTP id q1mr51054323pgk.350.1563495002829; 
 Thu, 18 Jul 2019 17:10:02 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id f12sm25771388pgo.85.2019.07.18.17.09.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 17:10:01 -0700 (PDT)
Subject: Re: [PATCH v2 03/13] powerpc/prom_init: Add the ESM call to prom_init
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <20190713060023.8479-1-bauerman@linux.ibm.com>
 <20190713060023.8479-4-bauerman@linux.ibm.com>
 <70f8097f-7222-fe18-78b4-9372c21bfc9d@ozlabs.ru>
 <20190718195850.GU20882@gate.crashing.org>
 <875znz3ud7.fsf@morokweng.localdomain>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <f4cba627-8c40-ce95-0ede-b01edf3546dc@ozlabs.ru>
Date: Fri, 19 Jul 2019 10:09:56 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <875znz3ud7.fsf@morokweng.localdomain>
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Mike Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 19/07/2019 07:28, Thiago Jung Bauermann wrote:
> 
> Hello Segher,
> 
> Thanks for your review and suggestions!
> 
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> 
>> (Sorry to hijack your reply).
>>
>> On Thu, Jul 18, 2019 at 06:11:48PM +1000, Alexey Kardashevskiy wrote:
>>> On 13/07/2019 16:00, Thiago Jung Bauermann wrote:
>>>> From: Ram Pai <linuxram@us.ibm.com>
>>>> +static int enter_secure_mode(unsigned long kbase, unsigned long fdt)
>>>> +{
>>>> +	register uint64_t func asm("r3") = UV_ESM;
>>>> +	register uint64_t arg1 asm("r4") = (uint64_t)kbase;
>>>> +	register uint64_t arg2 asm("r5") = (uint64_t)fdt;
>>>
>>> What does UV do with kbase and fdt precisely? Few words in the commit
>>> log will do.


What about this one? :)


>>>
>>>> +
>>>> +	asm volatile("sc 2\n"
>>>> +		     : "=r"(func)
>>>> +		     : "0"(func), "r"(arg1), "r"(arg2)
>>>> +		     :);
>>>> +
>>>> +	return (int)func;
>>>
>>> And why "func"? Is it "function"? Weird name. Thanks,
> 
> Yes, I believe func is for function. Perhaps ucall would be clearer
> if the variable wasn't reused for the return value as Segher points out.
> 
>> Maybe the three vars should just be called "r3", "r4", and "r5" --
>> r3 is used as return value as well, so "func" isn't a great name for it.
> 
> Yes, that does seem simpler.
> 
>> Some other comments about this inline asm:
>>
>> The "\n" makes the generated asm look funny and has no other function.
>> Instead of using backreferences you can use a "+" constraint, "inout".
>> Empty clobber list is strange.
>> Casts to the return type, like most other casts, are an invitation to
>> bugs and not actually useful.
>>
>> So this can be written
>>
>> static int enter_secure_mode(unsigned long kbase, unsigned long fdt)
>> {
>> 	register uint64_t r3 asm("r3") = UV_ESM;
>> 	register uint64_t r4 asm("r4") = kbase;
>> 	register uint64_t r4 asm("r5") = fdt;
>>
>> 	asm volatile("sc 2" : "+r"(r3) : "r"(r4), "r"(r5));
>>
>> 	return r3;
>> }
> 
> I'll adopt your version, it is cleaner inded. Thanks for providing it!
> 
>> (and it probably should use u64 instead of both uint64_t and unsigned long?)
> 
> Almost all of prom_init.c uses unsigned long, with u64 in just a few
> places. uint64_t isn't used anywhere else in the file. I'll switch to
> unsigned long everywhere, since this feature is only for 64 bit.
> 

-- 
Alexey
