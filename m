Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48811366394
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 04:17:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ42s2FyQz309l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 12:17:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ihuq2MUG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ihuq2MUG; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ42Q3xlfz2xZ2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 12:17:33 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id t22so20436218ply.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 19:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=veWM3qfIF28DG0z/KCwTl+qo2ZruyCs+OYHjhdlvyR8=;
 b=ihuq2MUGHkP3Jd+qwFCp2p7u3s77LqX/JdxCFLvpjH7jgeFaFJ3Z+Usy+4BSrcodKS
 b3ciFXtSh0VhuWblGDzby4mp9l1U+fWGp89FNRLuSoGjKfgtzdd6BYm/qUI0wZVELf4I
 3MTB3TPGPDuvH6mVwWuWKHmtuYRKrFClMWrX4EeCC/y7Okt8nM7fi9jHyoGuFe7+tJF/
 tHMP2hDJsvztZGxiYNCYXP8CKeZJLmhq4OohRFNQx1qxux66wemDd8zYKuUu27qF/pIL
 ut8ZmqszHWfNguzZenSR97OpgstjBabDWYeu4r5jODqKlHVrURvN12FPSIsjgUmZ2Exu
 AWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=veWM3qfIF28DG0z/KCwTl+qo2ZruyCs+OYHjhdlvyR8=;
 b=Vr6v1WYdf2/xlFE+xNu/ywKguxH7z64NxeY+5vk9qhIpCQCrLUMi2xynMGfqaSnPEb
 4HknUZK4+OfMUX2gTnFwQlIm6NgfotKzrW/9ojeMMHkqnwji8okLkHmffd1Rg4/yLIvV
 Jf/UhGelUXbsh2QMg4ZcN7B2sRH5FcGDSTdDRJfNoppAQK/YsTPKkg1+ZregqrbnLFCo
 0AXVFqMbaEBfvb31RwJvDn6SuPcKJDFgngKN9A8yXBm8jqLGgYMRMkoeRVctEnRIp6h9
 JP09nGblCwiIBfe/bWjYRXurr1cSIloyadl2g+LoeJpE8nk5WvsvmV81L/V7C6V4lyLS
 dn/g==
X-Gm-Message-State: AOAM530eVBtwX5bJ+t2Pwt+nBqLBC5e6CLyag00iKW7IGIbdE5Hpe4Xq
 A4BdQIdyPnB5W9TAS35qvEaGocbj8gM=
X-Google-Smtp-Source: ABdhPJwKnQDuvrnNmvp/bvh0hGk8WNvxz5MB2hReYN3j9eDn8PzWaMGgSuYPEZnRPxp3thM9eecN8A==
X-Received: by 2002:a17:903:10a:b029:eb:1fd1:ca0 with SMTP id
 y10-20020a170903010ab02900eb1fd10ca0mr31490159plc.71.1618971449571; 
 Tue, 20 Apr 2021 19:17:29 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id w17sm258650pfq.187.2021.04.20.19.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 19:17:29 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Add load address to plt branch targets before
 moved to linked location for non-relocatable kernels
Date: Wed, 21 Apr 2021 12:17:21 +1000
Message-Id: <20210421021721.1539289-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Large branches will go through the plt which includes a stub that loads
a target address from the .branch_lt section. On a relocatable kernel the
targets in .branch_lt have relocations so they will be fixed up for
where the kernel is running by relocate().

For a non-relocatable kernel obviously there are no relocations.
However, until the kernel is moved down to its linked address it is
expected to be able to run where ever it is loaded. For pseries machines
prom_init() is called before running at the linked address.

Certain configs result in a large kernel such as STRICT_KERNEL_RWX
(because of the larger data shift):

config DATA_SHIFT
	int "Data shift" if DATA_SHIFT_BOOL
	default 24 if STRICT_KERNEL_RWX && PPC64

These large kernels lead to prom_init()'s final call to __start()
generating a plt branch:

bl      c000000002000018 <00000078.plt_branch.__start>

This results in the kernel jumping to the linked address of __start,
0xc000000000000000, when really it needs to jump to the
0xc000000000000000 + the runtime address because the kernel is still
running at the load address.

The first 256 bytes are already copied to address 0 so the kernel will
run until

b	__start_initialization_multiplatform

because there is nothing yet at __start_initialization_multiplatform
this will inevitably crash. At this point the exception handlers are
still OF's.

On phyp this will look like:

OF stdout device is: /vdevice/vty@30000000
Preparing to boot Linux version 5.12.0-rc3-63029-gada7d7e600c0 (gcc (GCC) 8.4.1 20200928 (Red Hat 8.4.1-1), GNU ld version 2.30-93.el8) #1 SMP Wed Apr 7 07:24:20 EDT 2021
Detected machine type: 0000000000000101
command line: BOOT_IMAGE=/vmlinuz-5.12.0-rc3-63029-gada7d7e600c0
Max number of cores passed to firmware: 256 (NR_CPUS = 2048)
Calling ibm,client-architecture-support... done
memory layout at init:
  memory_limit : 0000000000000000 (16 MB aligned)
  alloc_bottom : 000000000edc0000
  alloc_top    : 0000000020000000
  alloc_top_hi : 0000000020000000
  rmo_top      : 0000000020000000
  ram_top      : 0000000020000000
