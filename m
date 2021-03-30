Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF5034E0FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 08:09:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8fCq1Mkfz3bnq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 17:09:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AN7lqaqc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AN7lqaqc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8fBr0w3Fz302Z
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 17:08:19 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12U64mTV093734; Tue, 30 Mar 2021 02:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=rFQM7fsimgr9Ylj4h6HFbc7R9Z/kTwuMFpS5iG+ZDws=;
 b=AN7lqaqcGWz2pf6MYvZX5/soRa90a6R+WgpY80IEm8IPhlkusAC+t6lmvoKuKrRBjZ8P
 qktz2fC6uGMlyop+nvWu5/GgHU9xD7/erX8VoPko0VSzF5E1s/1kpuSSQjuj/wbrR8GM
 ZNErXYvJgSvPKMUiue/N8few0dQpj/x6+SdZPnNXD4tngXRkx6D4we7XCRtG/71bvbTY
 anXTQs+rUPUT6bFMNCVTLO7kAukP3oUMl4kMITtinDGDctXSu53GCg9xLOag6yQZ6+7f
 Xr07tb5HST1QITNtu6dJezdw3lrL1fGsCaW0y85XUhaZZaHbhxyQ6bqH58y8FAPdn6vp GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhm5dp0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 02:08:10 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12U65Lif096110;
 Tue, 30 Mar 2021 02:08:10 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37jhm5dp06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 02:08:10 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12U64Ggx026105;
 Tue, 30 Mar 2021 06:08:09 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 37hvb98c06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 06:08:09 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12U687Rr11010484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 06:08:07 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89D127805C;
 Tue, 30 Mar 2021 06:08:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A55227805F;
 Tue, 30 Mar 2021 06:08:04 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.52.226])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Mar 2021 06:08:04 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v3 0/9] Speedup mremap on ppc64
Date: Tue, 30 Mar 2021 11:37:43 +0530
Message-Id: <20210330060752.592769-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KwCS-9UYJqKKs2DclbcoxCC9jd9-UbKU
X-Proofpoint-ORIG-GUID: vrdGPCRtER4shtzO14AEEdCt6_Qdh_Vf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_01:2021-03-26,
 2021-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103300043
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
Cc: kaleshsingh@google.com, npiggin@gmail.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, joel@joelfernandes.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset enables MOVE_PMD/MOVE_PUD support on power. This requires
the platform to support updating higher-level page tables without
updating page table entries. This also needs to invalidate the Page Walk
Cache on architecture supporting the same.

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

 arch/arc/include/asm/tlb.h                    |   5 +
 arch/arm64/include/asm/tlb.h                  |   6 +
 .../include/asm/book3s/64/tlbflush-radix.h    |  19 +--
 arch/powerpc/include/asm/book3s/64/tlbflush.h |  30 ++++-
 arch/powerpc/include/asm/tlb.h                |   6 +
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |   4 +-
 arch/powerpc/mm/book3s64/radix_tlb.c          |  49 ++++----
 arch/powerpc/platforms/Kconfig.cputype        |   2 +
 arch/x86/include/asm/tlb.h                    |   5 +
 mm/mremap.c                                   |  40 ++++--
 tools/testing/selftests/vm/mremap_test.c      | 118 ++++++++++--------
 11 files changed, 187 insertions(+), 97 deletions(-)

-- 
2.30.2

