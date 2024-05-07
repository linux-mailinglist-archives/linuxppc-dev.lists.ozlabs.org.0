Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1AF8BDA3B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 06:40:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYQYv3L9zz3cXS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 14:40:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.215.178; helo=mail-pg1-f178.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYQYS6MDXz3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 14:39:55 +1000 (AEST)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-61c4ebd0c99so1761529a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2024 21:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715056792; x=1715661592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MKQ1m0cR5GXTfV3vrKrtXRNV5HtWIapOkkD1OPNVow=;
        b=QuDF/+QQl4v2ifOGQYayotxG+KmxnXzPGEufr28Bjk9T0F/b2ZCjjwhP9Nn6oT1kOg
         I5uVJ3nkYVKO3NSpRwCdnObBJfnUF0Y+wknAJHrg8+FydsZum/TrM5Z/gM51NhWKRfKV
         KG4LPSisKhIWrwnMHsOknjlWC06a0DSWhQGM0xhRM5Mu3DbJim0/n9ZEQAe22AbdXB1u
         60YRE7+YWpojufh3kdtLeeIiK6gSr1kHjlvt5St+rvWezDvDnot3v5esem7fKUlTTZ+J
         Gt/Gqdr+He9fuWOvY1EXxHs/G3KaVcix1Vo9N0TV+mXQK0m12avjRNl2umK0+BvUo1vK
         LHUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5CnwUkDSjL22xhFopEtfw1aiNyicyeoYxwlbf1jcMgzMC9Agmk97wCThyPN6XvCPWYeCEBprhqaTMNrziS5IIXMF5L7E8TMj8txycYQ==
X-Gm-Message-State: AOJu0Yx1qPCb8TteAOweiQE+y7DbxQkMC3FFRa2C0HGdYTTQUelbyufo
	KvcBG4CHLI+JvThOj8lRCYU1T3N8vxTtLs9ObCZrgEVIbbzQE7mLUXfg5COlOk38u4il22Ew089
	YGyC/ZNoWhHCWa3fk/R0rgHKtarE=
X-Google-Smtp-Source: AGHT+IEhW9HUanbWLcjSZcgHRFbiBKujsMANA8EaogR44KM6NRvbonmJQQ4kHJKv+YtTfKurtgeq2mgKWtfY3r+cEUE=
X-Received: by 2002:a05:6a20:7348:b0:1a9:b4ed:a with SMTP id
 v8-20020a056a20734800b001a9b4ed000amr16356223pzc.20.1715056792347; Mon, 06
 May 2024 21:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Mon, 6 May 2024 21:39:40 -0700
