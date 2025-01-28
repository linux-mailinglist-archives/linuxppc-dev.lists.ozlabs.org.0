Return-Path: <linuxppc-dev+bounces-5638-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C113A20E13
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 17:10:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj9H35Hjmz3050;
	Wed, 29 Jan 2025 03:10:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738080607;
	cv=none; b=Nx2gdXS/rbqOcSApoW1y3s2fBJGKrnULqXdP9YP6XoeKhHwB25YOt+tNBmuOjej1lwJmZET9QvqoxKNQn9Or8UZcobL3U5hYW7BQ0nBOdGBL+G/Bqa6g6tKEAEMxBp1DqpFlaEgKVn/nHDi8Cipz2e0usJzB2Rl+m0vHm1tMj1MPEp9lqLZtboTbzJYofcxqVQYNmPqK/A807lBpVmJ8y+Qz3S7T13CjILyeq2h29wXO8+hUG5hxNivsxODQcM1dJBaJAqkaTDx5eLOPJP+in1TR30SlOHDkW9RViJ8np9z3gDKYgWVA0Se1YC8XYmkkUusl1pFszoSBHI+ePoUMaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738080607; c=relaxed/relaxed;
	bh=ZRW0DJvv1aL2UIwpLJ210yYwqLusL5dfV8xJgBO6BFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PU52veo4gWxk2+4k8gvmP7xSoMsjbJA7Tj/XTEdOOVCwWzo74aTOeyYcNU5v2uAAFA7UZwdvrd2PVjC5gX5qV2E0LZkOPvwhu9gISmilMjjnXUwyyvPgoRiPIgRoXIt6mfkwblhS8UYSKLAyIDlwuHwWDxVYq2NCIzW1JTMSgawsf0xL0P4vE9Rj0AIFUL0KkaXy35Bvi42cwaSPaFOyBiaS3UAJafEuvPW3F1mTKzPE5QnhWnZlNlosg0zaSULavHcZDlf87Nk4vH4C2dpAdK+VrWs93DviB5FK8PU7ysP9M0U+v8IKMot6IjKxLL4ZZJ+epKkH0DeYtoC5H4S45Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj9H26CQdz304Z
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 03:10:06 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 61DF872C8CC;
	Tue, 28 Jan 2025 19:10:05 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 530D37CCB3A; Tue, 28 Jan 2025 18:10:05 +0200 (IST)
Date: Tue, 28 Jan 2025 18:10:05 +0200
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
Subject: Re: [PATCH 1/2] powerpc: properly negate error in
 syscall_set_return_value() in sc case
Message-ID: <20250128161005.GC11869@strace.io>
References: <20250127181322.GA1373@strace.io>
 <d0b7849d-2ec3-4652-8b60-98ae63316ded@csgroup.eu>
 <20250128155201.GA11869@strace.io>
 <b12039ce-99da-41e9-ba2f-dc0e0c62f140@csgroup.eu>
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
In-Reply-To: <b12039ce-99da-41e9-ba2f-dc0e0c62f140@csgroup.eu>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 28, 2025 at 05:00:31PM +0100, Christophe Leroy wrote:
> Le 28/01/2025 à 16:52, Dmitry V. Levin a écrit :
> > On Tue, Jan 28, 2025 at 03:59:29PM +0100, Christophe Leroy wrote:
> >> Le 27/01/2025 à 19:13, Dmitry V. Levin a écrit :
> >>> According to the Power Architecture Linux system call ABI documented in
> >>> [1], when the syscall is made with the sc instruction, both a value and an
> >>> error condition are returned, where r3 register contains the return value,
> >>> and cr0.SO bit specifies the error condition.  When cr0.SO is clear, the
> >>> syscall succeeded and r3 is the return value.  When cr0.SO is set, the
> >>> syscall failed and r3 is the error value.  This syscall return semantics
> >>> was implemented from the very beginning of Power Architecture on Linux,
> >>> and syscall tracers and debuggers like strace that read or modify syscall
> >>> return information also rely on this ABI.
> >>
> >> I see a quite similar ABI on microblaze, mips, nios2 and sparc. Do they
> >> behave all the same ?
> > 
> > Yes, also on alpha.  I don't think microblaze should be in this list,
> > though.
> 
> Microblaze has
> 
> static inline void syscall_set_return_value(struct task_struct *task,
> 					    struct pt_regs *regs,
> 					    int error, long val)
> {
> 	if (error)
> 		regs->r3 = -error;
> 	else
> 		regs->r3 = val;
> }
> 
> So it has a positive error setting allthough it has no flag to tell it 
> is an error. Wondering how it works at the end.

It's a bug, but given that microblaze doesn't enable
CONFIG_HAVE_ARCH_TRACEHOOK, most likely this function is unused there.

> Alpha I'm not sure, I see nothing obvious in include/asm/ptrace.h or 
> include/asm/syscall.h

Alpha doesn't enable CONFIG_HAVE_ARCH_TRACEHOOK, it just lacks the
necessary interfaces, but it uses a3 register for this purpose, see
arch/alpha/kernel/entry.S for details.


-- 
ldv

