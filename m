Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A042116116
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Dec 2019 08:01:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Vy1555HGzDqQR
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Dec 2019 18:01:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pJ7FvOA3"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47VxzD0GDWzDqPS
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Dec 2019 18:00:05 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id bd4so4456982plb.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Dec 2019 23:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=joWCl9BKSpGB/115/n2GPxqk/jY1nElh0rbHXE4/v3I=;
 b=pJ7FvOA3R0+IKIzaq6caXcXIHAD0r2F052IFgCbmfXwBfa54IJlk1CdeBcbSCQ0fs6
 /j/xVmtEJ1xOFNhF91ymtm15xexC3tsT/N8GPls3asdEDsEpbJtssj86wUDE0H386766
 9uTbQuFU/hNLtNSqBF9l/xh/nPNzUZQDiSo/uL6Vnffq8HHw1xEZXoifQIQYKIJP9adS
 ck/FsifD7tEA4WzZ/53qpLAtpNJVcTw2WBSWt884tsR6jY5FraE9DpytK0N1EDjlNcL2
 fI7dfW4py5qUbXr32nrYa1zxNWKHStB3pFSAoOG3dFAwEqXYZ8Ohx6v9BPxUYvVpo6ig
 aWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=joWCl9BKSpGB/115/n2GPxqk/jY1nElh0rbHXE4/v3I=;
 b=R57678DURwENUr/mptO2JL4n+xjUkavhWT2Xw/sFlPL3TNNyZZVAK2ExLeXbIS0bs8
 xgeYxEPOdo03zluvIoy65IilJ2Fo37G5lRIgSR94/qLZnPKoJqq/BVaPbtyidPI9Wogg
 ildfrl0TIUBU77G8+qGC2TdiCkODp81oDwNDDVqeiiPYnKApsa23ztPpFmEEPdP55g14
 jZ7D1hNUrLraL6kfltCmiIP1nJNnnoX47O+RRvYO2dkAY37AJIznLAc7pZpljHILeYEt
 xgreia2hTEnWGCmzlO3AaWB1ovupXysZKeH82VC0DHgXhLu69G0zxAHABWA2DNXIHxcA
 2RSg==
X-Gm-Message-State: APjAAAXgQjUaxjxwAs8iXCiXFyFPBFA4gWlpQ6efKeDr9sfH7FnIULKc
 2348mCPDQSxGZPU6qj2RLVA=
X-Google-Smtp-Source: APXvYqxJcBhY5VKo6AuiTCL+UdgE9sULPH8pGVy1WSo4wcUvoEm3ndR3+zasQ+Dy7QM+WJF9CUOzwA==
X-Received: by 2002:a17:902:7c88:: with SMTP id
 y8mr10944451pll.104.1575788402636; 
 Sat, 07 Dec 2019 23:00:02 -0800 (PST)
Received: from [10.231.110.95] ([125.29.25.186])
 by smtp.gmail.com with ESMTPSA id in6sm5550923pjb.8.2019.12.07.22.59.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 Dec 2019 23:00:01 -0800 (PST)
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
From: Frank Rowand <frowand.list@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
 <87tv6idp37.fsf@mpe.ellerman.id.au>
 <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com>
 <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
 <d5adf331-bf5a-0582-8bb3-fa35e96b3fd1@gmail.com>
