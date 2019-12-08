Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8212411604E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Dec 2019 05:32:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Vthh1v4fzDqVk
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Dec 2019 15:32:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="L3gVGeXR"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47VtfD6KJ5zDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Dec 2019 15:30:11 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id b9so4976122pgk.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Dec 2019 20:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=781PHwSm+/eYNey8e32dXuSLH7usiq4iiJyGRSA4Sbs=;
 b=L3gVGeXRlYTYTATfZf6LVpsH+8+kTbmU8FtxEpACxibl2pJH41HAfQZnq+jePkJRFQ
 L9XXqNDTC8L+KNlDFkXML2edqiPff+zXdDwoMTWj0IxrFZjDlynk3bkAqY7UFa+RTwaV
 m5SHOhHvmfMpcXc/q2RVSlDhLURmOW/DI6Q7wWaOIqVEvVznxpMeckISEIlbUQElpeD8
 EbfOa9LFLEe6cAYGYmTALGzXouEvxy3xsof+A6/A5UZ3jbF37E0vKmvpnYljMalRmGsz
 2mlpGieD11JGCZ0/kY6z4YtAz5lbsSmTSxUYYcOmKvXc+8TkG1qCg35beQDSqAGwub0k
 6mKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=781PHwSm+/eYNey8e32dXuSLH7usiq4iiJyGRSA4Sbs=;
 b=JBUAJCbQI04JI2J5uC4LCxYg6RCFb1thL1sI0ZnWvNO1XsKuaEt7aVdD07Mm6eUoMY
 OM4c/lcsLY5KvYWyTOkBTs9eHM1Z4g/EHX0Oy8mDtOD2R5/N49tg5kGZJT2lUZDkHUDm
 hNQAoJoKQuAIR1VtufLe5vixxe2QaMiZIwaZochVfVP2IzOLL5qnj0qLZxcGY6gnjogP
 WTDiY5a+Q4bMOMLJIkmw2vyodnUj/O164ApjdKb467XezvYEoxzOWfEmgkaYw5uUAiXf
 auJYfsNqvsWQUaA/9MM8NMGRuDrVttmY9T9EiAu+DEChS2RSnfdGar4FAPoZQElpFLBS
 MJoQ==
X-Gm-Message-State: APjAAAV1AUrVhvIEyknXpSdOPWxKtMEGSNNoYf7pkX5T+QfiXeypH+3o
 isqlgQWGNNbFxHbBIo48/pQ=
X-Google-Smtp-Source: APXvYqxl7KqZw+jNN3kWCNmOb/uJUayp/iyU9scOprFRkFoeoHaViuVl6YYUbpMSoaOVVXt9/Yig8Q==
X-Received: by 2002:a63:4b24:: with SMTP id y36mr12199800pga.176.1575779408324; 
 Sat, 07 Dec 2019 20:30:08 -0800 (PST)
Received: from [10.231.110.95] ([125.29.25.186])
 by smtp.gmail.com with ESMTPSA id d65sm21898652pfa.159.2019.12.07.20.30.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 Dec 2019 20:30:07 -0800 (PST)
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <87wobedpit.fsf@mpe.ellerman.id.au>
 <20191203183531.GT24609@gate.crashing.org>
 <493a7da7-774c-1515-b43a-80d72c9d3c19@gmail.com>
 <20191206234034.GW3152@gate.crashing.org>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <051776be-9247-1c00-3131-a68c3c7794b2@gmail.com>
Date: Sat, 7 Dec 2019 22:30:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191206234034.GW3152@gate.crashing.org>
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
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/6/19 5:40 PM, Segher Boessenkool wrote:
> Hi,
> 
> On Thu, Dec 05, 2019 at 07:37:24PM -0600, Frank Rowand wrote:
>> On 12/3/19 12:35 PM, Segher Boessenkool wrote:
>>> Btw.  Some OFs mangle the phandles some way, to make it easier to catch
>>> people using it as an address (and similarly, mangle ihandles differently,
>>> so you catch confusion between ihandles and phandles as well).  Like a
>>> simple xor, with some odd number preferably.  You should assume *nothing*
>>> about phandles, they are opaque identifiers.
>>
>> For arm32 machines that use dtc to generate the devicetree, which is a
>> very large user base, we certainly can make assumptions about phandles.
> 
> I was talking about OF.  Phandles are explicitly defined to be opaque
> tokens.  If there is an extra meaning to them in flattened device trees,
> well, the kernel should then only depend on that there, not for more
> general phandles.  Where is this documented btw?

And dtc generated devicetrees are a huge proportion of the OF systems.

It is not documented.

As an aside, overlays also depend upon the current dtc implementation.
If an extremely large value is used for a phandle then overlay
application will fail.


> 
>> Especially because the complaints about the overhead of phandle based
>> lookups have been voiced by users of this specific set of machines.
>>
>> For systems with a devicetree that does not follow the assumptions, the
>> phandle cache should not measurably increase the overhead of phandle
>> based lookups.
> 
> It's an extra memory access and extra code to execute, for not much gain
> (if anything).  While with a reasonable hash function it will be good
> for everyone.
> 
>> If you have measurements of a system where implementing the phandle
>> cache increased the overhead,
> 
> Are you seriously saying you think this code can run in zero time and
> space on most systems?

No.  I made no such claim.  Note the additional words in the following
sentences.


>> and the additional overhead is a concern
>> (such as significantly increasing boot time) then please share that
>> information with us.  Otherwise this is just a theoretical exercise.
> 
> The point is that this code could be easily beneficial for most (or all)
> users, not just those that use dtc-constructed device trees.  It is

The point is that the cache was implemented to solve a specific problem
for certain specific systems.  There had been a few reports of various
machines having the same issue, but finally someone measures a **significant**
improvement in boot time for a specific machine.  The boot time with
the cache was **measured** to be much shorter.  The boot time for all
systems with a dtc generated devicetree is expected to be faster.  No
one responded to the implementation when it was proposed with a
**measurement** that showed increased boot time.  A concern of using
more memory was raised and discussed, with at least on feature added
as a result (freeing the cache in late init if modules are not
enabled).

Being "beneficial for most (or all) users" has to be balanced against
whether the change would remove the benefit for the system that the
feature was originally implemented to solve a problem for.  There
was no performance data supplied to answer this question.  (Though
eventually Rob did some measurements of the impact on hash efficiency
for such a system.)


> completely obvious that having a worse cache hash function results in
> many more lookups.  Whether that results in something expressed as
> milliseconds on tiny systems or microseconds on bigger systems is
> completely beside the point.

There was no performance data accompanying the proposed change that
started this thread.  There was no data showing whether the systems
that this feature was created for would suffer.  There was no data
showing that the boot time of the pseries systems would improve.
There was no assertion made that too much memory was being used
by the cache (there was an implied assertion that a large
percentage of the memory used for the cache was not used, thus
the performance benefit of the cache could be improved by
changing to using a hash instead of mask).  We had rejected
creating a cache for several years until finally some solid
data was provided showing an actual need for it.

It is not a question of "milliseconds on tiny systems or
microseconds on bigger systems".  I agree with that.  But it
does matter whether the performance impact of various
implementations is large enough to either solve a problem
or create a problem.  On the other hand, if the amount of
memory used by the cache is a problem (which is _not_
what was asserted by the patch submitter) then we can have
a conversation about how to resolve that.

-Frank

> 
> 
> Segher
> 

