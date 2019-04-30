Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D96F47D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 12:50:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tdbk5d40zDqDl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 20:50:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tdNL678fzDqKW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 20:40:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="qyycKs9S"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44tdNL36Vyz8vSF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 20:40:50 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44tdNL2H0tz9sCF; Tue, 30 Apr 2019 20:40:50 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="qyycKs9S"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44tdNK503Wz9s4V
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Apr 2019 20:40:49 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 165CE2075E;
 Tue, 30 Apr 2019 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556620847;
 bh=05dbtnNrDFE3881i6fS6fnnWaDRKtqLpXV7+vUj1aOk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=qyycKs9Sc7yTeiA/zVy+c6BshrEuPkCQyvefjPzHZsI2UM2qkunwOxtHHJZxhqPGN
 vuMZXHPq1URimyIn27AL4kWyI4KVRafJk18tHh1+sw7+EYTHOKMNS/c+dg/HVMZhqT
 GNNSPh8G23N92JGQFLop0e6bmhDeBaFtak4VKd44=
Subject: Patch "powerpc/fsl: Sanitize the syscall table for NXP PowerPC 32 bit
 platforms" has been added to the 4.4-stable tree
To: diana.craciun@nxp.com, gregkh@linuxfoundation.org, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
From: <gregkh@linuxfoundation.org>
Date: Tue, 30 Apr 2019 12:40:30 +0200
In-Reply-To: <1556552948-24957-6-git-send-email-diana.craciun@nxp.com>
Message-ID: <155662083031129@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    powerpc/fsl: Sanitize the syscall table for NXP PowerPC 32 bit platforms

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-fsl-sanitize-the-syscall-table-for-nxp-powerpc-32-bit-platforms.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Tue 30 Apr 2019 12:38:50 PM CEST
From: Diana Craciun <diana.craciun@nxp.com>
Date: Mon, 29 Apr 2019 18:49:05 +0300
Subject: powerpc/fsl: Sanitize the syscall table for NXP PowerPC 32 bit platforms
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, Diana Craciun <diana.craciun@nxp.com>
Message-ID: <1556552948-24957-6-git-send-email-diana.craciun@nxp.com>

From: Diana Craciun <diana.craciun@nxp.com>

commit c28218d4abbf4f2035495334d8bfcba64bda4787 upstream.

Used barrier_nospec to sanitize the syscall table.

Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/kernel/entry_32.S |   10 ++++++++++
 1 file changed, 10 insertions(+)

--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -33,6 +33,7 @@
 #include <asm/unistd.h>
 #include <asm/ftrace.h>
 #include <asm/ptrace.h>
+#include <asm/barrier.h>
 
 /*
  * MSR_KERNEL is > 0x10000 on 4xx/Book-E since it include MSR_CE.
@@ -340,6 +341,15 @@ syscall_dotrace_cont:
 	ori	r10,r10,sys_call_table@l
 	slwi	r0,r0,2
 	bge-	66f
+
+	barrier_nospec_asm
+	/*
+	 * Prevent the load of the handler below (based on the user-passed
+	 * system call number) being speculatively executed until the test
+	 * against NR_syscalls and branch to .66f above has
+	 * committed.
+	 */
+
 	lwzx	r10,r10,r0	/* Fetch system call handler [ptr] */
 	mtlr	r10
 	addi	r9,r1,STACK_FRAME_OVERHEAD


Patches currently in stable-queue which might be from diana.craciun@nxp.com are

