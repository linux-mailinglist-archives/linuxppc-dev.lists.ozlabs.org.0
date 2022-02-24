Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F32594C2762
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 10:02:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K46Nw296nz30NZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 20:02:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NpS8IbTx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NpS8IbTx; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K46Fj4H6Wz3cSN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:56:09 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E0A9AB82497;
 Thu, 24 Feb 2022 08:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A18C340EB;
 Thu, 24 Feb 2022 08:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645692966;
 bh=a1sC80QEMsJ1SgwAfWEJYAxYwB7cBGeGznoe8NpsNfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NpS8IbTxPPAt4S03C9fF9JBTCncwR1OU1YbsGIVcwFRfu3CFb0E++WuIYfsqKk+hj
 H7YRu4FxifAv0w1LbWv32kJbqzHdbp5hyDhhd2xtXVEL3+uY74mxNRhJkjPQgkgFWI
 RFTSncouIW5jBpQtW4xEVC4P2CS2LBRscnCcqRAD8D2yVSeZWHy9DK8/IDeWLg1xZD
 zu/do4A3OFE/w29A8S6YgQVMnu1Tru7MBXFIU3cgibKE5VarQBAqWzrMmwl4Cpxw7U
 OZe6xg8KOQp84zv2c3m+8S2qjhkrjs87gobwhadSj0Hn51/dOTU8GEkLyRARCa+HBu
 7lmP+lN4XfJFw==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de
Subject: [PATCH V6 10/20] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
Date: Thu, 24 Feb 2022 16:54:00 +0800
Message-Id: <20220224085410.399351-11-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224085410.399351-1-guoren@kernel.org>
References: <20220224085410.399351-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/include/asm/pgtable.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7e949f25c933..f0d125ea3ceb 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -704,8 +704,17 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
  * 63–48 all equal to bit 47, or else a page-fault exception will occur."
  */
 #ifdef CONFIG_64BIT
-#define TASK_SIZE      (PGDIR_SIZE * PTRS_PER_PGD / 2)
-#define TASK_SIZE_MIN  (PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
+#define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
+#define TASK_SIZE_MIN	(PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
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
 #define TASK_SIZE	FIXADDR_START
 #define TASK_SIZE_MIN	TASK_SIZE
-- 
2.25.1