Message-ID: <656d2efe-454c-c1bd-adce-0528d953d7ee@gmail.com>
Date: Sun, 8 Dec 2019 00:59:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d5adf331-bf5a-0582-8bb3-fa35e96b3fd1@gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: devicetree@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/5/19 7:52 PM, Frank Rowand wrote:
> On 12/3/19 10:56 AM, Rob Herring wrote:
>> On Mon, Dec 2, 2019 at 10:28 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>>
>>> On 12/2/19 10:12 PM, Michael Ellerman wrote:
>>>> Frank Rowand <frowand.list@gmail.com> writes:
>>>>> On 11/29/19 9:10 AM, Sebastian Andrzej Siewior wrote:
>>>>>> I've been looking at phandle_cache and noticed the following: The raw
>>>>>> phandle value as generated by dtc starts at zero and is incremented by
>>>>>> one for each phandle entry. The qemu pSeries model is using Slof (which
>>>>>> is probably the same thing as used on real hardware) and this looks like
>>>>>> a poiner value for the phandle.
>>>>>> With
>>>>>>     qemu-system-ppc64le -m 16G -machine pseries -smp 8
>>>>>>
>>>>>> I got the following output:
>>>>>> | entries: 64
>>>>>> | phandle 7e732468 slot 28 hash c
>>>>>> | phandle 7e732ad0 slot 10 hash 27
>>>>>> | phandle 7e732ee8 slot 28 hash 3a
>>>>>> | phandle 7e734160 slot 20 hash 36
>>>>>> | phandle 7e734318 slot 18 hash 3a
>>>>>> | phandle 7e734428 slot 28 hash 33
>>>>>> | phandle 7e734538 slot 38 hash 2c
>>>>>> | phandle 7e734850 slot 10 hash e
>>>>>> | phandle 7e735220 slot 20 hash 2d
>>>>>> | phandle 7e735bf0 slot 30 hash d
>>>>>> | phandle 7e7365c0 slot 0 hash 2d
>>>>>> | phandle 7e736f90 slot 10 hash d
>>>>>> | phandle 7e737960 slot 20 hash 2d
>>>>>> | phandle 7e738330 slot 30 hash d
>>>>>> | phandle 7e738d00 slot 0 hash 2d
>>>>>> | phandle 7e739730 slot 30 hash 38
>>>>>> | phandle 7e73bd08 slot 8 hash 17
>>>>>> | phandle 7e73c2e0 slot 20 hash 32
>>>>>> | phandle 7e73c7f8 slot 38 hash 37
>>>>>> | phandle 7e782420 slot 20 hash 13
>>>>>> | phandle 7e782ed8 slot 18 hash 1b
>>>>>> | phandle 7e73ce28 slot 28 hash 39
>>>>>> | phandle 7e73d390 slot 10 hash 22
>>>>>> | phandle 7e73d9a8 slot 28 hash 1a
>>>>>> | phandle 7e73dc28 slot 28 hash 37
>>>>>> | phandle 7e73de00 slot 0 hash a
>>>>>> | phandle 7e73e028 slot 28 hash 0
>>>>>> | phandle 7e7621a8 slot 28 hash 36
>>>>>> | phandle 7e73e458 slot 18 hash 1e
>>>>>> | phandle 7e73e608 slot 8 hash 1e
>>>>>> | phandle 7e740078 slot 38 hash 28
>>>>>> | phandle 7e740180 slot 0 hash 1d
>>>>>> | phandle 7e740240 slot 0 hash 33
>>>>>> | phandle 7e740348 slot 8 hash 29
>>>>>> | phandle 7e740410 slot 10 hash 2
>>>>>> | phandle 7e740eb0 slot 30 hash 3e
>>>>>> | phandle 7e745390 slot 10 hash 33
>>>>>> | phandle 7e747b08 slot 8 hash c
>>>>>> | phandle 7e748528 slot 28 hash f
>>>>>> | phandle 7e74a6e0 slot 20 hash 18
>>>>>> | phandle 7e74aab0 slot 30 hash b
>>>>>> | phandle 7e74f788 slot 8 hash d
>>>>>> | Used entries: 8, hashed: 29
>>>>>>
>>>>>> So the hash array has 64 entries out which only 8 are populated. Using
>>>>>> hash_32() populates 29 entries.
>>>>>> Could someone with real hardware verify this?
>>>>>> I'm not sure how important this performance wise, it looks just like a
>>>>>> waste using only 1/8 of the array.
>>>>>
>>>>> The hash used is based on the assumptions you noted, and as stated in the
>>>>> code, that phandle property values are in a contiguous range of 1..n
>>>>> (not starting from zero), which is what dtc generates.
>>>>
>>>>> We knew that for systems that do not match the assumptions that the hash
>>>>> will not be optimal.
>>>>
>>>> If we're going to have the phandle cache it should at least make some
>>>> attempt to work across the systems that Linux supports.
>>>>
>>>>> Unless there is a serious performance problem for
>>>>> such systems, I do not want to make the phandle hash code more complicated
>>>>> to optimize for these cases.  And the pseries have been performing ok
>>>>> without phandle related performance issues that I remember hearing since
>>>>> before the cache was added, which could have only helped the performance.
>>>>> Yes, if your observations are correct, some memory is being wasted, but
>>>>> a 64 entry cache is not very large on a pseries.
>>>>
>>>> A single line change to use an actual hash function is hardly
>>>> complicating it, compared to the amount of code already there.
>>>
>>> With a dtc generated devicetree, the hash is perfect, with no
>>> misses.  That single line change then makes the hash bad for
>>> dtc generated devicetrees.
>>
>> To quantify that, I did some tests with the hash algo and it's about a
>> 10% collision rate using phandle values of 1-$cache_size. There's
>> never more than 2 phandles colliding in a slot. The actual impact
>> would be less given 100% thrashing seems unlikely.

