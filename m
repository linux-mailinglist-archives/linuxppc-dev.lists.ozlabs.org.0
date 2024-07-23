Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D24193A7FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 22:08:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P04ucTqF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WT7Vp0M4Yz3ccf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 06:08:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P04ucTqF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WT7V7111Pz3cZ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 06:07:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 112B960EA6;
	Tue, 23 Jul 2024 20:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9B7C4AF09;
	Tue, 23 Jul 2024 20:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721765243;
	bh=c39NElwI9aObYt1pGTqlFJRmam8cihqu4wr02ztzNfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P04ucTqFrkKJ2FIidm0VknxYuEYSZLtHjERskgAhdThPn4t2Vkvi31dyJCZt+uyHR
	 LWpMcgKhIl7FOBSLnIXygrBGIAkNd/HwStKiefcVFeZcxWhHkGhIO529OrlGCSZNRC
	 PW/hUggJ1yYC47Pu/12SnUAsLeB7s+Hq2qBg5lfTaa7dZ0+6gh/rR3plWIeJnnrekp
	 rY+PVb9THsWz4VLcsn8moDKD61WQ8q15r+WAo82rUvpCSAVpsc/WwAweNxHSagLJg7
	 XdqzVmwOh08RrxPWVt6f76LoskSSIuJY3lZ8HYQVvKU74wICkJ4IZttb/1MN1cjhTB
	 ilK0IUGPWlg8A==
Date: Tue, 23 Jul 2024 17:07:19 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V8 00/15] Add data type profiling support for powerpc
Message-ID: <ZqANd2cGSM3bSDr6@x1>
References: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 18, 2024 at 02:13:43PM +0530, Athira Rajeev wrote:
> The patchset from Namhyung added support for data type profiling
> in perf tool. This enabled support to associate PMU samples to data
> types they refer using DWARF debug information. With the upstream
> perf, currently it possible to run perf report or perf annotate to
> view the data type information on x86.
> 
> Initial patchset posted here had changes need to enable data type
> profiling support for powerpc.

I have this in tmp.perf-tools-next now, will do more tests before moving
to perf-tools-next.

I see that Namhyung reviewed the patch series, and that it was tested,
in general I thought we need to go on improving things go avoid having
arch specific code in the non-arch code, I guess right now its important
to land these to try and encourage people to try data-type profiling
more widely, hopefully finding and improving data structures in the
kernel.

We need to write about such cases so as to provide success stories on
using perf for data-type profiling.

Thanks for working on this!

- Arnaldo
 
> https://lore.kernel.org/all/6e09dc28-4a2e-49d8-a2b5-ffb3396a9952@csgroup.eu/T/
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
> and extract the source/target registers, second patchset added support to use
> raw instruction. With raw instruction, macros are added to extract opcode
> and register fields.
> Link to second patchset:
> https://lore.kernel.org/all/20240506121906.76639-1-atrajeev@linux.vnet.ibm.com/
> 
> Example representation using --show-raw-insn in objdump gives result:
> 
> 38 01 81 e8     ld      r4,312(r1)
> 
> Here "38 01 81 e8" is the raw instruction representation. In powerpc,
> this translates to instruction form: "ld RT,DS(RA)" and binary code
> as:
>   _____________________________________
>   | 58 |  RT  |  RA |      DS       | |
>   -------------------------------------
> 0    6     11    16              30 31
> 
> Second patchset used "objdump" again to read the raw instruction.
> But since there is no need to disassemble and binary code can be read
> directly from the DSO, third patchset (ie this patchset) uses below
> apporach. The apporach preferred in powerpc to parse sample for data
> type profiling in V3 patchset is:
> - Read directly from DSO using dso__data_read_offset
> - If that fails for any case, fallback to using libcapstone
> - If libcapstone is not supported, approach will use objdump
> 
> Patchset adds support to pick the opcode and reg fields from this
> raw/binary instruction code. This approach came in from review comment
> by Segher Boessenkool and Christophe for the initial patchset.
> 
> Apart from that, instruction tracking is enabled for powerpc.
> 
> These are handled in this patchset.
> 
> - Patch 1 is to rearrange register state type structures to header file
> so that it can referred from other arch specific files
> - Patch 2 is to make instruction tracking as a callback to"struct arch"
> so that it can be implemented by other archs easily and defined in arch
> specific files
> - Patch 3 is to handle state type regs array size for x86 and powerpc
> - Patch 4 adds support to capture and parse raw instruction in powerpc
> using dso__data_read_offset utility
> - Patch 4 also adds logic to support using objdump when doing default "perf
> report" or "perf annotate" since it that needs disassembled instruction.
> - Patch 5 adds disasm_line__parse to parse raw instruction for powerpc
> - Patch 6 update parameters for reg extract functions to use raw
> instruction on powerpc
> - Patch 7 updates ins__find to carry raw_insn and also adds parse
> callback for memory instructions for powerpc
> - Patch 8 add support to identify memory instructions of opcode 31 in
> powerpc
> - Patch 9 adds more instructions to support instruction tracking in powerpc
> - Patch 10 and 11 handles instruction tracking for powerpc.
> - Patch 12, 13 and 14 add support to use libcapstone in powerpc
> - Patch 15 handles insn-stat option for perf annotate
> 
> Note:
> - There are remaining unknowns (25%) as seen in annotate Instruction stats
> below.
> - This patchset is not tested on powerpc32. In next step of enhancements
> along with handling remaining unknowns, plan to cover powerpc32 changes
> based on how testing goes.
> - Patch changes to handle global register support will be posted in
> follow up after addressing review comment from Namhung here:
> https://lore.kernel.org/linux-perf-users/CAM9d7cg5MYvLeOoBuKqp1pw7uvRfqCw1fXpLtgct0npL96JaYg@mail.gmail.com/T/#mb309184ebf5d2c9b539cd86d61ffe2a3696eac71
> 
> With the current patchset:
> 
>  ./perf record -a -e mem-loads sleep 1
>  ./perf report -s type,typeoff --hierarchy --group --stdio
>  ./perf annotate --data-type --insn-stat
> 
> perf annotate logs:
> ==================
> 
> Annotate Instruction stats
> total 609, ok 266 (43.7%), bad 343 (56.3%)
> 
>   Name/opcode         :  Good   Bad
> -----------------------------------------------------------
>   58                  :   172   231
>   32                  :    48    44
>   34                  :    19    25
>   OP_31_XOP_LDX       :     8    20
>   40                  :     9    14
>   OP_31_XOP_LWARX     :     5     1
>   OP_31_XOP_LWZX      :     2     3
>   OP_31_XOP_LDARX     :     3     0
>   33                  :     0     2
>   OP_31_XOP_LBZX      :     0     1
>   OP_31_XOP_LWAX      :     0     1
>   OP_31_XOP_LHZX      :     0     1
>  
> perf report logs:
> =================
> 
>   Total Lost Samples: 0
> 
>   Samples: 1K of event 'mem-loads'
>   Event count (approx.): 937238
> 
>     Overhead  Data Type / Data Type Offset
>     ........  .........  ................
>      1.73%     struct task_struct
>         1.29%     struct task_struct +276 (flags)
>         0.10%     struct task_struct +1872 (mm)
>         0.08%     struct task_struct +3632 (thread.regs)
>         0.08%     struct task_struct +1072 (sched_class)
>         0.05%     struct task_struct +1928 ()
>         0.03%     struct task_struct +1064 (dl_server)
>         0.02%     struct task_struct +0 (thread_info.preempt_count)
>         0.02%     struct task_struct +120 (thread_info)
>         0.02%     struct task_struct +2216 (worker_private)
>         0.02%     struct task_struct +24 (thread_info.slb_preload_nr)
>         0.02%     struct task_struct +8 (thread_info.local_flags)
>         0.01%     struct task_struct +1416 (nr_cpus_allowed)
>      1.68%     struct file
>         0.58%     struct file +176 (f_op)
>         0.53%     struct file +24 (f_count.counter)
>         0.46%     struct file +20 (f_mode)
>         0.11%     struct file +200 (private_data)
>      1.63%     struct rq
>         0.76%     struct rq +2856 (cpu)
>         0.21%     struct rq +2592 (curr)
>         0.11%     struct rq +2632 (clock_update_flags)
>         0.08%     struct rq +2600 (idle)
>         0.06%     struct rq +2688 (clock_task)
>         0.05%     struct rq +16 (numa_migrate_on)
>         0.04%     struct rq +2864 (cfs_tasks.next)
> 
> Thanks
> Athira Rajeev
> 
> Changelog:
> >From v7 -> v8:
>   Split patches 1 to 14 and patch 18 as basic patches.
>   Patch 15, 16 and 17 is related to global register handling
>   and will be handled separately.
>   Added Reviewed-and-tested-by from Kajol Jain
>   Added Reviewed-by from Namhyung for patches 1 to 14, patch 18
> 
> >From v6 -> v7:
> - Addressed review comments from Namhyung
>   Changed format string space to %-20s while printing
>   instruction stats in patch 18.
>   Use cmp_null in patch 17 while comparing var_name to
>   properly sort with correct order.
> 
> >From v5 -> v6:
> - Addressed review comments from Namhyung
>   Conditionally define TYPE_STATE_MAX_REGS based on arch.
>   Added macro for defining width of the raw codes and spaces
>   in disasm_line__parse_powerpc.
>   Call disasm_line__parse from disasm_line__parse_powerpc
>   for generic code.
>   Renamed symbol__disassemble_dso to symbol__disassemble_raw.
>   Fixed find_data_type_global_reg to correclty free var_types
>   and change indent level.
>   Fixed data_type_cmp and sort__typeoff_sort to include var_name
>   in comparing data type entries.
>   
> >From v4 -> v5:
> - Addressed review comments from Namhyung
>   Handle max number of type state regs as 16 for x86 and 32 for
>   powerpc.
>   Added generic support for objdump patch first and DSO read
>   optimisation next
>   combined patch 3 and patch 4 in patchseries V4 to one patch
>   Changed reference for "raw_insn" to use "u32"
>   Splitted "parse" callback patch changes and "ins__find" patch
>   changes into two
>   Instead of making weak function, added get_powerpc_regs to
>   extract register and offset fields for powerpc
> - Addressed complation fail when "dwarf.h" is not present ie
>   elfutils devel is not present. Used includes for #ifdef HAVE_DWARF_SUPPORT
>   when including functions that use Dwarf references. Also
>   conditionally include some of the header files.
> 
> >From v3->v4:
> - Addressed review comments from Ian by using capston_init from
>   "util/print_insn.c" instead of "open_capston_handle".
> - Addressed review comment from Namhyung by moving "opcode"
>   field from "struct ins" to "struct disasm_line"
> 
> >From v2->v3:
> - Addressed review comments from Christophe and Namhyung for V2
> - Changed the apporach in powerpc to parse sample for data
>   type profiling as:
>   Read directly from DSO using dso__data_read_offset
>   If that fails for any case, fallback to using libcapstone
>   If libcapstone is not supported, approach will use objdump
> - Include instructions with opcode as 31 and correctly categorize
>   them as memory or arithmetic instructions.
> - Include more instructions for instruction tracking in powerpc
> 
> >From v1->v2:
> - Addressed suggestion from Christophe Leroy and Segher Boessenkool
>   to use the binary code (raw insn) to fetch opcode, register and
>   offset fields.
> - Added support for instruction tracking in powerpc
> - Find the register defined variables (r13 and r1 which points to
>   local_paca and current_stack_pointer in powerpc)
> 
> Athira Rajeev (15):
>   tools/perf: Move the data structures related to register type to
>     header file
>   tools/perf: Add "update_insn_state" callback function to handle arch
>     specific instruction tracking
>   tools/perf: Update TYPE_STATE_MAX_REGS to include max of regs in
>     powerpc
>   tools/perf: Add disasm_line__parse to parse raw instruction for
>     powerpc
>   tools/perf: Add support to capture and parse raw instruction in
>     powerpc using dso__data_read_offset utility
>   tools/perf: Update parameters for reg extract functions to use raw
>     instruction on powerpc
>   tools/perf: Add parse function for memory instructions in powerpc
>   tools/perf: Add support to identify memory instructions of opcode 31
>     in powerpc
>   tools/perf: Add some of the arithmetic instructions to support
>     instruction tracking in powerpc
>   tools/perf: Add more instructions for instruction tracking
>   tools/perf: Update instruction tracking for powerpc
>   tools/perf: Make capstone_init non-static so that it can be used
>     during symbol disassemble
>   tools/perf: Use capstone_init and remove open_capstone_handle from
>     disasm.c
>   tools/perf: Add support to use libcapstone in powerpc
>   tools/perf: Set instruction name to be used with insn-stat when using
>     raw instruction
> 
>  tools/include/linux/string.h                  |   2 +
>  tools/lib/string.c                            |  13 +
>  tools/perf/arch/arm64/annotate/instructions.c |   3 +-
>  .../arch/loongarch/annotate/instructions.c    |   6 +-
>  .../perf/arch/powerpc/annotate/instructions.c | 254 ++++++++++
>  tools/perf/arch/powerpc/util/dwarf-regs.c     |  53 ++
>  tools/perf/arch/s390/annotate/instructions.c  |   5 +-
>  tools/perf/arch/x86/annotate/instructions.c   | 377 ++++++++++++++
>  tools/perf/builtin-annotate.c                 |   4 +-
>  tools/perf/util/annotate-data.c               | 453 +----------------
>  tools/perf/util/annotate-data.h               |  83 ++++
>  tools/perf/util/annotate.c                    |  21 +-
>  tools/perf/util/annotate.h                    |   5 +-
>  tools/perf/util/disasm.c                      | 468 ++++++++++++++++--
>  tools/perf/util/disasm.h                      |  19 +-
>  tools/perf/util/include/dwarf-regs.h          |  11 +
>  tools/perf/util/print_insn.c                  |  15 +-
>  tools/perf/util/print_insn.h                  |   5 +
>  18 files changed, 1301 insertions(+), 496 deletions(-)
> 
> -- 
> 2.43.0
