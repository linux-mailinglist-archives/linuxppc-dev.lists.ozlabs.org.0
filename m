Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B28BE180BFF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 00:05:12 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cVzf2V4ZzDqYh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 10:05:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=209.85.214.195;
 helo=mail-pl1-f195.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=I88Foc3D; dkim-atps=neutral
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cVy72NYKzDqJS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 10:03:42 +1100 (AEDT)
Received: by mail-pl1-f195.google.com with SMTP id t3so129414plz.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 16:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=2O/9r9g2CdZ/zjPFxBMzO9J+WPLl6sO/SLR9ASj/uMk=;
 b=I88Foc3DnvhFeznngRUN+g5FGcADpBvjgNMgFA3L8T6hm+ln1MRASB1yLetmIa9Oqe
 Nbzf/fN5f0z/qC9KulzTmHwaKM70MQPtFkoQJOpobk+wKKKNqfF9eRF6GV/fDngki6t5
 1PGQ8CX+y8HPh5H1ikKoeazAdKZlpT/M1PTCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=2O/9r9g2CdZ/zjPFxBMzO9J+WPLl6sO/SLR9ASj/uMk=;
 b=FYKRaZjmigFc84q5IBi4gzTxqPDYZsy2/zCO33zxX2rVMxnK3EJZieCBnxnB30n2Vm
 uMy4f7opetjIL1WzXWfxGNRKBoeBKBHmvvE5llZiFlazoQuIpYoc+wK8rkPYRKTaSP/1
 qpRtDJjP7pt4FhwgyRrdWjown3bAQwyl73vQr+EnUCfezJQnuIZ+5o/JbXbXw++T/kQU
 /PD4By/VX8ErT6/141PKpm9R7poyAWlYQpP5FfEVg8eNZlKVVwrKY90QneZsDpEfcDPw
 p81RovgFkIsTK3lAdNwo+6CieqBEkhKpssnKiqPZMkUQccdg6Iw4FBwaR47FzJgvfJzQ
 87aA==
X-Gm-Message-State: ANhLgQ1l5txpSlvaAPKkZHU8v+2TSauwTZyEnMnjbuabyMeKzH7DPcP+
 gpJdfFuh99iGhMSvPQ7nc+3oEQ==
X-Google-Smtp-Source: ADFU+vs68v6rD0fnIgXIf5VZuVDhkS1dHB+iwYbZ3EbgUoDiwwZ42h1ciLNDB1/l5SqKo0YIsoBNwg==
X-Received: by 2002:a17:90a:8586:: with SMTP id
 m6mr250160pjn.121.1583881418103; 
 Tue, 10 Mar 2020 16:03:38 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-05c2-72f4-ac61-bc44.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:5c2:72f4:ac61:bc44])
 by smtp.gmail.com with ESMTPSA id l13sm3270684pjq.23.2020.03.10.16.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 16:03:37 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3] powerpc: setup_64: set up PACA earlier to avoid kcov
 problems
In-Reply-To: <87tv2wigj7.fsf@mpe.ellerman.id.au>
References: <20200306073000.9491-1-dja@axtens.net>
 <1583543617.bp71axgtlo.astroid@bobo.none> <87tv2wigj7.fsf@mpe.ellerman.id.au>
Date: Wed, 11 Mar 2020 10:03:32 +1100
Message-ID: <87lfo7q0cb.fsf@dja-thinkpad.axtens.net>
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>> So:
>>>  - change the test when setting up a PACA to consider the actual value of
>>>    the MSR rather than the CPU feature.
>>> 
>>>  - move the PACA setup to before the cpu feature parsing.
>>
>> Hmm. Problem is that equally we want PACA to be sane before we call too
>> far into the rest of the kernel ("generic dt parsing code").
>
> But currently we call into that code with no paca at all. Or rather,
> with r13 pointing somewhere random that will be interpreted as being a
> paca.
>
> This took a while for Daniel to debug because depending on how you boot
> r13 contains a different junk value. That junk value may not point to
> memory at all, or if it does the memory it points to may or may not send
> you down the wrong path, depending on which exact bit you're looking at
> in some random location.
>
> So this is really not about kcov from my POV, that's just how we
> discovered it.

Ah, yes. I agree with mpe, and reading back over my commit message I
think I did a pretty poor job of explaining it. How about this for a
commit message:

---

powerpc: setup_64: set up PACA before parsing device tree

Currently, we set up the PACA after parsing the device tree for CPU
features. Before that, r13 contains random data, which means there is
random data in r13 while we're running the generic dt parsing code.

This random data varies depending on whether we boot through a vmlinux or a
zImage: for the vmlinux case it's usually around zero, but for zImages we
see random values like 912a72603d420015.

This is poor practice, and can also lead to difficult-to-debug crashes. For
example, when kcov is enabled, the kcov instrumentation attempts to read
preempt_count out of the current task, which goes via the PACA. This then
crashes in the zImage case.

To resolve this:

 - move the PACA setup to before the cpu feature parsing.

 - because we no longer have access to cpu feature flags in PACA setup,
   change the HV feature test in the PACA setup path to consider the actual
   value of the MSR rather than the CPU feature.

Translations get switched on once we leave early_setup, so I think we'd
already catch any other cases where the PACA or task aren't set up.

Boot tested on a P9 guest and host.

Fixes: fb0b0a73b223 ("powerpc: Enable kcov")
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: stable@vger.kernel.org
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Daniel Axtens <dja@axtens.net>

---

Regards,
Daniel

>
> cheers
