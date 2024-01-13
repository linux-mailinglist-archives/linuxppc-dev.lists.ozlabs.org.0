Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C7C82CA7A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jan 2024 09:08:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TBrcw5FnWz3c5W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jan 2024 19:08:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=guozihua@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TBrcR1Lqlz30gm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jan 2024 19:07:48 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4TBrZR75fHz1Q7xG;
	Sat, 13 Jan 2024 16:06:07 +0800 (CST)
Received: from dggpemm500024.china.huawei.com (unknown [7.185.36.203])
	by mail.maildlp.com (Postfix) with ESMTPS id D04A514011A;
	Sat, 13 Jan 2024 16:07:42 +0800 (CST)
Received: from huawei.com (10.67.174.60) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 13 Jan
 2024 16:07:42 +0800
From: GUO Zihua <guozihua@huawei.com>
To: <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc: Fix preserved memory size for int-vectors
Date: Sat, 13 Jan 2024 08:05:09 +0000
Message-ID: <20240113080509.1598290-1-guozihua@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.60]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500024.china.huawei.com (7.185.36.203)
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
Cc: aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The first 32k of memory is reserved for interrupt vectors, however for
powerpc64 this might not be enough. Fix this by reserving the maximum
size between 32k and the real size of interrupt vectors.

Signed-off-by: GUO Zihua <guozihua@huawei.com>
---

v2:
  Eliminate the unneccessary casting and changed type of int_vector_size
into phys_addr_t.

---
 arch/powerpc/kernel/prom.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 0b5878c3125b..cec5ec320ba3 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -757,7 +757,7 @@ static inline void save_fscr_to_task(void) {}
 
 void __init early_init_devtree(void *params)
 {
-	phys_addr_t limit;
+	phys_addr_t limit, int_vector_size;
 
 	DBG(" -> early_init_devtree(%px)\n", params);
 
@@ -810,9 +810,16 @@ void __init early_init_devtree(void *params)
 	setup_initial_memory_limit(memstart_addr, first_memblock_size);
 	/* Reserve MEMBLOCK regions used by kernel, initrd, dt, etc... */
 	memblock_reserve(PHYSICAL_START, __pa(_end) - PHYSICAL_START);
+#ifdef CONFIG_PPC64
+	/* If relocatable, reserve at least 32k for interrupt vectors etc. */
+	int_vector_size = __end_interrupts - _stext;
+	int_vector_size = max_t(phys_addr_t, SZ_32K, int_vector_size);
+#else
 	/* If relocatable, reserve first 32k for interrupt vectors etc. */
+	int_vector_size = SZ_32K;
+#endif
 	if (PHYSICAL_START > MEMORY_START)
-		memblock_reserve(MEMORY_START, 0x8000);
+		memblock_reserve(MEMORY_START, int_vector_size);
 	reserve_kdump_trampoline();
 #if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
 	/*
-- 
2.34.1

