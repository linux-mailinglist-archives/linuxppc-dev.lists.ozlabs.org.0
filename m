Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF85022E4A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 06:10:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFRD52lywzF14k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 14:10:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFR1Y1lw3zF0dl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 14:01:05 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R3X2wq048727; Mon, 27 Jul 2020 00:00:54 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ggcsq8hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 00:00:54 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06R3XTOb049519;
 Mon, 27 Jul 2020 00:00:53 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ggcsq8ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 00:00:53 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06R40gO4020361;
 Mon, 27 Jul 2020 04:00:50 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 32gcr0h2rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 04:00:49 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06R40lKC58589326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 04:00:47 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2036E52050;
 Mon, 27 Jul 2020 04:00:47 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DA3755204F;
 Mon, 27 Jul 2020 04:00:45 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 3/6] selftests/powerpc: Harden test for execute-disabled
 pkeys
Date: Mon, 27 Jul 2020 09:30:37 +0530
Message-Id: <db467500f8af47727bba6b35796e8974a78b71e5.1595821792.git.sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1595821792.git.sandipan@linux.ibm.com>
References: <cover.1595821792.git.sandipan@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_02:2020-07-24,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 suspectscore=3 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270023
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
Cc: fweimer@redhat.com, aneesh.kumar@linux.ibm.com, linuxram@us.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 192b6a7805989 ("powerpc/book3s64/pkeys: Fix
pkey_access_permitted() for execute disable pkey") fixed a
bug that caused repetitive faults for pkeys with no execute
rights alongside some combination of read and write rights.

This removes the last two cases of the test, which check
the behaviour of pkeys with read, write but no execute
rights and all the rights, in favour of checking all the
possible combinations of read, write and execute rights
to be able to detect bugs like the one mentioned above.

Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 .../selftests/powerpc/mm/pkey_exec_prot.c     | 84 +++++++++----------
 1 file changed, 41 insertions(+), 43 deletions(-)

diff --git a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
index 18ebfe6bae1c9..9e5c7f3f498a7 100644
--- a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
+++ b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
@@ -237,55 +237,53 @@ static int test(void)
 	*fault_addr = PPC_INST_NOP;
 	FAIL_IF(remaining_faults != 0 || fault_code != SEGV_ACCERR);
 
-	/*
-	 * Jump to the executable region when AMR bits are set i.e.
-	 * the pkey permits neither read nor write access.
-	 *
-	 * This should generate a pkey fault based on IAMR bits which
-	 * are set to not permit execution. AMR bits should not affect
-	 * execution.
-	 *
-	 * This also checks if the overwrite of the first instruction
-	 * word from a trap to a no-op succeeded.
-	 */
-	fault_addr = insns;
-	fault_type = PKEY_DISABLE_EXECUTE;
-	fault_pkey = pkey;
-	remaining_faults = 1;
-	FAIL_IF(sys_pkey_mprotect(insns, pgsize, PROT_EXEC, pkey) != 0);
-	pkey_set_rights(pkey, PKEY_DISABLE_ACCESS);
-	printf("execute at %p, pkey permissions are %s\n", fault_addr,
-	       pkey_rights(rights));
-	asm volatile("mtctr	%0; bctrl" : : "r"(insns));
-	FAIL_IF(remaining_faults != 0 || fault_code != SEGV_PKUERR);
-
-	/*
-	 * Free the current pkey and allocate a new one that is
-	 * fully permissive.
-	 */
+	/* Free the current pkey */
 	sys_pkey_free(pkey);
+
 	rights = 0;
-	pkey = sys_pkey_alloc(0, rights);
+	do {
+		/*
+		 * Allocate pkeys with all valid combinations of read,
+		 * write and execute restrictions.
+		 */
+		pkey = sys_pkey_alloc(0, rights);
+		FAIL_IF(pkey < 0);
+
+		/*
+		 * Jump to the executable region. AMR bits may or may not
+		 * be set but they should not affect execution.
+		 *
+		 * This should generate pkey faults based on IAMR bits which
+		 * may be set to restrict execution.
+		 *
+		 * The first iteration also checks if the overwrite of the
+		 * first instruction word from a trap to a no-op succeeded.
+		 */
+		fault_pkey = pkey;
+		fault_type = -1;
+		remaining_faults = 0;
+		if (rights & PKEY_DISABLE_EXECUTE) {
+			fault_type = PKEY_DISABLE_EXECUTE;
+			remaining_faults = 1;
+		}
 
-	/*
-	 * Jump to the executable region when AMR bits are not set
-	 * i.e. the pkey permits read and write access.
-	 *
-	 * This should not generate any faults as the IAMR bits are
-	 * also not set and hence will the pkey will not restrict
-	 * execution.
-	 */
-	fault_pkey = pkey;
-	remaining_faults = 0;
-	FAIL_IF(sys_pkey_mprotect(insns, pgsize, PROT_EXEC, pkey) != 0);
-	printf("execute at %p, pkey permissions are %s\n", fault_addr,
-	       pkey_rights(rights));
-	asm volatile("mtctr	%0; bctrl" : : "r"(insns));
-	FAIL_IF(remaining_faults != 0);
+		FAIL_IF(sys_pkey_mprotect(insns, pgsize, PROT_EXEC, pkey) != 0);
+		printf("execute at %p, pkey permissions are %s\n", fault_addr,
+		       pkey_rights(rights));
+		asm volatile("mtctr	%0; bctrl" : : "r"(insns));
+		FAIL_IF(remaining_faults != 0);
+		if (rights & PKEY_DISABLE_EXECUTE)
+			FAIL_IF(fault_code != SEGV_PKUERR);
+
+		/* Free the current pkey */
+		sys_pkey_free(pkey);
+
+		/* Find next valid combination of pkey rights */
+		rights = next_pkey_rights(rights);
+	} while (rights);
 
 	/* Cleanup */
 	munmap((void *) insns, pgsize);
-	sys_pkey_free(pkey);
 
 	return 0;
 }
-- 
2.25.1

