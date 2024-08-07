Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B80949DED
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 04:50:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wdvmr01QKz3d9T
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 12:50:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdvmN0LbCz30WB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 12:50:04 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Wdvfg4WCgz1S78X;
	Wed,  7 Aug 2024 10:45:15 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 80E98180042;
	Wed,  7 Aug 2024 10:49:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 7 Aug
 2024 10:49:57 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <dennis@kernel.org>, <tj@kernel.org>, <cl@linux.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <linux-mm@kvack.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH -next v2] powerpc: Remove useless config comment in asm/percpu.h
Date: Wed, 7 Aug 2024 10:56:04 +0800
Message-ID: <20240807025604.2817577-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi100008.china.huawei.com (7.221.188.57)
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
Cc: ruanjinjie@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 0db880fc865f ("powerpc: Avoid nmi_enter/nmi_exit in real mode
interrupt.") has a config comment typo, and the #if/#else/#endif section
is small and doesn't nest additional #ifdefs so the comment is useless
and should be removed completely.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2:
- Remove instead of change the comment.
---
 arch/powerpc/include/asm/percpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm/percpu.h
index 634970ce13c6..ecf5ac70cfae 100644
--- a/arch/powerpc/include/asm/percpu.h
+++ b/arch/powerpc/include/asm/percpu.h
@@ -23,7 +23,7 @@ DECLARE_STATIC_KEY_FALSE(__percpu_first_chunk_is_paged);
 		(static_key_enabled(&__percpu_first_chunk_is_paged.key))
 #else
 #define percpu_first_chunk_is_paged	false
-#endif /* CONFIG_PPC64 && CONFIG_SMP */
+#endif
 
 #include <asm-generic/percpu.h>
 
-- 
2.34.1

