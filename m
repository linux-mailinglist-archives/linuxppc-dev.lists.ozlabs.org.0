Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3DC35012E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 15:24:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Rqp1rPgz3bvW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 00:24:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ShwLr+LZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ShwLr+LZ; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9Rpn2ccZz3bs7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 00:23:45 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9Rpg1k8Kz9sW0;
 Thu,  1 Apr 2021 00:23:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617197019;
 bh=o5QrZT0XJjJ703FOqmNAZbZ55vlORQL7/3riBWxpan8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ShwLr+LZ8mYs8WrH90IIeDFjmV+9nw6Zxp6ewlMQkOU/ePEJKniW7+/bgIlveoAwm
 E02QJymCUP6dc/0GNlLg1BQFuCQOGxa7ofceDqC4Fy4N1o5sk+9GtQe7WHOGahHTh/
 HdeV+eNS9nE/AGfs3CQHsr2ejo+jImy8mIzjNYavEudIUHCCpWmh5hd3WHkz12/FAL
 blgwhq9etRxZbwr9BBi42k//DRyXitak0i/Our0Y4ZJ9Ua+/o8CEmmra8sJZbnE/oE
 6jZdZ+I7crjN1iDoGOOC1CsNueI++2ByoY/2eKxOY8tgZ/0rT9kEDOJV1Z4RQHhoUQ
 eer3Pv4xtPQZQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/signal32: Fix Oops on sigreturn with unmapped VDSO
In-Reply-To: <79ee6fe13b267b0c81d7626c471a99140f0c9e4a.1616939989.git.christophe.leroy@csgroup.eu>
References: <79ee6fe13b267b0c81d7626c471a99140f0c9e4a.1616939989.git.christophe.leroy@csgroup.eu>
Date: Thu, 01 Apr 2021 00:23:35 +1100
Message-ID: <87ft0b78yw.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> PPC32 encounters a KUAP fault when trying to handle a signal with
> VDSO unmapped.
>
> 	Kernel attempted to read user page (7fc07ec0) - exploit attempt? (uid: 0)
> 	BUG: Unable to handle kernel data access on read at 0x7fc07ec0
> 	Faulting instruction address: 0xc00111d4
> 	Oops: Kernel access of bad area, sig: 11 [#1]
> 	BE PAGE_SIZE=16K PREEMPT CMPC885
> 	CPU: 0 PID: 353 Comm: sigreturn_vdso Not tainted 5.12.0-rc4-s3k-dev-01553-gb30c310ea220 #4814
> 	NIP:  c00111d4 LR: c0005a28 CTR: 00000000
> 	REGS: cadb3dd0 TRAP: 0300   Not tainted  (5.12.0-rc4-s3k-dev-01553-gb30c310ea220)
> 	MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 48000884  XER: 20000000
> 	DAR: 7fc07ec0 DSISR: 88000000
> 	GPR00: c0007788 cadb3e90 c28d4a40 7fc07ec0 7fc07ed0 000004e0 7fc07ce0 00000000
> 	GPR08: 00000001 00000001 7fc07ec0 00000000 28000282 1001b828 100a0920 00000000
> 	GPR16: 100cac0c 100b0000 105c43a4 105c5685 100d0000 100d0000 100d0000 100b2e9e
> 	GPR24: ffffffff 105c43c8 00000000 7fc07ec8 cadb3f40 cadb3ec8 c28d4a40 00000000
> 	NIP [c00111d4] flush_icache_range+0x90/0xb4
> 	LR [c0005a28] handle_signal32+0x1bc/0x1c4
> 	Call Trace:
> 	[cadb3e90] [100d0000] 0x100d0000 (unreliable)
> 	[cadb3ec0] [c0007788] do_notify_resume+0x260/0x314
> 	[cadb3f20] [c000c764] syscall_exit_prepare+0x120/0x184
> 	[cadb3f30] [c00100b4] ret_from_syscall+0xc/0x28
> 	--- interrupt: c00 at 0xfe807f8
> 	NIP:  0fe807f8 LR: 10001060 CTR: c0139378
> 	REGS: cadb3f40 TRAP: 0c00   Not tainted  (5.12.0-rc4-s3k-dev-01553-gb30c310ea220)
> 	MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 28000482  XER: 20000000
>
> 	GPR00: 00000025 7fc081c0 77bb1690 00000000 0000000a 28000482 00000001 0ff03a38
> 	GPR08: 0000d032 00006de5 c28d4a40 00000009 88000482 1001b828 100a0920 00000000
> 	GPR16: 100cac0c 100b0000 105c43a4 105c5685 100d0000 100d0000 100d0000 100b2e9e
> 	GPR24: ffffffff 105c43c8 00000000 77ba7628 10002398 10010000 10002124 00024000
> 	NIP [0fe807f8] 0xfe807f8
> 	LR [10001060] 0x10001060
> 	--- interrupt: c00
> 	Instruction dump:
> 	38630010 7c001fac 38630010 4200fff0 7c0004ac 4c00012c 4e800020 7c001fac
> 	2c0a0000 38630010 4082ffcc 4bffffe4 <7c00186c> 2c070000 39430010 4082ff8c
> 	---[ end trace 3973fb72b049cb06 ]---
>
> This is because flush_icache_range() is called on user addresses.
>
> The same problem was detected some time ago on PPC64. It was fixed by
> enabling KUAP in commit 59bee45b9712 ("powerpc/mm: Fix missing KUAP
> disable in flush_coherent_icache()").
>
> PPC32 doesn't use flush_coherent_icache() and fallbacks on
> clean_dcache_range() and invalidate_icache_range().

But this code is also used for compat tasks on 64-bit.

> We could fix it similarly by enabling user access in those functions,
> but this is overkill for just flushing two instructions.
>
> The two instructions are 8 bytes aligned, so a single dcbst/icbi is
> enough to flush them. Do like __patch_instruction() and inline
> a dcbst followed by an icbi just after the write of the instructions,
> while user access is still allowed. The isync is not required because
> rfi will be used to return to user.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/signal_32.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
> index 75ee918a120a..5b2ba2731957 100644
> --- a/arch/powerpc/kernel/signal_32.c
> +++ b/arch/powerpc/kernel/signal_32.c
> @@ -809,6 +809,7 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
>  		unsafe_put_user(PPC_INST_ADDI + __NR_rt_sigreturn, &mctx->mc_pad[0],
>  				failed);
>  		unsafe_put_user(PPC_INST_SC, &mctx->mc_pad[1], failed);
> +		asm("dcbst %y0; sync; icbi %y0; sync" :: "Z" (mctx->mc_pad[0]));

If I'm reading that right you're pointing the icbi at the user address.

That's going to cause a KUAP fault just like we fixed in commit
59bee45b9712 ("powerpc/mm: Fix missing KUAP disable in flush_coherent_icache()").

We have user write access enabled, but the icbi is treated as a load.

So I don't think that's going to work.

cheers
