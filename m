Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F764286F71
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 09:31:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6NDg2db7zDqRg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 18:31:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HRvATTP7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6N8P3KxTzDqRW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 18:27:48 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09872bp4079588; Thu, 8 Oct 2020 03:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Lt+hq3aMXp51vgfmXUSE3RG9gwB/Zyn+/BLXNdnI0dU=;
 b=HRvATTP7KlCJCXuFqbNavSO0oUOT+TcVBO8dQ7E7nUG9wFzRvPrk6jwhidgwbJ8Ql41m
 7A+uARTHhf2p3m14TNhokbPsSYAGHNJjQP4BFx6+LXedjn1lrzP5aOJJMKTqvYTedKbv
 EEeJ1RoMKDdzaY5qSTihAqoRzbcSjL00ga140/tYN5uIv7WHDfpptU5BEtW3rvEkebDY
 nqVG4bhJ2+aK8GD4/xSYDQWESx6mmYDu6c4LS0AAwsCf8jV9g7+U8lKxqDG2RP8X4xd9
 sLZkF8AWQbPRUrQH1eteaE8p7f4eEXJsMQiUYM796k4OGq/lcNhTyjNTv01KKyIw76uM jg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341wa5t0er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 03:27:40 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0987P2Sb022320;
 Thu, 8 Oct 2020 07:27:37 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 33xgx82n1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 07:27:37 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0987RZBE20250938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Oct 2020 07:27:35 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDF5A4C046;
 Thu,  8 Oct 2020 07:27:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 061394C040;
 Thu,  8 Oct 2020 07:27:33 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.37.242])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Oct 2020 07:27:32 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 0/4] powerpc/sstep: VSX 32-byte vector paired load/store
 instructions
Date: Thu,  8 Oct 2020 12:57:22 +0530
Message-Id: <20201008072726.233086-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_03:2020-10-08,
 2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010080050
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
Cc: ravi.bangoria@linux.ibm.com, bala24@linux.ibm.com, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VSX vector paired instructions operates with octword (32-byte)
operand for loads and stores between storage and a pair of two
sequential Vector-Scalar Registers (VSRs). There are 4 word
instructions and 2 prefixed instructions that provides this
32-byte storage access operations - lxvp, lxvpx, stxvp, stxvpx,
plxvp, pstxvp.

Emulation infrastructure doesn't have support for these instructions,
to operate with 32-byte storage access and to operate with 2 VSX
registers. This patch series enables the instruction emulation
support and adds test cases for them respectively.

v3: https://lore.kernel.org/linuxppc-dev/20200731081637.1837559-1-bala24@linux.ibm.com/ 

Changes in v4:
-------------
* Patch #1 is (kind of) new.
* Patch #2 now enables both analyse_instr() and emulate_step()
  unlike prev series where both were in separate patches.
* Patch #2 also has important fix for emulation on LE.
* Patch #3 and #4. Added XSP/XTP, D0/D1 instruction operands,
  removed *_EX_OP, __PPC_T[P][X] macros which are incorrect,
  and adhered to PPC_RAW_* convention.
* Added `CPU_FTR_ARCH_31` check in testcases to avoid failing
  in p8/p9.
* Some consmetic changes.
* Rebased to powerpc/next

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
  powerpc/sstep: Emulate prefixed instructions only when CPU_FTR_ARCH_31
    is set
  powerpc/sstep: Support VSX vector paired storage access instructions
  powerpc/ppc-opcode: Add encoding macros for VSX vector paired
    instructions
  powerpc/sstep: Add testcases for VSX vector paired load/store
    instructions

 arch/powerpc/include/asm/ppc-opcode.h |  13 ++
 arch/powerpc/lib/sstep.c              | 152 +++++++++++++--
 arch/powerpc/lib/test_emulate_step.c  | 270 ++++++++++++++++++++++++++
 3 files changed, 414 insertions(+), 21 deletions(-)

-- 
2.26.2

