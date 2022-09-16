Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 825E05BA6E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 08:35:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTPTg3M6lz3bZP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 16:35:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R22+W/rh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTPT12JLvz2xGS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 16:35:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R22+W/rh;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MTPSz220jz4x1V;
	Fri, 16 Sep 2022 16:35:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663310115;
	bh=CNWGK8FX+4/V7GudawraX30/jXFZpdNNX6P58q+APdg=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=R22+W/rh+IfEVNUq+HUtW3niPFOl6B6HTX2Wqvw8xTAO5rahUBj+MXc1nvlWf6E5i
	 mUYc/BPrsDO48hyflxbLLZ8qjdlL5sZc/leYylSZiP6R1W62Oa9g8Do4OpISqDzIp2
	 qB/rCI9OTt+5FPtkd496VCLf6u6ItyrsE24DRM617KxRLZdVtFV23id57J4hh2s6GA
	 Y5X9iyjUfHOLrKoJ4UveRLlgJx5iE2beyRmu0zhGNs3IjFkahrDFFxpWQbSZgQft94
	 YP1P0bAex2fZj+uBGrTJW1EzG7Z940849bMxRBJbCyfkRtc49lgr2Yh3LETWjI8ak3
	 85gnuQXj8UxJQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/7] powerpc: move __end_rodata to cover arch read-only
 sections
In-Reply-To: <CMXEFN5FQ3F8.3QA0U4XPG6JN0@bobo>
References: <20220914154746.1122482-1-npiggin@gmail.com>
 <20220914154746.1122482-3-npiggin@gmail.com>
 <877d24n6rt.fsf@mpe.ellerman.id.au> <CMXEFN5FQ3F8.3QA0U4XPG6JN0@bobo>
Date: Fri, 16 Sep 2022 16:35:14 +1000
Message-ID: <87zgezltct.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nicholas Piggin" <npiggin@gmail.com> writes:
> On Thu Sep 15, 2022 at 10:47 PM AEST, Michael Ellerman wrote:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>> > powerpc has a number of read-only sections and tables that are put
>> > after RO_DATA(). Move the __end_rodata symbol to cover these as well.
>> >
>> > Setting memory to read-only at boot is done using __init_begin,
>> > change that that to use __end_rodata.
>>
>> Did you just do that because it seems logical?
>
> I actually was looking at moving init so runtime code and data is
> closer.
>
>> Because it does seem logical, but it leaves a RWX region in the gap
>> between __end_rodata and __init_begin, which is bad.
>>
>> This is the current behaviour, on radix:
>>
>> ---[ Start of kernel VM ]---
>> 0xc000000000000000-0xc000000001ffffff  0x0000000000000000        32M         r      X   pte  valid  present        dirty  accessed
>> 0xc000000002000000-0xc00000007fffffff  0x0000000002000000      2016M         r  w       pte  valid  present        dirty  accessed
>>
>> And with your change:
>>
>> ---[ Start of kernel VM ]---
>> 0xc000000000000000-0xc0000000013fffff  0x0000000000000000        20M         r      X   pte  valid  present        dirty  accessed
>> 0xc000000001400000-0xc000000001ffffff  0x0000000001400000        12M         r  w   X   pte  valid  present        dirty  accessed
>> 0xc000000002000000-0xc00000007fffffff  0x0000000002000000      2016M         r  w       pte  valid  present        dirty  accessed
>>
>>
>> On radix the 16M alignment is larger than we need, but we need to chose
>> a value at build time that works for radix and hash.
>>
>> We could make the code smarter on radix, to mark those pages in between
>> __end_rodata and __init_begin as RW_ and use them for data. But that
>> would be a more involved change.
>
> Ah, yes Christophe pointed out it's broken too. We could just align
> __end_rodata to STRICT_ALIGN_SIZE for this patch?

Yeah that should work.

I'd be happier if we had something more explicit to document that
boundary, I'll send a patch.

cheers
