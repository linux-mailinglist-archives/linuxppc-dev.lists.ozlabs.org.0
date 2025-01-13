Return-Path: <linuxppc-dev+bounces-5183-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3AEA0BF5B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 18:54:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX0Jv5HGbz3cYh;
	Tue, 14 Jan 2025 04:54:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736790895;
	cv=none; b=IcwUb1wfMYCnLyEtMG95RfNc8IgiKuP07qcoPTA8Tkzq1icD1tlaQ5bAS+HMGwf3UZVzleLpkQJxrWl+7bd2tsR3ZGXX945HFSfibJv/TvxDAHw88UmtvtqvYe+3TKRLatL9HGZ6XrN1ww9S100Uu571snlXFLFv2wshea+uGALouKU8vEFV/rAHS/k5gT2m5XrMPU++p+Vmro9tgbR6uperan4hYqhg02Lc+Vq1HoHz2Ir66+zrMg4njIHvv07UfYEHwX0l2Z6ky41BYmNxRNeDBHXFqEqEbwZxo6VoHVkV/gIG7FwMhBCvHgvZs7yqMLS1udf6J9aiE8wqAZ5hig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736790895; c=relaxed/relaxed;
	bh=Xd8k5mTFO0RMaW5hiPU4LxjxyPaS/5ktS/CWIJVgbEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYxi8cJrMJvrynTKPSykIrq8KsMB2RW9glv0ePhVRV1xiTTq1Ww96axVv8FIbH/WNlBFqZrabhy4slN0HtmG9DqujouL/TRwR4pD8VC1U116HV4Nh8UQTtF7tuQ8MUUFro1Lsd/mMfrNQBmbt093qeICzvRJfNE2RxPfVgrjSV60DzVLj1AZA2MspUioZpPydeO6/fqTFCZ8mHKvQFlokup3XWbFQqM9w52e5Rk5bdiUINUkXVlLmEX6wGIU/hDQLdGRDeCemXpDCaijizHGreg4NRV6jw3gEsYbtaC3vrRaS+/BdG8+sG2Vj2mPiawPxxbEKZYkXigR0+YMwzun5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX0Jt4VVYz3013
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 04:54:54 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 1B60E72C8CC;
	Mon, 13 Jan 2025 20:54:53 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id F21AA7CCB3A; Mon, 13 Jan 2025 19:54:52 +0200 (IST)
Date: Mon, 13 Jan 2025 19:54:52 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Oleg Nesterov <oleg@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
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
Message-ID: <20250113175452.GA646@strace.io>
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
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
In-Reply-To: <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 13, 2025 at 06:34:44PM +0100, Christophe Leroy wrote:
> Le 13/01/2025 à 18:10, Dmitry V. Levin a écrit :
> > Bring syscall_set_return_value() in sync with syscall_get_error(),
> > and let upcoming ptrace/set_syscall_info selftest pass on powerpc.
> > 
> > This reverts commit 1b1a3702a65c ("powerpc: Don't negate error in
> > syscall_set_return_value()").
> 
> There is a clear detailed explanation in that commit of why it needs to 
> be done.
> 
> If you think that commit is wrong you have to explain why with at least 
> the same level of details.

I'm sorry, I'm not by any means a powerpc expert to explain why that
commit was added in the first place, I wish Michael would be able to do it
himself.  All I can say is that for some mysterious reason current
syscall_set_return_value() implementation assumes that in case of an error
regs->gpr[3] has to be negative, while, according to well-tested
syscall_get_error(), it has to be positive.

This is very visible with PTRACE_SET_SYSCALL_INFO that exposes
syscall_set_return_value() to userspace, and, in particular, with the
architecture-agnostic ptrace/set_syscall_info selftest added later in the
series.

> > diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> > index 3dd36c5e334a..422d7735ace6 100644
> > --- a/arch/powerpc/include/asm/syscall.h
> > +++ b/arch/powerpc/include/asm/syscall.h
> > @@ -82,7 +82,11 @@ static inline void syscall_set_return_value(struct task_struct *task,
> >   		 */
> >   		if (error) {
> >   			regs->ccr |= 0x10000000L;
> > -			regs->gpr[3] = error;
> > +			/*
> > +			 * In case of an error regs->gpr[3] contains
> > +			 * a positive ERRORCODE.
> > +			 */
> > +			regs->gpr[3] = -error;
> >   		} else {
> >   			regs->ccr &= ~0x10000000L;
> >   			regs->gpr[3] = val;

-- 
ldv

