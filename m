Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5FC90916A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 19:27:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kHtUAmG1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W15nl6s7Xz3cf7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 03:27:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kHtUAmG1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W15n30z5Fz3cYJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 03:27:02 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45EGREAO021070;
	Fri, 14 Jun 2024 17:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pp1; bh=qG86JUGwbKJIj
	Mp1qPFmHuF4zhPD4ibq70EnCE9Bhbg=; b=kHtUAmG1BqIwXloE3XuxJFad36nXs
	mOjCWcpKDwF7LZgEue6GmoG/dOhQ00d0QcRN6ZfGzr0q7YHvNQmb0EeVRzTSceCp
	H4ULbaSjZDbHdIlmcUXQUGI24VzxaeqaW7sucJaC9pIXZcjsyKzxPf+3V11j/uYv
	/II04rKHIxoOMRC1blUvVmqeS6o2Ejweq+sW4vINGSqROYNlqCRME9Ccm8j6QzSR
	wXrkiDH0HtWzRzFXqprwhFDrPzurJB4l4xTOC1rEL2zqhWHtdTMFfm/Gw7fwkwtT
	DF19ZXfQGIzZBG0YbCyRAj/xVF7Fq34F5+Yws0QyObYH3RaVu0m+P0aTg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yrqnp0dkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 17:26:48 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45EHQmDq013283;
	Fri, 14 Jun 2024 17:26:48 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yrqnp0dkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 17:26:48 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45EH0GE8020066;
	Fri, 14 Jun 2024 17:26:46 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yn34nud2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 17:26:46 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45EHQfjv49152308
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 17:26:43 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BA9E20040;
	Fri, 14 Jun 2024 17:26:41 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A53A2004D;
	Fri, 14 Jun 2024 17:26:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.82.18])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Jun 2024 17:26:38 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu
Subject: [V4 00/16] Add data type profiling support for powerpc
Date: Fri, 14 Jun 2024 22:56:15 +0530
Message-Id: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AAX4IDYQQw9TjPguOv-toObVzUICpRUq
X-Proofpoint-ORIG-GUID: oDwy_ar1BlCsWq4XZIUTuKON4Gqe-Isq
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_15,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406140119
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
and extract the source/target registers, second patchset added support to use
raw instruction. With raw instruction, macros are added to extract opcode
and register fields.
Link to second patchset:
https://lore.kernel.org/all/20240506121906.76639-1-atrajeev@linux.vnet.ibm.com/

Example representation using --show-raw-insn in objdump gives result:

38 01 81 e8     ld      r4,312(r1)

Here "38 01 81 e8" is the raw instruction representation. In powerpc,
this translates to instruction form: "ld RT,DS(RA)" and binary code
as:
  _____________________________________
  | 58 |  RT  |  RA |      DS       | |
  -------------------------------------
0    6     11    16              30 31

Second patchset used "objdump" again to read the raw instruction.
But since there is no need to disassemble and binary code can be read
directly from the DSO, third patchset (ie this patchset) uses below
apporach. The apporach preferred in powerpc to parse sample for data
type profiling in V3 patchset is:
- Read directly from DSO using dso__data_read_offset
- If that fails for any case, fallback to using libcapstone
- If libcapstone is not supported, approach will use objdump

Patchset adds support to pick the opcode and reg fields from this
raw/binary instruction code. This approach came in from review comment
by Segher Boessenkool and Christophe for the initial patchset.

Apart from that, instruction tracking is enabled for powerpc and
support function is added to find variables defined as registers
Example, in powerpc, below two registers are
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
- Patch 3 adds support to capture and parse raw instruction in powerpc
using dso__data_read_offset utility
- Patch 4 adds logic to support using objdump when doing default "perf
report" or "perf annotate" since it that needs disassembled instruction.
- Patch 5 adds disasm_line__parse to parse raw instruction for powerpc
- Patch 6 update parameters for reg extract functions to use raw
instruction on powerpc
- Patch 7 add support to identify memory instructions of opcode 31 in
powerpc
- Patch 8 adds more instructions to support instruction tracking in powerpc
- Patch 9 and 10 handles instruction tracking for powerpc.
- Patch 11, 12 and 13 add support to use libcapstone in powerpc
- Patch 14 and patch 15 handles support to find global register variables
- Patch 16 handles insn-stat option for perf annotate

Note:
- There are remaining unknowns (25%) as seen in annotate Instruction stats
below.
- This patchset is not tested on powerpc32. In next step of enhancements
along with handling remaining unknowns, plan to cover powerpc32 changes
based on how testing goes.

With the current patchset:

 ./perf record -a -e mem-loads sleep 1
 ./perf report -s type,typeoff --hierarchy --group --stdio
 ./perf annotate --data-type --insn-stat

perf annotate logs:
==================

Annotate Instruction stats
total 609, ok 446 (73.2%), bad 163 (26.8%)

  Name/opcode:  Good   Bad
  -----------------------------------------------------------
  58                  :   323    80
  32                  :    49    43
  34                  :    33    11
  OP_31_XOP_LDX       :     8    20
  40                  :    23     0
  OP_31_XOP_LWARX     :     5     1
  OP_31_XOP_LWZX      :     2     3
  OP_31_XOP_LDARX     :     3     0
  33                  :     0     2
  OP_31_XOP_LBZX      :     0     1
  OP_31_XOP_LWAX      :     0     1
  OP_31_XOP_LHZX      :     0     1

