Return-Path: <linuxppc-dev+bounces-11923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B80B4A71A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 11:14:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLdSJ0cNDz3cZ9;
	Tue,  9 Sep 2025 19:14:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757409279;
	cv=none; b=Wx5KyX8qJIAFUueWP/e4Dhc/T1ssrK8ubkyF6Fajsz/Z1TbXxQ0WA9LRFa4yVuYW3fASbmfQ47dsYurkXCPSX8vSJABy3emg6zC3CSrxiydsWz9dfTJhthSqDuwSNj70Bty6OkI4P+QDi9wDyZCArtrA6EF92m9SAhoJ9wugep3StH/ziFRRP0fihd6qtJTwSKDHRne7dRGe2S156Vta//8bDEKpuhwSFG2/Y9zJYblq+x1Bx/J4lP6WUFI9LFqfy4Lr9xXUGRn2h1HpMmdldtgPDA6lly+TqtS28b6BHuhE80YRRjun5j1sIwXH4RhSwxBjR4udTgjuNCva/PMdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757409279; c=relaxed/relaxed;
	bh=Duj4pjxFvbmk0v6rahK8RMiOEFgq0tWnKjVK3kbNkd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hOUiWjol8omefkkUxxSt0kvBv498PhWeL40AKJyPpyZuSZ58Yv78L5ZWMJ4q88nmkYC0qrpt2GIYGak0ozhf9hqM3hBjM4WCrMhUO5Ap1ioN1oZo+jPOeeSgKCoIjomDVQL7p/YgM+1SO8uUDA+iXfs6UkFsVyiqUePkHbRvBBwKEeRqNoeUFfSuTMc20J2V3J34glwlF/Qrp7WXaOv9dhAfczRGtQkZpeFoV3JZdJsHWaj7EDHYHCmkM4ZTWzmJ46IXPJKEDi+W9EGHjJSEhgQWkMArGf2JQzJWXnWXNOxQ5iojpkKv2qMeN7K7mNu3VzhhQacAf0YDD7sGOj6ibA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TJ3muQkJ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TJ3muQkJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLdSH09c5z3bpS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 19:14:38 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588KHS8w031928;
	Tue, 9 Sep 2025 09:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Duj4pjxFvbmk0v6rahK8RMiOEFgq0tWnKjVK3kbNk
	d4=; b=TJ3muQkJnxc/BloT/Cg+szQp9mxxWBMx8DOMkbnlH/m4S6tkJm3hyfrcO
	YxpsYIYrP81ToKNS9SpFeNo0jOZlQ1PHQb8m0PbuAlhfA0xT1kkF02yORW5dLh+d
	aQXAIIfvdgWJ73zd5tsrt71OaKwYpAsZvO0kyQW9zxnl0N+hUSeTWsTI5/8jhK4l
	Wdy7CoSKCg+rE3+jucrCwSRzdiA99okixeNfOMEVlZeUmHv8EPhT5g4iR6pPUvTs
	SVFIgIY3yQehc73Jq6AvyQFyAJiMXphSUk39WQL69fkm86zuDz6QLiIUV//3OrnZ
	kNg66tKSMhqazXcO8BnY5NfhdtLDw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcspgt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 09:14:24 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5895h3si020700;
	Tue, 9 Sep 2025 09:14:23 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 490yp0tg2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 09:14:23 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5899ENoV33096302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 09:14:23 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04AFC5805D;
	Tue,  9 Sep 2025 09:14:23 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEC5658043;
	Tue,  9 Sep 2025 09:14:17 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.2.198])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 09:14:17 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu,
        alexghiti@rivosinc.com
