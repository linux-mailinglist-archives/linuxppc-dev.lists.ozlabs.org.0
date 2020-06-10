Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B51F5198
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 11:54:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hj5P3qG0zDqC5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 19:54:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hj2d4WlyzDqY3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 19:52:25 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05A9XV4d101817; Wed, 10 Jun 2020 05:52:19 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31jbvyn13t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 05:52:18 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05A9jqMx009858;
 Wed, 10 Jun 2020 09:52:18 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 31hdb3mwxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 09:52:18 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05A9qH1954264314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 09:52:17 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87B12112064;
 Wed, 10 Jun 2020 09:52:17 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F0B9112063;
 Wed, 10 Jun 2020 09:52:15 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.180.2])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jun 2020 09:52:15 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 00/41] Kernel userspace access/execution prevention with
 hash translation
Date: Wed, 10 Jun 2020 15:21:23 +0530
Message-Id: <20200610095204.608183-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_04:2020-06-10,
 2020-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 cotscore=-2147483648 adultscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006100070
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

This patch series implements KUAP and KUEP with hash translation mode using
memory keys. The kernel now uses memory protection key 3 to control access
to the kernel. Kernel page table entries are now configured with key 3.
Access to locations configured with any other key value is denied when in
kernel mode (MSR_PR=0). This includes userspace which is by default configured
with key 0.

Changes from v2:
* Rebase to the latest kernel.
* Fixed a bug with disabling KUEP/KUAP on kernel command line
* Added a patch to make kup key dynamic.

Changes from V1:
* Rebased on latest kernel

Aneesh Kumar K.V (41):
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
  powerpc/book3s64/kuap: Move KUAP related function outside radix
  powerpc/book3s64/kuep: Move KUEP related function outside radix
  powerpc/book3s64/kuap: Rename MMU_FTR_RADIX_KUAP to MMU_FTR_KUAP
  powerpc/book3s64/kuap/kuep: Make KUAP and KUEP a subfeature of
    PPC_MEM_KEYS
  powerpc/book3s64/kuap: Move UAMOR setup to key init function
  powerpc/book3s64/kuap: Use Key 3 for kernel mapping with hash
    translation
  powerpc/exec: Set thread.regs early during exec
  powerpc/book3s64/pkeys: Store/restore userspace AMR correctly on entry
    and exit from kernel
  powerpc/book3s64/kuep: Store/restore userspace IAMR correctly on entry
    and exit from kernel
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
  powerpc/book3s64/keys: Print information during boot.
  powerpc/selftest/ptrave-pkey: Rename variables to make it easier to
    follow code
  powerpc/selftest/ptrace-pkey: Update the test to mark an invalid pkey
    correctly
  powerpc/selftest/ptrace-pkey: IAMR and uamor cannot be updated by
    ptrace
  powerpc/book3s64/keys/kuap: Reset AMR/IAMR values on kexec
  powerpc/book3s64/hash/kup: Don't hardcode kup key

 arch/powerpc/include/asm/book3s/32/kup.h      |   4 +-
 arch/powerpc/include/asm/book3s/64/hash-4k.h  |  21 +-
 arch/powerpc/include/asm/book3s/64/hash-64k.h |  12 +-
 .../powerpc/include/asm/book3s/64/hash-pkey.h |  24 +
 arch/powerpc/include/asm/book3s/64/hash.h     |   3 +-
 .../powerpc/include/asm/book3s/64/kup-radix.h | 185 --------
 arch/powerpc/include/asm/book3s/64/kup.h      | 386 ++++++++++++++++
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   9 +-
 arch/powerpc/include/asm/book3s/64/mmu.h      |   6 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  17 +-
 arch/powerpc/include/asm/book3s/64/pkeys.h    |  25 ++
 arch/powerpc/include/asm/cputable.h           |  13 +-
 arch/powerpc/include/asm/kup.h                |  20 +-
 arch/powerpc/include/asm/mmu.h                |  17 +-
 arch/powerpc/include/asm/mmu_context.h        |   2 +-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |   4 +-
 arch/powerpc/include/asm/pkeys.h              |  65 +--
 arch/powerpc/include/asm/processor.h          |   5 -
 arch/powerpc/include/asm/ptrace.h             |   6 +-
 arch/powerpc/include/asm/thread_info.h        |   2 -
 arch/powerpc/kernel/asm-offsets.c             |   4 +
 arch/powerpc/kernel/dt_cpu_ftrs.c             |   6 -
 arch/powerpc/kernel/entry_64.S                |   6 +-
 arch/powerpc/kernel/exceptions-64s.S          |   4 +-
 arch/powerpc/kernel/misc_64.S                 |  14 -
 arch/powerpc/kernel/process.c                 |  56 ++-
 arch/powerpc/kernel/prom.c                    |   5 +
 arch/powerpc/kernel/ptrace/ptrace-view.c      |  23 +-
 arch/powerpc/kernel/smp.c                     |   5 +
 arch/powerpc/kernel/syscall_64.c              |  32 +-
 arch/powerpc/kernel/traps.c                   |   6 -
 arch/powerpc/kexec/core_64.c                  |   3 +
 arch/powerpc/mm/book3s64/hash_4k.c            |   2 +-
 arch/powerpc/mm/book3s64/hash_64k.c           |   4 +-
 arch/powerpc/mm/book3s64/hash_hugepage.c      |   2 +-
 arch/powerpc/mm/book3s64/hash_hugetlbpage.c   |   2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c       |   2 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |  10 +-
 arch/powerpc/mm/book3s64/pgtable.c            |   3 +
 arch/powerpc/mm/book3s64/pkeys.c              | 411 +++++++++++-------
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  36 --
 arch/powerpc/mm/fault.c                       |   2 +-
 arch/powerpc/platforms/Kconfig.cputype        |   4 +-
 .../selftests/powerpc/ptrace/ptrace-pkey.c    |  53 +--
 44 files changed, 931 insertions(+), 590 deletions(-)
 create mode 100644 arch/powerpc/include/asm/book3s/64/hash-pkey.h
 delete mode 100644 arch/powerpc/include/asm/book3s/64/kup-radix.h
 create mode 100644 arch/powerpc/include/asm/book3s/64/kup.h
 create mode 100644 arch/powerpc/include/asm/book3s/64/pkeys.h

-- 
2.26.2

