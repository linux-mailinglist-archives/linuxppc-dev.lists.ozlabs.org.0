Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA96262384
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 01:20:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmLhv3vZKzDqTW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 09:19:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=G3VvR59v; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmLg25v27zDqRY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 09:18:21 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id w186so633721pgb.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Sep 2020 16:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wu24fROSE6OJyT2U+h+4ypV+AtKEO78txVznCuf+1MM=;
 b=G3VvR59v/PehD0iZFR5hVbo4hLWkwmK96kgLc5vuv2xdwKaItX+gfsJMez7EnNLVuP
 WjNPco9VHueCsxy7M/t54x8Yqc+2DUR398+cTSERl4pUov63+KGg6Eq80ryRtVeaUaCj
 N5cJ7RkbCGVTd9Fnr4KKuP1Uoi83l5JUjvARI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wu24fROSE6OJyT2U+h+4ypV+AtKEO78txVznCuf+1MM=;
 b=n9LchuYUjth75xnUInTxtBr9WtbfQBK4n4XUtAz6fFACRJgNaf+f2KzQ7j7kTthNfq
 LA2PyuuYoIbL3TCJCovSswqVW0DjrWctGb+sQb8akr1IoUOQvpNWbzjDV0OHawxefPuP
 f3RZlPnTbg1PmWjzqrZ6NUPXSGfrlACyX2IggEny5LfGAY7dovRPGIuN+w21NidTYG9f
 Ke3ft/Z2vQAVX/RwtgvOvQCENNnGs+WMbsiK0Xz96H8hqvO0J2jpLTO4NV/Qjg5FiZi9
 Rk0aOfo6BC2bWQyl1XhJMyuyvzUM8mV4Bh0Bs59L96Zdyi+29dMInZGgu87MNZI7oovY
 QjDA==
X-Gm-Message-State: AOAM531+pMG3Bt51ZR7b9ZyduGacvHdwnYakjKyAEQvaRZIsyDyUpMgB
 phPOBYE/DSyVptRgoi/anTD6tA==
X-Google-Smtp-Source: ABdhPJznkhzxWTeVOWGaIC4OeBgnWbnmUmyxL57hr9a1gp/duDJ16gJvr1mTfjFgfp4fA/mHh/6eOw==
X-Received: by 2002:aa7:911a:0:b029:13e:d13d:a13d with SMTP id
 26-20020aa7911a0000b029013ed13da13dmr1321139pfh.37.1599607099458; 
 Tue, 08 Sep 2020 16:18:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 25sm242806pjh.57.2020.09.08.16.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 16:18:18 -0700 (PDT)
Date: Tue, 8 Sep 2020 16:18:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Subject: Re: [PATCH] selftests/seccomp: fix ptrace tests on powerpc
Message-ID: <202009081505.D9FE52510B@keescook>
References: <20200630164739.1268222-1-cascardo@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630164739.1268222-1-cascardo@canonical.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Shuah Khan <shuah@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 30, 2020 at 01:47:39PM -0300, Thadeu Lima de Souza Cascardo wrote:
> As pointed out by Michael Ellerman, the ptrace ABI on powerpc does not
> allow or require the return code to be set on syscall entry when
> skipping the syscall. It will always return ENOSYS and the return code
> must be set on syscall exit.
> 
> This code does that, behaving more similarly to strace. It still sets
> the return code on entry, which is overridden on powerpc, and it will
> always repeat the same on exit. Also, on powerpc, the errno is not
> inverted, and depends on ccr.so being set.
> 
> This has been tested on powerpc and amd64.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Kees Cook <keescook@google.com>
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

Yikes, I missed this from a while ago. I apologize for responding so
late!

This appears still unfixed; is that correct?

> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 24 +++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 252140a52553..b90a9190ba88 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -1738,6 +1738,14 @@ void change_syscall(struct __test_metadata *_metadata,
>  		TH_LOG("Can't modify syscall return on this architecture");
>  #else
>  		regs.SYSCALL_RET = result;
> +# if defined(__powerpc__)
> +		if (result < 0) {
> +			regs.SYSCALL_RET = -result;
> +			regs.ccr |= 0x10000000;
> +		} else {
> +			regs.ccr &= ~0x10000000;
> +		}
> +# endif
>  #endif

Just so I understand correctly: for ppc to "see" this result, it needs
to be both negative AND have this specific register set?

>  
>  #ifdef HAVE_GETREGS
> @@ -1796,6 +1804,7 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
>  	int ret, nr;
>  	unsigned long msg;
>  	static bool entry;
> +	int *syscall_nr = args;
>  
>  	/*
>  	 * The traditional way to tell PTRACE_SYSCALL entry/exit
> @@ -1809,10 +1818,15 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
>  	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
>  			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
>  
> -	if (!entry)
> +	if (!entry && !syscall_nr)
>  		return;
>  
> -	nr = get_syscall(_metadata, tracee);
> +	if (entry)
> +		nr = get_syscall(_metadata, tracee);
> +	else
> +		nr = *syscall_nr;

This is weird? Shouldn't get_syscall() be modified to do the right thing
here instead of depending on the extra arg?

> +	if (syscall_nr)
> +		*syscall_nr = nr;
>  
>  	if (nr == __NR_getpid)
>  		change_syscall(_metadata, tracee, __NR_getppid, 0);
> @@ -1889,9 +1903,10 @@ TEST_F(TRACE_syscall, ptrace_syscall_redirected)
>  
>  TEST_F(TRACE_syscall, ptrace_syscall_errno)
>  {
> +	int syscall_nr = -1;
>  	/* Swap SECCOMP_RET_TRACE tracer for PTRACE_SYSCALL tracer. */
>  	teardown_trace_fixture(_metadata, self->tracer);
> -	self->tracer = setup_trace_fixture(_metadata, tracer_ptrace, NULL,
> +	self->tracer = setup_trace_fixture(_metadata, tracer_ptrace, &syscall_nr,
>  					   true);
>  
>  	/* Tracer should skip the open syscall, resulting in ESRCH. */
> @@ -1900,9 +1915,10 @@ TEST_F(TRACE_syscall, ptrace_syscall_errno)
>  
>  TEST_F(TRACE_syscall, ptrace_syscall_faked)
>  {
> +	int syscall_nr = -1;
>  	/* Swap SECCOMP_RET_TRACE tracer for PTRACE_SYSCALL tracer. */
>  	teardown_trace_fixture(_metadata, self->tracer);
> -	self->tracer = setup_trace_fixture(_metadata, tracer_ptrace, NULL,
> +	self->tracer = setup_trace_fixture(_metadata, tracer_ptrace, &syscall_nr,
>  					   true);
>  
>  	/* Tracer should skip the gettid syscall, resulting fake pid. */
> -- 
> 2.25.1
> 

-- 
Kees Cook
