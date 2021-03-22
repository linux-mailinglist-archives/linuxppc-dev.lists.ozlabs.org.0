Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4578D34532B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 00:46:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4B2z1yD7z30N1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 10:46:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=Ze6ptfQk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Ze6ptfQk; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4B2X2kfpz2yxb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 10:45:37 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id x26so12342741pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 16:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=7p7Vs6bLBk4Uyz+kJg2qbyDsqQhArCrFc7/wzK/apD4=;
 b=Ze6ptfQkU0mDC6xweiEQU/jw9crvSu/zn9mJ/28udQg9gYqLeIcw53dteWKhNM0alV
 7+XwJdhCkQzVwvCdWWWB47HURNcKeGDLFF+qoyiB1ot7wB2khle5T8OZ4PaF005lxquH
 2V47tXecRxwMkqnghpcp4aUA2+QrGb7dVEJws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=7p7Vs6bLBk4Uyz+kJg2qbyDsqQhArCrFc7/wzK/apD4=;
 b=BUIDdYqZTipRsD8At0IOxCQIT9IuKUSGLtwn656ToAOo2GkObdEzgulYN4egQQi7U+
 DJMQU3EVZegLKxAN6vUfPeR3gwLBGh5WkDobKsuxYpU85Z1k/6+rH+C3WNuf3jyFIAVp
 ITNkWBi5merL0qvRTGgiHqg2/q8JL4kuFkEgEojkuP3Cca/tEjbl8wyhL5cwQqTqkLBv
 wd0oF5raTBysJ41RcyN0qhMJyzdUzW57/JJQoom2AAV5vas0CIZoGiQtQNFN+e1iIG6w
 HObKHUxlpErelDRd723gL6OUWO3mn4LOL2h9KYcvSx12N+vFeMXrTXAg3083rYpM9rur
 s1FQ==
X-Gm-Message-State: AOAM530gh6XMkmOJKLHQ5tX8q6fmNHghNhU02ii7yeugso6dCJkQqrbk
 OVgPgFtORGGESZS7lydvrq2cNw==
X-Google-Smtp-Source: ABdhPJwjQ2rNwR9pwENLYbus2oM8MGaeo3pBEEoU3c2Oww2o4vvfEhYramAGyJM0uEPGJfVzzw5KUw==
X-Received: by 2002:a17:902:8b86:b029:e5:bef6:56b0 with SMTP id
 ay6-20020a1709028b86b02900e5bef656b0mr2011837plb.76.1616456735667; 
 Mon, 22 Mar 2021 16:45:35 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-07ae-1980-05d6-0e77.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7ae:1980:5d6:e77])
 by smtp.gmail.com with ESMTPSA id g28sm15116670pfr.120.2021.03.22.16.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 16:45:35 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/10] Move 64e to new interrupt return code
In-Reply-To: <20210315031716.3940350-1-npiggin@gmail.com>
References: <20210315031716.3940350-1-npiggin@gmail.com>
Date: Tue, 23 Mar 2021 10:45:32 +1100
Message-ID: <87im5ibvmr.fsf@dja-thinkpad.axtens.net>
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
Cc: Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

> Since RFC this is rebased on Christophe's v3 ppc32 conversion, and
> has fixed up small details, and then adds some powerpc-wide
> cleanups at the end.
>
> Tested on qemu only (QEMU e500), which is not ideal for interrupt
> handling particularly the critical interrupts which I don't know
> whether it can generate.

I tested this on a T4240RDB with:

stress-ng --class interrupts --seq 0 -t 5

There are some problems that occur only when testing with your series. I
haven't made any attempt to debug them yet.

