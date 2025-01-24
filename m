Return-Path: <linuxppc-dev+bounces-5546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51108A1B37E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2025 11:32:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfYzb5c7Sz2ydG;
	Fri, 24 Jan 2025 21:32:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737714763;
	cv=none; b=ZcHXHZ+DGsDeB9O3B7ezMyL/1fB9vBJP8DouOZCVCHqkb5Fz4Afp5MJ/aoq4TMmafrm0KBP8QcPxmeHIJ7E5STVinBS/uQh06SIZ47JHkhnNuRDAK1wgUR9udHJ64YESQpfCsYMM49nKwMbbQ1fqhrlVFdZPocJyP/wNHWzzxc95+ldealoOkgHoHyfWix8POVLY1KlzzaeKSnKpdXK0O+VvuDP7XKlKFZ4PcEKQyHXXwGu75vIGMQcdaaAwzjtnC4Cz3fkVtex7g9/TD+FnBRsIdDDdulqhyb60iOomC6K4pUlUBUkiS9QB6VNY9qevOr967nk1dOD6aPi7XojPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737714763; c=relaxed/relaxed;
	bh=VgGSHTxBZ6Rzo9xayWQNiACOHJPfkFWkXszraVxzsjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=exZk5eKdmV/eAD2m3QFETrXknczu8swB5kZ4HNn+9LnSfk55Lnesm9GyjTfv9v525MeYMscPNaJLK6aXvgQ3VpSlMtkjTNEOfO78UM5G8t0SN5yGUwqd0ydfs+dJ/krKtB666bmwqoXPLosvpHsb1cq71cFXACrxCTgQ/aI3luPA0eJQ0QqDdAz1Pjc6EWFmGpe3DKzAoXS2wb/FSpQWSDvsvl/zkaGxhBA6soPq55pLaOtf/E0iPXQ8GMH7yrNaHfTsn9ke1CRG6XXekwnudkA2kh2c8IN4dYYXvlsEwqG2YmgI5D72PwkkzGHuXL3G9jVlUKoxtJBUEgCOdHK/wA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L3HhmXUh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L3HhmXUh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YfYzb0XB7z2yK7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 21:32:42 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O5NrJu012965;
	Fri, 24 Jan 2025 10:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=VgGSHTxBZ6Rzo9xayWQNiACOHJPfkFWkXszraVxzs
	jo=; b=L3HhmXUh6jbdPco80xaIZR4sNxpsQz+Fujg+Oi4jQS3Oc094sqBN/H+xT
	BismFlxiNcEhDpL+cJnpqiVaGsNUU4RCMsKmeHd+x5pDUDal2cg5YAxDzz1KXEmf
	uYunf9jNWvA52ZWw9ACLDDC1U9R0T/IbnrTXnUiul0KzKj806gfbuO9Epph5vwuK
	kN4RTjslCyDfIJ4ac8tvhPqkQPm/+troarxK7E98YbhLAV+WfroMOIeOuh2xM4Wy
	DOOziB4UJnBHQOV0QZSNFAYC/rLuKmLTMxFwXeKiY5qKZNhSQmTBhlAlzpM7pWrA
	W3fE4VV+My3GFWWDIBqtN459/WqIA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44c4p7swft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:32:35 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50O797K6019252;
	Fri, 24 Jan 2025 10:32:34 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 448pmsu577-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:32:34 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50OAWUmw22675878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jan 2025 10:32:30 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 684F82007E;
	Fri, 24 Jan 2025 10:32:30 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 783CE2007C;
	Fri, 24 Jan 2025 10:32:28 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Jan 2025 10:32:28 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc/hugetlb: Disable gigantic hugepages if fadump is active
Date: Fri, 24 Jan 2025 16:02:20 +0530
Message-ID: <20250124103220.111303-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-GUID: rLB5LZikTnh9dP0hzXyx-qP5iRpcviVe
X-Proofpoint-ORIG-GUID: rLB5LZikTnh9dP0hzXyx-qP5iRpcviVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=961 bulkscore=0 malwarescore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240076
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
 - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()

---
 arch/powerpc/mm/hugetlbpage.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 6b043180220a..087a8df32416 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -135,8 +135,12 @@ int __init alloc_bootmem_huge_page(struct hstate *h, int nid)
 
 bool __init arch_hugetlb_valid_size(unsigned long size)
 {
-	int shift = __ffs(size);
-	int mmu_psize;
+	int shift, mmu_psize;
+
+	if (!hugepages_supported())
+		return false;
+
+	shift = __ffs(size);
 
 	/* Check that it is a page size supported by the hardware and
 	 * that it fits within pagetable and slice limits. */
-- 
2.48.1


