Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD21733368
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 16:21:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjLtd5jXrz3bxZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 00:21:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjLsT06Lmz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 00:20:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4QjL8Y0Qqqz9s2k;
	Fri, 16 Jun 2023 15:48:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TIGQhCp_fuDa; Fri, 16 Jun 2023 15:48:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4QjL8W0LTCz9s2J;
	Fri, 16 Jun 2023 15:48:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 04FDD8B780;
	Fri, 16 Jun 2023 15:48:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gcgY-gbjh6On; Fri, 16 Jun 2023 15:48:10 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.18])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C25EC8B77D;
	Fri, 16 Jun 2023 15:48:10 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 35GDm4aw1175658
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 15:48:04 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 35GDm49R1175657;
	Fri, 16 Jun 2023 15:48:04 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>
Subject: [RFC PATCH v1 2/3] powerpc: Mark all .S files invalid for objtool
Date: Fri, 16 Jun 2023 15:47:51 +0200
Message-Id: <17feb760a05edd372984bdf148c760c6f279b401.1686922583.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686922583.git.christophe.leroy@csgroup.eu>
References: <cover.1686922583.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686923268; l=17013; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ETCutUyxK4A9ErBsOwknAbBUu8aGkGK2n2c6mltJ1Nw=; b=TqgK4Zxzk5eF0WaLsLy5BJSolA3kU+kWwPmN7GfZpUkM7mmSwZKr/hbcc22wxd1ntjUtslDBm 4F059XN+jfzBrLo4WjAB/iybmmjeIDziAEYQDE8saE7HL+pXJ0pmaqb
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A lot of work is required in .S files in order to get them ready
for objtool checks.

For the time being, exclude them from the checks.

