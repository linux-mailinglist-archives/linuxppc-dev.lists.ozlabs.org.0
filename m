Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 386B3697426
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 03:08:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGhMG0B9nz3cdn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:08:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RuWRcl6w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RuWRcl6w;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGhGB0sqSz3cJK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 13:04:17 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31EN2JYE001737;
	Wed, 15 Feb 2023 02:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=d/sj0DlFoxYrpEXXImqu8Aj2XxlRAXPs6SDUKypeHqQ=;
 b=RuWRcl6wnp6WPpJ1SrOaC3sL8A4EqVnGaDkbFFmHrbj6Mk/mnjDUoS1F3G5/K8bYI7Aj
 3VzioMjzh/2y+I3JeDPRum28vQtiRhyAyb0/SNc+ISK7HC9lJXyf5xRqAgpm6JdLpVxs
 SPk2ktwgMifnx/ePtddX6w+IEAvVgk/sb/3k0V94lgJVzq8SpKeXsjW1tnJJ1UNBu35S
 c6W3vzopnyVercP/6P0LaknmNiuptg98jUDrr9BLgkdLv+BQ30lEEBWk80gfG6rbqxa5
 j1cWobvIqOlFPDSBl1MWWtNSOamc0DZSWYQv6mN4ae8Nvas31Uo7Y8NDwftiXnPioGsO sw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrkme3ex6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 02:04:08 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31EMO8U7009973;
	Wed, 15 Feb 2023 02:04:07 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3np2n6bhf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 02:04:06 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31F244QV25493948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Feb 2023 02:04:04 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 612A820043;
	Wed, 15 Feb 2023 02:04:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE54120040;
	Wed, 15 Feb 2023 02:04:03 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Feb 2023 02:04:03 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 88DD2600D2;
	Wed, 15 Feb 2023 13:04:01 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 0/7] Support page table check
Date: Wed, 15 Feb 2023 13:01:48 +1100
Message-Id: <20230215020155.1969194-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XgXQza37d7hbCih24_M9TfzsxYXpYHWP
X-Proofpoint-GUID: XgXQza37d7hbCih24_M9TfzsxYXpYHWP
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_17,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302150017
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

v7:
 * Remove use of extern in set_pte prototypes
 * Clean up pmdp_collapse_flush macro
 * Replace set_pte_at with static inline function
 * Fix commit message for patch 7

v6:
 * Support huge pages and p{m,u}d accounting.
 * Remove instrumentation from set_pte from kernel internal pages.
 * 64s: Implement pmdp_collapse_flush in terms of __pmdp_collapse_flush
   as access to the mm_struct * is required.
Link: https://lore.kernel.org/linuxppc-dev/20230214015939.1853438-1-rmclure@linux.ibm.com/

v5:
Link: https://lore.kernel.org/linuxppc-dev/20221118002146.25979-1-rmclure@linux.ibm.com/

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
 arch/powerpc/include/asm/book3s/64/pgtable.h | 85 +++++++++++++-------
 arch/powerpc/include/asm/book3s/pgtable.h    |  3 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h | 12 ++-
 arch/powerpc/include/asm/nohash/64/pgtable.h | 24 +++++-
 arch/powerpc/include/asm/nohash/pgtable.h    |  9 ++-
 arch/powerpc/include/asm/pgtable.h           | 60 +++++++++-----
 arch/powerpc/kvm/book3s_64_mmu_radix.c       | 12 +--
 arch/powerpc/mm/book3s64/hash_pgtable.c      |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c           | 16 ++--
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 24 +++---
 arch/powerpc/mm/nohash/book3e_pgtable.c      |  2 +-
 arch/powerpc/mm/pgtable.c                    |  9 +--
 arch/powerpc/mm/pgtable_32.c                 |  2 +-
 arch/powerpc/mm/pgtable_64.c                 |  6 +-
 arch/powerpc/xmon/xmon.c                     |  6 +-
 17 files changed, 197 insertions(+), 93 deletions(-)

-- 
2.37.2

