Return-Path: <linuxppc-dev+bounces-14868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F9CCCEC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 18:10:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXHGn60GMz2xrM;
	Fri, 19 Dec 2025 04:10:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766077809;
	cv=none; b=WidMF78UsutgcCKJAfT5SbZ+yUbtEtjnrLxgMg7ekIfy3Yyil5FoQx8iHATuGJL5KVr4Q3dwiu2UUAeNeRxh1ilQZOToFxqRwPboG0P/xx+NmmAs6BZkdRfZI4ldlYUvKLBYAkWK7xa/tMUuHRGqQOPeeUuZ84FCpQXjGIrsIg5tugOSR7/y5+rXbUzjtpFV9CNruPpbIdakYTcXG2ZpC0nq3pERATCdkXGLPtYTjRzceWGwMbwYC7u7FYQloDz8MFv69myH/51mQfpiXQ21dvi8Q+wpqR3sLwjJg6B11WzP7xuesyusp95W1zssF8HXAkZMpgxi1oUSyUxzVSAtvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766077809; c=relaxed/relaxed;
	bh=3qXHqMtTB9ltdJ4AmdeSEKbv9oV6xQJncvbPBmMHKRw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h+Nd3r+Bbdbv3pBmO5AnCjx/2BuGpRbC9toxZGWPhwsgkplQ+jkMwMkC8p5D98jH3S+iFRIAWZDArKe0ZJDpkIikOUoP7xRl+Z7+2LONYJaddIpVWpfk/lU0hKgCqkSnf41LH9u9tZ3kKZIWZyKZQYmQuev4IClehy7ytWKBm3jdhrzFnnjuUluHMu9WXh4T/u/PJV7Y1B/94aI+73+1lSIuabuSbeTe3FQrN1ctrg8wkcfgGQmF1jBcXYnBYPscBERl8n6xUoTGO4MqJO8CP713P+CftURI9BefPUcEfEoqxmQfKcufjWhQYqqhUzS9p2wqnga1DHqaxdjWg7d6Nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gevpSQAO; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gevpSQAO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXHGm55HYz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 04:10:08 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BICj7Ul029661;
	Thu, 18 Dec 2025 17:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=3qXHqMtTB9ltdJ4AmdeSEKbv9oV6
	xQJncvbPBmMHKRw=; b=gevpSQAOylm9BL9mlRlxQ1b4ZhGutmYNNDlYG3y1fHUu
	WQwvdKsHCBybYm9lbUgvi69GOU9k013uchHvSqp5yyh7dEAjbCim4u8D+ChTESX0
	pEvriBh2N2QEL/UemZYwdN5OIEJqNYmyk1LIKovKw8NEP9f/pHU7l2SzIZo4CKu9
	sSEpEsVQ2M+s5xGd+BTwEzoBJO0vjER5Q66CLtnW4/3iJELX5evnF3AoFxE/gU0E
	KzopsHsulLmQIHGI7hT9Q89a2m850Dj+BSI26kwTOhW0sdzjWuDE8R7aaXg8K71O
	k8xv3s6aN0P+Datr2VhgHDFhUTnkKI9H3a3wKboRnQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0ytvkv5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 17:09:54 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BIH3fxo021273;
	Thu, 18 Dec 2025 17:09:54 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0ytvkv5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 17:09:53 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIH8fmL002752;
	Thu, 18 Dec 2025 17:09:52 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1kfnhhnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 17:09:52 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BIH9pnq62390774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 17:09:51 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16F4158056;
	Thu, 18 Dec 2025 17:09:51 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B86A75803F;
	Thu, 18 Dec 2025 17:09:44 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.16.51])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Dec 2025 17:09:44 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
Subject: [PATCH v18 00/12] Support page table check on PowerPC
Date: Fri, 19 Dec 2025 04:09:32 +1100
Message-Id: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MUQqEMBDFriLzbcEpK0y9iojU+tRBUWlFFsS7b
 9nPBJKHEqIiUVM8FHFr0mPPwFIWFBa/zzA6ZkG2sjVzVZtzvvywoQ8LwtrfLBGDTzDWyyQi7Jz
 7UK7PiEm//3Xbve8PVaYd4GoAAAA=
X-Change-ID: 20251105-pgtable_check_v18rebase-2a8f88819994
To: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>,
        Christophe Leroy <chleroy@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org,
        Nicholas Miehlbradt <nicholas@linux.ibm.com>,
        Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
        Andrew Donnellan <andrew+kernel@donnellan.id.au>,
        Srish Srinivasan <ssrish@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX0zWJPwaLJwwj
 kXZIItohL45FPAkrKztyGDhGhGAcV16ENJicpIq6gK0LXpozE0kprNKO/o/z5dwnVzACk+2pRXg
 e+QQAgYB8Z3c0hGk6E6ifpEuDU49ciaoemQWTDxSS26I1iQTXfhEnZYb9uFiF4TFmNtquDBH8no
 9nqWsXJACV83SZ7AupHbCcwRBxlRfcj49/G/r0wmR8xWRC0pGa/czMf2+8m7+Fgq0eFBOH2CsWF
 xjxRF3K4QnofitBx9/s64JE3oHqV7MRT/2/cPChsNDp7AZBRKO+2qAIUuuCvmGZCWqHGeFXNXYf
 eJ9EjOETtWKIDqvlSK2Qh+/G6z3yCopU5JcXSoBp6yBsuCGFSgywbhuE8ZI7KdGfQ510PWu2BKL
 MZsHdC/uofUsbh9I//CZv0ePDdkLwQ==
