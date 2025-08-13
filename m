Return-Path: <linuxppc-dev+bounces-10914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B69B2416A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 08:27:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1z1g5ZcZz30W9;
	Wed, 13 Aug 2025 16:27:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755066439;
	cv=none; b=AGxILJcPuWUUe6xNF3H8UnfClL1oKlKAagi7A1Bd3jCcW8DI4dZfdYnUg4m/hkYmI/bjkq/+Ow2dm1kF4N+7Jqk/fKR3hh7mrEFWpxRFyDIo1MxCp1DjNZFCGwivuV0UhYJXY2OPY4PAUgo/4EHTAdwS1Nog2tl5vDMocmwibMyxACgVTKOuDjjokFVV1AwZu6B5X8OCi/XEnBTEP9w4ShGmUx8Z5peUcHOI3P3jZtw34mO2Lu5tk62sU9gEbXogbxgS6DVRIiw+Rwzn8ZtzT2mXy4NZuW8tDNW7xQQWGkVERwgnKMz9c45Vtg5+ee/et4PoCxysBd7K/FEgSyhHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755066439; c=relaxed/relaxed;
	bh=qdcq5ZcPgQ2wmd4+LkAjaTVNVpquUFZSKJxd9KBdzyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dsng4f2XFzb4K9GRqPN8xA7Ms+pS6dOsccy+KTvTQ0DxxKKq+jc8vXh/TDrMiOd2H+IY14OtI9AJ2gTHYzS02DazHVTENLz0/XPS5Nao8VnogLKs3V/tILBpKjMi+LJaCy64yrw7qId/wOkypm4tw7BoQCKcg/D/HQw0bGoxiPY0QMxJ1NrfLRoRcEkyLRDucnUbt2UdLQ5NRK4Encs+9gwms/BkL7gVrx6Ti5JwN4mJhSj6wVkCp8WIJYDxJxlMS+feFyu6Dd9qgz5AE0m2RIaku5AXLg2ymbsDz4uTNf/gwJXtP9kfTp54OLJaXvC/PNiOnduNwL89xYGODNE85w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HWTX8eZ6; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HWTX8eZ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1z1f758Vz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 16:27:18 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CNQNon015965;
	Wed, 13 Aug 2025 06:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=qdcq5ZcPgQ2wmd4+LkAjaTVNVpquUFZSKJxd9KBdz
	yQ=; b=HWTX8eZ6EMtyJRT63BpRKAp0W6VhYFr+lTfVjP3VLKmi7x1tLgFc9r91K
	2TgCsPpfNxtQzGVjVELYDqgctsTOV1J20VQUEpRl2HIcR0MRvonb9W8oGZhJapLm
	nmOuQ8gMmu+NGfwOkQeB/mOcOHpalXkCTT4uV04PwdMm5+SAm1nMslGAY8zKyFhQ
	E0NpL1Yq2m1UqMoDrlJn9LHcS7iNmB/tl/kuhel5gzE2qfdLQs32k+f+NF81vwZT
	JujFvjNUxpGbIXlDhKBQBjBdgTP7ZEiRADuDc/lOlxiZJKWQSY7KCfoMUMb5Euai
	+Bq7UBZfdYSdgJFfcfHszpTtY3yEQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dvrp2nks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 06:26:49 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57D4b4Ko017612;
	Wed, 13 Aug 2025 06:26:48 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48ekc3np0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 06:26:48 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57D6QlqB29885118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Aug 2025 06:26:47 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2F4058058;
	Wed, 13 Aug 2025 06:26:47 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A13858059;
	Wed, 13 Aug 2025 06:26:42 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.10.70])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Aug 2025 06:26:41 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu
