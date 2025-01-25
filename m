Return-Path: <linuxppc-dev+bounces-5561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F18A1C531
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2025 21:48:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YgRbR6CNgz2y6G;
	Sun, 26 Jan 2025 07:48:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737838099;
	cv=none; b=Fe+pg+dDxvfeReicjwoZIiQc4c4cpSopOqxvsHoScM4emnpps0cE5LywVMz9Y1RzS7mdXcG9RlULHq+FWfP0btUIFZnnjhmfL0r3yqJ0aSXVQKVhR3cAHoZWSaIQgdbb3SFyWm+omAjidG+220cplQr+LcbLkrKZV4gflDi0FhOxkhqLbPQ/gFZOCBD9xSpwVt1IqmPxRhafdbo+RjkRyYtvbQfN8os2d1dEF4A67baDXy55T7sRd8bBLVQTPE6n0ETYtGp5PmUnGenu3teGtoIlr3dINIvCOco1O33tDLsM/GoEiS2yIVhNFtbmyME+u9OL7HXLG90wY5hX5W3/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737838099; c=relaxed/relaxed;
	bh=NEdtOSnMElsfLJ95hek9II/MsFxdAsYi+4+DoPvZh8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8ZsRoDMe5tvFi98m2VNn9zQR24igoDpMpelM9ZK5uISyiIgfaxj2qrozKkDwBUhlxEUIyQgd3iFufmujA917IRcOfmUWyph9Fob/o3DcK5tuF3n3Sm/ZUO6xwHfpvbr7Hj3qbmI0jDMbtFU+OcgbDXRK1kRvbBfiitD2CEleBITiWSmWym2n4i2JlOSi2qmTl9TIY35/qJaQtKzUqJYnTOn99wbmcGXjLJwIUp3duNUyksjRp6s2nk8VtcZqc3Car2bt075YEcEkWexWZe54WsolkaQEX/n9HZ1MnOfa2MLvMlL9YlRLhdc3bquCRMN1/HmCsNN8ZlGHs9bycplcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YgRbQ35jnz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jan 2025 07:48:17 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 61BEB72C8CC;
	Sat, 25 Jan 2025 23:48:15 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 4EA297CCB3A; Sat, 25 Jan 2025 22:48:15 +0200 (IST)
Date: Sat, 25 Jan 2025 22:48:15 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
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
Message-ID: <20250125204815.GA12624@strace.io>
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250123182815.GA20994@strace.io>
 <20250123234321.GA23582@strace.io>
 <87jzajjde1.fsf@mpe.ellerman.id.au>
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
In-Reply-To: <87jzajjde1.fsf@mpe.ellerman.id.au>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Jan 25, 2025 at 11:17:58PM +1100, Michael Ellerman wrote:
> "Dmitry V. Levin" <ldv@strace.io> writes:
> > On Thu, Jan 23, 2025 at 08:28:15PM +0200, Dmitry V. Levin wrote:
> ...
> >> After looking at system_call_exception() I doubt this inconsistency can be
> >> easily avoided, so I don't see how this patch could be enhanced further,
> >> and what else could I do with the patch besides dropping it and letting
> >> !trap_is_scv case be unsupported by PTRACE_SET_SYSCALL_INFO API, which
> >> would be unfortunate.
> >
> > If you say this would bring some consistency, I can extend the patch with
> > something like this:
> 
> Yes that would improve things IMHO, with one caveat ....
> 
> > diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> > index 727ed4a14545..dda276a934fd 100644
> > --- a/arch/powerpc/kernel/ptrace/ptrace.c
> > +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> > @@ -207,7 +207,7 @@ static int do_seccomp(struct pt_regs *regs)
> >  	 * syscall parameter. This is different to the ptrace ABI where
> >  	 * both r3 and orig_gpr3 contain the first syscall parameter.
> >  	 */
> > -	regs->gpr[3] = -ENOSYS;
> > +	syscall_set_return_value(current, regs, -ENOSYS, 0);
> >  
> >  	/*
> >  	 * We use the __ version here because we have already checked
> > @@ -225,7 +225,7 @@ static int do_seccomp(struct pt_regs *regs)
> >  	 * modify the first syscall parameter (in orig_gpr3) and also
> >  	 * allow the syscall to proceed.
> >  	 */
> > -	regs->gpr[3] = regs->orig_gpr3;
> > +	syscall_set_return_value(current, regs, 0, regs->orig_gpr3);
> 
> This case should remain as-is. The orig_gpr3 value here is not a syscall
> error code, it's the original r3 value, which is a syscall parameter.

I agree, but shouldn't CCR.SO be cleared somehow after it was set earlier by
	syscall_set_return_value(current, regs, -ENOSYS, 0);
?


-- 
ldv

