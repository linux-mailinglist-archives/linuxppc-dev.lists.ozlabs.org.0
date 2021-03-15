Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3925633B159
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 12:42:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzZKW1j8cz3c8l
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 22:42:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n205Fb2z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n205Fb2z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzZGH3Bvjz3019
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 22:39:51 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FBYFqd048009; Mon, 15 Mar 2021 07:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=NuqsTMnmd1zb2iFgDQD9GefXohYwN+OhMJ8YkrUppsk=;
 b=n205Fb2zppC/nMCDXSsoMWGP6Ao72lmDHjIlEsbH9BhXLzxqS/mRPcwFc8jchb6aDJLV
 6pRSKS7uG9EDHposdKVL4LjxcQTB3bTjDqhbc9tAEyEPY8imxlvEr40NOOCro0NZgvxm
 hBlqmwZhg8ohGhERp1zmL496wEYd756HkSqfGtWbaysAmxmXAbfFjTlVJW6hq77S18e3
 PHINiK9DTiu7hisLHUOu4OPu1cJ2/DJ00k8uPbpTJEY2pHzgXmvz4wu9sJKlcb+ZHl03
 k/Veic+0hVhm5Rv0YILMHzBTSFMICDOSLyExTQevL6+WGTO3fyxw5yjUrdSzZgMiN+uJ WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37a6t90355-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 07:38:35 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FBa2Vf057762;
 Mon, 15 Mar 2021 07:38:35 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37a6t9034p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 07:38:35 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FBX0LW022700;
 Mon, 15 Mar 2021 11:38:34 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 378n18pttg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 11:38:34 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FBcX0916318854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 11:38:33 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A286AC05B;
 Mon, 15 Mar 2021 11:38:33 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A255AAC059;
 Mon, 15 Mar 2021 11:38:30 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.36.236])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 11:38:30 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2 0/6] Speedup mremap on ppc64
Date: Mon, 15 Mar 2021 17:08:18 +0530
Message-Id: <20210315113824.270796-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_03:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150081
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
Cc: peterz@infradead.org, kaleshsingh@google.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, joel@joelfernandes.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset enables MOVE_PMD/MOVE_PUD support on power. This requires
the platform to support updating higher-level page tables without
updating page table entries. This also needs to invalidate the Page Walk
Cache on architecture supporting the same.

The patchset does that by switching the page table update to use mmu gather
interface instead of direct tlb flush. mmu gather allows the architecture
to manage page walk cache invalidate separately.

Changes from V1:
* Rebase to recent upstream
* Fix build issues with tlb_gather_mmu changes


Aneesh Kumar K.V (6):
  selftest/mremap_test: Update the test to handle pagesize other than 4K
  selftest/mremap_test: Avoid crash with static build
  mm/mremap: Use pmd/pud_poplulate to update page table entries
  mm/mremap: Use mmu gather interface instead of flush_tlb_range
  mm/mremap: Allow arch runtime override
  powerpc/mm: Enable move pmd/pud

 arch/arc/include/asm/tlb.h               |   5 +
 arch/arm64/include/asm/tlb.h             |   6 ++
 arch/powerpc/include/asm/tlb.h           |   6 ++
 arch/powerpc/platforms/Kconfig.cputype   |   2 +
 arch/x86/include/asm/tlb.h               |   5 +
 mm/mremap.c                              |  54 +++++++++--
 tools/testing/selftests/vm/mremap_test.c | 118 ++++++++++++-----------
 7 files changed, 133 insertions(+), 63 deletions(-)

-- 
2.29.2