Message-ID: <CAM9d7ci=AZFpcYy4=qwTYTTVhWd6g6HHHUuV2B53hS-t8SOCag@mail.gmail.com>
Subject: Re: [PATCH V2 0/9] Add data type profiling support for powerpc
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, acme@kernel.org, jolsa@kernel.org, akanksha@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Mon, May 6, 2024 at 5:19=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> The patchset from Namhyung added support for data type profiling
> in perf tool. This enabled support to associate PMU samples to data
> types they refer using DWARF debug information. With the upstream
> perf, currently it possible to run perf report or perf annotate to
> view the data type information on x86.
>
> Initial patchset posted here had changes need to enable data type
> profiling support for powerpc.
>
> https://lore.kernel.org/all/6e09dc28-4a2e-49d8-a2b5-ffb3396a9952@csgroup.=
eu/T/
>
> Main change were:
> 1. powerpc instruction nmemonic table to associate load/store
> instructions with move_ops which is use to identify if instruction
> is a memory access one.
> 2. To get register number and access offset from the given
> instruction, code uses fields from "struct arch" -> objump.
> Added entry for powerpc here.
> 3. A get_arch_regnum to return register number from the
> register name string.
>
> But the apporach used in the initial patchset used parsing of
> disassembled code which the current perf tool implementation does.
>
> Example: lwz     r10,0(r9)
>
> This line "lwz r10,0(r9)" is parsed to extract instruction name,
> registers names and offset. Also to find whether there is a memory
> reference in the operands, "memory_ref_char" field of objdump is used.
> For x86, "(" is used as memory_ref_char to tackle instructions of the
> form "mov  (%rax), %rcx".
>
> In case of powerpc, not all instructions using "(" are the only memory
> instructions. Example, above instruction can also be of extended form (X
> form) "lwzx r10,0,r19". Inorder to easy identify the instruction category
> and extract the source/target registers, this patchset adds support to us=
e
> raw instruction. With raw instruction, macros are added to extract opcode
> and register fields.
>
> Example representation using --show-raw-insn in objdump gives result:
>
> 38 01 81 e8     ld      r4,312(r1)
>
> Here "38 01 81 e8" is the raw instruction representation. In powerpc,
> this translates to instruction form: "ld RT,DS(RA)" and binary code
> as:
> _____________________________________
> | 58 |  RT  |  RA |      DS       | |
> -------------------------------------
> 0    6     11    16              30 31
>
> Patchset adds support to pick the opcode and reg fields from this
> raw/binary instruction code. This approach came in from review comment
> by Segher Boessenkool for the initial patchset.
>
> Apart from that, instruction tracking is enabled for powerpc and
> support function is added to find variables defined as registers
> Example, in powerpc, two registers are
> defined to represent variable:
> 1. r13: represents local_paca
> register struct paca_struct *local_paca asm("r13");
>
> 2. r1: represents stack_pointer
> register void *__stack_pointer asm("r1");
>
> These are handled in this patchset.
>
> - Patch 1 is to rearrange register state type structures to header file
> so that it can referred from other arch specific files
> - Patch 2 is to make instruction tracking as a callback to"struct arch"
> so that it can be implemented by other archs easily and defined in arch
> specific files
> - Patch 3 is to fix a small comment
> - Patch 4 adds support to capture and parse raw instruction in objdump
> by keeping existing approach intact.
> - Patch 5 update parameters for reg extract functions to use raw
> instruction on powerpc
> - Patch 6 and patch 7 handles instruction tracking for powerpc.
> - Patch 8 and Patch 8 handles support to find global register variables
>
> With the current patchset:
>
>  ./perf record -a -e mem-loads sleep 1
>  ./perf report -s type,typeoff --hierarchy --group --stdio
>  ./perf annotate --data-type --insn-stat
>
> perf annotate logs:
>
> Annotate Instruction stats
> total 562, ok 441 (78.5%), bad 121 (21.5%)
>
>   Name      :  Good   Bad
> -----------------------------------------------------------
>   ld        :   313    54
>   lwz       :    51    32
>   lbz       :    31     5
>   ldx       :     6    21
>   lhz       :    23     0
>   lwa       :     4     3
>   lwarx     :     5     0
>   lwzx      :     2     2
>   ldarx     :     3     0
>   lwzu      :     2     0
>   stdcx.    :     0     1
>   nop       :     0     1
>   ldu       :     1     0
>   lbzx      :     0     1
>   lwax      :     0     1
>
> perf report logs:
>
> # Samples: 1K of event 'mem-loads'
> # Event count (approx.): 937238
> #
> # Overhead  Data Type  Data Type Offset
> # ........  .........  ................
> #
>     48.81%  (unknown)  (unknown) +0 (no field)
>     12.85%  long unsigned int  long unsigned int +0 (current_stack_pointe=
r)
>      4.68%  struct paca_struct  struct paca_struct +2312 (__current)
>      4.57%  struct paca_struct  struct paca_struct +2354 (irq_soft_mask)
>      2.68%  struct paca_struct  struct paca_struct +8 (paca_index)
>      2.64%  struct paca_struct  struct paca_struct +2808 (canary)
>      2.24%  struct paca_struct  struct paca_struct +48 (data_offset)
>      1.41%  struct vm_fault  struct vm_fault +0 (vma)
>      1.29%  struct task_struct  struct task_struct +276 (flags)
>      1.03%  struct pt_regs  struct pt_regs +264 (user_regs.msr)
>      1.00%  struct menu_device  struct menu_device +4 (tick_wakeup)
>      0.90%  struct security_hook_list  struct security_hook_list +0 (list=
.next)
>      0.76%  struct irq_desc  struct irq_desc +304 (irq_data.chip)
>      0.76%  struct rq  struct rq +2856 (cpu)

Looks great!  I'm glad it worked on powerpc too.
We still need to verify the returned type is properly annotated.
But overall it looks really good, I will leave comments in reply.

Thanks,
Namhyung

>
> Thanks
> Athira Rajeev
>
> Changelog:
> From v1->v2:
> - Addressed suggestion from Christophe Leroy and Segher Boessenkool
>   to use the binary code (raw insn) to fetch opcode, register and
>   offset fields.
> - Added support for instruction tracking in powerpc
> - Find the register defined variables (r13 and r1 which points to
>   local_paca and current_stack_pointer in powerpc)
>
> Athira Rajeev (9):
>   tools/perf: Move the data structures related to register  type to
>     header file
>   tools/perf: Add "update_insn_state" callback function to handle arch
>     specific instruction tracking
>   tools/perf: Fix a comment about multi_regs in extract_reg_offset
>     function
>   tools/perf: Add support to capture and parse raw instruction in
>     objdump
>   tools/perf: Update parameters for reg extract functions to use raw
>     instruction on powerpc
>   tools/perf: Update instruction tracking for powerpc
>   tools/perf: Update instruction tracking with add instruction
>   tools/perf: Add support to find global register variables using
>     find_data_type_global_reg
>   tools/perf: Add support for global_die to capture name of variable in
>     case of register defined variable
>
>  tools/include/linux/string.h                  |   2 +
>  tools/lib/string.c                            |  13 +
>  .../perf/arch/powerpc/annotate/instructions.c |  84 +++
>  tools/perf/arch/powerpc/util/dwarf-regs.c     |  52 ++
>  tools/perf/arch/x86/annotate/instructions.c   | 383 +++++++++++++
>  tools/perf/util/annotate-data.c               | 519 +++---------------
>  tools/perf/util/annotate-data.h               |  78 +++
>  tools/perf/util/annotate.c                    |  32 +-
>  tools/perf/util/annotate.h                    |   1 +
>  tools/perf/util/disasm.c                      | 109 +++-
>  tools/perf/util/disasm.h                      |  17 +-
>  tools/perf/util/dwarf-aux.c                   |   1 +
>  tools/perf/util/dwarf-aux.h                   |   1 +
>  tools/perf/util/include/dwarf-regs.h          |  12 +
>  tools/perf/util/sort.c                        |   7 +-
>  15 files changed, 854 insertions(+), 457 deletions(-)
>
> --
> 2.43.0
>
