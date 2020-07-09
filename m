Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9DE2196AE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 05:32:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2MDT4VRwzDqqJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 13:32:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2M9z4qDnzDqYh
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 13:29:59 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 069331RI149647; Wed, 8 Jul 2020 23:29:53 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 325s3jayc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 23:29:53 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0693EjdM031337;
 Thu, 9 Jul 2020 03:29:53 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 325k27k4y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 03:29:53 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0693Tq1Q46072080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 03:29:52 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7E30B2064;
 Thu,  9 Jul 2020 03:29:52 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1FCDB205F;
 Thu,  9 Jul 2020 03:29:50 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.62.107])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 03:29:50 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 00/23] powerpc/book3s/64/pkeys: Simplify the code
Date: Thu,  9 Jul 2020 08:59:23 +0530
Message-Id: <20200709032946.881753-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_19:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090019
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

Changes from v5:
* Address review feedback.
* Dropped patches moving kup to generic name.
* Dropped static key changes related to execute only support.

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

Aneesh Kumar K.V (23):
  powerpc/book3s64/pkeys: Use PVR check instead of cpu feature
  powerpc/book3s64/pkeys: Fixup bit numbering
  powerpc/book3s64/pkeys: pkeys are supported only on hash on book3s.
  powerpc/book3s64/pkeys: Move pkey related bits in the linux page table
  powerpc/book3s64/pkeys: Explain key 1 reservation details
  powerpc/book3s64/pkeys: Simplify the key initialization
  powerpc/book3s64/pkeys: Prevent key 1 modification from userspace.
  powerpc/book3s64/pkeys: kill cpu feature key CPU_FTR_PKEY
  powerpc/book3s64/pkeys: Simplify pkey disable branch
  powerpc/book3s64/pkeys: Convert pkey_total to num_pkey
  powerpc/book3s64/pkeys: Make initial_allocation_mask static
  powerpc/book3s64/pkeys: Mark all the pkeys above max pkey as reserved
  powerpc/book3s64/pkeys: Add MMU_FTR_PKEY
  powerpc/book3s64/kuep: Add MMU_FTR_KUEP
  powerpc/book3s64/pkeys: Use pkey_execute_disable_supported
  powerpc/book3s64/pkeys: Use MMU_FTR_PKEY instead of pkey_disabled
    static key
  powerpc/book3s64/keys: Print information during boot.
  powerpc/book3s64/keys/kuap: Reset AMR/IAMR values on kexec
  powerpc/book3s64/kuap: Move UAMOR setup to key init function
  powerpc/selftest/ptrave-pkey: Rename variables to make it easier to
    follow code
  powerpc/selftest/ptrace-pkey: Update the test to mark an invalid pkey
    correctly
  powerpc/selftest/ptrace-pkey: Don't update expected UAMOR value
  powerpc/book3s64/pkeys: Remove is_pkey_enabled()

 arch/powerpc/include/asm/book3s/64/hash-4k.h  |  21 +-
 arch/powerpc/include/asm/book3s/64/hash-64k.h |  12 +-
 .../powerpc/include/asm/book3s/64/hash-pkey.h |  32 ++
 arch/powerpc/include/asm/book3s/64/kexec.h    |  23 ++
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   8 +-
 arch/powerpc/include/asm/book3s/64/mmu.h      |   6 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  17 +-
 arch/powerpc/include/asm/book3s/64/pkeys.h    |  27 ++
 arch/powerpc/include/asm/cputable.h           |  13 +-
 arch/powerpc/include/asm/kexec.h              |  12 +
 arch/powerpc/include/asm/mmu.h                |  17 +
 arch/powerpc/include/asm/pkeys.h              |  65 +---
 arch/powerpc/include/asm/processor.h          |   1 -
 arch/powerpc/kernel/dt_cpu_ftrs.c             |   6 -
 arch/powerpc/kernel/misc_64.S                 |  14 -
 arch/powerpc/kernel/prom.c                    |   5 +
 arch/powerpc/kernel/ptrace/ptrace-view.c      |  27 +-
 arch/powerpc/kernel/smp.c                     |   1 +
 arch/powerpc/kexec/core_64.c                  |   2 +
 arch/powerpc/mm/book3s64/hash_utils.c         |   4 +
 arch/powerpc/mm/book3s64/pgtable.c            |   3 +
 arch/powerpc/mm/book3s64/pkeys.c              | 294 ++++++++++--------
 arch/powerpc/mm/book3s64/radix_pgtable.c      |   8 +-
 .../selftests/powerpc/ptrace/ptrace-pkey.c    |  55 ++--
 24 files changed, 404 insertions(+), 269 deletions(-)
 create mode 100644 arch/powerpc/include/asm/book3s/64/hash-pkey.h
 create mode 100644 arch/powerpc/include/asm/book3s/64/kexec.h
 create mode 100644 arch/powerpc/include/asm/book3s/64/pkeys.h

-- 
2.26.2

