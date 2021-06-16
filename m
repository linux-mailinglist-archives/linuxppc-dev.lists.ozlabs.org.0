Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D183A90DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 06:58:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4Xy83mQYz3dCC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 14:58:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oYEahurN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oYEahurN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4Xxh40qyz302g
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 14:58:00 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15G4XjpX044682; Wed, 16 Jun 2021 00:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=6QFXMIpx56aVPe42FIhYS6gEte4gefS/3+MLmLscVEA=;
 b=oYEahurNkNvI+wXzKxMMngQr4Lr9FtvJRzSp0CEbEcqBljhjAWwGO2z4YE1inHdwHaeY
 XHGzkeX+L8eshZOeUxR1mwHLHAn/2EVUXii2hSW44nD1Dcn3PrXP1KwteL/bkLjalScv
 OvsDQcmYNDWii/66TZYGjHrAiZl0jtXHX9RGuwDf4Gqwp4W8Sb4RIpur2Znmy4QpVTUH
 djvH5s/WWOUyR+npY6NZoM19/bToDSwSPpc61S91FbxBNOTZp9rmpdgDvDr08x1IRh2C
 cwDC3nr/fpjO8H1ee3BJSVCLr/5W1+1aqh9mQ6bxyWT6f3TV0X0Rny7jmN3uYDm+DYoB rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3978bau3cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 00:57:47 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15G4XhVI044575;
 Wed, 16 Jun 2021 00:57:47 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3978bau3c3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 00:57:47 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15G4q9Kd031111;
 Wed, 16 Jun 2021 04:57:46 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 394mj9vt45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 04:57:46 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15G4vjR012976562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 04:57:45 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 463E9B2064;
 Wed, 16 Jun 2021 04:57:45 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5A64B2065;
 Wed, 16 Jun 2021 04:57:41 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.71.33])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 16 Jun 2021 04:57:41 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v8 0/3] Speedup mremap on ppc64
Date: Wed, 16 Jun 2021 10:27:32 +0530
Message-Id: <20210616045735.374532-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 52VjPeczYuhyj3EBiqUvv48Z1fxnn8O4
X-Proofpoint-ORIG-GUID: lyhUnfFPqP3LehFaHADZA26T1u-grw1P
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_09:2021-06-15,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160027
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, npiggin@gmail.com,
 kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset enables MOVE_PMD/MOVE_PUD support on power. This requires
the platform to support updating higher-level page tables without
updating page table entries. This also needs to invalidate the Page Walk
Cache on architecture supporting the same.

This patchset is dependent on
https://lore.kernel.org/linux-mm/20210616045239.370802-1-aneesh.kumar@linux.ibm.com/

Changes from v7:
* Split mremap fixes to a separate series

Changes from v6:
* Update ppc64 flush_tlb_range to invalidate page walk cache.
* Add patches to fix race between mremap and page out
* Add patch to fix build error with page table levels 2

Changes from v5:
* Drop patch mm/mremap: Move TLB flush outside page table lock
* Add fixes for race between optimized mremap and page out

Changes from v4:
* Change function name and arguments based on review feedback.

Changes from v3:
* Fix build error reported by kernel test robot
* Address review feedback.

Changes from v2:
* switch from using mmu_gather to flush_pte_tlb_pwc_range() 

Changes from v1:
* Rebase to recent upstream
* Fix build issues with tlb_gather_mmu changes



Aneesh Kumar K.V (3):
  mm/mremap: Allow arch runtime override
  powerpc/book3s64/mm: Update flush_tlb_range to flush page walk cache
  powerpc/mm: Enable HAVE_MOVE_PMD support

 .../include/asm/book3s/64/tlbflush-radix.h    |  2 +
 arch/powerpc/include/asm/tlb.h                |  6 +++
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  8 +++-
 arch/powerpc/mm/book3s64/radix_tlb.c          | 44 ++++++++++++-------
 arch/powerpc/platforms/Kconfig.cputype        |  2 +
 mm/mremap.c                                   | 15 ++++++-
 6 files changed, 58 insertions(+), 19 deletions(-)

-- 
2.31.1

