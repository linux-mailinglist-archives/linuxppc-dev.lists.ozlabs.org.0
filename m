Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ABF55876A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 20:26:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTTGJ6sxtz3c7w
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 04:26:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ANEo2icz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ANEo2icz;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTTFb2QGKz3bqg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 04:25:22 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NIJIiG032305;
	Thu, 23 Jun 2022 18:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=hfOnm1uvb6XXbMrE6gvIfPjbfAhlXLokGul8kEIVGpU=;
 b=ANEo2iczshMwsKyxEUN0PLT52myBH0nVJ39iG9Hf+ZFxHlgoi6Mie7rGz1N7sZHKT7Sa
 b+3MqnpZt+mRQnPfLxbrtJE0ZO65kaIzKlnDNQ1HGlbsz+fnhsFKywmLeLNh60TS1Rs6
 P04ImVhtNpzywua5Y5sei5DoAek9LNxlOlD+ol3QokuefbkOzNrqptw5evHbS/Pvfiba
 1a2WkuyrMqa2Nvt++iBRa0C+XGLmdnabsRKVxDFjNqMreH8O9HDOPiDbrhJNM6/L2/CY
 vaj9tu9T5+JXisv+JYS7k1kWAGTl5xpuHHQ5ukfxc+lIfpu7A+Il/uGtBPim5y2jXTzU AA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvtuwwqd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 18:25:12 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25NILgSi004529;
	Thu, 23 Jun 2022 18:25:11 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma03dal.us.ibm.com with ESMTP id 3gs6ba99qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 18:25:11 +0000
Received: from b03ledav001.gho.boulder.ibm.com (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25NIPAtJ21561774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jun 2022 18:25:10 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3713C6E04E;
	Thu, 23 Jun 2022 18:25:10 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 164446E050;
	Thu, 23 Jun 2022 18:25:10 +0000 (GMT)
Received: from localhost (unknown [9.211.80.5])
	by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jun 2022 18:25:10 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/xive/spapr: correct bitmap allocation size
Date: Thu, 23 Jun 2022 13:25:09 -0500
Message-Id: <20220623182509.3985625-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Z9b2V4cNelPNn-PZozOn3NgNQB5qm3mw
X-Proofpoint-GUID: Z9b2V4cNelPNn-PZozOn3NgNQB5qm3mw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_07,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=929
 clxscore=1011 spamscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206230070
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
Cc: paulus@samba.org, clg@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kasan detects access beyond the end of the xibm->bitmap allocation:

BUG: KASAN: slab-out-of-bounds in _find_first_zero_bit+0x40/0x140
Read of size 8 at addr c00000001d1d0118 by task swapper/0/1

CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.19.0-rc2-00001-g90df023b36dd #28
Call Trace:
[c00000001d98f770] [c0000000012baab8] dump_stack_lvl+0xac/0x108 (unreliable)
[c00000001d98f7b0] [c00000000068faac] print_report+0x37c/0x710
[c00000001d98f880] [c0000000006902c0] kasan_report+0x110/0x354
[c00000001d98f950] [c000000000692324] __asan_load8+0xa4/0xe0
[c00000001d98f970] [c0000000011c6ed0] _find_first_zero_bit+0x40/0x140
[c00000001d98f9b0] [c0000000000dbfbc] xive_spapr_get_ipi+0xcc/0x260
[c00000001d98fa70] [c0000000000d6d28] xive_setup_cpu_ipi+0x1e8/0x450
[c00000001d98fb30] [c000000004032a20] pSeries_smp_probe+0x5c/0x118
[c00000001d98fb60] [c000000004018b44] smp_prepare_cpus+0x944/0x9ac
[c00000001d98fc90] [c000000004009f9c] kernel_init_freeable+0x2d4/0x640
[c00000001d98fd90] [c0000000000131e8] kernel_init+0x28/0x1d0
[c00000001d98fe10] [c00000000000cd54] ret_from_kernel_thread+0x5c/0x64

Allocated by task 0:
 kasan_save_stack+0x34/0x70
 __kasan_kmalloc+0xb4/0xf0
 __kmalloc+0x268/0x540
 xive_spapr_init+0x4d0/0x77c
 pseries_init_irq+0x40/0x27c
 init_IRQ+0x44/0x84
 start_kernel+0x2a4/0x538
 start_here_common+0x1c/0x20

The buggy address belongs to the object at c00000001d1d0118
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 0 bytes inside of
 8-byte region [c00000001d1d0118, c00000001d1d0120)

The buggy address belongs to the physical page:
page:c00c000000074740 refcount:1 mapcount:0 mapping:0000000000000000 index:0xc00000001d1d0558 pfn:0x1d1d
flags: 0x7ffff000000200(slab|node=0|zone=0|lastcpupid=0x7ffff)
raw: 007ffff000000200 c00000001d0003c8 c00000001d0003c8 c00000001d010480
raw: c00000001d1d0558 0000000001e1000a 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 c00000001d1d0000: fc 00 fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 c00000001d1d0080: fc fc 00 fc fc fc fc fc fc fc fc fc fc fc fc fc
>c00000001d1d0100: fc fc fc 02 fc fc fc fc fc fc fc fc fc fc fc fc
                            ^
 c00000001d1d0180: fc fc fc fc 04 fc fc fc fc fc fc fc fc fc fc fc
 c00000001d1d0200: fc fc fc fc fc 04 fc fc fc fc fc fc fc fc fc fc

This happens because the allocation uses the wrong unit (bits) when it
should pass (BITS_TO_LONGS(count) * sizeof(long)) or equivalent. With small
numbers of bits, the allocated object can be smaller than sizeof(long),
which results in invalid accesses.

Use bitmap_zalloc() to allocate and initialize the irq bitmap, paired with
bitmap_free() for consistency.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/sysdev/xive/spapr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index 7d5128676e83..d02911e78cfc 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -15,6 +15,7 @@
 #include <linux/of_fdt.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/bitmap.h>
 #include <linux/cpumask.h>
 #include <linux/mm.h>
 #include <linux/delay.h>
@@ -57,7 +58,7 @@ static int __init xive_irq_bitmap_add(int base, int count)
 	spin_lock_init(&xibm->lock);
 	xibm->base = base;
 	xibm->count = count;
-	xibm->bitmap = kzalloc(xibm->count, GFP_KERNEL);
+	xibm->bitmap = bitmap_zalloc(xibm->count, GFP_KERNEL);
 	if (!xibm->bitmap) {
 		kfree(xibm);
 		return -ENOMEM;
@@ -75,7 +76,7 @@ static void xive_irq_bitmap_remove_all(void)
 
 	list_for_each_entry_safe(xibm, tmp, &xive_irq_bitmaps, list) {
 		list_del(&xibm->list);
-		kfree(xibm->bitmap);
+		bitmap_free(xibm->bitmap);
 		kfree(xibm);
 	}
 }
-- 
2.35.1

