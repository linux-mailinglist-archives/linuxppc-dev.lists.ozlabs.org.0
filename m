Return-Path: <linuxppc-dev+bounces-5598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB23A1D5E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 13:26:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhSM84kF6z30CD;
	Mon, 27 Jan 2025 23:26:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737980772;
	cv=none; b=QdoBOz0/MjdfI/4Bf0RRjqxHV3kGKXm0AxIAtW3ae71nEFYZQHQNEJ0+miMSjRxJPCEr2VxDMOMbHxEQ/uW3397qWzJgGRHQCT6N4HIZritTLytCBckC4L9MY2zS4UxzxhW6B2rBSB23qKS31ZQ+VmtOKvFbhASjW4apMWoeiNvHtoE/I/06zY1bM0Jf1seqzELNygMUJz/OcK76K1YtptRv3Y2rOAnZzS9cWYsZx2sh5YFXXrB6RtdUEejLdoT9+Qd7KZXDkqucV3V0TtPbgmf0eVy6/blO1xlomcP/iiqvq+tLVCsU9aMUJv5b24fSPRja68H95VAKsUAgtFvVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737980772; c=relaxed/relaxed;
	bh=rMazveFjQ29d0cuBMrkHjEI+eehHzrykczQMXMwoMiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkVFphmp8lC0Z17Mt3+dgjHtsGkvLKwlFIKug9iAXN7yaxsakKKCsuNVOYHy6O2BUwW5sItmVjL50FuXj88OGUIowZLrKyo0ExshL5qhP2YTb2Kw+JFE24QI7/rDipHdoLU0A0yrdAdA9olqZzvsoMJ4rKUPFawl3ZwgCn4OwgtFmJ55mxCACJqHf4eJ8aB6U4iIhivlR+GtMjC7IAAF2NIpgHJ8wKnScWj8gXmknY9Paxs5kdf5fOAgWTGoWs+g4HC3br4JcLFBoWvyHRaVVqS9nuyLPzbGyX9vVhwf+Z5anqtcrxUl6l6D2E74CKyltZuf/pdP1uNbkvXFn3gitw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhSM55Sk6z309v
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2025 23:26:09 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 0FEC172C8CC;
	Mon, 27 Jan 2025 15:26:07 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id DBCD57CCB3A; Mon, 27 Jan 2025 14:26:06 +0200 (IST)
Date: Mon, 27 Jan 2025 14:26:06 +0200
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
Message-ID: <20250127122606.GA30489@strace.io>
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250123182815.GA20994@strace.io>
 <86079b5c-e124-489b-8136-05ae5700cb61@csgroup.eu>
 <20250127112023.GB29522@strace.io>
 <7e7c7659-5cf7-42e9-81d6-b91963d8c892@csgroup.eu>
 <20250127114439.GC29522@strace.io>
 <63aec56f-9ade-48d1-854b-bd72f8313a9f@csgroup.eu>
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
In-Reply-To: <63aec56f-9ade-48d1-854b-bd72f8313a9f@csgroup.eu>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 27, 2025 at 01:04:27PM +0100, Christophe Leroy wrote:
> 
> 
> Le 27/01/2025 à 12:44, Dmitry V. Levin a écrit :
> > On Mon, Jan 27, 2025 at 12:36:53PM +0100, Christophe Leroy wrote:
> >> Le 27/01/2025 à 12:20, Dmitry V. Levin a écrit :
> >>> On Thu, Jan 23, 2025 at 11:07:21PM +0100, Christophe Leroy wrote:
> >>> [...]
> >>>> To add a bit more to the confusion,
> >>>
> >>> Looks like there is no end to it:
> >>>
> >>> static inline long regs_return_value(struct pt_regs *regs)
> >>> {
> >>>           if (trap_is_scv(regs))
> >>>                   return regs->gpr[3];
> >>>
> >>>           if (is_syscall_success(regs))
> >>>                   return regs->gpr[3];
> >>>           else
> >>>                   return -regs->gpr[3];
> >>> }
> >>>
> >>> static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
> >>> {
> >>>           regs->gpr[3] = rc;
> >>> }
> >>>
> >>> This doesn't look consistent, does it?
> >>>
> >>>
> >>
> >> That regs_set_return_value() looks pretty similar to
> >> syscall_get_return_value().
> > 
> > Yes, but here similarities end, and differences begin.
> > 
> >> regs_set_return_value() documentation in asm-generic/syscall.h
> >> explicitely says: This value is meaningless if syscall_get_error()
> >> returned nonzero
> >>
> >> Is it the same with regs_set_return_value(), only meaningfull where
> >> there is no error ?
> > 
> > Did you mean syscall_set_return_value?  No, it explicitly has two
> > arguments, "int error" and "long val", so it can be used to either
> > clear or set the error condition as specified by the caller.
> 
> Sorry, I mean syscall_get_return_value() here.
> 
> static inline long syscall_get_return_value(struct task_struct *task,
> 					    struct pt_regs *regs)
> {
> 	return regs->gpr[3];
> }
> 
> Versus
> 
> static inline void regs_set_return_value(struct pt_regs *regs, unsigned 
> long rc)
> {
> 	regs->gpr[3] = rc;
> }

The asm/syscall.h API provides two functions to obtain the return value:
syscall_get_error() and syscall_get_return_value().  The first one is used
to obtain the error code when the error condition is set.  When the error
condition is not set, it returns 0.  The second function is used to obtain
the return value when the error condition is not set.  When the error
condition is set, its return value is undefined.


-- 
ldv

