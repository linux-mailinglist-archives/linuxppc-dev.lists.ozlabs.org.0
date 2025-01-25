Return-Path: <linuxppc-dev+bounces-5559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C819A1C30A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2025 13:18:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YgDGb0g0Fz300B;
	Sat, 25 Jan 2025 23:17:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737807479;
	cv=none; b=LEf+ED5fG0Ty6uhYTEgqNFPcdNVUhyA5bSkjr4/CWhwm3JSS8HOgoPw25gSHykwmQi2AHPBIpFtBXzACkF0XUNVnEDMTaliAVZKOy43D1CsXL7qAR52jiXdmbZ9Jck1Sa/HEyyd6akBw20dNi40SsvW0BDKGtzAPGuAt3a58pN1lInWAMfghMRm4LuyEg7esUzxz5aXDxWMCVBflRLLsWUdFfCa1bMA9QGnhKqs5SkAcGXDB3CL0/47o6rirXxjhF7aSqGx6n+axn1HOhmej1b9SezXSJn7WlZywz2+tYISRrhxIV37wTedp3h6TQz6kB8A+fHAOinqf/382MBCPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737807479; c=relaxed/relaxed;
	bh=Xlf8eY1Vm7on4m0M7BiRKmMXoxjLeDxW5n/WQFwdKOc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ij5ocJjc7b30LIqHmCuOKG8324UIH/mVkeKfy18vVNlVVrWi1XTkPcnzfNCHQBNv0Zx9WS3HFZTAofvA14nspUy9FIXes7asHhDz+BqpXWeXtTGY4O0gg1HC03BOKc/j1We+CoNX/RvAWjcLLsyThzZUe6Wccu3EqTsFVUInz6Ii9hg5GgkgVY6U9J0nNv82x9agQ3+dFg/MpyzsjGfBKa5nu39DrFkx9lnaMp3ANMa2XzASof6khRY+P7fzrhjGUpkuYApT/hx5VABrvdUMoui5mBCMD6KdWZ1T7OUCPblH6BgA6yVo21cgJ8Ugg8V7EzQ3ynKZY9UYIO3/CkP7Fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=izW/obeB; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=izW/obeB;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YgDGZ65kpz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2025 23:17:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1737807470;
	bh=Xlf8eY1Vm7on4m0M7BiRKmMXoxjLeDxW5n/WQFwdKOc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=izW/obeBdf4luPhTPxkNvj5TD2g3lyoh2pf9cULi+W+zcpdC6tL7lRLJQXIUwk+t/
	 CZtIXKaBQaq8biHYPwotESScPfEkBJy7JapuyjaPuvxXnxc8COTcdHr4VXYpFPxo+T
	 3FrhpNwCJtEOhNpr3d+Hx515ujMojfe0St26+ZABPUaH85VB9+EojXAvBIBE3aVscw
	 pGfyNoASy6Zwd9cyHfEGYg4kaizMS/q4rbYpty+BmJPCpu6F9i7XCnN5qm8I5Gg84C
	 he0dHyyooMJU6VzEgORAOSk/2MrAlrGyAZDEmnG3j3bY2DcPIXs4llq4SiM1Nur+9L
	 h3+m94xLKSlpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YgDGQ2X77z4wy9;
	Sat, 25 Jan 2025 23:17:50 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Dmitry V. Levin" <ldv@strace.io>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Cc: Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eugene Syromyatnikov <evgsyr@gmail.com>, Mike Frysinger
 <vapier@gentoo.org>, Renzo Davoli <renzo@cs.unibo.it>, Davide Berardi
 <berardi.dav@gmail.com>, strace-devel@lists.strace.io, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao
 <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
In-Reply-To: <20250123234321.GA23582@strace.io>
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250123182815.GA20994@strace.io> <20250123234321.GA23582@strace.io>
Date: Sat, 25 Jan 2025 23:17:58 +1100
Message-ID: <87jzajjde1.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

"Dmitry V. Levin" <ldv@strace.io> writes:
> On Thu, Jan 23, 2025 at 08:28:15PM +0200, Dmitry V. Levin wrote:
...
>> After looking at system_call_exception() I doubt this inconsistency can be
>> easily avoided, so I don't see how this patch could be enhanced further,
>> and what else could I do with the patch besides dropping it and letting
>> !trap_is_scv case be unsupported by PTRACE_SET_SYSCALL_INFO API, which
>> would be unfortunate.
>
> If you say this would bring some consistency, I can extend the patch with
> something like this:

Yes that would improve things IMHO, with one caveat ....

> diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> index 727ed4a14545..dda276a934fd 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> @@ -207,7 +207,7 @@ static int do_seccomp(struct pt_regs *regs)
>  	 * syscall parameter. This is different to the ptrace ABI where
>  	 * both r3 and orig_gpr3 contain the first syscall parameter.
>  	 */
> -	regs->gpr[3] = -ENOSYS;
> +	syscall_set_return_value(current, regs, -ENOSYS, 0);
>  
>  	/*
>  	 * We use the __ version here because we have already checked
> @@ -225,7 +225,7 @@ static int do_seccomp(struct pt_regs *regs)
>  	 * modify the first syscall parameter (in orig_gpr3) and also
>  	 * allow the syscall to proceed.
>  	 */
> -	regs->gpr[3] = regs->orig_gpr3;
> +	syscall_set_return_value(current, regs, 0, regs->orig_gpr3);

This case should remain as-is. The orig_gpr3 value here is not a syscall
error code, it's the original r3 value, which is a syscall parameter.

If the tracer wants to fail the syscall it should have set something in
r3, not orig_gpr3.

>  	return 0;
>  }
> @@ -315,7 +315,7 @@ long do_syscall_trace_enter(struct pt_regs *regs)
>  	 * If we are aborting explicitly, or if the syscall number is
>  	 * now invalid, set the return value to -ENOSYS.
>  	 */
> -	regs->gpr[3] = -ENOSYS;
> +	syscall_set_return_value(current, regs, -ENOSYS, 0);
>  	return -1;
>  }
>  
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index aa17e62f3754..c921e0cb54b8 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -229,14 +229,8 @@ static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
>  		regs_add_return_ip(regs, -4);
>  		regs->result = 0;
>  	} else {
> -		if (trap_is_scv(regs)) {
> -			regs->result = -EINTR;
> -			regs->gpr[3] = -EINTR;
> -		} else {
> -			regs->result = -EINTR;
> -			regs->gpr[3] = EINTR;
> -			regs->ccr |= 0x10000000;
> -		}
> +		regs->result = -EINTR;
> +		syscall_set_return_value(current, regs, -EINTR, 0);
>  	}
>  }

cheers

