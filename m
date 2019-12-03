Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA6110F6A0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 06:08:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Rqkf3r6WzDqVp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 16:08:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l0jFSHDs"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Rprr2QFwzDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 15:28:44 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id bb5so1160243plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2019 20:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8P0w8KphPi6rSrjLTuNVBYxVFByFC+P3r7zINnUs9yo=;
 b=l0jFSHDsYFZrJ/3j/Urpo5WxfkgRi8/R1tPnVmM2caEP1VMwT48aKb9kjejbHYaOb2
 R86pPb1HcLcxs+sb5KAan4OgH/WM/SC7gvKXvzbBtlTDIG2LjJ6jEJuSjvxSee61vc44
 9+16aZZUZzN29ObOxeflZdw9b3p8N3SHrvp38KH1XZo1zj0P9kmiy8kjxx7KNaDDccrL
 GaHxI6YauyIKB7JAQpPjUrTNagZ9F98RGLfZ5QD1vowJUJvyiFBus70Ko+ND4Ri4fy8J
 mbm9CkCYJcvQtDR+jdpBtRNorenC26EJM3PHpXfxFEYejaGbltn2xpZllNNzqt90ebvy
 dXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8P0w8KphPi6rSrjLTuNVBYxVFByFC+P3r7zINnUs9yo=;
 b=U5OXxWJqao8UGJiwrSG/wno+kfiwg+96n16Nw9Qv6hLremgh9u1q7lXvs+6GO3/6HX
 8Y79N26uS7W7f2tG2sHd8IMgK95Rom82E4hL3npLh735emrNjdXVF8GGN9VcKtv+aQtB
 wpIj+qjcUcC95zaua2VsF+ocZX/2ch0WE/1x1Vxor0KARB6VLzCq+kGqXaQlqKG6nca6
 KNumO0crfLBqIQkEegL5EA1wTB8FSfJd2rli2XzEau9eD48nWMfGw3IbPRjQQRlF9LQp
 MICrP3ZsFcYVKSud+pC+poJwCOu/qYktPU7uX7EWVPphGcJjLZbKmEFWdaUFFLXDIcGt
 DjoA==
X-Gm-Message-State: APjAAAWJaW+l1n9ARoZjIVmVVB3tqnisHTLhiZ88gFL0mUr7IBoGNiJ6
 Zv/zniJaZL3gnEDbyIy+6NUYWVGM
X-Google-Smtp-Source: APXvYqzwqRAsSdznW4XG3Ui5vku/ABziTBOhdYEpqNTvUk+8U8iut83jQCqVLved3nwihcIYAsm47g==
X-Received: by 2002:a17:90a:ff12:: with SMTP id
 ce18mr532136pjb.117.1575347321896; 
 Mon, 02 Dec 2019 20:28:41 -0800 (PST)
Received: from ?IPv6:240d:1a:90a:7900:8c84:6439:19bd:b6b0?
 ([240d:1a:90a:7900:8c84:6439:19bd:b6b0])
 by smtp.gmail.com with ESMTPSA id q6sm1202357pfl.140.2019.12.02.20.28.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Dec 2019 20:28:41 -0800 (PST)
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
To: Michael Ellerman <mpe@ellerman.id.au>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
 <87tv6idp37.fsf@mpe.ellerman.id.au>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com>
Date: Mon, 2 Dec 2019 22:28:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87tv6idp37.fsf@mpe.ellerman.id.au>
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/2/19 10:12 PM, Michael Ellerman wrote:
> Frank Rowand <frowand.list@gmail.com> writes:
>> On 11/29/19 9:10 AM, Sebastian Andrzej Siewior wrote:
>>> I've been looking at phandle_cache and noticed the following: The raw
>>> phandle value as generated by dtc starts at zero and is incremented by
>>> one for each phandle entry. The qemu pSeries model is using Slof (which
>>> is probably the same thing as used on real hardware) and this looks like
>>> a poiner value for the phandle.
>>> With
>>> 	qemu-system-ppc64le -m 16G -machine pseries -smp 8 
>>>
>>> I got the following output:
>>> | entries: 64
>>> | phandle 7e732468 slot 28 hash c
>>> | phandle 7e732ad0 slot 10 hash 27
>>> | phandle 7e732ee8 slot 28 hash 3a
>>> | phandle 7e734160 slot 20 hash 36
>>> | phandle 7e734318 slot 18 hash 3a
>>> | phandle 7e734428 slot 28 hash 33
>>> | phandle 7e734538 slot 38 hash 2c
>>> | phandle 7e734850 slot 10 hash e
>>> | phandle 7e735220 slot 20 hash 2d
>>> | phandle 7e735bf0 slot 30 hash d
>>> | phandle 7e7365c0 slot 0 hash 2d
>>> | phandle 7e736f90 slot 10 hash d
>>> | phandle 7e737960 slot 20 hash 2d
>>> | phandle 7e738330 slot 30 hash d
>>> | phandle 7e738d00 slot 0 hash 2d
>>> | phandle 7e739730 slot 30 hash 38
>>> | phandle 7e73bd08 slot 8 hash 17
>>> | phandle 7e73c2e0 slot 20 hash 32
>>> | phandle 7e73c7f8 slot 38 hash 37
>>> | phandle 7e782420 slot 20 hash 13
>>> | phandle 7e782ed8 slot 18 hash 1b
>>> | phandle 7e73ce28 slot 28 hash 39
>>> | phandle 7e73d390 slot 10 hash 22
>>> | phandle 7e73d9a8 slot 28 hash 1a
>>> | phandle 7e73dc28 slot 28 hash 37
>>> | phandle 7e73de00 slot 0 hash a
>>> | phandle 7e73e028 slot 28 hash 0
>>> | phandle 7e7621a8 slot 28 hash 36
>>> | phandle 7e73e458 slot 18 hash 1e
>>> | phandle 7e73e608 slot 8 hash 1e
>>> | phandle 7e740078 slot 38 hash 28
>>> | phandle 7e740180 slot 0 hash 1d
>>> | phandle 7e740240 slot 0 hash 33
>>> | phandle 7e740348 slot 8 hash 29
>>> | phandle 7e740410 slot 10 hash 2
>>> | phandle 7e740eb0 slot 30 hash 3e
>>> | phandle 7e745390 slot 10 hash 33
>>> | phandle 7e747b08 slot 8 hash c
>>> | phandle 7e748528 slot 28 hash f
>>> | phandle 7e74a6e0 slot 20 hash 18
>>> | phandle 7e74aab0 slot 30 hash b
>>> | phandle 7e74f788 slot 8 hash d
>>> | Used entries: 8, hashed: 29
>>>
>>> So the hash array has 64 entries out which only 8 are populated. Using
>>> hash_32() populates 29 entries.
>>> Could someone with real hardware verify this?
>>> I'm not sure how important this performance wise, it looks just like a
>>> waste using only 1/8 of the array.
>>
>> The hash used is based on the assumptions you noted, and as stated in the
>> code, that phandle property values are in a contiguous range of 1..n
>> (not starting from zero), which is what dtc generates.
> 
>> We knew that for systems that do not match the assumptions that the hash
>> will not be optimal.
> 
> If we're going to have the phandle cache it should at least make some
> attempt to work across the systems that Linux supports.
> 
>> Unless there is a serious performance problem for
>> such systems, I do not want to make the phandle hash code more complicated
>> to optimize for these cases.  And the pseries have been performing ok
>> without phandle related performance issues that I remember hearing since
>> before the cache was added, which could have only helped the performance.
>> Yes, if your observations are correct, some memory is being wasted, but
>> a 64 entry cache is not very large on a pseries.
> 
> A single line change to use an actual hash function is hardly
> complicating it, compared to the amount of code already there.

With a dtc generated devicetree, the hash is perfect, with no
misses.  That single line change then makes the hash bad for
dtc generated devicetrees.

The cache was added to address a problem with a system with a
dtc generated devicetree.  I had not heard of any phandle
lookup performance issues on ppc systems.  An imperfect hash
for ppc should not make the ppc performance worse (unless
every single phandle value hashes to a single bucket).  So
the ppc performance is likely better than it was before
the hash was added, even without an optimal hash algorithm.

So the change would not be a single line change.  It would
be a change to use different hash algorithms for dtc
generated device trees versus other device trees.

Another possibility would be to make the cache be dependent
upon not CONFIG_PPC.  It might be possible to disable the
cache with a minimal code change.

> 
> cheers
> 

