Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B1E92F478
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 05:49:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKyJg4G4Jz3fml
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 13:49:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.178; helo=mail-pf1-f178.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKyJH0PDBz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 13:49:02 +1000 (AEST)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70b5117ae06so1216182b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 20:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720756140; x=1721360940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSXX5olCsGS55Bu2Q8yDH+0ezCPJCQVbg+nfVyV0Zpw=;
        b=d8SPe6Y9lJrRyToDGwzvSJc5+DXmWLnA7zY6oFSKaIRBo/XL151b+1kQdzO+DQknzD
         kH9sZwKecj3IA4X406ula1F8X7IQhrbijtjPbYvH4X58larHjl7HNcwipoF/w9GKIlJX
         TV3Ieso/ADXKxjSWh39ACo4M+ixW5GF3iRtdOnZoOH2hOSKBw0oXToKawDdBtyXyJBt4
         E8ar1Jt+bCSaA7q380FycFv/RFlab4/5HmqtHvdUscup83KuafHKHBNoZrWQz/6XJ6Ew
         L5tTMKwaIWu9tHUmgJp5SDn61a91kR2i4Q6KFCKJLZw+3hkjLsphUJpDanh3kR6P0lOw
         GxRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5av/DymjXPHPo3sZiYpKKF8wWsF/Inf4pFvopd61F0iYTQfQknF1K3AETtasfLtpjU9cvdu1kJoXxXHwaIfUiUaKWNxvK4LtLr/R3kA==
X-Gm-Message-State: AOJu0YxGR2nJ0HLcFkGxUrMmH3Zp1WSMp6dFdTLMVnfU68fNCINJRPcS
	n3nMuxvpwrNOTz6XP8O1yaOzT1+vLpHOKDw594yG+tw6OjNwmlhnLeGK19sVMX1HHwD/YL78kqV
	+5mOCV6GCiLCH5bD+jIZZgYXZ+w4=
X-Google-Smtp-Source: AGHT+IHhRnCyKhsQOrwte0UyTNmTDEOv8lkwSIopQlXJPIO+4SjMLk4z2IGpOkzOzYthKgn5aK5U7CIADGyXAI28DDs=
X-Received: by 2002:a05:6a20:6a21:b0:1c2:8cf6:82cd with SMTP id
 adf61e73a8af0-1c2981ff8d4mr14568866637.10.1720756140336; Thu, 11 Jul 2024
 20:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240707144419.92510-1-atrajeev@linux.vnet.ibm.com> <5CBFBE42-A15C-47A4-B980-62313FEF1EFA@linux.vnet.ibm.com>
In-Reply-To: <5CBFBE42-A15C-47A4-B980-62313FEF1EFA@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Thu, 11 Jul 2024 20:48:48 -0700
Message-ID: <CAM9d7ciKgZ+432DcpNL_sJcR2W8_366vYQXs+LeCSx0YRWDVoA@mail.gmail.com>
Subject: Re: [PATCH V6 00/18] Add data type profiling support for powerpc
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
Cc: Ian Rogers <irogers@google.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, akanksha@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Athira,

On Thu, Jul 11, 2024 at 8:45=E2=80=AFPM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
>
>
> > On 7 Jul 2024, at 8:14=E2=80=AFPM, Athira Rajeev <atrajeev@linux.vnet.i=
bm.com> wrote:
> >
> > The patchset from Namhyung added support for data type profiling
> > in perf tool. This enabled support to associate PMU samples to data
> > types they refer using DWARF debug information. With the upstream
> > perf, currently it possible to run perf report or perf annotate to
> > view the data type information on x86.
> >
> > Initial patchset posted here had changes need to enable data type
> > profiling support for powerpc.
> >
>
> Hi Namhyung,
>
> Requesting for review on this V6 patchset. I have addressed review commen=
ts from V5.
> If the patchset looks good, can you please pull this in.

It'd be nice if you can get any Acked-/Reviewed-/Tested-by tags from
powerpc folks.

Thanks,
Namhyung


