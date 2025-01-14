Return-Path: <linuxppc-dev+bounces-5241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B6BA10CF2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 18:04:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXb7m3FlDz30ht;
	Wed, 15 Jan 2025 04:04:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736874244;
	cv=none; b=c555sLu7BEVNrA5mQRnxUsgOZ5Xq9MlCynnG5imSidlVSmt7D2FBu92DmFiXc8S5R0lu69QNNV4/3/KZZkBOZRUUg0xaOB7rXQ1a+PNTx25cufDOE8kr1Eecp7MiB0gKplry/zLi8l7Ogizmkd6dFF3KwziZWSyhzDE9Ud0+xXQDywhHVHsmaMjgaloD444CkbNl83QM0DYKJll7xPleQ+cQwR4nKKfvS44oTwHufvC/eUzwTa+DTG4sgTyA3XCkzCO3A3j7BfNfeRPSEzmFtN7kFDigUlbUbDP4+iIuP6YneXYHMKUIJE0sNHBAq1JIoyLQJ8GyoEwUnCkeNIWthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736874244; c=relaxed/relaxed;
	bh=YCHiDPIZDUYml8WMy8h7ZQJyIjuXUO79locI79u1CpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EF+7jYBllLBjU/blImNOAzTa1JiUswmfR+8Qr6utfmuhefcdpJRoet//Sr6pi7oMiP+LPtywmTTvD8gb+tB4Dva9DZweQMN3ybDgH9gZ4bgNsCPeM9v8yNT9hGJnydv1+Wemp1S7+T627UEs76jCWyh3RsD/s0snbp6oyxGU8Mw7EylpjzMKvQlR5VDwMPeEGWyXSrD3LJFW4umopSUXDMEF8ozMKkYiL+LAec9NK9RrS/aB/Nyks6PcP5ckgLqPqjAy0HUGwvEp9JeT2RR2UOS9XlPkL62wBR2vcRAXlKQy8X+x8gX81mPXu0YIzga4pPH453g12B5QTfWhV8XOxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXb7l2tjWz30hl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 04:04:02 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id A741F72C8CC;
	Tue, 14 Jan 2025 20:04:00 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 95EF47CCB3A; Tue, 14 Jan 2025 19:04:00 +0200 (IST)
Date: Tue, 14 Jan 2025 19:04:00 +0200
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
Message-ID: <20250114170400.GB11820@strace.io>
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

OK, please have a look whether this explanation is clear and detailed enough:

=======
powerpc: properly negate error in syscall_set_return_value()

When syscall_set_return_value() is used to set an error code, the caller
specifies it as a negative value in -ERRORCODE form.

In !trap_is_scv case the error code is traditionally stored as follows:
gpr[3] contains a positive ERRORCODE, and ccr has 0x10000000 flag set.
Here are a few examples to illustrate this convention.  The first one
is from syscall_get_error():
        /*
         * If the system call failed,
         * regs->gpr[3] contains a positive ERRORCODE.
         */
        return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;

The second example is from regs_return_value():
        if (is_syscall_success(regs))
                return regs->gpr[3];
        else
                return -regs->gpr[3];

The third example is from check_syscall_restart():
        regs->result = -EINTR;
        regs->gpr[3] = EINTR;
        regs->ccr |= 0x10000000;

Compared with these examples, the failure of syscall_set_return_value()
to assign a positive ERRORCODE into regs->gpr[3] is clearly visible:
	/*
	 * In the general case it's not obvious that we must deal with
	 * CCR here, as the syscall exit path will also do that for us.
	 * However there are some places, eg. the signal code, which
	 * check ccr to decide if the value in r3 is actually an error.
	 */
	if (error) {
		regs->ccr |= 0x10000000L;
		regs->gpr[3] = error;
	} else {
		regs->ccr &= ~0x10000000L;
		regs->gpr[3] = val;
	}

This fix brings syscall_set_return_value() in sync with syscall_get_error()
and lets upcoming ptrace/set_syscall_info selftest pass on powerpc.

Fixes: 1b1a3702a65c ("powerpc: Don't negate error in syscall_set_return_value()").
=======


-- 
ldv

