Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3F019936E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 12:32:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s5Hc3PzvzDr8r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 21:32:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s4Yb2vXLzDqMw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 20:59:31 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02V9YMA1043391
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 05:59:27 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 301yffj7km-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 05:59:27 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sandipan@linux.ibm.com>;
 Tue, 31 Mar 2020 10:59:16 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 31 Mar 2020 10:59:12 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02V9xHX246792812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Mar 2020 09:59:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B00C34C04A;
 Tue, 31 Mar 2020 09:59:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC7D24C046;
 Tue, 31 Mar 2020 09:59:14 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 31 Mar 2020 09:59:14 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: akpm@linux-foundation.org
Subject: [PATCH v19 16/24] selftests/vm/pkeys: Improve checks to determine
 pkey support
Date: Tue, 31 Mar 2020 15:28:17 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1585646528.git.sandipan@linux.ibm.com>
References: <cover.1585646528.git.sandipan@linux.ibm.com>
In-Reply-To: <cover.1585646528.git.sandipan@linux.ibm.com>
References: <cover.1585646528.git.sandipan@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20033109-0012-0000-0000-0000039B8657
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033109-0013-0000-0000-000021D891F1
Message-Id: <8fb76c63ebdadcf068ecd2d23731032e195cd364.1585646528.git.sandipan@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_03:2020-03-30,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=3 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 mlxlogscore=839 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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

For the pkeys subsystem to work, both the CPU and the
kernel need to have support. So, additionally check if
the kernel supports pkeys apart from the CPU feature
checks.

cc: Dave Hansen <dave.hansen@intel.com>
cc: Florian Weimer <fweimer@redhat.com>
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
Acked-by: Dave Hansen <dave.hansen@intel.com>
---
 tools/testing/selftests/vm/pkey-helpers.h    | 30 ++++++++++++++++++++
 tools/testing/selftests/vm/pkey-powerpc.h    |  3 +-
 tools/testing/selftests/vm/pkey-x86.h        |  2 +-
 tools/testing/selftests/vm/protection_keys.c |  7 +++--
 4 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/vm/pkey-helpers.h b/tools/testing/selftests/vm/pkey-helpers.h
index 2f4b1eb3a680a..59ccdff18214f 100644
--- a/tools/testing/selftests/vm/pkey-helpers.h
+++ b/tools/testing/selftests/vm/pkey-helpers.h
@@ -76,6 +76,8 @@ extern void abort_hooks(void);
 
 __attribute__((noinline)) int read_ptr(int *ptr);
 void expected_pkey_fault(int pkey);
+int sys_pkey_alloc(unsigned long flags, unsigned long init_val);
+int sys_pkey_free(unsigned long pkey);
 
 #if defined(__i386__) || defined(__x86_64__) /* arch */
 #include "pkey-x86.h"
@@ -186,4 +188,32 @@ static inline u32 *siginfo_get_pkey_ptr(siginfo_t *si)
 #endif
 }
 
+static inline int kernel_has_pkeys(void)
+{
+	/* try allocating a key and see if it succeeds */
+	int ret = sys_pkey_alloc(0, 0);
+	if (ret <= 0) {
+		return 0;
+	}
+	sys_pkey_free(ret);
+	return 1;
+}
+
+static inline int is_pkeys_supported(void)
+{
+	/* check if the cpu supports pkeys */
+	if (!cpu_has_pkeys()) {
+		dprintf1("SKIP: %s: no CPU support\n", __func__);
+		return 0;
+	}
+
+	/* check if the kernel supports pkeys */
+	if (!kernel_has_pkeys()) {
+		dprintf1("SKIP: %s: no kernel support\n", __func__);
+		return 0;
+	}
+
+	return 1;
+}
+
 #endif /* _PKEYS_HELPER_H */
diff --git a/tools/testing/selftests/vm/pkey-powerpc.h b/tools/testing/selftests/vm/pkey-powerpc.h
index 319673bbab0b3..7d7c3ffafdd99 100644
--- a/tools/testing/selftests/vm/pkey-powerpc.h
+++ b/tools/testing/selftests/vm/pkey-powerpc.h
@@ -63,8 +63,9 @@ static inline void __write_pkey_reg(u64 pkey_reg)
 			__func__, __read_pkey_reg(), pkey_reg);
 }
 
-static inline int cpu_has_pku(void)
+static inline int cpu_has_pkeys(void)
 {
+	/* No simple way to determine this */
 	return 1;
 }
 
diff --git a/tools/testing/selftests/vm/pkey-x86.h b/tools/testing/selftests/vm/pkey-x86.h
index a0c59d4f7af2e..6421b846aa169 100644
--- a/tools/testing/selftests/vm/pkey-x86.h
+++ b/tools/testing/selftests/vm/pkey-x86.h
@@ -97,7 +97,7 @@ static inline void __cpuid(unsigned int *eax, unsigned int *ebx,
 #define X86_FEATURE_PKU        (1<<3) /* Protection Keys for Userspace */
 #define X86_FEATURE_OSPKE      (1<<4) /* OS Protection Keys Enable */
 
-static inline int cpu_has_pku(void)
+static inline int cpu_has_pkeys(void)
 {
 	unsigned int eax;
 	unsigned int ebx;
diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index 5fcbbc525364e..95f173049f43f 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -1378,7 +1378,7 @@ void test_mprotect_pkey_on_unsupported_cpu(int *ptr, u16 pkey)
 	int size = PAGE_SIZE;
 	int sret;
 
-	if (cpu_has_pku()) {
+	if (cpu_has_pkeys()) {
 		dprintf1("SKIP: %s: no CPU support\n", __func__);
 		return;
 	}
@@ -1447,12 +1447,13 @@ void pkey_setup_shadow(void)
 int main(void)
 {
 	int nr_iterations = 22;
+	int pkeys_supported = is_pkeys_supported();
 
 	setup_handlers();
 
-	printf("has pku: %d\n", cpu_has_pku());
+	printf("has pkeys: %d\n", pkeys_supported);
 
-	if (!cpu_has_pku()) {
+	if (!pkeys_supported) {
 		int size = PAGE_SIZE;
 		int *ptr;
 
-- 
2.17.1

