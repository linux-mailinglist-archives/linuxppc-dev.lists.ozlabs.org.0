Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 856FF8BCDA5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 14:20:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rnGgNwGX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY0q613Btz3cRd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 22:20:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rnGgNwGX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY0pK3g3Mz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 22:19:37 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 446BXg9Q017685;
	Mon, 6 May 2024 12:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=DYpMppRuVJ1axnymsR6lNW0+KnZxKdpVvXtleamR0x4=;
 b=rnGgNwGXESXS2M1KkzPrhXp8PJULyIN+ZJiDKfKxLaY9vYNTlfrbHKiIujJMZq/Je+0Y
 vqSYOMMGMUEJBuy1KEtXAE7Ju920JJ9Ob1wBAVnZcgK21Srv56L3GGJQ5hFhOkW8bYd9
 qwE3jWp0DBawpZD3ggoN7CjQpOHriX6Um1h4+gD6Cm9IA8XC4tqmbcS4fglsY81rgqmW
 Uyg6UYw06dauN2wT1sUyXmYxZ72mCiF3fhWF9VPz06F1T1sViJk9RIVuQHbut6Hzfjzy
 khW1xg2n7UQ87tzRPH0Z/NWFhTem5KEFJSaUmXH/40/jevJVSVL8T8GOg/UBvx9HYoo8 qA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xxxebg44y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:19:24 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 446CJODt027403;
	Mon, 6 May 2024 12:19:24 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xxxebg44v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:19:23 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 446BwJCt028571;
	Mon, 6 May 2024 12:19:23 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xwyqyyy52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 12:19:23 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 446CJHrr57016806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2024 12:19:19 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90BF520049;
	Mon,  6 May 2024 12:19:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2E6520040;
	Mon,  6 May 2024 12:19:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.103.211])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 May 2024 12:19:14 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [PATCH V2 0/9] Add data type profiling support for powerpc
Date: Mon,  6 May 2024 17:48:57 +0530
Message-Id: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Il46pz2x4lOoaPqOZ2QO-RHM-x4Nq4_d
X-Proofpoint-GUID: TUj_Ul4pMWxJcNeta1IQefeorb-SDD68
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_07,2024-05-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405060085
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patchset from Namhyung added support for data type profiling
in perf tool. This enabled support to associate PMU samples to data
types they refer using DWARF debug information. With the upstream
perf, currently it possible to run perf report or perf annotate to
view the data type information on x86.

Initial patchset posted here had changes need to enable data type
profiling support for powerpc.

https://lore.kernel.org/all/6e09dc28-4a2e-49d8-a2b5-ffb3396a9952@csgroup.eu/T/

Main change were:
1. powerpc instruction nmemonic table to associate load/store
instructions with move_ops which is use to identify if instruction
is a memory access one.
2. To get register number and access offset from the given
instruction, code uses fields from "struct arch" -> objump.
Added entry for powerpc here.
3. A get_arch_regnum to return register number from the
register name string.

But the apporach used in the initial patchset used parsing of
disassembled code which the current perf tool implementation does.

Example: lwz     r10,0(r9)

This line "lwz r10,0(r9)" is parsed to extract instruction name,
registers names and offset. Also to find whether there is a memory
reference in the operands, "memory_ref_char" field of objdump is used.
For x86, "(" is used as memory_ref_char to tackle instructions of the
form "mov  (%rax), %rcx".

In case of powerpc, not all instructions using "(" are the only memory
instructions. Example, above instruction can also be of extended form (X
form) "lwzx r10,0,r19". Inorder to easy identify the instruction category
and extract the source/target registers, this patchset adds support to use
raw instruction. With raw instruction, macros are added to extract opcode
and register fields.

Example representation using --show-raw-insn in objdump gives result:

38 01 81 e8     ld      r4,312(r1)

Here "38 01 81 e8" is the raw instruction representation. In powerpc,
this translates to instruction form: "ld RT,DS(RA)" and binary code
as:
_____________________________________
| 58 |  RT  |  RA |      DS       | |
-------------------------------------
0    6     11    16              30 31

Patchset adds support to pick the opcode and reg fields from this
raw/binary instruction code. This approach came in from review comment
by Segher Boessenkool for the initial patchset.

Apart from that, instruction tracking is enabled for powerpc and
support function is added to find variables defined as registers
Example, in powerpc, two registers are
defined to represent variable:
1. r13: represents local_paca
register struct paca_struct *local_paca asm("r13");

2. r1: represents stack_pointer
register void *__stack_pointer asm("r1");

These are handled in this patchset.

