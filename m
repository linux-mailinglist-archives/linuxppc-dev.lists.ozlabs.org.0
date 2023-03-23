Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAD36C7093
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 19:55:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjDzl2lj1z3fQr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 05:54:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=fadU4mEd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=fadU4mEd;
	dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjDym6vy8z3f4C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 05:54:06 +1100 (AEDT)
Received: by mail-io1-xd2d.google.com with SMTP id q6so10422552iot.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 11:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1679597642;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KorvtwCOxoJ7Xu8Jsbh0Gsls0qi5tJabPRLiKrhPgM=;
        b=fadU4mEdWJoqAOG7rHf3umoBIpjzSjZGFPFFunMizyiHUoIWkRy5znyX0aSmfBSXyC
         /l0lF0ePGds8YfiX6TTxTFZ3PiQJLB+OQNDo+anCOIKdM/FjPnynIzbhQksZD1aVJEBY
         PdN1oQ7Lav9Jq3aPjY+4cE4t+yMq2aKYiu/VTM0Dut3YJiI9tG0V+6gPJmHTbqTnT27z
         kdYD/+lW/JOjezl8DomrLgT2fi35BIfAd4tlSYpETiBT6/bLapoMDfGWU1EYD3bbywNB
         8VpNSHKl163rd3LKIAilpuUdBiadaHbUGHrR8t5DKsO3/3L+O4vY8cZbDYPJYSPsZSDm
         s2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679597642;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5KorvtwCOxoJ7Xu8Jsbh0Gsls0qi5tJabPRLiKrhPgM=;
        b=OHrPenlTqQAS+BzUmb28opvcq2sCV0XZtCIsF4pMUx5zSBnxYoUR1QttwiEzSrA2qo
         LJzKB+d1DZgIrU7tSTutK5lwKPpLlBMBFt6GekcNqQtKm2QJiwFN2ObaYtQFrxiR8uIs
         L5iDx1XNnFPOZOkhlYaL0T4cq9kNuTVJyhk0Xi1S7b1izcETXVRgd+KkNmb0goWu5W/1
         JVSK4R9zveF8AR0OCjdK5QbtYr8RiQObDctHuglGKbTZyaMv6u81QrzcOIgx0NQpfJZ6
         G0MGIzfIB1Q1QOaprwE+3nESq6GRG5vA4aNTH5UHA6Y0pR1ojiK4ZMHiAi/4xJXnlgLA
         sulw==
X-Gm-Message-State: AO0yUKX5EFxPjRLpUoBze5gJsjl9KXLTKh/r89ejjv8ZQR+tb3BtU0DZ
	tC1ue55pVc0rneq6w8saSqSdJQ==
X-Google-Smtp-Source: AK7set9EzfKEL3kTJ6UeHLl7Lpvc99LOWFWlp2MEx54+rqYs+6Mmsr4cmZc9WJRA9gAQgmV911eh/Q==
X-Received: by 2002:a6b:c817:0:b0:740:7d21:d96f with SMTP id y23-20020a6bc817000000b007407d21d96fmr129990iof.1.1679597641835;
        Thu, 23 Mar 2023 11:54:01 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id x13-20020a056638160d00b00408f2ebed47sm17513jas.155.2023.03.23.11.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 11:54:01 -0700 (PDT)
Message-ID: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
Date: Thu, 23 Mar 2023 12:54:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
From: Jens Axboe <axboe@kernel.dk>
Subject: Memory coherency issue with IO thread offloading?
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

Hi,

I got a report sent to me from mariadb, in where 5.10.158 works fine and
5.10.162 is broken. And in fact, current 6.3-rc also fails the test
case. Beware that this email is long, as I'm trying to include
everything that may be relevant...

The test case in question is pretty simple. On debian testing, do:

$ sudo apt-get install mariadb-test
$ cd /usr/share/mysql/mysql-test
$ ./mtr --mysqld=--innodb-flush-method=fsync --mysqld=--innodb-use-native-aio=1 --vardir=/dev/shm/mysql  --force encryption.innodb_encryption,innodb,undo0 --repeat=200

and if it fails, you'll see something like:

encryption.innodb_encryption 'innodb,undo0' [ 6 pass ]   3120
encryption.innodb_encryption 'innodb,undo0' [ 7 pass ]   3123
encryption.innodb_encryption 'innodb,undo0' [ 8 pass ]   3042
encryption.innodb_encryption 'innodb,undo0' [ 9 fail ]
        Test ended at 2023-03-23 16:55:17

CURRENT_TEST: encryption.innodb_encryption
mysqltest: At line 11: query 'SET @start_global_value = @@global.innodb_encryption_threads' failed: ER_UNKNOWN_SYSTEM_VARIABLE (1193): Unknown system variable 'innodb_encryption_threads'

The result from queries just before the failure was:
SET @start_global_value = @@global.innodb_encryption_threads;

 - saving '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/' to '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/'
***Warnings generated in error logs during shutdown after running tests: encryption.innodb_encryption

2023-03-23 16:55:17 0 [Warning] Plugin 'example_key_management' is of maturity level experimental while the server is stable
2023-03-23 16:55:17 0 [ERROR] InnoDB: Database page corruption on disk or a failed read of file './ibdata1' page [page id: space=0, page number=221]. You may have to recover from a backup.

where data read was not as expected.

Now, there are a number of io_uring changes between .158 and .162, as it
includes the backport that brought 5.10-stable into line with what
5.15-stable includes. I'll spare you all the digging I did to vet those
changes, but the key thing is that it STILL happens on 6.3-git on
powerpc.

After ruling out many things, one key difference between 158 and 162 is
that the former offloaded requests that could not be done nonblocking to
a kthread, and 162 and newer offloads to an IO thread. An IO thread is
just a normal thread created from the application submitting IO, the
only difference is that it never exits to userspace. An IO thread has
the same mm/files/you-name-it from the original task. It really is the
same as a userspace thread created by the application The switch to IO
threads was done exactly because of that, rather than rely on a fragile
scheme of having the kthread worker assume all sorts of identify from
the original task. surprises if things were missed. This is what caused
most of the io_uring security issues in the past.

The IO that mariadb does in this test is pretty simple - a bunch of
largish buffered writes with IORING_OP_WRITEV, and some smallish (16K)
buffered reads with IORING_OP_READV.

Today I finally gave up and ran a basic experiment, which simply
offloads the writes to a kthread. Since powerpc has an interesting
memory coherency model, my suspicion was that the work involved with
switching MMs for the kthread could just be the main difference here.
The patch is really dumb and simple - rather than queue the write to an
IO thread, it just offloads it to a kthread that then does
kthread_use_mm(), perform write with the same write handler,
kthread_unuse_mm(). AND THIS WORKS! Usually the above mtr test would
fail in 2..20 loops, I've now done 200 and 500 loops and it's fine.

Which then leads me to the question, what about the IO thread offload
makes this fail on powerpc (and no other arch I've tested on, including
x86/x86-64/aarch64/hppa64)? The offload should be equivalent to having a
thread in userspace in the application, and having that thread just
perform the writes. Is there some magic involved with the kthread mm
use/unuse that makes this sufficiently consistent on powerpc? I've tried
any mix of isync()/mb and making the flush_dcache_page() unconditionally
done in the filemap read/write helpers, and it still falls flat on its
face with the offload to an IO thread.

I must clearly be missing something here, which is why I'm emailing the
powerpc Gods for help :-)

-- 
Jens Axboe