instantiating rtas at 0x000000001ec30000... done
prom_hold_cpus: skipped
copying OF device tree...
Building dt strings...
Building dt structure...
Device tree strings 0x000000000edd0000 -> 0x000000000edd1809
Device tree struct  0x000000000ede0000 -> 0x000000000edf0000
Quiescing Open Firmware ...
Booting Linux via __start() @ 0x000000000a710000 ...
DEFAULT CATCH!, exception-handler=fffffffffffffff6
at   %SRR0: 0000000000000f20   %SRR1: 8000000000081000
Open Firmware exception handler entered from non-OF code
Client's Fix Pt Regs:
 00 000000000c713134 0000000008a9fc00 000000000caf9c00 000000000edc0000
 04 000000000a710000 0000000000000000 0000000000000000 0000000000000000
 08 0000000000000000 0000000000000000 000000000a7200fc 0000000000003003
 0c c000000000000000 0000000000000000 0000000000000000 000000000b5a9820
 10 000000000b5a9b38 000000000b5a9988 000000000b5a9f38 000000000b660c10
 14 000000000b5a9f60 00000000013d0000 000000001ec30000 000000001ec30000
 18 000000000b5a9840 000000000a710000 0000000000000028 000000000edc0008
 1c 000000000edc0000 000000000cb60000 0000000000000000 000000000edc0000
Special Regs:
    %IV: 00000700     %CR: 44000202    %XER: 00000000  %DSISR: 00000000
  %SRR0: 0000000000000f20   %SRR1: 8000000000081000
    %LR: 000000000c71326c    %CTR: c000000000000000
   %DAR: 0000000000000000
Virtual PID = 0
DEFAULT CATCH!, throw-code=fffffffffffffff6
Call History
------------
throw  - c3f05c
$call-method  - c4f0b4
(poplocals)  - c40a00
key-fillq  - c4f4cc
?xoff  - c4f5b4
(poplocals)  - c40a00
(stdout-write)  - c4fa64
(emit)  - c4fb3c
space  - c4dfc8
quit  - c5336c
quit  - c53100
My Fix Pt Regs:
 00 800000000000b002 0000000000000000 00000000deadbeef 0000000000c4f0b0
 04 0000000008bfff80 00000000deadbeef 0000000000000004 0000000000c09010
 08 0000000000000005 0000000000000000 0000000000000000 0000000000000000
 0c 80000000072a40a8 0000000000000000 0000000000000000 0000000008d2cf30
 10 0000000000e7d968 0000000000e7d968 0000000000c4f0a8 0000000000c4f0b4
 14 fffffffffffffff6 0000000008bfff80 c8ff21fbd0ff41fb f8ffe1fbb1fd21f8
 18 0000000000c19000 0000000000c3e000 0000000000c1af80 0000000000c1cfc0
 1c 0000000000c26000 0000000000c460f0 0000000000c17fa8 0000000000c16fe0
Special Regs:
    %IV: 00000900     %CR: 84800208    %XER: 00040010  %DSISR: 00000000
  %SRR0: 0000000000c3eec8   %SRR1: 800000000000b002
    %LR: 0000000000c3f05c    %CTR: 0000000000c4f0b0
   %DAR: 0000000000000000
...

On qemu it will just appear to be stuck after
Booting Linux via __start() @ 0x0000000000400000 ...:

SLOF **********************************************************************
QEMU Starting
 Build Date = Apr  9 2021 14:13:31
 FW Version = git-33a7322de13e9dca
 Press "s" to enter Open Firmware.

Populating /vdevice methods
Populating /vdevice/vty@71000000
Populating /vdevice/nvram@71000001
Populating /vdevice/l-lan@71000002
Populating /vdevice/v-scsi@71000003
       SCSI: Looking for devices
          8200000000000000 CD-ROM   : "QEMU     QEMU CD-ROM      2.5+"
Populating /pci@800000020000000
Scanning USB
Using default console: /vdevice/vty@71000000
Detected RAM kernel at 400000 (25baa08 bytes)

  Welcome to Open Firmware

  Copyright (c) 2004, 2017 IBM Corporation All rights reserved.
  This program and the accompanying materials are made available
  under the terms of the BSD License available at
  http://www.opensource.org/licenses/bsd-license.php

