Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CA9200AE3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 16:05:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pLD41MbHzDrMT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 00:05:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pL5J5ff4zDr3p
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 23:59:16 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JDcCHk058037; Fri, 19 Jun 2020 09:59:09 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31rvqrbe76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 09:59:08 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JDtPF1023709;
 Fri, 19 Jun 2020 13:59:06 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 31q6c8uaex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 13:59:06 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05JDx3ka15335880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 13:59:03 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 914D6BE053;
 Fri, 19 Jun 2020 13:59:04 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74454BE056;
 Fri, 19 Jun 2020 13:59:02 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.220.36])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 13:59:01 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 00/26] powerpc/book3s/64/pkeys: Simplify the code
Date: Fri, 19 Jun 2020 19:28:24 +0530
Message-Id: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_11:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 bulkscore=0 cotscore=-2147483648 mlxscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006190096
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series update the pkey subsystem with more documentation and
rename variables so that it is easy to follow the code. We drop the changes
to support KUAP/KUEP with hash translation in this update. The changes
are adding 200 cycles to null syscalls benchmark and I want to look at that
closely before requesting a merge. The rest of the patches are included
in this series. This should avoid having to carry a large patchset across
the upstream merge. Some of the changes in here make the hash KUEP/KUAP
addition simpler.

Changes from v4:
* Drop hash KUAP/KUEP changes.

Changes from v3:
* Fix build error reported by kernel test robot <lkp@intel.com>

Changes from v2:
* Rebase to the latest kernel.
* Fixed a bug with disabling KUEP/KUAP on kernel command line
* Added a patch to make kup key dynamic.

Changes from v1:
* Rebased on latest kernel

Aneesh Kumar K.V (26):
  powerpc/book3s64/pkeys: Fixup bit numbering
  powerpc/book3s64/pkeys: pkeys are supported only on hash on book3s.
  powerpc/book3s64/pkeys: Move pkey related bits in the linux page table
  powerpc/book3s64/pkeys: Explain key 1 reservation details
  powerpc/book3s64/pkeys: Simplify the key initialization
  powerpc/book3s64/pkeys: Prevent key 1 modification from userspace.
  powerpc/book3s64/pkeys: kill cpu feature key CPU_FTR_PKEY
  powerpc/book3s64/pkeys: Convert execute key support to static key
  powerpc/book3s64/pkeys: Simplify pkey disable branch
  powerpc/book3s64/pkeys: Convert pkey_total to max_pkey
  powerpc/book3s64/pkeys: Make initial_allocation_mask static
  powerpc/book3s64/pkeys: Mark all the pkeys above max pkey as reserved
  powerpc/book3s64/pkeys: Enable MMU_FTR_PKEY
  powerpc/book3s64/kuep: Add MMU_FTR_KUEP
  powerpc/book3s64/pkeys: Use execute_pkey_disable static key
  powerpc/book3s64/pkeys: Use MMU_FTR_PKEY instead of pkey_disabled
    static key
  powerpc/book3s64/keys: Print information during boot.
  powerpc/book3s64/keys/kuap: Reset AMR/IAMR values on kexec
  powerpc/book3s64/kuap: Move KUAP related function outside radix
  powerpc/book3s64/kuep: Move KUEP related function outside radix
  powerpc/book3s64/kuap: Rename MMU_FTR_RADIX_KUAP to MMU_FTR_KUAP
  powerpc/book3s64/kuap/kuep: Make KUAP and KUEP a subfeature of
    PPC_MEM_KEYS
  powerpc/book3s64/kuap: Move UAMOR setup to key init function
  powerpc/selftest/ptrave-pkey: Rename variables to make it easier to
    follow code
  powerpc/selftest/ptrace-pkey: Update the test to mark an invalid pkey
    correctly
  powerpc/selftest/ptrace-pkey: IAMR and uamor cannot be updated by
    ptrace

 arch/powerpc/include/asm/book3s/64/hash-4k.h  |  21 +-
 arch/powerpc/include/asm/book3s/64/hash-64k.h |  12 +-
 .../powerpc/include/asm/book3s/64/hash-pkey.h |  32 ++
 .../asm/book3s/64/{kup-radix.h => kup.h}      |  70 ++--
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   8 +-
 arch/powerpc/include/asm/book3s/64/mmu.h      |   6 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  17 +-
 arch/powerpc/include/asm/book3s/64/pkeys.h    |  25 ++
 arch/powerpc/include/asm/cputable.h           |  13 +-
 arch/powerpc/include/asm/kup.h                |  16 +-
 arch/powerpc/include/asm/mmu.h                |  17 +-
 arch/powerpc/include/asm/pkeys.h              |  65 +---
 arch/powerpc/include/asm/processor.h          |   1 -
 arch/powerpc/include/asm/ptrace.h             |   2 +-
 arch/powerpc/kernel/asm-offsets.c             |   2 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c             |   6 -
 arch/powerpc/kernel/misc_64.S                 |  14 -
 arch/powerpc/kernel/prom.c                    |   5 +
 arch/powerpc/kernel/ptrace/ptrace-view.c      |  17 +-
 arch/powerpc/kernel/smp.c                     |   5 +
 arch/powerpc/kernel/syscall_64.c              |   2 +-
 arch/powerpc/kexec/core_64.c                  |   3 +
 arch/powerpc/mm/book3s64/pgtable.c            |   3 +
 arch/powerpc/mm/book3s64/pkeys.c              | 315 +++++++++++-------
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  36 --
 arch/powerpc/platforms/Kconfig.cputype        |   4 +-
 .../selftests/powerpc/ptrace/ptrace-pkey.c    |  53 ++-
 27 files changed, 448 insertions(+), 322 deletions(-)
 create mode 100644 arch/powerpc/include/asm/book3s/64/hash-pkey.h
 rename arch/powerpc/include/asm/book3s/64/{kup-radix.h => kup.h} (78%)
 create mode 100644 arch/powerpc/include/asm/book3s/64/pkeys.h

-- 
2.26.2

