Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAE66CA443
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:40:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXTl4xqwz3fZd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:40:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=3cInyXfM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=3cInyXfM;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlXSq2Dlcz3bTc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:39:37 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id iw3so8287493plb.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 05:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1679920774; x=1682512774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGYZ9BMKwXh5F4Dzl5jFwSnRbxPzs22QKbVK/55Jz5A=;
        b=3cInyXfMC9ww2vdVrRLm1Pz05hBeLkEMFTxTmgJLZgF8xJCB/1JcEs3RGvNA8VEJIE
         EKEdy11JzcWzjAAICSRsFs2vdZKr10qMui+fDRkiGpNFpshIqVsvKod+76quImGtQr1V
         CzdMBWF+Y7XoUekvH123/49VrMLa0dEwJoEithBRwa0mJJuhLiCc5na4zD2X0BHV+js/
         6uFCUwnv2Esjc/Klx3D0d8HueJcnRF7I6PvPXlz74GeXXVEpxkeinlcgQiCTO+LpMrU4
         aQ+Ji1TyvaDuypvbdR5ZzT2uX1Ak+lVgmZpvOyl2qKvMNZzUBPd8G+TYcCzNBOZW1+P3
         t0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679920774; x=1682512774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NGYZ9BMKwXh5F4Dzl5jFwSnRbxPzs22QKbVK/55Jz5A=;
        b=SpX3q28tS9AnSAUDsWE0IY9U/bsAm5avyo8K2cXUkETIF8WDXCMn18ykKNThtQfpSU
         40wKftQ/wVYMOvnuCwS617Yc0faWciuozmcwc1A7f0GwmTSMHwuY77bLVHGFSEJECKZs
         uhDA6IDR5FW005U4UNhiX1luNIPMsPXo4tcVzw76ovfW35EKa8A4c91F9hD8lTCickdy
         9uOi72HdaYQ4H+YLVo0yohhmQrFo/bCJzxHL2H35glaev9dgAAO4yryZuGvEFHlbMsIK
         rMNIvEBTfcECMakNUphbOzu6r5vUDU0BxBxSrE5++GgZn4ICesictUNPe7T87bKzBSzJ
         HLyQ==
X-Gm-Message-State: AAQBX9fqNrj9n0hMTgP2ijheAwW8LoGLs+vcUAGAbiPD+G79qEBicjPG
	gDBW2GKKuAfRms0YgpGiPR7z4Q==
X-Google-Smtp-Source: AKy350YWGMko2KdpZdWs+g7TwTaz8Gomn+648Cg1+LnMuwr4320tsLp92y1nTUNNQk1dx90CiXBTUw==
X-Received: by 2002:a17:90a:4ec1:b0:23d:2b53:1ae2 with SMTP id v1-20020a17090a4ec100b0023d2b531ae2mr9979124pjl.3.1679920774371;
        Mon, 27 Mar 2023 05:39:34 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id k2-20020a170902760200b001991e4e0bdcsm19110670pll.233.2023.03.27.05.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 05:39:34 -0700 (PDT)
Message-ID: <6f32b504-ccd5-d67c-1b67-95d8fe1cf185@kernel.dk>
Date: Mon, 27 Mar 2023 06:39:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Memory coherency issue with IO thread offloading?
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>
References: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
 <87h6u9u0e0.fsf@mpe.ellerman.id.au>
 <872a1b2b-5fe6-e1ac-5dda-dc806b21b3f5@kernel.dk>
 <9753c624-66e0-aace-6540-731cba9da864@kernel.dk>
 <CRGVMXJ46PPN.1VWRMA1IMPHW2@bobo>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CRGVMXJ46PPN.1VWRMA1IMPHW2@bobo>
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

On 3/26/23 10:22?PM, Nicholas Piggin wrote:
> On Sat Mar 25, 2023 at 11:20 AM AEST, Jens Axboe wrote:
>> On 3/24/23 7:15?PM, Jens Axboe wrote:
>>>> Are there any CONFIG options I'd need to trip this?
>>>
>>> I don't think you need any special CONFIG options. I'll attach my config
>>> here, and I know the default distro one hits it too. But perhaps the
>>> mariadb version is not new enough? I think you need 10.6 or above, as
>>> will use io_uring by default. What version are you running?
>>
>> And here's the .config and the patch for using queue_work().
> 
> So if you *don't* apply this patch, the work gets queued up with an IO
> thread? In io-wq.c? Does that worker end up just doing an io_write()
> same as this one?

