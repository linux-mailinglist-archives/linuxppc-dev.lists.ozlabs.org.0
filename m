Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E26B61BBAD5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:09:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BHSD0mqczDqpp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 20:09:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BHPz5XVNzDqmJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 20:07:34 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SA1gpM059633; Tue, 28 Apr 2020 06:07:30 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mg16usw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 06:07:30 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03SA1m4N059904;
 Tue, 28 Apr 2020 06:07:16 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mg16usnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 06:07:15 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03SA5hJX018473;
 Tue, 28 Apr 2020 10:06:54 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 30mcu8cs4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 10:06:54 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03SA6qo363635652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 10:06:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A6E74C050;
 Tue, 28 Apr 2020 10:06:52 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50B624C04A;
 Tue, 28 Apr 2020 10:06:51 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.50.34])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Apr 2020 10:06:51 +0000 (GMT)
Message-ID: <621da706df99146dbe47bbb3243b4f6ed7f3a15c.camel@linux.ibm.com>
Subject: Re: [PATCH v6 00/28] Initial Prefixed Instruction support
From: Balamuruhan S <bala24@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 28 Apr 2020 15:36:50 +0530
In-Reply-To: <20200428015814.15380-1-jniethe5@gmail.com>
References: <20200428015814.15380-1-jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_05:2020-04-27,
 2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004280082
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
Cc: alistair@popple.id.au, npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-04-28 at 11:57 +1000, Jordan Niethe wrote:
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

Hi Jordan,

I tried to test Kprobes with prefixed instruction on this patchset and
observed that kprobe/uprobe enablement patches are missing from v4.
Till v3 it were available,

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200211053355.21574-11-jniethe5@gmail.com/

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200211053355.21574-12-jniethe5@gmail.com/

was it missed for any dependencies/reason ? or will you plan it include in next
version ?

please let me know if you need help on it.

-- Bala

> 
> v6 is based on feedback from Balamuruhan Suriyakumar, Alistair Popple,
> Christophe Leroy and Segher Boessenkool.
> The major changes:
>     - Use the instruction type in more places that had been missed before
>     - Fix issues with ppc32
>     - Introduce new self tests for code patching and feature fixups
> 
> v5 is based on feedback from Nick Piggins, Michael Ellerman, Balamuruhan
> Suriyakumar and Alistair Popple.
> The major changes:
>     - The ppc instruction type is now a struct
>     - Series now just based on next
>     - ppc_inst_masked() dropped
>     - Space for xmon breakpoints allocated in an assembly file
>     - "Add prefixed instructions to instruction data type" patch seperated in
>       to smaller patches
>     - Calling convention for create_branch() is changed
>     - Some places which had not been updated to use the data type are now
> updated
> 
> v4 is based on feedback from Nick Piggins, Christophe Leroy and Daniel
> Axtens.
> The major changes:
>     - Move xmon breakpoints from data section to text section
>     - Introduce a data type for instructions on powerpc
> 
> v3 is based on feedback from Christophe Leroy. The major changes:
>     - Completely replacing store_inst() with patch_instruction() in
>       xmon
>     - Improve implementation of mread_instr() to not use mread().
>     - Base the series on top of
>       https://patchwork.ozlabs.org/patch/1232619/ as this will effect
>       kprobes.
>     - Some renaming and simplification of conditionals.
> 
> v2 incorporates feedback from Daniel Axtens and and Balamuruhan
> S. The major changes are:
>     - Squashing together all commits about SRR1 bits
>     - Squashing all commits for supporting prefixed load stores
>     - Changing abbreviated references to sufx/prfx -> suffix/prefix
>     - Introducing macros for returning the length of an instruction
>     - Removing sign extension flag from pstd/pld in sstep.c
>     - Dropping patch  "powerpc/fault: Use analyse_instr() to check for
>       store with updates to sp" from the series, it did not really fit
>       with prefixed enablement in the first place and as reported by Greg
>       Kurz did not work correctly.
> 
> Alistair Popple (1):
>   powerpc: Enable Prefixed Instructions
> 
> Jordan Niethe (27):
>   powerpc/xmon: Remove store_inst() for patch_instruction()
>   powerpc/xmon: Move breakpoint instructions to own array
>   powerpc/xmon: Move breakpoints to text section
>   powerpc/xmon: Use bitwise calculations in_breakpoint_table()
>   powerpc: Change calling convention for create_branch() et. al.
>   powerpc: Use a macro for creating instructions from u32s
>   powerpc: Use an accessor for instructions
>   powerpc: Use a function for getting the instruction op code
>   powerpc: Use a function for byte swapping instructions
>   powerpc: Introduce functions for instruction equality
>   powerpc: Use a datatype for instructions
>   powerpc: Use a function for reading instructions
>   powerpc: Add a probe_user_read_inst() function
>   powerpc: Add a probe_kernel_read_inst() function
>   powerpc/kprobes: Use patch_instruction()
>   powerpc: Define and use __get_user_instr{,inatomic}()
>   powerpc: Introduce a function for reporting instruction length
>   powerpc/xmon: Use a function for reading instructions
>   powerpc/xmon: Move insertion of breakpoint for xol'ing
>   powerpc: Make test_translate_branch() independent of instruction
>     length
>   powerpc: Define new SRR1 bits for a future ISA version
>   powerpc: Add prefixed instructions to instruction data type
>   powerpc: Test prefixed code patching
>   powerpc: Test prefixed instructions in feature fixups
>   powerpc: Support prefixed instructions in alignment handler
>   powerpc sstep: Add support for prefixed load/stores
>   powerpc sstep: Add support for prefixed fixed-point arithmetic
> 
>  arch/powerpc/include/asm/code-patching.h |  37 +-
>  arch/powerpc/include/asm/inst.h          | 106 ++++++
>  arch/powerpc/include/asm/kprobes.h       |   2 +-
>  arch/powerpc/include/asm/reg.h           |   7 +-
>  arch/powerpc/include/asm/sstep.h         |  15 +-
>  arch/powerpc/include/asm/uaccess.h       |  35 ++
>  arch/powerpc/include/asm/uprobes.h       |   7 +-
>  arch/powerpc/kernel/align.c              |  13 +-
>  arch/powerpc/kernel/asm-offsets.c        |   8 +
>  arch/powerpc/kernel/epapr_paravirt.c     |   7 +-
>  arch/powerpc/kernel/hw_breakpoint.c      |   5 +-
>  arch/powerpc/kernel/jump_label.c         |   5 +-
>  arch/powerpc/kernel/kgdb.c               |   9 +-
>  arch/powerpc/kernel/kprobes.c            |  24 +-
>  arch/powerpc/kernel/mce_power.c          |   5 +-
>  arch/powerpc/kernel/module_64.c          |   3 +-
>  arch/powerpc/kernel/optprobes.c          |  91 +++--
>  arch/powerpc/kernel/optprobes_head.S     |   3 +
>  arch/powerpc/kernel/security.c           |   9 +-
>  arch/powerpc/kernel/setup_32.c           |   8 +-
>  arch/powerpc/kernel/trace/ftrace.c       | 160 ++++----
>  arch/powerpc/kernel/traps.c              |  20 +-
>  arch/powerpc/kernel/uprobes.c            |   5 +-
>  arch/powerpc/kernel/vecemu.c             |  20 +-
>  arch/powerpc/kvm/book3s_hv_nested.c      |   2 +-
>  arch/powerpc/kvm/book3s_hv_rm_mmu.c      |   2 +-
>  arch/powerpc/kvm/emulate_loadstore.c     |   2 +-
>  arch/powerpc/lib/Makefile                |   2 +-
>  arch/powerpc/lib/code-patching.c         | 305 ++++++++-------
>  arch/powerpc/lib/feature-fixups-test.S   |  68 ++++
>  arch/powerpc/lib/feature-fixups.c        | 159 ++++++--
>  arch/powerpc/lib/inst.c                  |  69 ++++
>  arch/powerpc/lib/sstep.c                 | 461 ++++++++++++++++-------
>  arch/powerpc/lib/test_code-patching.S    |  19 +
>  arch/powerpc/lib/test_emulate_step.c     |  56 +--
>  arch/powerpc/mm/fault.c                  |  15 +-
>  arch/powerpc/perf/core-book3s.c          |   4 +-
>  arch/powerpc/xmon/Makefile               |   2 +-
>  arch/powerpc/xmon/xmon.c                 |  94 +++--
>  arch/powerpc/xmon/xmon_bpts.S            |  11 +
>  arch/powerpc/xmon/xmon_bpts.h            |  14 +
>  41 files changed, 1307 insertions(+), 582 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/inst.h
>  create mode 100644 arch/powerpc/lib/inst.c
>  create mode 100644 arch/powerpc/lib/test_code-patching.S
>  create mode 100644 arch/powerpc/xmon/xmon_bpts.S
>  create mode 100644 arch/powerpc/xmon/xmon_bpts.h
> 

