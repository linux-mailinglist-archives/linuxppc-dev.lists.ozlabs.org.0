Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE6A367964
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 07:44:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQmZZ5c3tz2yhr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 15:44:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b+Mwsy+6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=b+Mwsy+6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQmZ35p3Vz2xZQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 15:43:55 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13M5Y8XH114502; Thu, 22 Apr 2021 01:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=GwhhICo0RxsjTF/vsRbJu/butH/VsDxBR710d6yAvno=;
 b=b+Mwsy+6qWsO+GfA3dN7LIrUyCEvUyj8usB1SUQREtfNop51Zi4vy3MtoGg9BYw8g23T
 iZwWAXUG2bZflwUWl0GveR2hJTDJpfHJsQg2DyutLL+uK+rTyQPaUuob19N/e1+0P4be
 MS+Z7ld7pLVliyR8wHugpYEFnF0SVo4d5la+Yl3iM8eKk+/tK5YbU3mBh7KPJRNPr3FP
 gpOm9K0FP/bC4trz18dqCL7qYFpPxCZqmU1erUaPiqYxhTL4MVGjZjWkYyUm1ILKIvDX
 k3eNzsYz3h1nVQSgh0elC5HBR0be1vz2rr3+4BDQS1CCN967LHNa/7dICAyK87SxPscq /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38331n8c4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 01:43:39 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13M5YxPS117761;
 Thu, 22 Apr 2021 01:43:39 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38331n8c3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 01:43:39 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13M5gYOr021350;
 Thu, 22 Apr 2021 05:43:38 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 37yqa9fn8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 05:43:38 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13M5hbDE55706276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 05:43:37 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31A2878069;
 Thu, 22 Apr 2021 05:43:37 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0D357805E;
 Thu, 22 Apr 2021 05:43:33 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.37.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 22 Apr 2021 05:43:33 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v5 0/9] Speedup mremap on ppc64
Date: Thu, 22 Apr 2021 11:13:14 +0530
Message-Id: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5HwBNVqs_lV50UcMCyslo-0Tns_7wwJD
X-Proofpoint-ORIG-GUID: KFzwtuDqLVZdtEgtto0WHHUgACo1gVmu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_01:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104220047
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 kaleshsingh@google.com, joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This patchset enables MOVE_PMD/MOVE_PUD support on power. This requires
the platform to support updating higher-level page tables without
updating page table entries. This also needs to invalidate the Page Walk
Cache on architecture supporting the same.

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



Aneesh Kumar K.V (9):
  selftest/mremap_test: Update the test to handle pagesize other than 4K
  selftest/mremap_test: Avoid crash with static build
  mm/mremap: Use pmd/pud_poplulate to update page table entries
  powerpc/mm/book3s64: Fix possible build error
  powerpc/mm/book3s64: Update tlb flush routines to take a page walk
    cache flush argument
  mm/mremap: Use range flush that does TLB and page walk cache flush
  mm/mremap: Move TLB flush outside page table lock
  mm/mremap: Allow arch runtime override
  powerpc/mm: Enable move pmd/pud

 .../include/asm/book3s/64/tlbflush-radix.h    |  19 +--
 arch/powerpc/include/asm/book3s/64/tlbflush.h |  29 ++++-
 arch/powerpc/include/asm/tlb.h                |   6 +
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |   4 +-
 arch/powerpc/mm/book3s64/radix_tlb.c          |  55 ++++----
 arch/powerpc/platforms/Kconfig.cputype        |   2 +
 mm/mremap.c                                   |  40 ++++--
 tools/testing/selftests/vm/mremap_test.c      | 118 ++++++++++--------
 8 files changed, 170 insertions(+), 103 deletions(-)

-- 
2.30.2

