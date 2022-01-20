Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D97C4948CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 08:44:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfZKB0v2Jz3cjd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 18:44:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lom4qx8T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lom4qx8T; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfZDW0PTkz3cFX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 18:40:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2A81F616EB;
 Thu, 20 Jan 2022 07:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91272C340E7;
 Thu, 20 Jan 2022 07:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642664423;
 bh=+foGi24mAAkXv8HxHMW+tCVoz4WSBNmzOsAdyp+IN6s=;
 h=From:To:Cc:Subject:Date:From;
 b=lom4qx8Te+fvkiYhBhSctO4VuKi6tI0DbDmkHwpzmV//j2i2ErVO3t7aDskslPgRk
 LXTRb5IbUV0LggS3rARH7FiiY0sWWAT9q10+8hsW1WjRumx52fSr5qZJKdbQfdUUS7
 kAQvkC0DVHon+jSt2vPO8VA514PVFxa+kNydggWhJNkc43VoOnglGKDpg5szAiFQur
 prLryGZqMuK0lxnZOklFZOwDE8CIEOpqR8J1HPksfNnG6dbefol4ArvNWMQMcXHeyO
 Yxw7TwdmL7JKjLzKI8rr/xbpzXgy8JvrhlnHCqbqMlk/yMvPXvVNEF2wZN8MMCH0DO
 cEGKyYdX/LGLg==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de,
 hch@infradead.org
Subject: [PATCH V3 07/17] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
Date: Thu, 20 Jan 2022 15:39:00 +0800
Message-Id: <20220120073911.99857-8-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-s390@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 inux-parisc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

Make TASK_SIZE from const to dynamic detect TIF_32BIT flag
function. Refer to arm64 to implement DEFAULT_MAP_WINDOW_64 for
efi-stub.

Limit 32-bit compatible process in 0-2GB virtual address range
(which is enough for real scenarios), because it could avoid
address sign extend problem when 32-bit enter 64-bit and ease
software design.

The standard 32-bit TASK_SIZE is 0x9dc00000:FIXADDR_START, and
compared to a compatible 32-bit, it increases 476MB for the
application's virtual address.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/include/asm/pgtable.h        | 11 ++++++++++-
 arch/riscv/include/asm/processor.h      |  6 ++++++
 drivers/firmware/efi/libstub/efi-stub.c |  2 +-
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 67f687aee673..e0add598e66a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -669,7 +669,16 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
  * Note that PGDIR_SIZE must evenly divide TASK_SIZE.
  */
 #ifdef CONFIG_64BIT
-#define TASK_SIZE (PGDIR_SIZE * PTRS_PER_PGD / 2)
+#define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
+
+#ifdef CONFIG_COMPAT
+#define TASK_SIZE_32	(_AC(0x80000000, UL) - PAGE_SIZE)
+#define TASK_SIZE	(test_thread_flag(TIF_32BIT) ? \
+			 TASK_SIZE_32 : TASK_SIZE_64)
+#else
+#define TASK_SIZE	TASK_SIZE_64
+#endif
+
 #else
 #define TASK_SIZE FIXADDR_START
 #endif
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 0749924d9e55..8649436b8fcf 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -61,6 +61,12 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
 extern void start_thread(struct pt_regs *regs,
 			unsigned long pc, unsigned long sp);
 
+#ifdef CONFIG_COMPAT
+#define DEFAULT_MAP_WINDOW_64 TASK_SIZE_64
+#else
+#define DEFAULT_MAP_WINDOW_64 TASK_SIZE
+#endif
+
 /* Free all resources held by a thread. */
 static inline void release_thread(struct task_struct *dead_task)
 {
diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index e87e7f1b1a33..f57f85646a45 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -38,7 +38,7 @@
 #define EFI_RT_VIRTUAL_BASE	SZ_512M
 #define EFI_RT_VIRTUAL_SIZE	SZ_512M
 
-#ifdef CONFIG_ARM64
+#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 # define EFI_RT_VIRTUAL_LIMIT	DEFAULT_MAP_WINDOW_64
 #else
 # define EFI_RT_VIRTUAL_LIMIT	TASK_SIZE
-- 
2.25.1

