Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1412F6CC831
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 18:39:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmFkb74wSz3fTG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 03:39:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=AfwpH2OC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=AfwpH2OC;
	dkim-atps=neutral
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmFjZ025Wz3c8f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 03:38:08 +1100 (AEDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3261b76b17aso119665ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 09:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1680021485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GlOqeDaJE9dVLdv9u07tRhZeFPG3DwxLv/hO0KpxPOI=;
        b=AfwpH2OCL0WDrLgnboWiCQc9zVZ4vXuWTcUZ0OjGKFUI5jz4g9KPrpbUMylqIxGWf4
         rIdB8vRhsUT0A7b+VIJqJ/y+/uBuslR7eCTZ+7ZsXKP+YMtkh7umR5OuRXfBwxEqTcYU
         pFJiu8Me7BUVENg8bJdKQ9CXsDR/FOJJJstp2sIM+T+u30/rZ3csk9PKSmALmzOVsspe
         UNetoFe3GyA6lV67GxbGQ8IGVR9+2WeKr5QcrGiRASApXDbqXCLY5qmt5YIRS2WaQgG9
         lq1sMSJa/QGHgGxW2QmWZFYDrqhLdpOdTmZUIe/Vo00CyltkvhpJLGnpinoBy8lLgtyi
         vKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680021485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GlOqeDaJE9dVLdv9u07tRhZeFPG3DwxLv/hO0KpxPOI=;
        b=Y+cFc97BHehn0el2B18YKS9DBq5CctuoQN1kSIIyhU9DPu5NRl1tWmnLTckboZdA4I
         a40YXR0oGJVq4zfp2tSht0O+xNB2O0jmVy98hq20jtReaFtxxeBUCvEy64mz36lw6OPq
         uHY5pyQPx7z0ckjlb975kYs0CYp2Cc6KpExuaBIf1vQQkkZBUrdCL78AzUNQ5sElntiV
         gOejkon0Nu/5BNGCKlDUBg8mk810FFYvQXQDFRsLIDi+K/XDnx1uL6zQTLp20EM+JdHT
         0AvANWGFOMXFeluSViz0i6FZmc+vejYPbcWJHVYVx1Yx8K+umnw5OdLppW0u8EnedA+3
         OAiA==
X-Gm-Message-State: AAQBX9d6eBNWO1ABdvINwtZRUUcq6M+Kp+p5hbSQG+L+WHPovOwXAx+z
	iGJ7oUyE8xgkctsjUQTbm5xc6g==
X-Google-Smtp-Source: AKy350bIpB+IudRrmzfPXKrY4fZNUwcuB191Ucr78PKhUXgM2aBTN0gOKLn/lFFHcGY48nMVUlIAgQ==
X-Received: by 2002:a05:6e02:1543:b0:325:f635:26c5 with SMTP id j3-20020a056e02154300b00325f63526c5mr5598600ilu.3.1680021484784;
        Tue, 28 Mar 2023 09:38:04 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id a17-20020a056e0208b100b00315785bfabfsm8682057ilt.47.2023.03.28.09.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 09:38:04 -0700 (PDT)
Message-ID: <91477fb8-c9d8-53e7-e657-f5d6ba2e276f@kernel.dk>
Date: Tue, 28 Mar 2023 10:38:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Memory coherency issue with IO thread offloading?
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
References: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
 <87h6u9u0e0.fsf@mpe.ellerman.id.au>
 <872a1b2b-5fe6-e1ac-5dda-dc806b21b3f5@kernel.dk>
 <9753c624-66e0-aace-6540-731cba9da864@kernel.dk>
 <CRGVMXJ46PPN.1VWRMA1IMPHW2@bobo>
 <6f32b504-ccd5-d67c-1b67-95d8fe1cf185@kernel.dk>
 <3ae396db-4aa3-c031-67a7-2df341214b5b@kernel.dk>
 <87a5zxca3t.fsf@mpe.ellerman.id.au>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <87a5zxca3t.fsf@mpe.ellerman.id.au>
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
Cc: daniel@mariadb.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/28/23 6:51?AM, Michael Ellerman wrote:
> Jens Axboe <axboe@kernel.dk> writes:
>>>> Can the  queueing cause the creation of an IO thread (if one does not
>>>> exist, or all blocked?)
>>>
>>> Yep
>>>
>>> Since writing this email, I've gone through a lot of different tests.
>>> Here's a rough listing of what I found:
>>>
>>> - Like using the hack patch, if I just limit the number of IO thread
>>>   workers to 1, it seems to pass. At least longer than before, does 1000
>>>   iterations.
>>>
>>> - If I pin each IO worker to a single CPU, it also passes.
>>>
>>> - If I liberally sprinkle smp_mb() for the io-wq side, test still fails.
>>>   I've added one before queueing the work item, and after. One before
>>>   the io-wq worker grabs a work item and one after. Eg full hammer
>>>   approach. This still fails.
>>>
>>> Puzzling... For the "pin each IO worker to a single CPU" I added some
>>> basic code around trying to ensure that a work item queued on CPU X
>>> would be processed by a worker on CPU X, and too a large degree, this
>>> does happen. But since the work list is a normal list, it's quite
>>> possible that some other worker finishes its work on CPU Y just in time
>>> to grab the one from cpu X. I checked and this does happen in the test
>>> case, yet it still passes. This may be because I got a bit lucky, but
>>> seems suspect with thousands of passes of the test case.
>>>
>>> Another theory there is that it's perhaps related to an io-wq worker
>>> being rescheduled on a different CPU. Though again puzzled as to why the
>>> smp_mb sprinkling didn't fix that then. I'm going to try and run the
>>> test case with JUST the io-wq worker pinning and not caring about where
>>> the work is processed to see if that does anything.
>>
>> Just pinning each worker to whatever CPU they got created on seemingly
>> fixes the issue too. This does not mean that each worker will process
>> work on the CPU on which it was queued, just that each worker will
>> remain on whatever CPU it originally got created on.
>>
>> Puzzling...
>>
>> Note that it is indeed quite possible that this isn't a ppc issue at
>> all, just shows on ppc. It could be page cache related, or it could even
>> be a bug in mariadb itself.
> 
> I tried binary patching every lwsync to hwsync (read/write to full
> barrier) in mariadbd and all the libaries it links. It didn't fix the
> problem.
> 
> I also tried switching all the kernel barriers/spin locks to using a
> hwsync, but that also didn't fix it.
> 
> It's still possible there's somewhere that currently has no barrier at
> all that needs one, the above would only fix the problem if we have a
> read/write barrier that actually needs to be a full barrier.
> 
> 
> I also looked at making all TLB invalidates broadcast, regardless of
> whether we think the thread has only been on a single CPU. That didn't
> help, but I'm not sure I got all places where we do TLB invalidates, so
> I'll look at that some more tomorrow.

Thanks, appreciate your testing! I have no new data points since
yesterday, but the key point from then still seems to be that if an io
worker never reschedules onto a different CPU, then the problem doesn't
occur. This could very well be a page cache issue, if it isn't an issue
on the powerpc side...

-- 
Jens Axboe

