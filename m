Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F131786ECB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 14:12:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pP2a+hXH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWhlt2tLlz3cSQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 22:12:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pP2a+hXH;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWhl066Qhz2yVT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 22:11:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692879084;
	bh=MGQ67KaG+pdwAHe836HL3Ri6yNVw0TKr4bpJ5vxxzGM=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=pP2a+hXH9ie4NOvV2cf3Imf+ns44iC6usknWnPsvuip25EEM8PQiFUHkHwcw/zbhR
	 3qpTR4ppR+q/GCi++MokVFE+XwwBOIRTg9gXDfiyk6yOrT5TfrOYYaZGG1DJ53PLcu
	 nslPVIT0JQxCU37QUcz2GaEKZLRR+lkkiUFsm7hjXBB147HI3oill7amHivClKjbPi
	 j+8UFGm+69VRa2e16zi3QZVmhKLhZIfBK9BDZs5TzvTRD+AABzbFTKSFuR2O8LHiXp
	 MJlPr0AXwRnRa0IjyoPhqnSuuyPoLeknOTbjT18ckWqpo1shUaNhFApBnYDT0ZoXHo
	 mPdvEHtBfVS5g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RWhl04RWdz4wb8;
	Thu, 24 Aug 2023 22:11:24 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/4] powerpc/64s: Use POWER10 stsync barrier for wmb()
In-Reply-To: <87leglfmlc.fsf@mail.lhotse>
References: <20230609100026.8946-1-npiggin@gmail.com>
 <20230609100026.8946-4-npiggin@gmail.com> <87wn07foos.fsf@mail.lhotse>
 <87ttvafuxi.fsf@mail.lhotse> <CTCUKC30VVC4.KMUHD1RN0W79@wheely>
 <87leglfmlc.fsf@mail.lhotse>
Date: Thu, 24 Aug 2023 22:11:21 +1000
Message-ID: <87fs48vdw6.fsf@mail.lhotse>
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

Michael Ellerman <mpe@ellerman.id.au> writes:
> "Nicholas Piggin" <npiggin@gmail.com> writes:
>> On Wed Jun 14, 2023 at 3:56 PM AEST, Michael Ellerman wrote:
>>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>> > Nicholas Piggin <npiggin@gmail.com> writes:
>>> >> The most expensive ordering for hwsync to provide is the store-load
>>> >> barrier, because all prior stores have to be drained to the caches
>>> >> before subsequent instructions can complete.
>>> >>
>>> >> stsync just orders stores which means it can just be a barrer that
>>> >> goes down the store queue and orders draining, and does not prevent
>>> >> completion of subsequent instructions. So it should be faster than
>>> >> hwsync.
>>> >>
>>> >> Use stsync for wmb(). Older processors that don't recognise the SC
>>> >> field should treat this as hwsync.
>>> >
>>> > qemu (7.1) emulating ppc64e does not :/
>>> >
>>> >   mpic: Setting up MPIC " OpenPIC  " version 1.2 at fe0040000, max 1 CPUs
>>> >   mpic: ISU size: 256, shift: 8, mask: ff
>>> >   mpic: Initializing for 256 sources
>>> >   Oops: Exception in kernel mode, sig: 4 [#1]
>>> ..
>>> >
>>> > I guess just put it behind an #ifdef 64S.
>>>
>>> That doesn't work because qemu emulating a G5 also doesn't accept it.
>>>
>>> So either we need to get qemu updated and wait a while for that to
>>> percolate, or do some runtime patching of wmbs in the kernel >_<
>>
>> Gah, sorry. QEMU really should be ignoring reserved fields in
>> instructions :(
>
> Yeah, it's an annoying discrepancy vs real hardware and the ISA.
>
>> I guess leave it out for now. Should fix QEMU but we probably also need
>> to do patching so as not to break older QEMUs.
>
> I'll plan to take the first 3 patches, they seem OK as-is.

I didn't do that in the end, because patch 2 suffers from the same
problem of not working on QEMU.

cheers
