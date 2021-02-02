Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 656C630D123
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 02:57:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVlDm38XKzDwlm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:57:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVQ2M189tzDr3M
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 00:02:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ALVUX0uE; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4DVQ2L5w4mz9vFH; Wed,  3 Feb 2021 00:02:18 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DVQ2L1pcpz9vFN; Wed,  3 Feb 2021 00:02:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612270938;
 bh=q6j1T7UBlxMFxFvBHBNOIUdKrRARMFELN0qj7bjlung=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ALVUX0uEcex3wJYSDhH1+0Lw5Z8887muaTHs1zF9zkzFHm9wxa5QWwT73O39VgJUb
 NZ1gKZE4MZd1uXM3g+9b9Q5fYl/fBwg57MRnto7Alel0en+sSTpSXNUmjqULQgqBdb
 ESmn+re6XuF4Qj7af/9EApkfIc2ZxFefbQiSa67BhfbPQdMpdsqFhLGpBP6WNMJ68E
 EjBXEZCbl2+AceXkc/KHs5Q2IsJKyweeTxkvjrYHKcjC9EGAXLYHZU3mEeDyl8s8Dc
 cd+dpQI/AktGMul0t2Kv1qboMKv6P8oN71XQ76NsO0jzLJf3riPIoejv9oSOFYmWTV
 hOhx5L6dlVHUA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 2/2] powerpc/64s: Handle program checks in wrong endian during
 early boot
Date: Wed,  3 Feb 2021 00:02:07 +1100
Message-Id: <20210202130207.1303975-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210202130207.1303975-1-mpe@ellerman.id.au>
References: <20210202130207.1303975-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's a short window during boot where although the kernel is
running little endian, any exceptions will cause the CPU to switch
back to big endian. This situation persists until we call
configure_exceptions(), which calls either the hypervisor or OPAL to
configure the CPU so that exceptions will be taken in little
endian (via HID0[HILE]).

We don't intend to take exceptions during early boot, but one way we
sometimes do is via a WARN/BUG etc. Those all boil down to a trap
instruction, which will cause a program check exception.

The first instruction of the program check handler is an mtsprg, which
when executed in the wrong endian is an lhzu with a ~3GB displacement
from r3. The content of r3 is random, so that becomes a load from some
random location, and depending on the system (installed RAM etc.) can
easily lead to a checkstop, or an infinitely recursive page fault.
That prevents whatever the WARN/BUG was complaining about being
printed to the console, and the user just sees a dead system.

We can fix it by having a trampoline at the beginning of the program
check handler that detects we are in the wrong endian, and flips us
back to the correct endian.

We can't flip MSR[LE] using mtmsr (alas), so we have to use rfid. That
requires backing up SRR0/1 as well as a GPR. To do that we use
SPRG0/2/3 (SPRG1 is already used for the paca). SPRG3 is user
readable, but this trampoline is only active very early in boot, and
SPRG3 will be reinitialised in vdso_getcpu_init() before userspace
starts.

