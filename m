Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B864B222123
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 13:09:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6s306nxzzDr1j
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 21:09:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6rwg4qy0zDqwy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 21:04:03 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06GB34Tp180117; Thu, 16 Jul 2020 07:03:58 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32adafx1uu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 07:03:58 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06GB35dE180272;
 Thu, 16 Jul 2020 07:03:57 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32adafx1tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 07:03:57 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06GB2sk7018903;
 Thu, 16 Jul 2020 11:03:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 327q2y2ekm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 11:03:55 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06GB3qSe60293286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 11:03:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 649EA42047;
 Thu, 16 Jul 2020 11:03:52 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A0824203F;
 Thu, 16 Jul 2020 11:03:51 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jul 2020 11:03:50 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/5] selftests/powerpc: Add pkey helpers for rights
Date: Thu, 16 Jul 2020 16:33:44 +0530
Message-Id: <6cc1c7d1f686618668a3e090f1d0c2a4cd9dea3f.1594897099.git.sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1594897099.git.sandipan@linux.ibm.com>
References: <cover.1594897099.git.sandipan@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_05:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=3 phishscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007160088
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

This adds some new pkey-related helper to print
access rights of a pkey in the "rwx" format and
to generate different valid combinations of pkey
rights starting from a given combination.

Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 .../testing/selftests/powerpc/include/pkeys.h | 28 +++++++++++++++
 .../selftests/powerpc/mm/pkey_exec_prot.c     | 36 ++++++++++---------
 2 files changed, 48 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
index 9b53a97e664ea..6ba95039a0343 100644
--- a/tools/testing/selftests/powerpc/include/pkeys.h
+++ b/tools/testing/selftests/powerpc/include/pkeys.h
@@ -105,4 +105,32 @@ int siginfo_pkey(siginfo_t *si)
 #endif
 }
 
+#define pkey_rights(r) ({						\
+	static char buf[4] = "rwx";					\
+	unsigned int amr_bits;						\
+	if ((r) & PKEY_DISABLE_EXECUTE)					\
+		buf[2] = '-';						\
+	amr_bits = (r) & PKEY_BITS_MASK;				\
+	if (amr_bits & PKEY_DISABLE_WRITE)				\
+		buf[1] = '-';						\
+	if (amr_bits & PKEY_DISABLE_ACCESS & ~PKEY_DISABLE_WRITE)	\
+		buf[0] = '-';						\
+	buf;								\
+})
+
+unsigned long next_pkey_rights(unsigned long rights)
+{
+	if (rights == PKEY_DISABLE_ACCESS)
+		return PKEY_DISABLE_EXECUTE;
+	else if (rights == (PKEY_DISABLE_ACCESS | PKEY_DISABLE_EXECUTE))
+		return 0;
+
+	if ((rights & PKEY_BITS_MASK) == 0)
+		rights |= PKEY_DISABLE_WRITE;
+	else if ((rights & PKEY_BITS_MASK) == PKEY_DISABLE_WRITE)
+		rights |= PKEY_DISABLE_ACCESS;
+
+	return rights;
+}
+
 #endif /* _SELFTESTS_POWERPC_PKEYS_H */
