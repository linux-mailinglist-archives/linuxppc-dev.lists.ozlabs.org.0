Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7486A93ADA2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 10:00:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PJ0OqUfD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTRJg2hwfz3d2c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 18:00:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PJ0OqUfD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTRHy2w92z3cHH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 17:59:40 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46O7RmVI005604;
	Wed, 24 Jul 2024 07:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:subject:from:in-reply-to:date:cc:message-id
	:references:to:content-transfer-encoding:mime-version; s=pp1;
	 bh=rr++4bbq3402kB30h4DffREgitw4dHM2hsFV2wABmAk=; b=PJ0OqUfD+1hW
	ADZBEgw7MKI5KL3cbJ3Pw4zpHYxPL5RSboVkq5i9/nvZRgkDk9U+vLYF48/U+DYa
	U63IUQOyQzEy1oEHf2RULW8H73lRqUGC4U60teplZnKgJZiePsmDN6rN0gAnHUgO
	TWvVbMR1vnaeF7jzIkXepb6Q7TVu6AwTKthGX62BTYLbKaN3rvHgoyM72zDvMpbj
	pQx63cXg8YMrWLJfKRJzPgQOrRxMMb89iVJHByRFta/0O9p7l7AoGuUXfs4OiCmv
	AAbsne1xljLlq7vq7azT0nT0YSvvpyCtUsic76VugVyyGQyXcz9azbkS6NJm9Qq3
	2RCRv+8sZA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40hva3m1y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jul 2024 07:59:27 +0000 (GMT)
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46O7xRNM025687;
	Wed, 24 Jul 2024 07:59:27 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40hva3m1xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jul 2024 07:59:27 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46O654bl007979;
	Wed, 24 Jul 2024 07:59:26 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40gxn9xhj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jul 2024 07:59:26 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46O7xKJZ18415890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Jul 2024 07:59:22 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3765020043;
	Wed, 24 Jul 2024 07:59:20 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF36720040;
	Wed, 24 Jul 2024 07:59:16 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.99.114])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 24 Jul 2024 07:59:16 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH V8 00/15] Add data type profiling support for powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZqANd2cGSM3bSDr6@x1>
Date: Wed, 24 Jul 2024 13:29:04 +0530
Message-Id: <1125D4F8-74AF-4EE1-89B6-10C5B4C3AA88@linux.vnet.ibm.com>
References: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
 <ZqANd2cGSM3bSDr6@x1>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _55BGFJaBKu4HJtHvnLJi-RiauOGw-sH
X-Proofpoint-ORIG-GUID: b5tj5iTIbigv7DZ7APc7O_Nqgro8zAD0
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_05,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407240057
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
Cc: Ian Rogers <irogers@google.com>, disgoel@linux.vnet.ibm.com, Madhavan Srinivasan <maddy@linux.ibm.com>, kjain@linux.ibm.com, Adrian Hunter <adrian.hunter@intel.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, akanksha@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 24 Jul 2024, at 1:37=E2=80=AFAM, Arnaldo Carvalho de Melo <acme@kernel=
.org> wrote:
>=20
> On Thu, Jul 18, 2024 at 02:13:43PM +0530, Athira Rajeev wrote:
>> The patchset from Namhyung added support for data type profiling
>> in perf tool. This enabled support to associate PMU samples to data
>> types they refer using DWARF debug information. With the upstream
>> perf, currently it possible to run perf report or perf annotate to
>> view the data type information on x86.
>>=20
>> Initial patchset posted here had changes need to enable data type
>> profiling support for powerpc.
>=20
> I have this in tmp.perf-tools-next now, will do more tests before moving
> to perf-tools-next.
>=20
> I see that Namhyung reviewed the patch series, and that it was tested,
> in general I thought we need to go on improving things go avoid having
> arch specific code in the non-arch code, I guess right now its important
> to land these to try and encourage people to try data-type profiling
> more widely, hopefully finding and improving data structures in the
> kernel.
>=20
> We need to write about such cases so as to provide success stories on
> using perf for data-type profiling.
>=20
> Thanks for working on this!
Sure, Thanks Arnaldo for taking look at the patchset and pulling to tmp.per=
f-tools-next

