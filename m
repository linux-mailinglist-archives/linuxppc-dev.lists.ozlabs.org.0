Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FCD788072
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 09:00:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MuX3sYZm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RX9nT0RStz3cCr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 17:00:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MuX3sYZm;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RX9mb5K5Gz300f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 16:59:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692946767;
	bh=XrZZdCb4kEPgFY291tVmpWomtWhcCVj2wXLBrYPOU4E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MuX3sYZmwkt/jmFpfuUYkKbF/nSC7GuOSYEI1AoXQ0/88y8SmCQ5NRcqSGj2er4Cz
	 YUUsjrjJCPAYyH/XLweWF74bsRZje8qiz4Z4xmH0O6EianvFsdBK64HQjjYPRSO7Cp
	 Y0vNvR1IATFdjtZOTnlsCr7UwR/+LCWxYaReRKt9rd5PRw4WXWohchHZ6CTzzYozBY
	 vKL7sxXWdXodSU1bHOEELwxpy9eapnsq2DlsS2+9bUBrK7W7Gj+NSOG1fnr7JZ9R3o
	 bKRrG09MF9Glo2U8U8wJRl4OhRglQJrxgTYbRbQs0gOzVVavW04TuD1p95bSECnjNl
	 /s7itSsM0MNxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RX9mb0Rqbz4wxQ;
	Fri, 25 Aug 2023 16:59:27 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 4/4] powerpc/64s: Use POWER10 stsync barrier for wmb()
In-Reply-To: <CACPK8Xeq3G2g2nY1_Wm32tB0JyfS5k+=YAjQNom3x=cc2Qs7mA@mail.gmail.com>
References: <20230609100026.8946-1-npiggin@gmail.com>
 <20230609100026.8946-4-npiggin@gmail.com> <87wn07foos.fsf@mail.lhotse>
 <87ttvafuxi.fsf@mail.lhotse> <CTCUKC30VVC4.KMUHD1RN0W79@wheely>
 <87leglfmlc.fsf@mail.lhotse> <87fs48vdw6.fsf@mail.lhotse>
 <87cyzcvdux.fsf@mail.lhotse>
 <CACPK8Xeq3G2g2nY1_Wm32tB0JyfS5k+=YAjQNom3x=cc2Qs7mA@mail.gmail.com>
Date: Fri, 25 Aug 2023 16:59:23 +1000
Message-ID: <877cpjvc8k.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Stanley <joel@jms.id.au> writes:
> On Thu, 24 Aug 2023 at 12:12, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>> > Michael Ellerman <mpe@ellerman.id.au> writes:
>> >> "Nicholas Piggin" <npiggin@gmail.com> writes:
>> >>> On Wed Jun 14, 2023 at 3:56 PM AEST, Michael Ellerman wrote:
>> >>>> Michael Ellerman <mpe@ellerman.id.au> writes:
>> >>>> > Nicholas Piggin <npiggin@gmail.com> writes:
>> >>>> >> The most expensive ordering for hwsync to provide is the store-load
>> >>>> >> barrier, because all prior stores have to be drained to the caches
>> >>>> >> before subsequent instructions can complete.
>> >>>> >>
>> >>>> >> stsync just orders stores which means it can just be a barrer that
>> >>>> >> goes down the store queue and orders draining, and does not prevent
>> >>>> >> completion of subsequent instructions. So it should be faster than
>> >>>> >> hwsync.
>> >>>> >>
>> >>>> >> Use stsync for wmb(). Older processors that don't recognise the SC
>> >>>> >> field should treat this as hwsync.
>> >>>> >
>> >>>> > qemu (7.1) emulating ppc64e does not :/
>> >>>> >
>> >>>> >   mpic: Setting up MPIC " OpenPIC  " version 1.2 at fe0040000, max 1 CPUs
>> >>>> >   mpic: ISU size: 256, shift: 8, mask: ff
>> >>>> >   mpic: Initializing for 256 sources
>> >>>> >   Oops: Exception in kernel mode, sig: 4 [#1]
>> >>>> ..
>> >>>> >
>> >>>> > I guess just put it behind an #ifdef 64S.
>> >>>>
>> >>>> That doesn't work because qemu emulating a G5 also doesn't accept it.
>> >>>>
>> >>>> So either we need to get qemu updated and wait a while for that to
>> >>>> percolate, or do some runtime patching of wmbs in the kernel >_<
>> >>>
>> >>> Gah, sorry. QEMU really should be ignoring reserved fields in
>> >>> instructions :(
>> >>
>> >> Yeah, it's an annoying discrepancy vs real hardware and the ISA.
>> >>
>> >>> I guess leave it out for now. Should fix QEMU but we probably also need
>> >>> to do patching so as not to break older QEMUs.
>> >>
>> >> I'll plan to take the first 3 patches, they seem OK as-is.
>> >
>> > I didn't do that in the end, because patch 2 suffers from the same
>>                                              ^
>>                                              3
>> > problem of not working on QEMU.
>
> Did we get a patch to fix this in to Qemu?

No. Nick might have looked at it but he hasn't posted anything AFAIK.

cheers
