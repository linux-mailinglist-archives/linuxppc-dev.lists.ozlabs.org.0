Return-Path: <linuxppc-dev+bounces-5609-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32782A20383
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 05:34:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhsrR28Q9z2yVt;
	Tue, 28 Jan 2025 15:34:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738038871;
	cv=none; b=Vg5mNfj1jc/B4vE2tbSmZZns8nkUzqXrbbRobpav62s9I436MJ8iSE09LTDsWOkh/McRDBI4YsHYK8fdz+R8lEI4/+Hc6KgOuL20byZp1k0CIiAhe45t61ATmkdpvQTYISTURIG8QsEUXVrt2fWXQXGWfGUoBa9cuawmh3L9OTViJKGk2s5s7Cjf5GQsrp4aHEyawib43KSgSwcTg3arcevYEeC6nF/BI6cKJ0wAQPPE544H5VcmrVCAh+98RcldlTFaGK2QDHtKD7kqUF1tLTdUwItTR6oHFLlfAPZNk0qDXf0b5e4ndM9GR82ZaDvuYGRfPUuaLx3C4wgLC+/hBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738038871; c=relaxed/relaxed;
	bh=a5mhgXWGA9mifYflrDFA22s8NUwNymKmYuWP/6rAdqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LJXkvGpUV+8zNUS1oZ8CA6wWPIuKr58UWGDo9ntIey9acS0eHTrxbQU6/WMIS1tpsAVRsn+1q4BJV1mxWRpQMYeCv2+lZsMf1w7yYXGaka2zKgD7jjDZvE6u/ceHCWxAWwRxX5etZrUayMQo9hfXeUSX7haf0D0yogIKIer0hpXLqq3qgo5DNEyq6h7+WCsxHqX+4BsRV3XeSYCz9CXb6BiUC3OpPWp4nnU9rKMZmRvPvJtREF902KH6Qh3YLb3BfCTAEKjGXs6wXmpZomI3s3Ub8jW1GwkAqqocSDK4jC4bAd/5I8CulUvGE+1+McRWBLRiN6YA8KaU9E2cBTCENw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZeddOXjX; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZeddOXjX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhsrP5rD5z2yGY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 15:34:29 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S20aKb006080;
	Tue, 28 Jan 2025 04:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=a5mhgXWGA9mifYflrDFA22s8NUwNymKmYuWP/6rAd
	qw=; b=ZeddOXjXTLO+aUqGsmbLuE8sulVoA9jbyrwH8s95aXtRA9wZmBSZjVyWI
	ZWPbGRReSFHkN2Rdgs5SdVhtaHRvTI717kk+HECPRTdJOph1I0UBe6CRZoB7/3UP
	t4HCECdPx546DS4x4A0XfzPOn2E7HYHKvNeAUr8RtSjfn0NGdp/IbmF5CgOo+XvY
	LuUPTia3YMKXAPQotDajBNsSXk2EcOZhYJ47lgiuMIgwTiiW5A5VIdo7+0boxWWT
	QmghBl/6lBRAIqP4B5l0+jXJ44ARDhmi/4YKf/jBjRnjf3Qy4lHzfokGTSmC1rN4
	16rEBwxHa/dk9+sNgE9sSaL1tAq0g==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ep2yges7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 04:34:17 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50S20rIi022264;
	Tue, 28 Jan 2025 04:34:16 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44dcgjh964-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 04:34:16 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50S4YD6X35455500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jan 2025 04:34:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02ECE200DA;
	Tue, 28 Jan 2025 04:34:13 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41691200DB;
	Tue, 28 Jan 2025 04:34:11 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Jan 2025 04:34:11 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4] powerpc/hugetlb: Disable gigantic hugepages if fadump is active
Date: Tue, 28 Jan 2025 10:03:58 +0530
Message-ID: <20250128043358.163372-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: nDyI9p-CXzsw8gqtg3hJ65Un7MVhB7ou
X-Proofpoint-GUID: nDyI9p-CXzsw8gqtg3hJ65Un7MVhB7ou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_01,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280031
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
hugepages_supported(). When fadump is active, the global variable
hugetlb_disabled is set to true, which is later used by the
PowerPC-specific hugepages_supported() function to determine hugepage
support.

Returning early from arch_hugetlb_vali_size() not only disables
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

Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
Changelog:

v1:
https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/

v2:
https://lore.kernel.org/all/20250124103220.111303-1-sourabhjain@linux.ibm.com/
 - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()

v3:
https://lore.kernel.org/all/20250125104928.88881-1-sourabhjain@linux.ibm.com/
 - Do not modify the initialization of the shift variable

v4:
- Update commit message to include how hugepages_supported() detects
  hugepages support when fadump is active
- Add Reviewed-by tag
- NO functional change

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


