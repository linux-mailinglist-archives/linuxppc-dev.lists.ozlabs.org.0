Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC77125406E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 10:16:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcbCn0hJfzDqCk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:16:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Cypc7oHP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcZyt6ByvzDqZP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 18:05:10 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R82NPd019894; Thu, 27 Aug 2020 04:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Jd8o/QGIRyQ/TUB5l2muLN6OnK4kcqeFLiQvLDATR58=;
 b=Cypc7oHPrVvO7n4dWsWKGenlnp2TnMbhEPdV1kdVRv5Ak0jE9ZAbFromUeV14TQJ5bKw
 XUKNhcYDNiwFGYu6gTUi6O3CHaUOj57vSzR5LxbcyGEGIjfgCPxqsEx6KKALcPyY3c/+
 yxzH1E1wOTaV5WgztasjNfLQ06Z29qzi2T5sAkrR8xUEnYug86BXa0HE9d//Yvi8PixG
 Vec9B7r02Ys0Hfv2fyjAAGykXj2VQEWz4MXmF4DHZCtP7EU9tU5eajqPMx825RsiGfWZ
 Qx+5LuNbdADP9om8gzMUJkQ3i2vbKOuYIJ6y2WHYM+NF3qr2ZU5uPpYzgjMDmqEwD4pM cg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3368qv8j9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:04:52 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R82xEo026953;
 Thu, 27 Aug 2020 08:04:51 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 332ujf0byk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 08:04:51 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R84oWl51315094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 08:04:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1ABEE78064;
 Thu, 27 Aug 2020 08:04:50 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D4AC7805F;
 Thu, 27 Aug 2020 08:04:45 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.17.9])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 08:04:44 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v3 00/13] mm/debug_vm_pgtable fixes
Date: Thu, 27 Aug 2020 13:34:25 +0530
Message-Id: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-27_02:2020-08-27,
 2020-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 mlxlogscore=537 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008270057
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vineet Gupta <vgupta@synopsys.com>,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series includes fixes for debug_vm_pgtable test code so that
they follow page table updates rules correctly. The first two patches introduce
changes w.r.t ppc64. The patches are included in this series for completeness. We can
merge them via ppc64 tree if required.

Hugetlb test is disabled on ppc64 because that needs larger change to satisfy
page table update rules.

The patches are on top of 15bc20c6af4ceee97a1f90b43c0e386643c071b4 (linus/master)

Changes from v2:
* Fix build failure with different configs and architecture.

Changes from v1:
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
 arch/powerpc/mm/pgtable.c                    |   5 -
 mm/debug_vm_pgtable.c                        | 170 ++++++++++++-------
 4 files changed, 131 insertions(+), 78 deletions(-)

-- 
2.26.2

