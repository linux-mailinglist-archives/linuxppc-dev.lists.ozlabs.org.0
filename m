Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3BC366775
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 11:01:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQF0h3TWSz30H3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 19:01:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQF0L6KMFz2xZm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 19:01:21 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FQF0F3RQKz9vBL5;
 Wed, 21 Apr 2021 11:01:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sqNtH8okSVDF; Wed, 21 Apr 2021 11:01:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FQF0F2cn6z9vBKw;
 Wed, 21 Apr 2021 11:01:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6FC148B818;
 Wed, 21 Apr 2021 11:01:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hcKgPfgn0XQa; Wed, 21 Apr 2021 11:01:18 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0151C8B815;
 Wed, 21 Apr 2021 11:01:17 +0200 (CEST)
Subject: Re: [PATCH] powerpc/64s: Add load address to plt branch targets
 before moved to linked location for non-relocatable kernels
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210421021721.1539289-1-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d5a2a186-acf0-8a45-ef1f-a67a7027ab2f@csgroup.eu>
Date: Wed, 21 Apr 2021 11:01:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210421021721.1539289-1-jniethe5@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/04/2021 à 04:17, Jordan Niethe a écrit :
> Large branches will go through the plt which includes a stub that loads
> a target address from the .branch_lt section. On a relocatable kernel the
> targets in .branch_lt have relocations so they will be fixed up for
> where the kernel is running by relocate().
> 
> For a non-relocatable kernel obviously there are no relocations.
> However, until the kernel is moved down to its linked address it is
> expected to be able to run where ever it is loaded. For pseries machines
> prom_init() is called before running at the linked address.
> 
> Certain configs result in a large kernel such as STRICT_KERNEL_RWX
> (because of the larger data shift):

Same problem occurs on 32s, see discussion at https://bugzilla.kernel.org/show_bug.cgi?id=208181#c14


