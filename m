Return-Path: <linuxppc-dev+bounces-4254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 048029F4571
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 08:47:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC86K4h9wz30fd;
	Tue, 17 Dec 2024 18:47:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734421641;
	cv=none; b=VLSKTSdKFIJTNhCXaoinG3A9jgCPAMTiO0m9YU3jn0/o0xkrBA2TpG60Cxh8YDnD/HkQBM9sXe8U1GRYMWCVUI5GUL6VeLwwSrZ/ennNWdQ5gQL0dSNPV9npDodS/4WapA/vyA+8k+va10m8gKfF5VACkmilp3dYqGV/OY6lBPRSIFIWihT48cfqQUPlcb0mBsrylAzU9qCwQnzlhZs07mGEqueHV839twfxoTNUFJxjBFh+ZUa126n/jvuenBGIsjPpEK7TuO54C6gLZjc3osWSadvH3Pdvur4439urugAR9LSp4sAkEWdv+InFVKT3UexpbPE55uHWcEDLzV8m/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734421641; c=relaxed/relaxed;
	bh=iA6D4xH7cfxsy6OxBuVGMdmMxvsbC806gjbqVAE0s8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LznCiBtmjNLDVo0Ih1SDH2PQgPtVQj3XCR2dXKz0P2En3D8v9XmyoQ9S3cn4IEdKp1nntjFPMqDm6u9ly7ksIjMdSCqgg7a51TZI6mKLhkUlHCQLayyXEmAOgMkNgVBPHRDVh6HBjiSdjT72Oy2Pb2h02UeivMVnRF00jZVZ8O5dWVT2vyhoU+3b0T1nTZQ9TboyBJbYrKE/AVOAmp1pkwrdFZ1Xdp1XCG23mfzRXiiGiAe3ZM9zzGnnKXVa0Fl8SSX6MEMLB4thQZKsIg5DLXMbnwGaiVny8GGB/0sDOHbSlWKmkvENMRHc5LOlkpDkrvGjBsFRsKogRWDXkiGNnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n07SHTzf; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n07SHTzf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC86H5gNCz30Wc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 18:47:19 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGNwCrT028471;
	Tue, 17 Dec 2024 07:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=iA6D4xH7cfxsy6OxBuVGMdmMxvsbC806gjbqVAE0s
	8U=; b=n07SHTzffUDt36bGubqjKz4sEyG9z2OCn+Lk1H0ZyJeQCdcS9MTCh6V62
	u+LUQNicri36mhFPuqpY9pvdB2+oARMtUWURpCIs0XAvWdEkV59+U7pvNl78kIR9
	DQ3YIMUSEEWrLsrsOkd2o0cmeiLeA7mjvbHgtC6wgE/B+VyhfSr+q4PhRNs8nwXx
	seEnOeFuiMJVgLG7v4JJFhJPc8yttdKxx5JjKFpbppx8SOUvddMMNplk3bjunG5b
	WjtuKtOowWY8Gbp1qP3kIgfM0rBCqUEcMRdFNMuu/83f9/jsRXXDgyU6ykAWjw2T
	WN8kmKIbmYs7vofVBBs4Ra84K/CRg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jxbh1gde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:47:03 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BH7l2mS014408;
	Tue, 17 Dec 2024 07:47:02 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jxbh1gdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:47:02 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH3Zung011260;
	Tue, 17 Dec 2024 07:47:01 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hpjk1jcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:47:01 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BH7kw4i31457536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 07:46:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1433A20043;
	Tue, 17 Dec 2024 07:46:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D62420040;
	Tue, 17 Dec 2024 07:46:55 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.29.128])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Dec 2024 07:46:54 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2] powerpc/book3s64/hugetlb: Fix disabling hugetlb when fadump is active
Date: Tue, 17 Dec 2024 13:16:40 +0530
Message-ID: <20241217074640.1064510-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
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
X-Proofpoint-GUID: Xhe6OxDEP8NO6pGoAdmo0fejfeCsdhaP
X-Proofpoint-ORIG-GUID: rRzPjbI0BJPc4nDnL0zEmXkRRxeGU-ap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170060
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Commit 8597538712eb ("powerpc/fadump: Do not use hugepages when fadump
is active") disabled hugetlb support when fadump is active by returning
early from hugetlbpage_init():arch/powerpc/mm/hugetlbpage.c and not
populating hpage_shift/HPAGE_SHIFT.

Later, commit 2354ad252b66 ("powerpc/mm: Update default hugetlb size
early") moved the allocation of hpage_shift/HPAGE_SHIFT to early boot,
which inadvertently re-enabled hugetlb support when fadump is active.

Fix this by implementing hugepages_supported() on powerpc. This ensures
that disabling hugetlb for the fadump kernel is independent of
hpage_shift/HPAGE_SHIFT.

Fixes: 2354ad252b66 ("powerpc/mm: Update default hugetlb size early")
CC: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
CC: Hari Bathini <hbathini@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---

Changelog:

Since v1: https://lore.kernel.org/all/20241202054310.928610-1-sourabhjain@linux.ibm.com/
 - Change return type of hugepages_supported() to bool
 - Add a Reviewed-by

Note: Even with this fix included, it is possible to enable gigantic
pages in the fadump kernel. IIUC, gigantic pages were never disabled
for the fadump kernel.

Currently, gigantic pages are allocated during early boot as long as
the respective hstate is supported by the architecture.

I will introduce some changes in the generic hugetlb code to allow the
architecture to decide on supporting gigantic pages on the go. Bringing
gigantic page allocation under hugepages_supported() does work for
powerpc but I need verify the impact on other architectures.

Regarding the Fixes tag: This patch fixes a bug inadvertently introduced
by the commit mentioned under Fixes tag in the commit message. Feel free
to remove the tag if it is unnecessary.

---
 arch/powerpc/include/asm/hugetlb.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index 18a3028ac3b6..dad2e7980f24 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -15,6 +15,15 @@
 
 extern bool hugetlb_disabled;
 
+static inline bool hugepages_supported(void)
+{
+	if (hugetlb_disabled)
+		return false;
+
+	return HPAGE_SHIFT != 0;
+}
+#define hugepages_supported hugepages_supported
+
 void __init hugetlbpage_init_defaultsize(void);
 
 int slice_is_hugepage_only_range(struct mm_struct *mm, unsigned long addr,
-- 
2.47.1


