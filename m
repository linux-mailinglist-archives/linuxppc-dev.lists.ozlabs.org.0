Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 723AD6B7CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 10:03:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pVBq2yn0zDqFs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 18:03:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.191; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pTtd0bvzzDqTp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 17:49:28 +1000 (AEST)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D4F0BAC392A93E6A9E31;
 Wed, 17 Jul 2019 15:49:23 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 17 Jul 2019
 15:49:18 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
Subject: [RFC PATCH 09/10] powerpc/fsl_booke/kaslr: support nokaslr cmdline
 parameter
Date: Wed, 17 Jul 2019 16:06:20 +0800
Message-ID: <20190717080621.40424-10-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190717080621.40424-1-yanaijie@huawei.com>
References: <20190717080621.40424-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
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
Cc: wangkefeng.wang@huawei.com, Jason Yan <yanaijie@huawei.com>,
 linux-kernel@vger.kernel.org, jingxiangfeng@huawei.com,
 thunder.leizhen@huawei.com, fanchengyang@huawei.com, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

One may want to disable kaslr when boot, so provide a cmdline parameter
'nokaslr' to support this.

Signed-off-by: Jason Yan <yanaijie@huawei.com>
Cc: Diana Craciun <diana.craciun@nxp.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/kernel/kaslr_booke.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/kernel/kaslr_booke.c b/arch/powerpc/kernel/kaslr_booke.c
index 00339c05879f..e65a5d9d2ff1 100644
--- a/arch/powerpc/kernel/kaslr_booke.c
+++ b/arch/powerpc/kernel/kaslr_booke.c
@@ -373,6 +373,18 @@ static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size
 	return kaslr_offset;
 }
 
+static inline __init bool kaslr_disabled(void)
+{
+	char *str;
+
+	str = strstr(early_command_line, "nokaslr");
+	if ((str == early_command_line) ||
+	    (str > early_command_line && *(str - 1) == ' '))
+		return true;
+
+	return false;
+}
+
 /*
  * To see if we need to relocate the kernel to a random offset
  * void *dt_ptr - address of the device tree
@@ -388,6 +400,8 @@ notrace void __init kaslr_early_init(void *dt_ptr, phys_addr_t size)
 	kernel_sz = (unsigned long)_end - KERNELBASE;
 
 	kaslr_get_cmdline(dt_ptr);
+	if (kaslr_disabled())
+		return;
 
 	offset = kaslr_choose_location(dt_ptr, size, kernel_sz);
 
-- 
2.17.2

