Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC15231101
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 19:39:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGP733Zf8zDqyH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 03:39:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGP5T04RQzDqyB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 03:37:48 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SHWopN079375
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 13:37:45 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jkw2a6w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 13:37:45 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06SHZnJA024106
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 17:37:44 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 32gcprb9v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 17:37:44 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06SHbga745875658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jul 2020 17:37:42 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB7076A04F;
 Tue, 28 Jul 2020 17:37:42 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84C946A051;
 Tue, 28 Jul 2020 17:37:42 +0000 (GMT)
Received: from localhost (unknown [9.65.227.150])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 28 Jul 2020 17:37:42 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: explicitly reschedule during drmem_lmb list
 traversal
Date: Tue, 28 Jul 2020 12:37:41 -0500
Message-Id: <20200728173741.717372-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_15:2020-07-28,
 2020-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=1 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007280128
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
Cc: tyreld@linux.ibm.com, cheloha@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The drmem lmb list can have hundreds of thousands of entries, and
unfortunately lookups take the form of linear searches. As long as
this is the case, traversals have the potential to monopolize the CPU
and provoke lockup reports, workqueue stalls, and the like unless
they explicitly yield.

Rather than placing cond_resched() calls within various
for_each_drmem_lmb() loop blocks in the code, put it in the iteration
expression of the loop macro itself so users can't omit it.

Fixes: 6c6ea53725b3 ("powerpc/mm: Separate ibm, dynamic-memory data from DT format")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/drmem.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index 414d209f45bb..36d0ed04bda8 100644
--- a/arch/powerpc/include/asm/drmem.h
+++ b/arch/powerpc/include/asm/drmem.h
@@ -8,6 +8,8 @@
 #ifndef _ASM_POWERPC_LMB_H
 #define _ASM_POWERPC_LMB_H
 
+#include <linux/sched.h>
+
 struct drmem_lmb {
 	u64     base_addr;
 	u32     drc_index;
@@ -26,8 +28,14 @@ struct drmem_lmb_info {
 
 extern struct drmem_lmb_info *drmem_info;
 
+static inline struct drmem_lmb *drmem_lmb_next(struct drmem_lmb *lmb)
+{
+	cond_resched();
+	return ++lmb;
+}
+
 #define for_each_drmem_lmb_in_range(lmb, start, end)		\
-	for ((lmb) = (start); (lmb) < (end); (lmb)++)
+	for ((lmb) = (start); (lmb) < (end); lmb = drmem_lmb_next(lmb))
 
 #define for_each_drmem_lmb(lmb)					\
 	for_each_drmem_lmb_in_range((lmb),			\
-- 
2.25.4

