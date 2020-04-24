Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA54F1B6EAC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 09:11:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497lhQ67kkzDr7P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 17:11:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497lfB3D48zDqL4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 17:09:22 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03O71qBE122570; Fri, 24 Apr 2020 03:09:13 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30k3xvbfuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 03:09:13 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03O71rRL122786;
 Fri, 24 Apr 2020 03:09:13 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30k3xvbfu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 03:09:12 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03O76usO029911;
 Fri, 24 Apr 2020 07:09:11 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 30fs65gp8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 07:09:10 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03O798r3983412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 07:09:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 290BDA4059;
 Fri, 24 Apr 2020 07:09:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5290CA4051;
 Fri, 24 Apr 2020 07:09:06 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.95.110])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Apr 2020 07:09:06 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [RFC PATCH v2 0/7] consolidate PowerPC instruction encoding macros
Date: Fri, 24 Apr 2020 12:38:46 +0530
Message-Id: <20200424070853.443969-1-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_02:2020-04-23,
 2020-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240048
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 Balamuruhan S <bala24@linux.ibm.com>, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ppc-opcode.h have base instruction encoding wrapped with stringify_in_c()
for raw encoding to have compatibility. But there are redundant macros for
base instruction encodings in bpf, instruction emulation test infrastructure
and powerpc selftests.

Currently PPC_INST_* macros are used for encoding instruction opcode and PPC_*
for raw instuction encoding, this rfc patchset introduces PPC_RAW_* macros for
base instruction encoding and reuse it from elsewhere. With this change we can
avoid redundant macro definitions in multiple files and start adding new
instructions in ppc-opcode.h in future.

Changes in v2:
-------------
Fix review comments/suggestions from Naveen and Michael Ellerman,

* Rename PPC_ENCODE_* to PPC_RAW_* for base instruction encoding macros.
* Split the patches that does mass renaming and make them simpler that just
  adds new macros.
* Keep the patch to update all the existing names later (patch 6).
* Lot of PPC_INST_* macros are used only in ppc-opcode.h for PPC_*  macros,
  fold PPC_INST_* encoding into PPC_RAW_* to avoid using them accidentally.
* Fixed clipped macros that was due to a typo/copy-paste
* Consolidated all the instruction encoding macros from bpf_jit.h to
  ppc-opcode.h
* squashed patch that removes the duplicate macro PPC_MR() in bpf_jit.h
* merge few changes in bpf_jit files from patch 2 into patch 3
* few fixes in powerpc selftest stringloops Makefile
* build tested for ppc64le_defconfig, ppc64e_defconfig and pmac32_defconfig
* Rebased on next branch of linuxppc tree

Testing:
-------
* Tested it by compiling vmlinux and comparing objdump of it with and without
  the patchset and observed that it remains same,

  # diff vmlinux_objdump vmlinux_rfc_objdump 
  2c2
  < vmlinux:     file format elf64-powerpcle
  ---
  > vmlinux_rfc:     file format elf64-powerpcle

* Tested building it with this changes for Fedora30 config, booted VM
  with powerpc next and powerpc next + patchset to run powerpc selftest and
  ftrace selftest. There were couple of failures that were common and
  patchset did not introduce any new failures.

  ftrace selftest:
  ---------------
	# # of passed:  96
	# # of failed:  1
	# # of unresolved:  7
	# # of untested:  0
	# # of unsupported:  1
	# # of xfailed:  1
	# # of undefined(test bug):  0
	not ok 1 selftests: ftrace: ftracetest # exit=1

  powerpc selftest:
  ----------------
        not ok 7 selftests: powerpc/dscr: dscr_sysfs_thread_test # exit=1
        not ok 20 selftests: powerpc/pmu/ebb: lost_exception_test # TIMEOUT
        not ok 2 selftests: powerpc/security: spectre_v2 # exit=1

Thanks to Naveen, Sandipan and Michael on overall suggestions/improvements.

I would request for review and suggestions to make it better.

v1: https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-March/206494.html

Balamuruhan S (7):
  powerpc/ppc-opcode: introduce PPC_RAW_* macros for base instruction
    encoding
  powerpc/ppc-opcode: move ppc instruction encoding from
    test_emulate_step
  powerpc/bpf_jit: reuse instruction macros from ppc-opcode.h
  powerpc/ppc-opcode: consolidate powerpc instructions from bpf_jit.h
  powerpc/ppc-opcode: reuse raw instruction macros to stringify
  powerpc/ppc-opcode: fold PPC_INST_* macros into PPC_RAW_* macros
  powerpc/selftest: reuse ppc-opcode macros to avoid redundancy

 arch/powerpc/include/asm/ppc-opcode.h         | 706 +++++++++++-------
 arch/powerpc/lib/test_emulate_step.c          | 155 ++--
 arch/powerpc/net/bpf_jit.h                    | 184 +----
 arch/powerpc/net/bpf_jit32.h                  |  34 +-
 arch/powerpc/net/bpf_jit64.h                  |  16 +-
 arch/powerpc/net/bpf_jit_comp.c               | 134 ++--
 arch/powerpc/net/bpf_jit_comp64.c             | 298 ++++----
 .../selftests/powerpc/stringloops/Makefile    |  34 +-
 .../powerpc/stringloops/asm/asm-const.h       |   1 +
 .../powerpc/stringloops/asm/ppc-opcode.h      |  36 +-
 10 files changed, 762 insertions(+), 836 deletions(-)
 create mode 120000 tools/testing/selftests/powerpc/stringloops/asm/asm-const.h
 mode change 100644 => 120000 tools/testing/selftests/powerpc/stringloops/asm/ppc-opcode.h


base-commit: 45591da765885f7320a111d290b3a28a23eed359
-- 
2.24.1

