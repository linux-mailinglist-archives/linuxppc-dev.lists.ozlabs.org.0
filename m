Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8797199359
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 12:25:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s57v2QhlzDqpd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 21:25:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s4YJ00G6zDqRk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 20:59:15 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02V9YLgL093426
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 05:59:14 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 303vfh2x9w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 05:59:14 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sandipan@linux.ibm.com>;
 Tue, 31 Mar 2020 10:59:02 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 31 Mar 2020 10:58:57 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02V9x5TN44498978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Mar 2020 09:59:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 675E54C050;
 Tue, 31 Mar 2020 09:59:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A281B4C044;
 Tue, 31 Mar 2020 09:59:02 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 31 Mar 2020 09:59:02 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: akpm@linux-foundation.org
Subject: [PATCH v19 12/24] selftests/vm/pkeys: Introduce generic pkey
 abstractions
Date: Tue, 31 Mar 2020 15:28:13 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1585646528.git.sandipan@linux.ibm.com>
References: <cover.1585646528.git.sandipan@linux.ibm.com>
In-Reply-To: <cover.1585646528.git.sandipan@linux.ibm.com>
References: <cover.1585646528.git.sandipan@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20033109-0008-0000-0000-00000367B4E2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033109-0009-0000-0000-00004A8938F9
Message-Id: <1c977915e69fb7767fb0dbd55ac7656554b15b93.1585646528.git.sandipan@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_03:2020-03-30,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=573 mlxscore=0 suspectscore=1 clxscore=1015 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310081
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
Cc: linux-arch@vger.kernel.org, fweimer@redhat.com, shuah@kernel.org,
 Dave Hansen <dave.hansen@intel.com>, aneesh.kumar@linux.ibm.com,
 x86@kernel.org, linuxram@us.ibm.com, mhocko@kernel.org, linux-mm@kvack.org,
 mingo@redhat.com, linux-kselftest@vger.kernel.org, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ram Pai <linuxram@us.ibm.com>

This introduces some generic abstractions and provides
the corresponding architecture-specfic implementations
for these abstractions.

cc: Dave Hansen <dave.hansen@intel.com>
cc: Florian Weimer <fweimer@redhat.com>
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
Acked-by: Dave Hansen <dave.hansen@intel.com>
---
 tools/testing/selftests/vm/pkey-helpers.h    | 12 ++++++++++++
 tools/testing/selftests/vm/pkey-x86.h        | 15 +++++++++++++++
 tools/testing/selftests/vm/protection_keys.c |  8 ++------
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/vm/pkey-helpers.h b/tools/testing/selftests/vm/pkey-helpers.h
index 0e3da7c8d6282..621fb2a0a5efe 100644
--- a/tools/testing/selftests/vm/pkey-helpers.h
+++ b/tools/testing/selftests/vm/pkey-helpers.h
@@ -74,6 +74,9 @@ extern void abort_hooks(void);
 	}					\
 } while (0)
 
+__attribute__((noinline)) int read_ptr(int *ptr);
+void expected_pkey_fault(int pkey);
+
 #if defined(__i386__) || defined(__x86_64__) /* arch */
 #include "pkey-x86.h"
 #else /* arch */
@@ -172,4 +175,13 @@ static inline void __pkey_write_allow(int pkey, int do_allow_write)
 #define __stringify_1(x...)     #x
 #define __stringify(x...)       __stringify_1(x)
 
+static inline u32 *siginfo_get_pkey_ptr(siginfo_t *si)
+{
+#ifdef si_pkey
+	return &si->si_pkey;
+#else
+	return (u32 *)(((u8 *)si) + si_pkey_offset);
+#endif
+}
+
 #endif /* _PKEYS_HELPER_H */
diff --git a/tools/testing/selftests/vm/pkey-x86.h b/tools/testing/selftests/vm/pkey-x86.h
index def2a1bcf6a5d..a0c59d4f7af2e 100644
--- a/tools/testing/selftests/vm/pkey-x86.h
+++ b/tools/testing/selftests/vm/pkey-x86.h
@@ -42,6 +42,7 @@
 #endif
 
 #define NR_PKEYS		16
+#define NR_RESERVED_PKEYS	2 /* pkey-0 and exec-only-pkey */
 #define PKEY_BITS_PER_PKEY	2
 #define HPAGE_SIZE		(1UL<<21)
 #define PAGE_SIZE		4096
@@ -158,4 +159,18 @@ int pkey_reg_xstate_offset(void)
 	return xstate_offset;
 }
 
+static inline int get_arch_reserved_keys(void)
+{
+	return NR_RESERVED_PKEYS;
+}
+
+void expect_fault_on_read_execonly_key(void *p1, int pkey)
+{
+	int ptr_contents;
+
+	ptr_contents = read_ptr(p1);
+	dprintf2("ptr (%p) contents@%d: %x\n", p1, __LINE__, ptr_contents);
+	expected_pkey_fault(pkey);
+}
+
 #endif /* _PKEYS_X86_H */
diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index 535e464e27e9d..57c71056c93d8 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -1307,9 +1307,7 @@ void test_executing_on_unreadable_memory(int *ptr, u16 pkey)
 	madvise(p1, PAGE_SIZE, MADV_DONTNEED);
 	lots_o_noops_around_write(&scratch);
 	do_not_expect_pkey_fault("executing on PROT_EXEC memory");
-	ptr_contents = read_ptr(p1);
-	dprintf2("ptr (%p) contents@%d: %x\n", p1, __LINE__, ptr_contents);
-	expected_pkey_fault(pkey);
+	expect_fault_on_read_execonly_key(p1, pkey);
 }
 
 void test_implicit_mprotect_exec_only_memory(int *ptr, u16 pkey)
@@ -1336,9 +1334,7 @@ void test_implicit_mprotect_exec_only_memory(int *ptr, u16 pkey)
 	madvise(p1, PAGE_SIZE, MADV_DONTNEED);
 	lots_o_noops_around_write(&scratch);
 	do_not_expect_pkey_fault("executing on PROT_EXEC memory");
-	ptr_contents = read_ptr(p1);
-	dprintf2("ptr (%p) contents@%d: %x\n", p1, __LINE__, ptr_contents);
-	expected_pkey_fault(UNKNOWN_PKEY);
+	expect_fault_on_read_execonly_key(p1, UNKNOWN_PKEY);
 
 	/*
 	 * Put the memory back to non-PROT_EXEC.  Should clear the
-- 
2.17.1