Right, without this patch, it gets added to the io-wq work pool. If a
thread is available to run it, it will. If one is not, then one is
created. Eg either event can happen.

That thread does the exact same io_write() again.

> Can the  queueing cause the creation of an IO thread (if one does not
> exist, or all blocked?)

Yep

Since writing this email, I've gone through a lot of different tests.
Here's a rough listing of what I found:

- Like using the hack patch, if I just limit the number of IO thread
  workers to 1, it seems to pass. At least longer than before, does 1000
  iterations.

- If I pin each IO worker to a single CPU, it also passes.

- If I liberally sprinkle smp_mb() for the io-wq side, test still fails.
  I've added one before queueing the work item, and after. One before
  the io-wq worker grabs a work item and one after. Eg full hammer
  approach. This still fails.

Puzzling... For the "pin each IO worker to a single CPU" I added some
basic code around trying to ensure that a work item queued on CPU X
would be processed by a worker on CPU X, and too a large degree, this
does happen. But since the work list is a normal list, it's quite
possible that some other worker finishes its work on CPU Y just in time
to grab the one from cpu X. I checked and this does happen in the test
case, yet it still passes. This may be because I got a bit lucky, but
seems suspect with thousands of passes of the test case.

Another theory there is that it's perhaps related to an io-wq worker
being rescheduled on a different CPU. Though again puzzled as to why the
smp_mb sprinkling didn't fix that then. I'm going to try and run the
test case with JUST the io-wq worker pinning and not caring about where
the work is processed to see if that does anything.

> I'm wondering what the practical differences are between this patch and
> upstream.
> 
> kthread_use_mm() should be basically the same as context switching to an
> IO thread. There is maybe a difference in that kthread_switch_mm() has
> a 'sync' instruction *after* the MMU is switched to the new thread from
> the membarrier code, but a regular context switch might not. The MMU
> switch does have an isync() after it though, so loads *should* be
> prohibited from moving ahead of that.
> 
> Something like this adds a sync roughly where kthread_use_mm() has one.
> It's a pretty unlikely shot in the dark though. I'm more inclined to
> think the work submission to the IO thread might have a problem.

Didn't seem to change anything, fails pretty quickly:

[...]
encryption.innodb_encryption 'innodb,undo0' [ 38 pass ]   3083
encryption.innodb_encryption 'innodb,undo0' [ 39 pass ]   3135
encryption.innodb_encryption 'innodb,undo0' [ 40 fail ]
        Test ended at 2023-03-27 12:20:46

CURRENT_TEST: encryption.innodb_encryption
mysqltest: At line 11: query 'SET @start_global_value = @@global.innodb_encryption_threads' failed: ER_UNKNOWN_SYSTEM_VARIABLE (1193): Unknown system variable 'innodb_encryption_threads'

The result from queries just before the failure was:
SET @start_global_value = @@global.innodb_encryption_threads;

 - saving '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/' to '/dev/shm/mysql/log/encryption.innodb_encryption-innodb,undo0/'
***Warnings generated in error logs during shutdown after running tests: encryption.innodb_encryption

2023-03-27 12:20:45 0 [Warning] Plugin 'example_key_management' is of maturity level experimental while the server is gamma
2023-03-27 12:20:45 0 [ERROR] InnoDB: Database page corruption on disk or a failed read of file './ibdata1' page [page id: space=0, page number=214]. You may have to recover from a backup.
2023-03-27 12:20:45 0 [ERROR] InnoDB: File './ibdata1' is corrupted
2023-03-27 12:20:45 0 [ERROR] InnoDB: Plugin initialization aborted with error Page read from tablespace is corrupted.
2023-03-27 12:20:45 0 [ERROR] Plugin 'InnoDB' init function returned error.
2023-03-27 12:20:45 0 [ERROR] Plugin 'InnoDB' registration as a STORAGE ENGINE failed.

-- 
Jens Axboe

