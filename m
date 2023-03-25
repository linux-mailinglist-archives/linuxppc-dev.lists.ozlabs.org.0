Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9759D6C89D8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 02:16:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pk1Px3dZYz3fTn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 12:16:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=idtblCAE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=idtblCAE;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pk1Ny6pQWz3c7d
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 12:16:01 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so6689910pjt.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 18:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1679706959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R9nE2yD8SzNrsevjDEr08T0eaLspgD2Wxyr3K5Js1nc=;
        b=idtblCAEnaFxi6N4kTpRytKPWlsvsOBU6WUd1wGcFvochS8h78I3oosnLWdhHmvMmR
         mYrjPjQuXWkwqw++zNhvSIErFSgLuEkCqPxwdCMU5hhhlRqAWXTlFOnpDUlfIaH/OrRo
         d31/SwosRcTSsA+/WUNWDo4uiH49gXz9v/IIPjQujYXMvRHhCGJUzHYylDMboh16g+J+
         jZfOyRcIMCjc0xRNfX6ip6GSZz+8Uwci2xqj3FRRDz9X+k54ZX3nOGGm+tiExqNXXkvf
         QBX/CbbrRKfYlNv2ZCldpPJw9AaZZ4opU0M0s20F9jPwSwAZ794QgZe+s6mDFYzIHgff
         4RBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679706959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R9nE2yD8SzNrsevjDEr08T0eaLspgD2Wxyr3K5Js1nc=;
        b=kunxunPlopyN3FiE+WsKc2XbxLhHRJgzBWP8Jkm71US3llCajNhKCySpNrVGufw78B
         jluUQvPjnUXPHxFYQEm9aSpL/ckfXlsU3Cs40O38z4LJ7AP1Sz8ozqPdJonMJ2CC1GFT
         D5dNOIAE/hJ8imJphysomnlaSj42K9nkx4L4AZMi3cGXpFpbPhAGpA8FexlTOEqkQuII
         fMG67RJe9ZEQS3sXJu05ewCtIrd1CGQuVhIcU+E85J7bz4FF37t4evF9fCs2m7RaSaa2
         7r33h9SS9/R61dlTRhK+F7Scm9c7dFoBkLfq4XH81KRbcb92h57oKJbQJmQBK4VCnEal
         16fg==
X-Gm-Message-State: AAQBX9fMWFyAupEjfhR2N8XE0go171keDMFkZPNODTsy4WW8/KwdJL8R
	MutV6r959Ii3yrVdEvnyxOtyAA==
X-Google-Smtp-Source: AKy350bQpk0res/7yNt4NG2YV4N9mD3pO3KWyNWrlkyPplfaDA2BSAJUfbj+/K6HJ83bQQJ6r3lLQw==
X-Received: by 2002:a17:902:ecd1:b0:1a0:53ba:ff1f with SMTP id a17-20020a170902ecd100b001a053baff1fmr4197367plh.0.1679706959073;
        Fri, 24 Mar 2023 18:15:59 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id x17-20020a170902ea9100b001a1c00317b0sm11765694plb.273.2023.03.24.18.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 18:15:58 -0700 (PDT)
Message-ID: <872a1b2b-5fe6-e1ac-5dda-dc806b21b3f5@kernel.dk>
Date: Fri, 24 Mar 2023 19:15:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Memory coherency issue with IO thread offloading?
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
References: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
 <87h6u9u0e0.fsf@mpe.ellerman.id.au>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87h6u9u0e0.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/24/23 6:42?PM, Michael Ellerman wrote:
> Jens Axboe <axboe@kernel.dk> writes:
>> Hi,
> 
> Hi Jens,
> 
> Thanks for the report.
> 
>> I got a report sent to me from mariadb, in where 5.10.158 works fine and
>> 5.10.162 is broken. And in fact, current 6.3-rc also fails the test
>> case. Beware that this email is long, as I'm trying to include
>> everything that may be relevant...
>>
>> The test case in question is pretty simple. On debian testing, do:
>>
>> $ sudo apt-get install mariadb-test
>> $ cd /usr/share/mysql/mysql-test
>> $ ./mtr --mysqld=--innodb-flush-method=fsync --mysqld=--innodb-use-native-aio=1 --vardir=/dev/shm/mysql  --force encryption.innodb_encryption,innodb,undo0 --repeat=200
> 
> I mostly use Fedora, the package name is the same but the mtr binary
> ends up in /usr/share/mysql.
> 
>> and if it fails, you'll see something like:
>>
>> encryption.innodb_encryption 'innodb,undo0' [ 6 pass ]   3120
>> encryption.innodb_encryption 'innodb,undo0' [ 7 pass ]   3123
>> encryption.innodb_encryption 'innodb,undo0' [ 8 pass ]   3042
>> encryption.innodb_encryption 'innodb,undo0' [ 9 fail ]
>>         Test ended at 2023-03-23 16:55:17
> 
> I haven't been able to get this to fail yet. I've done several runs with
> --repeat=500 and haven't seen any errors yet.
> 
> Are there any CONFIG options I'd need to trip this?

I don't think you need any special CONFIG options. I'll attach my config
here, and I know the default distro one hits it too. But perhaps the
mariadb version is not new enough? I think you need 10.6 or above, as
will use io_uring by default. What version are you running?

> ...
>> Today I finally gave up and ran a basic experiment, which simply
>> offloads the writes to a kthread. Since powerpc has an interesting
>> memory coherency model, my suspicion was that the work involved with
>> switching MMs for the kthread could just be the main difference here.
>> The patch is really dumb and simple - rather than queue the write to an
>> IO thread, it just offloads it to a kthread that then does
>> kthread_use_mm(), perform write with the same write handler,
>> kthread_unuse_mm(). AND THIS WORKS! Usually the above mtr test would
>> fail in 2..20 loops, I've now done 200 and 500 loops and it's fine.
> 
> Can you share the patch that does that? It would help me track down
> where exactly in the io_uring code you're talking about.

Shoot yes, I actually meant to attach it but then forgot. Below!

>> Which then leads me to the question, what about the IO thread offload
>> makes this fail on powerpc (and no other arch I've tested on, including
>> x86/x86-64/aarch64/hppa64)? The offload should be equivalent to having a
>> thread in userspace in the application, and having that thread just
>> perform the writes. Is there some magic involved with the kthread mm
>> use/unuse that makes this sufficiently consistent on powerpc? I've tried
>> any mix of isync()/mb and making the flush_dcache_page() unconditionally
>> done in the filemap read/write helpers, and it still falls flat on its
>> face with the offload to an IO thread.
> 
> My first guess would be that there's some missing barriers between the
> thread that queues the IO and the IO worker thread. 

That was my guess too, and I consulted Paul McKenney as well on that.
And he had some ideas of course, in terms of ordering of the CQ ring.
But tried it all out, and it still failed in the same way...

> I think you're using schedule_work() for that though, which should be a
> full barrier. Could it be on the completion side?

queue_work() for the patch, before that it's io-wq which is an internal
IO thread worker pool. The latter just needs a spin_lock() around
queueing the work, and then a wake of the task. Typing this out, maybe
this is where a barrier is now missing? If the IO thread is already
running rather than sleeping?

> I can't think of any magic in kthread_use_mm() other than extra
> barriers. In particular kthread_unuse_mm() has an
> smp_mb__after_spinlock() which is a full memory barrier on powerpc but
> is a nop on some other architectures, x86 at least.

Yeah, I did poke at kthread_use_mm() and the related powerpc bits, but
didn't immediately find anything that seemed promising in this regard.

>> I must clearly be missing something here, which is why I'm emailing the
>> powerpc Gods for help :-)
> 
> Unfortunately the true God of powerpc memory ordering has left us and
> ascended into the Metaverse ;)

;-)

-- 
Jens Axboe

