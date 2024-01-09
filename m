Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63324827E02
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 05:55:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8JXr6bwdz3cWB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 15:55:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=guozihua@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1054 seconds by postgrey-1.37 at boromir; Tue, 09 Jan 2024 14:59:12 AEDT
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8HHN1kq6z2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 14:59:09 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4T8Gtf1PhMzZgtf;
	Tue,  9 Jan 2024 11:41:14 +0800 (CST)
Received: from dggpemm500024.china.huawei.com (unknown [7.185.36.203])
	by mail.maildlp.com (Postfix) with ESMTPS id 48B961404FC;
	Tue,  9 Jan 2024 11:41:30 +0800 (CST)
Received: from huawei.com (10.67.174.60) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Jan
 2024 11:41:30 +0800
From: GUO Zihua <guozihua@huawei.com>
To: <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Fix preserved memory size for int-vectors
Date: Tue, 9 Jan 2024 03:38:51 +0000
Message-ID: <20240109033851.1310455-1-guozihua@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.60]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-Mailman-Approved-At: Tue, 09 Jan 2024 15:55:35 +1100
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
 arch/powerpc/kernel/prom.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 0b5878c3125b..f374487513b3 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -758,6 +758,7 @@ static inline void save_fscr_to_task(void) {}
 void __init early_init_devtree(void *params)
 {
 	phys_addr_t limit;
+	size_t int_vector_size;
 
 	DBG(" -> early_init_devtree(%px)\n", params);
 
@@ -810,9 +811,17 @@ void __init early_init_devtree(void *params)
 	setup_initial_memory_limit(memstart_addr, first_memblock_size);
 	/* Reserve MEMBLOCK regions used by kernel, initrd, dt, etc... */
 	memblock_reserve(PHYSICAL_START, __pa(_end) - PHYSICAL_START);
+#ifdef CONFIG_PPC64
+	/* If relocatable, reserve at least 32k for interrupt vectors etc. */
+	int_vector_size = (size_t)((uintptr_t)__end_interrupts -
+				   (uintptr_t)_stext);
+	int_vector_size = max_t(size_t, 0x8000, int_vector_size);
+#else
 	/* If relocatable, reserve first 32k for interrupt vectors etc. */
+	int_vector_size = 0x8000;
+#endif
 	if (PHYSICAL_START > MEMORY_START)
-		memblock_reserve(MEMORY_START, 0x8000);
+		memblock_reserve(MEMORY_START, int_vector_size);
 	reserve_kdump_trampoline();
 #if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
 	/*
-- 
2.34.1

