Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C7B209A10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 08:48:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49srFW0JBxzDqgf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 16:48:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49srBv5mjmzDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 16:46:15 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P6WkKM131916; Thu, 25 Jun 2020 02:46:08 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31uwymeub3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 02:46:08 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05P6eS94031444;
 Thu, 25 Jun 2020 06:46:08 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 31uus3ss7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 06:46:08 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05P6k6IY29229340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jun 2020 06:46:06 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4B2B7805F;
 Thu, 25 Jun 2020 06:46:06 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 800F47805E;
 Thu, 25 Jun 2020 06:46:04 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.47.233])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Jun 2020 06:46:04 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 0/4] powerpc/mm/radix: Memory unplug fixes
Date: Thu, 25 Jun 2020 12:15:43 +0530
Message-Id: <20200625064547.228448-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_02:2020-06-24,
 2020-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=2 impostorscore=0 cotscore=-2147483648 adultscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006250035
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
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the next version of the fixes for memory unplug on radix.
The issues and the fix are described in the actual patches.

Changes from v1:
- Added back patch to drop split_kernel_mapping
- Most of the split_kernel_mapping related issues are now described
  in the removal patch
- drop pte fragment change
- use lmb size as the max mapping size.
- Radix baremetal now use memory block size of 1G.


Changes from v0:
==============
- Rebased to latest kernel.
- Took care of p4d changes.
- Addressed Aneesh's review feedback:
 - Added comments.
 - Indentation fixed.
- Dropped the 1st patch (setting DRCONF_MEM_HOTREMOVABLE lmb flags) as
  it is debatable if this flag should be set in the device tree by OS
  and not by platform in case of hotplug. This can be looked at separately.
  (The fixes in this patchset remain valid without the dropped patch)
- Dropped the last patch that removed split_kernel_mapping() to ensure
  that spilitting code is available for any radix guest running on
  platforms that don't set DRCONF_MEM_HOTREMOVABLE.


Aneesh Kumar K.V (2):
  powerpc/mm/radix: Fix PTE/PMD fragment count for early page table
    mappings
  powerpc/mm/radix: Create separate mappings for hot-plugged memory

Bharata B Rao (2):
  powerpc/mm/radix: Free PUD table when freeing pagetable
  powerpc/mm/radix: Remove split_kernel_mapping()

 arch/powerpc/include/asm/book3s/64/pgalloc.h |  16 +-
 arch/powerpc/mm/book3s64/pgtable.c           |   5 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 199 +++++++++++--------
 arch/powerpc/mm/pgtable-frag.c               |   3 +
 arch/powerpc/platforms/powernv/setup.c       |  10 +-
 5 files changed, 144 insertions(+), 89 deletions(-)

-- 
2.26.2

