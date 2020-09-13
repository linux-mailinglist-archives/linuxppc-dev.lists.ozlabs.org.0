Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E24267E65
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Sep 2020 09:37:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bq1Xf03BjzDqjj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Sep 2020 17:37:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bq1Vq5Z7rzDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Sep 2020 17:35:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=i55cJI9v; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bq1Vp4HL6z9sTK;
 Sun, 13 Sep 2020 17:35:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599982531;
 bh=8Sv9OAE4LX4Fbfh3aETl/Lbe+rg63e+KJVl64HAnYnA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=i55cJI9vGLo3mP5CrxkvIyQMGuRzYz59DHcZqDZLTgaBo6oo1OHgnF4m0r/b7EOyw
 hkYEwkt2NvnW4UzAWjog1kvxNuQ4UTyUo7FiYVO2KUwrbjRWt1Y8dwLgpeEoq25cOa
 +cC1JW5Ne25Csp1LJMlzeGW2j40sVTlQTqkuqafNREt2WK7+ygafFQFrJope/J2vhK
 r5KlhdW2x0c3j9PYZ/4K18l1MpR56TDjlMSiHWlaSeLXc1fImFm/DSU4N+VfO6RKfd
 C0fUuZCFksNRFKFta4Aqxmx98xe0L2B5Fn7dUIaGQ+oOxBYeyx01qUPdVMv23CpfXs
 yilGmT5Wf2MdQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>,
 Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Subject: Re: [PATCH v2] selftests/seccomp: fix ptrace tests on powerpc
In-Reply-To: <202009111550.07017FE49@keescook>
References: <20200911181012.171027-1-cascardo@canonical.com>
 <202009111550.07017FE49@keescook>
Date: Sun, 13 Sep 2020 17:35:29 +1000
Message-ID: <87ft7mqgce.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Shuah Khan <shuah@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kees Cook <keescook@chromium.org> writes:
> On Fri, Sep 11, 2020 at 03:10:12PM -0300, Thadeu Lima de Souza Cascardo wrote:
...
>> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
>> index 7a6d40286a42..0ddc0846e9c0 100644
>> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
>> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
>> @@ -1916,10 +1957,15 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
>>  	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
>>  			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
>>  
>> -	if (!entry)
>> +	if (!entry && !variant)
>>  		return;
>>  
>> -	nr = get_syscall(_metadata, tracee);
>> +	if (entry)
>> +		nr = get_syscall(_metadata, tracee);
>> +	else if (variant)
>> +		nr = variant->syscall_nr;
>> +	if (variant)
>> +		variant->syscall_nr = nr;
>
> So, to be clear this is _only_ an issue for the ptrace side of things,
> yes? i.e. seccomp's setting of the return value will correct stick?

Yes. There's a comment which (hopefully) explains the difference here:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/kernel/ptrace/ptrace.c?commit=ab29a807a7ddaa7c84d2f4cb8d29e74e33759072#n239

Which says:

static int do_seccomp(struct pt_regs *regs)
{
	if (!test_thread_flag(TIF_SECCOMP))
		return 0;

	/*
	 * The ABI we present to seccomp tracers is that r3 contains
	 * the syscall return value and orig_gpr3 contains the first
	 * syscall parameter. This is different to the ptrace ABI where
	 * both r3 and orig_gpr3 contain the first syscall parameter.
	 */
	regs->gpr[3] = -ENOSYS;


cheers
