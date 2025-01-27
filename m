Return-Path: <linuxppc-dev+bounces-5595-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4B8A1D595
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 12:44:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhRRG29yqz2yMX;
	Mon, 27 Jan 2025 22:44:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737978282;
	cv=none; b=dS5far+9K2AMUMPZDq8him2K7W8+YlxP3A04amopHwfWT1wQeNI8MQu8+yVzBCor+4x+qV0zcpci83AdJdpvnlsEh6hYSBMNo99QOtffbaQraXimlgr+rjWnagRMHf5h0VxDlqN9WyX1JxL9+E6sBydaqBKJfXqUmeaDG5quLuGlA75DkVs3jz3rIBpd57ssUmJ+S+ybUdKVp5Zq1QOFN5/70LEO3zKegZOofw/ovtXqdnQfMrcQzr2EZhPd7Pj9GCzG85K06mbAfe+7dj3yyG8LEQKd0aYLent8mr5M9NlZ9nrkFABWNyRUzo+XEuaubmkVJzQn58RRBY/j67ZRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737978282; c=relaxed/relaxed;
	bh=kO9MRTiFnxmvjjwqoavbEvk7nTGCi1IOTltnRTUQauI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvq21ZF1Nkv1+Z2csdJqHOp384EQgVMj8hakRHA/6qhwlL9nf7uWdoiGBP9LjVEDeljjdM/a5cdUkC1W7HwEYao57EgD0z1C9wFwxj72jGaVV6mGdSErGSEWXrtnrBu59DIOiVrflAXSWcuMQ1SJ0bm79gtY2GRqzd1GU1fL2iy50cD5MpLS8Hkybj4bnMLPUH9HnzwoWf9DxYjCV6RYsYWtbjh0OEvoWFSP3TvIR8MSbT4PFQky+gX7mT66rcUmBay0562pONd9+9TSj7G5S6SjJAnZAZnBO2DQlm4r18QlvelnABgMXVC23ydclwKBTlDIIlGIfPIAWVN40JwXew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhRRF3wSPz2xKd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 22:44:41 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 0CEEE72C8CC;
	Mon, 27 Jan 2025 14:44:40 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id EF77A7CCB3A; Mon, 27 Jan 2025 13:44:39 +0200 (IST)
Date: Mon, 27 Jan 2025 13:44:39 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
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
Message-ID: <20250127114439.GC29522@strace.io>
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250123182815.GA20994@strace.io>
 <86079b5c-e124-489b-8136-05ae5700cb61@csgroup.eu>
 <20250127112023.GB29522@strace.io>
 <7e7c7659-5cf7-42e9-81d6-b91963d8c892@csgroup.eu>
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
In-Reply-To: <7e7c7659-5cf7-42e9-81d6-b91963d8c892@csgroup.eu>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 27, 2025 at 12:36:53PM +0100, Christophe Leroy wrote:
> Le 27/01/2025 à 12:20, Dmitry V. Levin a écrit :
> > On Thu, Jan 23, 2025 at 11:07:21PM +0100, Christophe Leroy wrote:
> > [...]
> >> To add a bit more to the confusion,
> > 
> > Looks like there is no end to it:
> > 
> > static inline long regs_return_value(struct pt_regs *regs)
> > {
> >          if (trap_is_scv(regs))
> >                  return regs->gpr[3];
> > 
> >          if (is_syscall_success(regs))
> >                  return regs->gpr[3];
> >          else
> >                  return -regs->gpr[3];
> > }
> > 
> > static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
> > {
> >          regs->gpr[3] = rc;
> > }
> > 
> > This doesn't look consistent, does it?
> > 
> > 
> 
> That regs_set_return_value() looks pretty similar to 
> syscall_get_return_value().

Yes, but here similarities end, and differences begin.

> regs_set_return_value() documentation in asm-generic/syscall.h 
> explicitely says: This value is meaningless if syscall_get_error() 
> returned nonzero
> 
> Is it the same with regs_set_return_value(), only meaningfull where 
> there is no error ?

Did you mean syscall_set_return_value?  No, it explicitly has two
arguments, "int error" and "long val", so it can be used to either
clear or set the error condition as specified by the caller.

> By the way, why have two very similar APIs, one in syscall.h one in 
> ptrace.h ?

I have no polite answer to this, sorry.


-- 
ldv

