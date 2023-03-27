Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58D86CB0A0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:25:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Plm7y3vP3z3fTZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 08:25:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=oHN+8rjJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=oHN+8rjJ;
	dkim-atps=neutral
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Plm6z0P27z3bjW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 08:24:57 +1100 (AEDT)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3230125dde5so295635ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 14:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1679952293;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0eftNLvSesPHZioQvbRv9TEAEEp18MP4qcagijDbKiA=;
        b=oHN+8rjJd161d9xb+O7uebxDzzMGQtRYlNB2UrEfskZdwJeZvMBLPNZ097JNHbu+/7
         qX68v+uIuNeR++zL0y3VQYxHqagYmh0RgEXYUCVfx+z1XsRHiLvAwMMja2cESu2oWVw4
         rQskRggjvr6y7ymfkcuQkp/a643UhRJfwgROio380BX94Lg1nuqLwZDhM1WSet47BJDn
         ylkZhm/3rulXimy+X7vSj0+ekZaAgCghT56qcKZhs7utZy02bQD8ROYWrFCsTgruLOSM
         GRBQKy6gOIwfU9iPmFwTLWOzRjttTErV0q4+IxbEGfX4tO3mLITrcBxOCoKy9IRVJuat
         t2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679952293;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0eftNLvSesPHZioQvbRv9TEAEEp18MP4qcagijDbKiA=;
        b=BFNucdFIpH8NtgjU6GMDso84BlKS/b6oW9W+ApeQgjW+Gdba5cW3ZIMySWIaPAZr//
         +O1bwAQZVNtixx1549wp3ZbgVQZRrMfpuV9IWYeh2v+eCwJttyMwIDNCEgmeb3uDoqAD
         x+nCaZDC/oxESupdUUE3zOXTjHhk0CVjTuwiBEn5wPTYdO/fRcrFJ/GYkmiNinqI8QxJ
         oILHI3C8paYB3t++fdHI9c6BjVpix4KH/rJ3uRKzTvWeM5a3X8vqIE0NWWgL6k2VrARP
         O/67erDTWWXQLVq1VIAg00mUnqqwoVL/H2uRQfDKx/xGIbDjgFCrntDYOU5e0HUNeE9k
         DX4g==
X-Gm-Message-State: AO0yUKUha6auUy6fG+zjS6UgQ0+ZeMiTQG7v8TVTFHN2D8mShuDu/Zl1
	SxzdlMDSRCn+D50rZ+f3tzSEXQ==
X-Google-Smtp-Source: AK7set9Wmkys4++12vnjWBDl13cixURA6bgcXr68KQowkdjg1VjxParnfG/MzfdxE4BhJEFFiXBoEQ==
X-Received: by 2002:a05:6602:3405:b0:758:9c9e:d6c6 with SMTP id n5-20020a056602340500b007589c9ed6c6mr8015847ioz.2.1679952293049;
        Mon, 27 Mar 2023 14:24:53 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id p15-20020a056638216f00b00403089c2a1dsm9339308jak.108.2023.03.27.14.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 14:24:52 -0700 (PDT)
Message-ID: <3ae396db-4aa3-c031-67a7-2df341214b5b@kernel.dk>
Date: Mon, 27 Mar 2023 15:24:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Memory coherency issue with IO thread offloading?
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>
References: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
 <87h6u9u0e0.fsf@mpe.ellerman.id.au>
 <872a1b2b-5fe6-e1ac-5dda-dc806b21b3f5@kernel.dk>
 <9753c624-66e0-aace-6540-731cba9da864@kernel.dk>
 <CRGVMXJ46PPN.1VWRMA1IMPHW2@bobo>
 <6f32b504-ccd5-d67c-1b67-95d8fe1cf185@kernel.dk>
In-Reply-To: <6f32b504-ccd5-d67c-1b67-95d8fe1cf185@kernel.dk>
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

>> Can the  queueing cause the creation of an IO thread (if one does not
>> exist, or all blocked?)
> 
> Yep
> 
> Since writing this email, I've gone through a lot of different tests.
> Here's a rough listing of what I found:
> 
> - Like using the hack patch, if I just limit the number of IO thread
>   workers to 1, it seems to pass. At least longer than before, does 1000
>   iterations.
> 
> - If I pin each IO worker to a single CPU, it also passes.
> 
> - If I liberally sprinkle smp_mb() for the io-wq side, test still fails.
>   I've added one before queueing the work item, and after. One before
>   the io-wq worker grabs a work item and one after. Eg full hammer
>   approach. This still fails.
> 
> Puzzling... For the "pin each IO worker to a single CPU" I added some
> basic code around trying to ensure that a work item queued on CPU X
> would be processed by a worker on CPU X, and too a large degree, this
> does happen. But since the work list is a normal list, it's quite
> possible that some other worker finishes its work on CPU Y just in time
> to grab the one from cpu X. I checked and this does happen in the test
> case, yet it still passes. This may be because I got a bit lucky, but
> seems suspect with thousands of passes of the test case.
> 
> Another theory there is that it's perhaps related to an io-wq worker
> being rescheduled on a different CPU. Though again puzzled as to why the
> smp_mb sprinkling didn't fix that then. I'm going to try and run the
> test case with JUST the io-wq worker pinning and not caring about where
> the work is processed to see if that does anything.

Just pinning each worker to whatever CPU they got created on seemingly
fixes the issue too. This does not mean that each worker will process
work on the CPU on which it was queued, just that each worker will
remain on whatever CPU it originally got created on.

Puzzling...

Note that it is indeed quite possible that this isn't a ppc issue at
all, just shows on ppc. It could be page cache related, or it could even
be a bug in mariadb itself.

-- 
Jens Axboe