Subject: [PATCH v17 00/12] Support page table check on PowerPC
Date: Tue,  9 Sep 2025 19:13:23 +1000
Message-ID: <20250909091335.183439-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX/M9TtCej7RLe
 SMCNFDggWrCycH8AZjkdkr75NBwHykB3TnoAkDigTz4L/h8FwdtKhAco3FdtFI0e/Qnoh+Mxi+y
 YDe11GybDHYovvKAXnqGQuIcjXHvbGtXj85LOrHirgF4njXXlimtbI2GgPzEsFd7NEjH6+lWNLJ
 Dez5XsNLJ4m3YsBAlAc4ZdB76Z9XmQPAjeXzspOOuk/fs5BH0qLo+uatgq8rSIcXKT3FaSlTWlz
 HqrrVjBICagWuTDpD1+12dJMxWai8d2zaHNsaFDIzjDstpBHl6ruaw2SI73fweaB+OZKJqUtrpK
 FtYCd6kpvUShHkKdxrQVAf5r73li8BoXgU/nV8ufGDhqcCnZqf82tnIrE2WeW0x8L4SSWR3Klv1
 ktr+5QBx
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68bfeff0 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=1UX6Do5GAAAA:8 a=VnNF1IyMAAAA:8
 a=rRHG20brLvp9ZhHRRGIA:9 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-GUID: DdQYcCI9RD8AAiJvj0PlAb_lUvaC9h1n
X-Proofpoint-ORIG-GUID: DdQYcCI9RD8AAiJvj0PlAb_lUvaC9h1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Support page table check on all PowerPC platforms. This works by serialising
assignments, reassignments and clears of page table entries at each level in
order to ensure that anonymous mappings have at most one writable consumer,
and likewise that file-backed mappings are not simultaneously also anonymous
mappings.

In order to support this infrastructure, a number of helpers or stubs must be
defined or updated for all powerpc platforms. Additionally, we separate
set_pte_at() and set_pte_at_unchecked(), to allow for internal, uninstrumented
mappings.

On some PowerPC platforms, implementing {pte,pmd,pud}_user_accessible_page()
requires the address. We revert previous changes that removed the address
parameter from various interfaces, and add it to some other interfaces,
in order to allow this.

Note that on 32 bit systems with CONFIG_KFENCE=y, you need [0] to avoid
possible failures in init code (this is a code patching/static keys issue,
which was discovered by a user testing this series but isn't a bug in page
table check).

(This series was initially written by Rohan McLure, who has left IBM and
is no longer working on powerpc.)

[0] https://lore.kernel.org/linuxppc-dev/4b5e6eb281d7b1ea77619bee17095f905a125168.1757003584.git.christophe.leroy@csgroup.eu/

v17:
 * Rebase on mm-new to fix build failure on commit 3f3806eff23f ("riscv: use an
   atomic xchg in pudp_huge_get_and_clear()")
 * Remove patch 10 ("powerpc: mm: Add pud_pfn() stub"), as the original
   reasoning for the stub is now wrong (pud_pfn() is now used more broadly in
   generic code, and commit 35a76f5c0863 ("mm/arch: provide pud_pfn()
   fallback") now provides a generic fallback. This fixes the build failure on
   some powerpc platforms (0day)

v16:
 * Rebase on mainline
Link: https://lore.kernel.org/all/20250813062614.51759-1-ajd@linux.ibm.com/

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

Rohan McLure (10):
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
  powerpc: mm: Implement *_user_accessible_page() for ptes
  powerpc: mm: Use set_pte_at_unchecked() for internal usages
  powerpc: mm: Support page table check

 arch/arm64/include/asm/pgtable.h             | 46 ++++++-------
 arch/arm64/mm/hugetlbpage.c                  | 17 ++---
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h | 12 +++-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 62 +++++++++++++++---
 arch/powerpc/include/asm/nohash/pgtable.h    | 13 +++-
 arch/powerpc/include/asm/pgtable.h           | 10 +++
 arch/powerpc/mm/book3s64/hash_pgtable.c      |  4 ++
 arch/powerpc/mm/book3s64/pgtable.c           | 17 +++--
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  9 ++-
 arch/powerpc/mm/pgtable.c                    | 12 ++++
 arch/riscv/include/asm/pgtable.h             | 22 +++----
 arch/x86/include/asm/pgtable.h               | 22 +++----
 include/linux/page_table_check.h             | 69 ++++++++++++--------
 include/linux/pgtable.h                      | 10 +--
 mm/page_table_check.c                        | 41 ++++++------
 16 files changed, 240 insertions(+), 127 deletions(-)

-- 
2.51.0

