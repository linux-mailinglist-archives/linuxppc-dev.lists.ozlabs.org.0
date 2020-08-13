Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C751F243C4D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 17:14:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BS98N6sVMzDqQF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 01:14:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IrE48lrH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BS95f6yk4zDqYb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 01:11:50 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07DF2QZ2009564; Thu, 13 Aug 2020 11:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=AhVtdjQ9stInqvkkFn9iyrumkBxqqMm+JPkhLhO8ZyQ=;
 b=IrE48lrHknOtz/IzfHV2R+jCdVKTO1+ukmKLt/0d2nPu3FmfiKEkZ/PLB0ZRQZ6inj79
 nrGMpjpN3p0+9s+KM20odrP7+uA/T8mrWqYw2orcMuwrtPtPcEa1eUUzRpnqsbpmKgs9
 USa7ip17+LcYgZuEV5XicVQv8LHoSIeQ7QfqIk4GlIEggOdYUi4VLvretMbqUF7wOWro
 rseXb5/c5AX18tvQ6rj+KeQe8BRAiTTBqeNhBuxokEcw5KimzHaM71OhflwpegoiKmFN
 z0xBJVhyicgkND5CbiDRgCs+4M5qh2ptLOlnwc8Rd82FPoRq7IsPFfrfmeK4/+g4h5r9 2Q== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32w30q9qpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:11:35 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07DFB1SV028345;
 Thu, 13 Aug 2020 15:11:34 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 32skp9njw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 15:11:34 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07DFBWKj52756836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Aug 2020 15:11:32 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD3556E04E;
 Thu, 13 Aug 2020 15:11:32 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8785C6E04C;
 Thu, 13 Aug 2020 15:11:32 +0000 (GMT)
Received: from localhost (unknown [9.65.223.18])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 13 Aug 2020 15:11:32 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc/pseries: explicitly reschedule during drmem_lmb
 list traversal
Date: Thu, 13 Aug 2020 10:11:31 -0500
Message-Id: <20200813151131.2070161-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_13:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=1
 impostorscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130110
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
Cc: cheloha@linux.ibm.com, ldufour@linux.ibm.com, tyreld@linux.ibm.com
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

Introduce a drmem_lmb_next() iteration helper function which calls
cond_resched() at a regular interval during array traversal. Each
iteration of the loop in DLPAR code paths can involve around ten RTAS
calls which can each take up to 250us, so this ensures the check is
performed at worst every few milliseconds.

Fixes: 6c6ea53725b3 ("powerpc/mm: Separate ibm, dynamic-memory data from DT format")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---

Notes:
    Changes since v2:
    * Make drmem_lmb_next() more general.
    * Adjust reschedule interval for better code generation.
    * Add commentary to drmem_lmb_next() to explain the cond_resched()
      call.
    * Remove bounds assertions.
    
    Changes since v1:
    * Add bounds assertions in drmem_lmb_next().
    * Call cond_resched() in the iterator on only every 20th element
      instead of on every iteration, to reduce overhead in tight loops.

 arch/powerpc/include/asm/drmem.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index 17ccc6474ab6..6fb928605ed1 100644
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
@@ -26,8 +28,22 @@ struct drmem_lmb_info {
 
 extern struct drmem_lmb_info *drmem_info;
 
+static inline struct drmem_lmb *drmem_lmb_next(struct drmem_lmb *lmb,
+					       const struct drmem_lmb *start)
+{
+	/*
+	 * DLPAR code paths can take several milliseconds per element
+	 * when interacting with firmware. Ensure that we don't
+	 * unfairly monopolize the CPU.
+	 */
+	if (((++lmb - start) % 16) == 0)
+		cond_resched();
+
+	return lmb;
+}
+
 #define for_each_drmem_lmb_in_range(lmb, start, end)		\
-	for ((lmb) = (start); (lmb) < (end); (lmb)++)
+	for ((lmb) = (start); (lmb) < (end); lmb = drmem_lmb_next(lmb, start))
 
 #define for_each_drmem_lmb(lmb)					\
 	for_each_drmem_lmb_in_range((lmb),			\
-- 
2.25.4

