Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB18618B42
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 23:19:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3J8m2463z3ccl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 09:19:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R7HTBz4l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3J7q125Cz3bgR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 09:19:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=R7HTBz4l;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4N3J7j4yHJz4x1G;
	Fri,  4 Nov 2022 09:18:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1667513939;
	bh=VR6Mm9ZHp7WtU2Fa2nUanqpeKXo980HrZ6AWhIqgPP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R7HTBz4l7NOogMvdkkYnluPBOStvtLJb5Kjm54ZcVKtSUxohHMPydfXwVamBQvux+
	 kWILI3eGk8inAfxlkK3Zuy4GCckJRcN19RV87u19RkO3cWYbWn4WXdFYoQULPYr97d
	 3OiqJodFQ6p33NpSw1vnbbYntsT/lRnq/sMbdV0kaE90G1WUJevDYm4trxn/WCQaYV
	 G+kbYmjjidV2kxWM707p1x0Vlcf1tbkKuHgSCjSma6s9d8+VnJxF9/NJFyqiNzychW
	 n9ETDtlJQCjWuDRSMrXcrJ88soYBZhH7nbRfSNSo1p7mg8R+Vto6z7eNE+CtxAH9ze
	 Q1TRR9azQ7HJw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-4 tag
In-Reply-To: <CAHk-=wh87aGtg3eJPkA31V0Pn22hah0DWRc8oWsQ__5P2SXaTw@mail.gmail.com>
References: <87o7tossaa.fsf@mpe.ellerman.id.au>
 <CAHk-=wh87aGtg3eJPkA31V0Pn22hah0DWRc8oWsQ__5P2SXaTw@mail.gmail.com>
Date: Fri, 04 Nov 2022 09:18:54 +1100
Message-ID: <87iljvsmup.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, guoren@kernel.org, schwab@linux-m68k.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Wed, Nov 2, 2022 at 7:09 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>>  - Fix an endian thinko in the asm-generic compat_arg_u64() which led to syscall arguments
>>    being swapped for some compat syscalls.
>
> Am I mis-reading this, or did this bug (introduced in this merge
> window by commit 43d5de2b67d7 "asm-generic: compat: Support BE for
> long long args in 32-bit ABIs") break *every* architecture?

No. Just RISC-V and powerpc.

> And people just didn't scream, because 32-bit code has just become so rare?

I had two systems and several VMs that booted happily with the bug
present, so there's some luck involved as to whether your userspace
trips over the bug in a way that matters.

But we did have people scream eventually :/

> Or is it just because those compat macros are effectively not used
> elsewhere, and x86 has its own versions? Looks like possibly mainly
> RISC-V?

Yeah. Although compat_arg_u64() is defined for all arches, it's only
used in places guarded by __ARCH_WANT_COMPAT_FOO macros, and those are
only selected by RISC-V and powerpc.

Full list is:

  __ARCH_WANT_COMPAT_FADVISE64_64       riscv
  __ARCH_WANT_COMPAT_FALLOCATE          riscv, powerpc
  __ARCH_WANT_COMPAT_FTRUNCATE64        riscv
  __ARCH_WANT_COMPAT_PREAD64            riscv
  __ARCH_WANT_COMPAT_PWRITE64           riscv
  __ARCH_WANT_COMPAT_READAHEAD          riscv
  __ARCH_WANT_COMPAT_SYNC_FILE_RANGE    riscv
  __ARCH_WANT_COMPAT_TRUNCATE64         riscv


> Side note: why is it doing
>
>         #ifndef compat_arg_u64
>
> at all? That macro is not actually defined anywhere else, so that
> #ifdef seems to be just confused.

That goes back to the original submission:

  59c10c52f573 ("riscv: compat: syscall: Add compat_sys_call_table implementation")

I guess it was following the example in asm-generic/compat.h where a
bunch of other things are guarded by ifndefs. But agree it's
unnecessarily flexible in this case until we have another definition.

cheers