I also tested a few cache sizes.

For cache size 64 entries, I get a 14% collision rate (and also 14% of
entries unused).  For 1024 entries, I get a 12% collision rate.  And
I can confirm no more than two phandles hashing to the same slot.

So essentially confirming your data.

-Frank

> 
> Thank you for doing the tests.  Actual data helps a lot.
> 
> If there is only a 10% collision rate for this case, that does not
> sound bad to me.  There is the possibility of current or future
> code resulting in ping ponging between two phandle values which
> collide in the cache, but that should not be the common case.
> 
> However, given a choice between two algorithms, one of which
> guarantees no thrashing (the current cache algorithm) and one
> which allows a pathologic use case which results in thrashing,
> I prefer the first algorithm.  This may seem theoretical, but
> I have seen enough pathological code paths in my years of
> performance analysis and tuning to be sensitive to this issue.
> 
>>
>>> The cache was added to address a problem with a system with a
>>> dtc generated devicetree.
>>
>> The cache was added to address a problem with a system with a large
>> number of nodes and phandles (814 phandles in the reported case). dtc
>> happens to be used in that case.
> 
> Yes, you stated that in a more general way than I did.  Agreed.
> 
> 
>>
>>> I had not heard of any phandle
>>> lookup performance issues on ppc systems.  An imperfect hash
>>> for ppc should not make the ppc performance worse (unless
>>> every single phandle value hashes to a single bucket).  So
>>> the ppc performance is likely better than it was before
>>> the hash was added, even without an optimal hash algorithm.
>>>
>>> So the change would not be a single line change.  It would
>>> be a change to use different hash algorithms for dtc
>>> generated device trees versus other device trees.
>>>
>>> Another possibility would be to make the cache be dependent
>>> upon not CONFIG_PPC.  It might be possible to disable the
>>> cache with a minimal code change.
>>
>> I'd rather not do that.
> 
> I also agree with that.  I threw that out as kind of a nuclear option.
> If ppc did not benefit from the cache having been implemented and
> perceived a negative impact from the cache, this is simply a way
> to remove that negative impact.  Then ppc would be in the same
> state as before we implemented the cache.  Again, I also do not
> like such a special casing.
> 
>>
>> And yes, as mentioned earlier I don't like the complexity. I didn't
>> from the start and I'm  I'm still of the opinion we should have a
>> fixed or 1 time sized true cache (i.e. smaller than total # of
>> phandles). That would solve the RT memory allocation and locking issue
>> too.
> 
> I could be convinced to go to a one time sized cache, especially now
> that the RT issue exists.  If we change to that, it would be documented
> as a possible overhead impact that devicetree overlays would have to
> accept.
> 
> -Frank
> 
>>
>> For reference, the performance difference between the current
>> implementation (assuming fixes haven't regressed it) was ~400ms vs. a
>> ~340ms improvement with a 64 entry cache (using a mask, not a hash).
>> IMO, 340ms improvement was good enough.
>>
>> Rob
>>
> 
> 

