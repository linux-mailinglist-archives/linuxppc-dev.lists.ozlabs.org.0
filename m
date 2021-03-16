Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E9D33CC6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 05:12:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F00Hp6Hvyz30Hh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 15:12:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F00HV2kLHz3035
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 15:12:15 +1100 (AEDT)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F00FR34DBzkZnD;
 Tue, 16 Mar 2021 12:10:35 +0800 (CST)
Received: from huawei.com (10.67.174.47) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Tue, 16 Mar 2021
 12:12:00 +0800
From: He Ying <heying24@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <npiggin@gmail.com>, <dja@axtens.net>, <akpm@linux-foundation.org>,
 <aneesh.kumar@linux.ibm.com>, <rppt@kernel.org>, <ardb@kernel.org>,
 <clg@kaod.org>, <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: arch/powerpc/kernel/setup_64.c - cleanup warnings
Date: Tue, 16 Mar 2021 00:11:48 -0400
Message-ID: <20210316041148.29694-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-CFilter-Loop: Reflected
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
Cc: johnny.chenyi@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

warning: symbol 'rfi_flush' was not declared.
warning: symbol 'entry_flush' was not declared.
warning: symbol 'uaccess_flush' was not declared.
We found warnings above in arch/powerpc/kernel/setup_64.c by using
sparse tool.

Define 'entry_flush' and 'uaccess_flush' as static because they are not
referenced outside the file. Include asm/security_features.h in which
'rfi_flush' is declared.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: He Ying <heying24@huawei.com>
---
 arch/powerpc/kernel/setup_64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 560ed8b975e7..f92d72a7e7ce 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -68,6 +68,7 @@
 #include <asm/early_ioremap.h>
 #include <asm/pgalloc.h>
 #include <asm/asm-prototypes.h>
+#include <asm/security_features.h>
 
 #include "setup.h"
 
@@ -949,8 +950,8 @@ static bool no_rfi_flush;
 static bool no_entry_flush;
 static bool no_uaccess_flush;
 bool rfi_flush;
-bool entry_flush;
-bool uaccess_flush;
+static bool entry_flush;
+static bool uaccess_flush;
 DEFINE_STATIC_KEY_FALSE(uaccess_flush_key);
 EXPORT_SYMBOL(uaccess_flush_key);
 
-- 
2.17.1

