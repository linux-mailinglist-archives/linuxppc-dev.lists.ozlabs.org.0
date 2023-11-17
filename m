Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5157EECC7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 08:40:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=aiX/VKf3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWpjG0zmDz3dKC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 18:40:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=aiX/VKf3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWphK43Vkz3cT0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 18:39:44 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E7490828556E;
	Fri, 17 Nov 2023 01:39:39 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id rrIuOWX464IB; Fri, 17 Nov 2023 01:39:38 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 4C49C828557E;
	Fri, 17 Nov 2023 01:39:38 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4C49C828557E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1700206778; bh=T4lQaS3pKRM5yJk4GVZrPIax3XNVa++AbOV3l1VtB20=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=aiX/VKf3IJrQvzynOAQwdz8xTCtww3dAKaI4lOfGKocTSORLDoWAeYf8+D/f2QzeQ
	 7ZoHkUckCu8P4YE08Q9fgy2LjGENPQavH+FupZn/26+jZEf0CD283S8Ljq7DeCdD2O
	 hTdLOegS/5wBZ3QP2VHmpAn0O46b4VHEMasdNwtY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id es2r3a-tWKaO; Fri, 17 Nov 2023 01:39:38 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 20F44828556E;
	Fri, 17 Nov 2023 01:39:38 -0600 (CST)
Date: Fri, 17 Nov 2023 01:39:37 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>
Message-ID: <480221078.47953493.1700206777956.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <87pm0c7cr6.fsf@mail.lhotse>
References: <1654757454.47202735.1699948827325.JavaMail.zimbra@raptorengineeringinc.com> <87pm0c7cr6.fsf@mail.lhotse>
Subject: Re: [PATCH] powerpc: Fix data corruption on IPI
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Fix data corruption on IPI
Thread-Index: RFRnzI4NpnMaykN5PCyTT5cPLl40ZQ==
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Michael Ellerman" <mpe@ellerman.id.au>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Cc: "Jens Axboe" <axboe@kernel.dk>
> Sent: Tuesday, November 14, 2023 6:14:37 AM
> Subject: Re: [PATCH] powerpc: Fix data corruption on IPI

> Hi Timothy,
> 
> Thanks for debugging this, but I'm unclear why this is helping because
> we should already have a full barrier (hwsync) on both the sending and
> receiving side.
> 
> More below.

I've spent another few days poking at this, and think I might finally have something more solid in terms of what exactly is happening, but would like some feedback on the concept / how best to fix the potential problem.

As background, there are several worker threads both in userspace and in kernel mode.  Crucially, the main MariaDB data processing thread (the one that handles tasks like flushing dirty pages to disk) always runs on the same core as the io_uring kernel thread that picks up I/O worker creation requests and handles them via create_worker_cb().

Changes in the ~5.12 era switched away from a delayed worker setup.  io_uring currently sets up the new process with create_io_thread(), and immediately uses an IPI to forcibly schedule the new process.  Because of the way the two threads interact, the new process ends up grabbing the CPU from the running MariaDB user thread; I've never seen it schedule on a different core.  If the timing is right in this process, things get trampled on in userspace and the database server either crashes or throws a corruption fault.

Through extensive debugging, I've narrowed this down to invalid state in the VSX registers on return to the MariaDB user thread from the new kernel thread.  For some reason, it seems we don't restore FP state on return from the PF_IO_WORKER thread, and something in the kernel was busy writing new data to them.

A direct example I was able to observe is as follows:

xxspltd vs0,vs0,0      <-- vs0 now zeroed out
xori    r9,r9,1        <-- Presumably we switch to the new kernel thread here due to the IPI
slwi    r9,r9,7        <-- On userspace thread resume, vs0 now contains the value 0x820040000000000082004000
xxswapd vs8,vs0        <-- vs8 now has the wrong value
stxvd2x vs8,r3,r12     <-- userspace is now getting stepped on
stw     r9,116(r3)
stxvd2x vs8,r3,r0
...
CRASH

This is a very difficult race to hit, but MariaDB naturally does repetitive operations with VSX registers so it does eventually fail.  I ended up with a tight loop around glibc operations that use VSX to trigger the failure reliably enough to even understand what was going on.

As I am not as familiar with this part of the Linux kernel as with most other areas, what is the expected save/restore path for the FP/VSX registers around an IPI and associated forced thread switch?  If restore_math() is in the return path, note that MSR_FP is set in regs->msr.

Second question: should we even be using the VSX registers at all in kernel space?  Is this a side effect of io_uring interacting so closely with userspace threads, or something else entirely?

If I can get pointed somewhat in the right direction I'm ready to develop the rest of the fix for this issue...just trying to avoid another several days of slogging through the source to see what it's supposed to be doing in the first place. :)

Thanks!
