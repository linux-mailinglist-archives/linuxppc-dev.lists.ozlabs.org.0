Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 870DF4A2F55
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 13:24:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmD5g3WFrz3dxT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 23:24:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q4+2JTmg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q4+2JTmg; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmCzV5fgKz3cVq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 23:18:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2AB4760BA0;
 Sat, 29 Jan 2022 12:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB63EC340EF;
 Sat, 29 Jan 2022 12:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643458724;
 bh=q8bDTZe0nvVf8IvNriLF4Pp2BAUqoYv2qqiLGFTl3wc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q4+2JTmgzbyh3gLxAYEFoYkDgM7kCowH4SfFcEtRa3vzV3GU68TlGfQcJaaFJ6zoy
 Hmu9icK3t7p4yn+Xunu7nhtjsStaPZCTLd58+Ep4ls94+tAebQguL2CVOKV3Ob2bUH
 3wQBhQHDO3tCXK/Wn2lRFHaWwsFhzkPN6Yo9Mc/7M9YVgBXPhUeUD0s07GSu2AMS03
 YgFFt/2xJa+BNC5CwntJ8EhbY40VuLtmSAQrXYaSTewQgX1A7QCgYWXJ4FYn3+VYyH
 RSg3gP+Bo9iDTybCP5tDYf74ENfMROOrvg3ZtipNv0ldGhMyO8XOA4oGiF/NjKA5DQ
 G2kw0lNs9K4VA==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de,
 hch@infradead.org
Subject: [PATCH V4 09/17] riscv: compat: syscall: Add entry.S implementation
Date: Sat, 29 Jan 2022 20:17:20 +0800
Message-Id: <20220129121728.1079364-10-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220129121728.1079364-1-guoren@kernel.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
MIME-Version: 1.0
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, linux-parisc@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

Implement the entry of compat_sys_call_table[] in asm. Ref to
riscv-privileged spec 4.1.1 Supervisor Status Register (sstatus):

 BIT[32:33] = UXL[1:0]:
 - 1:32
 - 2:64
 - 3:128

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/include/asm/csr.h |  7 +++++++
 arch/riscv/kernel/entry.S    | 18 ++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index ae711692eec9..eed96fa62d66 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -36,6 +36,13 @@
 #define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
 #endif
 
+#ifdef CONFIG_COMPAT
+#define SR_UXL		_AC(0x300000000, UL) /* XLEN mask for U-mode */
+#define SR_UXL_32	_AC(0x100000000, UL) /* XLEN = 32 for U-mode */
+#define SR_UXL_64	_AC(0x200000000, UL) /* XLEN = 64 for U-mode */
+#define SR_UXL_SHIFT	32
+#endif
+
 /* SATP flags */
 #ifndef CONFIG_64BIT
 #define SATP_PPN	_AC(0x003FFFFF, UL)
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index ed29e9c8f660..1951743f09b3 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -207,13 +207,27 @@ check_syscall_nr:
 	 * Syscall number held in a7.
 	 * If syscall number is above allowed value, redirect to ni_syscall.
 	 */
-	bgeu a7, t0, 1f
+	bgeu a7, t0, 3f
+#ifdef CONFIG_COMPAT
+	REG_L s0, PT_STATUS(sp)
+	srli s0, s0, SR_UXL_SHIFT
+	andi s0, s0, (SR_UXL >> SR_UXL_SHIFT)
+	li t0, (SR_UXL_32 >> SR_UXL_SHIFT)
+	sub t0, s0, t0
+	bnez t0, 1f
+
+	/* Call compat_syscall */
+	la s0, compat_sys_call_table
+	j 2f
+1:
+#endif
 	/* Call syscall */
 	la s0, sys_call_table
+2:
 	slli t0, a7, RISCV_LGPTR
 	add s0, s0, t0
 	REG_L s0, 0(s0)
-1:
+3:
 	jalr s0
 
 ret_from_syscall:
-- 
2.25.1

