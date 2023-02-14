Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C9C69563E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 03:01:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PG4FD6rzmz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 13:01:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p15Oz5X2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p15Oz5X2;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PG4DF75Pyz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 13:00:29 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E1i5B0029021;
	Tue, 14 Feb 2023 02:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=/DM3FVlZbPXtqkzousnu5fccaSV1xJFEvU8WmS7K+lE=;
 b=p15Oz5X2Oy5dj0VQHI+3J90YlRsovlJISgDEVe1tYBSj1HfeLDgV1Jk9X+DsabVR3d65
 dWFiumXGSXweNEa6UjQ9MDTHfaYyJRZ/sSsXZ6nTkF5m+BLwoiSZluohnTmYJMDvKAyy
 JJxBp8hNMTEV3kLuv0kKemlgerDGFSjIU5XkSq/s7WWDV2A3P1i5IN6rWlIBqrNFiqUK
 Mdcq2X+gz7pK/0FLiVfmHdLnBdFarE/BWpuKnrT6cxmLd/023scnloug/KeWyqPsV6RZ
 v/3nqSkaUVnnKCk1x5qCjrCK7TFvH1NMlSI2qHrc8dvRGaV04lYQzsR9HbXxrmBNys3d gg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nr0w2gb4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 02:00:19 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DC7qlr011623;
	Tue, 14 Feb 2023 02:00:18 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3np2n6uc25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 02:00:18 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31E20FDk44957956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Feb 2023 02:00:15 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE19820040;
	Tue, 14 Feb 2023 02:00:15 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B50020043;
	Tue, 14 Feb 2023 02:00:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Feb 2023 02:00:15 +0000 (GMT)
Received: from civic.. (unknown [9.177.28.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0D49D602EB;
	Tue, 14 Feb 2023 13:00:08 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 0/7] Support page table check
Date: Tue, 14 Feb 2023 12:59:32 +1100
Message-Id: <20230214015939.1853438-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: T4DiIvqLRoVex_hY6CAUIzT0ThT37fVa
X-Proofpoint-GUID: T4DiIvqLRoVex_hY6CAUIzT0ThT37fVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_13,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 impostorscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140005
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Support the page table check sanitiser on all PowerPC platforms. This
sanitiser works by serialising assignments, reassignments and clears of
page table entries at each level in order to ensure that anonymous
mappings have at most one writable consumer, and likewise that
file-backed mappings are not simultaneously also anonymous mappings.

In order to support this infrastructure, a number of stubs must be
defined for all powerpc platforms. Additionally, seperate set_pte_at
and set_pte, to allow for internal, uninstrumented mappings.

v6:
 * Support huge pages and p{m,u}d accounting.
 * Remove instrumentation from set_pte from kernel internal pages.
 * 64s: Implement pmdp_collapse_flush in terms of __pmdp_collapse_flush
   as access to the mm_struct * is required.

v5: 
Link:

Rohan McLure (7):
  powerpc: mm: Separate set_pte, set_pte_at for internal, external use
  powerpc/64s: mm: Introduce __pmdp_collapse_flush with mm_struct
    argument
  powerpc: mm: Replace p{u,m,4}d_is_leaf with p{u,m,4}_leaf
  powerpc: mm: Implement p{m,u,4}d_leaf on all platforms
  powerpc: mm: Add common pud_pfn stub for all platforms
  powerpc: mm: Add p{te,md,ud}_user_accessible_page helpers
  powerpc: mm: Support page table check

 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h | 17 +++-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 88 +++++++++++++-------
 arch/powerpc/include/asm/book3s/pgtable.h    |  4 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h | 12 ++-
 arch/powerpc/include/asm/nohash/64/pgtable.h | 24 +++++-
 arch/powerpc/include/asm/nohash/pgtable.h    | 10 ++-
 arch/powerpc/include/asm/pgtable.h           | 61 +++++++++-----
 arch/powerpc/kvm/book3s_64_mmu_radix.c       | 12 +--
 arch/powerpc/mm/book3s64/hash_pgtable.c      |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c           | 16 ++--
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 24 +++---
 arch/powerpc/mm/nohash/book3e_pgtable.c      |  2 +-
 arch/powerpc/mm/pgtable.c                    | 10 +--
 arch/powerpc/mm/pgtable_32.c                 |  2 +-
 arch/powerpc/mm/pgtable_64.c                 |  6 +-
 arch/powerpc/xmon/xmon.c                     |  6 +-
 17 files changed, 204 insertions(+), 93 deletions(-)

-- 
2.37.2