diff --git a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
index 1253ad6afba24..18ebfe6bae1c9 100644
--- a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
+++ b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
@@ -102,6 +102,7 @@ static void segv_handler(int signum, siginfo_t *sinfo, void *ctx)
 static int test(void)
 {
 	struct sigaction segv_act, trap_act;
+	unsigned long rights;
 	int pkey, ret, i;
 
 	ret = pkeys_unsupported();
@@ -150,7 +151,8 @@ static int test(void)
 	insns[numinsns - 1] = PPC_INST_BLR;
 
 	/* Allocate a pkey that restricts execution */
-	pkey = sys_pkey_alloc(0, PKEY_DISABLE_EXECUTE);
+	rights = PKEY_DISABLE_EXECUTE;
+	pkey = sys_pkey_alloc(0, rights);
 	FAIL_IF(pkey < 0);
 
 	/*
@@ -175,8 +177,8 @@ static int test(void)
 	 */
 	remaining_faults = 0;
 	FAIL_IF(sys_pkey_mprotect(insns, pgsize, PROT_EXEC, pkey) != 0);
-	printf("read from %p, pkey is execute-disabled, access-enabled\n",
-	       (void *) fault_addr);
+	printf("read from %p, pkey permissions are %s\n", fault_addr,
+	       pkey_rights(rights));
 	i = *fault_addr;
 	FAIL_IF(remaining_faults != 0);
 
@@ -192,12 +194,13 @@ static int test(void)
 	 */
 	remaining_faults = 1;
 	FAIL_IF(sys_pkey_mprotect(insns, pgsize, PROT_EXEC, pkey) != 0);
-	printf("write to %p, pkey is execute-disabled, access-enabled\n",
-	       (void *) fault_addr);
+	printf("write to %p, pkey permissions are %s\n", fault_addr,
+	       pkey_rights(rights));
 	*fault_addr = PPC_INST_TRAP;
 	FAIL_IF(remaining_faults != 0 || fault_code != SEGV_ACCERR);
 
 	/* The following three cases will generate SEGV_PKUERR */
+	rights |= PKEY_DISABLE_ACCESS;
 	fault_type = PKEY_DISABLE_ACCESS;
 	fault_pkey = pkey;
 
@@ -211,9 +214,9 @@ static int test(void)
 	 */
 	remaining_faults = 1;
 	FAIL_IF(sys_pkey_mprotect(insns, pgsize, PROT_EXEC, pkey) != 0);
-	printf("read from %p, pkey is execute-disabled, access-disabled\n",
-	       (void *) fault_addr);
-	pkey_set_rights(pkey, PKEY_DISABLE_ACCESS);
+	pkey_set_rights(pkey, rights);
+	printf("read from %p, pkey permissions are %s\n", fault_addr,
+	       pkey_rights(rights));
 	i = *fault_addr;
 	FAIL_IF(remaining_faults != 0 || fault_code != SEGV_PKUERR);
 
@@ -228,9 +231,9 @@ static int test(void)
 	 */
 	remaining_faults = 2;
 	FAIL_IF(sys_pkey_mprotect(insns, pgsize, PROT_EXEC, pkey) != 0);
-	printf("write to %p, pkey is execute-disabled, access-disabled\n",
-	       (void *) fault_addr);
-	pkey_set_rights(pkey, PKEY_DISABLE_ACCESS);
+	pkey_set_rights(pkey, rights);
+	printf("write to %p, pkey permissions are %s\n", fault_addr,
+	       pkey_rights(rights));
 	*fault_addr = PPC_INST_NOP;
 	FAIL_IF(remaining_faults != 0 || fault_code != SEGV_ACCERR);
 
@@ -251,8 +254,8 @@ static int test(void)
 	remaining_faults = 1;
 	FAIL_IF(sys_pkey_mprotect(insns, pgsize, PROT_EXEC, pkey) != 0);
 	pkey_set_rights(pkey, PKEY_DISABLE_ACCESS);
-	printf("execute at %p, pkey is execute-disabled, access-disabled\n",
-	       (void *) fault_addr);
+	printf("execute at %p, pkey permissions are %s\n", fault_addr,
+	       pkey_rights(rights));
 	asm volatile("mtctr	%0; bctrl" : : "r"(insns));
 	FAIL_IF(remaining_faults != 0 || fault_code != SEGV_PKUERR);
 
@@ -261,7 +264,8 @@ static int test(void)
 	 * fully permissive.
 	 */
 	sys_pkey_free(pkey);
-	pkey = sys_pkey_alloc(0, 0);
+	rights = 0;
+	pkey = sys_pkey_alloc(0, rights);
 
 	/*
 	 * Jump to the executable region when AMR bits are not set
@@ -274,8 +278,8 @@ static int test(void)
 	fault_pkey = pkey;
 	remaining_faults = 0;
 	FAIL_IF(sys_pkey_mprotect(insns, pgsize, PROT_EXEC, pkey) != 0);
-	printf("execute at %p, pkey is execute-enabled, access-enabled\n",
-	       (void *) fault_addr);
+	printf("execute at %p, pkey permissions are %s\n", fault_addr,
+	       pkey_rights(rights));
 	asm volatile("mtctr	%0; bctrl" : : "r"(insns));
 	FAIL_IF(remaining_faults != 0);
 
-- 
2.25.1

