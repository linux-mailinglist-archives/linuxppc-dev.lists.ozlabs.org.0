Return-Path: <linuxppc-dev+bounces-5557-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351A1A1C2C8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2025 11:50:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YgBKK2G59z2xyG;
	Sat, 25 Jan 2025 21:50:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737802213;
	cv=none; b=hPWu9/i9beBuQYyw6Uts5KCQOEZMMOXMGmUFDdZthG6FHBW74B7jQf5ZC5E8ugCe7fY+egz54ZtaMV0v4Z4xX+K9cxtHSuCuhMRqsN+H97KCF/2N5d7Cp9bo3ktXAPB8B7NVuoFDh4TO4zJCqaRxK+KDrJJNl6YJyykZxbhW7fR76NG8EBUHouGVHMsjcaaLoYlLBDy9WibCDuoXBBppuy96tO6gUU05/v/tjzLTg+3VzreCrkRMlMtO8CEmfMbjxLH/xxbNUkyBnx0Wkwd46Tw5lGnyr6WZuF7c9oWYKcwnhos98GuSESL4QfSbBu94UcEt4z9zGD4XQyCl0ic45A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737802213; c=relaxed/relaxed;
	bh=1qeCsdx1nXMpNkvJmBLEbfAYwF5/v7XSL1ummxCOsiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VRlhg1IfPUj6MRn/WXrnlYWqDdWuBft9UAjnkgsBWse/FBQaRBQDr5Z1YS19s2x2p5cHfUOjMO+fdYQaAVj7N/C9uxvzsCs5YhmxUpYJ7+rMJXj1g9WS37tHhyB6XDjWJWJ4wYib+tMips5drUO8phMsn7CLsH49N5IEosko97FR13yDcXOQPpH3LTHW0NfOiyQr0Ox3bWMhvLMPj4Kzqq1HQpdMQJwgfBz6Wo/MEzkxzUFxdsmIL3z519RoAKr5UYt9/0pmZBBaKPejWLZYqMGHPMytpvXj2nkOBkgyxEzLGkUxzDg0QiSVd+Q1a1q6nk8/POYayPd7O8TDWBZO7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AhnDqzu1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AhnDqzu1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YgBKH4kVjz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2025 21:50:11 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50P20cLo012645;
	Sat, 25 Jan 2025 10:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=1qeCsdx1nXMpNkvJmBLEbfAYwF5/v7XSL1ummxCOs
	iQ=; b=AhnDqzu1mPCjHRg5qLIE2OFlIAbKJN9Ij249rrnZSbQYrAKNndEiiRrp6
	nYvxbLH5Gzq2iCFnkwUkiYlsLrob+6pkyobIuaeBy4Z1ChBQhdsHVQhIZftIb/hY
	QBuqSYDvfDB6s7nhJV2UoWrMHAxVcYPEQu6fwqCg5X0Uv8nUz1+MRHiBm2jZk0TT
	ixi6s/28ED69X3FNx5URG2tssqPIkB2YR782h9u5StB2RphgfHMqsLQKEahVjsfc
	pgRpMbEbWSH5eVSG0+3L1n4zGpf34vJHsRubyBrVxK7+UGqr9fn/nn65CmJnYDN/
	zbGBMDEP7UagFNKgF7fh3GnI06CWQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44cpsy9a0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Jan 2025 10:49:59 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50PAnuEb005761;
	Sat, 25 Jan 2025 10:49:58 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44cxhe0007-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Jan 2025 10:49:58 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50PAnYfg48628158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 25 Jan 2025 10:49:34 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A2B92008C;
	Sat, 25 Jan 2025 10:49:34 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 355332008B;
	Sat, 25 Jan 2025 10:49:32 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.45.180])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 25 Jan 2025 10:49:31 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3] powerpc/hugetlb: Disable gigantic hugepages if fadump is active
Date: Sat, 25 Jan 2025 16:19:28 +0530
Message-ID: <20250125104928.88881-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s4FUNrukslx8FO3DQymueOizmITWkx96
X-Proofpoint-GUID: s4FUNrukslx8FO3DQymueOizmITWkx96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-25_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501250075
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The fadump kernel boots with limited memory solely to collect the kernel
core dump. Having gigantic hugepages in the fadump kernel is of no use.
Many times, the fadump kernel encounters OOM (Out of Memory) issues if
gigantic hugepages are allocated.

To address this, disable gigantic hugepages if fadump is active by
returning early from arch_hugetlb_valid_size() using
hugepages_supported(). hugepages_supported() returns false if fadump is
active.

Returning early from arch_hugetlb_valid_size() not only disables
gigantic hugepages but also avoids unnecessary hstate initialization for
every hugepage size supported by the platform.

kernel logs related to hugepages with this patch included:
kernel argument passed: hugepagesz=1G hugepages=1

First kernel: gigantic hugepage got allocated
==============================================

dmesg | grep -i "hugetlb"
-------------------------
HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page

$ cat /proc/meminfo | grep -i "hugetlb"
-------------------------------------
Hugetlb:         1048576 kB

Fadump kernel: gigantic hugepage not allocated
===============================================

dmesg | grep -i "hugetlb"
-------------------------
[    0.000000] HugeTLB: unsupported hugepagesz=1G
[    0.000000] HugeTLB: hugepages=1 does not follow a valid hugepagesz, ignoring
[    0.706375] HugeTLB support is disabled!
[    0.773530] hugetlbfs: disabling because there are no supported hugepage sizes

$ cat /proc/meminfo | grep -i "hugetlb"
----------------------------------
<Nothing>

Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---

Changelog:

v1:
https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/

v2:
https://lore.kernel.org/all/20250124103220.111303-1-sourabhjain@linux.ibm.com/
 - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()

v3:
 - Do not modify the initialization of the shift variable

---
 arch/powerpc/mm/hugetlbpage.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 6b043180220a..88cfd182db4e 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -138,6 +138,9 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 	int shift = __ffs(size);
 	int mmu_psize;
 
+	if (!hugepages_supported())
+		return false;
+
 	/* Check that it is a page size supported by the hardware and
 	 * that it fits within pagetable and slice limits. */
 	if (size <= PAGE_SIZE || !is_power_of_2(size))
-- 
2.48.1


