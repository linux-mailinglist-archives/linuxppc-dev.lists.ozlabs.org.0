Return-Path: <linuxppc-dev+bounces-6089-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D6DA310EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 17:14:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ysmjz3by6z30Vm;
	Wed, 12 Feb 2025 03:14:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739290487;
	cv=none; b=eNZNS3YrxDIeqjyqFDMbpGrnjkR0uVVUISN9IyuWbqZyeh5dFn6OrzS9UJ7wOYBZl+Y0rvKSR92QmH5vZ/U25oRoLH7+nR8nCRl+YckZebVzo0d/SENB2kSpTNJffZeRb+GEDOdwwo5PTXauE4zYVJqRleHgY9SObfjEdJIvIRlAlEewSDKS33ugOnojPfhPTY7+wSSvT5aHGnTi4vh6D7Ehl8rM9w1wojzsVVxlpVPAexlKSwZDmEJCOUjL0sEBr1TfBeO/HWV30l8Tbi7BFrrgPN40qfxCaoaJfgv9iaHrtttOTLkV60VTyPCW/1P8yP7wZhFghsj/+BuTxr7dnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739290487; c=relaxed/relaxed;
	bh=0xdreWwVnxuyL481YPDSF8wHYJ0Nb52Yq9rjkbtqthM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DnExAd/5FR/zmsnETVIK/7AONhRW1zsQEEfNwGeeHQ9N6+74Cqk0KlrFBp7f74h0+/0bPNi+2QYiMabZqJPilQGVnAXlUx3jixmL66kqJnkxlkxXJ3TuNzpfZUGF+w/vajuxeRhUktOOHrYQjYjd2+cC+PbVZiPd0255yp3D0di1KYCAwIuYM+P47zJUxhDK17BKmyHwHICCcAekbkDZz9mMnQL8KpGF7U45tNGIFl83Y2unio8SymxXzF2/8Lk2tS4akgYEBM6hPWUkMI0oGCL55XXdCcbJPFWYjmEdrTG9hFsIcB02E2cmU+2i7qt2UUwELdrvGu1aelMbXqiWCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GM33nSBP; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GM33nSBP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ysmjy3w1Tz306S
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 03:14:45 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BDbuna008118;
	Tue, 11 Feb 2025 16:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=0xdreWwVnxuyL481YPDSF8wHYJ0Nb52Yq9rjkbtqt
	hM=; b=GM33nSBPY+V8zuX/Vo6qsCvkrDYPevGhB7ydkWhlr/shFpwW6uboK0eQW
	cCcXWSOmYWeKG5zIgPxmHnkAOup926KlLs1tKeSrA25EaUkJQ2N41UPcf5VUaMvW
	ExzrWi7H34nJEiWCxU/+dugPTV602w0ZNTHvbTmXFTDs0B/3rHjuHxMw1Gn9Z9zt
	yQON1fWg1UnuiUtL1c/V2DZOTL8ylbTqxL6cHurb1sqyTpE0W/QMvRN2mc2psqeo
	HySaowWNgnnxMJTmEA+fSU0v3woDWrH/c93rXcS1hsHOkYMEZMWeqnBcwIcE4h+R
	O7O6tj/KZI714xY5AbtCPmzuAR2nQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44qvma3p6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:14:34 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51BFHMYa028721;
	Tue, 11 Feb 2025 16:14:33 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44pma1kprm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:14:33 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51BGEWA654788394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 16:14:32 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09DA42004E;
	Tue, 11 Feb 2025 16:14:32 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30F9420043;
	Tue, 11 Feb 2025 16:14:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Feb 2025 16:14:31 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.150.7.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DEB55600AE;
	Wed, 12 Feb 2025 03:14:24 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me
Subject: [PATCH v13 00/11] Support page table check on PowerPC
Date: Wed, 12 Feb 2025 03:13:53 +1100
Message-ID: <20250211161404.850215-1-ajd@linux.ibm.com>
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
X-Proofpoint-GUID: QPmKXD5gPUpVSUuCIRBS05bl4oO8-nRA
X-Proofpoint-ORIG-GUID: QPmKXD5gPUpVSUuCIRBS05bl4oO8-nRA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Support page table check on all PowerPC platforms. This works by
serialising assignments, reassignments and clears of page table
entries at each level in order to ensure that anonymous mappings
have at most one writable consumer, and likewise that file-backed
mappings are not simultaneously also anonymous mappings.

In order to support this infrastructure, a number of stubs must be
defined for all powerpc platforms. Additionally, seperate set_pte_at()
and set_pte_at_unchecked(), to allow for internal, uninstrumented mappings.

(This series was written by Rohan McLure, who has left IBM and is no longer
working on powerpc - I've taken far too long to pick this up and finally
send it.)

v13:
 * Rebase on mainline
 * Don't use set_pte_at_unchecked() for early boot purposes (Pasha)

