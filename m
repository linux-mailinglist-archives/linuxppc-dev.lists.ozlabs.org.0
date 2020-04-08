Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3F71A200D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 13:42:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y2Sg3PQHzDqfs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 21:42:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y2QC1BsNzDqNB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 21:40:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oy1Ko4Ty; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48y2Q95bjyz9sQx;
 Wed,  8 Apr 2020 21:40:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1586346018;
 bh=SWxr6DZCPX6av/d049MVH0Osj8auO5/3YgUkMRV1jNs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oy1Ko4TydPHflOQQaEHPSQ6+DXszbHPncZCLrKtqCRfvB5/J0jsUICGT61wDzKTC8
 ULrR/W3zM8LbV+8JaSQEdOY+ElSg1pQ3uaNqAqb4Z5JlH1S2MyrCnr/72LEtJ735Hp
 l/JzK3o8fVEbOE1EaCOPg1fKcImzD+V5QuPeSzfXp/6s5Bk+cGvocWmpl5cV2q40Jr
 jpwvE85g4tCKInEktQvJRwfwVUMgMMtrQJbAayam+FAGV9HSB5gdVCC6qJ2tLxCsFQ
 8BrgOb0BkWEtPMCf2MM/8YBKB93kvha9ranUJjM3OzOpJEznEdX/1D/HykkffPp3fK
 9acwsVK791EzA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/ptrace: Do not return ENOSYS if invalid syscall
In-Reply-To: <20200329175957.24264-1-cascardo@canonical.com>
References: <20200329175957.24264-1-cascardo@canonical.com>
Date: Wed, 08 Apr 2020 21:40:25 +1000
Message-ID: <874ktukxxy.fsf@mpe.ellerman.id.au>
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Kees Cook <keescook@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Cascardo,

Thanks for following-up on this.

Unfortunately I don't think I can merge this fix.

Thadeu Lima de Souza Cascardo <cascardo@canonical.com> writes:
> If a tracer sets the syscall number to an invalid one, allow the return
> value set by the tracer to be returned the tracee.

The problem is this patch not only *allows* the tracer to set the return
value, but it also *requires* the tracer to set the return value. That
would be a change to the ABI.

Currently if a tracer sets the syscall number to -1, that's all they
need to do, and the kernel will make sure ENOSYS is returned to the
tracee.

With this patch applied the tracer can set the syscall to -1 but they
also must set the return value explicitly. Otherwise the syscall will
just return with whatever value happens to be in r3.

I confirmed this patch breaks the strace testsuite:

  # cd strace/tests/
  # bash qual_inject-retval.test
  ../../strace: Failed to tamper with process 13301: unexpectedly got no error (return value 0x10001090, error 0)
  expected retval 0, got retval 268439696
  chdir("..") = 268439696 (INJECTED)
  +++ exited with 1 +++
  qual_inject-retval.test: failed test: ../../strace -a12 -echdir -einject=chdir:retval=0 ../qual_inject-retval 0 failed with code 1

The return value 0x10001090 is the address of the ".." string passed to
the syscall.

> The test for NR_syscalls is already at entry_64.S, and it's at
> do_syscall_trace_enter only to skip audit and trace.
>
> After this, two failures from seccomp_bpf selftests complete just fine,
> as the failing test was using ptrace to change the syscall to return an
> error or a fake value, but were failing as it was always returning
> -ENOSYS.

This test wants to change the syscall number and the return value, and
do both from the syscall enter hook.

We don't support that, because we have no way of knowing if the tracer
set the return value, so we always return ENOSYS. Our ptrace ABI has
been that way forever.

We could possibly do something like compare r3 and orig_gpr3 and assume
that if they're different then the tracer has set r3 to the return
value. But I worry that will break something and/or just be very subtle
and bug prone.

I think the right way to fix it is for the test case to change the
return value from the syscall exit hook. That will work on all existing
kernels AFAIK. It's also what strace does.

cheers


> diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
> index 25c0424e8868..557ae4bc2331 100644
> --- a/arch/powerpc/kernel/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace.c
> @@ -3314,7 +3314,7 @@ long do_syscall_trace_enter(struct pt_regs *regs)
> 
> 	/* Avoid trace and audit when syscall is invalid. */
> 	if (regs->gpr[0] >= NR_syscalls)
> -		goto skip;
> +		return regs->gpr[0];
> 
> 	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
> 		trace_sys_enter(regs, regs->gpr[0]);
