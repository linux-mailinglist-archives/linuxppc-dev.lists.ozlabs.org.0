Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6B61A2F45
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 08:40:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yWk869jgzDqg8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 16:40:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=X4bMbZeX; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yWhL2jPGzDqdr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 16:39:14 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48yWhF6b31z9tySL;
 Thu,  9 Apr 2020 08:39:09 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=X4bMbZeX; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id n2tfECODGq5Q; Thu,  9 Apr 2020 08:39:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48yWhF5Lnhz9tySG;
 Thu,  9 Apr 2020 08:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586414349; bh=2vktPdUyP/hqTzj4q4jGiJaz+C+fgdFf+5wlYnhRdjs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=X4bMbZeXGpea/NiE2ema3kqN2CQft03aYsDPuGADKvWOw+GqXKmA0Uh6WIDqAKHF8
 yACrnuMrGY+0rsg1ztsa0uvE8c4WpZnYNidaQuPD1SfWNEN0/0V8TxWycmHtzCV97c
 B7E+Ql1Vg33JwnLnAtP7F2wfxpqhGjsfuHcLZ8KQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A87478B77F;
 Thu,  9 Apr 2020 08:39:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IyceFdgTj8mG; Thu,  9 Apr 2020 08:39:10 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 040608B75B;
 Thu,  9 Apr 2020 08:39:09 +0200 (CEST)
Subject: Re: [PATCH v5 00/21] Initial Prefixed Instruction support
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200406080936.7180-1-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b30787a2-bcb9-de17-759a-9fcb30ac6644@c-s.fr>
Date: Thu, 9 Apr 2020 06:39:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200406080936.7180-1-jniethe5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: bala24@linux.ibm.com, alistair@popple.id.au, dja@axtens.net,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 04/06/2020 08:09 AM, Jordan Niethe wrote:
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

Build fails. I have not investigated why:

   CC      arch/powerpc/kernel/process.o
In file included from ./arch/powerpc/include/asm/code-patching.h:14:0,
                  from arch/powerpc/kernel/process.c:60:
./arch/powerpc/include/asm/inst.h:69:38: error: unknown type name ‘ppc_inst’
  static inline bool ppc_inst_prefixed(ppc_inst x)
                                       ^
./arch/powerpc/include/asm/inst.h:79:19: error: redefinition of 
‘ppc_inst_val’
  static inline u32 ppc_inst_val(struct ppc_inst x)
                    ^
./arch/powerpc/include/asm/inst.h:21:19: note: previous definition of 
‘ppc_inst_val’ was here
  static inline u32 ppc_inst_val(struct ppc_inst x)
                    ^
./arch/powerpc/include/asm/inst.h: In function ‘ppc_inst_len’:
./arch/powerpc/include/asm/inst.h:103:10: error: implicit declaration of 
function ‘ppc_inst_prefixed’ [-Werror=implicit-function-declaration]
   return (ppc_inst_prefixed(x)) ? 8  : 4;
           ^

Christophe

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
> Jordan Niethe (20):
>    powerpc/xmon: Remove store_inst() for patch_instruction()
>    powerpc/xmon: Move out-of-line instructions to text section
>    powerpc: Change calling convention for create_branch() et. al.
>    powerpc: Use a macro for creating instructions from u32s
>    powerpc: Use a function for getting the instruction op code
>    powerpc: Use an accessor for instructions
>    powerpc: Use a function for byte swapping instructions
>    powerpc: Introduce functions for instruction equality
>    powerpc: Use a datatype for instructions
>    powerpc: Use a function for reading instructions
>    powerpc: Define and use __get_user_instr{,inatomic}()
>    powerpc: Introduce a function for reporting instruction length
>    powerpc/xmon: Use a function for reading instructions
>    powerpc/xmon: Move insertion of breakpoint for xol'ing
>    powerpc: Make test_translate_branch() independent of instruction
>      length
>    powerpc: Define new SRR1 bits for a future ISA version
>    powerpc64: Add prefixed instructions to instruction data type
>    powerpc: Support prefixed instructions in alignment handler
>    powerpc sstep: Add support for prefixed load/stores
>    powerpc sstep: Add support for prefixed fixed-point arithmetic
> 
>   arch/powerpc/include/asm/code-patching.h |  37 +-
>   arch/powerpc/include/asm/inst.h          | 106 ++++++
>   arch/powerpc/include/asm/kprobes.h       |   2 +-
>   arch/powerpc/include/asm/reg.h           |   7 +-
>   arch/powerpc/include/asm/sstep.h         |  15 +-
>   arch/powerpc/include/asm/uaccess.h       |  28 ++
>   arch/powerpc/include/asm/uprobes.h       |   7 +-
>   arch/powerpc/kernel/align.c              |  13 +-
>   arch/powerpc/kernel/epapr_paravirt.c     |   5 +-
>   arch/powerpc/kernel/hw_breakpoint.c      |   5 +-
>   arch/powerpc/kernel/jump_label.c         |   5 +-
>   arch/powerpc/kernel/kgdb.c               |   9 +-
>   arch/powerpc/kernel/kprobes.c            |  24 +-
>   arch/powerpc/kernel/mce_power.c          |   5 +-
>   arch/powerpc/kernel/module_64.c          |   3 +-
>   arch/powerpc/kernel/optprobes.c          |  91 +++--
>   arch/powerpc/kernel/optprobes_head.S     |   3 +
>   arch/powerpc/kernel/security.c           |   9 +-
>   arch/powerpc/kernel/setup_32.c           |   4 +-
>   arch/powerpc/kernel/trace/ftrace.c       | 190 ++++++----
>   arch/powerpc/kernel/traps.c              |  20 +-
>   arch/powerpc/kernel/uprobes.c            |   3 +-
>   arch/powerpc/kernel/vecemu.c             |  20 +-
>   arch/powerpc/kvm/book3s_hv_nested.c      |   2 +-
>   arch/powerpc/kvm/book3s_hv_rm_mmu.c      |   2 +-
>   arch/powerpc/kvm/emulate_loadstore.c     |   2 +-
>   arch/powerpc/lib/code-patching.c         | 289 +++++++-------
>   arch/powerpc/lib/feature-fixups.c        |  69 ++--
>   arch/powerpc/lib/sstep.c                 | 455 ++++++++++++++++-------
>   arch/powerpc/lib/test_emulate_step.c     |  56 +--
>   arch/powerpc/perf/core-book3s.c          |   4 +-
>   arch/powerpc/xmon/Makefile               |   2 +-
>   arch/powerpc/xmon/xmon.c                 |  94 +++--
>   arch/powerpc/xmon/xmon_bpts.S            |  10 +
>   arch/powerpc/xmon/xmon_bpts.h            |   8 +
>   35 files changed, 1042 insertions(+), 562 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/inst.h
>   create mode 100644 arch/powerpc/xmon/xmon_bpts.S
>   create mode 100644 arch/powerpc/xmon/xmon_bpts.h
> 
