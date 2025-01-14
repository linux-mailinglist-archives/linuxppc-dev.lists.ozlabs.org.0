Return-Path: <linuxppc-dev+bounces-5234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C308BA109F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 15:53:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXXF63TvZz30MY;
	Wed, 15 Jan 2025 01:53:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736866410;
	cv=none; b=bKDlolMk4Ob1F0TPv/YNN/U1j8fP7OwK4AX1YKpiZV/whPGe1zzu/eG9cLyZ6iOI+fsuwaOdD8bgaUiIuVYMzUXgB6BfNbpI+Prsh7XlZAI5ZKQmZGc+BD/xWYzirBAAPVVYkR8zoQC8ZIt5qH2Q+cojV0eTVOUiwQ8SX4iYwfY5LwztUPgp9pW9t19fBcGct1o3NFRv74uFZNgMKgrQtai1+ZeseTLyVAuda/uNkD7XTkRuinkfwIT1SO95tqeHJ93Z7YBhfH5JxW9RzQk9a4PlSJ0fDkgA4DalH/f6Y0Fqz3t+ovFUeWtkXTDsbDW4i6HikEu6pzvxJDjva1Xifg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736866410; c=relaxed/relaxed;
	bh=Cc5Il5mwNtVcx/L6pMmkO5FbgxYdryKZBJ7qFoq1Rlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6M1xaFP1yzFfmGBa4PSOdykdi8J5u7gKUHIL0FuATKcgcAnQ1U0kwLjwgy+24YiQR4CY/aUtzBGXSgjxr3IMxtQ/HvUsgbodWARzjETZ9U+P8rbDA7dKoRaLlZhYcdSBJQoJ9wZTEocDFgy2tYjoSsXM+hcija2xzVQvCxLkR89285MnmPOWpvB6xWX3VPYn5pz/KfkmjKiXIqQMp4D8ke04JNzUm2leEHM2+ho8bEIYQtXSCNPZrIkZtOdyFZ+nZtG+SNTjues/P8Y8aF+xFfG/VAE4VL0jE00wVSBS6++pG81tWMTHDCnq9+9GvlBQh4dgdA+Gh8je9DNxGmRVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GTsoqL4s; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GTsoqL4s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=legion@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXXF52qdWz30Dw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 01:53:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2C7DA41694;
	Tue, 14 Jan 2025 14:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFD6C4CEDD;
	Tue, 14 Jan 2025 14:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736866406;
	bh=MLxWvNuHvrzVQA3rWXD9Jq5n8QtB9LWjCoeozHXX6h4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GTsoqL4sltE3LtRbnFeEfoDTvimp557zuR6CSUzBFqV9DPWA5rQXXwAgMF/AbDewj
	 SHcrhXfNafUqKJYmD83OSsnaK+yLevQrPlSciAqoNbyvV3jZCyPNGUONI3Da3lqPDW
	 +W3uf4xDbN7XsbK5N1F6+baisPzNF26lAj+32/o5AnnjX720g86xUuAW8FC8mz6Ns3
	 LyhfDm3eAfP2rcp0rec41mjRfetwc3d5HtKVeRkeHnMyyKYQQF8LNz29tWNRcQDrvG
	 gKGJ/gaRQJOk+2Sbd0mRHgdStcZf1kSv4V7jOiKQZQvX40Z4gRk3BeFyv9vYR6DmYL
	 qwJQdLlR2I8aw==
Date: Tue, 14 Jan 2025 15:53:20 +0100
From: Alexey Gladkov <legion@kernel.org>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Oleg Nesterov <oleg@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
Message-ID: <Z4Z6YJOsCl69_41-@example.org>
References: <20250113170925.GA392@strace.io>
 <20250113171054.GA589@strace.io>
 <Z4Zf4MppsrpoPiC1@example.org>
 <20250114134844.GA10630@strace.io>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114134844.GA10630@strace.io>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 14, 2025 at 03:48:44PM +0200, Dmitry V. Levin wrote:
> On Tue, Jan 14, 2025 at 02:00:16PM +0100, Alexey Gladkov wrote:
> > On Mon, Jan 13, 2025 at 07:10:54PM +0200, Dmitry V. Levin wrote:
> > > Bring syscall_set_return_value() in sync with syscall_get_error(),
> > > and let upcoming ptrace/set_syscall_info selftest pass on powerpc.
> > > 
> > > This reverts commit 1b1a3702a65c ("powerpc: Don't negate error in
> > > syscall_set_return_value()").
> > > 
> > > Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> > > ---
> > >  arch/powerpc/include/asm/syscall.h | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> > > index 3dd36c5e334a..422d7735ace6 100644
> > > --- a/arch/powerpc/include/asm/syscall.h
> > > +++ b/arch/powerpc/include/asm/syscall.h
> > > @@ -82,7 +82,11 @@ static inline void syscall_set_return_value(struct task_struct *task,
> > >  		 */
> > >  		if (error) {
> > >  			regs->ccr |= 0x10000000L;
> > > -			regs->gpr[3] = error;
> > > +			/*
> > > +			 * In case of an error regs->gpr[3] contains
> > > +			 * a positive ERRORCODE.
> > > +			 */
> > > +			regs->gpr[3] = -error;
> > 
> > After this change the syscall_get_error() will return positive value if
> > the system call failed. Since syscall_get_error() still believes
> > regs->gpr[3] is still positive in case !trap_is_scv().
> > 
> > Or am I missing something?
> 
> syscall_get_error() does the following in case of !trap_is_scv():
> 
>                 /*
>                  * If the system call failed,
>                  * regs->gpr[3] contains a positive ERRORCODE.
>                  */
>                 return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;
> 
> That is, in !trap_is_scv() case it assumes that regs->gpr[3] is positive
> and is going to return a negative value (-ERRORCODE).

Yeah. Now I see it.

	if (trap_is_scv(regs)) {
		regs->result = -EINTR;
		regs->gpr[3] = -EINTR;
	} else {
		regs->result = -EINTR;
		regs->gpr[3] = EINTR;
		regs->ccr |= 0x10000000;
	}

Two different APIs imply gpr[3] with a different sign.

You can add:

Reviewed-by: Alexey Gladkov <legion@kernel.org>

> > It looks like the selftest you mentioned in the commit message doesn't
> > check the !trap_is_scv() branch.
> 
> The selftest is architecture-agnostic, it just executes syscalls and
> checks whether the data returned by PTRACE_GET_SYSCALL_INFO meets
> expectations.  Do you mean that syscall() is not good enough for syscall
> invocation from coverage perspective on powerpc?
> 
> See also commit d72500f99284 ("powerpc/64s/syscall: Fix ptrace syscall
> info with scv syscalls").
> 
> 
> -- 
> ldv

-- 
Rgrds, legion


