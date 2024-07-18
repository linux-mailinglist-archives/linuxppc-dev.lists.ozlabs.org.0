Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A04993483F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 08:43:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPjty0QZxz3fQh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 16:43:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.46; helo=mail-pj1-f46.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPjtY5sHTz3c5q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 16:43:16 +1000 (AEST)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cb2a6a8b2fso340955a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 23:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721284993; x=1721889793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpS/owR9JazRM2dBxQW4LiJLxkxRTrwOxrYgYnl0BZk=;
        b=hYDpUSXC0A3Qcqqb5lMHgFWGrG/awhvBJ9HiE4YxerwEKTZjiatlaYwUhH1t5p72RY
         tcybYnKG0RGIc96PpwULh/PhItzi6I8qEXg7/ZXxV2Af66rZjbtwckJm249ZDqEFH+xX
         KN46iFLsUeIbS0T3X3sagZ4kW2Jw571xqypFNiX2FtoVhf3Gf14lgGbMlJJ/rRUZGB19
         QCp1HCpd7clZAfOcgFxypaDy2kLpybMB30q2DcnAYKnG4QK6pOTElVfjoAf6cZ0LVUG0
         Ap2oqWkiCOUtZY+xO2zSrGA33a9/5L+DmB26Mrtx3OVuanzXl2ckOapCzdxYbYfIBRha
         OsYA==
X-Forwarded-Encrypted: i=1; AJvYcCVg2vaIAfsg8Mji8r0M1Zd4rO+dZadwL7tjHHv5CodACe/PsvY9FruH6MU95wzOWZPrUFm2BBdL+TxkiybXtlVy/Eauwa2GZ7OQ4z9N0g==
X-Gm-Message-State: AOJu0YzPi/M9M7lFUrzmlvdLqVsgD6kQiemusslpkkyYu+7SlI/HNa4D
	0BL0ULxHiuZtG2/k6/Cr16jxr0B3Nz6cnUluogGf4ADc5bHu4ea+lwOFjcg0Isl+9R4vX4dqZPE
	TCnwNCe7ZHnz3E2T6vHP3+U4VAio=
X-Google-Smtp-Source: AGHT+IGGCbeydYQPV6gMZXlaxTtaOrU+n87GbARJIM4cSViYrA7ztlvWSjbcHjVfHtVMhE5rJgZ+sDIyT3YfSb+X98s=
X-Received: by 2002:a17:90a:d44e:b0:2c9:3370:56e3 with SMTP id
 98e67ed59e1d1-2cb52913a6emr3198583a91.34.1721284992782; Wed, 17 Jul 2024
 23:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240713165529.59298-1-atrajeev@linux.vnet.ibm.com>
 <ZpipZcu8KixXxzbw@google.com> <B807AB51-B49D-436D-98B3-E6344A53ABCA@linux.vnet.ibm.com>
In-Reply-To: <B807AB51-B49D-436D-98B3-E6344A53ABCA@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Wed, 17 Jul 2024 23:43:01 -0700
Message-ID: <CAM9d7cg5MYvLeOoBuKqp1pw7uvRfqCw1fXpLtgct0npL96JaYg@mail.gmail.com>
Subject: Re: [PATCH V7 00/18] Add data type profiling support for powerpc
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: irogers@google.com, disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, Adrian Hunter <adrian.hunter@intel.com>, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 17, 2024 at 11:12=E2=80=AFPM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
>
>
> > On 18 Jul 2024, at 11:04=E2=80=AFAM, Namhyung Kim <namhyung@kernel.org>=
 wrote:
