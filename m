Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 619AB916698
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 13:50:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LVjeXkbR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7jn56r1nz3d88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 21:50:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LVjeXkbR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7jm05b5tz3clw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 21:49:04 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PBeYGp025112;
	Tue, 25 Jun 2024 11:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:subject:from:in-reply-to:date:cc:message-id
	:references:to:content-transfer-encoding:mime-version; s=pp1;
	 bh=Y2hhtNXdnOP2URjK6F8cNvjZytpeeXwrjcm6KAj53Bw=; b=LVjeXkbRiSVb
	PNnpqhI/AQS/E1x+ZdTYg6RTMisFfB6qZDeUAnbCiU2jErwV48kcKbwdkrdHHgJZ
	4wZ0iyh7CMK9bnkmqQBP9tWmf+DogKDoAyHuUJELnW9rn94kOaTB8sATbgSWP6cW
	LoB6YeM4IVW66Nr26nua/sxhQWIwlMwamLa6ATMv043JP914A7oMwEHDzM2nLlVd
	bojtg8m541dwOn6TAxt8LvF8ibaMbYFnlZV7+EMrYpsBQ8OUuEzZPECMU/omGBO4
	ELGvflxvJdETmw+sTWHY4+oucYt+U3Se1t7dZONcAd1NFuqWqSQXEqPRTvgz2VLg
	KI022QQH5A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yyw21819n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 11:48:56 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45PBmtc9005441;
	Tue, 25 Jun 2024 11:48:55 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yyw21819h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 11:48:55 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45PBGRKf019602;
	Tue, 25 Jun 2024 11:48:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yx9xpx5kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 11:48:54 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45PBmmCI45875550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2024 11:48:50 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 746CF20043;
	Tue, 25 Jun 2024 11:48:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8233B20040;
	Tue, 25 Jun 2024 11:48:45 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.30.249])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 25 Jun 2024 11:48:45 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [V4 00/16] Add data type profiling support for powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <ZnYVitG1tffUNTn6@google.com>
Date: Tue, 25 Jun 2024 17:18:34 +0530
Message-Id: <B34AF03E-FD05-4600-9548-ADDB33A534EF@linux.vnet.ibm.com>
References: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
 <C84A4D8E-3BCD-47A7-B41E-1B39744AECDF@linux.vnet.ibm.com>
 <ZnYVitG1tffUNTn6@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _z5g5GnrlNUwrrJan91ypYAkkS5LQD5T
