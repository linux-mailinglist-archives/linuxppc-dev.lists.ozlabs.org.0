Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD1C3EB4F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 14:00:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmMZv0KgVz3dX9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 22:00:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmMXl0LwMz3bXp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 21:59:02 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GmMXh1tNzz9t2b; Fri, 13 Aug 2021 21:59:00 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <75287841cbb8740edd44880fe60be66d489160d9.1628097995.git.christophe.leroy@csgroup.eu>
References: <75287841cbb8740edd44880fe60be66d489160d9.1628097995.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/smp: Fix OOPS in topology_init()
Message-Id: <162885586726.2317031.18007540873140070843.b4-ty@ellerman.id.au>
Date: Fri, 13 Aug 2021 21:57:47 +1000
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

On Wed, 4 Aug 2021 18:24:10 +0000 (UTC), Christophe Leroy wrote:
> Running an SMP kernel on an UP platform not prepared for it,
> I encountered the following OOPS:
> 
> 	BUG: Kernel NULL pointer dereference on read at 0x00000034
> 	Faulting instruction address: 0xc0a04110
> 	Oops: Kernel access of bad area, sig: 11 [#1]
> 	BE PAGE_SIZE=4K SMP NR_CPUS=2 CMPCPRO
> 	Modules linked in:
> 	CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-pmac-00001-g230fedfaad21 #5234
> 	NIP:  c0a04110 LR: c0a040d8 CTR: c0a04084
> 	REGS: e100dda0 TRAP: 0300   Not tainted  (5.13.0-pmac-00001-g230fedfaad21)
> 	MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 84000284  XER: 00000000
> 	DAR: 00000034 DSISR: 20000000
> 	GPR00: c0006bd4 e100de60 c1033320 00000000 00000000 c0942274 00000000 00000000
> 	GPR08: 00000000 00000000 00000001 00000063 00000007 00000000 c0006f30 00000000
> 	GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000005
> 	GPR24: c0c67d74 c0c67f1c c0c60000 c0c67d70 c0c0c558 1efdf000 c0c00020 00000000
> 	NIP [c0a04110] topology_init+0x8c/0x138
> 	LR [c0a040d8] topology_init+0x54/0x138
> 	Call Trace:
> 	[e100de60] [80808080] 0x80808080 (unreliable)
> 	[e100de90] [c0006bd4] do_one_initcall+0x48/0x1bc
> 	[e100def0] [c0a0150c] kernel_init_freeable+0x1c8/0x278
> 	[e100df20] [c0006f44] kernel_init+0x14/0x10c
> 	[e100df30] [c00190fc] ret_from_kernel_thread+0x14/0x1c
> 	Instruction dump:
> 	7c692e70 7d290194 7c035040 7c7f1b78 5529103a 546706fe 5468103a 39400001
> 	7c641b78 40800054 80c690b4 7fb9402e <81060034> 7fbeea14 2c080000 7fa3eb78
> 	---[ end trace b246ffbc6bbbb6fb ]---
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/smp: Fix OOPS in topology_init()
      https://git.kernel.org/powerpc/c/8241461536f21bbe51308a6916d1c9fb2e6b75a7

cheers
