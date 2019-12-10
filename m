Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F001C1188CD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 13:49:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XKcx2TTZzDqcW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 23:49:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AGaM03rJ"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XKYq3JXxzDqZH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 23:46:21 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id x7so8847595pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 04:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0RJ9gOA6O4Gv2PmI1ZeznCe4B5gXlbgOZ+kRt1JJlWA=;
 b=AGaM03rJG2HvZgtroua9DONqlW0TCJEGAn0tgzJ1p3K/e6c66dn+mLz1bNWOpnlsNi
 ield6vWnLrPrMHs6r6xtSTkFNCe8/FdKZzPIL9R4f7upA8GkkhcZ8DqvVb/zE8fkJXRM
 tXQt97dpECuSIZW1sPWumefp9f4PrPDw/qfYyJcPyLCPprlrP5EfWl2/uQH0luALQlrf
 J7JLJoqTZmbmwff339HV5oS0dMv3I+GVIWfglx/1yn7H+UMUCsumcSY5FpXbD2wkQeN2
 4r8/5j4VbHT0SPjA4aFsZxhp3v/2dE1Wq3jyoeKmwSY2EGKRDaW/FjIlFqJve6UEfFul
 gKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0RJ9gOA6O4Gv2PmI1ZeznCe4B5gXlbgOZ+kRt1JJlWA=;
 b=TbGAE5dDUJnULl0uobJFyn8b8hI0Gl6U4y3yup/0NIVQYd0k5kEHzVS2l/LsastvhB
 1wrV7l7Ixrvx6ajv/nVV7Nx9Gk5xng8jxVe7Iq8/i0aOTfXxFj9MpuzLq2OcwmMQHytk
 h+m6/QZ/laGKmQHmGBcl5iojg1ZevCTgr9z6sUGvkd+WMfhOGmP9RyknrMCBarvcA7md
 HWqooSlfF5CbBfnV4en5RyiS0IpnXei+7RmJ23KAtQD0UNp0CrbYwIKp5Xzvdns2dQK2
 aHkJ3RWz6WoP9OOEHb5zsJvEHtr5NBps8QXoFu0rX08aQWmLAvGpMtCBTJnZI1LzKYyR
 Dzyg==
X-Gm-Message-State: APjAAAWV3NyM/pYsGihDk6GMxW820+HXa86k0BS7sY2PP3nRy/a+L4BU
 NzlcLQuE90j//Cp6FCYGr8k=
X-Google-Smtp-Source: APXvYqyWc0ec2Q8xLT/YvvzRe07Ppkdx7eIhxEjhKuJDc2LYUl4PMRFYdR2r0ioGM2RVNhMyvu8tRg==
X-Received: by 2002:a63:604:: with SMTP id 4mr25213550pgg.406.1575981977596;
 Tue, 10 Dec 2019 04:46:17 -0800 (PST)
Received: from [10.231.110.95] ([125.29.25.186])
 by smtp.gmail.com with ESMTPSA id s18sm3315511pfh.47.2019.12.10.04.46.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Dec 2019 04:46:17 -0800 (PST)
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
From: Frank Rowand <frowand.list@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
 <87tv6idp37.fsf@mpe.ellerman.id.au>
 <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com>
 <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
 <20191205163538.mzunfrpox7jbrssl@linutronix.de>
 <084ed924-eaed-5232-a9f6-fe60128fe11a@gmail.com>
 <20191209133531.ykkknqmeeb36rv7l@linutronix.de>
 <CAL_JsqLVJi_v9yD5khLUvJHDEXFj=eXFf-CHXz30y0mYojt-Yg@mail.gmail.com>
 <c2334575-fa38-eb73-bb56-21a530e773bf@gmail.com>