With this trampoline in place we can survive a WARN early in boot and
print a stack trace, which is eventually printed to the console once
the console is up, eg:

  [83565.758545] kexec_core: Starting new kernel
  [    0.000000] ------------[ cut here ]------------
  [    0.000000] static_key_enable_cpuslocked(): static key '0xc000000000ea6160' used before call to jump_label_init()
  [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/jump_label.c:166 static_key_enable_cpuslocked+0xfc/0x120
  [    0.000000] Modules linked in:
  [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.10.0-gcc-8.2.0-dirty #618
  [    0.000000] NIP:  c0000000002fd46c LR: c0000000002fd468 CTR: c000000000170660
  [    0.000000] REGS: c000000001227940 TRAP: 0700   Not tainted  (5.10.0-gcc-8.2.0-dirty)
  [    0.000000] MSR:  9000000002823003 <SF,HV,VEC,VSX,FP,ME,RI,LE>  CR: 24882422  XER: 20040000
  [    0.000000] CFAR: 0000000000000730 IRQMASK: 1
  [    0.000000] GPR00: c0000000002fd468 c000000001227bd0 c000000001228300 0000000000000065
  [    0.000000] GPR04: 0000000000000001 0000000000000065 c0000000010cf970 000000000000000d
  [    0.000000] GPR08: 0000000000000000 0000000000000000 0000000000000000 c00000000122763f
  [    0.000000] GPR12: 0000000000002000 c000000000f8a980 0000000000000000 0000000000000000
  [    0.000000] GPR16: 0000000000000000 0000000000000000 c000000000f88c8e c000000000f88c9a
  [    0.000000] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  [    0.000000] GPR24: 0000000000000000 c000000000dea3a8 0000000000000000 c000000000f35114
  [    0.000000] GPR28: 0000002800000000 c000000000f88c9a c000000000f88c8e c000000000ea6160
  [    0.000000] NIP [c0000000002fd46c] static_key_enable_cpuslocked+0xfc/0x120
  [    0.000000] LR [c0000000002fd468] static_key_enable_cpuslocked+0xf8/0x120
  [    0.000000] Call Trace:
  [    0.000000] [c000000001227bd0] [c0000000002fd468] static_key_enable_cpuslocked+0xf8/0x120 (unreliable)
  [    0.000000] [c000000001227c40] [c0000000002fd4c0] static_key_enable+0x30/0x50
  [    0.000000] [c000000001227c70] [c000000000f6629c] early_page_poison_param+0x58/0x9c
  [    0.000000] [c000000001227cb0] [c000000000f351b8] do_early_param+0xa4/0x10c
  [    0.000000] [c000000001227d30] [c00000000011e020] parse_args+0x270/0x5e0
  [    0.000000] [c000000001227e20] [c000000000f35864] parse_early_options+0x48/0x5c
  [    0.000000] [c000000001227e40] [c000000000f358d0] parse_early_param+0x58/0x84
  [    0.000000] [c000000001227e70] [c000000000f3a368] early_init_devtree+0xc4/0x490
  [    0.000000] [c000000001227f10] [c000000000f3bca0] early_setup+0xc8/0x1c8
  [    0.000000] [c000000001227f90] [000000000000c320] 0xc320
  [    0.000000] Instruction dump:
  [    0.000000] 4bfffddd 7c2004ac 39200001 913f0000 4bffffb8 7c651b78 3c82ffac 3c62ffc0
  [    0.000000] 38841b00 3863f310 4bdf03a5 60000000 <0fe00000> 4bffff38 60000000 60000000
  [    0.000000] random: get_random_bytes called from print_oops_end_marker+0x40/0x80 with crng_init=0
  [    0.000000] ---[ end trace 0000000000000000 ]---
  [    0.000000] dt-cpu-ftrs: setup for ISA 3000

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/exceptions-64s.S | 45 ++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b3793f982b2b..c51c436d5845 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1630,6 +1630,51 @@ INT_DEFINE_BEGIN(program_check)
 INT_DEFINE_END(program_check)
 
 EXC_REAL_BEGIN(program_check, 0x700, 0x100)
+
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
+	/*
+	 * There's a short window during boot where although the kernel is
+	 * running little endian, any exceptions will cause the CPU to switch
+	 * back to big endian. For example a WARN() boils down to a trap
+	 * instruction, which will cause a program check, and we end up here but
+	 * with the CPU in big endian mode. The first instruction of the program
+	 * check handler (in GEN_INT_ENTRY below) is an mtsprg, which when
+	 * executed in the wrong endian is an lhzu with a ~3GB displacement from
+	 * r3. The content of r3 is random, so that is a load from some random
+	 * location, and depending on the system can easily lead to a checkstop,
+	 * or an infinitely recursive page fault.
+	 *
+	 * So to handle that case we have a trampoline here that can detect we
+	 * are in the wrong endian and flip us back to the correct endian. We
+	 * can't flip MSR[LE] using mtmsr, so we have to use rfid. That requires
+	 * backing up SRR0/1 as well as a GPR. To do that we use SPRG0/2/3, as
+	 * SPRG1 is already used for the paca. SPRG3 is user readable, but this
+	 * trampoline is only active very early in boot, and SPRG3 will be
+	 * reinitialised in vdso_getcpu_init() before userspace starts.
+	 */
+BEGIN_FTR_SECTION
+	tdi   0,0,0x48    // Trap never, or in reverse endian: b . + 8
+	b     1f          // Skip trampoline if endian is correct
+	.long 0xa643707d  // mtsprg  0, r11      Backup r11
+	.long 0xa6027a7d  // mfsrr0  r11
+	.long 0xa643727d  // mtsprg  2, r11      Backup SRR0 in SPRG2
+	.long 0xa6027b7d  // mfsrr1  r11
+	.long 0xa643737d  // mtsprg  3, r11      Backup SRR1 in SPRG3
+	.long 0xa600607d  // mfmsr   r11
+	.long 0x01006b69  // xori    r11, r11, 1 Invert MSR[LE]
+	.long 0xa6037b7d  // mtsrr1  r11
+	.long 0x34076039  // li      r11, 0x734
+	.long 0xa6037a7d  // mtsrr0  r11
+	.long 0x2400004c  // rfid
+	mfsprg r11, 3
+	mtsrr1 r11        // Restore SRR1
+	mfsprg r11, 2
+	mtsrr0 r11        // Restore SRR0
+	mfsprg r11, 0     // Restore r11
+1:
+END_FTR_SECTION(0, 1)     // nop out after boot
+#endif /* CONFIG_CPU_LITTLE_ENDIAN */
+
 	GEN_INT_ENTRY program_check, virt=0
 EXC_REAL_END(program_check, 0x700, 0x100)
 EXC_VIRT_BEGIN(program_check, 0x4700, 0x100)
-- 
2.25.1

