Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A62C18C8E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 09:22:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kGwn5GtLzDrbv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 19:22:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kGv12NG3zDrWX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 19:21:00 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02K892sA014816
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:20:58 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yvq65v9w5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:20:57 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Fri, 20 Mar 2020 08:20:55 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Mar 2020 08:20:54 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02K8KqW954394948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 08:20:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8191B11C04C;
 Fri, 20 Mar 2020 08:20:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9377011C052;
 Fri, 20 Mar 2020 08:20:46 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.87.168])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Mar 2020 08:20:45 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [RFC PATCH 0/4] consolidate PowerPC instruction encoding macros
Date: Fri, 20 Mar 2020 13:48:33 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032008-4275-0000-0000-000003AF9655
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032008-4276-0000-0000-000038C4C6ED
Message-Id: <20200320081837.1016820-1-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_01:2020-03-19,
 2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=341 impostorscore=0 spamscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003200035
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
for raw instuction encoding, this rfc patchset introduces PPC_ENCODE_* macros
for base instruction encoding and reuse it from elsewhere. With this change we
can avoid redundant macro definitions in multiple files and start adding new
instructions in ppc-opcode.h in future.

TODO:
----
We can still improve further by moving all the instruction encoding
from bpf_jit.h to ppc-opcode.h and reuse them from bpf source. It can be
implemented based on the thoughts and feedback on this RFC.

This patchset is based on mpe's merge branch of linuxppc tree with a
fix patch on top of it,
https://patchwork.ozlabs.org/patch/1252760/

Thanks to Naveen and Sandipan on overall suggestions/improvements.

Tested it by compiling vmlinux with and without the changes and the
objdump of them remains to be same,

# diff vmlinux_objdump vmlinux_rfc_objdump 
2c2
< vmlinux:     file format elf64-powerpcle
---
> vmlinux_rfc:     file format elf64-powerpcle


I would request for your review and suggestions to make it better.

Balamuruhan S (4):
  powerpc ppc-opcode: consolidate PowerPC instruction macros
  powerpc selftest: reuse ppc-opcode macros to avoid redundancy
  powerpc ppc-opcode: move ppc instuction encoding from
    test_emulate_step
  powerpc kvm_asm: rename PPC_LD and PPC_STD macros to avoid
    redefinition

 arch/powerpc/include/asm/kvm_asm.h            |   8 +-
 arch/powerpc/include/asm/ppc-opcode.h         | 364 ++++++++++++------
 arch/powerpc/kvm/booke_interrupts.S           |   8 +-
 arch/powerpc/kvm/bookehv_interrupts.S         |  28 +-
 arch/powerpc/lib/test_emulate_step.c          | 155 +++-----
 arch/powerpc/net/bpf_jit.h                    |   8 -
 arch/powerpc/net/bpf_jit32.h                  |  10 +-
 arch/powerpc/net/bpf_jit64.h                  |   4 +-
 arch/powerpc/net/bpf_jit_comp.c               |   2 +-
 arch/powerpc/net/bpf_jit_comp64.c             |  14 +-
 .../selftests/powerpc/stringloops/Makefile    |  15 +-
 .../powerpc/stringloops/asm/asm-const.h       |   1 +
 .../powerpc/stringloops/asm/ppc-opcode.h      |  36 +-
 13 files changed, 361 insertions(+), 292 deletions(-)
 create mode 120000 tools/testing/selftests/powerpc/stringloops/asm/asm-const.h
 mode change 100644 => 120000 tools/testing/selftests/powerpc/stringloops/asm/ppc-opcode.h


base-commit: 8a445cbcb9f5090cb07ec6cbb89a8a1fc99a0ff7
prerequisite-patch-id: c271d8516dd39526e848dfa95ae38c9205002d2c
-- 
2.24.1

