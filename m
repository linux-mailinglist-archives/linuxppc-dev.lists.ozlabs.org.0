Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F0426763C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 00:56:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpB2w5ySFzDqxM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 08:56:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=HN05FZ3y; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpB115vMKzDqY1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 08:55:17 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id v14so1043496pjd.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 15:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iX6KR3pc5397HS6ez1wFsDhHanMLDv7OBoBWmZ3PEHo=;
 b=HN05FZ3yebd7C8xF8qlewkgl2Rwb8UhTBnIb4gX37F6tu74AWBloSnZ3FUvxEYXy0S
 hHOe/C3ueHONgOSsFiyTrgkkQNtGuA36Vlo9FAEvnjm6HGX/l58wDqlAazc3IrSEOhgS
 U5acurJDk1UKic45wjMeDqp9xdcvnYjPRmESo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iX6KR3pc5397HS6ez1wFsDhHanMLDv7OBoBWmZ3PEHo=;
 b=FFqfCQ8Ckf6LS39iuv78Of8kwgZc2QgARJG40n7rBQ8WnMMGVK9HODABroACUYzPo8
 RaR6YnWwn2ozR9Ostbe5sAEnNBOnnekxd/P/HvtMkMrHgf4Y29cKlNhI1eRRwKB90ak8
 dkTH57E6JHtWj1HnVeEvS9sSDFwE412qCzFjrH9rwtF8Xvt4vYWupNv4QfdA60m4gpeg
 48scqHB19iQn+R3/vilwXhGowQ67CjZixoKUmqAy8ebvlHfxUxYv9YqCzYB2yzGgBEX2
 RZR7Tv/VqITUnO/7pE0i1WPE30AH7xb3f2LDpoB5oWx7ED4Gs1T+yhNaeNveea0U+OZi
 w1hQ==
X-Gm-Message-State: AOAM532waW3H8HNjy38jzc1SVHMAhXa8rEe0gYr5Y3l/VhhzeKKFUejl
 +zaa0BUvBvoyvuIyFsjv+qXUbQ==
X-Google-Smtp-Source: ABdhPJwRzbReZ3ccesoO8GBhTg3vNXkSnDymKYLOphShCuQvCPw0S/l7+g4VX1awcE2hETunelGaDA==
X-Received: by 2002:a17:90a:d488:: with SMTP id
 s8mr4332117pju.176.1599864914549; 
 Fri, 11 Sep 2020 15:55:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a27sm3270050pfk.52.2020.09.11.15.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 15:55:13 -0700 (PDT)
Date: Fri, 11 Sep 2020 15:55:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Subject: Re: [PATCH v2] selftests/seccomp: fix ptrace tests on powerpc
Message-ID: <202009111550.07017FE49@keescook>
References: <20200911181012.171027-1-cascardo@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911181012.171027-1-cascardo@canonical.com>
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

On Fri, Sep 11, 2020 at 03:10:12PM -0300, Thadeu Lima de Souza Cascardo wrote:
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

This looks like two fixes in one, so this should be split. :)

>  tools/testing/selftests/seccomp/seccomp_bpf.c | 81 ++++++++++++-------
>  1 file changed, 53 insertions(+), 28 deletions(-)
> 
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 7a6d40286a42..0ddc0846e9c0 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -1837,15 +1837,24 @@ void change_syscall(struct __test_metadata *_metadata,
>  #endif
>  
>  	/* If syscall is skipped, change return value. */
> -	if (syscall == -1)
> +	if (syscall == -1) {
>  #ifdef SYSCALL_NUM_RET_SHARE_REG
>  		TH_LOG("Can't modify syscall return on this architecture");
> -
>  #elif defined(__xtensa__)
>  		regs.SYSCALL_RET(regs) = result;
> +#elif defined(__powerpc__)
> +		/* Error is signaled by CR0 SO bit and error code is positive. */
> +		if (result < 0) {
> +			regs.SYSCALL_RET = -result;
> +			regs.ccr |= 0x10000000;
> +		} else {
> +			regs.SYSCALL_RET = result;
> +			regs.ccr &= ~0x10000000;
> +		}
>  #else
>  		regs.SYSCALL_RET = result;
>  #endif
> +	}

I'll send a series soon that will include this bit, since I don't want
to collect these kinds of arch-specific things in the functions. (And
the xtensa one went in without my review!)

> +FIXTURE(TRACE_syscall) {
> +	struct sock_fprog prog;
> +	pid_t tracer, mytid, mypid, parent;
> +};
> +
> +FIXTURE_VARIANT(TRACE_syscall) {
> +	/*
> +	 * All of the SECCOMP_RET_TRACE behaviors can be tested with either
> +	 * SECCOMP_RET_TRACE+PTRACE_CONT or plain ptrace()+PTRACE_SYSCALL.
> +	 * This indicates if we should use SECCOMP_RET_TRACE (false), or
> +	 * ptrace (true).
> +	 */
> +	bool use_ptrace;
> +
> +	/*
> +	 * Some archs (like ppc) only support changing the return code during
> +	 * syscall exit when ptrace is used.  As the syscall number might not
> +	 * be available anymore during syscall exit, it needs to be saved
> +	 * during syscall enter.
> +	 */
> +	int syscall_nr;

This should be part of the fixture struct, not the variant. 

> +};
> +
> +FIXTURE_VARIANT_ADD(TRACE_syscall, ptrace) {
> +	.use_ptrace = true,
> +};
> +
> +FIXTURE_VARIANT_ADD(TRACE_syscall, seccomp) {
> +	.use_ptrace = false,
> +};

i.e. if a member isn't initialized in FIXTURE_VARIANT_ADD, it shouldn't
be defined in FIXTURE_VARIANT. :)

> +
>  void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
>  		   int status, void *args)
>  {
>  	int ret, nr;
>  	unsigned long msg;
>  	static bool entry;
> +	FIXTURE_VARIANT(TRACE_syscall) * variant = args;
>  
>  	/*
>  	 * The traditional way to tell PTRACE_SYSCALL entry/exit
> @@ -1916,10 +1957,15 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
>  	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
>  			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
>  
> -	if (!entry)
> +	if (!entry && !variant)
>  		return;
>  
> -	nr = get_syscall(_metadata, tracee);
> +	if (entry)
> +		nr = get_syscall(_metadata, tracee);
> +	else if (variant)
> +		nr = variant->syscall_nr;
> +	if (variant)
> +		variant->syscall_nr = nr;

So, to be clear this is _only_ an issue for the ptrace side of things,
yes? i.e. seccomp's setting of the return value will correct stick?

-- 
Kees Cook
