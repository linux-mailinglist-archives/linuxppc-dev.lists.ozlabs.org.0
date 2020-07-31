Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CFF234104
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 10:19:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ0YJ4x73zDqbp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 18:19:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ0W14m99zDqZR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 18:17:01 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V82mOZ120385; Fri, 31 Jul 2020 04:16:56 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32md5bbwjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 04:16:56 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06V8Cdnq001469;
 Fri, 31 Jul 2020 08:16:54 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 32jgvptb8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 08:16:54 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06V8Gp0u25559348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jul 2020 08:16:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6276211C052;
 Fri, 31 Jul 2020 08:16:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FAF011C058;
 Fri, 31 Jul 2020 08:16:49 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.199.67])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 31 Jul 2020 08:16:49 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 0/4] VSX 32-byte vector paired load/store instructions
Date: Fri, 31 Jul 2020 13:46:33 +0530
Message-Id: <20200731081637.1837559-1-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 suspectscore=1 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007310059
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
Cc: ravi.bangoria@linux.ibm.com, Balamuruhan S <bala24@linux.ibm.com>,
 paulus@samba.org, sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VSX vector paired instructions operates with octword (32-byte) operand
for loads and stores between storage and a pair of two sequential Vector-Scalar
Registers (VSRs). There are 4 word instructions and 2 prefixed instructions
that provides this 32-byte storage access operations - lxvp, lxvpx, stxvp,
stxvpx, plxvpx, pstxvpx.

Emulation infrastructure doesn't have support for these instructions, to
operate with 32-byte storage access and to operate with 2 VSX registers.
This patch series enables the instruction emulation support and adds test
cases for them respectively.

Changes in v3:
-------------
Worked on review comments and suggestions from Ravi and Naveen,

* Fix the do_vsx_load() to handle vsx instructions if MSR_FP/MSR_VEC
  cleared in exception conditions and it reaches to read/write to
  thread_struct member fp_state/vr_state respectively.
* Fix wrongly used `__vector128 v[2]` in struct vsx_reg as it should
  hold a single vsx register size.
* Remove unnecessary `VSX_CHECK_VEC` flag set and condition to check
  `VSX_LDLEFT` that is not applicable for these vsx instructions.
* Fix comments in emulate_vsx_load() that were misleading.
* Rebased on latest powerpc next branch.

Changes in v2:
-------------
* Fix suggestion from Sandipan, wrap ISA 3.1 instructions with
  cpu_has_feature(CPU_FTR_ARCH_31) check.
* Rebase on latest powerpc next branch.

Balamuruhan S (4):
  powerpc/sstep: support new VSX vector paired storage access
    instructions
  powerpc/sstep: support emulation for vsx vector paired storage access
    instructions
  powerpc ppc-opcode: add encoding macros for vsx vector paired
    instructions
  powerpc sstep: add testcases for vsx load/store instructions

 arch/powerpc/include/asm/ppc-opcode.h |  17 ++
 arch/powerpc/lib/sstep.c              | 122 +++++++++++--
 arch/powerpc/lib/test_emulate_step.c  | 252 ++++++++++++++++++++++++++
 3 files changed, 374 insertions(+), 17 deletions(-)


base-commit: 71d7bca373d5fa0ec977ca4814f49140621bd7ae
-- 
2.24.1

