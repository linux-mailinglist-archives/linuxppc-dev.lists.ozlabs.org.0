Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C03E28A5BF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Oct 2020 07:11:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C88zf0MwGzDqvn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Oct 2020 16:11:26 +1100 (AEDT)
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
 header.s=pp1 header.b=Hzih6amU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C88xj0yd6zDqnD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Oct 2020 16:09:44 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09B531uj056343; Sun, 11 Oct 2020 01:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=YIU8Qn3g1f6Vs2dLcLqTur+bZfK2zbDYmaPRyLVtv0o=;
 b=Hzih6amUkAbP6AODOKAje/+QKB2fEvKr305GPfK3WhxqsJ/bJSdU5DKPl4AzyoFVeR97
 0Bnwucy2GV87aNwIexI9NekWxsP9jIOXCmzR0OIBbBdsYcaULmt8R9FMy49EpRKoxUBI
 wyZlk81MnzHsPRX+5hKRa9Fu4wRH2BHdgMHb8PtHSBSep++ylVZrbcue/HdErVgQxngr
 I/kdyletrULHGs3+3pPTVnhRA6ufeYdkSMsOduWCIc7Io8aoZ4o29FckuoGMlZS8GZ2H
 bIe3r6nmAy45xfX1/qM4+BM4LPz0g3Jm1L0PJYA2qJJlfA3Pko+W2g7+EfsGA5Sp1ZRd 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 343tvm0se6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 01:09:37 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09B54Clk058647;
 Sun, 11 Oct 2020 01:09:36 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 343tvm0sd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 01:09:36 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09B588lw006165;
 Sun, 11 Oct 2020 05:09:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3434k80vjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 05:09:34 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09B59VBf35914116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Oct 2020 05:09:31 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 902A442042;
 Sun, 11 Oct 2020 05:09:31 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06C8E42041;
 Sun, 11 Oct 2020 05:09:29 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.47.193])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 11 Oct 2020 05:09:28 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v5 0/5] powerpc/sstep: VSX 32-byte vector paired load/store
 instructions
Date: Sun, 11 Oct 2020 10:39:03 +0530
Message-Id: <20201011050908.72173-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-10_07:2020-10-09,
 2020-10-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010110048
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, bala24@linux.ibm.com,
 paulus@samba.org, sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
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

v4: https://lore.kernel.org/r/20201008072726.233086-1-ravi.bangoria@linux.ibm.com

Changes in v5:
-------------
* Fix build breakage reported by Kernel test robote
* Patch #2 is new. CONFIG_VSX check was missing for some VSX
  instructions. Patch #2 adds that check.

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


Balamuruhan S (4):
  powerpc/sstep: Emulate prefixed instructions only when CPU_FTR_ARCH_31
    is set
  powerpc/sstep: Support VSX vector paired storage access instructions
  powerpc/ppc-opcode: Add encoding macros for VSX vector paired
    instructions
  powerpc/sstep: Add testcases for VSX vector paired load/store
    instructions

Ravi Bangoria (1):
  powerpc/sstep: Cover new VSX instructions under CONFIG_VSX

 arch/powerpc/include/asm/ppc-opcode.h |  13 ++
 arch/powerpc/lib/sstep.c              | 160 ++++++++++++---
 arch/powerpc/lib/test_emulate_step.c  | 270 ++++++++++++++++++++++++++
 3 files changed, 421 insertions(+), 22 deletions(-)

-- 
2.26.2