> 
> config DATA_SHIFT
> 	int "Data shift" if DATA_SHIFT_BOOL
> 	default 24 if STRICT_KERNEL_RWX && PPC64
> 
> These large kernels lead to prom_init()'s final call to __start()
> generating a plt branch:
> 
> bl      c000000002000018 <00000078.plt_branch.__start>
> 
> This results in the kernel jumping to the linked address of __start,
> 0xc000000000000000, when really it needs to jump to the
> 0xc000000000000000 + the runtime address because the kernel is still
> running at the load address.
> 
> The first 256 bytes are already copied to address 0 so the kernel will
> run until
> 
> b	__start_initialization_multiplatform
> 
> because there is nothing yet at __start_initialization_multiplatform
> this will inevitably crash. At this point the exception handlers are
> still OF's.
> 
> On phyp this will look like:
> 
> OF stdout device is: /vdevice/vty@30000000
> Preparing to boot Linux version 5.12.0-rc3-63029-gada7d7e600c0 (gcc (GCC) 8.4.1 20200928 (Red Hat 8.4.1-1), GNU ld version 2.30-93.el8) #1 SMP Wed Apr 7 07:24:20 EDT 2021
> Detected machine type: 0000000000000101
> command line: BOOT_IMAGE=/vmlinuz-5.12.0-rc3-63029-gada7d7e600c0
> Max number of cores passed to firmware: 256 (NR_CPUS = 2048)
> Calling ibm,client-architecture-support... done
> memory layout at init:
>    memory_limit : 0000000000000000 (16 MB aligned)
>    alloc_bottom : 000000000edc0000
>    alloc_top    : 0000000020000000
>    alloc_top_hi : 0000000020000000
>    rmo_top      : 0000000020000000
>    ram_top      : 0000000020000000
> instantiating rtas at 0x000000001ec30000... done
> prom_hold_cpus: skipped
> copying OF device tree...
> Building dt strings...
> Building dt structure...
> Device tree strings 0x000000000edd0000 -> 0x000000000edd1809
> Device tree struct  0x000000000ede0000 -> 0x000000000edf0000
> Quiescing Open Firmware ...
> Booting Linux via __start() @ 0x000000000a710000 ...
> DEFAULT CATCH!, exception-handler=fffffffffffffff6
> at   %SRR0: 0000000000000f20   %SRR1: 8000000000081000
> Open Firmware exception handler entered from non-OF code
> Client's Fix Pt Regs:
>   00 000000000c713134 0000000008a9fc00 000000000caf9c00 000000000edc0000
>   04 000000000a710000 0000000000000000 0000000000000000 0000000000000000
>   08 0000000000000000 0000000000000000 000000000a7200fc 0000000000003003
>   0c c000000000000000 0000000000000000 0000000000000000 000000000b5a9820
>   10 000000000b5a9b38 000000000b5a9988 000000000b5a9f38 000000000b660c10
>   14 000000000b5a9f60 00000000013d0000 000000001ec30000 000000001ec30000
>   18 000000000b5a9840 000000000a710000 0000000000000028 000000000edc0008
>   1c 000000000edc0000 000000000cb60000 0000000000000000 000000000edc0000
> Special Regs:
>      %IV: 00000700     %CR: 44000202    %XER: 00000000  %DSISR: 00000000
>    %SRR0: 0000000000000f20   %SRR1: 8000000000081000
>      %LR: 000000000c71326c    %CTR: c000000000000000
>     %DAR: 0000000000000000
> Virtual PID = 0
> DEFAULT CATCH!, throw-code=fffffffffffffff6
> Call History
> ------------
> throw  - c3f05c
> $call-method  - c4f0b4
> (poplocals)  - c40a00
> key-fillq  - c4f4cc
> ?xoff  - c4f5b4
> (poplocals)  - c40a00
> (stdout-write)  - c4fa64
> (emit)  - c4fb3c
> space  - c4dfc8
> quit  - c5336c
> quit  - c53100
> My Fix Pt Regs:
>   00 800000000000b002 0000000000000000 00000000deadbeef 0000000000c4f0b0
>   04 0000000008bfff80 00000000deadbeef 0000000000000004 0000000000c09010
>   08 0000000000000005 0000000000000000 0000000000000000 0000000000000000
>   0c 80000000072a40a8 0000000000000000 0000000000000000 0000000008d2cf30
>   10 0000000000e7d968 0000000000e7d968 0000000000c4f0a8 0000000000c4f0b4
>   14 fffffffffffffff6 0000000008bfff80 c8ff21fbd0ff41fb f8ffe1fbb1fd21f8
>   18 0000000000c19000 0000000000c3e000 0000000000c1af80 0000000000c1cfc0
>   1c 0000000000c26000 0000000000c460f0 0000000000c17fa8 0000000000c16fe0
> Special Regs:
>      %IV: 00000900     %CR: 84800208    %XER: 00040010  %DSISR: 00000000
>    %SRR0: 0000000000c3eec8   %SRR1: 800000000000b002
>      %LR: 0000000000c3f05c    %CTR: 0000000000c4f0b0
>     %DAR: 0000000000000000
> ...
> 
> On qemu it will just appear to be stuck after
> Booting Linux via __start() @ 0x0000000000400000 ...:
> 
> SLOF **********************************************************************
> QEMU Starting
>   Build Date = Apr  9 2021 14:13:31
>   FW Version = git-33a7322de13e9dca
>   Press "s" to enter Open Firmware.
> 
> Populating /vdevice methods
> Populating /vdevice/vty@71000000
> Populating /vdevice/nvram@71000001
> Populating /vdevice/l-lan@71000002
> Populating /vdevice/v-scsi@71000003
>         SCSI: Looking for devices
>            8200000000000000 CD-ROM   : "QEMU     QEMU CD-ROM      2.5+"
> Populating /pci@800000020000000
> Scanning USB
> Using default console: /vdevice/vty@71000000
> Detected RAM kernel at 400000 (25baa08 bytes)
> 
>    Welcome to Open Firmware
> 
>    Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
>    This program and the accompanying materials are made available
>    under the terms of the BSD License available at
>    http://www.opensource.org/licenses/bsd-license.php
> 
> Booting from memory...
> OF stdout device is: /vdevice/vty@71000000
> Preparing to boot Linux version 5.12.0-rc3-00128-g87a8d2180282 (powerpc64le-linux-gnu-gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #85 SMP Sun Apr 18 19:30:55 AEST 2021
> Detected machine type: 0000000000000101
> command line: nokaslr
> Max number of cores passed to firmware: 2048 (NR_CPUS = 2048)
> Calling ibm,client-architecture-support... done
> memory layout at init:
>    memory_limit : 0000000000000000 (16 MB aligned)
>    alloc_bottom : 0000000003df0000
>    alloc_top    : 0000000030000000
>    alloc_top_hi : 0000000080000000
>    rmo_top      : 0000000030000000
>    ram_top      : 0000000080000000
> instantiating rtas at 0x000000002fff0000... done
> prom_hold_cpus: skipped
> copying OF device tree...
> Building dt strings...
> Building dt structure...
> Device tree strings 0x0000000003e00000 -> 0x0000000003e00ab2
> Device tree struct  0x0000000003e10000 -> 0x0000000003e20000
> Quiescing Open Firmware ...
> Booting Linux via __start() @ 0x0000000000400000 ...
> 
> To fix this do some "relocation" of the plt target addresses on
> non-relocatable before running at the linked address. Before calling
> prom_init() add the runtime address to all the targets in .branch_lt
> with relocate_plt(). Have relocate_plt() save the offset added in
> p_branch_lt_off.  After prom_init() calls __start() remove the offset
> saved in p_branch_lt_off to return the targets to their original
> addresses.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>   arch/powerpc/include/asm/sections.h |  2 +
>   arch/powerpc/kernel/head_64.S       | 66 +++++++++++++++++++++++++++++
>   arch/powerpc/kernel/vmlinux.lds.S   |  2 +
>   3 files changed, 70 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
> index 324d7b298ec3..f087f5cd5a50 100644
> --- a/arch/powerpc/include/asm/sections.h
> +++ b/arch/powerpc/include/asm/sections.h
> @@ -30,6 +30,8 @@ extern char __end_interrupts[];
>   
>   extern char __prom_init_toc_start[];
>   extern char __prom_init_toc_end[];
> +extern char __branch_lt_start[];
> +extern char __branch_lt_end[];
>   
>   #ifdef CONFIG_PPC_POWERNV
>   extern char start_real_trampolines[];
> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
> index ece7f97bafff..28a6c2abd3ab 100644
> --- a/arch/powerpc/kernel/head_64.S
> +++ b/arch/powerpc/kernel/head_64.S
> @@ -560,8 +560,11 @@ __boot_from_prom:
>   	/* Relocate code for where we are now */
>   	mr	r3,r26
>   	bl	relocate
> +#else
> +	bl	relocate_plt
>   #endif
>   
> +
>   	/* Restore parameters */
>   	mr	r3,r31
>   	mr	r4,r30
> @@ -600,6 +603,8 @@ __after_prom_start:
>   	/* IVPR needs to be set after relocation. */
>   	bl	init_core_book3e
>   #endif
> +#else
> +	bl	unrelocate_plt
>   #endif
>   
>   /*
> @@ -901,6 +906,67 @@ _GLOBAL(relative_toc)
>   .balign 8
>   p_toc:	.8byte	__toc_start + 0x8000 - 0b
>   
> +/*
> + * A large non relocatable kernel may generate branches that go though the plt,
> + * before the kernel is copied down to its link location, the target address in
> + * the .branch_lt section need to be offset with the run time address. The
> + * offset then needs to be removed before the kernel is running at the correct
> + * address.  When relocate_plt is called the current runtime address is added
> + * to all of the target address in .branch_lt and that address is stored in
> + * p_branch_lt_off.  When unrelocate_plt is called if there is an offset saved
> + * in p_branch_lt_off it is subtracted from the addresses in .branch_lt to
> + * return them to their original targets.
> + */
> +#ifndef CONFIG_RELOCATABLE
> +#define RELOCATE_MODE 0
> +#define UNRELOCATE_MODE 1
> +unrelocate_plt:
> +	li	r16,UNRELOCATE_MODE
> +	b	+8
> +relocate_plt:
> +	li	r16,RELOCATE_MODE
> +	mflr	r0
> +	bcl	20,31,$+4
> +0:	mflr	r11
> +
> +	ld	r12,(p_branch_lt_start - 0b)(r11)
> +	add	r12,r12,r11
> +	ld	r14,(p_branch_lt_end - 0b)(r11)
> +	add	r14,r14,r11
> +	ld	r15,(p_branch_lt_off - 0b)(r11)
> +
> +	/* Adding runtime address or subtracting p_branch_lt_off? */
> +	cmpdi	r16,UNRELOCATE_MODE
> +	bne	5f
> +	cmpdi	r15,0
> +	beq	4f
> +	mr	r10,r15
> +	neg	r10,r10
> +	b	2f
> +5:	mr	r10,r26
> +
> +	/* Iterate over all targets in .branch_lt */
> +2:	cmpd	r12,r14
> +	bge	6f
> +	ld	r13,0(r12)
> +	add	r13,r13, r10
> +	std	r13,0(r12)
> +	addi	r12,r12, 8
> +	b	2b
> +
> +6:	cmpdi	r16,RELOCATE_MODE
> +	bne	4f
> +	std	r26,(p_branch_lt_off - 0b)(r11)
> +
> +4:	mtlr	r0
> +	blr
> +
> +.balign 8
> +p_branch_lt_start:	.8byte	__branch_lt_start - 0b
> +p_branch_lt_end:	.8byte	__branch_lt_end - 0b
> +p_branch_lt_off:	.8byte	0
> +#endif
> +
>   /*
>    * This is where the main kernel code starts.
>    */
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index 72fa3c00229a..99085558ad3a 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -317,7 +317,9 @@ SECTIONS
>   #endif
>   		*(.data.rel*)
>   		*(.toc1)
> +		__branch_lt_start = .;
>   		*(.branch_lt)
> +		__branch_lt_end = .;
>   	}
>   
>   	.opd : AT(ADDR(.opd) - LOAD_OFFSET) {
> 
