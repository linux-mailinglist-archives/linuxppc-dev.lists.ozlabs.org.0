Return-Path: <linuxppc-dev+bounces-5652-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2772A213A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 22:39:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjJZj5LSSz2yDp;
	Wed, 29 Jan 2025 08:39:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738100349;
	cv=none; b=OU8epOxOXpadwudh9Otz/LR6StU2IaYiHzE4iw/clX8VKOENHWD4TBwB8o4IBdnNVBDz5El373tQY6M8RSJ6iv38Pb/PpF12p02+kn7oNNox1pJml87SZ4xiRzWjFhgWPSIRgntJkjD82LAMaIez6X0+eeEISqulHzGRbpjjYVV1CJ+3jDlbiVArEIu/PTiKCgx/2lcNCsDyG9Zat8iTz8iuyUyGoxFLWKqSQZnFzYgO0AD0fqmgrVA0GUJRjChGzwRxdP2ihQ+RoNXtIBFs4qEM2xX8cLcUB++5cb3Dh4kj+Iz8q4nwZuDk4Jx5bU2E+NIFSODpm6q+UxyyWgbbNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738100349; c=relaxed/relaxed;
	bh=PXvGoFj/gK0itf9ugUcIsUJaa3yKc3oN+DdUfaDxjyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVpTb1qtu/ZpvNMkV5v1BIz3W68l/ZRxsoivy3ATeCCknyqTBKDt97w58wG9m6X6S/lnWFVwdtspLikyo9YbZFGODarLrhH4Ul/YWgRZn2KoIbd8ESOuezx2xORSjJx67/JVlwsV9afL9x/duNjiM7Yp9GLAxWFRkuBx77f+hqe8Sx2jhEhdMeT5WD2/weFaop/E8PDYGsw1PKRimxdvY3otGR7AbYUzl4EExTKuhi1qbfzD7/XW7BZNmqN9tXRvst8N9PF+a9Pfc/4uvPvATOgaDWvsBr7FgphpyzwBrz5mGYg5gbKV1qJYmeRIyWGt88MkIf8D/6w1Z659a5zOUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjJZh1NRhz2yDl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 08:39:07 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 6AB4072C97D;
	Wed, 29 Jan 2025 00:39:05 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 576AA7CCB3A; Tue, 28 Jan 2025 23:39:05 +0200 (IST)
Date: Tue, 28 Jan 2025 23:39:05 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	strace-devel@lists.strace.io, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] powerpc: fix inconsistencies in syscall error return
 handling
Message-ID: <20250128213905.GA14868@strace.io>
References: <20250127181424.GB1373@strace.io>
 <695b2329-65d5-4e0b-b8ce-eb622c253986@csgroup.eu>
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
In-Reply-To: <695b2329-65d5-4e0b-b8ce-eb622c253986@csgroup.eu>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 28, 2025 at 07:01:47PM +0100, Christophe Leroy wrote:
> Le 27/01/2025 à 19:14, Dmitry V. Levin a écrit :
> > Since the introduction of SECCOMP_RET_TRACE support, the kernel supports
> > simultaneously both the generic kernel -ERRORCODE return value ABI and
> > the powerpc sc syscall return ABI for PTRACE_EVENT_SECCOMP tracers.
> > This change is an attempt to address the code inconsistencies in syscall
> > error return handling that were introduced as a side effect of the dual
> > ABI support.
> > 
> > Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> > ---
> >   arch/powerpc/kernel/ptrace/ptrace.c | 23 ++++++++++++++++++++---
> >   arch/powerpc/kernel/signal.c        | 11 +++--------
> >   arch/powerpc/kernel/syscall.c       |  6 +++---
> >   3 files changed, 26 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> > index 727ed4a14545..3778775bf6ba 100644
> > --- a/arch/powerpc/kernel/ptrace/ptrace.c
> > +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> > @@ -207,7 +207,7 @@ static int do_seccomp(struct pt_regs *regs)
> >   	 * syscall parameter. This is different to the ptrace ABI where
> >   	 * both r3 and orig_gpr3 contain the first syscall parameter.
> >   	 */
> > -	regs->gpr[3] = -ENOSYS;
> > +	syscall_set_return_value(current, regs, -ENOSYS, 0);
> >   
> >   	/*
> >   	 * We use the __ version here because we have already checked
> > @@ -215,8 +215,18 @@ static int do_seccomp(struct pt_regs *regs)
> >   	 * have already loaded -ENOSYS into r3, or seccomp has put
> >   	 * something else in r3 (via SECCOMP_RET_ERRNO/TRACE).
> >   	 */
> > -	if (__secure_computing(NULL))
> > +	if (__secure_computing(NULL)) {
> > +
> > +		/*
> > +		 * Traditionally, both the generic kernel -ERRORCODE return
> > +		 * value ABI and the powerpc sc syscall return ABI is
> > +		 * supported.  For consistency, if the former is detected,
> > +		 * convert it to the latter.
> > +		 */
> > +		if (!trap_is_scv(regs) && IS_ERR_VALUE(regs->gpr[3]))
> 
> Why !trap_is_scv(regs) ? Shouldn't this also work with scv allthough it 
> should be a noop ?

In trap_is_scv(regs) case both the source and the target ABIs are
-ERRORCODE so there is no subject for conversion.

> > +			syscall_set_return_value(current, regs, regs->gpr[3], 0);
> >   		return -1;
> > +	}
> >   
> >   	/*
> >   	 * The syscall was allowed by seccomp, restore the register
> > @@ -226,6 +236,13 @@ static int do_seccomp(struct pt_regs *regs)
> >   	 * allow the syscall to proceed.
> >   	 */
> >   	regs->gpr[3] = regs->orig_gpr3;
> > +	if (!trap_is_scv(regs)) {
> > +		/*
> > +		 * Clear SO bit that was set in this function earlier by
> > +		 * syscall_set_return_value.
> > +		 */
> > +		regs->ccr &= ~0x10000000L;
> > +	}
> 
> Can't we use syscall_set_return_value() to do that ?

Of course we could do

	syscall_set_return_value(current, regs, 0, regs->orig_gpr3);

but Michael has objected to this already, see
https://lore.kernel.org/all/87jzajjde1.fsf@mpe.ellerman.id.au/


-- 
ldv