stress-ng: info:  [3101] unsuccessful run completed in 6352.60s (1 hour, 45 mins, 52.60 secs)
stress-ng: fail:  [3101] aio instance 0 corrupted bogo-ops counter, 7542705 vs 0
stress-ng: fail:  [3101] aio instance 0 hash error in bogo-ops counter and run flag, 359866039 vs 0
stress-ng: fail:  [3101] aio instance 17 corrupted bogo-ops counter, 7638823 vs 0
stress-ng: fail:  [3101] aio instance 17 hash error in bogo-ops counter and run flag, 2001558423 vs 0
stress-ng: fail:  [3101] aio instance 30 corrupted bogo-ops counter, 8192545 vs 0
info: 5 failures reached, aborting stress process
stress-ng: fail:  [3101] aio instance 30 hash error in bogo-ops counter and run flag, 3023200976 vs 0
stress-ng: fail:  [3101] pidfd instance 25 corrupted bogo-ops counter, 116476 vs 0
stress-ng: fail:  [3101] pidfd instance 25 hash error in bogo-ops counter and run flag, 1964630417 vs 0
stress-ng: fail:  [3101] sigabrt instance 3 corrupted bogo-ops counter, 95662 vs 0
stress-ng: fail:  [3101] sigabrt instance 3 hash error in bogo-ops counter and run flag, 1321243721 vs 0
stress-ng: fail:  [3101] sigabrt instance 9 corrupted bogo-ops counter, 92858 vs 0
stress-ng: fail:  [3101] sigabrt instance 9 hash error in bogo-ops counter and run flag, 3835381330 vs 0
stress-ng: fail:  [3101] sigabrt instance 11 corrupted bogo-ops counter, 98333 vs 0
stress-ng: fail:  [3101] sigabrt instance 11 hash error in bogo-ops counter and run flag, 3447969030 vs 0
stress-ng: fail:  [3101] sigabrt instance 14 corrupted bogo-ops counter, 96995 vs 0
stress-ng: fail:  [3101] sigabrt instance 14 hash error in bogo-ops counter and run flag, 2621581502 vs 0
stress-ng: fail:  [3101] sigabrt instance 16 corrupted bogo-ops counter, 97464 vs 0
stress-ng: fail:  [3101] sigabrt instance 16 hash error in bogo-ops counter and run flag, 3422440538 vs 0
stress-ng: fail:  [3101] sigabrt instance 19 corrupted bogo-ops counter, 96044 vs 0
stress-ng: fail:  [3101] sigabrt instance 19 hash error in bogo-ops counter and run flag, 511989935 vs 0
stress-ng: fail:  [3101] sigabrt instance 20 corrupted bogo-ops counter, 96018 vs 0
stress-ng: fail:  [3101] sigabrt instance 20 hash error in bogo-ops counter and run flag, 2348631606 vs 0
stress-ng: fail:  [3101] sigabrt instance 23 corrupted bogo-ops counter, 95252 vs 0
stress-ng: fail:  [3101] sigabrt instance 23 hash error in bogo-ops counter and run flag, 2302430489 vs 0
stress-ng: fail:  [3101] sigabrt instance 26 corrupted bogo-ops counter, 99151 vs 0
stress-ng: fail:  [3101] sigabrt instance 26 hash error in bogo-ops counter and run flag, 2882282932 vs 0
stress-ng: fail:  [3101] sigabrt instance 27 corrupted bogo-ops counter, 95434 vs 0
stress-ng: fail:  [3101] sigabrt instance 27 hash error in bogo-ops counter and run flag, 260112434 vs 0
stress-ng: fail:  [3101] sigabrt instance 28 corrupted bogo-ops counter, 97138 vs 0
stress-ng: fail:  [3101] sigabrt instance 28 hash error in bogo-ops counter and run flag, 2822283734 vs 0
stress-ng: fail:  [3101] sigabrt instance 30 corrupted bogo-ops counter, 97728 vs 0
stress-ng: fail:  [3101] sigabrt instance 30 hash error in bogo-ops counter and run flag, 738567801 vs 0
stress-ng: fail:  [3101] sigabrt instance 31 corrupted bogo-ops counter, 96368 vs 0
stress-ng: fail:  [3101] sigabrt instance 31 hash error in bogo-ops counter and run flag, 1663873592 vs 0
stress-ng: fail:  [3101] sigio instance 0 corrupted bogo-ops counter, 1141 vs 0
stress-ng: fail:  [3101] sigio instance 0 hash error in bogo-ops counter and run flag, 3981634025 vs 0
stress-ng: fail:  [3101] sigio instance 1 corrupted bogo-ops counter, 1323 vs 0
stress-ng: fail:  [3101] sigio instance 1 hash error in bogo-ops counter and run flag, 2384922462 vs 0
stress-ng: fail:  [3101] sigio instance 2 corrupted bogo-ops counter, 876 vs 0
stress-ng: fail:  [3101] sigio instance 2 hash error in bogo-ops counter and run flag, 2730635354 vs 0
stress-ng: fail:  [3101] sigio instance 3 corrupted bogo-ops counter, 3391 vs 0
stress-ng: fail:  [3101] sigio instance 3 hash error in bogo-ops counter and run flag, 3893594528 vs 0
stress-ng: fail:  [3101] sigio instance 4 corrupted bogo-ops counter, 988 vs 0
stress-ng: fail:  [3101] sigio instance 4 hash error in bogo-ops counter and run flag, 2252189661 vs 0
stress-ng: fail:  [3101] sigio instance 5 corrupted bogo-ops counter, 4158 vs 0
stress-ng: fail:  [3101] sigio instance 5 hash error in bogo-ops counter and run flag, 908770141 vs 0
stress-ng: fail:  [3101] sigio instance 6 corrupted bogo-ops counter, 657 vs 0
stress-ng: fail:  [3101] sigio instance 6 hash error in bogo-ops counter and run flag, 3022228667 vs 0
stress-ng: fail:  [3101] sigio instance 7 corrupted bogo-ops counter, 239 vs 0
stress-ng: fail:  [3101] sigio instance 7 hash error in bogo-ops counter and run flag, 2339545388 vs 0
stress-ng: fail:  [3101] sigio instance 8 corrupted bogo-ops counter, 183062 vs 0
stress-ng: fail:  [3101] sigio instance 8 hash error in bogo-ops counter and run flag, 2294439106 vs 0
stress-ng: fail:  [3101] sigio instance 9 corrupted bogo-ops counter, 946 vs 0
stress-ng: fail:  [3101] sigio instance 9 hash error in bogo-ops counter and run flag, 2990832529 vs 0
stress-ng: fail:  [3101] sigio instance 10 corrupted bogo-ops counter, 2799 vs 0
stress-ng: fail:  [3101] sigio instance 10 hash error in bogo-ops counter and run flag, 1781985030 vs 0
stress-ng: fail:  [3101] sigio instance 11 corrupted bogo-ops counter, 2705 vs 0
stress-ng: fail:  [3101] sigio instance 11 hash error in bogo-ops counter and run flag, 3301490000 vs 0
stress-ng: fail:  [3101] sigio instance 21 corrupted bogo-ops counter, 238787 vs 0
stress-ng: fail:  [3101] sigio instance 21 hash error in bogo-ops counter and run flag, 2490210165 vs 0
stress-ng: fail:  [3101] sigio instance 28 corrupted bogo-ops counter, 1020 vs 0
stress-ng: fail:  [3101] sigio instance 28 hash error in bogo-ops counter and run flag, 3260422232 vs 0
stress-ng: fail:  [3101] metrics-check: stressor metrics corrupted, data is compromised

