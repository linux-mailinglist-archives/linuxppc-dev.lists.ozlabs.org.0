Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FD1253C75
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 06:12:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcTns0M0YzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 14:12:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mup4mriw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcTlj0F5DzDqNx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 14:10:08 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R42f95091289; Thu, 27 Aug 2020 00:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=eamoy8t8e5z3dbSg/POPeE/7O38sAQMmN5ddClQFI8Q=;
 b=mup4mriwHCZCyfd/XmQT+bZ4WnFvdPcUhkV2hg5FGA9Vu4n+3lYPWIHdRRDDrAuFf19G
 38t8j/qeJiPv4bGZvLvpW/KKDEL7hKccqs3eEOwKkB7KQ2n/H/NzlOYy0lyNJgNf1Wrb
 8HTk+AmjmgOx8lx9HPhkVSXcUXo31YTO6LR+/AXtEV6UBwk4jDNOE6rBbnFcWqf8ezDL
 2YK3hiHcpmq95tV6b0JzmkCInJF/mKz1EPuQnSDiq2zJSo00TD2fXG0C/nv3gkXIAHLC
 V7p6cxY7ctqGreZWXDFf8RgjU4wnX6jfOkyZ5cjsPiQwKtjQZoyA78g8+WwRQQ+vt8gO 4w== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3365cy8996-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 00:10:02 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R47tEe006911;
 Thu, 27 Aug 2020 04:10:01 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 335kvcgr6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:10:01 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R4A0Ld50200962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 04:10:00 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 889FF2805A;
 Thu, 27 Aug 2020 04:10:00 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27E2B28058;
 Thu, 27 Aug 2020 04:09:59 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.74.195])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 04:09:58 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 00/23] Kernel userspace access/execution prevention with
 hash translation
Date: Thu, 27 Aug 2020 09:39:08 +0530
Message-Id: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_14:2020-08-26,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270028
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series implements KUAP and KUEP with hash translation mode using
memory keys. The kernel now uses memory protection key 3 to control access
to the kernel. Kernel page table entries are now configured with key 3.
Access to locations configured with any other key value is denied when in
kernel mode (MSR_PR=0). This includes userspace which is by default configured
with key 0.

null-syscall benchmark results:

With smap/smep disabled:
Without patch:
	845.29 ns    2451.44 cycles
With patch series:
	858.38 ns    2489.30 cycles

With smap/smep enabled:
Without patch:
	NA
With patch series:
	1021.51 ns    2962.44 cycles

Changes from v4:
* Repost with other pkey related changes split out as a separate series.
* Improve null-syscall benchmark by optimizing SPRN save and restore.

Changes from v3:
* Fix build error reported by kernel test robot <lkp@intel.com>

Changes from v2:
* Rebase to the latest kernel.
* Fixed a bug with disabling KUEP/KUAP on kernel command line
* Added a patch to make kup key dynamic.

Changes from V1:
* Rebased on latest kernel

Aneesh Kumar K.V (23):
  powerpc: Add new macro to handle NESTED_IFCLR
  KVM: PPC: BOOK3S: PR: Ignore UAMOR SPR
  powerpc/book3s64/kuap/kuep: Make KUAP and KUEP a subfeature of
    PPC_MEM_KEYS
  powerpc/book3s64/kuap/kuep: Move uamor setup to pkey init
  powerpc/book3s64/kuap: Move KUAP related function outside radix
  powerpc/book3s64/kup: Use the correct #ifdef when including headers
  powerpc/book3s64/kuep: Move KUEP related function outside radix
  powerpc/book3s64/kuap: Rename MMU_FTR_RADIX_KUAP to MMU_FTR_KUAP
  powerpc/book3s64/kuap: Use Key 3 for kernel mapping with hash
    translation
  powerpc/exec: Set thread.regs early during exec
  powerpc/book3s64/pkeys: Store/restore userspace AMR/IAMR correctly on
    entry and exit from kernel
  powerpc/book3s64/pkeys: Inherit correctly on fork.
  powerpc/book3s64/pkeys: Reset userspace AMR correctly on exec
  powerpc/ptrace-view: Use pt_regs values instead of thread_struct based
    one.
  powerpc/book3s64/pkeys: Don't update SPRN_AMR when in kernel mode.
  powerpc/book3s64/kuap: Restrict access to userspace based on userspace
    AMR
  powerpc/book3s64/kuap: Improve error reporting with KUAP
  powerpc/book3s64/kuap: Use Key 3 to implement KUAP with hash
    translation.
  powerpc/book3s64/kuep: Use Key 3 to implement KUEP with hash
    translation.
  powerpc/book3s64/hash/kuap: Enable kuap on hash
  powerpc/book3s64/hash/kuep: Enable KUEP on hash
  powerpc/book3s64/hash/kup: Don't hardcode kup key
  powerpc/book3s64/pkeys: Optimize FTR_KUAP and FTR_KUEP disabled case

 arch/powerpc/include/asm/book3s/32/kup.h      |   4 +-
 .../powerpc/include/asm/book3s/64/hash-pkey.h |  10 +-
 arch/powerpc/include/asm/book3s/64/hash.h     |   2 +-
 .../powerpc/include/asm/book3s/64/kup-radix.h | 185 --------
 arch/powerpc/include/asm/book3s/64/kup.h      | 409 ++++++++++++++++++
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
 arch/powerpc/include/asm/book3s/64/mmu.h      |   2 +-
 arch/powerpc/include/asm/book3s/64/pkeys.h    |   3 +
 arch/powerpc/include/asm/feature-fixups.h     |   3 +
 arch/powerpc/include/asm/kup.h                |  14 +-
 arch/powerpc/include/asm/mmu.h                |  16 +-
 arch/powerpc/include/asm/mmu_context.h        |   2 +-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |   4 +-
 arch/powerpc/include/asm/processor.h          |   4 -
 arch/powerpc/include/asm/ptrace.h             |   6 +-
 arch/powerpc/include/asm/thread_info.h        |   2 -
 arch/powerpc/kernel/asm-offsets.c             |   4 +-
 arch/powerpc/kernel/entry_64.S                |   6 +-
 arch/powerpc/kernel/exceptions-64s.S          |   4 +-
 arch/powerpc/kernel/process.c                 |  56 ++-
 arch/powerpc/kernel/ptrace/ptrace-view.c      |   7 +-
 arch/powerpc/kernel/syscall_64.c              |  38 +-
 arch/powerpc/kernel/traps.c                   |   6 -
 arch/powerpc/kvm/book3s_emulate.c             |   6 +
 arch/powerpc/mm/book3s64/Makefile             |   2 +-
 arch/powerpc/mm/book3s64/hash_4k.c            |   2 +-
 arch/powerpc/mm/book3s64/hash_64k.c           |   4 +-
 arch/powerpc/mm/book3s64/hash_hugepage.c      |   2 +-
 arch/powerpc/mm/book3s64/hash_hugetlbpage.c   |   2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c       |   2 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |  10 +-
 arch/powerpc/mm/book3s64/pkeys.c              | 177 +++++---
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  47 +-
 arch/powerpc/mm/fault.c                       |   2 +-
 arch/powerpc/platforms/Kconfig.cputype        |   4 +
 35 files changed, 679 insertions(+), 369 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/book3s/64/kup-radix.h
 create mode 100644 arch/powerpc/include/asm/book3s/64/kup.h

-- 
2.26.2