X-Proofpoint-GUID: vMLeO6i0WB3tQse4eVMru0MJLMYVJ24F
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_06,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250084
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
Cc: Ian Rogers <irogers@google.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, akanksha@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 22 Jun 2024, at 5:36=E2=80=AFAM, Namhyung Kim <namhyung@kernel.org> wr=
ote:
>=20
> Hello,
>=20
> On Thu, Jun 20, 2024 at 09:01:01PM +0530, Athira Rajeev wrote:
>>=20
>>=20
>>> On 14 Jun 2024, at 10:56=E2=80=AFPM, Athira Rajeev <atrajeev@linux.vnet=
.ibm.com> wrote:
>>>=20
>>> The patchset from Namhyung added support for data type profiling
>>> in perf tool. This enabled support to associate PMU samples to data
>>> types they refer using DWARF debug information. With the upstream
>>> perf, currently it possible to run perf report or perf annotate to
>>> view the data type information on x86.
>>>=20
>>> Initial patchset posted here had changes need to enable data type
>>> profiling support for powerpc.
>>>=20
>>> https://lore.kernel.org/all/6e09dc28-4a2e-49d8-a2b5-ffb3396a9952@csgrou=
p.eu/T/
>>>=20
>>> Main change were:
>>> 1. powerpc instruction nmemonic table to associate load/store
>>> instructions with move_ops which is use to identify if instruction
>>> is a memory access one.
>>> 2. To get register number and access offset from the given
>>> instruction, code uses fields from "struct arch" -> objump.
>>> Added entry for powerpc here.
>>> 3. A get_arch_regnum to return register number from the
>>> register name string.
>>>=20
>>> But the apporach used in the initial patchset used parsing of
>>> disassembled code which the current perf tool implementation does.
>>>=20
>>> Example: lwz     r10,0(r9)
>>>=20
>>> This line "lwz r10,0(r9)" is parsed to extract instruction name,
>>> registers names and offset. Also to find whether there is a memory
>>> reference in the operands, "memory_ref_char" field of objdump is used.
>>> For x86, "(" is used as memory_ref_char to tackle instructions of the
>>> form "mov  (%rax), %rcx".
>>>=20
>>> In case of powerpc, not all instructions using "(" are the only memory
>>> instructions. Example, above instruction can also be of extended form (X
>>> form) "lwzx r10,0,r19". Inorder to easy identify the instruction catego=
ry
>>> and extract the source/target registers, second patchset added support =
to use
>>> raw instruction. With raw instruction, macros are added to extract opco=
de
>>> and register fields.
>>> Link to second patchset:
>>> https://lore.kernel.org/all/20240506121906.76639-1-atrajeev@linux.vnet.=
ibm.com/
>>>=20
>>> Example representation using --show-raw-insn in objdump gives result:
>>>=20
>>> 38 01 81 e8     ld      r4,312(r1)
>>>=20
>>> Here "38 01 81 e8" is the raw instruction representation. In powerpc,
>>> this translates to instruction form: "ld RT,DS(RA)" and binary code
>>> as:
>>> _____________________________________
>>> | 58 |  RT  |  RA |      DS       | |
>>> -------------------------------------
>>> 0    6     11    16              30 31
>>>=20
>>> Second patchset used "objdump" again to read the raw instruction.
>>> But since there is no need to disassemble and binary code can be read
>>> directly from the DSO, third patchset (ie this patchset) uses below
>>> apporach. The apporach preferred in powerpc to parse sample for data
>>> type profiling in V3 patchset is:
>>> - Read directly from DSO using dso__data_read_offset
>>> - If that fails for any case, fallback to using libcapstone
>>> - If libcapstone is not supported, approach will use objdump
>>>=20
>>> Patchset adds support to pick the opcode and reg fields from this
>>> raw/binary instruction code. This approach came in from review comment
>>> by Segher Boessenkool and Christophe for the initial patchset.
>>>=20
>>> Apart from that, instruction tracking is enabled for powerpc and
>>> support function is added to find variables defined as registers
>>> Example, in powerpc, below two registers are
>>> defined to represent variable:
>>> 1. r13: represents local_paca
>>> register struct paca_struct *local_paca asm("r13");
>>>=20
>>> 2. r1: represents stack_pointer
>>> register void *__stack_pointer asm("r1");
>>>=20
>>> These are handled in this patchset.
>>>=20
>>> - Patch 1 is to rearrange register state type structures to header file
>>> so that it can referred from other arch specific files
>>> - Patch 2 is to make instruction tracking as a callback to"struct arch"
>>> so that it can be implemented by other archs easily and defined in arch
>>> specific files
>>> - Patch 3 adds support to capture and parse raw instruction in powerpc
>>> using dso__data_read_offset utility
>>> - Patch 4 adds logic to support using objdump when doing default "perf
>>> report" or "perf annotate" since it that needs disassembled instruction.
>>> - Patch 5 adds disasm_line__parse to parse raw instruction for powerpc
>>> - Patch 6 update parameters for reg extract functions to use raw
>>> instruction on powerpc
>>> - Patch 7 add support to identify memory instructions of opcode 31 in
>>> powerpc
>>> - Patch 8 adds more instructions to support instruction tracking in pow=
erpc
>>> - Patch 9 and 10 handles instruction tracking for powerpc.
>>> - Patch 11, 12 and 13 add support to use libcapstone in powerpc
>>> - Patch 14 and patch 15 handles support to find global register variabl=
es
>>> - Patch 16 handles insn-stat option for perf annotate
>>>=20
>>> Note:
>>> - There are remaining unknowns (25%) as seen in annotate Instruction st=
ats
>>> below.
>>> - This patchset is not tested on powerpc32. In next step of enhancements
>>> along with handling remaining unknowns, plan to cover powerpc32 changes
>>> based on how testing goes.
>>>=20
>>> With the current patchset:
>>>=20
>>> ./perf record -a -e mem-loads sleep 1
>>> ./perf report -s type,typeoff --hierarchy --group --stdio
>>> ./perf annotate --data-type --insn-stat
>>>=20
>>> perf annotate logs:
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>=20
>>> Annotate Instruction stats
>>> total 609, ok 446 (73.2%), bad 163 (26.8%)
>>>=20
>>> Name/opcode:  Good   Bad
>>> -----------------------------------------------------------
>>> 58                  :   323    80
>>> 32                  :    49    43
>>> 34                  :    33    11
>>> OP_31_XOP_LDX       :     8    20
>>> 40                  :    23     0
>>> OP_31_XOP_LWARX     :     5     1
>>> OP_31_XOP_LWZX      :     2     3
>>> OP_31_XOP_LDARX     :     3     0
>>> 33                  :     0     2
>>> OP_31_XOP_LBZX      :     0     1
>>> OP_31_XOP_LWAX      :     0     1
>>> OP_31_XOP_LHZX      :     0     1
>>>=20
>>> perf report logs:
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>=20
>>> Total Lost Samples: 0
>>>=20
>>> Samples: 1K of event 'mem-loads'
>>> Event count (approx.): 937238
>>>=20
>>> Overhead  Data Type  Data Type Offset
>>> ........  .........  ................
>>>=20
>>> 48.60%  (unknown)  (unknown) +0 (no field)
>>> 12.85%  long unsigned int  long unsigned int +0 (current_stack_pointer)
>>>  4.68%  struct paca_struct  struct paca_struct +2312 (__current)
>>>  4.57%  struct paca_struct  struct paca_struct +2354 (irq_soft_mask)
>>>  2.69%  struct paca_struct  struct paca_struct +2808 (canary)
>>>  2.68%  struct paca_struct  struct paca_struct +8 (paca_index)
>>>  2.24%  struct paca_struct  struct paca_struct +48 (data_offset)
>>>  1.41%  struct vm_fault  struct vm_fault +0 (vma)
>>>  1.29%  struct task_struct  struct task_struct +276 (flags)
>>>  1.03%  struct pt_regs  struct pt_regs +264 (user_regs.msr)
>>>  0.90%  struct security_hook_list  struct security_hook_list +0 (list.n=
ext)
>>>  0.76%  struct irq_desc  struct irq_desc +304 (irq_data.chip)
>>>  0.76%  struct rq  struct rq +2856 (cpu)
>>>=20
>>> Thanks
>>> Athira Rajeev
>>=20
>> Hi All
>>=20
>> Requesting for review comments for this patchset
>=20
> Sorry about the delay, I was traveling and busy with other things.
> I'll review this next week!

Thanks Namhyung
>=20
> Thanks,
> Namhyung