X-Proofpoint-ORIG-GUID: xWFzxTFh9JrKjMCDqxqIb6OwLeB7zeEn
X-Authority-Analysis: v=2.4 cv=QtRTHFyd c=1 sm=1 tr=0 ts=69443562 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=_RRA-zlgvYRk8qWLakMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2f63J9L2Mz8rg09p56gOjc0dln3kHv1e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[I will be leaving IBM in about a month from now, and will also be on leave
for most of that time starting tomorrow. I've cc'd my personal email, which
I am going to use for any kernel development I do after I leave, and also
Srish Srinivasan, who will be taking over some of my work.]

Support page table check on PowerPC. Page table check tracks the usage of
of page table entries at each level to ensure that anonymous mappings have
at most one writable consumer, and likewise that file-backed mappings are
not simultaneously also anonymous mappings.

In order to support this infrastructure, a number of helpers or stubs must be
defined or updated for all powerpc platforms. Additionally, we separate
set_pte_at() and set_pte_at_unchecked(), to allow for internal, uninstrumented
mappings.

On some PowerPC platforms, implementing {pte,pmd,pud}_user_accessible_page()
requires the address. We revert previous changes that removed the address
parameter from various interfaces, and add it to some other interfaces,
in order to allow this.

For now, we don't allow page table check alongside HUGETLB_PAGE, due to the
arch-specific complexity of set_huge_page_at(). (I'm sure I could figure
this out, but I have to get this version on this list before I leave my job.)

This series was initially written by Rohan McLure, who has left IBM and
is no longer working on powerpc.

v18:
 * Rebase on mm-new
 * Add instrumentation for pudp_invalidate()
 * Add cleanup patch to use pte_advance_pfn()
 * Move p{m,u}d_user_accessible_page() to a more sensible place in the code
 * Disable when HUGETLB_PAGE is enabled

v17:
 * Rebase on mm-new to fix build failure on commit 3f3806eff23f ("riscv: use an
   atomic xchg in pudp_huge_get_and_clear()")
 * Remove patch 10 ("powerpc: mm: Add pud_pfn() stub"), as the original
   reasoning for the stub is now wrong (pud_pfn() is now used more broadly in
   generic code, and commit 35a76f5c0863 ("mm/arch: provide pud_pfn()
   fallback") now provides a generic fallback. This fixes the build failure on
   some powerpc platforms (0day)
Link: https://lore.kernel.org/all/20250909091335.183439-1-ajd@linux.ibm.com/

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

v5: https://lore.kernel.org/linuxppc-dev/20221118002146.25979-1-rmclure@linux.ibm.com/

---
Andrew Donnellan (2):
      arm64/mm: Add addr parameter to __set_ptes_anysz()
      arm64/mm: Add addr parameter to __ptep_get_and_clear_anysz()

Rohan McLure (10):
      mm/page_table_check: Reinstate address parameter in [__]page_table_check_pud[s]_set()
      mm/page_table_check: Reinstate address parameter in [__]page_table_check_pmd[s]_set()
      mm/page_table_check: Provide addr parameter to page_table_check_ptes_set()
      mm/page_table_check: Reinstate address parameter in [__]page_table_check_pud_clear()
      mm/page_table_check: Reinstate address parameter in [__]page_table_check_pmd_clear()
      mm/page_table_check: Reinstate address parameter in [__]page_table_check_pte_clear()
      mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
      powerpc/mm: Implement *_user_accessible_page() for ptes
      powerpc/mm: Use set_pte_at_unchecked() for internal usages
      powerpc/mm: Support page table check

 arch/arm64/include/asm/pgtable.h             | 46 +++++++++----------
 arch/arm64/mm/hugetlbpage.c                  | 17 +++----
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h | 12 ++++-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 62 +++++++++++++++++++++----
 arch/powerpc/include/asm/nohash/pgtable.h    | 13 +++++-
 arch/powerpc/include/asm/pgtable.h           | 10 ++++
 arch/powerpc/mm/book3s64/hash_pgtable.c      |  4 ++
 arch/powerpc/mm/book3s64/pgtable.c           | 25 ++++++----
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  9 ++--
 arch/powerpc/mm/pgtable.c                    | 12 +++++
 arch/riscv/include/asm/pgtable.h             | 22 ++++-----
 arch/x86/include/asm/pgtable.h               | 22 ++++-----
 include/linux/page_table_check.h             | 69 ++++++++++++++++------------
 include/linux/pgtable.h                      | 10 ++--
 mm/page_table_check.c                        | 41 +++++++++--------
 16 files changed, 245 insertions(+), 130 deletions(-)
---
base-commit: c224625ec6f8a0476ffffc09807f4d717ba9cc93
change-id: 20251105-pgtable_check_v18rebase-2a8f88819994


--
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited


