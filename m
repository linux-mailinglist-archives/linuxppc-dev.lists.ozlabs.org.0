Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 316CA11E4D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 14:42:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZBg45MmszDrJB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 00:42:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="hmi5MJB7"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZBck3HfKzDqM5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 00:40:20 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id d199so1485606pfd.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 05:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=/eZlIcE4bRaQxd77WQWCVd4CAZbU8bs/M4S7Zue3IL0=;
 b=hmi5MJB7//OHKo5837yEOlibfIFDbAeAyzjogvIW/yoZXWya7liW884Pp8aTYUM2Ix
 CCTUr4D8OwNZy9ZD28XnCQ24o3k29nkh6AK+PxNHmUm9cTR9rN97k0esbF6a81knRYV0
 /H5Ochm9M6emXtAa5aQZRazKAcl6V7rhtq6IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=/eZlIcE4bRaQxd77WQWCVd4CAZbU8bs/M4S7Zue3IL0=;
 b=slV0xbEUW2no3VqRY570revGYRYN44qpnDlIQYv+D7ydkJmyJGnJ2occAapKcWA9MV
 Zd0srJhPI1cECCdD99IAICB6sCKvRZh7mn8H6T6w+sBs031759Y2P2PxJTr5no9h+B+c
 oFDhxbpC/8OTO0nAfvj6qnbntX1z+pq/jasnAcz2fvNWWpCdBe+wNyiu4vJ2/pV+V43C
 zVZfVLkRIiqnHCywIOJGjtTn7gyx3IE2MSllAGoacegV0jSBNnTspfTXFcgeR7rqZkF8
 7sGLfE3S1b5yuy/C7DiykEu/WtSowhb7V0c9EelwpBvRieZJ9r8JZEximyqYejlbtv3j
 6B+Q==
X-Gm-Message-State: APjAAAXjPn8D1tpCNcfnuz6lxh+EJ488gygF27goxRQiCFBsHp93umpN
 vDzn5KjnEmzr+2xzIgPKX0Skpg==
X-Google-Smtp-Source: APXvYqwy8PSjw8EEDkZW4PT0M9uPnhBRfPVSXSF/t1vCT9Ei+dnRB/Ar31P3ZfiyKfQxta3h5/BJfw==
X-Received: by 2002:a63:770c:: with SMTP id s12mr17493474pgc.25.1576244417558; 
 Fri, 13 Dec 2019 05:40:17 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-a426-f10f-bfc4-6b9c.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:a426:f10f:bfc4:6b9c])
 by smtp.gmail.com with ESMTPSA id i4sm9547075pjd.19.2019.12.13.05.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 05:40:16 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: Re: [PATCH 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
In-Reply-To: <464a8b50-0d4c-b1ea-485b-851f7cd7643b@c-s.fr>
References: <20190806233827.16454-1-dja@axtens.net>
 <20190806233827.16454-5-dja@axtens.net>
 <372df444-27e7-12a7-0bdb-048f29983cf4@c-s.fr>
 <878snkdauf.fsf@dja-thinkpad.axtens.net>
 <464a8b50-0d4c-b1ea-485b-851f7cd7643b@c-s.fr>
Date: Sat, 14 Dec 2019 00:40:13 +1100
Message-ID: <87mubwbayq.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

>>>>    - We run a lot of code at boot in real mode. This includes stuff like
>>>>      printk(), so it's not feasible to just disable instrumentation
>>>>      around it.
>>>
>>> Have you definitely given up the idea of doing a standard implementation
>>> of KASAN like other 64 bits arches have done ?
>>>
>>> Isn't it possible to setup an early 1:1 mapping and go in virtual mode
>>> earlier ? What is so different between book3s64 and book3e64 ?
>>> On book3e64, we've been able to setup KASAN before printing anything
>>> (except when using EARLY_DEBUG). Isn't it feasible on book3s64 too ?
>> 
>> So I got this pretty wrong when trying to explain it. The problem isn't
>> that we run the code in boot as I said, it's that a bunch of the KVM
>> code runs in real mode.
>
> Ok.
>
> Does it mean we would be able to implement it the standard way when 
> CONFIG_KVM is not selected ?

I suppose, but KVM is pretty important to me!

>>>>    - disabled reporting when we're checking the stack for exception
>>>>      frames. The behaviour isn't wrong, just incompatible with KASAN.
>>>
>>> Does this applies to / impacts PPC32 at all ?
>> 
>> It should. I found that when doing stack walks, the code would touch
>> memory that KASAN hadn't unpoisioned. I'm a bit surprised you haven't
>> seen it arise, tbh.
>
> How do you trigger that ?
>
> I've tried to provoke some faults with LKDTM that provoke BUG dumps, but 
> it doesn't trip.
> I also performed task state listing via sysrq, and I don't get anything 
> wrong either.

I'll try to disable this and see if I can trigger it again.

>>>>    - Dropped old module stuff in favour of KASAN_VMALLOC.
>>>
>>> You said in the cover that this is done to avoid having to split modules
>>> out of VMALLOC area. Would it be an issue to perform that split ?
>>> I can understand it is not easy on 32 bits because vmalloc space is
>>> rather small, but on 64 bits don't we have enough virtual space to
>>> confortably split modules out of vmalloc ? The 64 bits already splits
>>> ioremap away from vmalloc whereas 32 bits have them merged too.
>> 
>> I could have done this. Maybe I should have done this. But now I have
>> done vmalloc space support.
>
> So you force the use of KASAN_VMALLOC ? Doesn't it have a performance 
> impact ?

It has a perfomance impact when allocating and freeing virtual address
space in the vmalloc region, yes. There should be no discernable impact
when using vmalloc space.

My team is actively working on vmap-stack support for ppc64, with the
end goal of running syzkaller with vmap-stack and kasan. vmap-stack plus
kasan requires kasan-vmalloc, so for my purposes doing things in this
order makes sense.

I'd be happy to have a later series introduce the split and then make
KASAN_VMALLOC optional. I would need to understand the implications of
splitting the address space from a KASLR point of view: I don't want to
accidentally overly restrict the available randomness.

Regards,
Daniel

>
> Christophe
