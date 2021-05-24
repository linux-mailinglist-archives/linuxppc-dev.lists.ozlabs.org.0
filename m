Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D623638E2DF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 11:02:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpWS569Q9z3bsH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 19:02:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=stueDBEJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=stueDBEJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpWRW70dyz2ymH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 19:01:43 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14O8XRx2046191; Mon, 24 May 2021 05:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=A8zS+6ks+4msCap+BbNsl0yzY/XER61FE6fOz7GrFDU=;
 b=stueDBEJ/LNrteyRgpWQtgR28dwUMNNz+TvP0E+5Td0fIaXPT5BbLRVaYFZxYcXF9p2X
 ImGV6YBnAoS2SU4VZQX9dS1bNwfb+Ze8Vx0vR2tp8jr3K/gjdXYYUfPEisgDB/9UI0Qj
 lCff4nUoa5j1pF1zzMwmIlSAZSroyRRVme2IEeg5LPiqu4bl0YUhg5SN3h8UAFGvyUkm
 1j2TTJUj98KIERjV7Rwfu/3XIfx+E8TC53DrOTbsPUaLzf03ysvQ6YkY2OZ8f+nykDdu
 2OJ2LMRypf0uGdmR3Vhqf5PmGNGCSByBzca+Bn686oT+wmVGjrixW6/rL+PMzCh86JCl HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38r7k5jhe9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 05:01:29 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14O8YHXf048357;
 Mon, 24 May 2021 05:01:28 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38r7k5jhdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 05:01:28 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14O8nDWi028784;
 Mon, 24 May 2021 09:01:27 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 38q65s2a9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 09:01:27 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14O91QkE22282520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 09:01:26 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96E08AE067;
 Mon, 24 May 2021 09:01:26 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48C6FAE060;
 Mon, 24 May 2021 09:01:23 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.1.240])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 May 2021 09:01:22 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v6 00/11] Speedup mremap on ppc64
Date: Mon, 24 May 2021 14:31:03 +0530
Message-Id: <20210524090114.63446-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jW6UQk9mwQX33Y0WF5iH-NX4xO4NrZCq
X-Proofpoint-GUID: 3p4L0LrVl2RRN5HaWiEDm2JiyPI0XBNS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-24_04:2021-05-20,
 2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240067
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
 kaleshsingh@google.com, joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This patchset enables MOVE_PMD/MOVE_PUD support on power. This requires
the platform to support updating higher-level page tables without
updating page table entries. This also needs to invalidate the Page Walk
Cache on architecture supporting the same.

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



Aneesh Kumar K.V (11):
  selftest/mremap_test: Update the test to handle pagesize other than 4K
  selftest/mremap_test: Avoid crash with static build
  mm/mremap: Convert huge PUD move to separate helper
  mm/mremap: Use pmd/pud_poplulate to update page table entries
  powerpc/mm/book3s64: Fix possible build error
  powerpc/mm/book3s64: Update tlb flush routines to take a page walk
    cache flush argument
  mm/mremap: Use range flush that does TLB and page walk cache flush
  mm/mremap: properly flush the TLB on mremap.
  mm/mremap: Fix race between mremap and pageout
  mm/mremap: Allow arch runtime override
  powerpc/mm: Enable HAVE_MOVE_PMD support

 .../include/asm/book3s/64/tlbflush-radix.h    |  19 ++-
 arch/powerpc/include/asm/book3s/64/tlbflush.h |  29 +++-
 arch/powerpc/include/asm/tlb.h                |   6 +
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |   4 +-
 arch/powerpc/mm/book3s64/radix_tlb.c          |  55 ++++---
 arch/powerpc/platforms/Kconfig.cputype        |   2 +
 mm/mremap.c                                   | 145 ++++++++++++++++--
 tools/testing/selftests/vm/mremap_test.c      | 118 +++++++-------
 8 files changed, 269 insertions(+), 109 deletions(-)

-- 
2.31.1

