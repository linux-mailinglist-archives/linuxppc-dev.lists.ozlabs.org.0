Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB6F266888
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 21:08:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp4zJ2kb7zDqwm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 05:08:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::143;
 helo=mail-il1-x143.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=FXr8cXXj; 
 dkim-atps=neutral
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp4xb4GPYzDqv3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 05:06:55 +1000 (AEST)
Received: by mail-il1-x143.google.com with SMTP id q6so9913103ild.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 12:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fu9rzzlC7afeKqqTdiX+yUaSBi4SNeovNk1YqVVkkr4=;
 b=FXr8cXXj9N1srWGXojCjYdVFU8rEp3MWtParl4p4zWHQERRPgB5TFquKa63HI+ynv2
 BmrwOkMa/5/m6B6sGTjLLVMOqeg+a/YdoSIsoOtBOWY85N2pe8lY/CaE5pVYRoItCUel
 H7GfqXP1v0Zh8fKVQZSXQZA5AwAWY8WHo12ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fu9rzzlC7afeKqqTdiX+yUaSBi4SNeovNk1YqVVkkr4=;
 b=kOP8codAZ2dbx77RdW+ovSBpiaOFaxgqD9ChS+xOEUncm+aipbPv5uxjQ0yBTBHBx8
 jEljR0q9GYn+6Mt0UrcczqV3slRpFEdXH5dICuJ/q0tXEzp/Yu7R7JwExg8kq14h1Gso
 HK+5ueVMDeXSr3qgWpeBsXPEE6FxEd+Cw5y4Mln1fy8iyPjK2CD3ZXsgVfvyq2JZLD1T
 jrp+EgDZS4n654SS8PHYfX6w+OR2bl4lDX++0qJTM/LQuSzb6gacTwSupnbjpmI83xbR
 JosM8vuV5o1oAVpXTecwgciKflX94xSQm3fMucYRa4EYKITBSOl2bC0me5mXse/mwR42
 3C5A==
X-Gm-Message-State: AOAM531mqXQlKjyKTTkn9IE8SvZg081g4t5RsZDUh8bpi7uXBWMEJyZf
 PviJQ9RcZig/b5BpMeuwtVsRlw==
X-Google-Smtp-Source: ABdhPJz0tQX4ghuQUQmATTE2mlYj9taHvR6EPB4Fpu63mLoRFCfGBKiE1KxX4IkIQ0vTM1IO77vbfg==
X-Received: by 2002:a92:da87:: with SMTP id u7mr2673311iln.155.1599851212189; 
 Fri, 11 Sep 2020 12:06:52 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id l14sm1661520ili.84.2020.09.11.12.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 12:06:51 -0700 (PDT)
Subject: Re: [PATCH v2] selftests/seccomp: fix ptrace tests on powerpc
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 linux-kselftest@vger.kernel.org
References: <20200911181012.171027-1-cascardo@canonical.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <bf1ddefb-6ee7-473b-a065-fb11f496333e@linuxfoundation.org>
Date: Fri, 11 Sep 2020 13:06:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911181012.171027-1-cascardo@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Shuah Khan <shuah@kernel.org>, Kees Cook <keescook@google.com>,
 Oleg Nesterov <oleg@redhat.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/11/20 12:10 PM, Thadeu Lima de Souza Cascardo wrote:
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
> ---
>   tools/testing/selftests/seccomp/seccomp_bpf.c | 81 ++++++++++++-------
>   1 file changed, 53 insertions(+), 28 deletions(-)
> 
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 7a6d40286a42..0ddc0846e9c0 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -1837,15 +1837,24 @@ void change_syscall(struct __test_metadata *_metadata,
>   #endif
>   
>   	/* If syscall is skipped, change return value. */
> -	if (syscall == -1)
> +	if (syscall == -1) {
>   #ifdef SYSCALL_NUM_RET_SHARE_REG
>   		TH_LOG("Can't modify syscall return on this architecture");
> -
>   #elif defined(__xtensa__)
>   		regs.SYSCALL_RET(regs) = result;
> +#elif defined(__powerpc__)
> +		/* Error is signaled by CR0 SO bit and error code is positive. */
> +		if (result < 0) {
> +			regs.SYSCALL_RET = -result;
> +			regs.ccr |= 0x10000000;
> +		} else {
> +			regs.SYSCALL_RET = result;
> +			regs.ccr &= ~0x10000000;
> +		}
>   #else
>   		regs.SYSCALL_RET = result;
>   #endif
> +	}
>   
>   #ifdef HAVE_GETREGS
>   	ret = ptrace(PTRACE_SETREGS, tracee, 0, &regs);
> @@ -1897,12 +1906,44 @@ void tracer_seccomp(struct __test_metadata *_metadata, pid_t tracee,
>   
>   }
>   
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
> +};
> +
> +FIXTURE_VARIANT_ADD(TRACE_syscall, ptrace) {
> +	.use_ptrace = true,
> +};
> +
> +FIXTURE_VARIANT_ADD(TRACE_syscall, seccomp) {
> +	.use_ptrace = false,
> +};
> +
>   void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
>   		   int status, void *args)
>   {
>   	int ret, nr;
>   	unsigned long msg;
>   	static bool entry;
> +	FIXTURE_VARIANT(TRACE_syscall) * variant = args;
>   
>   	/*
>   	 * The traditional way to tell PTRACE_SYSCALL entry/exit
> @@ -1916,10 +1957,15 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
>   	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
>   			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
>   
> -	if (!entry)
> +	if (!entry && !variant)
>   		return;
>   
> -	nr = get_syscall(_metadata, tracee);
> +	if (entry)
> +		nr = get_syscall(_metadata, tracee);
> +	else if (variant)
> +		nr = variant->syscall_nr;
> +	if (variant)
> +		variant->syscall_nr = nr;
>   
>   	if (nr == __NR_getpid)
>   		change_syscall(_metadata, tracee, __NR_getppid, 0);
> @@ -1929,29 +1975,6 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
>   		change_syscall(_metadata, tracee, -1, -ESRCH);
>   }
>   
> -FIXTURE(TRACE_syscall) {
> -	struct sock_fprog prog;
> -	pid_t tracer, mytid, mypid, parent;
> -};
> -
> -FIXTURE_VARIANT(TRACE_syscall) {
> -	/*
> -	 * All of the SECCOMP_RET_TRACE behaviors can be tested with either
> -	 * SECCOMP_RET_TRACE+PTRACE_CONT or plain ptrace()+PTRACE_SYSCALL.
> -	 * This indicates if we should use SECCOMP_RET_TRACE (false), or
> -	 * ptrace (true).
> -	 */
> -	bool use_ptrace;
> -};
> -
> -FIXTURE_VARIANT_ADD(TRACE_syscall, ptrace) {
> -	.use_ptrace = true,
> -};
> -
> -FIXTURE_VARIANT_ADD(TRACE_syscall, seccomp) {
> -	.use_ptrace = false,
> -};
> -
>   FIXTURE_SETUP(TRACE_syscall)
>   {
>   	struct sock_filter filter[] = {
> @@ -1992,7 +2015,9 @@ FIXTURE_SETUP(TRACE_syscall)
>   	self->tracer = setup_trace_fixture(_metadata,
>   					   variant->use_ptrace ? tracer_ptrace
>   							       : tracer_seccomp,
> -					   NULL, variant->use_ptrace);
> +					   variant->use_ptrace ? (void *) variant
> +							       : NULL,
> +					   variant->use_ptrace);
>   
>   	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
>   	ASSERT_EQ(0, ret);
> 

Hi Kees,

If you want to take this through your tree:

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