It looks like this is paired with some segfaults in dmesg:

stress-ng-pidfd[4417]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-pidfd[4417]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-pidfd[4417]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigab[3748349]: segfault (11) at 800100 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-sigab[3748349]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigab[3748390]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1
stress-ng-sigab[3748405]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-sigab[3748405]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigab[3748405]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigab[3748427]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1
stress-ng-sigab[3748376]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1
in stress-ng[107e8d000+3000]
in stress-ng[107e8d000+3000]
stress-ng-sigab[3748427]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigab[3748376]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigab[3748427]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigab[3748376]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigab[3748460]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-sigab[3748460]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigab[3748460]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigab[3748434]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-sigab[3748434]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigab[3748434]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigab[3748367]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-sigab[3748367]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigab[3748367]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigab[3748349]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
in stress-ng[107e8d000+3000]
stress-ng-sigab[3748507]: segfault (11) at 800100 nip 107e8fb14 lr 107e8fb04 code 1

in stress-ng[107e8d000+3000]
stress-ng-sigab[3748390]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 

stress-ng-sigab[3748491]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-sigab[3748491]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigab[3748491]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigab[3748390]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigab[3748507]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigab[3748507]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
show_signal_msg: 3 callbacks suppressed
stress-ng-sigio[2635277]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1
stress-ng-sigio[2635278]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1
stress-ng-sigio[2635279]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-sigio[2635279]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigio[2635279]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigio[2635280]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-sigio[2635280]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigio[2635280]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigio[2635283]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-sigio[2635283]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigio[2635283]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigio[2635285]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-sigio[2635285]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigio[2635285]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigio[2635289]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-sigio[2635289]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigio[2635289]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
in stress-ng[107e8d000+3000]
stress-ng-sigio[2635293]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-sigio[2635293]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigio[2635293]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigio[2635292]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-sigio[2635292]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigio[2635292]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigio[2635315]: segfault (11) at 800000 nip 107e8fb14 lr 107e8fb04 code 1 in stress-ng[107e8d000+3000]
stress-ng-sigio[2635315]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigio[2635315]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
in stress-ng[107e8d000+3000]

