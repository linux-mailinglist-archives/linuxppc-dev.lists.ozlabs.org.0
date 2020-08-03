Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3861223A342
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 13:25:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKwY51FB9zDqWm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 21:25:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKwWS3hXGzDqT8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 21:24:04 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 073BGULL004225; Mon, 3 Aug 2020 07:23:58 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ph8agqqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 07:23:57 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 073BJYqk026848;
 Mon, 3 Aug 2020 11:23:55 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 32n017s93e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 11:23:55 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 073BNrsS30802228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Aug 2020 11:23:53 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 186A911C052;
 Mon,  3 Aug 2020 11:23:53 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A1AE11C05E;
 Mon,  3 Aug 2020 11:23:52 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 Aug 2020 11:23:51 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3] selftests/powerpc: Fix pkey syscall redefinitions
Date: Mon,  3 Aug 2020 16:53:51 +0530
Message-Id: <1bb744b0c7ed3985a5b73289f4de629ac0aeaf7c.1596453627.git.sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-03_08:2020-08-03,
 2020-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008030082
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
Cc: sachinp@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On some distros, there are conflicts w.r.t to redefinition
of pkey syscall numbers which cause build failures. This
fixes them.

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
Previous versions can be found at:
v2: https://lore.kernel.org/linuxppc-dev/566dde119ce71f00f9642807ba30ceb7f54c9bfa.1596441105.git.sandipan@linux.ibm.com/
v1: https://lore.kernel.org/linuxppc-dev/20200803074043.466809-1-sandipan@linux.ibm.com/

Changes in v3:
- Use ifndef...endif instead of undef as suggested by
  Michael.

Changes in v2:
- Fix incorrect commit message.

---
 tools/testing/selftests/powerpc/include/pkeys.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
index 6ba95039a034..54bf9aa9e1e1 100644
--- a/tools/testing/selftests/powerpc/include/pkeys.h
+++ b/tools/testing/selftests/powerpc/include/pkeys.h
@@ -31,9 +31,17 @@
 
 #define SI_PKEY_OFFSET	0x20
 
+#ifndef SYS_pkey_mprotect
 #define SYS_pkey_mprotect	386
+#endif
+
+#ifndef SYS_pkey_alloc
 #define SYS_pkey_alloc		384
+#endif
+
+#ifndef SYS_pkey_free
 #define SYS_pkey_free		385
+#endif
 
 #define PKEY_BITS_PER_PKEY	2
 #define NR_PKEYS		32
-- 
2.25.1