This is done with the script below:

	#!/bin/sh
	DIRS=`find arch/powerpc -name "*.S" -exec dirname {} \; | sort | uniq`
	for d in $DIRS
	do
		pushd $d
		echo >> Makefile
		for f in *.S
		do
			echo "OBJECT_FILES_NON_STANDARD_$f := y" | sed s/"\.S"/".o"/g
		done >> Makefile
		popd
	done

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/boot/Makefile                 | 17 +++++++++
 arch/powerpc/crypto/Makefile               | 13 +++++++
 arch/powerpc/kernel/Makefile               | 44 ++++++++++++++++++++++
 arch/powerpc/kernel/trace/Makefile         |  4 ++
 arch/powerpc/kernel/vdso/Makefile          | 11 ++++++
 arch/powerpc/kexec/Makefile                |  2 +
 arch/powerpc/kvm/Makefile                  | 13 +++++++
 arch/powerpc/lib/Makefile                  | 25 ++++++++++++
 arch/powerpc/mm/book3s32/Makefile          |  3 ++
 arch/powerpc/mm/nohash/Makefile            |  3 ++
 arch/powerpc/perf/Makefile                 |  2 +
 arch/powerpc/platforms/44x/Makefile        |  2 +
 arch/powerpc/platforms/52xx/Makefile       |  3 ++
 arch/powerpc/platforms/83xx/Makefile       |  2 +
 arch/powerpc/platforms/cell/spufs/Makefile |  3 ++
 arch/powerpc/platforms/pasemi/Makefile     |  2 +
 arch/powerpc/platforms/powermac/Makefile   |  3 ++
 arch/powerpc/platforms/powernv/Makefile    |  3 ++
 arch/powerpc/platforms/ps3/Makefile        |  2 +
 arch/powerpc/platforms/pseries/Makefile    |  2 +
 arch/powerpc/purgatory/Makefile            |  3 ++
 arch/powerpc/sysdev/Makefile               |  3 ++
 arch/powerpc/xmon/Makefile                 |  3 ++
 23 files changed, 168 insertions(+)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 771b79423bbc..c046eb9d341e 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -513,3 +513,20 @@ $(wrapper-installed): $(DESTDIR)$(WRAPPER_BINDIR) $(srctree)/$(obj)/wrapper | $(
 	$(call cmd,install_wrapper)
 
 $(obj)/bootwrapper_install: $(all-installed)
+
+OBJECT_FILES_NON_STANDARD_crt0.o := y
+OBJECT_FILES_NON_STANDARD_crtsavres.o := y
+OBJECT_FILES_NON_STANDARD_div64.o := y
+OBJECT_FILES_NON_STANDARD_fixed-head.o := y
+OBJECT_FILES_NON_STANDARD_gamecube-head.o := y
+OBJECT_FILES_NON_STANDARD_motload-head.o := y
+OBJECT_FILES_NON_STANDARD_opal-calls.o := y
+OBJECT_FILES_NON_STANDARD_ps3-head.o := y
+OBJECT_FILES_NON_STANDARD_ps3-hvcall.o := y
+OBJECT_FILES_NON_STANDARD_pseries-head.o := y
+OBJECT_FILES_NON_STANDARD_string.o := y
+OBJECT_FILES_NON_STANDARD_util.o := y
+OBJECT_FILES_NON_STANDARD_wii-head.o := y
+OBJECT_FILES_NON_STANDARD_zImage.coff.lds.o := y
+OBJECT_FILES_NON_STANDARD_zImage.lds.o := y
+OBJECT_FILES_NON_STANDARD_zImage.ps3.lds.o := y
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index 7b4f516abec1..f0381d137b06 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -34,3 +34,16 @@ $(obj)/aesp10-ppc.S $(obj)/ghashp10-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
 
 OBJECT_FILES_NON_STANDARD_aesp10-ppc.o := y
 OBJECT_FILES_NON_STANDARD_ghashp10-ppc.o := y
+
+OBJECT_FILES_NON_STANDARD_aes-gcm-p10.o := y
+OBJECT_FILES_NON_STANDARD_aes-spe-core.o := y
+OBJECT_FILES_NON_STANDARD_aes-spe-keys.o := y
+OBJECT_FILES_NON_STANDARD_aes-spe-modes.o := y
+OBJECT_FILES_NON_STANDARD_aes-tab-4k.o := y
+OBJECT_FILES_NON_STANDARD_crc32c-vpmsum_asm.o := y
+OBJECT_FILES_NON_STANDARD_crc32-vpmsum_core.o := y
+OBJECT_FILES_NON_STANDARD_crct10dif-vpmsum_asm.o := y
+OBJECT_FILES_NON_STANDARD_md5-asm.o := y
+OBJECT_FILES_NON_STANDARD_sha1-powerpc-asm.o := y
+OBJECT_FILES_NON_STANDARD_sha1-spe-asm.o := y
+OBJECT_FILES_NON_STANDARD_sha256-spe-asm.o := y
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 9bf2be123093..19a2c83645e1 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -229,3 +229,47 @@ $(obj)/vdso64_wrapper.o : $(obj)/vdso/vdso64.so.dbg
 
 # for cleaning
 subdir- += vdso
+
+OBJECT_FILES_NON_STANDARD_85xx_entry_mapping.o := y
+OBJECT_FILES_NON_STANDARD_cpu_setup_44x.o := y
+OBJECT_FILES_NON_STANDARD_cpu_setup_6xx.o := y
+OBJECT_FILES_NON_STANDARD_cpu_setup_e500.o := y
+OBJECT_FILES_NON_STANDARD_cpu_setup_pa6t.o := y
+OBJECT_FILES_NON_STANDARD_cpu_setup_ppc970.o := y
+OBJECT_FILES_NON_STANDARD_entry_32.o := y
+OBJECT_FILES_NON_STANDARD_entry_64.o := y
+OBJECT_FILES_NON_STANDARD_epapr_hcalls.o := y
+OBJECT_FILES_NON_STANDARD_exceptions-64e.o := y
+OBJECT_FILES_NON_STANDARD_exceptions-64s.o := y
+OBJECT_FILES_NON_STANDARD_fpu.o := y
+OBJECT_FILES_NON_STANDARD_head_40x.o := y
+OBJECT_FILES_NON_STANDARD_head_44x.o := y
+OBJECT_FILES_NON_STANDARD_head_64.o := y
+OBJECT_FILES_NON_STANDARD_head_85xx.o := y
+OBJECT_FILES_NON_STANDARD_head_8xx.o := y
+OBJECT_FILES_NON_STANDARD_head_book3s_32.o := y
+OBJECT_FILES_NON_STANDARD_idle_64e.o := y
+OBJECT_FILES_NON_STANDARD_idle_6xx.o := y
+OBJECT_FILES_NON_STANDARD_idle_85xx.o := y
+OBJECT_FILES_NON_STANDARD_idle_book3s.o := y
+OBJECT_FILES_NON_STANDARD_interrupt_64.o := y
+OBJECT_FILES_NON_STANDARD_kvm_emul.o := y
+OBJECT_FILES_NON_STANDARD_l2cr_6xx.o := y
+OBJECT_FILES_NON_STANDARD_misc_32.o := y
+OBJECT_FILES_NON_STANDARD_misc_64.o := y
+OBJECT_FILES_NON_STANDARD_misc.o := y
+OBJECT_FILES_NON_STANDARD_note.o := y
+OBJECT_FILES_NON_STANDARD_optprobes_head.o := y
+OBJECT_FILES_NON_STANDARD_ppc_save_regs.o := y
+OBJECT_FILES_NON_STANDARD_reloc_32.o := y
+OBJECT_FILES_NON_STANDARD_reloc_64.o := y
+OBJECT_FILES_NON_STANDARD_rtas_entry.o := y
+OBJECT_FILES_NON_STANDARD_swsusp_32.o := y
+OBJECT_FILES_NON_STANDARD_swsusp_85xx.o := y
+OBJECT_FILES_NON_STANDARD_swsusp_asm64.o := y
+OBJECT_FILES_NON_STANDARD_tm.o := y
+OBJECT_FILES_NON_STANDARD_ucall.o := y
+OBJECT_FILES_NON_STANDARD_vdso32_wrapper.o := y
+OBJECT_FILES_NON_STANDARD_vdso64_wrapper.o := y
+OBJECT_FILES_NON_STANDARD_vector.o := y
+OBJECT_FILES_NON_STANDARD_vmlinux.lds.o := y
diff --git a/arch/powerpc/kernel/trace/Makefile b/arch/powerpc/kernel/trace/Makefile
index 2296bbbd775a..533c37a406e4 100644
--- a/arch/powerpc/kernel/trace/Makefile
+++ b/arch/powerpc/kernel/trace/Makefile
@@ -25,3 +25,7 @@ GCOV_PROFILE_ftrace.o := n
 KCOV_INSTRUMENT_ftrace.o := n
 KCSAN_SANITIZE_ftrace.o := n
 UBSAN_SANITIZE_ftrace.o := n
+
+OBJECT_FILES_NON_STANDARD_ftrace_64_pg.o := y
+OBJECT_FILES_NON_STANDARD_ftrace_low.o := y
+OBJECT_FILES_NON_STANDARD_ftrace_mprofile.o := y
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 4c3f34485f08..65019ea69aa8 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -114,3 +114,14 @@ quiet_cmd_vdso64as = VDSO64A $@
       cmd_vdso64as = $(VDSOCC) $(a_flags) $(AS64FLAGS) -c -o $@ $<
 
 OBJECT_FILES_NON_STANDARD := y
+
+OBJECT_FILES_NON_STANDARD_cacheflush.o := y
+OBJECT_FILES_NON_STANDARD_datapage.o := y
+OBJECT_FILES_NON_STANDARD_getcpu.o := y
+OBJECT_FILES_NON_STANDARD_gettimeofday.o := y
+OBJECT_FILES_NON_STANDARD_note.o := y
+OBJECT_FILES_NON_STANDARD_sigtramp32.o := y
+OBJECT_FILES_NON_STANDARD_sigtramp64.o := y
+OBJECT_FILES_NON_STANDARD_vdso32.lds.o := y
+OBJECT_FILES_NON_STANDARD_vdso64.lds.o := y
+OBJECT_FILES_NON_STANDARD_vgetrandom-chacha.o := y
diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
index 0c2abe7f9908..193be003b3f0 100644
--- a/arch/powerpc/kexec/Makefile
+++ b/arch/powerpc/kexec/Makefile
@@ -15,3 +15,5 @@ KCOV_INSTRUMENT_core_$(BITS).o := n
 UBSAN_SANITIZE_core_$(BITS).o := n
 KASAN_SANITIZE_core.o := n
 KASAN_SANITIZE_core_$(BITS) := n
+
+OBJECT_FILES_NON_STANDARD_relocate_32.o := y
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 5319d889b184..f70ed57753e0 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -137,3 +137,16 @@ obj-y += $(kvm-book3s_64-builtin-objs-y)
 ifdef CONFIG_PPC_BOOK3S_64
 KASAN_SANITIZE := n
 endif
+
+OBJECT_FILES_NON_STANDARD_book3s_32_sr.o := y
+OBJECT_FILES_NON_STANDARD_book3s_64_entry.o := y
+OBJECT_FILES_NON_STANDARD_book3s_64_slb.o := y
+OBJECT_FILES_NON_STANDARD_book3s_hv_interrupts.o := y
+OBJECT_FILES_NON_STANDARD_book3s_hv_rmhandlers.o := y
+OBJECT_FILES_NON_STANDARD_book3s_interrupts.o := y
+OBJECT_FILES_NON_STANDARD_book3s_rmhandlers.o := y
+OBJECT_FILES_NON_STANDARD_book3s_segment.o := y
+OBJECT_FILES_NON_STANDARD_bookehv_interrupts.o := y
+OBJECT_FILES_NON_STANDARD_booke_interrupts.o := y
+OBJECT_FILES_NON_STANDARD_fpu.o := y
+OBJECT_FILES_NON_STANDARD_tm.o := y
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index c4db459d304a..e6a59ebbf9d5 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -81,3 +81,28 @@ CFLAGS_xor_vmx.o += -maltivec $(call cc-option,-mabi=altivec)
 CFLAGS_xor_vmx.o += -isystem $(shell $(CC) -print-file-name=include)
 
 obj-$(CONFIG_PPC64) += $(obj64-y)
+
+OBJECT_FILES_NON_STANDARD_checksum_32.o := y
+OBJECT_FILES_NON_STANDARD_checksum_64.o := y
+OBJECT_FILES_NON_STANDARD_copy_32.o := y
+OBJECT_FILES_NON_STANDARD_copy_mc_64.o := y
+OBJECT_FILES_NON_STANDARD_copypage_64.o := y
+OBJECT_FILES_NON_STANDARD_copypage_power7.o := y
+OBJECT_FILES_NON_STANDARD_copyuser_64.o := y
+OBJECT_FILES_NON_STANDARD_copyuser_power7.o := y
+OBJECT_FILES_NON_STANDARD_crtsavres.o := y
+OBJECT_FILES_NON_STANDARD_div64.o := y
+OBJECT_FILES_NON_STANDARD_feature-fixups-test.o := y
+OBJECT_FILES_NON_STANDARD_hweight_64.o := y
+OBJECT_FILES_NON_STANDARD_ldstfp.o := y
+OBJECT_FILES_NON_STANDARD_mem_64.o := y
+OBJECT_FILES_NON_STANDARD_memcmp_32.o := y
+OBJECT_FILES_NON_STANDARD_memcmp_64.o := y
+OBJECT_FILES_NON_STANDARD_memcpy_64.o := y
+OBJECT_FILES_NON_STANDARD_memcpy_power7.o := y
+OBJECT_FILES_NON_STANDARD_quad.o := y
+OBJECT_FILES_NON_STANDARD_string_32.o := y
+OBJECT_FILES_NON_STANDARD_string_64.o := y
+OBJECT_FILES_NON_STANDARD_string.o := y
+OBJECT_FILES_NON_STANDARD_strlen_32.o := y
+OBJECT_FILES_NON_STANDARD_test_emulate_step_exec_instr.o := y
diff --git a/arch/powerpc/mm/book3s32/Makefile b/arch/powerpc/mm/book3s32/Makefile
index 50dd8f6bdf46..973e2d4933bb 100644
--- a/arch/powerpc/mm/book3s32/Makefile
+++ b/arch/powerpc/mm/book3s32/Makefile
@@ -10,3 +10,6 @@ obj-y += mmu.o mmu_context.o
 obj-$(CONFIG_PPC_BOOK3S_603) += nohash_low.o
 obj-$(CONFIG_PPC_BOOK3S_604) += hash_low.o tlb.o
 obj-$(CONFIG_PPC_KUAP) += kuap.o
+
+OBJECT_FILES_NON_STANDARD_hash_low.o := y
+OBJECT_FILES_NON_STANDARD_nohash_low.o := y
diff --git a/arch/powerpc/mm/nohash/Makefile b/arch/powerpc/mm/nohash/Makefile
index f3894e79d5f7..d423d2759d9e 100644
--- a/arch/powerpc/mm/nohash/Makefile
+++ b/arch/powerpc/mm/nohash/Makefile
@@ -17,3 +17,6 @@ endif
 # This is necessary for booting with kcov enabled on book3e machines
 KCOV_INSTRUMENT_tlb.o := n
 KCOV_INSTRUMENT_e500.o := n
+
+OBJECT_FILES_NON_STANDARD_tlb_low_64e.o := y
+OBJECT_FILES_NON_STANDARD_tlb_low.o := y
diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
index 4f53d0b97539..a36111dd2acc 100644
--- a/arch/powerpc/perf/Makefile
+++ b/arch/powerpc/perf/Makefile
@@ -20,3 +20,5 @@ obj-$(CONFIG_PPC_8xx) += 8xx-pmu.o
 
 obj-$(CONFIG_PPC64)		+= $(obj64-y)
 obj-$(CONFIG_PPC32)		+= $(obj32-y)
+
+OBJECT_FILES_NON_STANDARD_bhrb.o := y
diff --git a/arch/powerpc/platforms/44x/Makefile b/arch/powerpc/platforms/44x/Makefile
index 5ba031f57652..fb09005c1e7b 100644
--- a/arch/powerpc/platforms/44x/Makefile
+++ b/arch/powerpc/platforms/44x/Makefile
@@ -12,3 +12,5 @@ obj-$(CONFIG_CANYONLANDS)+= canyonlands.o
 obj-$(CONFIG_CURRITUCK)	+= ppc476.o
 obj-$(CONFIG_AKEBONO)	+= ppc476.o
 obj-$(CONFIG_FSP2)	+= fsp2.o
+
+OBJECT_FILES_NON_STANDARD_misc_44x.o := y
diff --git a/arch/powerpc/platforms/52xx/Makefile b/arch/powerpc/platforms/52xx/Makefile
index 1b1f72d83342..6b518342cc27 100644
--- a/arch/powerpc/platforms/52xx/Makefile
+++ b/arch/powerpc/platforms/52xx/Makefile
@@ -14,3 +14,6 @@ obj-$(CONFIG_PM)		+= mpc52xx_sleep.o mpc52xx_pm.o
 ifdef CONFIG_PPC_LITE5200
 	obj-$(CONFIG_PM)	+= lite5200_sleep.o lite5200_pm.o
 endif
+
+OBJECT_FILES_NON_STANDARD_lite5200_sleep.o := y
+OBJECT_FILES_NON_STANDARD_mpc52xx_sleep.o := y
diff --git a/arch/powerpc/platforms/83xx/Makefile b/arch/powerpc/platforms/83xx/Makefile
index 6b4013e01b3b..bca5587e34f4 100644
--- a/arch/powerpc/platforms/83xx/Makefile
+++ b/arch/powerpc/platforms/83xx/Makefile
@@ -13,3 +13,5 @@ obj-$(CONFIG_MPC836x_RDK)	+= mpc836x_rdk.o
 obj-$(CONFIG_MPC837x_RDB)	+= mpc837x_rdb.o
 obj-$(CONFIG_ASP834x)		+= asp834x.o
 obj-$(CONFIG_KMETER1)		+= km83xx.o
+
+OBJECT_FILES_NON_STANDARD_suspend-asm.o := y
diff --git a/arch/powerpc/platforms/cell/spufs/Makefile b/arch/powerpc/platforms/cell/spufs/Makefile
index 52e4c80ec8d0..5d44f4e7a60d 100644
--- a/arch/powerpc/platforms/cell/spufs/Makefile
+++ b/arch/powerpc/platforms/cell/spufs/Makefile
@@ -61,3 +61,6 @@ cmd_hexdump   = ( \
 quiet_cmd_hexdump = HEXDUMP $@
 $(obj)/%_dump.h: $(obj)/%.bin
 	$(call if_changed,hexdump)
+
+OBJECT_FILES_NON_STANDARD_spu_restore_crt0.o := y
+OBJECT_FILES_NON_STANDARD_spu_save_crt0.o := y
diff --git a/arch/powerpc/platforms/pasemi/Makefile b/arch/powerpc/platforms/pasemi/Makefile
index d2ce954a5055..125c77bd7da9 100644
--- a/arch/powerpc/platforms/pasemi/Makefile
+++ b/arch/powerpc/platforms/pasemi/Makefile
@@ -2,3 +2,5 @@
 obj-y	+= setup.o pci.o time.o idle.o powersave.o iommu.o dma_lib.o misc.o
 obj-$(CONFIG_PPC_PASEMI_MDIO)	+= gpio_mdio.o
 obj-$(CONFIG_PCI_MSI)		+= msi.o
+
+OBJECT_FILES_NON_STANDARD_powersave.o := y
diff --git a/arch/powerpc/platforms/powermac/Makefile b/arch/powerpc/platforms/powermac/Makefile
index cf85f0662d0d..963c59656654 100644
--- a/arch/powerpc/platforms/powermac/Makefile
+++ b/arch/powerpc/platforms/powermac/Makefile
@@ -23,3 +23,6 @@ obj-$(CONFIG_PMAC_BACKLIGHT)	+= backlight.o
 obj-$(CONFIG_NVRAM:m=y)		+= nvram.o
 obj-$(CONFIG_PPC32)		+= bootx_init.o
 obj-$(CONFIG_SMP)		+= smp.o
+
+OBJECT_FILES_NON_STANDARD_cache.o := y
+OBJECT_FILES_NON_STANDARD_sleep.o := y
diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index 19f0fc5c6f1b..6b49794ff32a 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -31,3 +31,6 @@ obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-fault.o
 obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
 obj-$(CONFIG_SCOM_DEBUGFS) += opal-xscom.o
 obj-$(CONFIG_PPC_SECURE_BOOT) += opal-secvar.o
+
+OBJECT_FILES_NON_STANDARD_opal-wrappers.o := y
+OBJECT_FILES_NON_STANDARD_subcore-asm.o := y
diff --git a/arch/powerpc/platforms/ps3/Makefile b/arch/powerpc/platforms/ps3/Makefile
index 86bf2967a8d4..fb6054aa0a33 100644
--- a/arch/powerpc/platforms/ps3/Makefile
+++ b/arch/powerpc/platforms/ps3/Makefile
@@ -7,3 +7,5 @@ obj-$(CONFIG_PS3GELIC_UDBG) += gelic_udbg.o
 obj-$(CONFIG_SMP) += smp.o
 obj-$(CONFIG_SPU_BASE) += spu.o
 obj-y += device-init.o
+
+OBJECT_FILES_NON_STANDARD_hvcall.o := y
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 53c3b91af2f7..410b6e763e52 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -37,3 +37,5 @@ obj-$(CONFIG_ARCH_HAS_CC_PLATFORM)	+= cc_platform.o
 # nothing that operates in real mode is safe for KASAN
 KASAN_SANITIZE_ras.o := n
 KASAN_SANITIZE_kexec.o := n
+
+OBJECT_FILES_NON_STANDARD_hvCall.o := y
diff --git a/arch/powerpc/purgatory/Makefile b/arch/powerpc/purgatory/Makefile
index 6f5e2727963c..b39cd1badb2e 100644
--- a/arch/powerpc/purgatory/Makefile
+++ b/arch/powerpc/purgatory/Makefile
@@ -13,3 +13,6 @@ $(obj)/purgatory.ro: $(obj)/trampoline_$(BITS).o FORCE
 $(obj)/kexec-purgatory.o: $(obj)/purgatory.ro
 
 obj-y	+= kexec-purgatory.o
+
+OBJECT_FILES_NON_STANDARD_kexec-purgatory.o := y
+OBJECT_FILES_NON_STANDARD_trampoline_64.o := y
diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
index 9cb1d029511a..178f455a6772 100644
--- a/arch/powerpc/sysdev/Makefile
+++ b/arch/powerpc/sysdev/Makefile
@@ -51,3 +51,6 @@ obj-$(CONFIG_PPC_XICS)		+= xics/
 obj-$(CONFIG_PPC_XIVE)		+= xive/
 
 obj-$(CONFIG_GE_FPGA)		+= ge/
+
+OBJECT_FILES_NON_STANDARD_6xx-suspend.o := y
+OBJECT_FILES_NON_STANDARD_dcr-low.o := y
diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index d334de392e6c..024e1092e4c2 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -24,3 +24,6 @@ ifdef CONFIG_XMON_DISASSEMBLY
 obj-y			+= ppc-dis.o ppc-opc.o
 obj-$(CONFIG_SPU_BASE)	+= spu-dis.o spu-opc.o
 endif
+
+OBJECT_FILES_NON_STANDARD_spr_access.o := y
+OBJECT_FILES_NON_STANDARD_xmon_bpts.o := y
-- 
2.40.1

