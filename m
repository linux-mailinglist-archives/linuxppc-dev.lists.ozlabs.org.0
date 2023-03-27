Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 021E56CA681
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 15:53:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlZ6X6Tv5z3fSR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 00:53:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ONNKO03g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlZ5f5C9zz3ccn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 00:53:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ONNKO03g;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PlZ5d0H0jz4x5c;
	Tue, 28 Mar 2023 00:53:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1679925189;
	bh=TJxyA8ujdADIkY8VZ48F5mj79sUdnQouvkgZCgQhCb0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ONNKO03g9tDX03f7nB/Jocn1qJwc8ZQHTPX3EnjHFTjeKsKHeqPplpPTfQp2buRu+
	 Q8PaGsAsoRqhMqhtKq95pdQq9RJDqzHf/HJQWW8GUHuFyJBkkxocTGtV2R9gOaUV9J
	 jc4khherOTFrkSQhBz8RPH4fBiP03cn7Xl/4o86PQvHqXc1NOma1tA/34YkCtIBk/j
	 pODWDlaqxA8/j43qg4MB3TxGMVtP4cN6lWOtNNoMpZ9JMc0aLw7VQ/t1FVK84ogvEk
	 1n+lthIXVThskz3GoVN4q7S4Nx2r6cgG8X8Bga+gwCJInJuppbCB0WiXw7qzN24qd/
	 ujGRRXrLejhTQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jens Axboe <axboe@kernel.dk>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Memory coherency issue with IO thread offloading?
In-Reply-To: <872a1b2b-5fe6-e1ac-5dda-dc806b21b3f5@kernel.dk>
References: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
 <87h6u9u0e0.fsf@mpe.ellerman.id.au>
 <872a1b2b-5fe6-e1ac-5dda-dc806b21b3f5@kernel.dk>
Date: Tue, 28 Mar 2023 00:53:04 +1100
Message-ID: <87zg7ycncv.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jens Axboe <axboe@kernel.dk> writes:
> On 3/24/23 6:42?PM, Michael Ellerman wrote:
>> Jens Axboe <axboe@kernel.dk> writes:
>>> I got a report sent to me from mariadb, in where 5.10.158 works fine and
>>> 5.10.162 is broken. And in fact, current 6.3-rc also fails the test
>>> case. Beware that this email is long, as I'm trying to include
>>> everything that may be relevant...
>>>
>>> The test case in question is pretty simple. On debian testing, do:
>>>
>>> $ sudo apt-get install mariadb-test
>>> $ cd /usr/share/mysql/mysql-test
>>> $ ./mtr --mysqld=--innodb-flush-method=fsync --mysqld=--innodb-use-native-aio=1 --vardir=/dev/shm/mysql  --force encryption.innodb_encryption,innodb,undo0 --repeat=200
>> 
>> I mostly use Fedora, the package name is the same but the mtr binary
>> ends up in /usr/share/mysql.
>> 
>>> and if it fails, you'll see something like:
>>>
>>> encryption.innodb_encryption 'innodb,undo0' [ 6 pass ]   3120
>>> encryption.innodb_encryption 'innodb,undo0' [ 7 pass ]   3123
>>> encryption.innodb_encryption 'innodb,undo0' [ 8 pass ]   3042
>>> encryption.innodb_encryption 'innodb,undo0' [ 9 fail ]
>>>         Test ended at 2023-03-23 16:55:17
>> 
>> I haven't been able to get this to fail yet. I've done several runs with
>> --repeat=500 and haven't seen any errors yet.
>> 
>> Are there any CONFIG options I'd need to trip this?
>
> I don't think you need any special CONFIG options. I'll attach my config
> here, and I know the default distro one hits it too. But perhaps the
> mariadb version is not new enough? I think you need 10.6 or above, as
> will use io_uring by default. What version are you running?

Yeah I had 10.5.

I ended up building mariadb git, and now I have it reproducing on one VM
I have.

For some reason I can't reproduce with the same setup on a bare metal
machine, which is odd.

...
>> My first guess would be that there's some missing barriers between the
>> thread that queues the IO and the IO worker thread. 
>
> That was my guess too, and I consulted Paul McKenney as well on that.
> And he had some ideas of course, in terms of ordering of the CQ ring.
> But tried it all out, and it still failed in the same way...
>
>> I think you're using schedule_work() for that though, which should be a
>> full barrier. Could it be on the completion side?
>
> queue_work() for the patch, before that it's io-wq which is an internal
> IO thread worker pool. The latter just needs a spin_lock() around
> queueing the work, and then a wake of the task. Typing this out, maybe
> this is where a barrier is now missing? If the IO thread is already
> running rather than sleeping?

It sounded promising, but I've tried adding barriers around all the spin
locks and it hasn't made any difference.

Are there barriers in the userspace code also? If so would they be in
liburing or in the actual mariadb code?

Possibly I'm completely wrong about barriers and it's something else,
but I can't think what.

I checked that the liburing tests are passing. Any idea what mariadb is
doing different that's likely to be triggering the bug?

cheers
