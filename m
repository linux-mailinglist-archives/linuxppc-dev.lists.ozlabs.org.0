Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1165F4485
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:43:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhf6K0fR0z3fQJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:43:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1P1s9Bz2y33
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:38:49 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1P0Yp3z4xH1;
	Wed,  5 Oct 2022 00:38:49 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <f08cca5c46d67399c53262eca48e015dcf1841f9.1663695394.git.christophe.leroy@csgroup.eu>
References: <f08cca5c46d67399c53262eca48e015dcf1841f9.1663695394.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/highmem: Properly handle fragmented memory
Message-Id: <166488986270.779920.12946841693460358950.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:24:22 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, Pali Rohár <pali@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 20 Sep 2022 19:36:42 +0200, Christophe Leroy wrote:
> In addition to checking whether a page is reserved before allocating
> it to highmem, verify that it is valid memory.
> 
> Otherwise the kernel Oopses as below:
> 
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Kernel attempted to read user page (7df58) - exploit attempt? (uid: 0)
> [    0.000000] BUG: Unable to handle kernel data access on read at 0x0007df58
> [    0.000000] Faulting instruction address: 0xc01c8348
> [    0.000000] Oops: Kernel access of bad area, sig: 11 [#1]
> [    0.000000] BE PAGE_SIZE=4K SMP NR_CPUS=2 P2020RDB-PC
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.0.0-rc2-0caacb197b677410bdac81bc34f05235+ #121
> [    0.000000] NIP:  c01c8348 LR: c01cb2bc CTR: 0000000a
> [    0.000000] REGS: c10d7e20 TRAP: 0300   Not tainted  (6.0.0-rc2-0caacb197b677410bdac81bc34f05235+)
> [    0.000000] MSR:  00021000 <CE,ME>  CR: 48044224  XER: 00000000
> [    0.000000] DEAR: 0007df58 ESR: 00000000
> [    0.000000] GPR00: c01cb294 c10d7f10 c1045340 00000001 00000004 c112bcc0 00000015 eedf1000
> [    0.000000] GPR08: 00000003 0007df58 00000000 f0000000 28044228 00000200 00000000 00000000
> [    0.000000] GPR16: 00000000 00000000 00000000 0275cb7a c0000000 00000001 0000075f 00000000
> [    0.000000] GPR24: c1031004 00000000 00000000 00000001 c10f0000 eedf1000 00080000 00080000
> [    0.000000] NIP [c01c8348] free_unref_page_prepare.part.93+0x48/0x60
> [    0.000000] LR [c01cb2bc] free_unref_page+0x84/0x4b8
> [    0.000000] Call Trace:
> [    0.000000] [c10d7f10] [eedf1000] 0xeedf1000 (unreliable)
> [    0.000000] [c10d7f20] [c01cb294] free_unref_page+0x5c/0x4b8
> [    0.000000] [c10d7f70] [c1007644] mem_init+0xd0/0x194
> [    0.000000] [c10d7fa0] [c1000e4c] start_kernel+0x4c0/0x6d0
> [    0.000000] [c10d7ff0] [c00003e0] set_ivor+0x13c/0x178
> [    0.000000] Instruction dump:
> [    0.000000] 552817be 5509103a 7d294214 55293830 7d4a4a14 812a003c 814a0038 5529002a
> [    0.000000] 7c892050 5484c23a 5489eafa 548406fe <7d2a482e> 7d242430 5484077e 90870010
> [    0.000000] ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/highmem: Properly handle fragmented memory
      https://git.kernel.org/powerpc/c/2fc1c63d2763ad7562ea7d241da79b42538a557b

cheers
