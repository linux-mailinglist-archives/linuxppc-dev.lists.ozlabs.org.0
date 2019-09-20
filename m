Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AF6B8DF9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 11:46:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZTPS6RVSzDrYZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 19:46:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZSxY3byhzF0ZN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 19:25:37 +1000 (AEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8CF3B624368C4D3EB17C;
 Fri, 20 Sep 2019 17:25:34 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Sep 2019
 17:25:24 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
Subject: [PATCH v7 09/12] powerpc/fsl_booke/kaslr: support nokaslr cmdline
 parameter
Date: Fri, 20 Sep 2019 17:45:43 +0800
Message-ID: <20190920094546.44948-10-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190920094546.44948-1-yanaijie@huawei.com>
References: <20190920094546.44948-1-yanaijie@huawei.com>
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
 linux-kernel@vger.kernel.org, jingxiangfeng@huawei.com, oss@buserror.net,
 zhaohongjiang@huawei.com, thunder.leizhen@huawei.com, yebin10@huawei.com
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
Reviewed-by: Diana Craciun <diana.craciun@nxp.com>
Tested-by: Diana Craciun <diana.craciun@nxp.com>
Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/nohash/kaslr_booke.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index aa1b60c782e7..4a75f2d9bf0e 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -281,6 +281,11 @@ static unsigned long __init kaslr_legal_offset(void *dt_ptr, unsigned long index
 	return koffset;
 }
 
+static inline __init bool kaslr_disabled(void)
+{
+	return strstr(boot_command_line, "nokaslr") != NULL;
+}
+
 static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size,
 						  unsigned long kernel_sz)
 {
@@ -290,6 +295,8 @@ static unsigned long __init kaslr_choose_location(void *dt_ptr, phys_addr_t size
 	unsigned long index;
 
 	kaslr_get_cmdline(dt_ptr);
+	if (kaslr_disabled())
+		return 0;
 
 	random = get_boot_seed(dt_ptr);
 
-- 
2.17.2