> >
> > Hello,
> >
> > On Sat, Jul 13, 2024 at 10:25:11PM +0530, Athira Rajeev wrote:
> >> The patchset from Namhyung added support for data type profiling
> >> in perf tool. This enabled support to associate PMU samples to data
> >> types they refer using DWARF debug information. With the upstream
> >> perf, currently it possible to run perf report or perf annotate to
> >> view the data type information on x86.
> >>
> >> Initial patchset posted here had changes need to enable data type
> >> profiling support for powerpc.
> >>
> >> https://lore.kernel.org/all/6e09dc28-4a2e-49d8-a2b5-ffb3396a9952@csgro=
up.eu/T/
> >>
> >> Main change were:
> >> 1. powerpc instruction nmemonic table to associate load/store
> >> instructions with move_ops which is use to identify if instruction
> >> is a memory access one.
> >> 2. To get register number and access offset from the given
> >> instruction, code uses fields from "struct arch" -> objump.
> >> Added entry for powerpc here.
> >> 3. A get_arch_regnum to return register number from the
> >> register name string.
> >>
> >> But the apporach used in the initial patchset used parsing of
> >> disassembled code which the current perf tool implementation does.
> >>
> >> Example: lwz     r10,0(r9)
> >>
> >> This line "lwz r10,0(r9)" is parsed to extract instruction name,
> >> registers names and offset. Also to find whether there is a memory
> >> reference in the operands, "memory_ref_char" field of objdump is used.
> >> For x86, "(" is used as memory_ref_char to tackle instructions of the
> >> form "mov  (%rax), %rcx".
> >>
> >> In case of powerpc, not all instructions using "(" are the only memory
> >> instructions. Example, above instruction can also be of extended form =
(X
> >> form) "lwzx r10,0,r19". Inorder to easy identify the instruction categ=
ory
> >> and extract the source/target registers, second patchset added support=
 to use
