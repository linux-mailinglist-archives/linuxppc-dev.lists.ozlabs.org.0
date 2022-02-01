Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDBF4A5FCA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 16:14:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp7l10CJsz3dsX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 02:14:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vEF+6PbT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vEF+6PbT; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp7ZZ2d6dz3cb1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 02:07:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A71F1B82E8F;
 Tue,  1 Feb 2022 15:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56523C340EB;
 Tue,  1 Feb 2022 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643728034;
 bh=1OBxWZHG831M1SPbV5jBb3+7JNwP6F1nuWQ1Actjs/I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vEF+6PbTK4CgyskQVbXgAKAXFPuraXewLZTXYlM+Z5DgpaGFBcLuczyKz5+zjLbp3
 amtv+YcofWhUs+oz8EeHVzqbBZnGJ2dCSNYcV14G8ruL7Tujvj1PNo3pzYdbJ3qzXu
 i4j+lI4e61pTb/lKJG7x86Lumvf8IQf/gT2u49mNi2kHlaxD5580PPPUTStFr+JuYA
 0eWMAwSYgP+E/8dPhx/N4xZiVRLNsl+C1Tqx2lDXTmJpA/wVFDcmtv+RpLc9Av/OI7
 c9BI1AyleRQGsEbC7SPUn88WD2I6p/+qfLlS2a1GbkW3rjeL2V1Rh25RVLOBWG7C63
 gSTHWP7WFi9ow==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de
Subject: [PATCH V5 12/21] riscv: compat: syscall: Add entry.S implementation
Date: Tue,  1 Feb 2022 23:05:36 +0800
Message-Id: <20220201150545.1512822-13-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201150545.1512822-1-guoren@kernel.org>
References: <20220201150545.1512822-1-guoren@kernel.org>
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>
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

