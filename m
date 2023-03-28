Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B9C6CBFCB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 14:52:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm8j43fbYz3fT0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 23:52:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n7WY03h7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm8h846Wbz3cBP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 23:51:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n7WY03h7;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pm8h6751bz4x1N;
	Tue, 28 Mar 2023 23:51:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680007895;
	bh=2xYnvpIojy2m8uGKmLwONyW24r4MJHAJIxhNz6CFRi8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n7WY03h7QryqLNZyBtz7YyqfWyR/UKo0QefzEh5OzUDkYs36W+NN/gej4NhM+U3aU
	 ZAbV2eiMjYrMsHqOyOe1OW5DKszDLYVQuz62zcZ78tmEmVNCfUEoLBpIyG8htARh7g
	 aXETu6PWoKmSxr/v0a9P8Og52ZkxGqLj6/rLqmo6ZvV1Xlm5kuAlfKwV/ttJABzpnA
	 tAjCWlcHyJzzJpscPkZ82O9HmBXaDLhGAEV/1M2w1sdBUHCW7DwLKyyQ3UhOZIV5R2
	 H4T1G6ONz83ncDoCi1WRtOdxMKHYgAcnnkskCt8VvhjxB6ZN7idvIL8ioBZP8AMQ7+
	 f5d4aKLtIbCyA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jens Axboe <axboe@kernel.dk>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Memory coherency issue with IO thread offloading?
In-Reply-To: <3ae396db-4aa3-c031-67a7-2df341214b5b@kernel.dk>
References: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
 <87h6u9u0e0.fsf@mpe.ellerman.id.au>
 <872a1b2b-5fe6-e1ac-5dda-dc806b21b3f5@kernel.dk>
 <9753c624-66e0-aace-6540-731cba9da864@kernel.dk>
 <CRGVMXJ46PPN.1VWRMA1IMPHW2@bobo>
 <6f32b504-ccd5-d67c-1b67-95d8fe1cf185@kernel.dk>
 <3ae396db-4aa3-c031-67a7-2df341214b5b@kernel.dk>
Date: Tue, 28 Mar 2023 23:51:34 +1100
Message-ID: <87a5zxca3t.fsf@mpe.ellerman.id.au>
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
Cc: daniel@mariadb.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jens Axboe <axboe@kernel.dk> writes:
>>> Can the  queueing cause the creation of an IO thread (if one does not
>>> exist, or all blocked?)
>> 
>> Yep
>> 
>> Since writing this email, I've gone through a lot of different tests.
>> Here's a rough listing of what I found:
>> 
>> - Like using the hack patch, if I just limit the number of IO thread
>>   workers to 1, it seems to pass. At least longer than before, does 1000
>>   iterations.
>> 
>> - If I pin each IO worker to a single CPU, it also passes.
>> 
>> - If I liberally sprinkle smp_mb() for the io-wq side, test still fails.
>>   I've added one before queueing the work item, and after. One before
>>   the io-wq worker grabs a work item and one after. Eg full hammer
>>   approach. This still fails.
>> 
>> Puzzling... For the "pin each IO worker to a single CPU" I added some
>> basic code around trying to ensure that a work item queued on CPU X
>> would be processed by a worker on CPU X, and too a large degree, this
>> does happen. But since the work list is a normal list, it's quite
>> possible that some other worker finishes its work on CPU Y just in time
>> to grab the one from cpu X. I checked and this does happen in the test
>> case, yet it still passes. This may be because I got a bit lucky, but
>> seems suspect with thousands of passes of the test case.
>> 
>> Another theory there is that it's perhaps related to an io-wq worker
>> being rescheduled on a different CPU. Though again puzzled as to why the
>> smp_mb sprinkling didn't fix that then. I'm going to try and run the
>> test case with JUST the io-wq worker pinning and not caring about where
>> the work is processed to see if that does anything.
>
> Just pinning each worker to whatever CPU they got created on seemingly
> fixes the issue too. This does not mean that each worker will process
> work on the CPU on which it was queued, just that each worker will
> remain on whatever CPU it originally got created on.
>
> Puzzling...
>
> Note that it is indeed quite possible that this isn't a ppc issue at
> all, just shows on ppc. It could be page cache related, or it could even
> be a bug in mariadb itself.

I tried binary patching every lwsync to hwsync (read/write to full
barrier) in mariadbd and all the libaries it links. It didn't fix the
problem.

I also tried switching all the kernel barriers/spin locks to using a
hwsync, but that also didn't fix it.

It's still possible there's somewhere that currently has no barrier at
all that needs one, the above would only fix the problem if we have a
read/write barrier that actually needs to be a full barrier.


I also looked at making all TLB invalidates broadcast, regardless of
whether we think the thread has only been on a single CPU. That didn't
help, but I'm not sure I got all places where we do TLB invalidates, so
I'll look at that some more tomorrow.

cheers
