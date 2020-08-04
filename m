Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C53023BEE2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 19:34:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLhhC3NhQzDqYS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 03:34:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLhdP0RdKzDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 03:31:52 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 074HEIf6074990; Tue, 4 Aug 2020 13:31:44 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qbkkrxn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 13:31:44 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 074HQEml028942;
 Tue, 4 Aug 2020 17:31:41 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 32n0183hk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 17:31:41 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 074HVdSC24248770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Aug 2020 17:31:39 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A5F2AE04D;
 Tue,  4 Aug 2020 17:31:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60321AE045;
 Tue,  4 Aug 2020 17:31:38 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  4 Aug 2020 17:31:38 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4] selftests/powerpc: Fix pkey syscall redefinitions
Date: Tue,  4 Aug 2020 23:01:37 +0530
Message-Id: <a4956d838bf59b0a71a2553c5ca81131ea8b49b9.1596561758.git.sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-04_04:2020-08-03,
 2020-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxlogscore=951 bulkscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008040124
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
 David Laight <david.laight@aculab.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On distros using older glibc versions, the pkey tests
encounter build failures due to redefinition of the
pkey syscall numbers.

For compatibility, commit 743f3544fffb added a wrapper
for the gettid() syscall and included syscall.h if the
version of glibc used is older than 2.30. This leads
to different definitions of SYS_pkey_* as the ones in
the pkey test header set numeric constants where as the
ones from syscall.h reuse __NR_pkey_*. The compiler
complains about redefinitions since they are different.

This replaces SYS_pkey_* definitions with __NR_pkey_*
such that the definitions in both syscall.h and pkeys.h
are alike. This way, if syscall.h has to be included
for compatibility reasons, builds will still succeed.

Fixes: 743f3544fffb ("selftests/powerpc: Add wrapper for gettid")
Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Suggested-by: David Laight <david.laight@aculab.com>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
Previous versions can be found at:
v3: https://lore.kernel.org/linuxppc-dev/1bb744b0c7ed3985a5b73289f4de629ac0aeaf7c.1596453627.git.sandipan@linux.ibm.com/
v2: https://lore.kernel.org/linuxppc-dev/566dde119ce71f00f9642807ba30ceb7f54c9bfa.1596441105.git.sandipan@linux.ibm.com/
v1: https://lore.kernel.org/linuxppc-dev/20200803074043.466809-1-sandipan@linux.ibm.com/

Changes in v4:
- Replace SYS_pkey_* with __NR_pkey_* based on suggestions
  from David and Michael.
- Update commit message and add fixes tag.

Changes in v3:
- Use ifndef...endif instead of undef as suggested by
  Michael.

Changes in v2:
- Fix incorrect commit message.

---
 tools/testing/selftests/powerpc/include/pkeys.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
index 6ba95039a034..3312cb1b058d 100644
--- a/tools/testing/selftests/powerpc/include/pkeys.h
+++ b/tools/testing/selftests/powerpc/include/pkeys.h
@@ -31,9 +31,9 @@
 
 #define SI_PKEY_OFFSET	0x20
 
-#define SYS_pkey_mprotect	386
-#define SYS_pkey_alloc		384
-#define SYS_pkey_free		385
+#define __NR_pkey_mprotect	386
+#define __NR_pkey_alloc		384
+#define __NR_pkey_free		385
 
 #define PKEY_BITS_PER_PKEY	2
 #define NR_PKEYS		32
@@ -62,17 +62,17 @@ void pkey_set_rights(int pkey, unsigned long rights)
 
 int sys_pkey_mprotect(void *addr, size_t len, int prot, int pkey)
 {
-	return syscall(SYS_pkey_mprotect, addr, len, prot, pkey);
+	return syscall(__NR_pkey_mprotect, addr, len, prot, pkey);
 }
 
 int sys_pkey_alloc(unsigned long flags, unsigned long rights)
 {
-	return syscall(SYS_pkey_alloc, flags, rights);
+	return syscall(__NR_pkey_alloc, flags, rights);
 }
 
 int sys_pkey_free(int pkey)
 {
-	return syscall(SYS_pkey_free, pkey);
+	return syscall(__NR_pkey_free, pkey);
 }
 
 int pkeys_unsupported(void)
-- 
2.25.1

