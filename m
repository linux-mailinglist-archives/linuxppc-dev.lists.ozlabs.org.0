Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 727D14464A2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 15:08:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm2R31ygGz3bg8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 01:08:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm2QZ5R0dz2yZd
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 01:07:50 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hm2QZ0DvKz4xbP;
 Sat,  6 Nov 2021 01:07:50 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <3d5800b0bbcd7b19761b98f50421358667b45331.1635520232.git.christophe.leroy@csgroup.eu>
References: <3d5800b0bbcd7b19761b98f50421358667b45331.1635520232.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/8xx: Fix Oops with STRICT_KERNEL_RWX without
 DEBUG_RODATA_TEST
Message-Id: <163612125412.2515705.13745636929777214451.b4-ty@ellerman.id.au>
Date: Sat, 06 Nov 2021 01:07:34 +1100
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

On Fri, 29 Oct 2021 17:10:45 +0200, Christophe Leroy wrote:
> Until now, all tests involving CONFIG_STRICT_KERNEL_RWX were done with
> DEBUG_RODATA_TEST to check the result. But now that
> CONFIG_STRICT_KERNEL_RWX is selected by default, it came without
> CONFIG_DEBUG_RODATA_TEST and led to the following Oops
> 
> [    6.830908] Freeing unused kernel image (initmem) memory: 352K
> [    6.840077] BUG: Unable to handle kernel data access on write at 0xc1285200
> [    6.846836] Faulting instruction address: 0xc0004b6c
> [    6.851745] Oops: Kernel access of bad area, sig: 11 [#1]
> [    6.857075] BE PAGE_SIZE=16K PREEMPT CMPC885
> [    6.861348] SAF3000 DIE NOTIFICATION
> [    6.864830] CPU: 0 PID: 1 Comm: swapper Not tainted 5.15.0-rc5-s3k-dev-02255-g2747d7b7916f #451
> [    6.873429] NIP:  c0004b6c LR: c0004b60 CTR: 00000000
> [    6.878419] REGS: c902be60 TRAP: 0300   Not tainted  (5.15.0-rc5-s3k-dev-02255-g2747d7b7916f)
> [    6.886852] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 53000335  XER: 8000ff40
> [    6.893564] DAR: c1285200 DSISR: 82000000
> [    6.893564] GPR00: 0c000000 c902bf20 c20f4000 08000000 00000001 04001f00 c1800000 00000035
> [    6.893564] GPR08: ff0001ff c1280000 00000002 c0004b60 00001000 00000000 c0004b1c 00000000
> [    6.893564] GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    6.893564] GPR24: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 c1060000
> [    6.932034] NIP [c0004b6c] kernel_init+0x50/0x138
> [    6.936682] LR [c0004b60] kernel_init+0x44/0x138
> [    6.941245] Call Trace:
> [    6.943653] [c902bf20] [c0004b60] kernel_init+0x44/0x138 (unreliable)
> [    6.950022] [c902bf30] [c001122c] ret_from_kernel_thread+0x5c/0x64
> [    6.956135] Instruction dump:
> [    6.959060] 48ffc521 48045469 4800d8cd 3d20c086 89295fa0 2c090000 41820058 480796c9
> [    6.966890] 4800e48d 3d20c128 39400002 3fe0c106 <91495200> 3bff8000 4806fa1d 481f7d75
> [    6.974902] ---[ end trace 1e397bacba4aa610 ]---
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/8xx: Fix Oops with STRICT_KERNEL_RWX without DEBUG_RODATA_TEST
      https://git.kernel.org/powerpc/c/c12ab8dbc492b992e1ea717db933cee568780c47

cheers
