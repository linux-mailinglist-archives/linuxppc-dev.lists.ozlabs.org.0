Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EF144B623
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 23:22:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpjCm3HNGz3db2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 09:22:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZhXr5rLl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZhXr5rLl; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpj9n6Gqnz3cG3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 09:21:01 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F98661A6C;
 Tue,  9 Nov 2021 22:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496460;
 bh=CEcvv+vzt12RPoJlIolDN3gbYICVproW8INlvGSj9bM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZhXr5rLlnEM0IJQNbq4hv539RZSVnssDV9F1jsg15eRPRrvAyL46kWUwRiEjRDrB4
 aSJtBPxh/DFI3VUeWq+Ed39mcowgv+kKeFst8Ro4B8jsyVTekAEoGsMfeHuvSB4yWB
 0ww5dqldUPWUkKKZNp9qfFLj44OY/zeNem0xZAF2pJMI4seYrOflJlCXb0jDrURQvY
 KmTkyocJtUsqwa7ZhuODHbwroHb2RuBlz124tEoJZmF46WXIuZAAaUgVoontDry3aR
 /hnK7eVcCrL6cKuzPrAffOJeDnXGkl3ClYmPrdzlIqiTpj1bceIMRNmWpuBZNxmiL8
 PadM29uTEv6Dw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 74/75] powerpc/8xx: Fix Oops with
 STRICT_KERNEL_RWX without DEBUG_RODATA_TEST
Date: Tue,  9 Nov 2021 17:19:04 -0500
Message-Id: <20211109221905.1234094-74-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109221905.1234094-1-sashal@kernel.org>
References: <20211109221905.1234094-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, paulus@samba.org,
 gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit c12ab8dbc492b992e1ea717db933cee568780c47 ]

Until now, all tests involving CONFIG_STRICT_KERNEL_RWX were done with
DEBUG_RODATA_TEST to check the result. But now that
CONFIG_STRICT_KERNEL_RWX is selected by default, it came without
CONFIG_DEBUG_RODATA_TEST and led to the following Oops

[    6.830908] Freeing unused kernel image (initmem) memory: 352K
[    6.840077] BUG: Unable to handle kernel data access on write at 0xc1285200
[    6.846836] Faulting instruction address: 0xc0004b6c
[    6.851745] Oops: Kernel access of bad area, sig: 11 [#1]
[    6.857075] BE PAGE_SIZE=16K PREEMPT CMPC885
[    6.861348] SAF3000 DIE NOTIFICATION
[    6.864830] CPU: 0 PID: 1 Comm: swapper Not tainted 5.15.0-rc5-s3k-dev-02255-g2747d7b7916f #451
[    6.873429] NIP:  c0004b6c LR: c0004b60 CTR: 00000000
[    6.878419] REGS: c902be60 TRAP: 0300   Not tainted  (5.15.0-rc5-s3k-dev-02255-g2747d7b7916f)
[    6.886852] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 53000335  XER: 8000ff40
[    6.893564] DAR: c1285200 DSISR: 82000000
[    6.893564] GPR00: 0c000000 c902bf20 c20f4000 08000000 00000001 04001f00 c1800000 00000035
[    6.893564] GPR08: ff0001ff c1280000 00000002 c0004b60 00001000 00000000 c0004b1c 00000000
[    6.893564] GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    6.893564] GPR24: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 c1060000
[    6.932034] NIP [c0004b6c] kernel_init+0x50/0x138
[    6.936682] LR [c0004b60] kernel_init+0x44/0x138
[    6.941245] Call Trace:
[    6.943653] [c902bf20] [c0004b60] kernel_init+0x44/0x138 (unreliable)
[    6.950022] [c902bf30] [c001122c] ret_from_kernel_thread+0x5c/0x64
[    6.956135] Instruction dump:
[    6.959060] 48ffc521 48045469 4800d8cd 3d20c086 89295fa0 2c090000 41820058 480796c9
[    6.966890] 4800e48d 3d20c128 39400002 3fe0c106 <91495200> 3bff8000 4806fa1d 481f7d75
[    6.974902] ---[ end trace 1e397bacba4aa610 ]---

0xc1285200 corresponds to 'system_state' global var that the kernel is trying to set to
SYSTEM_RUNNING. This var is above the RO/RW limit so it shouldn't Oops.

It oopses because the dirty bit is missing.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/3d5800b0bbcd7b19761b98f50421358667b45331.1635520232.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/head_8xx.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 9bdb95f5694f7..2d596881b70e7 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -755,7 +755,7 @@ _GLOBAL(mmu_pin_tlb)
 	cmplw	r6, r9
 	bdnzt	lt, 2b
 
-4:	LOAD_REG_IMMEDIATE(r8, 0xf0 | _PAGE_SPS | _PAGE_SH | _PAGE_PRESENT)
+4:	LOAD_REG_IMMEDIATE(r8, 0xf0 | _PAGE_DIRTY | _PAGE_SPS | _PAGE_SH | _PAGE_PRESENT)
 2:	ori	r0, r6, MD_EVALID
 	mtspr	SPRN_MD_CTR, r5
 	mtspr	SPRN_MD_EPN, r0
-- 
2.33.0

