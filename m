Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF2C26680E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 20:08:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp3f93BmhzDqkd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 04:08:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=cascardo@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp3cD3BfdzDqfc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:06:51 +1000 (AEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58] helo=mussarela)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1kGnRa-00014t-EF; Fri, 11 Sep 2020 18:06:42 +0000
Date: Fri, 11 Sep 2020 15:06:37 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] selftests/seccomp: fix ptrace tests on powerpc
Message-ID: <20200911180637.GI4002@mussarela>
References: <20200630164739.1268222-1-cascardo@canonical.com>
 <202009081505.D9FE52510B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202009081505.D9FE52510B@keescook>
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

On Tue, Sep 08, 2020 at 04:18:17PM -0700, Kees Cook wrote:
> On Tue, Jun 30, 2020 at 01:47:39PM -0300, Thadeu Lima de Souza Cascardo wrote:
> > As pointed out by Michael Ellerman, the ptrace ABI on powerpc does not
> > allow or require the return code to be set on syscall entry when
> > skipping the syscall. It will always return ENOSYS and the return code
> > must be set on syscall exit.
> > 
> > This code does that, behaving more similarly to strace. It still sets
> > the return code on entry, which is overridden on powerpc, and it will
> > always repeat the same on exit. Also, on powerpc, the errno is not
> > inverted, and depends on ccr.so being set.
> > 
> > This has been tested on powerpc and amd64.
> > 
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Kees Cook <keescook@google.com>
> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> 
> Yikes, I missed this from a while ago. I apologize for responding so
> late!
> 
> This appears still unfixed; is that correct?
> 

Yes. I will send a v2 on top of recent changes to the test.

> > ---
> >  tools/testing/selftests/seccomp/seccomp_bpf.c | 24 +++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> > index 252140a52553..b90a9190ba88 100644
> > --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> > +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> > @@ -1738,6 +1738,14 @@ void change_syscall(struct __test_metadata *_metadata,
> >  		TH_LOG("Can't modify syscall return on this architecture");
> >  #else
> >  		regs.SYSCALL_RET = result;
> > +# if defined(__powerpc__)
> > +		if (result < 0) {
> > +			regs.SYSCALL_RET = -result;
> > +			regs.ccr |= 0x10000000;
> > +		} else {
> > +			regs.ccr &= ~0x10000000;
> > +		}
> > +# endif
> >  #endif
> 
> Just so I understand correctly: for ppc to "see" this result, it needs
> to be both negative AND have this specific register set?
> 

Yes. According to Documentation/powerpc/syscall64-abi.rst:

"
- For the sc instruction, both a value and an error condition are returned.
  cr0.SO is the error condition, and r3 is the return value. When cr0.SO is
  clear, the syscall succeeded and r3 is the return value. When cr0.SO is set,
  the syscall failed and r3 is the error value (that normally corresponds to
  errno).
"

So, while some other arches will return -EINVAL, ppc returns EINVAL. And that
is distinguished from, say, read(2) returning 22 bytes read, by using CR.SO.

> >  
> >  #ifdef HAVE_GETREGS
> > @@ -1796,6 +1804,7 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
> >  	int ret, nr;
> >  	unsigned long msg;
> >  	static bool entry;
> > +	int *syscall_nr = args;
> >  
> >  	/*
> >  	 * The traditional way to tell PTRACE_SYSCALL entry/exit
> > @@ -1809,10 +1818,15 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
> >  	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
> >  			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
> >  
> > -	if (!entry)
> > +	if (!entry && !syscall_nr)
> >  		return;
> >  
> > -	nr = get_syscall(_metadata, tracee);
> > +	if (entry)
> > +		nr = get_syscall(_metadata, tracee);
> > +	else
> > +		nr = *syscall_nr;
> 
> This is weird? Shouldn't get_syscall() be modified to do the right thing
> here instead of depending on the extra arg?
> 

R0 might be clobered. Same documentation mentions it as volatile. So, during
syscall exit, we can't tell for sure that R0 will have the original syscall
number. So, we need to grab it during syscall enter, save it somewhere and
reuse it. I used the test context/args for that. That's the main change I had
to deal with after recent changes to the test. I used the variant struct now.

I only saw the need to do this under tracer_ptrace, as that was the only one
changing syscall return values using ptrace. And that can only be done during
syscall exit on ppc (ptrace ABI we can't break). So, changing get_syscall did
not seem necessary.

Thanks.
Cascardo.

> > +	if (syscall_nr)
> > +		*syscall_nr = nr;
> >  
> >  	if (nr == __NR_getpid)
> >  		change_syscall(_metadata, tracee, __NR_getppid, 0);
> > @@ -1889,9 +1903,10 @@ TEST_F(TRACE_syscall, ptrace_syscall_redirected)
> >  
> >  TEST_F(TRACE_syscall, ptrace_syscall_errno)
> >  {
> > +	int syscall_nr = -1;
> >  	/* Swap SECCOMP_RET_TRACE tracer for PTRACE_SYSCALL tracer. */
> >  	teardown_trace_fixture(_metadata, self->tracer);
> > -	self->tracer = setup_trace_fixture(_metadata, tracer_ptrace, NULL,
> > +	self->tracer = setup_trace_fixture(_metadata, tracer_ptrace, &syscall_nr,
> >  					   true);
> >  
> >  	/* Tracer should skip the open syscall, resulting in ESRCH. */
> > @@ -1900,9 +1915,10 @@ TEST_F(TRACE_syscall, ptrace_syscall_errno)
> >  
> >  TEST_F(TRACE_syscall, ptrace_syscall_faked)
> >  {
> > +	int syscall_nr = -1;
> >  	/* Swap SECCOMP_RET_TRACE tracer for PTRACE_SYSCALL tracer. */
> >  	teardown_trace_fixture(_metadata, self->tracer);
> > -	self->tracer = setup_trace_fixture(_metadata, tracer_ptrace, NULL,
> > +	self->tracer = setup_trace_fixture(_metadata, tracer_ptrace, &syscall_nr,
> >  					   true);
> >  
> >  	/* Tracer should skip the gettid syscall, resulting fake pid. */
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Kees Cook
