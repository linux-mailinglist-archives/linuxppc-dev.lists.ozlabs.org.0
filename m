Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DC76C89B2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 01:43:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pk0gY4VJzz3fTf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 11:43:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RMcAAWmW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pk0fc1TBKz3fBH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 11:42:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RMcAAWmW;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pk0fb5xNqz4x7y;
	Sat, 25 Mar 2023 11:42:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1679704967;
	bh=CYADz3ezbshhsohzl6aDpA9MeBOy4YiFAKlHG8NcNOo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RMcAAWmWeXCA0nIQq8VQCu8OQBBTKenReLHjpECvH0YZNnMzmvtv2AXZrq5RAfFva
	 pD8IJ7GENR9Wjl3aoH36jo4UzHf5hZiidlkqXW621ZJ6QY+BhUHERgE868mqR3rdrW
	 O7I9FIEeaMVVlgTrbjvDhsenSvFxaVIlU+bCzBbnhgBa+B5DWo/Mi2kzy+W1Ct3eam
	 g9Og+so2iz3Rjr9usKrwDS1Qin4nEZalsfNFUM3mS0vrSNZ4ds7VI6nYrHgdGQAKiW
	 uFY+KlEsdoQ6FsII2n+s1dWZodIPbpnAd8pAX6HrEki1YJvvYD7nOyTnHBcuhg6c1h
	 HOfVlish4P3mw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jens Axboe <axboe@kernel.dk>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Memory coherency issue with IO thread offloading?
In-Reply-To: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
References: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
Date: Sat, 25 Mar 2023 11:42:47 +1100
Message-ID: <87h6u9u0e0.fsf@mpe.ellerman.id.au>
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
> Hi,

Hi Jens,

Thanks for the report.

> I got a report sent to me from mariadb, in where 5.10.158 works fine and
> 5.10.162 is broken. And in fact, current 6.3-rc also fails the test
> case. Beware that this email is long, as I'm trying to include
> everything that may be relevant...
>
> The test case in question is pretty simple. On debian testing, do:
>
> $ sudo apt-get install mariadb-test
> $ cd /usr/share/mysql/mysql-test
> $ ./mtr --mysqld=--innodb-flush-method=fsync --mysqld=--innodb-use-native-aio=1 --vardir=/dev/shm/mysql  --force encryption.innodb_encryption,innodb,undo0 --repeat=200

I mostly use Fedora, the package name is the same but the mtr binary
ends up in /usr/share/mysql.

> and if it fails, you'll see something like:
>
> encryption.innodb_encryption 'innodb,undo0' [ 6 pass ]   3120
> encryption.innodb_encryption 'innodb,undo0' [ 7 pass ]   3123
> encryption.innodb_encryption 'innodb,undo0' [ 8 pass ]   3042
> encryption.innodb_encryption 'innodb,undo0' [ 9 fail ]
>         Test ended at 2023-03-23 16:55:17

I haven't been able to get this to fail yet. I've done several runs with
--repeat=500 and haven't seen any errors yet.

Are there any CONFIG options I'd need to trip this?

...
> Today I finally gave up and ran a basic experiment, which simply
> offloads the writes to a kthread. Since powerpc has an interesting
> memory coherency model, my suspicion was that the work involved with
> switching MMs for the kthread could just be the main difference here.
> The patch is really dumb and simple - rather than queue the write to an
> IO thread, it just offloads it to a kthread that then does
> kthread_use_mm(), perform write with the same write handler,
> kthread_unuse_mm(). AND THIS WORKS! Usually the above mtr test would
> fail in 2..20 loops, I've now done 200 and 500 loops and it's fine.

Can you share the patch that does that? It would help me track down
where exactly in the io_uring code you're talking about.

> Which then leads me to the question, what about the IO thread offload
> makes this fail on powerpc (and no other arch I've tested on, including
> x86/x86-64/aarch64/hppa64)? The offload should be equivalent to having a
> thread in userspace in the application, and having that thread just
> perform the writes. Is there some magic involved with the kthread mm
> use/unuse that makes this sufficiently consistent on powerpc? I've tried
> any mix of isync()/mb and making the flush_dcache_page() unconditionally
> done in the filemap read/write helpers, and it still falls flat on its
> face with the offload to an IO thread.

My first guess would be that there's some missing barriers between the
thread that queues the IO and the IO worker thread. 

I think you're using schedule_work() for that though, which should be a
full barrier. Could it be on the completion side?

I can't think of any magic in kthread_use_mm() other than extra
barriers. In particular kthread_unuse_mm() has an
smp_mb__after_spinlock() which is a full memory barrier on powerpc but
is a nop on some other architectures, x86 at least.

> I must clearly be missing something here, which is why I'm emailing the
> powerpc Gods for help :-)

Unfortunately the true God of powerpc memory ordering has left us and
ascended into the Metaverse ;)

cheers
