Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5E13533F4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 13:53:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FCFfp30gLz3cVs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 22:53:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FCFds5NsMz30BW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 22:52:17 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FCFdr5WjMz9sW0; Sat,  3 Apr 2021 22:52:16 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <bde9154e5351a5ac7bca3d59cdb5a5e8edacbb79.1617199569.git.christophe.leroy@csgroup.eu>
References: <bde9154e5351a5ac7bca3d59cdb5a5e8edacbb79.1617199569.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/signal32: Fix Oops on sigreturn with unmapped
 VDSO
Message-Id: <161745070541.936361.6883787979113499379.b4-ty@ellerman.id.au>
Date: Sat, 03 Apr 2021 22:51:45 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 31 Mar 2021 14:07:04 +0000 (UTC), Christophe Leroy wrote:
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
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/signal32: Fix Oops on sigreturn with unmapped VDSO
      https://git.kernel.org/powerpc/c/acca57217c688c5bbbd5140974533d81e8757cc9

cheers
