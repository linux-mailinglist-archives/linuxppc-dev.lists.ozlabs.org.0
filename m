Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFE96039D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 08:38:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsgzL3BvXz3dqf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 17:38:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Msgyp27pLz3bj0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 17:37:50 +1100 (AEDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MsgvZ3rPYzJn2B;
	Wed, 19 Oct 2022 14:35:06 +0800 (CST)
Received: from huawei.com (10.67.175.83) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 14:37:45 +0800
From: ruanjinjie <ruanjinjie@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<joel@jms.id.au>, <Julia.Lawall@inria.fr>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH -next v2] powerpc/mpic_msgr: fix cast removes address space of expression warnings
Date: Wed, 19 Oct 2022 14:34:14 +0800
Message-ID: <20221019063414.3758087-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.83]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
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
Cc: ruanjinjie@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When build Linux kernel, encounter the following warnings:

./arch/powerpc/sysdev/mpic_msgr.c:230:38: warning: cast removes address space '__iomem' of expression
./arch/powerpc/sysdev/mpic_msgr.c:230:27: warning: incorrect type in assignment (different address spaces)

The data type of msgr->mer and msgr->base are 'u32 __iomem *', but
converted to 'u32 *' and 'u8 *' directly and cause above warnings, now
instead of using a type cast, change the size of the pointer offset to fix
these warnings.

Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
---
v2:
- change the macro of MPIC_MSGR_MER_OFFSET to avoid type cast and
  simplify the fix
---
 arch/powerpc/sysdev/mpic_msgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/mpic_msgr.c b/arch/powerpc/sysdev/mpic_msgr.c
index a439e33eae06..d75064fb7d12 100644
--- a/arch/powerpc/sysdev/mpic_msgr.c
+++ b/arch/powerpc/sysdev/mpic_msgr.c
@@ -20,7 +20,7 @@
 
 #define MPIC_MSGR_REGISTERS_PER_BLOCK	4
 #define MPIC_MSGR_STRIDE		0x10
-#define MPIC_MSGR_MER_OFFSET		0x100
+#define MPIC_MSGR_MER_OFFSET		(0x100 / sizeof(u32))
 #define MSGR_INUSE			0
 #define MSGR_FREE			1
 
@@ -234,7 +234,7 @@ static int mpic_msgr_probe(struct platform_device *dev)
 
 		reg_number = block_number * MPIC_MSGR_REGISTERS_PER_BLOCK + i;
 		msgr->base = msgr_block_addr + i * MPIC_MSGR_STRIDE;
-		msgr->mer = (u32 *)((u8 *)msgr->base + MPIC_MSGR_MER_OFFSET);
+		msgr->mer = msgr->base + MPIC_MSGR_MER_OFFSET;
 		msgr->in_use = MSGR_FREE;
 		msgr->num = i;
 		raw_spin_lock_init(&msgr->lock);
-- 
2.25.1

