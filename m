Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C39971C24F9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:59:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DnjD1D3mzDrM1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:59:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmv02sN1zDrLX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:22:52 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 042AWcQ1078771; Sat, 2 May 2020 07:22:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s45qveyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 07:22:47 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 042BMlfM167405;
 Sat, 2 May 2020 07:22:47 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s45qvey4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 07:22:47 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 042BMiFk016319;
 Sat, 2 May 2020 11:22:46 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 30s0g6ayqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 May 2020 11:22:46 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 042BMiew25755942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 2 May 2020 11:22:44 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A73067805F;
 Sat,  2 May 2020 11:22:44 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3429F7805C;
 Sat,  2 May 2020 11:22:42 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.52.206])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat,  2 May 2020 11:22:41 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 00/28] Kernel userspace access/execution prevention with
 hash translation
Date: Sat,  2 May 2020 16:52:01 +0530
Message-Id: <20200502112229.545331-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-02_06:2020-05-01,
 2020-05-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005020095
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
 bauerman@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series implements KUAP and KUEP with hash translation mode using
memory keys. The kernel now uses memory protection key 3 to control access
to the kernel. Kernel page table entries are now configured with key 3.
Access to locations configured with any other key value is denied when in
kernel mode (MSR_PR=0). This includes userspace which is by default configured
with key 0.

Changes from V1:
* Rebased on latest kernel
* Depends on the below patch sets.

https://lore.kernel.org/linuxppc-dev/20200429065654.1677541-1-npiggin@gmail.com
https://lore.kernel.org/linuxppc-dev/20200428123130.73078-1-mpe@ellerman.id.au
https://lore.kernel.org/linuxppc-dev/20200502111347.541836-1-aneesh.kumar@linux.ibm.com

Aneesh Kumar K.V (28):
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

 arch/powerpc/include/asm/book3s/32/kup.h      |   4 +-
 .../powerpc/include/asm/book3s/64/hash-pkey.h |  24 +-
 arch/powerpc/include/asm/book3s/64/hash.h     |   3 +-
 .../powerpc/include/asm/book3s/64/kup-radix.h | 187 ---------
 arch/powerpc/include/asm/book3s/64/kup.h      | 385 ++++++++++++++++++
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
 arch/powerpc/include/asm/book3s/64/mmu.h      |   6 +
 arch/powerpc/include/asm/book3s/64/pkeys.h    |   2 +-
 arch/powerpc/include/asm/kup.h                |  20 +-
 arch/powerpc/include/asm/mmu.h                |  17 +-
 arch/powerpc/include/asm/mmu_context.h        |   2 +-
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |   4 +-
 arch/powerpc/include/asm/pkeys.h              |  24 +-
 arch/powerpc/include/asm/processor.h          |   5 -
 arch/powerpc/include/asm/ptrace.h             |   6 +-
 arch/powerpc/kernel/asm-offsets.c             |   4 +
 arch/powerpc/kernel/entry_64.S                |   6 +-
 arch/powerpc/kernel/exceptions-64s.S          |   4 +-
 arch/powerpc/kernel/misc_64.S                 |  14 -
 arch/powerpc/kernel/process.c                 |  54 ++-
 arch/powerpc/kernel/prom.c                    |   5 +
 arch/powerpc/kernel/ptrace/ptrace-view.c      |  23 +-
 arch/powerpc/kernel/smp.c                     |   5 +
 arch/powerpc/kernel/syscall_64.c              |  30 +-
 arch/powerpc/kernel/traps.c                   |   6 -
 arch/powerpc/kexec/core_64.c                  |   3 +
 arch/powerpc/mm/book3s64/hash_4k.c            |   2 +-
 arch/powerpc/mm/book3s64/hash_64k.c           |   4 +-
 arch/powerpc/mm/book3s64/hash_hugepage.c      |   2 +-
 arch/powerpc/mm/book3s64/hash_hugetlbpage.c   |   2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c       |   2 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |  10 +-
 arch/powerpc/mm/book3s64/pgtable.c            |   3 +
 arch/powerpc/mm/book3s64/pkeys.c              | 221 +++++-----
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  36 --
 arch/powerpc/mm/fault.c                       |   2 +-
 arch/powerpc/platforms/Kconfig.cputype        |   4 +-
 .../selftests/powerpc/ptrace/ptrace-pkey.c    |  53 +--
 38 files changed, 723 insertions(+), 462 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/book3s/64/kup-radix.h
 create mode 100644 arch/powerpc/include/asm/book3s/64/kup.h

-- 
2.26.2