- Patch 1 is to rearrange register state type structures to header file
so that it can referred from other arch specific files
- Patch 2 is to make instruction tracking as a callback to"struct arch"
so that it can be implemented by other archs easily and defined in arch
specific files
- Patch 3 is to fix a small comment
- Patch 4 adds support to capture and parse raw instruction in objdump
by keeping existing approach intact.
- Patch 5 update parameters for reg extract functions to use raw
instruction on powerpc
- Patch 6 and patch 7 handles instruction tracking for powerpc.
- Patch 8 and Patch 8 handles support to find global register variables

With the current patchset:

 ./perf record -a -e mem-loads sleep 1
 ./perf report -s type,typeoff --hierarchy --group --stdio
 ./perf annotate --data-type --insn-stat

perf annotate logs:

Annotate Instruction stats
total 562, ok 441 (78.5%), bad 121 (21.5%)

  Name      :  Good   Bad
-----------------------------------------------------------
  ld        :   313    54
  lwz       :    51    32
  lbz       :    31     5
  ldx       :     6    21
  lhz       :    23     0
  lwa       :     4     3
  lwarx     :     5     0
  lwzx      :     2     2
  ldarx     :     3     0
  lwzu      :     2     0
  stdcx.    :     0     1
  nop       :     0     1
  ldu       :     1     0
  lbzx      :     0     1
  lwax      :     0     1

perf report logs:

# Samples: 1K of event 'mem-loads'
# Event count (approx.): 937238
#
# Overhead  Data Type  Data Type Offset
# ........  .........  ................
#
    48.81%  (unknown)  (unknown) +0 (no field)
    12.85%  long unsigned int  long unsigned int +0 (current_stack_pointer)
     4.68%  struct paca_struct  struct paca_struct +2312 (__current)
     4.57%  struct paca_struct  struct paca_struct +2354 (irq_soft_mask)
     2.68%  struct paca_struct  struct paca_struct +8 (paca_index)
     2.64%  struct paca_struct  struct paca_struct +2808 (canary)
     2.24%  struct paca_struct  struct paca_struct +48 (data_offset)
     1.41%  struct vm_fault  struct vm_fault +0 (vma)
     1.29%  struct task_struct  struct task_struct +276 (flags)
     1.03%  struct pt_regs  struct pt_regs +264 (user_regs.msr)
     1.00%  struct menu_device  struct menu_device +4 (tick_wakeup)
     0.90%  struct security_hook_list  struct security_hook_list +0 (list.next)
     0.76%  struct irq_desc  struct irq_desc +304 (irq_data.chip)
     0.76%  struct rq  struct rq +2856 (cpu)

Thanks
Athira Rajeev

Changelog:
From v1->v2:
- Addressed suggestion from Christophe Leroy and Segher Boessenkool
  to use the binary code (raw insn) to fetch opcode, register and
  offset fields.
- Added support for instruction tracking in powerpc
- Find the register defined variables (r13 and r1 which points to
  local_paca and current_stack_pointer in powerpc)

Athira Rajeev (9):
  tools/perf: Move the data structures related to register  type to
    header file
  tools/perf: Add "update_insn_state" callback function to handle arch
    specific instruction tracking
  tools/perf: Fix a comment about multi_regs in extract_reg_offset
    function
  tools/perf: Add support to capture and parse raw instruction in
    objdump
  tools/perf: Update parameters for reg extract functions to use raw
    instruction on powerpc
  tools/perf: Update instruction tracking for powerpc
  tools/perf: Update instruction tracking with add instruction
  tools/perf: Add support to find global register variables using
    find_data_type_global_reg
  tools/perf: Add support for global_die to capture name of variable in
    case of register defined variable

 tools/include/linux/string.h                  |   2 +
 tools/lib/string.c                            |  13 +
 .../perf/arch/powerpc/annotate/instructions.c |  84 +++
 tools/perf/arch/powerpc/util/dwarf-regs.c     |  52 ++
 tools/perf/arch/x86/annotate/instructions.c   | 383 +++++++++++++
 tools/perf/util/annotate-data.c               | 519 +++---------------
 tools/perf/util/annotate-data.h               |  78 +++
 tools/perf/util/annotate.c                    |  32 +-
 tools/perf/util/annotate.h                    |   1 +
 tools/perf/util/disasm.c                      | 109 +++-
 tools/perf/util/disasm.h                      |  17 +-
 tools/perf/util/dwarf-aux.c                   |   1 +
 tools/perf/util/dwarf-aux.h                   |   1 +
 tools/perf/util/include/dwarf-regs.h          |  12 +
 tools/perf/util/sort.c                        |   7 +-
 15 files changed, 854 insertions(+), 457 deletions(-)

-- 
2.43.0