> >> raw instruction. With raw instruction, macros are added to extract opc=
ode
> >> and register fields.
> >> Link to second patchset:
> >> https://lore.kernel.org/all/20240506121906.76639-1-atrajeev@linux.vnet=
.ibm.com/
> >>
> >> Example representation using --show-raw-insn in objdump gives result:
> >>
> >> 38 01 81 e8     ld      r4,312(r1)
> >>
> >> Here "38 01 81 e8" is the raw instruction representation. In powerpc,
> >> this translates to instruction form: "ld RT,DS(RA)" and binary code
> >> as:
> >>  _____________________________________
> >>  | 58 |  RT  |  RA |      DS       | |
> >>  -------------------------------------
> >> 0    6     11    16              30 31
> >>
> >> Second patchset used "objdump" again to read the raw instruction.
> >> But since there is no need to disassemble and binary code can be read
> >> directly from the DSO, third patchset (ie this patchset) uses below
> >> apporach. The apporach preferred in powerpc to parse sample for data
> >> type profiling in V3 patchset is:
> >> - Read directly from DSO using dso__data_read_offset
> >> - If that fails for any case, fallback to using libcapstone
> >> - If libcapstone is not supported, approach will use objdump
> >>
> >> Patchset adds support to pick the opcode and reg fields from this
> >> raw/binary instruction code. This approach came in from review comment
> >> by Segher Boessenkool and Christophe for the initial patchset.
> >>
> >> Apart from that, instruction tracking is enabled for powerpc and
> >> support function is added to find variables defined as registers
> >> Example, in powerpc, below two registers are
> >> defined to represent variable:
> >> 1. r13: represents local_paca
> >> register struct paca_struct *local_paca asm("r13");
> >>
> >> 2. r1: represents stack_pointer
> >> register void *__stack_pointer asm("r1");
> >>
> >> These are handled in this patchset.
> >>
> >> - Patch 1 is to rearrange register state type structures to header fil=
e
> >> so that it can referred from other arch specific files
> >> - Patch 2 is to make instruction tracking as a callback to"struct arch=
"
> >> so that it can be implemented by other archs easily and defined in arc=
h
> >> specific files
> >> - Patch 3 is to handle state type regs array size for x86 and powerpc
> >> - Patch 4 adds support to capture and parse raw instruction in powerpc
> >> using dso__data_read_offset utility
> >> - Patch 4 also adds logic to support using objdump when doing default =
"perf
> >> report" or "perf annotate" since it that needs disassembled instructio=
n.
> >> - Patch 5 adds disasm_line__parse to parse raw instruction for powerpc
> >> - Patch 6 update parameters for reg extract functions to use raw
> >> instruction on powerpc
> >> - Patch 7 updates ins__find to carry raw_insn and also adds parse
> >> callback for memory instructions for powerpc
> >> - Patch 8 add support to identify memory instructions of opcode 31 in
> >> powerpc
> >> - Patch 9 adds more instructions to support instruction tracking in po=
werpc
> >> - Patch 10 and 11 handles instruction tracking for powerpc.
> >> - Patch 12, 13 and 14 add support to use libcapstone in powerpc
> >> - Patch 15 and patch 16 handles support to find global register variab=
les
> >> - PAtch 17 updates data type compare functions data_type_cmp and
> >>  sort__typeoff_sort to include var_name along with type_name in
> >>  comparison.
> >> - Patch 18 handles insn-stat option for perf annotate
> >>
> >> Note:
> >> - There are remaining unknowns (25%) as seen in annotate Instruction s=
tats
> >> below.
> >> - This patchset is not tested on powerpc32. In next step of enhancemen=
ts
> >> along with handling remaining unknowns, plan to cover powerpc32 change=
s
> >> based on how testing goes.
> >>
> >> With the current patchset:
> >>
> >> ./perf record -a -e mem-loads sleep 1
> >> ./perf report -s type,typeoff --hierarchy --group --stdio
> >> ./perf annotate --data-type --insn-stat
> >>
> >> perf annotate logs:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >>
> >> Annotate Instruction stats
> >> total 609, ok 446 (73.2%), bad 163 (26.8%)
> >>
> >>  Name/opcode         :  Good   Bad
> >>  -----------------------------------------------------------
> >>  58                  :   323    80
> >>  32                  :    49    43
> >>  34                  :    33    11
> >>  OP_31_XOP_LDX       :     8    20
> >>  40                  :    23     0
> >>  OP_31_XOP_LWARX     :     5     1
> >>  OP_31_XOP_LWZX      :     2     3
> >>  OP_31_XOP_LDARX     :     3     0
> >>  33                  :     0     2
> >>  OP_31_XOP_LBZX      :     0     1
> >>  OP_31_XOP_LWAX      :     0     1
> >>  OP_31_XOP_LHZX      :     0     1
> >>
> >> perf report logs:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >>  Total Lost Samples: 0
> >>
> >>  Samples: 1K of event 'mem-loads'
> >>  Event count (approx.): 937238
> >>
> >>  Overhead  Data Type  Data Type Offset
> >> ........  .........  ................
> >>    48.60%  (unknown)  (unknown) +0 (no field)
> >>    11.42%  long unsigned int  long unsigned int +0 (current_stack_poin=
ter)
> >>     4.68%  struct paca_struct  struct paca_struct +2312 (__current)
> >>     4.57%  struct paca_struct  struct paca_struct +2354 (irq_soft_mask=
)
> >>     2.69%  struct paca_struct  struct paca_struct +2808 (canary)
> >>     2.68%  struct paca_struct  struct paca_struct +8 (paca_index)
> >>     2.24%  struct paca_struct  struct paca_struct +48 (data_offset)
> >>     1.43%  long unsigned int  long unsigned int +0 (no field)
> >>     1.41%  struct vm_fault  struct vm_fault +0 (vma)
> >>     1.29%  struct task_struct  struct task_struct +276 (flags)
> >>     1.03%  struct pt_regs  struct pt_regs +264 (user_regs.msr)
> >>     0.90%  struct security_hook_list  struct security_hook_list +0 (li=
st.next)
> >>     0.76%  struct irq_desc  struct irq_desc +304 (irq_data.chip)
> >>     0.76%  struct rq  struct rq +2856 (cpu)
> >>     0.72%  long long unsigned int  long long unsigned int +0 (no field=
)
> >
> > Thanks for your work!  But I think you need to split the basic part and
> > global register support part which needs more review.
> >
> > For the patch 1 to 14:
> > Reviewed-by: Namhyung Kim <namhyung@kernel.org>
>
> Hi Namhyung
>
> Thanks for all suggestions and reviews. I will check latest comments for =
patches 15 and 16 (also patch 17 is dependent the global register support p=
art). But patch 18 is not dependent on global register support patches. Alo=
ng with patches 1 to 14, can you please add patch 18 also ?

Sure, feel free to add it to the patch 18.

Reviewed-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung
