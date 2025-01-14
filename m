Return-Path: <linuxppc-dev+bounces-5230-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6130BA1081E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 14:48:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXVpX0GQKz30QX;
	Wed, 15 Jan 2025 00:48:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736862531;
	cv=none; b=gZNfKs7Yr2b05Jdls2AZAZQl9OB3BCvO4TUdYG1XEWH3ItCmXTmlxP0+xJu+0kueNjWikCqi3Dx2JCq0rp2n8mx6Uwh4RNEHu5lMZ/aTCfHSA/PuOlz5Y96YOWFcT4y+1FTiHBGXmzQc8xN5kPtcz2zqxnCvh3OYE5rZvMvCkZ/OSSX7U+31BhQiugtyDhzjQg2NXfqm8SG1QZLqUhF/PrVF5YEWwoweSi5gof/uiJCKputb0081itU4cnC3kBmzNehwPjjW8AmSeOKaimx59ZVXoVu/lWKahySPYZKWrLYKhdGgVgSzFy7uuPlW9kCq+WkWHBVkBOUqsF/f4QlT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736862531; c=relaxed/relaxed;
	bh=4hJY0OkOJYlflfehaptiNIRfa4yPOLTwyVlOIEXXHiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJOtw/kg5a5fWcGEjrsF76T/PlRfU1d/j5XF7wpp7q55py/LVM+IDOMVJQP3Ku9GwBMDuudDwsZ7nNrx6XXWJoMlS4I1y5mpMojvywtcdRM4JE3dNBWIj9Yl+sw6AO3zNB9R1/tjDqBcWGFDPjMcm4QznjBfj0duVWtQzTy9aurU4XikJrXPplyw/xliAQNoHzTvuf+t45UTVkZu3OeXZG7g/24tRhSYpODQJeyQQC8IuRhWL4PeT+mniLiIquZ4IpcTC3S7W3G04fPzHe+kXyY5vNLfn3TLx98eYAb37PaI5xYuThlG/Imjdzk41ZR1NMSi2W+QR4wbIcA+cP1izQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXVpV4mpxz30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 00:48:49 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 2113A72C8CC;
	Tue, 14 Jan 2025 16:48:45 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 0DD4B7CCB3A; Tue, 14 Jan 2025 15:48:44 +0200 (IST)
Date: Tue, 14 Jan 2025 15:48:44 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Alexey Gladkov <legion@kernel.org>
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
Message-ID: <20250114134844.GA10630@strace.io>
References: <20250113170925.GA392@strace.io>
 <20250113171054.GA589@strace.io>
 <Z4Zf4MppsrpoPiC1@example.org>
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
In-Reply-To: <Z4Zf4MppsrpoPiC1@example.org>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 14, 2025 at 02:00:16PM +0100, Alexey Gladkov wrote:
> On Mon, Jan 13, 2025 at 07:10:54PM +0200, Dmitry V. Levin wrote:
> > Bring syscall_set_return_value() in sync with syscall_get_error(),
> > and let upcoming ptrace/set_syscall_info selftest pass on powerpc.
> > 
> > This reverts commit 1b1a3702a65c ("powerpc: Don't negate error in
> > syscall_set_return_value()").
> > 
> > Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> > ---
> >  arch/powerpc/include/asm/syscall.h | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> > index 3dd36c5e334a..422d7735ace6 100644
> > --- a/arch/powerpc/include/asm/syscall.h
> > +++ b/arch/powerpc/include/asm/syscall.h
> > @@ -82,7 +82,11 @@ static inline void syscall_set_return_value(struct task_struct *task,
> >  		 */
> >  		if (error) {
> >  			regs->ccr |= 0x10000000L;
> > -			regs->gpr[3] = error;
> > +			/*
> > +			 * In case of an error regs->gpr[3] contains
> > +			 * a positive ERRORCODE.
> > +			 */
> > +			regs->gpr[3] = -error;
> 
> After this change the syscall_get_error() will return positive value if
> the system call failed. Since syscall_get_error() still believes
> regs->gpr[3] is still positive in case !trap_is_scv().
> 
> Or am I missing something?

syscall_get_error() does the following in case of !trap_is_scv():

                /*
                 * If the system call failed,
                 * regs->gpr[3] contains a positive ERRORCODE.
                 */
                return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;

That is, in !trap_is_scv() case it assumes that regs->gpr[3] is positive
and is going to return a negative value (-ERRORCODE).

> It looks like the selftest you mentioned in the commit message doesn't
> check the !trap_is_scv() branch.

The selftest is architecture-agnostic, it just executes syscalls and
checks whether the data returned by PTRACE_GET_SYSCALL_INFO meets
expectations.  Do you mean that syscall() is not good enough for syscall
invocation from coverage perspective on powerpc?

See also commit d72500f99284 ("powerpc/64s/syscall: Fix ptrace syscall
info with scv syscalls").


-- 
ldv

