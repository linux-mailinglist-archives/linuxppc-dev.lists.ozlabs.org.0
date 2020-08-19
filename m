Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9C1249F39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 15:09:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWp681gw4zDqsp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 23:09:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QTRE54S5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWnx65FH2zDqsm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 23:02:02 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JCXFnH018653; Wed, 19 Aug 2020 09:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=maxRhctJ153oO1otaE3QmElvIy7z+ogaQ5FlmNSoDPE=;
 b=QTRE54S5eOa0zCIJHc8ZCUkEjtG64MxdrBZYUEpIiX4hvVRM/z2uXMeDGy4Q+YWvIQwt
 6EiXZnEqkq17CkKQvUq5fFWVY4rRCvYhqnH6FppM0SJ6rywWWiWZhT5A7bWvTnugEU9P
 ma5o1WPok0q32CA6Y1p/bDT/acJPr687NtR4B87UG5wtBW9knKY3Bbp1mNWM5l+kOGaI
 RGbNCfOce+lk0UtxG6sgaKaY/As9UAuH7iBGUNj+Eg9tspbxIki9stoySKxmS34L2crP
 IuXZITq6XRJmvruq88dccjSrKx24jeZshkAE2uFHtBcbGAWsbU90FkflzljMdXEMbVtg Yg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 330ccb382m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 09:01:26 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JD0faZ026802;
 Wed, 19 Aug 2020 13:01:25 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 3304ccf3ss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 13:01:25 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07JD1O5b37617938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 13:01:24 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 314EDB206A;
 Wed, 19 Aug 2020 13:01:24 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1283B2064;
 Wed, 19 Aug 2020 13:01:21 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.3.58])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 19 Aug 2020 13:01:21 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2 00/13] mm/debug_vm_pgtable fixes
Date: Wed, 19 Aug 2020 18:30:54 +0530
Message-Id: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_04:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=611
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190110
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series includes fixes for debug_vm_pgtable test code so that
they follow page table updates rules correctly. The first two patches introduce
changes w.r.t ppc64. The patches are included in this series for completeness. We can
merge them via ppc64 tree if required.

Hugetlb test is disabled on ppc64 because that needs larger change to satisfy
page table update rules.

Changes from V1:
* Address review feedback
* drop test specific pfn_pte and pfn_pmd.
* Update ppc64 page table helper to add _PAGE_PTE 

Aneesh Kumar K.V (13):
  powerpc/mm: Add DEBUG_VM WARN for pmd_clear
  powerpc/mm: Move setting pte specific flags to pfn_pte
  mm/debug_vm_pgtable/ppc64: Avoid setting top bits in radom value
  mm/debug_vm_pgtables/hugevmap: Use the arch helper to identify huge
    vmap support.
  mm/debug_vm_pgtable/savedwrite: Enable savedwrite test with
    CONFIG_NUMA_BALANCING
  mm/debug_vm_pgtable/THP: Mark the pte entry huge before using
    set_pmd/pud_at
  mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use set_*_at to update an
    existing pte entry
  mm/debug_vm_pgtable/thp: Use page table depost/withdraw with THP
  mm/debug_vm_pgtable/locks: Move non page table modifying test together
  mm/debug_vm_pgtable/locks: Take correct page table lock
  mm/debug_vm_pgtable/pmd_clear: Don't use pmd/pud_clear on pte entries
  mm/debug_vm_pgtable/hugetlb: Disable hugetlb test on ppc64
  mm/debug_vm_pgtable: populate a pte entry before fetching it

 arch/powerpc/include/asm/book3s/64/pgtable.h |  29 +++-
 arch/powerpc/include/asm/nohash/pgtable.h    |   5 -
 arch/powerpc/mm/book3s64/pgtable.c           |   2 +-
 arch/powerpc/mm/pgtable.c                    |   5 -
 include/linux/io.h                           |  12 ++
 mm/debug_vm_pgtable.c                        | 151 +++++++++++--------
 6 files changed, 127 insertions(+), 77 deletions(-)

-- 
2.26.2

