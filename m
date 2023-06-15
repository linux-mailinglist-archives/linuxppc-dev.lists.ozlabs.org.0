Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF20D730D73
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 05:10:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pX1pi6rJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhS2n3Wcpz300t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 13:10:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pX1pi6rJ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhS1s5T5Hz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 13:09:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QhS1q39Tyz4wj9;
	Thu, 15 Jun 2023 13:09:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1686798559;
	bh=eXxt1sPWIWdDmJmw2LO00dTprEK6R4O6Y1+/n/DtWLA=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=pX1pi6rJlMoCI3x29/TEz5fsvFLHasHxOtPfrTRlJHRrRu4BGeLN7y7hKQJ6IzNr4
	 xj8VxbFr/MoTSSHK8pFZdWu5ZYMNmRik7Q2lLVta/HuVhLgh8E4vzGLnFjZuEVNYL2
	 yr/yFfnTX6aROnxxwismf0todNjA/3Vv9X8QKeV0csfEZlpGqsUSea7CaP10a0Wxai
	 1M1sv1xYBeq6ar5uE5JHaCT6O84y23qux/yw8QOE/yB/LiPmMwU0FmrU5QMIk+xqCZ
	 HXnVmY2w0Jq2eTJzmgM9O8tC38NwB3bnQlpc+aSe0qmsz0qaKUWE/embNtpU+hDljS
	 BFpY6T5azvTnw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/4] powerpc/64s: Use POWER10 stsync barrier for wmb()
In-Reply-To: <CTCUKC30VVC4.KMUHD1RN0W79@wheely>
References: <20230609100026.8946-1-npiggin@gmail.com>
 <20230609100026.8946-4-npiggin@gmail.com> <87wn07foos.fsf@mail.lhotse>
 <87ttvafuxi.fsf@mail.lhotse> <CTCUKC30VVC4.KMUHD1RN0W79@wheely>
Date: Thu, 15 Jun 2023 13:09:19 +1000
Message-ID: <87leglfmlc.fsf@mail.lhotse>
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
> On Wed Jun 14, 2023 at 3:56 PM AEST, Michael Ellerman wrote:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>> > Nicholas Piggin <npiggin@gmail.com> writes:
>> >> The most expensive ordering for hwsync to provide is the store-load
>> >> barrier, because all prior stores have to be drained to the caches
>> >> before subsequent instructions can complete.
>> >>
>> >> stsync just orders stores which means it can just be a barrer that
>> >> goes down the store queue and orders draining, and does not prevent
>> >> completion of subsequent instructions. So it should be faster than
>> >> hwsync.
>> >>
>> >> Use stsync for wmb(). Older processors that don't recognise the SC
>> >> field should treat this as hwsync.
>> >
>> > qemu (7.1) emulating ppc64e does not :/
>> >
>> >   mpic: Setting up MPIC " OpenPIC  " version 1.2 at fe0040000, max 1 CPUs
>> >   mpic: ISU size: 256, shift: 8, mask: ff
>> >   mpic: Initializing for 256 sources
>> >   Oops: Exception in kernel mode, sig: 4 [#1]
>> ..
>> >
>> > I guess just put it behind an #ifdef 64S.
>>
>> That doesn't work because qemu emulating a G5 also doesn't accept it.
>>
>> So either we need to get qemu updated and wait a while for that to
>> percolate, or do some runtime patching of wmbs in the kernel >_<
>
> Gah, sorry. QEMU really should be ignoring reserved fields in
> instructions :(

Yeah, it's an annoying discrepancy vs real hardware and the ISA.

> I guess leave it out for now. Should fix QEMU but we probably also need
> to do patching so as not to break older QEMUs.

I'll plan to take the first 3 patches, they seem OK as-is.

cheers
