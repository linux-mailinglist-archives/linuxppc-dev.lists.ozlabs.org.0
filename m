Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 420802202BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 05:08:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B62Qn5VNhzDqdb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 13:08:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 948 seconds by postgrey-1.36 at bilbo;
 Wed, 15 Jul 2020 13:07:02 AEST
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B62Nk3ybKzDqWM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 13:06:58 +1000 (AEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 38E3358C57A4BE1C1A3A;
 Wed, 15 Jul 2020 10:51:03 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Wed, 15 Jul 2020
 10:50:53 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <groug@kaod.org>
Subject: [PATCH -next] powerpc/xive: Remove unused inline function
 xive_kexec_teardown_cpu()
Date: Wed, 15 Jul 2020 10:50:40 +0800
Message-ID: <20200715025040.33952-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.108]
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
Cc: YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit e27e0a94651e ("powerpc/xive: Remove xive_kexec_teardown_cpu()")
left behind this, remove it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/powerpc/include/asm/xive.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/xive.h
index d08ea11b271c..309b4d65b74f 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -155,7 +155,6 @@ static inline void xive_smp_probe(void) { }
 static inline int  xive_smp_prepare_cpu(unsigned int cpu) { return -EINVAL; }
 static inline void xive_smp_setup_cpu(void) { }
 static inline void xive_smp_disable_cpu(void) { }
-static inline void xive_kexec_teardown_cpu(int secondary) { }
 static inline void xive_shutdown(void) { }
 static inline void xive_flush_interrupt(void) { }
 
-- 
2.17.1