Message-ID: <174936b9-bd2c-8850-aa8f-f4c605b0f1d5@gmail.com>
Date: Tue, 10 Dec 2019 06:46:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c2334575-fa38-eb73-bb56-21a530e773bf@gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: devicetree@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/10/19 2:17 AM, Frank Rowand wrote:
> On 12/9/19 7:51 PM, Rob Herring wrote:
>> On Mon, Dec 9, 2019 at 7:35 AM Sebastian Andrzej Siewior
>> <bigeasy@linutronix.de> wrote:
>>>
>>> On 2019-12-05 20:01:41 [-0600], Frank Rowand wrote:
>>>> Is there a memory usage issue for the systems that led to this thread?
>>>
>>> No, no memory issue led to this thread. I was just testing my patch and
>>> I assumed that I did something wrong in the counting/lock drop/lock
>>> acquire/allocate path because the array was hardly used. So I started to
>>> look deeper…
>>> Once I figured out everything was fine, I was curious if everyone is
>>> aware of the different phandle creation by dtc vs POWER. And I posted
>>> the mail in the thread.
>>> Once you confirmed that everything is "known / not an issue" I was ready
>>> to take off [0].
>>>
>>> Later more replies came in such as one mail [1] from Rob describing the
>>> original reason with 814 phandles. _Here_ I was just surprised that 1024
>>> were used over 64 entries for a benefit of 60ms. I understand that this
>>> is low concern for you because that memory is released if modules are
>>> not enabled. I usually see that module support is left enabled.
>>>
>>> However, Rob suggested / asked about the fixed size array (this is how I
>>> understood it):
>>> |And yes, as mentioned earlier I don't like the complexity. I didn't
>>> |from the start and I'm  I'm still of the opinion we should have a
>>> |fixed or 1 time sized true cache (i.e. smaller than total # of
>>> |phandles). That would solve the RT memory allocation and locking issue
>>> |too.
>>>
>>> so I attempted to ask if we should have the fixed size array maybe
>>> with the hash_32() instead the mask. This would make my other patch
>>> obsolete because the fixed size array should not have a RT issue. The
>>> hash_32() part here would address the POWER issue where the cache is
>>> currently not used efficiently.
>>>
>>> If you want instead to keep things as-is then this is okay from my side.
>>> If you want to keep this cache off on POWER then I could contribute a
>>> patch doing so.
>>
>> It turns out there's actually a bug in the current implementation. If
>> we have multiple phandles with the same mask, then we leak node
>> references if we miss in the cache and re-assign the cache entry.
> 
> Aaargh.  Patch sent.
> 
>> Easily fixed I suppose, but holding a ref count for a cached entry
>> seems wrong. That means we never have a ref count of 0 on every node
>> with a phandle.
> 
> It will go to zero when the cache is freed.
> 
> My memory is that we free the cache as part of removing an overlay.  I'll
> verify whether my memory is correct.

And I'll look at non-overlay use of dynamic devicetree too.

-Frank

> 
> -Frank
> 
> 
>>
>> I've done some more experiments with the performance. I've come to the
>> conclusion that just measuring boot time is not a good way at least if
>> the time is not a significant percentage of the total. I couldn't get
>> any measurable data. I'm using a RK3399 Rock960 board. It has 190
>> phandles. I get about 1500 calls to of_find_node_by_phandle() during
>> boot. Note that about the first 300 are before we have any timekeeping
>> (the prior measurements also would not account for this). Those calls
>> have no cache in the current implementation and are cached in my
>> implementation.
>>
>> no cache:  20124 us
>> current cache: 819 us
>>
>> new cache (64 entry): 4342 us
>> new cache (128 entry): 2875 us
>> new cache (256 entry): 1235 us
>>
>> To get some idea on the time spent before timekeeping is up, if we
>> take the avg miss time is ~17us (20124/1200), then we're spending
>> about ~5ms on lookups before the cache is enabled. I'd estimate the
>> new cache takes ~400us before timekeeping is up as there's 11 misses
>> early.
>>
>> >From these numbers, it seems the miss rate has a significant impact on
>> performance for the different sizes. But taken from the original 20+
>> ms, they all look like good improvement.
>>
>> Rob
>>
> 
> 

