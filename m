Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AAA1D26AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 07:33:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N0Z03KbczDqmF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 15:33:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N0XC6kd5zDqdf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 15:31:33 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49N0Wz5Jd8z9tyRZ;
 Thu, 14 May 2020 07:31:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id I72oBylJTaJO; Thu, 14 May 2020 07:31:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49N0Wz3x2Dz9tyRX;
 Thu, 14 May 2020 07:31:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B780D8B833;
 Thu, 14 May 2020 07:31:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CPvuasGxT_N7; Thu, 14 May 2020 07:31:28 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F27EF8B82C;
 Thu, 14 May 2020 07:31:27 +0200 (CEST)
Subject: Re: [PATCH v8 00/30] Initial Prefixed Instruction support
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200506034050.24806-1-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d5d59817-6e90-5643-6405-2b2794348684@csgroup.eu>
Date: Thu, 14 May 2020 07:31:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/05/2020 à 05:40, Jordan Niethe a écrit :
> A future revision of the ISA will introduce prefixed instructions. A
> prefixed instruction is composed of a 4-byte prefix followed by a
> 4-byte suffix.
> 
> All prefixes have the major opcode 1. A prefix will never be a valid
> word instruction. A suffix may be an existing word instruction or a
> new instruction.
> 
> This series enables prefixed instructions and extends the instruction
> emulation to support them. Then the places where prefixed instructions
> might need to be emulated are updated.
> 
> v8 incorporates feedback from Alistair Popple and Balamuruhan Suriyakumar.
> The major changes:
>      - Fix some style issues
>      - Fix __patch_instruction() on big endian
>      - Reintroduce v3's forbidding breakpoints on second word of prefix
>        instructions for kprobes and xmon. Missed this when changing to
>        using a data type.
>      - Use the data type in some places that were missed.

Checkpatch seems to report the following warnings for pmac32_defconfig, 
are they harmless ?

+arch/powerpc/kernel/align.c:307:13: warning: cast removes address space 
'<asn:1>' of expression
+arch/powerpc/kernel/align.c:307:13: warning: cast removes address space 
'<asn:1>' of expression
+arch/powerpc/kernel/align.c:307:13: warning: cast removes address space 
'<asn:1>' of expression
+arch/powerpc/kernel/align.c:307:13: warning: cast removes address space 
'<asn:1>' of expression
+arch/powerpc/kernel/align.c:307:13: warning: cast removes address space 
'<asn:1>' of expression
+arch/powerpc/kernel/align.c:307:13: warning: incorrect type in argument 
1 (different address spaces) expected void const volatile [noderef] 
<asn:1> * got unsigned int [usertype] *
+arch/powerpc/kernel/align.c:307:13: warning: incorrect type in 
initializer (different address spaces) expected unsigned int [noderef] 
<asn:1> *__gu_addr got unsigned int [usertype] *
+arch/powerpc/kernel/hw_breakpoint.c:XX:13: warning: cast removes 
address space '<asn:1>' of expression
+arch/powerpc/kernel/hw_breakpoint.c:XX:13: warning: cast removes 
address space '<asn:1>' of expression
+arch/powerpc/kernel/hw_breakpoint.c:XX:13: warning: cast removes 
address space '<asn:1>' of expression
+arch/powerpc/kernel/hw_breakpoint.c:XX:13: warning: cast removes 
address space '<asn:1>' of expression
+arch/powerpc/kernel/hw_breakpoint.c:XX:13: warning: cast removes 
address space '<asn:1>' of expression
-arch/powerpc/kernel/hw_breakpoint.c:XX:13: warning: incorrect type in 
argument 1 (different address spaces) expected void const volatile 
[noderef] <asn:1> * got unsigned int *
+arch/powerpc/kernel/hw_breakpoint.c:XX:13: warning: incorrect type in 
argument 1 (different address spaces) expected void const volatile 
[noderef] <asn:1> * got unsigned int [usertype] *
-arch/powerpc/kernel/hw_breakpoint.c:XX:13: warning: incorrect type in 
initializer (different address spaces) expected unsigned int [noderef] 
<asn:1> *__gu_addr got unsigned int *
+arch/powerpc/kernel/hw_breakpoint.c:XX:13: warning: incorrect type in 
initializer (different address spaces) expected unsigned int [noderef] 
<asn:1> *__gu_addr got unsigned int [usertype] *
+arch/powerpc/kernel/vecemu.c:269:13: warning: cast removes address 
space '<asn:1>' of expression
+arch/powerpc/kernel/vecemu.c:269:13: warning: cast removes address 
space '<asn:1>' of expression
+arch/powerpc/kernel/vecemu.c:269:13: warning: cast removes address 
space '<asn:1>' of expression
+arch/powerpc/kernel/vecemu.c:269:13: warning: cast removes address 
space '<asn:1>' of expression
+arch/powerpc/kernel/vecemu.c:269:13: warning: cast removes address 
space '<asn:1>' of expression
+arch/powerpc/kernel/vecemu.c:269:13: warning: incorrect type in 
argument 1 (different address spaces) expected void const volatile 
[noderef] <asn:1> * got unsigned int [usertype] *
+arch/powerpc/kernel/vecemu.c:269:13: warning: incorrect type in 
initializer (different address spaces) expected unsigned int [noderef] 
<asn:1> *__gu_addr got unsigned int [usertype] *
+arch/powerpc/lib/inst.c:55:37: warning: incorrect type in argument 2 
(different address spaces) expected void const [noderef] <asn:1> *src 
got struct ppc_inst *nip
+arch/powerpc/mm/fault.c:284:59: warning: incorrect type in argument 2 
(different address spaces) expected struct ppc_inst *nip got struct 
ppc_inst [noderef] <asn:1> *

