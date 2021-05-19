Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A7B388B9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 12:24:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlTWD0lRLz3bs2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 20:24:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=altlinux.org (client-ip=194.107.17.57;
 helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org;
 receiver=<UNKNOWN>)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FlTVt6qWXz2ykL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 20:24:06 +1000 (AEST)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id EC84772C8BA;
 Wed, 19 May 2021 13:24:03 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id E2BF47CC8A6; Wed, 19 May 2021 13:24:03 +0300 (MSK)
Date: Wed, 19 May 2021 13:24:03 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
Message-ID: <20210519102403.GA15207@altlinux.org>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <1621385544.nttlk5qugb.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621385544.nttlk5qugb.astroid@bobo.none>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: libc-alpha@sourceware.org, Matheus Castanho <msc@linux.ibm.com>,
 musl@lists.openwall.com, linux-api@vger.kernel.org, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 12:50:24PM +1000, Nicholas Piggin wrote:
[...]
> With this patch, I think the ptrace ABI should mostly be fixed. I think 
> a problem remains with applications that look at system call return 
> registers directly and have powerpc specific error cases. Those probably
> will just need to be updated unfortunately. Michael thought it might be
> possible to return an indication via ptrace somehow that the syscall is
> using a new ABI, so such apps can be updated to test for it. I don't 
> know how that would be done.

Is there any sane way for these applications to handle the scv case?
How can they tell that the scv semantics is being used for the given
syscall invocation?  Can this information be obtained e.g. from struct
pt_regs?

For example, in strace we have the following powerpc-specific code used
for syscall tampering:

$ cat src/linux/powerpc/set_error.c
/*
 * Copyright (c) 2016-2021 The strace developers.
 * All rights reserved.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

static int
arch_set_r3_ccr(struct tcb *tcp, const unsigned long r3,
		const unsigned long ccr_set, const unsigned long ccr_clear)
{
	if (ptrace_syscall_info_is_valid() &&
	    upeek(tcp, sizeof(long) * PT_CCR, &ppc_regs.ccr))
                return -1;
	const unsigned long old_ccr = ppc_regs.ccr;
	ppc_regs.gpr[3] = r3;
	ppc_regs.ccr |= ccr_set;
	ppc_regs.ccr &= ~ccr_clear;
	if (ppc_regs.ccr != old_ccr &&
	    upoke(tcp, sizeof(long) * PT_CCR, ppc_regs.ccr))
		return -1;
	return upoke(tcp, sizeof(long) * (PT_R0 + 3), ppc_regs.gpr[3]);
}

static int
arch_set_error(struct tcb *tcp)
{
	return arch_set_r3_ccr(tcp, tcp->u_error, 0x10000000, 0);
}

static int
arch_set_success(struct tcb *tcp)
{
	return arch_set_r3_ccr(tcp, tcp->u_rval, 0, 0x10000000);
}


-- 
ldv