v12:
 * Rename commits that revert changes to instead reflect that we are
   reinstating old behaviour due to it providing more flexibility
 * Add return line to pud_pfn() stub
 * Instrument ptep_get_and_clear() for nohash
Link: https://lore.kernel.org/linuxppc-dev/20240402051154.476244-1-rmclure@linux.ibm.com/

v11:
 * The pud_pfn() stub, which previously had no legitimate users on any
   powerpc platform, now has users in Book3s64 with transparent pages.
   Include a stub of the same name for each platform that does not
   define their own.
 * Drop patch that standardised use of p*d_leaf(), as already included
   upstream in v6.9.
 * Provide fallback definitions of p{m,u}d_user_accessible_page() that
   do not reference p*d_leaf(), p*d_pte(), as they are defined after
   powerpc/mm headers by linux/mm headers.
 * Ensure that set_pte_at_unchecked() has the same checks as
   set_pte_at().
Link: https://lore.kernel.org/linuxppc-dev/20240328045535.194800-14-rmclure@linux.ibm.com/ 

v10:
 * Revert patches that removed address and mm parameters from page table
   check routines, including consuming code from arm64, x86_64 and
   riscv.
 * Implement *_user_accessible_page() routines in terms of pte_user()
   where available (64-bit, book3s) but otherwise by checking the
   address (on platforms where the pte does not imply whether the
   mapping is for user or kernel)
 * Internal set_pte_at() calls replaced with set_pte_at_unchecked(), which
   is identical, but prevents double instrumentation.
Link: https://lore.kernel.org/linuxppc-dev/20240313042118.230397-9-rmclure@linux.ibm.com/T/

v9:
 * Adapt to using the set_ptes() API, using __set_pte_at() where we need
   must avoid instrumentation.
 * Use the logic of *_access_permitted() for implementing
   *_user_accessible_page(), which are required routines for page table
   check.
 * Even though we no longer need p{m,u,4}d_leaf(), still default
   implement these to assist in refactoring out extant
   p{m,u,4}_is_leaf().
 * Add p{m,u}_pte() stubs where asm-generic does not provide them, as
   page table check wants all *user_accessible_page() variants, and we
   would like to default implement the variants in terms of
   pte_user_accessible_page().
 * Avoid the ugly pmdp_collapse_flush() macro nonsense! Just instrument
   its constituent calls instead for radix and hash.
Link: https://lore.kernel.org/linuxppc-dev/20231130025404.37179-2-rmclure@linux.ibm.com/

v8:
 * Fix linux/page_table_check.h include in asm/pgtable.h breaking
   32-bit.
Link: https://lore.kernel.org/linuxppc-dev/20230215231153.2147454-1-rmclure@linux.ibm.com/

v7:
 * Remove use of extern in set_pte prototypes
 * Clean up pmdp_collapse_flush macro
 * Replace set_pte_at with static inline function
 * Fix commit message for patch 7
Link: https://lore.kernel.org/linuxppc-dev/20230215020155.1969194-1-rmclure@linux.ibm.com/

v6:
 * Support huge pages and p{m,u}d accounting.
 * Remove instrumentation from set_pte from kernel internal pages.
 * 64s: Implement pmdp_collapse_flush in terms of __pmdp_collapse_flush
   as access to the mm_struct * is required.
Link: https://lore.kernel.org/linuxppc-dev/20230214015939.1853438-1-rmclure@linux.ibm.com/

v5:
Link: https://lore.kernel.org/linuxppc-dev/20221118002146.25979-1-rmclure@linux.ibm.com/

Rohan McLure (11):
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pud_set()
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pmd_set()
  mm/page_table_check: Provide addr parameter to
    page_table_check_pte_set()
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pud_clear()
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pmd_clear()
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pte_clear()
  mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
  powerpc: mm: Add pud_pfn() stub
  powerpc: mm: Implement *_user_accessible_page() for ptes
  powerpc: mm: Use set_pte_at_unchecked() for internal usages
  powerpc: mm: Support page table check

 arch/arm64/include/asm/pgtable.h             | 18 +++---
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h | 12 +++-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 62 +++++++++++++++---
 arch/powerpc/include/asm/nohash/pgtable.h    | 13 +++-
 arch/powerpc/include/asm/pgtable.h           | 19 ++++++
 arch/powerpc/mm/book3s64/hash_pgtable.c      |  4 ++
 arch/powerpc/mm/book3s64/pgtable.c           | 17 +++--
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  9 ++-
 arch/powerpc/mm/pgtable.c                    | 12 ++++
 arch/riscv/include/asm/pgtable.h             | 18 +++---
 arch/x86/include/asm/pgtable.h               | 20 +++---
 include/linux/page_table_check.h             | 67 ++++++++++++--------
 include/linux/pgtable.h                      | 10 +--
 mm/page_table_check.c                        | 39 +++++++-----
 15 files changed, 225 insertions(+), 96 deletions(-)

-- 
2.48.1