perf report logs:
=================

  Total Lost Samples: 0

  Samples: 1K of event 'mem-loads'
  Event count (approx.): 937238

  Overhead  Data Type  Data Type Offset
 ........  .........  ................

    48.60%  (unknown)  (unknown) +0 (no field)
    12.85%  long unsigned int  long unsigned int +0 (current_stack_pointer)
     4.68%  struct paca_struct  struct paca_struct +2312 (__current)
     4.57%  struct paca_struct  struct paca_struct +2354 (irq_soft_mask)
     2.69%  struct paca_struct  struct paca_struct +2808 (canary)
     2.68%  struct paca_struct  struct paca_struct +8 (paca_index)
     2.24%  struct paca_struct  struct paca_struct +48 (data_offset)
     1.41%  struct vm_fault  struct vm_fault +0 (vma)
     1.29%  struct task_struct  struct task_struct +276 (flags)
     1.03%  struct pt_regs  struct pt_regs +264 (user_regs.msr)
     0.90%  struct security_hook_list  struct security_hook_list +0 (list.next)
     0.76%  struct irq_desc  struct irq_desc +304 (irq_data.chip)
     0.76%  struct rq  struct rq +2856 (cpu)

Thanks
Athira Rajeev

Changelog:
From v3->v4:
- Addressed review comments from Ian by using capston_init from
  "util/print_insn.c" instead of "open_capston_handle".
- Addressed review comment from Namhyung by moving "opcode"
  field from "struct ins" to "struct disasm_line"

From v2->v3:
- Addressed review comments from Christophe and Namhyung for V2
- Changed the apporach in powerpc to parse sample for data
  type profiling as:
  Read directly from DSO using dso__data_read_offset
  If that fails for any case, fallback to using libcapstone
  If libcapstone is not supported, approach will use objdump
- Include instructions with opcode as 31 and correctly categorize
  them as memory or arithmetic instructions.
- Include more instructions for instruction tracking in powerpc

From v1->v2:
- Addressed suggestion from Christophe Leroy and Segher Boessenkool
  to use the binary code (raw insn) to fetch opcode, register and
  offset fields.
- Added support for instruction tracking in powerpc
- Find the register defined variables (r13 and r1 which points to
  local_paca and current_stack_pointer in powerpc)

Athira Rajeev (16):
  tools/perf: Move the data structures related to register type to
    header file
  tools/perf: Add "update_insn_state" callback function to handle arch
    specific instruction tracking
  tools/perf: Add support to capture and parse raw instruction in
    powerpc using dso__data_read_offset utility
  tools/perf: Use sort keys to determine whether to pick objdump to
    disassemble
  tools/perf: Add disasm_line__parse to parse raw instruction for
    powerpc
  tools/perf: Update parameters for reg extract functions to use raw
    instruction on powerpc
  tools/perf: Add support to identify memory instructions of opcode 31
    in powerpc
  tools/perf: Add some of the arithmetic instructions to support
    instruction tracking in powerpc
  tools/perf: Add more instructions for instruction tracking
  tools/perf: Update instruction tracking for powerpc
  tools/perf: Make capstone_init non-static so that it can be used
    during symbol disassemble
  tools/perf: Use capstone_init and remove open_capstone_handle from
    disasm.c
  tools/perf: Add support to use libcapstone in powerpc
  tools/perf: Add support to find global register variables using
    find_data_type_global_reg
  tools/perf: Add support for global_die to capture name of variable in
    case of register defined variable
  tools/perf: Set instruction name to be used with insn-stat when using
    raw instruction

 tools/include/linux/string.h                  |   2 +
 tools/lib/string.c                            |  13 +
 tools/perf/arch/arm64/annotate/instructions.c |   3 +-
 .../arch/loongarch/annotate/instructions.c    |   6 +-
 .../perf/arch/powerpc/annotate/instructions.c | 260 +++++++++
 tools/perf/arch/powerpc/util/dwarf-regs.c     |  53 ++
 tools/perf/arch/s390/annotate/instructions.c  |   5 +-
 tools/perf/arch/x86/annotate/instructions.c   | 383 +++++++++++++
 tools/perf/builtin-annotate.c                 |   4 +-
 tools/perf/util/annotate-data.c               | 519 +++---------------
 tools/perf/util/annotate-data.h               |  78 +++
 tools/perf/util/annotate.c                    |  35 +-
 tools/perf/util/annotate.h                    |   6 +-
 tools/perf/util/disasm.c                      | 475 ++++++++++++++--
 tools/perf/util/disasm.h                      |  13 +-
 tools/perf/util/dwarf-aux.c                   |   1 +
 tools/perf/util/dwarf-aux.h                   |   1 +
 tools/perf/util/include/dwarf-regs.h          |   4 +
 tools/perf/util/print_insn.c                  |  15 +-
 tools/perf/util/print_insn.h                  |   5 +
 tools/perf/util/sort.c                        |   7 +-
 21 files changed, 1386 insertions(+), 502 deletions(-)

-- 
2.43.0