stress-ng-sigio[2635278]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigio[2635277]: code: 7d4903a6 e8490008 4e800421 e8410028 7c691b78 386100ac 912100ac 4bfc3be1 
stress-ng-sigio[2635278]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 
stress-ng-sigio[2635277]: code: 60000000 812100ac 2c090000 40820014 <e90f0000> 39200001 993c0940 99280008 

In one run, I had problems with a hardware interrupt, but I haven't seen
it reoccur so I can't be sure it came from your series:


mmc0: Timeout waiting for hardware cmd interrupt.        
mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
mmc0: sdhci: Sys addr:  0x00000000 | Version:  0x00001301
mmc0: sdhci: Blk size:  0x00000000 | Blk cnt:  0x00000000
mmc0: sdhci: Argument:  0x00000c00 | Trn mode: 0x00000000
mmc0: sdhci: Present:   0x01f00008 | Host ctl: 0x00000020
mmc0: sdhci: Power:     0x00000000 | Blk gap:  0x00000000
mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x000020e8
mmc0: sdhci: Timeout:   0x00000000 | Int stat: 0x00010001
mmc0: sdhci: Int enab:  0x007f0007 | Sig enab: 0x007f0003
mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00001402
mmc0: sdhci: Caps:      0x04fa0000 | Caps_1:   0x00000000
mmc0: sdhci: Cmd:       0x0000341a | Max curr: 0x00000000
mmc0: sdhci: Resp[0]:   0x00000000 | Resp[1]:  0x00000000
mmc0: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
mmc0: sdhci: Host ctl2: 0x00000000                       
mmc0: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0x00000000
mmc0: sdhci: ============================================
mmc0: Timeout waiting for hardware cmd interrupt. 

Let me know if you'd like me to run any further tests.

Kind regards,
Daniel

>
> Thanks,
> Nick
>
> Nicholas Piggin (10):
>   powerpc/syscall: switch user_exit_irqoff and trace_hardirqs_off order
>   powerpc/64e/interrupt: always save nvgprs on interrupt
>   powerpc/64e/interrupt: use new interrupt return
>   powerpc/64e/interrupt: NMI save irq soft-mask state in C
>   powerpc/64e/interrupt: reconcile irq soft-mask state in C
>   powerpc/64e/interrupt: Use new interrupt context tracking scheme
>   powerpc/64e/interrupt: handle bad_page_fault in C
>   powerpc: clean up do_page_fault
>   powerpc: remove partial register save logic
>   powerpc: move norestart trap flag to bit 0
>
>  arch/powerpc/include/asm/asm-prototypes.h |   2 -
>  arch/powerpc/include/asm/bug.h            |   4 +-
>  arch/powerpc/include/asm/interrupt.h      |  66 ++--
>  arch/powerpc/include/asm/ptrace.h         |  36 +-
>  arch/powerpc/kernel/align.c               |   6 -
>  arch/powerpc/kernel/entry_64.S            |  40 +-
>  arch/powerpc/kernel/exceptions-64e.S      | 425 ++--------------------
>  arch/powerpc/kernel/interrupt.c           |  22 +-
>  arch/powerpc/kernel/irq.c                 |  76 ----
>  arch/powerpc/kernel/process.c             |  12 -
>  arch/powerpc/kernel/ptrace/ptrace-view.c  |  21 --
>  arch/powerpc/kernel/ptrace/ptrace.c       |   2 -
>  arch/powerpc/kernel/ptrace/ptrace32.c     |   4 -
>  arch/powerpc/kernel/signal_32.c           |   3 -
>  arch/powerpc/kernel/signal_64.c           |   2 -
>  arch/powerpc/kernel/traps.c               |  14 +-
>  arch/powerpc/lib/sstep.c                  |   4 -
>  arch/powerpc/mm/book3s64/hash_utils.c     |  16 +-
>  arch/powerpc/mm/fault.c                   |  28 +-
>  arch/powerpc/xmon/xmon.c                  |  23 +-
>  20 files changed, 130 insertions(+), 676 deletions(-)
>
> -- 
> 2.23.0
