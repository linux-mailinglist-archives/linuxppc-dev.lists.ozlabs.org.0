Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A08A112289
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 06:31:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SSBP0gVQzDq61
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 16:31:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SS8N213XzDq61
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 16:29:23 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB45RI2T010781; Wed, 4 Dec 2019 00:29:16 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wnp66eh2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 00:29:15 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB45Qc8x007999;
 Wed, 4 Dec 2019 05:29:15 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 2wkg26u3vw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2019 05:29:15 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB45TEBP50856424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Dec 2019 05:29:14 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4312E2805A;
 Wed,  4 Dec 2019 05:29:14 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F012428058;
 Wed,  4 Dec 2019 05:29:12 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.204.200.104])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  4 Dec 2019 05:29:12 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/pmem: Fix kernel crash due to wrong range value usage
 in flush_dcache_range
Date: Wed,  4 Dec 2019 10:59:09 +0530
Message-Id: <20191204052909.59145-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_01:2019-12-04,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912040040
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch fix the below kernel crash.

 BUG: Unable to handle kernel data access on read at 0xc000000380000000
 Faulting instruction address: 0xc00000000008b6f0
cpu 0x5: Vector: 300 (Data Access) at [c0000000d8587790]
    pc: c00000000008b6f0: arch_remove_memory+0x150/0x210
    lr: c00000000008b720: arch_remove_memory+0x180/0x210
    sp: c0000000d8587a20
   msr: 800000000280b033
   dar: c000000380000000
 dsisr: 40000000
  current = 0xc0000000d8558600
  paca    = 0xc00000000fff8f00   irqmask: 0x03   irq_happened: 0x01
    pid   = 1220, comm = ndctl
enter ? for help
 memunmap_pages+0x33c/0x410
 devm_action_release+0x30/0x50
 release_nodes+0x30c/0x3a0
 device_release_driver_internal+0x178/0x240
 unbind_store+0x74/0x190
 drv_attr_store+0x44/0x60
 sysfs_kf_write+0x74/0xa0
 kernfs_fop_write+0x1b0/0x260
 __vfs_write+0x3c/0x70
 vfs_write+0xe4/0x200
 ksys_write+0x7c/0x140
 system_call+0x5c/0x68

Fixes: 076265907cf9 ("powerpc: Chunk calls to flush_dcache_range in arch_*_memory")
Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index ad299e72ec30..9488b63dfc87 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -121,7 +121,7 @@ static void flush_dcache_range_chunked(unsigned long start, unsigned long stop,
 	unsigned long i;
 
 	for (i = start; i < stop; i += chunk) {
-		flush_dcache_range(i, min(stop, start + chunk));
+		flush_dcache_range(i, min(stop, i + chunk));
 		cond_resched();
 	}
 }
-- 
2.23.0

