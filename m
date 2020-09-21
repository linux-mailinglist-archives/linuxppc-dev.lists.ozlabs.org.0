Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A684271C37
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 09:45:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvxM31N89zDqTq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 17:45:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ubuntu.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=christian.brauner@ubuntu.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ubuntu.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvxK41Kj2zDqcJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 17:44:08 +1000 (AEST)
Received: from ip5f5af089.dynamic.kabel-deutschland.de ([95.90.240.137]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1kKGUN-0001LG-Cy; Mon, 21 Sep 2020 07:43:55 +0000
Date: Mon, 21 Sep 2020 09:43:54 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2 1/4] selftests/seccomp: Record syscall during ptrace
 entry
Message-ID: <20200921074354.6shkt2e5yhzhj3sn@wittgenstein>
References: <20200919080637.259478-1-keescook@chromium.org>
 <20200919080637.259478-2-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200919080637.259478-2-keescook@chromium.org>
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Will Drewry <wad@chromium.org>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 19, 2020 at 01:06:34AM -0700, Kees Cook wrote:
> In preparation for performing actions during ptrace syscall exit, save
> the syscall number during ptrace syscall entry. Some architectures do
> no have the syscall number available during ptrace syscall exit.
> 
> Suggested-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> Link: https://lore.kernel.org/linux-kselftest/20200911181012.171027-1-cascardo@canonical.com/
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 40 +++++++++++++------
>  1 file changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index bc0fb463c709..c0311b4c736b 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -1949,12 +1949,19 @@ void tracer_seccomp(struct __test_metadata *_metadata, pid_t tracee,
>  
>  }
>  
> +FIXTURE(TRACE_syscall) {
> +	struct sock_fprog prog;
> +	pid_t tracer, mytid, mypid, parent;
> +	long syscall_nr;
> +};
> +
>  void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
>  		   int status, void *args)
>  {
> -	int ret, nr;
> +	int ret;
>  	unsigned long msg;
>  	static bool entry;
> +	FIXTURE_DATA(TRACE_syscall) *self = args;
>  
>  	/*
>  	 * The traditional way to tell PTRACE_SYSCALL entry/exit
> @@ -1968,24 +1975,31 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
>  	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
>  			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
>  
> -	if (!entry)
> +	/*
> +	 * Some architectures only support setting return values during
> +	 * syscall exit under ptrace, and on exit the syscall number may
> +	 * no longer be available. Therefore, save the initial sycall

s/sycall/syscall/

Otherwise looks good. Thanks!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>

> +	 * number here, so it can be examined during both entry and exit
> +	 * phases.
> +	 */
> +	if (entry)
> +		self->syscall_nr = get_syscall(_metadata, tracee);
> +	else
>  		return;
>  
> -	nr = get_syscall(_metadata, tracee);
> -
> -	if (nr == __NR_getpid)
> +	switch (self->syscall_nr) {
> +	case __NR_getpid:
>  		change_syscall(_metadata, tracee, __NR_getppid, 0);
> -	if (nr == __NR_gettid)
> +		break;
> +	case __NR_gettid:
>  		change_syscall(_metadata, tracee, -1, 45000);
> -	if (nr == __NR_openat)
> +		break;
> +	case __NR_openat:
>  		change_syscall(_metadata, tracee, -1, -ESRCH);
> +		break;
> +	}
>  }
>  
> -FIXTURE(TRACE_syscall) {
> -	struct sock_fprog prog;
> -	pid_t tracer, mytid, mypid, parent;
> -};
> -
>  FIXTURE_VARIANT(TRACE_syscall) {
>  	/*
>  	 * All of the SECCOMP_RET_TRACE behaviors can be tested with either
> @@ -2044,7 +2058,7 @@ FIXTURE_SETUP(TRACE_syscall)
>  	self->tracer = setup_trace_fixture(_metadata,
>  					   variant->use_ptrace ? tracer_ptrace
>  							       : tracer_seccomp,
> -					   NULL, variant->use_ptrace);
> +					   self, variant->use_ptrace);
>  
>  	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
>  	ASSERT_EQ(0, ret);
> -- 
> 2.25.1
> 
