Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7468142614
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 09:46:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481QJd1lg0zDqXg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 19:46:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481Q4g3j2TzDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 19:36:35 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00K8WCTC012695
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 03:36:33 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xmg7gy6se-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 03:36:33 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sandipan@linux.ibm.com>;
 Mon, 20 Jan 2020 08:36:31 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Jan 2020 08:36:26 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00K8aPUH41287826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jan 2020 08:36:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E61711C05B;
 Mon, 20 Jan 2020 08:36:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B7CE11C05C;
 Mon, 20 Jan 2020 08:36:22 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Jan 2020 08:36:22 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: shuah@kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v17 00/23] selftests, powerpc, x86: Memory Protection Keys
Date: Mon, 20 Jan 2020 14:05:57 +0530
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
x-cbid: 20012008-0012-0000-0000-0000037EF6AE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012008-0013-0000-0000-000021BB32BD
Message-Id: <cover.1579507768.git.sandipan@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-19_08:2020-01-16,
 2020-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001200076
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
Cc: linux-arch@vger.kernel.org, fweimer@redhat.com, linux-mm@kvack.org,
 aneesh.kumar@linux.ibm.com, x86@kernel.org, linuxram@us.ibm.com,
 mhocko@kernel.org, dave.hansen@intel.com, mingo@redhat.com, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Memory protection keys enables an application to protect its address
space from inadvertent access by its own code.

This feature is now enabled on powerpc and has been available since
4.16-rc1. The patches move the selftests to arch neutral directory
and enhance their test coverage.

Tested on powerpc64 and x86_64 (Skylake-SP).

Link to development branch:
https://github.com/sandip4n/linux/tree/pkey-selftests

Changelog
---------
Link to previous version (v16):
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=153824

v17:
	(1) Fixed issues with i386 builds when running on x86_64
	    based on feedback from Dave.
	(2) Replaced patch 6 from previous version with patch 7.
	    This addresses u64 format specifier related concerns
	    that Michael had raised in v15.

v16:
	(1) Rebased on top of latest master.
	(2) Switched to u64 instead of using an arch-dependent
	    pkey_reg_t type for references to the pkey register
	    based on suggestions from Dave, Michal and Michael.
	(3) Removed build time determination of page size based
	    on suggestion from Michael.
	(4) Fixed comment before the definition of __page_o_noops()
	    from patch 13 ("selftests/vm/pkeys: Introduce powerpc
	    support").

v15:
	(1) Rebased on top of latest master.
	(2) Addressed review comments from Dave Hansen.
	(3) Moved code for getting or setting pkey bits to new
	    helpers. These changes replace patch 7 of v14.
	(4) Added a fix which ensures that the correct count of
	    reserved keys is used across different platforms.
	(5) Added a fix which ensures that the correct page size
	    is used as powerpc supports both 4K and 64K pages.

v14:
	(1) Incorporated another round of comments from Dave Hansen.

v13:
	(1) Incorporated comments for Dave Hansen.
	(2) Added one more test for correct pkey-0 behavior.

v12:
	(1) Fixed the offset of pkey field in the siginfo structure for
	    x86_64 and powerpc. And tries to use the actual field
	    if the headers have it defined.

v11:
	(1) Fixed a deadlock in the ptrace testcase.

v10 and prior:
	(1) Moved the testcase to arch neutral directory.
	(2) Split the changes into incremental patches.

Desnes A. Nunes do Rosario (1):
  selftests/vm/pkeys: Fix number of reserved powerpc pkeys

Ram Pai (16):
  selftests/x86/pkeys: Move selftests to arch-neutral directory
  selftests/vm/pkeys: Rename all references to pkru to a generic name
  selftests/vm/pkeys: Move generic definitions to header file
  selftests/vm/pkeys: Fix pkey_disable_clear()
  selftests/vm/pkeys: Fix assertion in pkey_disable_set/clear()
  selftests/vm/pkeys: Fix alloc_random_pkey() to make it really random
  selftests/vm/pkeys: Introduce generic pkey abstractions
  selftests/vm/pkeys: Introduce powerpc support
  selftests/vm/pkeys: Fix assertion in test_pkey_alloc_exhaust()
  selftests/vm/pkeys: Improve checks to determine pkey support
  selftests/vm/pkeys: Associate key on a mapped page and detect access
    violation
  selftests/vm/pkeys: Associate key on a mapped page and detect write
    violation
  selftests/vm/pkeys: Detect write violation on a mapped
    access-denied-key page
  selftests/vm/pkeys: Introduce a sub-page allocator
  selftests/vm/pkeys: Test correct behaviour of pkey-0
  selftests/vm/pkeys: Override access right definitions on powerpc

Sandipan Das (5):
  selftests: vm: pkeys: Fix multilib builds for x86
  selftests: vm: pkeys: Use sane types for pkey register
  selftests: vm: pkeys: Add helpers for pkey bits
  selftests: vm: pkeys: Use the correct huge page size
  selftests: vm: pkeys: Use the correct page size on powerpc

Thiago Jung Bauermann (2):
  selftests/vm/pkeys: Move some definitions to arch-specific header
  selftests/vm/pkeys: Make gcc check arguments of sigsafe_printf()

 tools/testing/selftests/vm/.gitignore         |   1 +
 tools/testing/selftests/vm/Makefile           |  50 ++
 tools/testing/selftests/vm/pkey-helpers.h     | 225 ++++++
 tools/testing/selftests/vm/pkey-powerpc.h     | 136 ++++
 tools/testing/selftests/vm/pkey-x86.h         | 181 +++++
 .../selftests/{x86 => vm}/protection_keys.c   | 696 ++++++++++--------
 tools/testing/selftests/x86/.gitignore        |   1 -
 tools/testing/selftests/x86/Makefile          |   2 +-
 tools/testing/selftests/x86/pkey-helpers.h    | 219 ------
 9 files changed, 979 insertions(+), 532 deletions(-)
 create mode 100644 tools/testing/selftests/vm/pkey-helpers.h
 create mode 100644 tools/testing/selftests/vm/pkey-powerpc.h
 create mode 100644 tools/testing/selftests/vm/pkey-x86.h
 rename tools/testing/selftests/{x86 => vm}/protection_keys.c (74%)
 delete mode 100644 tools/testing/selftests/x86/pkey-helpers.h

-- 
2.17.1

