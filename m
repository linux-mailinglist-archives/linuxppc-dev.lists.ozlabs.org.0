Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B8643BE1F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 01:48:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf7nd5gkbz3bT7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 10:48:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=yFhDg/St;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20210112.gappssmtp.com
 header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=yFhDg/St; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf7mw1Rmhz2xYP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 10:48:15 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id n11so701880plf.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 16:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=njkqslFi81CJdgjpKZ7lE+Q4NAM4QezMjn79c9rwW5I=;
 b=yFhDg/St14S+JDyXq1zwYeKBE7rKhdYF5Zw3ZgGu4s1uaqfuZ0/bYQX1NECpjNzGq4
 wAM2ynstuBaRQAZx5AXhAWAKiSpv5XwruTRmn0f6EDokEdhN1eeLaYi7lJs7mDbopAaz
 7sCQUnYsUbUJ5YFDwl1acbZCre3GkfxoIzyZBoJ2YDbnxCbe9j6X+eFDAjWcZI/Po8Do
 EykTs0QggjLE4JX+GkQ6825B038xMW+JIUUeBtpKTyevs0tgoDRRWRi/vHX8g2B34AyJ
 GZTz43gHVYLExc9thO9e6wAs1nLbTFz1Xvs2R6LkqhyTk4Id1tTnoJC5bOz/lNb0aCGu
 KmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=njkqslFi81CJdgjpKZ7lE+Q4NAM4QezMjn79c9rwW5I=;
 b=x36zWWdaDAQMcCmlWqdIcZbHbLQ5rejOuTyIRDsUxEZcJgCGrfDwYQZAIo4a5iEpsv
 wT7mtYiBXE1K9Tm3UScERBHsV+4tz+1MZmyzk2/ijrx38/Xvycfa1dDDGYqqlcGz5pV2
 Q2DWQyGvqJ/lgdPZMktI7lRwhlEV6beaWGv7hguzXLwjjElTQPn6AQj+6JjSdm7Yaaa+
 sBdRuLBa2y4renHO+9kTVQaekPh8BCV9Zj5C9MBvRXc6/JUmt30wGLHWQNWZCiUYyyUj
 MEBzJ/saXlcsTk5uSojBi1A0Swr8GQ1KdUR4ybV8JzMIAcLcZ0SMqUWxu1nygAQuFMD3
 48Eg==
X-Gm-Message-State: AOAM531T1mSLwW0iwhQuP2HN6/W0dosQGqz8EZPJMROORt4995BFgMFO
 7ahReEKISC1jyFj3vIcrhXTfKQ==
X-Google-Smtp-Source: ABdhPJyuv44a0itknKhOqmu4SkSph1yjSLOlDm2TgYU9DxwigHNlYFAslzREtZoefsT/F90ImhvUvQ==
X-Received: by 2002:a17:90a:4b85:: with SMTP id
 i5mr2110945pjh.25.1635292091032; 
 Tue, 26 Oct 2021 16:48:11 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:676c:ab93:f48d:23ae])
 by smtp.gmail.com with ESMTPSA id i5sm20437959pgo.36.2021.10.26.16.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:48:10 -0700 (PDT)
Date: Tue, 26 Oct 2021 16:48:10 -0700 (PDT)
X-Google-Original-Date: Tue, 26 Oct 2021 16:24:16 PDT (-0700)
Subject: Re: [PATCH 0/2] ftrace: make sure preemption disabled on recursion
 testing
In-Reply-To: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yun.wang@linux.alibaba.com
Message-ID: <mhng-95994d12-e1d9-43b3-bef0-c5c844ffcf86@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: peterz@infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 James.Bottomley@HansenPartnership.com, guoren@kernel.org, jszhang@kernel.org,
 hpa@zytor.com, live-patching@vger.kernel.org, linux-riscv@lists.infradead.org,
 mbenes@suse.cz, paulus@samba.org, joe.lawrence@redhat.com, deller@gmx.de,
 x86@kernel.org, linux-csky@vger.kernel.org, mingo@redhat.com, pmladek@suse.com,
 aou@eecs.berkeley.edu, jikos@kernel.org, rostedt@goodmis.org, bp@alien8.de,
 npiggin@gmail.com, jpoimboe@redhat.com, tglx@linutronix.de,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mhiramat@kernel.org, colin.king@canonical.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 11 Oct 2021 22:39:16 PDT (-0700), yun.wang@linux.alibaba.com wrote:
> The testing show that perf_ftrace_function_call() are using
> smp_processor_id() with preemption enabled, all the checking
> on CPU could be wrong after preemption, PATCH 1/2 will fix
> that.
>
> Besides, as Peter point out, the testing of recursion within
> the section between ftrace_test_recursion_trylock()/_unlock()
> pair also need the preemption disabled as the documentation
> explained, PATCH 2/2 will make sure on that.
>
> Michael Wang (2):
>   ftrace: disable preemption on the testing of recursion
>   ftrace: prevent preemption in perf_ftrace_function_call()
>
>  arch/csky/kernel/probes/ftrace.c     |  2 --
>  arch/parisc/kernel/ftrace.c          |  2 --
>  arch/powerpc/kernel/kprobes-ftrace.c |  2 --
>  arch/riscv/kernel/probes/ftrace.c    |  2 --
>  arch/x86/kernel/kprobes/ftrace.c     |  2 --
>  include/linux/trace_recursion.h      | 10 +++++++++-
>  kernel/livepatch/patch.c             |  6 ------
>  kernel/trace/trace_event_perf.c      | 17 +++++++++++++----
>  kernel/trace/trace_functions.c       |  5 -----
>  9 files changed, 22 insertions(+), 26 deletions(-)

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com> # RISC-V