queue-4.4/powerpc-64s-add-support-for-a-store-forwarding-barrier-at-kernel-entry-exit.patch
queue-4.4/powerpc-fsl-emulate-sprn_bucsr-register.patch
queue-4.4/powerpc-64-make-stf-barrier-ppc_book3s_64-specific.patch
queue-4.4/powerpc-pseries-set-or-clear-security-feature-flags.patch
queue-4.4/powerpc-fsl-fix-spectre_v2-mitigations-reporting.patch
queue-4.4/powerpc-64s-patch-barrier_nospec-in-modules.patch
queue-4.4/powerpc-pseries-support-firmware-disable-of-rfi-flush.patch
queue-4.4/powerpc-rfi-flush-call-setup_rfi_flush-after-lpm-migration.patch
queue-4.4/powerpc-pseries-query-hypervisor-for-count-cache-flush-settings.patch
queue-4.4/powerpc-powernv-set-or-clear-security-feature-flags.patch
queue-4.4/powerpc-64s-add-support-for-software-count-cache-flush.patch
queue-4.4/powerpc64s-show-ori31-availability-in-spectre_v1-sysfs-file-not-v2.patch
queue-4.4/powerpc-fsl-flush-the-branch-predictor-at-each-kernel-entry-64bit.patch
queue-4.4/powerpc-fsl-update-spectre-v2-reporting.patch
queue-4.4/powerpc-64s-wire-up-cpu_show_spectre_v2.patch
queue-4.4/powerpc-64-make-meltdown-reporting-book3s-64-specific.patch
queue-4.4/powerpc-rfi-flush-make-it-possible-to-call-setup_rfi_flush-again.patch
queue-4.4/powerpc-64s-add-support-for-ori-barrier_nospec-patching.patch
queue-4.4/powerpc-use-barrier_nospec-in-copy_from_user.patch
queue-4.4/powerpc-64s-fix-section-mismatch-warnings-from-setup_rfi_flush.patch
queue-4.4/powerpc-fsl-sanitize-the-syscall-table-for-nxp-powerpc-32-bit-platforms.patch
queue-4.4/powerpc-avoid-code-patching-freed-init-sections.patch
queue-4.4/powerpc-fsl-add-macro-to-flush-the-branch-predictor.patch
queue-4.4/powerpc-xmon-add-rfi-flush-related-fields-to-paca-dump.patch
queue-4.4/powerpc-fsl-add-barrier_nospec-implementation-for-nxp-powerpc-book3e.patch
queue-4.4/powerpc-security-fix-spectre_v2-reporting.patch
queue-4.4/powerpc-add-security-feature-flags-for-spectre-meltdown.patch
queue-4.4/powerpc-powernv-use-the-security-flags-in-pnv_setup_rfi_flush.patch
queue-4.4/powerpc-64-disable-the-speculation-barrier-from-the-command-line.patch
queue-4.4/powerpc-fsl-fix-the-flush-of-branch-predictor.patch
queue-4.4/powerpc-pseries-use-the-security-flags-in-pseries_setup_rfi_flush.patch
queue-4.4/powerpc-64-add-config_ppc_barrier_nospec.patch
queue-4.4/powerpc-64s-move-cpu_show_meltdown.patch
queue-4.4/powerpc-fsl-enable-runtime-patching-if-nospectre_v2-boot-arg-is-used.patch
queue-4.4/powerpc-64-use-barrier_nospec-in-syscall-entry.patch
queue-4.4/powerpc-fsl-fixed-warning-orphan-section-__btb_flush_fixup.patch
queue-4.4/powerpc-fsl-add-nospectre_v2-command-line-argument.patch
queue-4.4/powerpc-64s-add-new-security-feature-flags-for-count-cache-flush.patch
queue-4.4/powerpc-fsl-add-infrastructure-to-fixup-branch-predictor-flush.patch
queue-4.4/powerpc-rfi-flush-differentiate-enabled-and-patched-flush-types.patch
queue-4.4/powerpc-64s-enhance-the-information-in-cpu_show_spectre_v1.patch
queue-4.4/powerpc-64-call-setup_barrier_nospec-from-setup_arch.patch
queue-4.4/powerpc-rfi-flush-always-enable-fallback-flush-on-pseries.patch
queue-4.4/powerpc-64s-improve-rfi-l1-d-cache-flush-fallback.patch
queue-4.4/powerpc-asm-add-a-patch_site-macro-helpers-for-patching-instructions.patch
queue-4.4/powerpc-pseries-add-new-h_get_cpu_characteristics-flags.patch
queue-4.4/powerpc-fsl-flush-the-branch-predictor-at-each-kernel-entry-32-bit.patch
queue-4.4/powerpc-64s-enable-barrier_nospec-based-on-firmware-settings.patch
queue-4.4/powerpc-powernv-support-firmware-disable-of-rfi-flush.patch
queue-4.4/powerpc-rfi-flush-move-the-logic-to-avoid-a-redo-into-the-debugfs-code.patch
queue-4.4/powerpc-fsl-flush-branch-predictor-when-entering-kvm.patch
queue-4.4/powerpc-powernv-query-firmware-for-count-cache-flush-settings.patch
queue-4.4/powerpc-64s-wire-up-cpu_show_spectre_v1.patch
queue-4.4/powerpc-64s-add-barrier_nospec.patch
queue-4.4/powerpc-64s-enhance-the-information-in-cpu_show_meltdown.patch
queue-4.4/powerpc-move-default-security-feature-flags.patch
queue-4.4/powerpc-pseries-fix-clearing-of-security-feature-flags.patch
queue-4.4/powerpc-pseries-restore-default-security-feature-flags-on-setup.patch
