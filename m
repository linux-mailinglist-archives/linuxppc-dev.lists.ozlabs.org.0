Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BFC3533F1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 13:52:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FCFf71q8rz3c5v
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 22:52:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FCFdp53c2z2ywx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 22:52:14 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FCFdp1bPJz9sWD; Sat,  3 Apr 2021 22:52:13 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <9121a44a2d50ba1af18d8aa5ada06c9a3bea8afd.1617200085.git.christophe.leroy@csgroup.eu>
References: <9121a44a2d50ba1af18d8aa5ada06c9a3bea8afd.1617200085.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/ptrace: Don't return error when getting/setting
 FP regs without CONFIG_PPC_FPU_REGS
Message-Id: <161745070512.936361.2043800315190251594.b4-ty@ellerman.id.au>
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

On Wed, 31 Mar 2021 14:14:58 +0000 (UTC), Christophe Leroy wrote:
> An #ifdef CONFIG_PPC_FPU_REGS is missing in arch_ptrace() leading
> to the following Oops because [REGSET_FPR] entry is not initialised in
> native_regsets[].
> 
> [   41.917608] BUG: Unable to handle kernel instruction fetch
> [   41.922849] Faulting instruction address: 0xff8fd228
> [   41.927760] Oops: Kernel access of bad area, sig: 11 [#1]
> [   41.933089] BE PAGE_SIZE=4K PREEMPT CMPC885
> [   41.940753] Modules linked in:
> [   41.943768] CPU: 0 PID: 366 Comm: gdb Not tainted 5.12.0-rc5-s3k-dev-01666-g7aac86a0f057-dirty #4835
> [   41.952800] NIP:  ff8fd228 LR: c004d9e0 CTR: ff8fd228
> [   41.957790] REGS: caae9df0 TRAP: 0400   Not tainted  (5.12.0-rc5-s3k-dev-01666-g7aac86a0f057-dirty)
> [   41.966741] MSR:  40009032 <EE,ME,IR,DR,RI>  CR: 82004248  XER: 20000000
> [   41.973540]
> [   41.973540] GPR00: c004d9b4 caae9eb0 c1b64f60 c1b64520 c0713cd4 caae9eb8 c1bacdfc 00000004
> [   41.973540] GPR08: 00000200 ff8fd228 c1bac700 00001032 28004242 1061aaf4 00000001 106d64a0
> [   41.973540] GPR16: 00000000 00000000 7fa0a774 10610000 7fa0aef9 00000000 10610000 7fa0a538
> [   41.973540] GPR24: 7fa0a580 7fa0a570 c1bacc00 c1b64520 c1bacc00 caae9ee8 00000108 c0713cd4
> [   42.009685] NIP [ff8fd228] 0xff8fd228
> [   42.013300] LR [c004d9e0] __regset_get+0x100/0x124
> [   42.018036] Call Trace:
> [   42.020443] [caae9eb0] [c004d9b4] __regset_get+0xd4/0x124 (unreliable)
> [   42.026899] [caae9ee0] [c004da94] copy_regset_to_user+0x5c/0xb0
> [   42.032751] [caae9f10] [c002f640] sys_ptrace+0xe4/0x588
> [   42.037915] [caae9f30] [c0011010] ret_from_syscall+0x0/0x28
> [   42.043422] --- interrupt: c00 at 0xfd1f8e4
> [   42.047553] NIP:  0fd1f8e4 LR: 1004a688 CTR: 00000000
> [   42.052544] REGS: caae9f40 TRAP: 0c00   Not tainted  (5.12.0-rc5-s3k-dev-01666-g7aac86a0f057-dirty)
> [   42.061494] MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 48004442  XER: 00000000
> [   42.068551]
> [   42.068551] GPR00: 0000001a 7fa0a040 77dad7e0 0000000e 00000170 00000000 7fa0a078 00000004
> [   42.068551] GPR08: 00000000 108deb88 108dda40 106d6010 44004442 1061aaf4 00000001 106d64a0
> [   42.068551] GPR16: 00000000 00000000 7fa0a774 10610000 7fa0aef9 00000000 10610000 7fa0a538
> [   42.068551] GPR24: 7fa0a580 7fa0a570 1078fe00 1078fd70 1078fd70 00000170 0fdd3244 0000000d
> [   42.104696] NIP [0fd1f8e4] 0xfd1f8e4
> [   42.108225] LR [1004a688] 0x1004a688
> [   42.111753] --- interrupt: c00
> [   42.114768] Instruction dump:
> [   42.117698] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> [   42.125443] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> [   42.133195] ---[ end trace d35616f22ab2100c ]---
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/ptrace: Don't return error when getting/setting FP regs without CONFIG_PPC_FPU_REGS
      https://git.kernel.org/powerpc/c/3618250c8399cb36f4a0fbc48610a178307e1c64

cheers