Booting from memory...
OF stdout device is: /vdevice/vty@71000000
Preparing to boot Linux version 5.12.0-rc3-00128-g87a8d2180282 (powerpc64le-linux-gnu-gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #85 SMP Sun Apr 18 19:30:55 AEST 2021
Detected machine type: 0000000000000101
command line: nokaslr
Max number of cores passed to firmware: 2048 (NR_CPUS = 2048)
Calling ibm,client-architecture-support... done
memory layout at init:
  memory_limit : 0000000000000000 (16 MB aligned)
  alloc_bottom : 0000000003df0000
  alloc_top    : 0000000030000000
  alloc_top_hi : 0000000080000000
  rmo_top      : 0000000030000000
  ram_top      : 0000000080000000
instantiating rtas at 0x000000002fff0000... done
prom_hold_cpus: skipped
copying OF device tree...
Building dt strings...
Building dt structure...
Device tree strings 0x0000000003e00000 -> 0x0000000003e00ab2
Device tree struct  0x0000000003e10000 -> 0x0000000003e20000
Quiescing Open Firmware ...
Booting Linux via __start() @ 0x0000000000400000 ...

To fix this do some "relocation" of the plt target addresses on
non-relocatable before running at the linked address. Before calling
prom_init() add the runtime address to all the targets in .branch_lt
with relocate_plt(). Have relocate_plt() save the offset added in
p_branch_lt_off.  After prom_init() calls __start() remove the offset
saved in p_branch_lt_off to return the targets to their original
addresses.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/sections.h |  2 +
 arch/powerpc/kernel/head_64.S       | 66 +++++++++++++++++++++++++++++
 arch/powerpc/kernel/vmlinux.lds.S   |  2 +
 3 files changed, 70 insertions(+)

diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 324d7b298ec3..f087f5cd5a50 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -30,6 +30,8 @@ extern char __end_interrupts[];
 
 extern char __prom_init_toc_start[];
 extern char __prom_init_toc_end[];
+extern char __branch_lt_start[];
+extern char __branch_lt_end[];
 
 #ifdef CONFIG_PPC_POWERNV
 extern char start_real_trampolines[];
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index ece7f97bafff..28a6c2abd3ab 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -560,8 +560,11 @@ __boot_from_prom:
 	/* Relocate code for where we are now */
 	mr	r3,r26
 	bl	relocate
+#else
+	bl	relocate_plt
 #endif
 
+
 	/* Restore parameters */
 	mr	r3,r31
 	mr	r4,r30
@@ -600,6 +603,8 @@ __after_prom_start:
 	/* IVPR needs to be set after relocation. */
 	bl	init_core_book3e
 #endif
+#else
+	bl	unrelocate_plt
 #endif
 
 /*
@@ -901,6 +906,67 @@ _GLOBAL(relative_toc)
 .balign 8
 p_toc:	.8byte	__toc_start + 0x8000 - 0b
 
+/*
+ * A large non relocatable kernel may generate branches that go though the plt,
+ * before the kernel is copied down to its link location, the target address in
+ * the .branch_lt section need to be offset with the run time address. The
+ * offset then needs to be removed before the kernel is running at the correct
+ * address.  When relocate_plt is called the current runtime address is added
+ * to all of the target address in .branch_lt and that address is stored in
+ * p_branch_lt_off.  When unrelocate_plt is called if there is an offset saved
+ * in p_branch_lt_off it is subtracted from the addresses in .branch_lt to
+ * return them to their original targets.
+ */
+#ifndef CONFIG_RELOCATABLE
+#define RELOCATE_MODE 0
+#define UNRELOCATE_MODE 1
+unrelocate_plt:
+	li	r16,UNRELOCATE_MODE
+	b	+8
+relocate_plt:
+	li	r16,RELOCATE_MODE
+	mflr	r0
+	bcl	20,31,$+4
+0:	mflr	r11
+
+	ld	r12,(p_branch_lt_start - 0b)(r11)
+	add	r12,r12,r11
+	ld	r14,(p_branch_lt_end - 0b)(r11)
+	add	r14,r14,r11
+	ld	r15,(p_branch_lt_off - 0b)(r11)
+
+	/* Adding runtime address or subtracting p_branch_lt_off? */
+	cmpdi	r16,UNRELOCATE_MODE
+	bne	5f
+	cmpdi	r15,0
+	beq	4f
+	mr	r10,r15
+	neg	r10,r10
+	b	2f
+5:	mr	r10,r26
+
+	/* Iterate over all targets in .branch_lt */
+2:	cmpd	r12,r14
+	bge	6f
+	ld	r13,0(r12)
+	add	r13,r13, r10
+	std	r13,0(r12)
+	addi	r12,r12, 8
+	b	2b
+
+6:	cmpdi	r16,RELOCATE_MODE
+	bne	4f
+	std	r26,(p_branch_lt_off - 0b)(r11)
+
+4:	mtlr	r0
+	blr
+
+.balign 8
+p_branch_lt_start:	.8byte	__branch_lt_start - 0b
+p_branch_lt_end:	.8byte	__branch_lt_end - 0b
+p_branch_lt_off:	.8byte	0
+#endif
+
 /*
  * This is where the main kernel code starts.
  */
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 72fa3c00229a..99085558ad3a 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -317,7 +317,9 @@ SECTIONS
 #endif
 		*(.data.rel*)
 		*(.toc1)
+		__branch_lt_start = .;
 		*(.branch_lt)
+		__branch_lt_end = .;
 	}
 
 	.opd : AT(ADDR(.opd) - LOAD_OFFSET) {
-- 
2.25.1

