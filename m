Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3634E424E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 15:50:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNDtD4rSBz3bXP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 01:50:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tkSlmRrY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tkSlmRrY; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNDhf38q2z3bgt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 01:41:54 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 19735B81BB4;
 Tue, 22 Mar 2022 14:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64140C36AE3;
 Tue, 22 Mar 2022 14:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647960110;
 bh=UEwTRlZAy4kLlmbBNaeoYiWupFPI5fJMOID0/hv13uY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tkSlmRrY1mxJ+6ucc+vAJL1FrTZyh0/pSA0qI4pFjHebCGD79mvVndG/DWebXnbGr
 NeZXvcNQDwhbL44r1Wd58uKWA1/bE67G5jTt6xJgzlHJLpvgk43JB3R6PxZS+DCG7H
 tQBHRz83kP8pVkDv/5DUJBl4saHxk8b9A0jo5Xkc3xU3uvGS2oweFLcbA7JMSkT7dK
 FluzFWHcrmRACvAYesz+l9G216foqM4pXnWmIKxVIiHFiuCmdQKL+lWzlf0nHr5svY
 Ns0C1ZScDOs+C47WV/LmaEkN+vghEQoyOcNZZP0cukQAClPGBcTx60gttwq6Q5uEcc
 gZaMP02H89uuQ==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de
Subject: [PATCH V9 15/20] riscv: compat: Add hw capability check for elf
Date: Tue, 22 Mar 2022 22:39:58 +0800
Message-Id: <20220322144003.2357128-16-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322144003.2357128-1-guoren@kernel.org>
References: <20220322144003.2357128-1-guoren@kernel.org>
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
 Guo Ren <guoren@linux.alibaba.com>, heiko@sntech.de,
 linux-parisc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

Detect hardware COMPAT (32bit U-mode) capability in rv64. If not
support COMPAT mode in hw, compat_elf_check_arch would return
false by compat_binfmt_elf.c

Add CLASS to enhance (compat_)elf_check_arch to distinguish
32BIT/64BIT elf.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/elf.h |  6 ++++--
 arch/riscv/kernel/process.c  | 28 ++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index a234656cfb5d..754fdb8cee96 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -33,9 +33,11 @@
 /*
  * This is used to ensure we don't load something for the wrong architecture.
  */
-#define elf_check_arch(x) ((x)->e_machine == EM_RISCV)
+#define elf_check_arch(x) (((x)->e_machine == EM_RISCV) && \
+			   ((x)->e_ident[EI_CLASS] == ELF_CLASS))
 
-#define compat_elf_check_arch(x) ((x)->e_machine == EM_RISCV)
+extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
+#define compat_elf_check_arch	compat_elf_check_arch
 
 #define CORE_DUMP_USE_REGSET
 #define ELF_EXEC_PAGESIZE	(PAGE_SIZE)
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 8c7665481a9f..203fdaa3f9e2 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -83,6 +83,34 @@ void show_regs(struct pt_regs *regs)
 		dump_backtrace(regs, NULL, KERN_DEFAULT);
 }
 
+#ifdef CONFIG_COMPAT
+static bool compat_mode_supported __read_mostly;
+
+bool compat_elf_check_arch(Elf32_Ehdr *hdr)
+{
+	return compat_mode_supported &&
+	       hdr->e_machine == EM_RISCV &&
+	       hdr->e_ident[EI_CLASS] == ELFCLASS32;
+}
+
+static int __init compat_mode_detect(void)
+{
+	unsigned long tmp = csr_read(CSR_STATUS);
+
+	csr_write(CSR_STATUS, (tmp & ~SR_UXL) | SR_UXL_32);
+	compat_mode_supported =
+			(csr_read(CSR_STATUS) & SR_UXL) == SR_UXL_32;
+
+	csr_write(CSR_STATUS, tmp);
+
+	pr_info("riscv: ELF compat mode %s",
+			compat_mode_supported ? "supported" : "failed");
+
+	return 0;
+}
+early_initcall(compat_mode_detect);
+#endif
+
 void start_thread(struct pt_regs *regs, unsigned long pc,
 	unsigned long sp)
 {
-- 
2.25.1

