Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2578F10F694
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 06:01:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RqZv3TSvzDqVC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 16:01:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RpVP2qh8zDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 15:12:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="TYjO+1/B"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47RpVN4pdRz9sPJ;
 Tue,  3 Dec 2019 15:12:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1575346364;
 bh=mDwLrVfgNbGCj+6i+eyO23EDw2kXl4PKfhu8/4hlKgg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TYjO+1/BsSLC8QH5cQ4nIy6TTdq7oCVNhmNJM4w26lSN0Adil1BeTrNK+bvfPxyrn
 xcoiLiS5Uh4p2Jn4g1fz9sO15gN6E1Wq6BTNFBB1XjmJCZVC866wDTWi+IC2U1CYw/
 BH27FipUBzp+sRxh12CtUS6fCHzO34PGahDlPXpfOSBJCyHJseQuGsImb/Y7+wi1Bk
 pQWbf9MAyIuOpIf0iBLIXvOwfnqeX4j8rgtcn+GDBvPuTAvPO1IU37ARrOsfpO8olS
 +jJ4gXl15CCjcfhRZRlAUoJXOWCwgw4nvmji30hSKzYP9B0vprST7KH2fOlKEA/kt+
 SKfK5Et0KDW5w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Frank Rowand <frowand.list@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
In-Reply-To: <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
Date: Tue, 03 Dec 2019 15:12:44 +1100
Message-ID: <87tv6idp37.fsf@mpe.ellerman.id.au>
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Frank Rowand <frowand.list@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Frank Rowand <frowand.list@gmail.com> writes:
> On 11/29/19 9:10 AM, Sebastian Andrzej Siewior wrote:
>> I've been looking at phandle_cache and noticed the following: The raw
>> phandle value as generated by dtc starts at zero and is incremented by
>> one for each phandle entry. The qemu pSeries model is using Slof (which
>> is probably the same thing as used on real hardware) and this looks like
>> a poiner value for the phandle.
>> With
>> 	qemu-system-ppc64le -m 16G -machine pseries -smp 8 
>> 
>> I got the following output:
>> | entries: 64
>> | phandle 7e732468 slot 28 hash c
>> | phandle 7e732ad0 slot 10 hash 27
>> | phandle 7e732ee8 slot 28 hash 3a
>> | phandle 7e734160 slot 20 hash 36
>> | phandle 7e734318 slot 18 hash 3a
>> | phandle 7e734428 slot 28 hash 33
>> | phandle 7e734538 slot 38 hash 2c
>> | phandle 7e734850 slot 10 hash e
>> | phandle 7e735220 slot 20 hash 2d
>> | phandle 7e735bf0 slot 30 hash d
>> | phandle 7e7365c0 slot 0 hash 2d
>> | phandle 7e736f90 slot 10 hash d
>> | phandle 7e737960 slot 20 hash 2d
>> | phandle 7e738330 slot 30 hash d
>> | phandle 7e738d00 slot 0 hash 2d
>> | phandle 7e739730 slot 30 hash 38
>> | phandle 7e73bd08 slot 8 hash 17
>> | phandle 7e73c2e0 slot 20 hash 32
>> | phandle 7e73c7f8 slot 38 hash 37
>> | phandle 7e782420 slot 20 hash 13
>> | phandle 7e782ed8 slot 18 hash 1b
>> | phandle 7e73ce28 slot 28 hash 39
>> | phandle 7e73d390 slot 10 hash 22
>> | phandle 7e73d9a8 slot 28 hash 1a
>> | phandle 7e73dc28 slot 28 hash 37
>> | phandle 7e73de00 slot 0 hash a
>> | phandle 7e73e028 slot 28 hash 0
>> | phandle 7e7621a8 slot 28 hash 36
>> | phandle 7e73e458 slot 18 hash 1e
>> | phandle 7e73e608 slot 8 hash 1e
>> | phandle 7e740078 slot 38 hash 28
>> | phandle 7e740180 slot 0 hash 1d
>> | phandle 7e740240 slot 0 hash 33
>> | phandle 7e740348 slot 8 hash 29
>> | phandle 7e740410 slot 10 hash 2
>> | phandle 7e740eb0 slot 30 hash 3e
>> | phandle 7e745390 slot 10 hash 33
>> | phandle 7e747b08 slot 8 hash c
>> | phandle 7e748528 slot 28 hash f
>> | phandle 7e74a6e0 slot 20 hash 18
>> | phandle 7e74aab0 slot 30 hash b
>> | phandle 7e74f788 slot 8 hash d
>> | Used entries: 8, hashed: 29
>> 
>> So the hash array has 64 entries out which only 8 are populated. Using
>> hash_32() populates 29 entries.
>> Could someone with real hardware verify this?
>> I'm not sure how important this performance wise, it looks just like a
>> waste using only 1/8 of the array.
>
> The hash used is based on the assumptions you noted, and as stated in the
> code, that phandle property values are in a contiguous range of 1..n
> (not starting from zero), which is what dtc generates.

> We knew that for systems that do not match the assumptions that the hash
> will not be optimal.

If we're going to have the phandle cache it should at least make some
attempt to work across the systems that Linux supports.

> Unless there is a serious performance problem for
> such systems, I do not want to make the phandle hash code more complicated
> to optimize for these cases.  And the pseries have been performing ok
> without phandle related performance issues that I remember hearing since
> before the cache was added, which could have only helped the performance.
> Yes, if your observations are correct, some memory is being wasted, but
> a 64 entry cache is not very large on a pseries.

A single line change to use an actual hash function is hardly
complicating it, compared to the amount of code already there.

cheers
