Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 725421993A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 12:42:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s5Vn37mwzDqvt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 21:42:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s4Yq4MrRzDqVN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 20:59:43 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02V9YJFn038596
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 05:59:40 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 303vwj25yh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 05:59:39 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sandipan@linux.ibm.com>;
 Tue, 31 Mar 2020 10:59:25 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 31 Mar 2020 10:59:22 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02V9xXt654001892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Mar 2020 09:59:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 067B94C040;
 Tue, 31 Mar 2020 09:59:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B1654C044;
 Tue, 31 Mar 2020 09:59:30 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 31 Mar 2020 09:59:30 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: akpm@linux-foundation.org
Subject: [PATCH v19 21/24] selftests/vm/pkeys: Test correct behaviour of pkey-0
Date: Tue, 31 Mar 2020 15:28:22 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1585646528.git.sandipan@linux.ibm.com>
References: <cover.1585646528.git.sandipan@linux.ibm.com>
In-Reply-To: <cover.1585646528.git.sandipan@linux.ibm.com>
References: <cover.1585646528.git.sandipan@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20033109-4275-0000-0000-000003B6D57A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033109-4276-0000-0000-000038CC24B3
Message-Id: <9b7c54a9b4261894fe0c7e884c70b87214ff8fbb.1585646528.git.sandipan@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_03:2020-03-30,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=3 bulkscore=0 mlxlogscore=899
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Ensure that pkey-0 is allocated on start and that it can
be attached dynamically in various modes, without failures.

cc: Dave Hansen <dave.hansen@intel.com>
cc: Florian Weimer <fweimer@redhat.com>
Signed-off-by: Ram Pai <linuxram@us.ibm.com>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
Acked-by: Dave Hansen <dave.hansen@intel.com>
---
 tools/testing/selftests/vm/protection_keys.c | 53 ++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
index d4952b57cc909..a1cb9a71e77ce 100644
--- a/tools/testing/selftests/vm/protection_keys.c
+++ b/tools/testing/selftests/vm/protection_keys.c
@@ -964,6 +964,58 @@ __attribute__((noinline)) int read_ptr(int *ptr)
 	return *ptr;
 }
 
+void test_pkey_alloc_free_attach_pkey0(int *ptr, u16 pkey)
+{
+	int i, err;
+	int max_nr_pkey_allocs;
+	int alloced_pkeys[NR_PKEYS];
+	int nr_alloced = 0;
+	long size;
+
+	pkey_assert(pkey_last_malloc_record);
+	size = pkey_last_malloc_record->size;
+	/*
+	 * This is a bit of a hack.  But mprotect() requires
+	 * huge-page-aligned sizes when operating on hugetlbfs.
+	 * So, make sure that we use something that's a multiple
+	 * of a huge page when we can.
+	 */
+	if (size >= HPAGE_SIZE)
+		size = HPAGE_SIZE;
+
+	/* allocate every possible key and make sure key-0 never got allocated */
+	max_nr_pkey_allocs = NR_PKEYS;
+	for (i = 0; i < max_nr_pkey_allocs; i++) {
+		int new_pkey = alloc_pkey();
+		pkey_assert(new_pkey != 0);
+
+		if (new_pkey < 0)
+			break;
+		alloced_pkeys[nr_alloced++] = new_pkey;
+	}
+	/* free all the allocated keys */
+	for (i = 0; i < nr_alloced; i++) {
+		int free_ret;
+
+		if (!alloced_pkeys[i])
+			continue;
+		free_ret = sys_pkey_free(alloced_pkeys[i]);
+		pkey_assert(!free_ret);
+	}
+
+	/* attach key-0 in various modes */
+	err = sys_mprotect_pkey(ptr, size, PROT_READ, 0);
+	pkey_assert(!err);
+	err = sys_mprotect_pkey(ptr, size, PROT_WRITE, 0);
+	pkey_assert(!err);
+	err = sys_mprotect_pkey(ptr, size, PROT_EXEC, 0);
+	pkey_assert(!err);
+	err = sys_mprotect_pkey(ptr, size, PROT_READ|PROT_WRITE, 0);
+	pkey_assert(!err);
+	err = sys_mprotect_pkey(ptr, size, PROT_READ|PROT_WRITE|PROT_EXEC, 0);
+	pkey_assert(!err);
+}
+
 void test_read_of_write_disabled_region(int *ptr, u16 pkey)
 {
 	int ptr_contents;
@@ -1448,6 +1500,7 @@ void (*pkey_tests[])(int *ptr, u16 pkey) = {
 	test_pkey_syscalls_on_non_allocated_pkey,
 	test_pkey_syscalls_bad_args,
 	test_pkey_alloc_exhaust,
+	test_pkey_alloc_free_attach_pkey0,
 };
 
 void run_tests_once(void)
-- 
2.17.1