> > https://lore.kernel.org/all/6e09dc28-4a2e-49d8-a2b5-ffb3396a9952@csgrou=
p.eu/T/
> >
> > Main change were:
> > 1. powerpc instruction nmemonic table to associate load/store
> > instructions with move_ops which is use to identify if instruction
> > is a memory access one.
> > 2. To get register number and access offset from the given
> > instruction, code uses fields from "struct arch" -> objump.
> > Added entry for powerpc here.
> > 3. A get_arch_regnum to return register number from the
> > register name string.
> >
> > But the apporach used in the initial patchset used parsing of
> > disassembled code which the current perf tool implementation does.
> >
> > Example: lwz     r10,0(r9)
> >
> > This line "lwz r10,0(r9)" is parsed to extract instruction name,
> > registers names and offset. Also to find whether there is a memory
> > reference in the operands, "memory_ref_char" field of objdump is used.
> > For x86, "(" is used as memory_ref_char to tackle instructions of the
> > form "mov  (%rax), %rcx".
> >
> > In case of powerpc, not all instructions using "(" are the only memory
> > instructions. Example, above instruction can also be of extended form (=
X
> > form) "lwzx r10,0,r19". Inorder to easy identify the instruction catego=
ry
> > and extract the source/target registers, second patchset added support =
to use
> > raw instruction. With raw instruction, macros are added to extract opco=
de
> > and register fields.
> > Link to second patchset:
> > https://lore.kernel.org/all/20240506121906.76639-1-atrajeev@linux.vnet.=
ibm.com/
> >
> > Example representation using --show-raw-insn in objdump gives result:
> >
> > 38 01 81 e8     ld      r4,312(r1)
> >
> > Here "38 01 81 e8" is the raw instruction representation. In powerpc,
> > this translates to instruction form: "ld RT,DS(RA)" and binary code
> > as:
> >  _____________________________________
> >  | 58 |  RT  |  RA |      DS       | |
> >  -------------------------------------
> > 0    6     11    16              30 31
> >
> > Second patchset used "objdump" again to read the raw instruction.
> > But since there is no need to disassemble and binary code can be read
> > directly from the DSO, third patchset (ie this patchset) uses below
> > apporach. The apporach preferred in powerpc to parse sample for data
> > type profiling in V3 patchset is:
> > - Read directly from DSO using dso__data_read_offset
> > - If that fails for any case, fallback to using libcapstone
> > - If libcapstone is not supported, approach will use objdump
> >
> > Patchset adds support to pick the opcode and reg fields from this
> > raw/binary instruction code. This approach came in from review comment
> > by Segher Boessenkool and Christophe for the initial patchset.
> >
> > Apart from that, instruction tracking is enabled for powerpc and
> > support function is added to find variables defined as registers
> > Example, in powerpc, below two registers are
> > defined to represent variable:
> > 1. r13: represents local_paca
> > register struct paca_struct *local_paca asm("r13");
> >
> > 2. r1: represents stack_pointer
> > register void *__stack_pointer asm("r1");
> >
> > These are handled in this patchset.
> >
> > - Patch 1 is to rearrange register state type structures to header file
> > so that it can referred from other arch specific files
> > - Patch 2 is to make instruction tracking as a callback to"struct arch"
> > so that it can be implemented by other archs easily and defined in arch
> > specific files
> > - Patch 3 is to handle state type regs array size for x86 and powerpc
> > - Patch 4 adds support to capture and parse raw instruction in powerpc
> > using dso__data_read_offset utility
> > - Patch 4 also adds logic to support using objdump when doing default "=
perf
> > report" or "perf annotate" since it that needs disassembled instruction=
.
> > - Patch 5 adds disasm_line__parse to parse raw instruction for powerpc
> > - Patch 6 update parameters for reg extract functions to use raw
> > instruction on powerpc
> > - Patch 7 updates ins__find to carry raw_insn and also adds parse
> > callback for memory instructions for powerpc
> > - Patch 8 add support to identify memory instructions of opcode 31 in
> > powerpc
> > - Patch 9 adds more instructions to support instruction tracking in pow=
erpc
> > - Patch 10 and 11 handles instruction tracking for powerpc.
> > - Patch 12, 13 and 14 add support to use libcapstone in powerpc
> > - Patch 15 and patch 16 handles support to find global register variabl=
es
> > - PAtch 17 updates data type compare functions data_type_cmp and
> >  sort__typeoff_sort to include var_name along with type_name in
> >  comparison.
> > - Patch 18 handles insn-stat option for perf annotate
> >
> > Note:
> > - There are remaining unknowns (25%) as seen in annotate Instruction st=
ats
> > below.
> > - This patchset is not tested on powerpc32. In next step of enhancement=
s
> > along with handling remaining unknowns, plan to cover powerpc32 changes
> > based on how testing goes.
> >
> > With the current patchset:
> >
> > ./perf record -a -e mem-loads sleep 1
> > ./perf report -s type,typeoff --hierarchy --group --stdio
> > ./perf annotate --data-type --insn-stat
> >
> > perf annotate logs:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Annotate Instruction stats
> > total 609, ok 446 (73.2%), bad 163 (26.8%)
> >
> >  Name/opcode:  Good   Bad
> >  -----------------------------------------------------------
> >  58                  :   323    80
> >  32                  :    49    43
> >  34                  :    33    11
> >  OP_31_XOP_LDX       :     8    20
> >  40                  :    23     0
> >  OP_31_XOP_LWARX     :     5     1
> >  OP_31_XOP_LWZX      :     2     3
> >  OP_31_XOP_LDARX     :     3     0
> >  33                  :     0     2
> >  OP_31_XOP_LBZX      :     0     1
> >  OP_31_XOP_LWAX      :     0     1
> >  OP_31_XOP_LHZX      :     0     1
> >
> > perf report logs:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >  Total Lost Samples: 0
> >
> >  Samples: 1K of event 'mem-loads'
> >  Event count (approx.): 937238
> >
> >  Overhead  Data Type  Data Type Offset
> > ........  .........  ................
> >    48.60%  (unknown)  (unknown) +0 (no field)
> >    11.42%  long unsigned int  long unsigned int +0 (current_stack_point=
er)
> >     4.68%  struct paca_struct  struct paca_struct +2312 (__current)
> >     4.57%  struct paca_struct  struct paca_struct +2354 (irq_soft_mask)
> >     2.69%  struct paca_struct  struct paca_struct +2808 (canary)
> >     2.68%  struct paca_struct  struct paca_struct +8 (paca_index)
> >     2.24%  struct paca_struct  struct paca_struct +48 (data_offset)
> >     1.43%  long unsigned int  long unsigned int +0 (no field)
> >     1.41%  struct vm_fault  struct vm_fault +0 (vma)
> >     1.29%  struct task_struct  struct task_struct +276 (flags)
> >     1.03%  struct pt_regs  struct pt_regs +264 (user_regs.msr)
> >     0.90%  struct security_hook_list  struct security_hook_list +0 (lis=
t.next)
> >     0.76%  struct irq_desc  struct irq_desc +304 (irq_data.chip)
> >     0.76%  struct rq  struct rq +2856 (cpu)
> >     0.72%  long long unsigned int  long long unsigned int +0 (no field)
> >
> > Thanks
> > Athira Rajeev
> >
> > Changelog:
> > From v5 -> v6:
> > - Addressed review comments from Namhyung
> >  Conditionally define TYPE_STATE_MAX_REGS based on arch.
> >  Added macro for defining width of the raw codes and spaces
> >  in disasm_line__parse_powerpc.
> >  Call disasm_line__parse from disasm_line__parse_powerpc
> >  for generic code.
> >  Renamed symbol__disassemble_dso to symbol__disassemble_raw.
> >  Fixed find_data_type_global_reg to correclty free var_types
> >  and change indent level.
> >  Fixed data_type_cmp and sort__typeoff_sort to include var_name
> >  in comparing data type entries.
>
> >
> > From v4 -> v5:
> > - Addressed review comments from Namhyung
> >  Handle max number of type state regs as 16 for x86 and 32 for
> >  powerpc.
> >  Added generic support for objdump patch first and DSO read
> >  optimisation next
> >  combined patch 3 and patch 4 in patchseries V4 to one patch
> >  Changed reference for "raw_insn" to use "u32"
> >  Splitted "parse" callback patch changes and "ins__find" patch
> >  changes into two
> >  Instead of making weak function, added get_powerpc_regs to
> >  extract register and offset fields for powerpc
> > - Addressed complation fail when "dwarf.h" is not present ie
> >  elfutils devel is not present. Used includes for #ifdef HAVE_DWARF_SUP=
PORT
> >  when including functions that use Dwarf references. Also
> >  conditionally include some of the header files.
> >
> > From v3->v4:
> > - Addressed review comments from Ian by using capston_init from
> >  "util/print_insn.c" instead of "open_capston_handle".
> > - Addressed review comment from Namhyung by moving "opcode"
> >  field from "struct ins" to "struct disasm_line"
> >
> > From v2->v3:
> > - Addressed review comments from Christophe and Namhyung for V2
> > - Changed the apporach in powerpc to parse sample for data
> >  type profiling as:
> >  Read directly from DSO using dso__data_read_offset
> >  If that fails for any case, fallback to using libcapstone
> >  If libcapstone is not supported, approach will use objdump
> > - Include instructions with opcode as 31 and correctly categorize
> >  them as memory or arithmetic instructions.
> > - Include more instructions for instruction tracking in powerpc
> >
> > From v1->v2:
> > - Addressed suggestion from Christophe Leroy and Segher Boessenkool
> >  to use the binary code (raw insn) to fetch opcode, register and
> >  offset fields.
> > - Added support for instruction tracking in powerpc
> > - Find the register defined variables (r13 and r1 which points to
> >  local_paca and current_stack_pointer in powerpc)
> >
> > Athira Rajeev (18):
> >  tools/perf: Move the data structures related to register type to
> >    header file
> >  tools/perf: Add "update_insn_state" callback function to handle arch
> >    specific instruction tracking
> >  tools/perf: Update TYPE_STATE_MAX_REGS to include max of regs in
> >    powerpc
> >  tools/perf: Add disasm_line__parse to parse raw instruction for
> >    powerpc
> >  tools/perf: Add support to capture and parse raw instruction in
> >    powerpc using dso__data_read_offset utility
> >  tools/perf: Update parameters for reg extract functions to use raw
> >    instruction on powerpc
> >  tools/perf: Add parse function for memory instructions in powerpc
> >  tools/perf: Add support to identify memory instructions of opcode 31
> >    in powerpc
> >  tools/perf: Add some of the arithmetic instructions to support
> >    instruction tracking in powerpc
> >  tools/perf: Add more instructions for instruction tracking
> >  tools/perf: Update instruction tracking for powerpc
> >  tools/perf: Make capstone_init non-static so that it can be used
> >    during symbol disassemble
> >  tools/perf: Use capstone_init and remove open_capstone_handle from
> >    disasm.c
> >  tools/perf: Add support to use libcapstone in powerpc
> >  tools/perf: Add support to find global register variables using
> >    find_data_type_global_reg
> >  tools/perf: Add support for global_die to capture name of variable in
> >    case of register defined variable
> >  tools/perf: Update data_type_cmp and sort__typeoff_sort function to
> >    include var_name in comparison
> >  tools/perf: Set instruction name to be used with insn-stat when using
> >    raw instruction
> >
> > tools/include/linux/string.h                  |   2 +
> > tools/lib/string.c                            |  13 +
> > tools/perf/arch/arm64/annotate/instructions.c |   3 +-
> > .../arch/loongarch/annotate/instructions.c    |   6 +-
> > .../perf/arch/powerpc/annotate/instructions.c | 254 ++++++++
> > tools/perf/arch/powerpc/util/dwarf-regs.c     |  53 ++
> > tools/perf/arch/s390/annotate/instructions.c  |   5 +-
> > tools/perf/arch/x86/annotate/instructions.c   | 377 ++++++++++++
> > tools/perf/builtin-annotate.c                 |   4 +-
> > tools/perf/util/annotate-data.c               | 545 ++++--------------
> > tools/perf/util/annotate-data.h               |  83 +++
> > tools/perf/util/annotate.c                    |  29 +-
> > tools/perf/util/annotate.h                    |   6 +-
> > tools/perf/util/disasm.c                      | 468 +++++++++++++--
> > tools/perf/util/disasm.h                      |  19 +-
> > tools/perf/util/dwarf-aux.c                   |   1 +
> > tools/perf/util/dwarf-aux.h                   |   1 +
> > tools/perf/util/include/dwarf-regs.h          |  12 +
> > tools/perf/util/print_insn.c                  |  15 +-
> > tools/perf/util/print_insn.h                  |   5 +
> > tools/perf/util/sort.c                        |  23 +-
> > 21 files changed, 1420 insertions(+), 504 deletions(-)
> >
> > --
> > 2.43.0
> >
> >
>