Christophe

> 
> v7 fixes compilation issues for some configs reported by Alistair
> Popple.
> 
> v6 is based on feedback from Balamuruhan Suriyakumar, Alistair Popple,
> Christophe Leroy and Segher Boessenkool.
> The major changes:
>      - Use the instruction type in more places that had been missed before
>      - Fix issues with ppc32
>      - Introduce new self tests for code patching and feature fixups
> 
> v5 is based on feedback from Nick Piggins, Michael Ellerman, Balamuruhan
> Suriyakumar and Alistair Popple.
> The major changes:
>      - The ppc instruction type is now a struct
>      - Series now just based on next
>      - ppc_inst_masked() dropped
>      - Space for xmon breakpoints allocated in an assembly file
>      - "Add prefixed instructions to instruction data type" patch seperated in
>        to smaller patches
>      - Calling convention for create_branch() is changed
>      - Some places which had not been updated to use the data type are now updated
> 
> v4 is based on feedback from Nick Piggins, Christophe Leroy and Daniel Axtens.
> The major changes:
>      - Move xmon breakpoints from data section to text section
>      - Introduce a data type for instructions on powerpc
> 
> v3 is based on feedback from Christophe Leroy. The major changes:
>      - Completely replacing store_inst() with patch_instruction() in
>        xmon
>      - Improve implementation of mread_instr() to not use mread().
>      - Base the series on top of
>        https://patchwork.ozlabs.org/patch/1232619/ as this will effect
>        kprobes.
>      - Some renaming and simplification of conditionals.
> 
> v2 incorporates feedback from Daniel Axtens and and Balamuruhan
> S. The major changes are:
>      - Squashing together all commits about SRR1 bits
>      - Squashing all commits for supporting prefixed load stores
>      - Changing abbreviated references to sufx/prfx -> suffix/prefix
>      - Introducing macros for returning the length of an instruction
>      - Removing sign extension flag from pstd/pld in sstep.c
>      - Dropping patch  "powerpc/fault: Use analyse_instr() to check for
>        store with updates to sp" from the series, it did not really fit
>        with prefixed enablement in the first place and as reported by Greg
>        Kurz did not work correctly.
> 
> 
> Alistair Popple (1):
>    powerpc: Enable Prefixed Instructions
> 
> Jordan Niethe (29):
>    powerpc/xmon: Remove store_inst() for patch_instruction()
>    powerpc/xmon: Move breakpoint instructions to own array
>    powerpc/xmon: Move breakpoints to text section
>    powerpc/xmon: Use bitwise calculations in_breakpoint_table()
>    powerpc: Change calling convention for create_branch() et. al.
>    powerpc: Use a macro for creating instructions from u32s
>    powerpc: Use an accessor for instructions
>    powerpc: Use a function for getting the instruction op code
>    powerpc: Use a function for byte swapping instructions
>    powerpc: Introduce functions for instruction equality
>    powerpc: Use a datatype for instructions
>    powerpc: Use a function for reading instructions
>    powerpc: Add a probe_user_read_inst() function
>    powerpc: Add a probe_kernel_read_inst() function
>    powerpc/kprobes: Use patch_instruction()
>    powerpc: Define and use __get_user_instr{,inatomic}()
>    powerpc: Introduce a function for reporting instruction length
>    powerpc/xmon: Use a function for reading instructions
>    powerpc/xmon: Move insertion of breakpoint for xol'ing
>    powerpc: Make test_translate_branch() independent of instruction
>      length
>    powerpc: Define new SRR1 bits for a future ISA version
>    powerpc: Add prefixed instructions to instruction data type
>    powerpc: Test prefixed code patching
>    powerpc: Test prefixed instructions in feature fixups
>    powerpc/xmon: Don't allow breakpoints on suffixes
>    powerpc/kprobes: Don't allow breakpoints on suffixes
>    powerpc: Support prefixed instructions in alignment handler
>    powerpc sstep: Add support for prefixed load/stores
>    powerpc sstep: Add support for prefixed fixed-point arithmetic
> 
>   arch/powerpc/include/asm/code-patching.h  |  37 +-
>   arch/powerpc/include/asm/inst.h           | 107 +++++
>   arch/powerpc/include/asm/kprobes.h        |   2 +-
>   arch/powerpc/include/asm/ppc-opcode.h     |   3 +
>   arch/powerpc/include/asm/reg.h            |   7 +-
>   arch/powerpc/include/asm/sstep.h          |  15 +-
>   arch/powerpc/include/asm/uaccess.h        |  43 ++
>   arch/powerpc/include/asm/uprobes.h        |   7 +-
>   arch/powerpc/kernel/align.c               |  13 +-
>   arch/powerpc/kernel/asm-offsets.c         |   8 +
>   arch/powerpc/kernel/crash_dump.c          |   7 +-
>   arch/powerpc/kernel/epapr_paravirt.c      |   7 +-
>   arch/powerpc/kernel/hw_breakpoint.c       |   5 +-
>   arch/powerpc/kernel/jump_label.c          |   5 +-
>   arch/powerpc/kernel/kgdb.c                |   9 +-
>   arch/powerpc/kernel/kprobes.c             |  37 +-
>   arch/powerpc/kernel/mce_power.c           |   5 +-
>   arch/powerpc/kernel/module_64.c           |   3 +-
>   arch/powerpc/kernel/optprobes.c           | 102 +++--
>   arch/powerpc/kernel/optprobes_head.S      |   3 +
>   arch/powerpc/kernel/security.c            |  12 +-
>   arch/powerpc/kernel/setup_32.c            |   8 +-
>   arch/powerpc/kernel/trace/ftrace.c        | 168 ++++----
>   arch/powerpc/kernel/traps.c               |  20 +-
>   arch/powerpc/kernel/uprobes.c             |   5 +-
>   arch/powerpc/kernel/vecemu.c              |  20 +-
>   arch/powerpc/kvm/book3s_hv_nested.c       |   2 +-
>   arch/powerpc/kvm/book3s_hv_rm_mmu.c       |   2 +-
>   arch/powerpc/kvm/emulate_loadstore.c      |   2 +-
>   arch/powerpc/lib/Makefile                 |   2 +-
>   arch/powerpc/lib/code-patching.c          | 319 +++++++++------
>   arch/powerpc/lib/feature-fixups-test.S    |  69 ++++
>   arch/powerpc/lib/feature-fixups.c         | 160 ++++++--
>   arch/powerpc/lib/inst.c                   |  70 ++++
>   arch/powerpc/lib/sstep.c                  | 459 +++++++++++++++-------
>   arch/powerpc/lib/test_code-patching.S     |  20 +
>   arch/powerpc/lib/test_emulate_step.c      |  56 +--
>   arch/powerpc/mm/fault.c                   |  15 +-
>   arch/powerpc/mm/nohash/8xx.c              |   5 +-
>   arch/powerpc/perf/8xx-pmu.c               |   9 +-
>   arch/powerpc/perf/core-book3s.c           |   4 +-
>   arch/powerpc/platforms/86xx/mpc86xx_smp.c |   5 +-
>   arch/powerpc/platforms/powermac/smp.c     |   5 +-
>   arch/powerpc/xmon/Makefile                |   2 +-
>   arch/powerpc/xmon/xmon.c                  | 122 ++++--
>   arch/powerpc/xmon/xmon_bpts.S             |  11 +
>   arch/powerpc/xmon/xmon_bpts.h             |  14 +
>   47 files changed, 1409 insertions(+), 602 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/inst.h
>   create mode 100644 arch/powerpc/lib/inst.c
>   create mode 100644 arch/powerpc/lib/test_code-patching.S
>   create mode 100644 arch/powerpc/xmon/xmon_bpts.S
>   create mode 100644 arch/powerpc/xmon/xmon_bpts.h
> 