- Athira
>=20
> - Arnaldo
>=20
>> https://lore.kernel.org/all/6e09dc28-4a2e-49d8-a2b5-ffb3396a9952@csgroup=
.eu/T/
>>=20
>> Main change were:
>> 1. powerpc instruction nmemonic table to associate load/store
>> instructions with move_ops which is use to identify if instruction
>> is a memory access one.
>> 2. To get register number and access offset from the given
>> instruction, code uses fields from "struct arch" -> objump.
>> Added entry for powerpc here.
>> 3. A get_arch_regnum to return register number from the
>> register name string.
>>=20
>> But the apporach used in the initial patchset used parsing of
>> disassembled code which the current perf tool implementation does.
>>=20
>> Example: lwz     r10,0(r9)
>>=20
>> This line "lwz r10,0(r9)" is parsed to extract instruction name,
>> registers names and offset. Also to find whether there is a memory
>> reference in the operands, "memory_ref_char" field of objdump is used.
>> For x86, "(" is used as memory_ref_char to tackle instructions of the
>> form "mov  (%rax), %rcx".
>>=20
>> In case of powerpc, not all instructions using "(" are the only memory
>> instructions. Example, above instruction can also be of extended form (X
>> form) "lwzx r10,0,r19". Inorder to easy identify the instruction category
>> and extract the source/target registers, second patchset added support t=
o use
>> raw instruction. With raw instruction, macros are added to extract opcode
>> and register fields.
>> Link to second patchset:
>> https://lore.kernel.org/all/20240506121906.76639-1-atrajeev@linux.vnet.i=
bm.com/
>>=20
>> Example representation using --show-raw-insn in objdump gives result:
>>=20
>> 38 01 81 e8     ld      r4,312(r1)
>>=20
>> Here "38 01 81 e8" is the raw instruction representation. In powerpc,
>> this translates to instruction form: "ld RT,DS(RA)" and binary code
>> as:
>>  _____________________________________
>>  | 58 |  RT  |  RA |      DS       | |
>>  -------------------------------------
>> 0    6     11    16              30 31
>>=20
>> Second patchset used "objdump" again to read the raw instruction.
>> But since there is no need to disassemble and binary code can be read
>> directly from the DSO, third patchset (ie this patchset) uses below
>> apporach. The apporach preferred in powerpc to parse sample for data
>> type profiling in V3 patchset is:
>> - Read directly from DSO using dso__data_read_offset
>> - If that fails for any case, fallback to using libcapstone
>> - If libcapstone is not supported, approach will use objdump
>>=20
>> Patchset adds support to pick the opcode and reg fields from this
>> raw/binary instruction code. This approach came in from review comment
>> by Segher Boessenkool and Christophe for the initial patchset.
>>=20
>> Apart from that, instruction tracking is enabled for powerpc.
>>=20
>> These are handled in this patchset.
>>=20
>> - Patch 1 is to rearrange register state type structures to header file
>> so that it can referred from other arch specific files
>> - Patch 2 is to make instruction tracking as a callback to"struct arch"
>> so that it can be implemented by other archs easily and defined in arch
>> specific files
>> - Patch 3 is to handle state type regs array size for x86 and powerpc
>> - Patch 4 adds support to capture and parse raw instruction in powerpc
>> using dso__data_read_offset utility
>> - Patch 4 also adds logic to support using objdump when doing default "p=
erf
>> report" or "perf annotate" since it that needs disassembled instruction.
>> - Patch 5 adds disasm_line__parse to parse raw instruction for powerpc
>> - Patch 6 update parameters for reg extract functions to use raw
>> instruction on powerpc
>> - Patch 7 updates ins__find to carry raw_insn and also adds parse
>> callback for memory instructions for powerpc
>> - Patch 8 add support to identify memory instructions of opcode 31 in
>> powerpc
>> - Patch 9 adds more instructions to support instruction tracking in powe=
rpc
>> - Patch 10 and 11 handles instruction tracking for powerpc.
>> - Patch 12, 13 and 14 add support to use libcapstone in powerpc
>> - Patch 15 handles insn-stat option for perf annotate
>>=20
>> Note:
>> - There are remaining unknowns (25%) as seen in annotate Instruction sta=
ts
>> below.
>> - This patchset is not tested on powerpc32. In next step of enhancements
>> along with handling remaining unknowns, plan to cover powerpc32 changes
>> based on how testing goes.
>> - Patch changes to handle global register support will be posted in
>> follow up after addressing review comment from Namhung here:
>> https://lore.kernel.org/linux-perf-users/CAM9d7cg5MYvLeOoBuKqp1pw7uvRfqC=
w1fXpLtgct0npL96JaYg@mail.gmail.com/T/#mb309184ebf5d2c9b539cd86d61ffe2a3696=
eac71
>>=20
>> With the current patchset:
>>=20
>> ./perf record -a -e mem-loads sleep 1
>> ./perf report -s type,typeoff --hierarchy --group --stdio
>> ./perf annotate --data-type --insn-stat
>>=20
>> perf annotate logs:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>> Annotate Instruction stats
>> total 609, ok 266 (43.7%), bad 343 (56.3%)
>>=20
>>  Name/opcode         :  Good   Bad
>> -----------------------------------------------------------
>>  58                  :   172   231
>>  32                  :    48    44
>>  34                  :    19    25
>>  OP_31_XOP_LDX       :     8    20
>>  40                  :     9    14
>>  OP_31_XOP_LWARX     :     5     1
>>  OP_31_XOP_LWZX      :     2     3
>>  OP_31_XOP_LDARX     :     3     0
>>  33                  :     0     2
>>  OP_31_XOP_LBZX      :     0     1
>>  OP_31_XOP_LWAX      :     0     1
>>  OP_31_XOP_LHZX      :     0     1
>>=20
>> perf report logs:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  Total Lost Samples: 0
>>=20
>>  Samples: 1K of event 'mem-loads'
>>  Event count (approx.): 937238
>>=20
>>    Overhead  Data Type / Data Type Offset
>>    ........  .........  ................
>>     1.73%     struct task_struct
>>        1.29%     struct task_struct +276 (flags)
>>        0.10%     struct task_struct +1872 (mm)
>>        0.08%     struct task_struct +3632 (thread.regs)
>>        0.08%     struct task_struct +1072 (sched_class)
>>        0.05%     struct task_struct +1928 ()
>>        0.03%     struct task_struct +1064 (dl_server)
>>        0.02%     struct task_struct +0 (thread_info.preempt_count)
>>        0.02%     struct task_struct +120 (thread_info)
>>        0.02%     struct task_struct +2216 (worker_private)
>>        0.02%     struct task_struct +24 (thread_info.slb_preload_nr)
>>        0.02%     struct task_struct +8 (thread_info.local_flags)
>>        0.01%     struct task_struct +1416 (nr_cpus_allowed)
>>     1.68%     struct file
>>        0.58%     struct file +176 (f_op)
>>        0.53%     struct file +24 (f_count.counter)
>>        0.46%     struct file +20 (f_mode)
>>        0.11%     struct file +200 (private_data)
>>     1.63%     struct rq
>>        0.76%     struct rq +2856 (cpu)
>>        0.21%     struct rq +2592 (curr)
>>        0.11%     struct rq +2632 (clock_update_flags)
>>        0.08%     struct rq +2600 (idle)
>>        0.06%     struct rq +2688 (clock_task)
>>        0.05%     struct rq +16 (numa_migrate_on)
>>        0.04%     struct rq +2864 (cfs_tasks.next)
>>=20
>> Thanks
>> Athira Rajeev
>>=20
>> Changelog:
>>> From v7 -> v8:
>>  Split patches 1 to 14 and patch 18 as basic patches.
>>  Patch 15, 16 and 17 is related to global register handling
>>  and will be handled separately.
>>  Added Reviewed-and-tested-by from Kajol Jain
>>  Added Reviewed-by from Namhyung for patches 1 to 14, patch 18
>>=20
>>> From v6 -> v7:
>> - Addressed review comments from Namhyung
>>  Changed format string space to %-20s while printing
>>  instruction stats in patch 18.
>>  Use cmp_null in patch 17 while comparing var_name to
>>  properly sort with correct order.
>>=20
>>> From v5 -> v6:
>> - Addressed review comments from Namhyung
>>  Conditionally define TYPE_STATE_MAX_REGS based on arch.
>>  Added macro for defining width of the raw codes and spaces
>>  in disasm_line__parse_powerpc.
>>  Call disasm_line__parse from disasm_line__parse_powerpc
>>  for generic code.
>>  Renamed symbol__disassemble_dso to symbol__disassemble_raw.
>>  Fixed find_data_type_global_reg to correclty free var_types
>>  and change indent level.
>>  Fixed data_type_cmp and sort__typeoff_sort to include var_name
>>  in comparing data type entries.
>>=20
>>> From v4 -> v5:
>> - Addressed review comments from Namhyung
>>  Handle max number of type state regs as 16 for x86 and 32 for
>>  powerpc.
>>  Added generic support for objdump patch first and DSO read
>>  optimisation next
>>  combined patch 3 and patch 4 in patchseries V4 to one patch
>>  Changed reference for "raw_insn" to use "u32"
>>  Splitted "parse" callback patch changes and "ins__find" patch
>>  changes into two
>>  Instead of making weak function, added get_powerpc_regs to
>>  extract register and offset fields for powerpc
>> - Addressed complation fail when "dwarf.h" is not present ie
>>  elfutils devel is not present. Used includes for #ifdef HAVE_DWARF_SUPP=
ORT
>>  when including functions that use Dwarf references. Also
>>  conditionally include some of the header files.
>>=20
>>> From v3->v4:
>> - Addressed review comments from Ian by using capston_init from
>>  "util/print_insn.c" instead of "open_capston_handle".
>> - Addressed review comment from Namhyung by moving "opcode"
>>  field from "struct ins" to "struct disasm_line"
>>=20
>>> From v2->v3:
>> - Addressed review comments from Christophe and Namhyung for V2
>> - Changed the apporach in powerpc to parse sample for data
>>  type profiling as:
>>  Read directly from DSO using dso__data_read_offset
>>  If that fails for any case, fallback to using libcapstone
>>  If libcapstone is not supported, approach will use objdump
>> - Include instructions with opcode as 31 and correctly categorize
>>  them as memory or arithmetic instructions.
>> - Include more instructions for instruction tracking in powerpc
>>=20
>>> From v1->v2:
>> - Addressed suggestion from Christophe Leroy and Segher Boessenkool
>>  to use the binary code (raw insn) to fetch opcode, register and
>>  offset fields.
>> - Added support for instruction tracking in powerpc
>> - Find the register defined variables (r13 and r1 which points to
>>  local_paca and current_stack_pointer in powerpc)
>>=20
>> Athira Rajeev (15):
>>  tools/perf: Move the data structures related to register type to
>>    header file
>>  tools/perf: Add "update_insn_state" callback function to handle arch
>>    specific instruction tracking
>>  tools/perf: Update TYPE_STATE_MAX_REGS to include max of regs in
>>    powerpc
>>  tools/perf: Add disasm_line__parse to parse raw instruction for
>>    powerpc
>>  tools/perf: Add support to capture and parse raw instruction in
>>    powerpc using dso__data_read_offset utility
>>  tools/perf: Update parameters for reg extract functions to use raw
>>    instruction on powerpc
>>  tools/perf: Add parse function for memory instructions in powerpc
>>  tools/perf: Add support to identify memory instructions of opcode 31
>>    in powerpc
>>  tools/perf: Add some of the arithmetic instructions to support
>>    instruction tracking in powerpc
>>  tools/perf: Add more instructions for instruction tracking
>>  tools/perf: Update instruction tracking for powerpc
>>  tools/perf: Make capstone_init non-static so that it can be used
>>    during symbol disassemble
>>  tools/perf: Use capstone_init and remove open_capstone_handle from
>>    disasm.c
>>  tools/perf: Add support to use libcapstone in powerpc
>>  tools/perf: Set instruction name to be used with insn-stat when using
>>    raw instruction
>>=20
>> tools/include/linux/string.h                  |   2 +
>> tools/lib/string.c                            |  13 +
>> tools/perf/arch/arm64/annotate/instructions.c |   3 +-
>> .../arch/loongarch/annotate/instructions.c    |   6 +-
>> .../perf/arch/powerpc/annotate/instructions.c | 254 ++++++++++
>> tools/perf/arch/powerpc/util/dwarf-regs.c     |  53 ++
>> tools/perf/arch/s390/annotate/instructions.c  |   5 +-
>> tools/perf/arch/x86/annotate/instructions.c   | 377 ++++++++++++++
>> tools/perf/builtin-annotate.c                 |   4 +-
>> tools/perf/util/annotate-data.c               | 453 +----------------
>> tools/perf/util/annotate-data.h               |  83 ++++
>> tools/perf/util/annotate.c                    |  21 +-
>> tools/perf/util/annotate.h                    |   5 +-
>> tools/perf/util/disasm.c                      | 468 ++++++++++++++++--
>> tools/perf/util/disasm.h                      |  19 +-
>> tools/perf/util/include/dwarf-regs.h          |  11 +
>> tools/perf/util/print_insn.c                  |  15 +-
>> tools/perf/util/print_insn.h                  |   5 +
>> 18 files changed, 1301 insertions(+), 496 deletions(-)
>>=20
>> --=20
>> 2.43.0

