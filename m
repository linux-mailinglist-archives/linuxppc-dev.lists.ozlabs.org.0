Return-Path: <linuxppc-dev+bounces-5533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E1DA1AC8E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 23:16:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfFfV1qBDz301x;
	Fri, 24 Jan 2025 09:16:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737670610;
	cv=none; b=BvrsBNuHk6luXm4LurY9Jh00tLVx/pAHfWrXDyHJ3LWmU5E1wW5zZFYJOAA3ka9SXoZ3j0gfb4WE7S1sTBxlHYxrc1yH/OEL8SNcbQ1SKnMG6izLJsNQvtigFGKdPe0W8xM4EYBvf01T/npXPKZn4n7s09k9iL5gFc6rKLkh+zcxK3i+IZ+KG7HaYwaWuxGNGm22WFrNz23Z21h0TAWT9sNk0Z+ksvc7Wn/10Cwnp1hDDK7+Yx3vUc2P7YN8YdpLYKrmY4WYUD9MWvE6pKchWknheknFD/yEb1BBDAedWLXLdKhOSJlhPm5un038IqlTM2eHeO3Na7iDowXPsyvbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737670610; c=relaxed/relaxed;
	bh=wXuGPfBCEzRVAjsQsTdSJWhIgl+YPJoYyWbdVN5xuO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlRQXjZ4jHddg70Q5HeVUMYInHoaKGN+ZQ4HrOEarooPjJC+b2m331aBdI2OuzWmW+qVtMVVanxRXe70C5gwMhtm4tLsJZUlPAqX7n93ZeBPV3C22zuFvmftf9bgFl5jZ8vSfMAToQGsah44M/yY7VzMpSEpoQMYOTjSR8akiA2W/3AveIIdK9eC+AJSf4eBnYPVDcRHuiLgmpogo9gKJ3u/XLH477eWB6Bs21TrMJ5F/ey6slDreiC5tMlNUZrJL5icVagwVMPpPRdLFP1TpjqXEfd4qpUAKnCKV/X53WOIRVlMvzh71MmCvvQtL3tnA1rnF9nt8MDaZSWwlRDEQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfFfT1YjHz2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 09:16:48 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 4AD2072C8CC;
	Fri, 24 Jan 2025 01:16:46 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 365237CCB3A; Fri, 24 Jan 2025 00:16:46 +0200 (IST)
Date: Fri, 24 Jan 2025 00:16:46 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Eugene Syromyatnikov <evgsyr@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
Message-ID: <20250123221646.GA22814@strace.io>
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250123182815.GA20994@strace.io>
 <CACGkJduSVLThnZkVFc0aJWjwD5AdBPmXLvZsqy2UxEVRrLm7EA@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkJduSVLThnZkVFc0aJWjwD5AdBPmXLvZsqy2UxEVRrLm7EA@mail.gmail.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 23, 2025 at 08:11:44PM +0100, Eugene Syromyatnikov wrote:
> On Thu, Jan 23, 2025 at 7:28 PM Dmitry V. Levin <ldv@strace.io> wrote:
> > Indeed, there is an inconsistency in !trap_is_scv case.
> >
> > In some places such as syscall_get_error() and regs_return_value() the
> > semantics is as I described earlier: gpr[3] contains a positive ERRORCODE
> > and ccr has 0x10000000 flag set.  This semantics is a part of the ABI and
> > therefore cannot be changed.
> >
> > In some other places like do_seccomp() and do_syscall_trace_enter() the
> > semantics is similar to the trap_is_scv case: gpr[3] contains a negative
> > ERRORCODE and ccr is unchanged.  In addition, system_call_exception()
> > returns the system call function return value when it is executed, and
> > gpr[3] otherwise.  The value returned by system_call_exception() is passed
> > on to syscall_exit_prepare() which performs the conversion you mentioned.
> >
> > What's remarkable is that in those places that are a part of the ABI the
> > traditional semantics is kept, while in other places the implementation
> > follows the trap_is_scv-like semantics, while traditional semantics is
> > also supported there.
> >
> > The only case where I see some intersection is do_seccomp() where the
> > tracer would be able to see -ENOSYS in gpr[3].  However, the seccomp stop
> > is not the place where the tracer *reads* the system call exit status,
> > so whatever was written in gpr[3] before __secure_computing() is not
> > really relevant, consequently, selftests/seccomp/seccomp_bpf passes with
> > this patch applied as well as without it.
> >
> > After looking at system_call_exception() I doubt this inconsistency can be
> > easily avoided, so I don't see how this patch could be enhanced further,
> > and what else could I do with the patch besides dropping it and letting
> > !trap_is_scv case be unsupported by PTRACE_SET_SYSCALL_INFO API, which
> > would be unfortunate.
> 
> The semantics of r3 on syscall return (including the negatedness of
> the errno value) is documented in [1] (at least for the 64-bit case,
> but I conjecture the 32-bit one is the same, sans the lack of the v2
> ABI and scv there), so I would suggest to consider any deviation from
> that a kernel programming error to be fixed.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arch/powerpc/syscall64-abi.rst?id=v6.13#n30

The semantics of r3 on syscall return is correct, thanks to
syscall_exit_prepare() that performs necessary manipulations with gpr[3].

What's wrong on powerpc in !trap_is_scv case is that its current
implementation of syscall_set_return_value() follows a different semantics,
making it unusable on syscall return.  While syscall_set_return_value() was
used only on entering syscall via do_seccomp(), it was not a problem yet.
It became a problem when we started to use it on syscall return, in the
same state when its sibling syscall_get_error() is used.  Note that among
all the architectures in the kernel tree powerpc in !trap_is_scv case is
the only one that has this problem.  My patch is intended to address this
without breaking anything else.


-- 
ldv