Subject: [PATCH v16 00/13] Support page table check on PowerPC
Date: Wed, 13 Aug 2025 16:26:01 +1000
Message-ID: <20250813062614.51759-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIxOSBTYWx0ZWRfXxJ4h26eRsNEg
 jgmwyYuWumWKpAav/eruIyU9OcsAnnDIk2Q2Sqivf1sTCFt6ezY7Ud8dqqtj/h198Hufi6Y2wRC
 iycpf2ezWZgsNWWc06Fq8mMaU89aeB0BmWSHo9INkOnhwchCohWguk2qfMSW1WNPz1pE2Rer82d
 n98W4DjkPI2kLCgpcRzDsJSLwTqDc3rcsp10cnqxcumxeJwbqBR46HWUpwH+ccBnSXQ9b8PNdjt
 yrl2yb90IoqAYe3qtEn4YJDmgQllaScTYNaS9fWCN84vTbbiPWW9LeHgB6T9CPXft6ZH8uAh1Iv
 4gFIgd9b3ybIvbaoI8I44Lrl8MrzZyEvxRYOmSrucz5YTqOzopd7ITDauGZ8Ws1X3dcHQhLXwKD
 Rl5qw2DR
X-Authority-Analysis: v=2.4 cv=GrpC+l1C c=1 sm=1 tr=0 ts=689c3029 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=c5s30AdFp4CnpOY87z8A:9
X-Proofpoint-GUID: neQMZGXBZF_zH6QiKHO7m0NapX97GL8G
X-Proofpoint-ORIG-GUID: neQMZGXBZF_zH6QiKHO7m0NapX97GL8G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120219
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[Andrew: as previously discussed, are we still happy to take this via mm?
Maddy has acked the powerpc changes.]

Support page table check on all PowerPC platforms. This works by
serialising assignments, reassignments and clears of page table
entries at each level in order to ensure that anonymous mappings
have at most one writable consumer, and likewise that file-backed
mappings are not simultaneously also anonymous mappings.

In order to support this infrastructure, a number of stubs must be
defined for all powerpc platforms. Additionally, separate set_pte_at()
and set_pte_at_unchecked(), to allow for internal, uninstrumented mappings.

On some PowerPC platforms, implementing {pte,pmd,pud}_user_accessible_page()
requires the address. We revert previous changes that removed the address
parameter from various interfaces, and add it to some other interfaces,
in order to allow this.

(This series was initially written by Rohan McLure, who has left IBM and
is no longer working on powerpc.)

v16:
 * Rebase on mainline

v15:
 * Rebase on mainline, including commit 91e40668e70a
   ("mm/page_table_check: Batch-check pmds/puds just like ptes") and
   associated arm64 changes
 * Clarify/fix some commit messages
 * Fix handling of address in a loop in __page_table_check_ptes_set()
Link: https://lore.kernel.org/all/20250625063753.77511-1-ajd@linux.ibm.com/

v14:
 * Fix a call to page_table_check_pud_set() that was missed (akpm)
Link: https://lore.kernel.org/all/20250411054354.511145-1-ajd@linux.ibm.com/

v13:
 * Rebase on mainline
 * Don't use set_pte_at_unchecked() for early boot purposes (Pasha)
Link: https://lore.kernel.org/linuxppc-dev/20250211161404.850215-1-ajd@linux.ibm.com/

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

Andrew Donnellan (2):
  arm64/mm: Add addr parameter to __set_ptes_anysz()
  arm64/mm: Add addr parameter to __ptep_get_and_clear_anysz()

Rohan McLure (11):
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pud[s]_set()
  mm/page_table_check: Reinstate address parameter in
    [__]page_table_check_pmd[s]_set()
  mm/page_table_check: Provide addr parameter to
    page_table_check_ptes_set()
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

 arch/arm64/include/asm/pgtable.h             | 46 ++++++-------
 arch/arm64/mm/hugetlbpage.c                  | 17 ++---
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h | 12 +++-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 62 +++++++++++++++---
 arch/powerpc/include/asm/nohash/pgtable.h    | 13 +++-
 arch/powerpc/include/asm/pgtable.h           | 19 ++++++
 arch/powerpc/mm/book3s64/hash_pgtable.c      |  4 ++
 arch/powerpc/mm/book3s64/pgtable.c           | 17 +++--
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  9 ++-
 arch/powerpc/mm/pgtable.c                    | 12 ++++
 arch/riscv/include/asm/pgtable.h             | 20 +++---
 arch/x86/include/asm/pgtable.h               | 22 +++----
 include/linux/page_table_check.h             | 69 ++++++++++++--------
 include/linux/pgtable.h                      | 10 +--
 mm/page_table_check.c                        | 41 ++++++------
 16 files changed, 248 insertions(+), 126 deletions(-)

-- 
2.50.1

