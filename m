Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 498E4602DE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 11:07:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45g89g4cLCzDqdl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 19:07:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=zte.com.cn
 (client-ip=63.217.80.70; helo=mxhk.zte.com.cn;
 envelope-from=wen.yang99@zte.com.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zte.com.cn
X-Greylist: delayed 210 seconds by postgrey-1.36 at bilbo;
 Fri, 05 Jul 2019 19:05:27 AEST
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45g87q5GcdzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 19:05:27 +1000 (AEST)
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id 3FFADCDBDF9F340022F3;
 Fri,  5 Jul 2019 17:05:26 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse-fl2.zte.com.cn with ESMTP id x6592mIH083976;
 Fri, 5 Jul 2019 17:02:48 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019070517032560-2109418 ;
 Fri, 5 Jul 2019 17:03:25 +0800 
From: Wen Yang <wen.yang99@zte.com.cn>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/prom: fix use-after-free on cpu_to_chip_id()
Date: Fri, 5 Jul 2019 17:01:00 +0800
Message-Id: <1562317260-13492-1-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-07-05 17:03:25,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-07-05 17:02:54, Serialize complete at 2019-07-05 17:02:54
X-MAIL: mse-fl2.zte.com.cn x6592mIH083976
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
Cc: wang.yi59@zte.com.cn, Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>,
 xue.zhihong@zte.com.cn, cheng.shengyu@zte.com.cn,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Wen Yang <wen.yang99@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The np variable is still being used after the of_node_put() call,
which may result in use-after-free.
We fix this issue by calling of_node_put() after the last usage.

Fixes: 3eb906c6b6c1 ("powerpc: Make cpu_to_chip_id() available when SMP=n")
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
---
 arch/powerpc/kernel/prom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 7159e79..ad87b94 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -872,13 +872,15 @@ EXPORT_SYMBOL(of_get_ibm_chip_id);
 int cpu_to_chip_id(int cpu)
 {
 	struct device_node *np;
+	int id;
 
 	np = of_get_cpu_node(cpu, NULL);
 	if (!np)
 		return -1;
 
+	id = of_get_ibm_chip_id(np);
 	of_node_put(np);
-	return of_get_ibm_chip_id(np);
+	return id;
 }
 EXPORT_SYMBOL(cpu_to_chip_id);
 
-- 
2.9.5

