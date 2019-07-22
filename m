Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 407416F797
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 04:55:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sR6W5488zDqVN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 12:54:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sQyl5w1tzDqMC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 12:48:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45sQyl2WrQz9sLt; Mon, 22 Jul 2019 12:48:15 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c7ce5fe9288c5692fa456a804cf5ea5976d842f1
In-Reply-To: <20190719050502.405-1-mikey@neuling.org>
To: Michael Neuling <mikey@neuling.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/tm: Fix oops on sigreturn on systems without TM
Message-Id: <45sQyl2WrQz9sLt@ozlabs.org>
Date: Mon, 22 Jul 2019 12:48:15 +1000 (AEST)
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
Cc: mikey@neuling.org, Praveen Pandey <Praveen.Pandey@in.ibm.com>,
 gromero@br.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Breno Leitao <breno.leitao@gmail.com>, Haren Myneni <haren@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-07-19 at 05:05:02 UTC, Michael Neuling wrote:
> On systems like P9 powernv where we have no TM (or P8 booted with
> ppc_tm=off), userspace can construct a signal context which still has
> the MSR TS bits set. The kernel tries to restore this context which
> results in the following crash:
> 
> [   74.980557] Unexpected TM Bad Thing exception at c0000000000022fc (msr 0x8000000102a03031) tm_scratch=800000020280f033
> [   74.980741] Oops: Unrecoverable exception, sig: 6 [#1]
> [   74.980820] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> [   74.980917] Modules linked in:
> [   74.980980] CPU: 0 PID: 1636 Comm: sigfuz Not tainted 5.2.0-11043-g0a8ad0ffa4 #69
> [   74.981096] NIP:  c0000000000022fc LR: 00007fffb2d67e48 CTR: 0000000000000000
> [   74.981212] REGS: c00000003fffbd70 TRAP: 0700   Not tainted  (5.2.0-11045-g7142b497d8)
> [   74.981325] MSR:  8000000102a03031 <SF,VEC,VSX,FP,ME,IR,DR,LE,TM[E]>  CR: 42004242  XER: 00000000
> [   74.981463] CFAR: c0000000000022e0 IRQMASK: 0
> [   74.981463] GPR00: 0000000000000072 00007fffb2b6e560 00007fffb2d87f00 0000000000000669
> [   74.981463] GPR04: 00007fffb2b6e728 0000000000000000 0000000000000000 00007fffb2b6f2a8
> [   74.981463] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [   74.981463] GPR12: 0000000000000000 00007fffb2b76900 0000000000000000 0000000000000000
> [   74.981463] GPR16: 00007fffb2370000 00007fffb2d84390 00007fffea3a15ac 000001000a250420
> [   74.981463] GPR20: 00007fffb2b6f260 0000000010001770 0000000000000000 0000000000000000
> [   74.981463] GPR24: 00007fffb2d843a0 00007fffea3a14a0 0000000000010000 0000000000800000
> [   74.981463] GPR28: 00007fffea3a14d8 00000000003d0f00 0000000000000000 00007fffb2b6e728
> [   74.982420] NIP [c0000000000022fc] rfi_flush_fallback+0x7c/0x80
> [   74.982517] LR [00007fffb2d67e48] 0x7fffb2d67e48
> [   74.982593] Call Trace:
> [   74.982632] Instruction dump:
> [   74.982691] e96a0220 e96a02a8 e96a0330 e96a03b8 394a0400 4200ffdc 7d2903a6 e92d0c00
> [   74.982809] e94d0c08 e96d0c10 e82d0c18 7db242a6 <4c000024> 7db243a6 7db142a6 f82d0c18
> 
> The problem is the signal code assumes TM is enabled when
> CONFIG_PPC_TRANSACTIONAL_MEM is on. This may not be the case as with
> P9 powernv or if `ppc_tm=off` is used on P8.
> 
> This means any local user can crash the system.
> 
> Fix the problem by returning a bad stack frame to the user if they try
> to set the MSR TS bits with sigreturn() on systems where TM is not
> supported.
> 
> Found with sigfuz kernel selftest on P9.
> 
> This fixes CVE-2019-13648.
> 
> Fixes: 2b0a576d15 ("powerpc: Add new transactional memory state to the signal context")
> Cc: stable@vger.kernel.org # v3.9
> Reported-by: Praveen Pandey <Praveen.Pandey@in.ibm.com>
> Signed-off-by: Michael Neuling <mikey@neuling.org>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/c7ce5fe9288c5692fa456a804cf5ea5976d842f1

cheers
